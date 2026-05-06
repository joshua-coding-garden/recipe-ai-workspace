"""Phase 8+9：四種檢索方法對照。

同一組測試問題，分別用四種方法檢索 context 並由 Claude 回答，
最後產出比較表。

方法：
  A. 傳統 Vector RAG（Phase 9 基準線）：chunk 向量搜尋 → LLM
  B. Local Search：entity 向量搜尋 → 圖遍歷 1-hop → chunk + report → LLM
  C. Global Search：report 向量搜尋 → map key points → reduce → LLM
  D. Drift Search：HDE 假設答案 → report 搜尋 → 初答 + 子問題 → Local → 合併

注意：本腳本不呼叫外部 LLM API。它負責為每個 query × method 組合
生成 context，然後印出結構化的 context 供人工或 Claude 評估。
最終由外部（Claude subagent）完成回答與評比。
"""
import _paths
import json
import numpy as np
import networkx as nx
import chromadb
from collections import defaultdict
from sentence_transformers import SentenceTransformer
from pathlib import Path

DATA_DIR = _paths.DATA_DIR
VIZ_DIR = _paths.VIZ_DIR
NOTES_DIR = _paths.NOTES_DIR
GML_FILE = DATA_DIR / "graph.gml"
REPORTS_FILE = DATA_DIR / "reports.jsonl"

MODEL_NAME = "Snowflake/snowflake-arctic-embed-l-v2.0"
CHROMA_DIR = str(_paths.CHROMA_DIR)

TEST_QUERIES = [
    {
        "id": "Q1",
        "type": "detail",
        "query": "How does leucine trigger muscle protein synthesis, and what is the optimal per-meal dose?",
    },
    {
        "id": "Q2",
        "type": "broad",
        "query": "What are the major research themes in sports nutrition over the past decade?",
    },
    {
        "id": "Q3",
        "type": "multi-hop",
        "query": "How do omega-3 fatty acids and antioxidant supplements interact in reducing exercise-induced muscle damage?",
    },
]


def load_all():
    print("Loading model + ChromaDB + graph...")
    model = SentenceTransformer(MODEL_NAME, trust_remote_code=True)
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

    entities_file = DATA_DIR / "entities.jsonl"
    ecm = build_entity_chunk_map(entities_file)
    print(f"  entity_chunk_map: {len(ecm)} entities → chunk mappings")

    return model, col_entities, col_reports, col_chunks, G, report_lookup, ecm


def embed_query(model, text):
    return model.encode(text, normalize_embeddings=True).tolist()


def build_entity_chunk_map(entities_file):
    ecm = defaultdict(set)
    with open(entities_file) as f:
        for line in f:
            line = line.strip()
            if not line:
                continue
            e = json.loads(line)
            ecm[e["name"]].add(e["chunk_id"])
    return {k: sorted(v) for k, v in ecm.items()}


def graph_weighted_neighbors(G, seed_entities, max_per_seed=10, min_weight=5.0):
    neighbor_scores = {}
    edge_info = []
    for ent in seed_entities:
        if ent not in G:
            continue
        weighted = []
        for nb in G.neighbors(ent):
            edata = G[ent][nb]
            w = float(edata.get("weight", 0))
            weighted.append((nb, w, edata))
        weighted.sort(key=lambda x: x[1], reverse=True)
        for nb, w, edata in weighted[:max_per_seed]:
            if w < min_weight:
                break
            if nb not in seed_entities:
                neighbor_scores[nb] = max(neighbor_scores.get(nb, 0), w)
            edge_info.append((
                ent, nb, w,
                edata.get("types", ""),
                edata.get("description", "")[:120],
            ))
    ranked = sorted(neighbor_scores.items(), key=lambda x: x[1], reverse=True)
    return ranked, edge_info


