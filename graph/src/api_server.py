"""GraphRAG API Server — 提供檢索 + Gemma 4 LLM 串流回答 + 論文元數據。

優化：平行檢索、智慧排序、結果快取、單方法跳過。

啟動前先跑 llama-server（port 8080），然後：
  cd /home/aiiauser/JM/0325new/graph
  .venv/bin/python src/api_server.py

API endpoints:
  GET  /health              — 健康檢查
  GET  /methods             — 可用檢索方法
  POST /query               — 檢索 + LLM 回答（SSE 串流）
  POST /retrieve-only       — 只檢索不呼叫 LLM
  POST /skip                — 跳過當前方法
  POST /abort               — 中止全部
  GET  /papers              — 所有論文元數據
  GET  /papers/{doc_id}/pdf — 提供 PDF 檔案
"""
import _paths
import sys
import json
import re
import time
import threading
import importlib
import requests
import networkx as nx
import chromadb
from concurrent.futures import ThreadPoolExecutor, as_completed
from contextlib import asynccontextmanager
from pathlib import Path
from sentence_transformers import SentenceTransformer
from fastapi import FastAPI, HTTPException
from fastapi.middleware.cors import CORSMiddleware
from fastapi.responses import StreamingResponse, FileResponse
from pydantic import BaseModel

_mod08 = importlib.import_module("08_retrieval_comparison")
method_a_vector_rag = _mod08.method_a_vector_rag
method_b_local_search = _mod08.method_b_local_search
method_c_global_search = _mod08.method_c_global_search
method_d_drift_search = _mod08.method_d_drift_search
build_entity_chunk_map = _mod08.build_entity_chunk_map

DATA_DIR = _paths.DATA_DIR
GML_FILE = DATA_DIR / "graph.gml"
REPORTS_FILE = DATA_DIR / "reports.jsonl"
FIGURES_DIR = DATA_DIR / "figures"
EMBED_MODEL = "Snowflake/snowflake-arctic-embed-l-v2.0"
CHROMA_DIR = str(_paths.CHROMA_DIR)
PDF_DIR = _paths.CORPUS_PDF_DIR

GEMMA_URL = "http://localhost:8080/v1/chat/completions"
MAX_CONTEXT_CHARS = 20000

SYSTEM_PROMPT = (
    "You are a sports nutrition research assistant. "
    "Answer the user's question based ONLY on the provided context.\n\n"
    "Requirements:\n"
    "1. Be EXHAUSTIVE: cover EVERY relevant study, finding, and data point in the context. "
    "Do not skip or summarize away any study — each deserves its own paragraph.\n"
    "2. Use markdown headers (##) to organize by theme.\n"
    "3. For EACH study mentioned, cite: author(s), year, specific doses, durations, "
    "sample sizes, effect sizes, p-values, confidence intervals when available.\n"
    "4. Compare and contrast findings across studies — note agreements, contradictions, "
    "and gaps.\n"
    "5. End with practical takeaways.\n\n"
    "Answer in Traditional Chinese (繁體中文). "
    "Use bullet points and bold text for key findings."
)

EVIDENCE_PROMPT = (
    "The following is an answer that was just given to the user:\n"
    "---\n{prev_answer}\n---\n\n"
    "Based on the SAME context below, provide an EXHAUSTIVE evidence review. "
    "For EVERY study referenced in the context, document:\n"
    "- **Study design**: RCT / meta-analysis / systematic review / observational / case study\n"
    "- **Authors & year**: first author, publication year, journal if available\n"
    "- **Participants**: exact sample size (n=?), age range, sex, training status, "
    "population characteristics\n"
    "- **Protocol**: exact intervention details — substance, dose (mg/kg or absolute), "
    "frequency, duration, control condition, washout period\n"
    "- **Results**: primary outcomes with exact numbers — means±SD, % change, "
    "p-values, effect sizes (Cohen's d, η²), confidence intervals, NNT if applicable\n"
    "- **Limitations**: noted by authors or apparent from design\n\n"
    "Do NOT skip any study in the context. Each study gets its own subsection.\n"
    "Organize by claim or theme. Do NOT repeat conclusions — focus on methodology and raw data.\n"
    "Answer in Traditional Chinese (繁體中文)."
)

