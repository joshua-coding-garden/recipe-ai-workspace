"""
Health Effect Vector Search Microservice
Port 8003 — 獨立 FastAPI 服務

功能：
  1. 將 619 筆 FooDB health effect description 向量化（Snowflake Arctic Embed L v2.0）
  2. 中/英文 name 直接搜尋（1435 筆）
  3. 向量語義搜尋（description similarity）
  4. 合併結果回傳 top-N

啟動：
  cd /home/aiiauser/JM/0325new/recipe-ai/health-vector
  /home/aiiauser/JM/0325new/graph/.venv/bin/python server.py

前端 Vite proxy:
  '/health-vector-api' → 'http://localhost:8003'
"""

import json
import os
import time
from pathlib import Path
from contextlib import asynccontextmanager

import chromadb
from sentence_transformers import SentenceTransformer
from fastapi import FastAPI, HTTPException
from fastapi.middleware.cors import CORSMiddleware
from pydantic import BaseModel

# ── Config ──────────────────────────────────────────────────
PORT = 8003
EMBED_MODEL = "Snowflake/snowflake-arctic-embed-l-v2.0"
DATA_DIR = Path(__file__).parent / "data"
CHROMA_DIR = Path(__file__).parent / "chroma_db"
HF_CACHE = Path(__file__).parent / ".cache" / "huggingface"

os.environ["HF_HOME"] = str(HF_CACHE)
os.environ["TRANSFORMERS_CACHE"] = str(HF_CACHE)

# ── Global state ────────────────────────────────────────────
embedder: SentenceTransformer | None = None
chroma_collection: chromadb.Collection | None = None
all_effects: list[dict] = []
name_index: dict[str, list[dict]] = {}  # normalized_name → [effect, ...]


def _normalize(s: str) -> str:
    return s.lower().strip().replace("-", " ").replace("_", " ")


def _build_name_index(effects: list[dict]):
    """Build index for fast name lookup (English + Chinese)."""
    idx: dict[str, list[dict]] = {}
    for eff in effects:
        for key in ["name", "name_zh"]:
            val = eff.get(key)
            if not val:
                continue
            norm = _normalize(val)
            idx.setdefault(norm, []).append(eff)
            for token in norm.split():
                if len(token) >= 2:
                    idx.setdefault(token, []).append(eff)
        if eff.get("name_zh"):
            for ch in eff["name_zh"]:
                pass
            zh = eff["name_zh"].replace("（", "").replace("）", "")
            for i in range(len(zh)):
                for j in range(i + 2, min(i + 7, len(zh) + 1)):
                    substr = zh[i:j]
                    idx.setdefault(substr, []).append(eff)
    return idx


def _init_chroma(effects_with_desc: list[dict], model: SentenceTransformer):
    """Initialize or load ChromaDB collection with health effect descriptions."""
    CHROMA_DIR.mkdir(parents=True, exist_ok=True)
    client = chromadb.PersistentClient(path=str(CHROMA_DIR))

    col_name = "health_effects_desc"
    existing = [c.name for c in client.list_collections()]

    if col_name in existing:
        col = client.get_collection(col_name)
        if col.count() == len(effects_with_desc):
            print(f"ChromaDB loaded: {col.count()} vectors")
            return col
        client.delete_collection(col_name)

    col = client.create_collection(
        col_name,
        metadata={"hnsw:space": "cosine"},
    )

    ids = []
    documents = []
    metadatas = []
    for eff in effects_with_desc:
        doc = f"{eff['name']} — {eff['name_zh']}: {eff['description']}"
        ids.append(str(eff["id"]))
        documents.append(doc)
        metadatas.append({
            "effect_id": eff["id"],
            "name": eff["name"],
            "name_zh": eff["name_zh"],
        })

    print(f"Embedding {len(documents)} descriptions...")
    t0 = time.time()
    embeddings = model.encode(documents, show_progress_bar=True, batch_size=32)
    print(f"Embedding done in {time.time() - t0:.1f}s")

    batch_size = 100
    for i in range(0, len(ids), batch_size):
        end = min(i + batch_size, len(ids))
        col.add(
            ids=ids[i:end],
            embeddings=embeddings[i:end].tolist(),
            documents=documents[i:end],
            metadatas=metadatas[i:end],
        )

    print(f"ChromaDB built: {col.count()} vectors")
    return col


@asynccontextmanager
async def lifespan(app: FastAPI):
    global embedder, chroma_collection, all_effects, name_index

    DATA_DIR.mkdir(parents=True, exist_ok=True)

    all_path = DATA_DIR / "health_effects_all.json"
    desc_path = DATA_DIR / "health_effects_with_desc.json"

    if not all_path.exists() or not desc_path.exists():
        raise RuntimeError(
            f"Data files missing. Copy them:\n"
            f"  cp /tmp/he_all.json {all_path}\n"
            f"  cp /tmp/he_with_desc.json {desc_path}"
        )

    with open(all_path, encoding="utf-8") as f:
        all_effects = json.load(f)
    with open(desc_path, encoding="utf-8") as f:
        effects_with_desc = json.load(f)

    print(f"Loaded {len(all_effects)} effects ({len(effects_with_desc)} with descriptions)")

    name_index = _build_name_index(all_effects)
    print(f"Name index: {len(name_index)} entries")

    print(f"Loading embedding model: {EMBED_MODEL}...")
    embedder = SentenceTransformer(EMBED_MODEL, cache_folder=str(HF_CACHE))
    print("Embedding model ready")

    chroma_collection = _init_chroma(effects_with_desc, embedder)

    yield