def graph_driven_chunk_selection(
    entity_names, entity_chunk_map, col_chunks, query_vec,
    max_chunks=8, fallback_k=3,
):
    candidate_ids = set()
    for ent in entity_names:
        for cid in entity_chunk_map.get(ent, []):
            candidate_ids.add(cid)
    candidate_ids = list(candidate_ids)[:500]

    if candidate_ids:
        result = col_chunks.get(
            ids=candidate_ids,
            include=["embeddings", "documents", "metadatas"],
        )
        if result["ids"]:
            embeddings = np.array(result["embeddings"])
            qv = np.array(query_vec)
            sims = embeddings @ qv
            ranking = np.argsort(-sims)
            chunks = []
            for idx in ranking[:max_chunks]:
                m = result["metadatas"][idx]
                chunks.append((
                    f"{m['doc_id']}_chunk_{m['chunk_idx']:03d}",
                    result["documents"][idx],
                    m,
                    float(sims[idx]),
                ))
            if len(chunks) >= max_chunks:
                return chunks
            seen = {c[0] for c in chunks}
        else:
            chunks = []
            seen = set()
    else:
        chunks = []
        seen = set()

    fill = col_chunks.query(query_embeddings=[query_vec], n_results=max_chunks)
    for doc, m in zip(fill["documents"][0], fill["metadatas"][0]):
        cid = f"{m['doc_id']}_chunk_{m['chunk_idx']:03d}"
        if cid not in seen:
            chunks.append((cid, doc, m, 0.0))
            seen.add(cid)
        if len(chunks) >= max_chunks:
            break
    return chunks


def _generate_graph_sub_queries(G, seed_entities, query, max_queries=3):
    THEME_MAP = {
        "TRIGGERS": "mechanisms and pathways",
        "INCREASES": "effects and outcomes",
        "DECREASES": "inhibitory effects",
        "STUDIES": "research evidence",
        "ASSOCIATED_WITH": "associations and connections",
        "CAUSES": "causal mechanisms",
        "INHIBITS": "counteracting factors",
        "PART_OF": "components and composition",
        "IMPROVES": "beneficial effects",
        "USED_IN": "practical applications",
    }
    type_examples = defaultdict(list)
    for ent in seed_entities:
        if ent not in G:
            continue
        for nb in G.neighbors(ent):
            edata = G[ent][nb]
            rel_type = edata.get("types", "RELATED_TO")
            w = float(edata.get("weight", 0))
            if w >= 5.0:
                type_examples[rel_type].append((ent, nb))

    sub_queries = []
    used_themes = set()
    for rel_type, examples in sorted(type_examples.items(), key=lambda x: len(x[1]), reverse=True):
        if len(sub_queries) >= max_queries:
            break
        theme = THEME_MAP.get(rel_type, rel_type.lower().replace("_", " "))
        if theme in used_themes:
            continue
        used_themes.add(theme)
        targets = list({e[1] for e in examples[:3]})
        sub_queries.append(f"{theme} of {query} (focusing on {', '.join(targets[:2])})")

    fallbacks = [
        f"key findings: {query}",
        f"practical applications: {query}",
        f"biological mechanisms: {query}",
    ]
    for fb in fallbacks:
        if len(sub_queries) >= max_queries:
            break
        sub_queries.append(fb)
    return sub_queries[:max_queries]


def _build_traversal_graph(G, node_roles, edge_tuples, steps):
    seen = {}
    nodes = []
    for name, role, step in node_roles:
        if name in seen:
            continue
        seen[name] = True
        in_g = name in G
        nodes.append({
            "id": name,
            "type": G.nodes[name].get("type", "UNKNOWN") if in_g else ("REPORT" if "Report_" in name or "Community" in name else "VIRTUAL"),
            "role": role,
            "step": step,
            "description": (G.nodes[name].get("description", "") or "")[:100] if in_g else "",
            "degree": G.degree(name) if in_g else 0,
        })
    edges = []
    edge_seen = set()
    for src, tgt, w, types, _desc in edge_tuples:
        key = tuple(sorted([src, tgt]))
        if key in edge_seen:
            continue
        edge_seen.add(key)
        if src in seen and tgt in seen:
            edges.append({
                "source": src,
                "target": tgt,
                "weight": round(float(w), 1),
                "types": types or "",
            })
    return {"nodes": nodes, "edges": edges, "steps": steps}