METHOD_INFO = {
    "A": {"name": "Traditional Vector RAG", "description": "Chunk 向量搜尋 → LLM"},
    "B": {"name": "Local Search (GraphRAG)", "description": "Entity 搜尋 → 圖遍歷 1-hop → chunk + report → LLM"},
    "C": {"name": "Global Search (GraphRAG)", "description": "社群報告搜尋 → LLM"},
    "D": {"name": "Drift Search (GraphRAG)", "description": "假設答案 → 報告 → 子問題 → 深入 → LLM"},
}

_state = {}
_abort_event = threading.Event()
_skip_event = threading.Event()

EMBED_CACHE_MAX = 500


class _CachedModel:
    """Wraps SentenceTransformer — caches encode() for repeated query strings."""
    def __init__(self, model):
        self._model = model
        self._cache = {}

    def encode(self, text, **kwargs):
        if isinstance(text, str) and text in self._cache:
            return self._cache[text]
        result = self._model.encode(text, **kwargs)
        if isinstance(text, str):
            if len(self._cache) >= EMBED_CACHE_MAX:
                oldest = next(iter(self._cache))
                del self._cache[oldest]
            self._cache[text] = result
        return result

    def __getattr__(self, name):
        return getattr(self._model, name)


def _load_paper_metadata():
    meta_file = DATA_DIR / "paper_metadata.json"
    if meta_file.exists():
        with open(meta_file) as f:
            return json.load(f)
    return {}


def _load_page_index():
    idx_file = DATA_DIR / "page_index.json"
    if idx_file.exists():
        with open(idx_file) as f:
            return json.load(f)
    return {}


_DOI_RE = re.compile(r"10\.\d{4,}/")
_YEAR_RE = re.compile(r"\b(?:19|20)\d{2}\b")


def _is_ref_section(text: str) -> bool:
    doi_count = len(_DOI_RE.findall(text))
    year_count = len(_YEAR_RE.findall(text))
    return doi_count >= 5 or (doi_count >= 3 and year_count >= 8)


def _load_chunk_lookup():
    lookup = {}
    chunks_file = DATA_DIR / "chunks.jsonl"
    with open(chunks_file) as f:
        for line in f:
            c = json.loads(line)
            entry = {
                "doc_id": c["doc_id"],
                "doc_filename": c["doc_filename"],
                "chunk_idx": c["chunk_idx"],
                "char_start": c["char_start"],
                "char_end": c["char_end"],
                "text_preview": c["text"][:2000],
                "is_ref_section": _is_ref_section(c["text"]),
            }
            if "figure_refs" in c:
                entry["figure_refs"] = c["figure_refs"]
            lookup[c["chunk_id"]] = entry
    return lookup


def _char_to_page(doc_id, char_start):
    pages = _state.get("page_index", {}).get(doc_id, [])
    for p in pages:
        if p["char_start"] <= char_start < p["char_end"]:
            return p["page"]
    return 1


def _build_community_doc_index():
    """Build community_id → [(doc_id, mention_count)] mapping."""
    from collections import Counter, defaultdict

    comm_file = DATA_DIR / "communities_leiden.json"
    ent_file = DATA_DIR / "entities.jsonl"
    if not comm_file.exists() or not ent_file.exists():
        return {}

    with open(comm_file) as f:
        communities = json.load(f)
    partition = communities.get("partition", {})

    entity_docs = defaultdict(set)
    with open(ent_file) as f:
        for line in f:
            line = line.strip()
            if not line:
                continue
            ent = json.loads(line)
            entity_docs[ent["name"]].add(ent["doc_id"])

    cid_doc_counts = defaultdict(Counter)
    for entity_name, cid_str in partition.items():
        cid = int(cid_str)
        for doc_id in entity_docs.get(entity_name, []):
            cid_doc_counts[cid][doc_id] += 1

    index = {}
    for cid, counter in cid_doc_counts.items():
        index[cid] = counter.most_common()
    return index


def _make_paper_meta(meta):
    return {
        "pmid": meta.get("pmid", ""),
        "title": meta.get("title", ""),
        "authors": meta.get("authors", []),
        "journal": meta.get("journal", ""),
        "year": meta.get("year", 0),
        "doi": meta.get("doi", ""),
        "impact_factor": meta.get("impact_factor"),
        "sjr_quartile": meta.get("sjr_quartile"),
        "study_type": meta.get("study_type", ""),
    }