app = FastAPI(title="Health Effect Vector Search", lifespan=lifespan)
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_methods=["*"],
    allow_headers=["*"],
)


# ── Models ──────────────────────────────────────────────────
class SearchRequest(BaseModel):
    query: str
    top_k: int = 20


class SearchResult(BaseModel):
    id: int
    name: str
    name_zh: str
    score: float
    source: str  # "name_exact", "name_partial", "vector"
    description: str | None = None


# ── Endpoints ───────────────────────────────────────────────
@app.get("/health")
def health_check():
    return {
        "status": "ok",
        "total_effects": len(all_effects),
        "vectorized": chroma_collection.count() if chroma_collection else 0,
    }


class EmbedRequest(BaseModel):
    texts: list[str]


@app.post("/embed")
def embed_texts(req: EmbedRequest):
    """Generate embeddings for given texts using Snowflake Arctic Embed."""
    if not embedder:
        return {"error": "embedding model not loaded"}
    vectors = embedder.encode(req.texts, show_progress_bar=False).tolist()
    return {"embeddings": vectors, "dimension": len(vectors[0]) if vectors else 0}


@app.post("/search")
def search(req: SearchRequest):
    """
    Combined search: name matching + vector similarity.
    Returns deduplicated top-K results.
    """
    query = req.query.strip()
    if not query:
        raise HTTPException(400, "query is empty")

    results: dict[int, SearchResult] = {}

    # 1) Name search (exact + partial)
    _name_search(query, results)

    # 2) Vector search on descriptions
    _vector_search(query, req.top_k, results)

    # Sort by score descending, return top_k
    sorted_results = sorted(results.values(), key=lambda r: r.score, reverse=True)
    return {"query": query, "results": [r.model_dump() for r in sorted_results[: req.top_k]]}


def _name_search(query: str, results: dict[int, SearchResult]):
    """Search by Chinese/English name matching."""
    norm_q = _normalize(query)
    seen_ids = set()
    matches = []

    # Exact normalized match
    if norm_q in name_index:
        for eff in name_index[norm_q]:
            if eff["id"] not in seen_ids:
                seen_ids.add(eff["id"])
                matches.append((eff, 1.0, "name_exact"))

    # Chinese substring match (2+ chars)
    if len(query) >= 2:
        for eff in name_index.get(query, []):
            if eff["id"] not in seen_ids:
                seen_ids.add(eff["id"])
                matches.append((eff, 0.85, "name_partial"))

    # Token-level partial match
    for token in norm_q.split():
        if len(token) < 2:
            continue
        for eff in name_index.get(token, []):
            if eff["id"] not in seen_ids:
                seen_ids.add(eff["id"])
                matches.append((eff, 0.7, "name_partial"))

    for eff, score, source in matches:
        eid = eff["id"]
        if eid not in results or results[eid].score < score:
            results[eid] = SearchResult(
                id=eid,
                name=eff["name"],
                name_zh=eff.get("name_zh", ""),
                score=score,
                source=source,
                description=eff.get("description"),
            )


def _vector_search(query: str, top_k: int, results: dict[int, SearchResult]):
    """Semantic search on description embeddings."""
    if not chroma_collection or not embedder:
        return

    query_emb = embedder.encode([query]).tolist()
    chroma_results = chroma_collection.query(
        query_embeddings=query_emb,
        n_results=min(top_k, 30),
        include=["metadatas", "documents", "distances"],
    )

    if not chroma_results["ids"] or not chroma_results["ids"][0]:
        return

    for i, eid_str in enumerate(chroma_results["ids"][0]):
        eid = int(eid_str)
        distance = chroma_results["distances"][0][i]
        # cosine distance → similarity score (0-1)
        similarity = max(0, 1 - distance)
        meta = chroma_results["metadatas"][0][i]
        doc = chroma_results["documents"][0][i]

        # Extract description from document (format: "name — name_zh: description")
        desc = doc.split(": ", 1)[1] if ": " in doc else doc

        if eid not in results or results[eid].score < similarity:
            results[eid] = SearchResult(
                id=eid,
                name=meta.get("name", ""),
                name_zh=meta.get("name_zh", ""),
                score=round(similarity, 4),
                source="vector",
                description=desc,
            )


if __name__ == "__main__":
    import uvicorn
    uvicorn.run(app, host="0.0.0.0", port=PORT)