def method_a_vector_rag(model, col_chunks, query, k=8):
    """傳統 Vector RAG：直接搜 chunk。"""
    qv = embed_query(model, query)
    results = col_chunks.query(query_embeddings=[qv], n_results=k)
    context_parts = []
    sources = []
    for doc, meta in zip(results["documents"][0], results["metadatas"][0]):
        context_parts.append(doc)
        sources.append(f"{meta['doc_id']}_chunk_{meta['chunk_idx']:03d}")
    return {
        "method": "A. Traditional Vector RAG",
        "context": "\n\n---\n\n".join(context_parts),
        "sources": sources,
        "n_chunks": len(sources),
    }


def method_b_local_search(model, col_entities, col_chunks, G, report_lookup, query,
                          k_ent=5, k_chunks=8, entity_chunk_map=None):
    """Local Search：entity → graph traversal (weighted) → graph-driven chunk selection。"""
    qv = embed_query(model, query)

    ent_results = col_entities.query(query_embeddings=[qv], n_results=k_ent)
    seed_entities = [meta["name"] for meta in ent_results["metadatas"][0]]

    ranked_neighbors, edge_info = graph_weighted_neighbors(
        G, seed_entities, max_per_seed=10, min_weight=5.0,
    )

    all_entity_names = list(seed_entities)
    tg_roles = [(e, "seed", 0) for e in seed_entities]
    nb_step1 = []
    for nb_name, _ in ranked_neighbors[:15]:
        if nb_name not in all_entity_names:
            all_entity_names.append(nb_name)
            tg_roles.append((nb_name, "neighbor", 1))
            nb_step1.append(nb_name)

    if entity_chunk_map:
        chunks = graph_driven_chunk_selection(
            all_entity_names, entity_chunk_map, col_chunks, qv,
            max_chunks=k_chunks, fallback_k=3,
        )
    else:
        res = col_chunks.query(query_embeddings=[qv], n_results=k_chunks)
        chunks = [
            (f"{m['doc_id']}_chunk_{m['chunk_idx']:03d}", doc, m, 1.0)
            for doc, m in zip(res["documents"][0], res["metadatas"][0])
        ]

    chunk_texts = [c[1] for c in chunks]
    chunk_sources = [c[0] for c in chunks]

    neighbor_descriptions = []
    for ent in all_entity_names[:20]:
        if ent in G:
            desc = G.nodes[ent].get("description", "")
            ntype = G.nodes[ent].get("type", "")
            neighbor_descriptions.append(f"[{ntype}] {ent}: {desc[:150]}")

    edges_text = []
    for src, tgt, w, types, desc in edge_info[:15]:
        edges_text.append(f"{src} -[{types} w={w}]-> {tgt}: {desc}")

    leiden_file = DATA_DIR / "communities_leiden.json"
    community_reports_text = ""
    if leiden_file.exists():
        with open(leiden_file) as f:
            leiden = json.load(f)
        part = leiden["partition"]
        relevant_comms = set()
        for ent in seed_entities:
            if ent in part:
                relevant_comms.add(part[ent])
        for cid in list(relevant_comms)[:3]:
            r = report_lookup.get(cid)
            if r:
                community_reports_text += f"\n## Community {cid}: {r['title']}\n{r['summary']}\nFindings: {'; '.join(r['key_findings'][:3])}\n"

    context = "### Graph Entities (seed + weighted 1-hop neighbors)\n"
    context += "\n".join(neighbor_descriptions)
    context += "\n\n### Key Relations (by edge weight)\n"
    context += "\n".join(edges_text)
    context += "\n\n### Source Chunks (graph-driven selection)\n"
    context += "\n---\n".join(chunk_texts)
    if community_reports_text:
        context += "\n\n### Community Reports\n" + community_reports_text

    tg_steps = [
        {"step": 0, "label": "種子實體", "node_ids": list(seed_entities)},
    ]
    if nb_step1:
        tg_steps.append({"step": 1, "label": "圖遍歷鄰居", "node_ids": nb_step1})
    traversal_graph = _build_traversal_graph(G, tg_roles, edge_info, tg_steps)

    return {
        "method": "B. Local Search (GraphRAG)",
        "context": context,
        "sources": chunk_sources,
        "seed_entities": seed_entities,
        "n_neighbors": len(ranked_neighbors),
        "n_edges": len(edge_info),
        "n_chunks": len(chunk_texts),
        "traversal_graph": traversal_graph,
    }