def _enrich_sources(raw_sources):
    chunk_lookup = _state.get("chunk_lookup", {})
    paper_meta = _state.get("paper_metadata", {})
    report_lookup = _state.get("report_lookup", {})
    community_doc_index = _state.get("community_doc_index", {})
    figure_index = _state.get("figure_index", {})
    enriched = []
    seen_docs = set()

    doc_candidates = {}
    community_sources = []
    for src in raw_sources:
        if src.startswith("doc_"):
            chunk = chunk_lookup.get(src)
            if not chunk:
                continue
            doc_id = chunk["doc_id"]
            doc_candidates.setdefault(doc_id, []).append((src, chunk))
        elif src.startswith("Community"):
            community_sources.append(src)

    for doc_id, candidates in doc_candidates.items():
        content = [(s, c) for s, c in candidates if not c.get("is_ref_section")]
        usable = content or candidates

        seen_docs.add(doc_id)
        meta = paper_meta.get(doc_id, {})
        best_src, best_chunk = usable[0]
        page = _char_to_page(doc_id, best_chunk["char_start"])
        item = {
            "chunk_id": best_src,
            "doc_id": doc_id,
            "doc_filename": best_chunk["doc_filename"],
            "chunk_idx": best_chunk["chunk_idx"],
            "text_preview": best_chunk["text_preview"],
            "char_start": best_chunk["char_start"],
            "char_end": best_chunk["char_end"],
            "page": page,
            "paper_meta": _make_paper_meta(meta),
        }
        if len(usable) > 1:
            extra = []
            for s, c in usable[1:3]:
                p = _char_to_page(doc_id, c["char_start"])
                if p != page:
                    extra.append({
                        "chunk_id": s, "page": p,
                        "text_preview": c["text_preview"],
                        "char_start": c["char_start"],
                        "char_end": c["char_end"],
                    })
            if extra:
                item["extra_highlights"] = extra

        doc_figs = figure_index.get(doc_id, {})
        fig_refs = []
        for _, c in usable[:3]:
            fig_refs.extend(c.get("figure_refs", []))
        seen_figs = set()
        unique_figs = []
        for fr in fig_refs:
            if fr["fig_key"] not in seen_figs:
                seen_figs.add(fr["fig_key"])
                unique_figs.append(fr)
        if unique_figs:
            item["figures"] = unique_figs[:5]
        elif doc_figs:
            all_figs = sorted(
                [{"fig_key": fk, "caption": fv["caption"], "page": fv["page"]}
                 for fk, fv in doc_figs.items()],
                key=lambda f: abs(f["page"] - page),
            )[:5]
            item["figures"] = all_figs
        enriched.append(item)

    for src in community_sources:
        cid = int(src.replace("Community_", ""))
        report = report_lookup.get(cid)
        if report:
            enriched.append({
                "type": "community_report",
                "community_id": src,
                "title": report.get("title", ""),
                "summary": report.get("summary", ""),
                "key_entities": report.get("key_entities", []),
                "practical_implications": report.get("practical_implications", ""),
            })
        for doc_id, _count in community_doc_index.get(cid, [])[:3]:
            if doc_id in seen_docs:
                continue
            seen_docs.add(doc_id)
            meta = paper_meta.get(doc_id, {})
            enriched.append({
                "type": "community_paper",
                "community_source": src,
                "doc_id": doc_id,
                "paper_meta": _make_paper_meta(meta),
            })

    return enriched


@asynccontextmanager
async def lifespan(app: FastAPI):
    print("載入嵌入模型（CPU）+ ChromaDB + 知識圖譜...")
    model = SentenceTransformer(EMBED_MODEL, trust_remote_code=True, device="cpu")
    client = chromadb.PersistentClient(path=CHROMA_DIR)
    col_entities = client.get_collection("entities")
    col_reports = client.get_collection("reports")
    col_chunks = client.get_collection("chunks")
    G = nx.read_gml(str(GML_FILE))

    reports = []
    with open(REPORTS_FILE) as f:
        for line in f:
            line = line.strip()
            if line:
                reports.append(json.loads(line))
    report_lookup = {r["community_id"]: r for r in reports}

    _state["model"] = _CachedModel(model)
    _state["col_entities"] = col_entities
    _state["col_reports"] = col_reports
    _state["col_chunks"] = col_chunks
    _state["G"] = G
    _state["report_lookup"] = report_lookup
    _state["paper_metadata"] = _load_paper_metadata()
    enriched_file = DATA_DIR / "paper_enriched.json"
    _state["paper_enriched"] = json.load(open(enriched_file)) if enriched_file.exists() else {}
    _state["page_index"] = _load_page_index()
    _state["chunk_lookup"] = _load_chunk_lookup()
    _state["community_doc_index"] = _build_community_doc_index()
    _state["entity_chunk_map"] = build_entity_chunk_map(DATA_DIR / "entities.jsonl")
    fig_file = DATA_DIR / "figure_index.json"
    _state["figure_index"] = json.load(open(fig_file)) if fig_file.exists() else {}

    pm = _state["paper_metadata"]
    pi = _state["page_index"]
    cl = _state["chunk_lookup"]
    cdi = _state["community_doc_index"]
    fi = _state["figure_index"]
    print(f"  ✓ entities={col_entities.count()}, chunks={col_chunks.count()}, reports={col_reports.count()}")
    print(f"  ✓ graph: {G.number_of_nodes()} nodes, {G.number_of_edges()} edges")
    pe = _state["paper_enriched"]
    print(f"  ✓ paper_metadata: {len(pm)} papers, paper_enriched: {len(pe)} papers")
    print(f"  ✓ page_index: {len(pi)} papers, chunk_lookup: {len(cl)} chunks")
    ecm = _state["entity_chunk_map"]
    print(f"  ✓ community_doc_index: {len(cdi)} communities")
    print(f"  ✓ entity_chunk_map: {len(ecm)} entities")
    print(f"  ✓ figure_index: {sum(len(v) for v in fi.values())} figures across {len(fi)} docs")
    print("GraphRAG API ready on port 8002")
    yield
    _state.clear()


app = FastAPI(title="GraphRAG API", lifespan=lifespan)
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_methods=["*"],
    allow_headers=["*"],
)


class QueryRequest(BaseModel):
    query: str
    methods: list[str] = ["A", "B", "C", "D"]


def _retrieve(method_key: str, query: str) -> dict:
    m = _state["model"]
    ce = _state["col_entities"]
    cr = _state["col_reports"]
    cc = _state["col_chunks"]
    G = _state["G"]
    rl = _state["report_lookup"]
    ecm = _state.get("entity_chunk_map")

    if method_key == "A":
        return method_a_vector_rag(m, cc, query, k=12)
    elif method_key == "B":
        return method_b_local_search(m, ce, cc, G, rl, query, k_ent=8, k_chunks=12, entity_chunk_map=ecm)
    elif method_key == "C":
        return method_c_global_search(m, cr, rl, query, k=8, col_chunks=cc, entity_chunk_map=ecm, G=G)
    elif method_key == "D":
        return method_d_drift_search(m, cr, ce, cc, G, rl, query, entity_chunk_map=ecm)
    else:
        raise ValueError(f"Unknown method: {method_key}")


def _check_gemma():
    try:
        r = requests.get("http://localhost:8080/health", timeout=3)
        return r.status_code == 200
    except Exception:
        return False


def _call_gemma_stream(system_prompt, user_content, max_tokens=16384):
    if _abort_event.is_set():
        return
    if not _check_gemma():
        yield ("content", "[ERROR] Gemma 4 server 未回應，請確認 llama-server 是否在執行。")
        return

    payload = {
        "model": "gemma-4",
        "messages": [
            {"role": "system", "content": system_prompt},
            {"role": "user", "content": user_content},
        ],
        "temperature": 0.5,
        "max_tokens": max_tokens,
        "stream": True,
    }
    try:
        r = requests.post(GEMMA_URL, json=payload, stream=True, timeout=300)
        r.raise_for_status()
    except Exception as e:
        yield ("content", f"[ERROR] Gemma 連線失敗: {e}")
        return

    in_reasoning = True
    try:
        for line in r.iter_lines():
            if _abort_event.is_set():
                break
            line = line.decode("utf-8")
            if line.startswith("data: ") and line != "data: [DONE]":
                try:
                    chunk = json.loads(line[6:])
                    delta = chunk["choices"][0].get("delta", {})
                    reasoning = delta.get("reasoning_content", "")
                    content = delta.get("content", "")
                    if reasoning:
                        yield ("reasoning", reasoning)
                    if content:
                        if in_reasoning:
                            in_reasoning = False
                            yield ("answer_start", "")
                        yield ("content", content)
                except (json.JSONDecodeError, KeyError, IndexError):
                    pass
    finally:
        r.close()