def method_c_global_search(model, col_reports, report_lookup, query, k=5,
                           col_chunks=None, entity_chunk_map=None, G=None,
                           max_grounding_chunks=8):
    """Global Search：report → community entities → graph-driven grounding chunks。"""
    qv = embed_query(model, query)
    results = col_reports.query(query_embeddings=[qv], n_results=k)

    context_parts = []
    sources = []
    community_entities = []
    for meta in results["metadatas"][0]:
        cid = meta["community_id"]
        r = report_lookup.get(cid)
        if r:
            part = f"## Community {cid}: {r['title']}\n"
            part += f"Summary: {r['summary']}\n"
            part += f"Key entities: {', '.join(r.get('key_entities', []))}\n"
            part += "Findings:\n" + "\n".join(f"- {f}" for f in r.get("key_findings", []))
            if r.get("practical_implications"):
                part += f"\nPractical: {r['practical_implications']}"
            context_parts.append(part)
            sources.append(f"Community_{cid}")
            community_entities.extend(r.get("key_entities", []))

    unique_ents = list(dict.fromkeys(community_entities)) if community_entities else []

    traversal_graph = None
    if G and unique_ents:
        tg_roles = []
        tg_edges = []
        hub_ids = []
        for meta in results["metadatas"][0]:
            cid = meta["community_id"]
            r = report_lookup.get(cid)
            if r:
                hub = f"Report_{cid}"
                tg_roles.append((hub, "community_hub", 0))
                hub_ids.append(hub)
                for ent in r.get("key_entities", [])[:8]:
                    tg_roles.append((ent, "community_entity", 1))
                    tg_edges.append((hub, ent, 5.0, "HAS_ENTITY", ""))
        ent_set = {n for n, rl, _ in tg_roles if rl == "community_entity"}
        for ent in list(ent_set):
            if ent not in G:
                continue
            for nb in G.neighbors(ent):
                if nb in ent_set:
                    edata = G[ent][nb]
                    tg_edges.append((
                        ent, nb, float(edata.get("weight", 0)),
                        edata.get("types", ""), "",
                    ))
        tg_steps = [
            {"step": 0, "label": "社群報告", "node_ids": hub_ids},
            {"step": 1, "label": "報告關鍵實體", "node_ids": list(ent_set)},
        ]
        traversal_graph = _build_traversal_graph(G, tg_roles, tg_edges, tg_steps)

    grounding_texts = []
    chunk_sources = []
    if col_chunks and entity_chunk_map and unique_ents:
        chunks = graph_driven_chunk_selection(
            unique_ents, entity_chunk_map, col_chunks, qv,
            max_chunks=max_grounding_chunks, fallback_k=3,
        )
        for cid_str, doc, m, sim in chunks:
            grounding_texts.append(doc)
            chunk_sources.append(cid_str)
    elif col_chunks:
        chunk_res = col_chunks.query(query_embeddings=[qv], n_results=max_grounding_chunks)
        for doc, m in zip(chunk_res["documents"][0], chunk_res["metadatas"][0]):
            grounding_texts.append(doc)
            chunk_sources.append(f"{m['doc_id']}_chunk_{m['chunk_idx']:03d}")

    context = "### Community Reports\n"
    context += "\n\n---\n\n".join(context_parts)
    if grounding_texts:
        context += "\n\n### Grounding Evidence (from community entities → source chunks)\n"
        context += "\n---\n".join(grounding_texts)

    return {
        "method": "C. Global Search (GraphRAG)",
        "context": context,
        "sources": chunk_sources + sources,
        "n_reports": len(sources),
        "n_grounding_chunks": len(grounding_texts),
        "n_community_entities": len(set(community_entities)),
        "traversal_graph": traversal_graph,
    }