def _call_gemma_sync(system_prompt, user_content, max_tokens=16384):
    if not _check_gemma():
        return "[ERROR] Gemma 4 server 未回應，請確認 llama-server 是否在執行。"
    payload = {
        "model": "gemma-4",
        "messages": [
            {"role": "system", "content": system_prompt},
            {"role": "user", "content": user_content},
        ],
        "temperature": 0.5,
        "max_tokens": max_tokens,
        "stream": False,
    }
    try:
        r = requests.post(GEMMA_URL, json=payload, timeout=300)
        r.raise_for_status()
        data = r.json()
        return data["choices"][0]["message"]["content"]
    except Exception as e:
        return f"[ERROR] Gemma 連線失敗: {e}"


@app.get("/health")
def health():
    gemma_ok = False
    try:
        r = requests.get("http://localhost:8080/health", timeout=2)
        gemma_ok = r.status_code == 200
    except Exception:
        pass
    return {
        "status": "ok",
        "gemma_server": gemma_ok,
        "graph_nodes": _state["G"].number_of_nodes() if "G" in _state else 0,
        "collections": {
            "entities": _state["col_entities"].count() if "col_entities" in _state else 0,
            "chunks": _state["col_chunks"].count() if "col_chunks" in _state else 0,
            "reports": _state["col_reports"].count() if "col_reports" in _state else 0,
        },
        "papers": len(_state.get("paper_metadata", {})),
        "embed_cache": len(_state["model"]._cache) if "model" in _state else 0,
    }


@app.get("/methods")
def methods():
    return METHOD_INFO


@app.get("/papers")
def list_papers():
    return _state.get("paper_metadata", {})


@app.get("/papers/enriched")
def list_papers_enriched():
    return _state.get("paper_enriched", {})


@app.get("/papers/{doc_id}/enriched")
def get_paper_enriched(doc_id: str):
    data = _state.get("paper_enriched", {}).get(doc_id)
    if not data:
        raise HTTPException(404, f"No enriched data for {doc_id}")
    return data


@app.get("/papers/{doc_id}/pdf")
def serve_pdf(doc_id: str):
    meta = _state.get("paper_metadata", {}).get(doc_id)
    if not meta:
        raise HTTPException(404, f"Unknown doc_id: {doc_id}")
    pdf_path = PDF_DIR / f"{meta['filename']}.pdf"
    if not pdf_path.exists():
        raise HTTPException(404, f"PDF not found: {pdf_path.name}")
    from starlette.responses import Response
    with open(pdf_path, "rb") as f:
        content = f.read()
    return Response(
        content=content,
        media_type="application/pdf",
        headers={"Content-Disposition": "inline"},
    )


@app.get("/papers/{doc_id}/figures")
def list_figures(doc_id: str):
    fi = _state.get("figure_index", {}).get(doc_id, {})
    return {"doc_id": doc_id, "figures": fi}


@app.get("/figures/{doc_id}/{fig_key}")
def serve_figure(doc_id: str, fig_key: str):
    fi = _state.get("figure_index", {}).get(doc_id, {}).get(fig_key)
    if not fi:
        raise HTTPException(404, f"Figure not found: {doc_id}/{fig_key}")
    images = fi.get("images", {})
    filename = images.get("xobject") or images.get("page_render")
    if not filename:
        raise HTTPException(404, "No image file")
    path = FIGURES_DIR / doc_id / filename
    if not path.exists():
        raise HTTPException(404, f"Image file missing: {path.name}")
    return FileResponse(path, media_type="image/png")


@app.get("/figures/{doc_id}/{fig_key}/data")
def serve_table_data(doc_id: str, fig_key: str):
    fi = _state.get("figure_index", {}).get(doc_id, {}).get(fig_key)
    if not fi or "table_data" not in fi:
        raise HTTPException(404, "No table data")
    path = FIGURES_DIR / doc_id / fi["table_data"]
    if not path.exists():
        raise HTTPException(404, "Table data file missing")
    with open(path) as f:
        return json.load(f)


@app.post("/abort")
def abort_query():
    _abort_event.set()
    return {"status": "aborted"}


@app.post("/skip")
def skip_current():
    _skip_event.set()
    return {"status": "skipped"}


@app.post("/query")
def query_graphrag(req: QueryRequest):
    if not req.query.strip():
        raise HTTPException(400, "query is empty")

    valid = [m for m in req.methods if m in METHOD_INFO]
    if not valid:
        raise HTTPException(400, "no valid methods")

    _abort_event.clear()
    _skip_event.clear()

    def generate():
        # Pre-compute embedding once — all 4 methods share the cached vector
        _state["model"].encode(req.query)

        # ── Phase 1: Parallel retrieval ──
        retrieval_results = {}

        def do_retrieve(mk):
            t0 = time.time()
            result = _retrieve(mk, req.query)
            elapsed = time.time() - t0
            return mk, result, elapsed

        with ThreadPoolExecutor(max_workers=4) as pool:
            futures = {pool.submit(do_retrieve, mk): mk for mk in valid}
            for f in as_completed(futures):
                if _abort_event.is_set():
                    yield f"data: {json.dumps({'type': 'all_done', 'aborted': True})}\n\n"
                    return
                mk, result, elapsed = f.result()
                retrieval_results[mk] = (result, elapsed)
                enriched = _enrich_sources(result.get("sources", []))
                meta = {
                    "type": "retrieval_done",
                    "method": mk,
                    "method_name": METHOD_INFO[mk]["name"],
                    "retrieval_time": round(elapsed, 2),
                    "context_chars": len(result["context"]),
                    "sources_count": len(result.get("sources", [])),
                    "sources": enriched,
                    "seed_entities": result.get("seed_entities", []),
                    "n_neighbors": result.get("n_neighbors"),
                    "n_edges": result.get("n_edges"),
                    "n_sub_queries": result.get("n_sub_queries"),
                    "traversal_graph": result.get("traversal_graph"),
                }
                yield f"data: {json.dumps(meta, ensure_ascii=False)}\n\n"

        # Sort by retrieval time (fastest first)
        sorted_methods = sorted(retrieval_results.keys(),
                                key=lambda mk: retrieval_results[mk][1])
        yield f"data: {json.dumps({'type': 'all_retrieved', 'order': sorted_methods})}\n\n"

        # ── Phase 2: LLM one by one (fastest retrieval first) ──
        for mk in sorted_methods:
            _skip_event.clear()
            if _abort_event.is_set():
                yield f"data: {json.dumps({'type': 'all_done', 'aborted': True})}\n\n"
                return

            result, t_ret = retrieval_results[mk]
            ctx = result["context"][:MAX_CONTEXT_CHARS]
            if len(result["context"]) > MAX_CONTEXT_CHARS:
                ctx += "\n\n[... context truncated ...]"

            yield f"data: {json.dumps({'type': 'llm_start', 'method': mk})}\n\n"

            # --- Call 1: Main answer ---
            t_llm_start = time.time()
            token_count = 0
            full_answer = []
            skipped = False
            user_content = f"Context:\n{ctx}\n\nQuestion: {req.query}"

            gen = _call_gemma_stream(SYSTEM_PROMPT, user_content)
            try:
                for kind, text in gen:
                    if _skip_event.is_set() or _abort_event.is_set():
                        skipped = True
                        break
                    if kind == "reasoning":
                        token_count += 1
                        yield f"data: {json.dumps({'type': 'reasoning', 'method': mk, 'content': text}, ensure_ascii=False)}\n\n"
                    elif kind == "answer_start":
                        yield f"data: {json.dumps({'type': 'answer_start', 'method': mk})}\n\n"
                    elif kind == "content":
                        token_count += 1
                        full_answer.append(text)
                        yield f"data: {json.dumps({'type': 'token', 'method': mk, 'content': text}, ensure_ascii=False)}\n\n"
            finally:
                gen.close()

            t_llm = time.time() - t_llm_start
            yield f"data: {json.dumps({'type': 'method_done', 'method': mk, 'llm_time': round(t_llm, 1), 'tokens': token_count, 'skipped': skipped}, ensure_ascii=False)}\n\n"

            if _abort_event.is_set():
                yield f"data: {json.dumps({'type': 'all_done', 'aborted': True})}\n\n"
                return
            if skipped:
                continue

            # --- Call 2: Evidence / methodology ---
            prev_answer = "".join(full_answer)
            if prev_answer.strip():
                _skip_event.clear()
                truncated_answer = prev_answer[:1500]
                evidence_system = EVIDENCE_PROMPT.format(prev_answer=truncated_answer)
                ev_ctx = result["context"][:3500]
                yield f"data: {json.dumps({'type': 'evidence_start', 'method': mk})}\n\n"

                t_ev_start = time.time()
                ev_count = 0
                ev_skipped = False
                gen2 = _call_gemma_stream(evidence_system, f"Context:\n{ev_ctx}")
                try:
                    for kind, text in gen2:
                        if _skip_event.is_set() or _abort_event.is_set():
                            ev_skipped = True
                            break
                        if kind == "reasoning":
                            ev_count += 1
                            yield f"data: {json.dumps({'type': 'evidence_reasoning', 'method': mk, 'content': text}, ensure_ascii=False)}\n\n"
                        elif kind == "answer_start":
                            yield f"data: {json.dumps({'type': 'evidence_answer_start', 'method': mk})}\n\n"
                        elif kind == "content":
                            ev_count += 1
                            yield f"data: {json.dumps({'type': 'evidence_token', 'method': mk, 'content': text}, ensure_ascii=False)}\n\n"
                finally:
                    gen2.close()

                t_ev = time.time() - t_ev_start
                yield f"data: {json.dumps({'type': 'evidence_done', 'method': mk, 'llm_time': round(t_ev, 1), 'tokens': ev_count, 'skipped': ev_skipped}, ensure_ascii=False)}\n\n"

        yield f"data: {json.dumps({'type': 'all_done'})}\n\n"

    return StreamingResponse(generate(), media_type="text/event-stream")