def method_d_drift_search(model, col_reports, col_entities, col_chunks, G, report_lookup, query,
                          k_reports=3, k_ent=5, entity_chunk_map=None):
    """Drift Search：entity-augmented HDE → reports → graph sub-queries → graph-driven chunks。"""
    qv = embed_query(model, query)

    ent_results = col_entities.query(query_embeddings=[qv], n_results=k_ent)
    seed_entities = [meta["name"] for meta in ent_results["metadatas"][0]]

    entity_terms = ", ".join(seed_entities[:3])
    hde = f"Based on current sports nutrition research regarding {entity_terms}, {query.lower()} The answer involves multiple interacting mechanisms documented across systematic reviews."
    hde_v = embed_query(model, hde)

    rep_results = col_reports.query(query_embeddings=[hde_v], n_results=k_reports)
    report_context = []
    for meta in rep_results["metadatas"][0]:
        cid = meta["community_id"]
        r = report_lookup.get(cid)
        if r:
            report_context.append(f"## {r['title']}\n{r['summary']}\nFindings: {'; '.join(r.get('key_findings', [])[:3])}")

    sub_queries = _generate_graph_sub_queries(G, seed_entities, query, max_queries=3)

    tg_roles = [(e, "seed", 0) for e in seed_entities]
    tg_edges = []
    tg_steps = [{"step": 0, "label": "種子實體", "node_ids": list(seed_entities)}]

    local_contexts = []
    chunk_sources = []
    seen_chunks = set()
    for i, sq in enumerate(sub_queries):
        sqv = embed_query(model, sq)
        sq_ent_res = col_entities.query(query_embeddings=[sqv], n_results=3)
        sq_seeds = [m["name"] for m in sq_ent_res["metadatas"][0]]

        ranked_nb, edge_info = graph_weighted_neighbors(G, sq_seeds, max_per_seed=5, min_weight=5.0)
        all_ents = list(sq_seeds)
        sq_nb_ids = []
        for nb_name, _ in ranked_nb[:8]:
            if nb_name not in all_ents:
                all_ents.append(nb_name)
                sq_nb_ids.append(nb_name)

        for s in sq_seeds:
            tg_roles.append((s, "sub_seed", 1 + i * 2))
        for nb_name in sq_nb_ids:
            tg_roles.append((nb_name, "sub_neighbor", 2 + i * 2))
        tg_edges.extend(edge_info)
        tg_steps.append({"step": 1 + i * 2, "label": f"子問題{i+1} 實體", "node_ids": list(sq_seeds)})
        if sq_nb_ids:
            tg_steps.append({"step": 2 + i * 2, "label": f"子問題{i+1} 鄰居", "node_ids": sq_nb_ids})

        if entity_chunk_map:
            sq_chunks = graph_driven_chunk_selection(
                all_ents, entity_chunk_map, col_chunks, sqv,
                max_chunks=5, fallback_k=3,
            )
        else:
            res = col_chunks.query(query_embeddings=[sqv], n_results=5)
            sq_chunks = [
                (f"{m['doc_id']}_chunk_{m['chunk_idx']:03d}", doc, m, 1.0)
                for doc, m in zip(res["documents"][0], res["metadatas"][0])
            ]

        for cid_str, doc, m, sim in sq_chunks:
            if cid_str not in seen_chunks:
                chunk_sources.append(cid_str)
                seen_chunks.add(cid_str)

        edges_text = []
        for src, tgt, w, types, desc in edge_info[:8]:
            edges_text.append(f"  {src} -[{types} w={w}]-> {tgt}: {desc}")

        local_ctx = f"Sub-query: {sq}\n"
        local_ctx += f"Entities: {', '.join(all_ents[:10])}\n"
        if edges_text:
            local_ctx += "Key relations:\n" + "\n".join(edges_text) + "\n"
        local_ctx += "Chunks:\n" + "\n---\n".join(c[1] for c in sq_chunks)
        local_contexts.append(local_ctx)

    context = "### Phase 1: Report-level overview (entity-augmented HDE)\n"
    context += "\n\n".join(report_context)
    context += f"\n\nSeed entities: {', '.join(seed_entities)}\n"
    context += "\n\n### Phase 2: Graph-driven deep-dives\n"
    context += "\n\n===\n\n".join(local_contexts)

    traversal_graph = _build_traversal_graph(G, tg_roles, tg_edges, tg_steps)

    return {
        "method": "D. Drift Search (GraphRAG)",
        "context": context,
        "sources": chunk_sources,
        "n_sub_queries": len(sub_queries),
        "sub_queries": sub_queries,
        "seed_entities": seed_entities,
        "traversal_graph": traversal_graph,
    }