@app.post("/query-sync")
def query_sync(req: QueryRequest):
    """同步版 /query — 給 advisor 用，回傳 JSON 而非 SSE。"""
    if not req.query.strip():
        raise HTTPException(400, "query is empty")

    mk = req.methods[0] if req.methods else "B"
    if mk not in METHOD_INFO:
        raise HTTPException(400, f"Unknown method: {mk}")

    _state["model"].encode(req.query)

    t0 = time.time()
    result = _retrieve(mk, req.query)
    t_ret = time.time() - t0
    enriched = _enrich_sources(result.get("sources", []))

    ctx = result["context"]

    t_llm_start = time.time()
    answer = _call_gemma_sync(SYSTEM_PROMPT, f"Context:\n{ctx}\n\nQuestion: {req.query}")
    t_llm = time.time() - t_llm_start

    evidence = ""
    t_ev = 0.0
    if answer.strip() and not answer.startswith("[ERROR]"):
        ev_system = EVIDENCE_PROMPT.format(prev_answer=answer)
        t_ev_start = time.time()
        evidence = _call_gemma_sync(ev_system, f"Context:\n{ctx}")
        t_ev = time.time() - t_ev_start

    return {
        "method": mk,
        "method_name": METHOD_INFO[mk]["name"],
        "answer": answer,
        "evidence": evidence,
        "sources": enriched,
        "retrieval_time": round(t_ret, 2),
        "llm_time": round(t_llm, 1),
        "evidence_time": round(t_ev, 1),
        "context_chars": len(ctx),
    }


@app.post("/retrieve-only")
def retrieve_only(req: QueryRequest):
    if not req.query.strip():
        raise HTTPException(400, "query is empty")

    _state["model"].encode(req.query)
    results = {}
    for mk in req.methods:
        if mk not in METHOD_INFO:
            continue
        t0 = time.time()
        result = _retrieve(mk, req.query)
        elapsed = time.time() - t0
        enriched = _enrich_sources(result.get("sources", []))
        results[mk] = {
            "method_name": METHOD_INFO[mk]["name"],
            "retrieval_time": round(elapsed, 2),
            "context_chars": len(result["context"]),
            "context_preview": result["context"][:500],
            "sources": enriched,
            "seed_entities": result.get("seed_entities", []),
            "traversal_graph": result.get("traversal_graph"),
        }
    return results


if __name__ == "__main__":
    import uvicorn
    uvicorn.run(app, host="0.0.0.0", port=8002)