def main():
    print("Phase 8+9：四種檢索方法對照")
    print("=" * 60)

    model, col_entities, col_reports, col_chunks, G, report_lookup, ecm = load_all()

    all_results = {}

    for q in TEST_QUERIES:
        qid = q["id"]
        query = q["query"]
        qtype = q["type"]
        print(f"\n{'='*60}")
        print(f"Query {qid} [{qtype}]: {query}")
        print("=" * 60)

        results = {}

        print("\n  Running Method A (Vector RAG)...")
        results["A"] = method_a_vector_rag(model, col_chunks, query)
        print(f"    → {results['A']['n_chunks']} chunks")

        print("  Running Method B (Local Search)...")
        results["B"] = method_b_local_search(model, col_entities, col_chunks, G, report_lookup, query, entity_chunk_map=ecm)
        print(f"    → seeds: {results['B']['seed_entities']}, {results['B']['n_neighbors']} neighbors, {results['B']['n_edges']} edges")

        print("  Running Method C (Global Search)...")
        results["C"] = method_c_global_search(model, col_reports, report_lookup, query, col_chunks=col_chunks, entity_chunk_map=ecm, G=G)
        print(f"    → {results['C']['n_reports']} reports, {results['C']['n_grounding_chunks']} grounding chunks")

        print("  Running Method D (Drift Search)...")
        results["D"] = method_d_drift_search(model, col_reports, col_entities, col_chunks, G, report_lookup, query, entity_chunk_map=ecm)
        print(f"    → {results['D']['n_sub_queries']} sub-queries: {results['D']['sub_queries']}")

        all_results[qid] = {
            "query": query,
            "type": qtype,
            "methods": results,
        }

    output_file = DATA_DIR / "retrieval_contexts.json"
    with open(output_file, "w") as f:
        json.dump(all_results, f, ensure_ascii=False, indent=2)
    print(f"\n\nContext 已輸出: {output_file} ({output_file.stat().st_size // 1024} KB)")

    print("\n" + "=" * 60)
    print("Context 統計：")
    for qid, qdata in all_results.items():
        print(f"\n  {qid}: {qdata['query'][:60]}...")
        for mid, mdata in qdata["methods"].items():
            ctx_len = len(mdata["context"])
            print(f"    Method {mid[0]}: context {ctx_len:,} chars, sources: {mdata.get('sources', [])[:3]}")

    print("\n接下來由 Claude subagent 讀 context 產生回答 + 評分比較表。")


if __name__ == "__main__":
    main()
