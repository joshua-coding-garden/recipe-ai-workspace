"""Phase 3：子圖合併 — 跨 chunk 同名實體合併、關係合併、描述彙總，輸出 graph.gml。

流程：
1. 讀 entities.jsonl / relations.jsonl
2. Entity resolution：(name.lower().strip(), type) 相同 → 合併
   - descriptions 去重彙總
   - salience 取最大值
   - source_chunks 紀錄所有出現過的 chunk_id
   - taiwan_db_key 保留（從 description 正則抽取）
3. Relation resolution：(source.lower(), target.lower(), type) 相同 → 合併
   - descriptions 去重彙總
   - strength 取平均值
4. 用 NetworkX 建圖 → 輸出 data/graph.gml
"""
import _paths
import json
import re
import networkx as nx
from pathlib import Path
from collections import defaultdict

DATA_DIR = _paths.DATA_DIR
ENTITIES_FILE = DATA_DIR / "entities.jsonl"
RELATIONS_FILE = DATA_DIR / "relations.jsonl"
OUTPUT_GML = DATA_DIR / "graph.gml"
OUTPUT_ENTITIES = DATA_DIR / "entities_merged.jsonl"
OUTPUT_RELATIONS = DATA_DIR / "relations_merged.jsonl"

TW_KEY_RE = re.compile(r"\[taiwan_db_key:\s*([^\]]+)\]")


def load_jsonl(path: Path) -> list[dict]:
    records = []
    with open(path) as f:
        for line in f:
            line = line.strip()
            if not line:
                continue
            records.append(json.loads(line))
    return records


def extract_tw_key(description: str) -> str | None:
    m = TW_KEY_RE.search(description)
    return m.group(1).strip() if m else None


def merge_entities(raw: list[dict]) -> dict[tuple, dict]:
    merged: dict[tuple, dict] = {}
    for e in raw:
        name_lower = e["name"].strip().lower()
        etype = e.get("type", "UNKNOWN")
        key = (name_lower, etype)

        if key not in merged:
            merged[key] = {
                "name": e["name"].strip(),
                "type": etype,
                "descriptions": [],
                "salience": 0.0,
                "source_chunks": set(),
                "source_docs": set(),
                "taiwan_db_key": None,
            }

        m = merged[key]
        desc = e.get("description", "").strip()
        if desc and desc not in m["descriptions"]:
            m["descriptions"].append(desc)
        m["salience"] = max(m["salience"], e.get("salience", 0.0))
        m["source_chunks"].add(e.get("chunk_id", ""))
        m["source_docs"].add(e.get("doc_id", ""))

        if not m["taiwan_db_key"] and desc:
            tw = extract_tw_key(desc)
            if tw:
                m["taiwan_db_key"] = tw

    return merged


def summarize_description(descriptions: list[str], max_descs: int = 5) -> str:
    unique = list(dict.fromkeys(descriptions))
    if len(unique) <= max_descs:
        return " | ".join(unique)
    selected = unique[:max_descs]
    return " | ".join(selected) + f" (+{len(unique) - max_descs} more)"


def merge_relations(raw: list[dict], entity_lookup: dict[str, str]) -> dict[tuple, dict]:
    merged: dict[tuple, dict] = {}
    for r in raw:
        src = r.get("source", "").strip().lower()
        tgt = r.get("target", "").strip().lower()
        rtype = r.get("type", "UNKNOWN")
        key = (src, tgt, rtype)

        if key not in merged:
            merged[key] = {
                "source": entity_lookup.get(src, r.get("source", "").strip()),
                "target": entity_lookup.get(tgt, r.get("target", "").strip()),
                "type": rtype,
                "descriptions": [],
                "strengths": [],
                "source_chunks": set(),
            }

        m = merged[key]
        desc = r.get("description", "").strip()
        if desc and desc not in m["descriptions"]:
            m["descriptions"].append(desc)
        if r.get("strength"):
            m["strengths"].append(r["strength"])
        m["source_chunks"].add(r.get("chunk_id", ""))

    return merged


def build_graph(entities: dict, relations: dict) -> nx.Graph:
    G = nx.Graph()

    name_lower_to_canonical = {}
    for (name_lower, etype), e in entities.items():
        node_id = e["name"]
        name_lower_to_canonical[name_lower] = node_id
        desc_summary = summarize_description(e["descriptions"])
        G.add_node(
            node_id,
            type=e["type"],
            description=desc_summary,
            salience=round(e["salience"], 2),
            occurrence=len(e["source_chunks"]),
            n_docs=len(e["source_docs"]),
            taiwan_db_key=e["taiwan_db_key"] or "",
        )

    dangling = 0
    for (src_l, tgt_l, rtype), r in relations.items():
        src_node = name_lower_to_canonical.get(src_l)
        tgt_node = name_lower_to_canonical.get(tgt_l)
        if not src_node or not tgt_node:
            dangling += 1
            continue
        if src_node == tgt_node:
            continue

        avg_strength = round(sum(r["strengths"]) / len(r["strengths"]), 1) if r["strengths"] else 5.0
        desc_summary = summarize_description(r["descriptions"])

        if G.has_edge(src_node, tgt_node):
            existing = G[src_node][tgt_node]
            existing["types"] = existing.get("types", "") + ";" + rtype
            existing["description"] = existing.get("description", "") + " | " + desc_summary
            existing["weight"] = max(existing.get("weight", 0), avg_strength)
        else:
            G.add_edge(
                src_node,
                tgt_node,
                types=rtype,
                description=desc_summary,
                weight=avg_strength,
                occurrence=len(r["source_chunks"]),
            )

    if dangling:
        print(f"  ⚠️  {dangling} relations 的 source/target 不在 entity 集合中（跳過）")

    return G


def save_merged_jsonl(entities: dict, relations: dict):
    with open(OUTPUT_ENTITIES, "w") as f:
        for (name_lower, etype), e in sorted(entities.items(), key=lambda x: -len(x[1]["source_chunks"])):
            record = {
                "name": e["name"],
                "type": e["type"],
                "description": summarize_description(e["descriptions"]),
                "salience": round(e["salience"], 2),
                "occurrence": len(e["source_chunks"]),
                "n_docs": len(e["source_docs"]),
                "taiwan_db_key": e["taiwan_db_key"],
            }
            f.write(json.dumps(record, ensure_ascii=False) + "\n")

    with open(OUTPUT_RELATIONS, "w") as f:
        for (src_l, tgt_l, rtype), r in sorted(relations.items(), key=lambda x: -len(x[1]["source_chunks"])):
            avg_str = round(sum(r["strengths"]) / len(r["strengths"]), 1) if r["strengths"] else 5.0
            record = {
                "source": r["source"],
                "target": r["target"],
                "type": r["type"],
                "description": summarize_description(r["descriptions"]),
                "strength": avg_str,
                "occurrence": len(r["source_chunks"]),
            }
            f.write(json.dumps(record, ensure_ascii=False) + "\n")


def main():
    print("Phase 3：子圖合併")
    print("=" * 60)

    print("\n1. 載入 raw entities/relations...")
    raw_ent = load_jsonl(ENTITIES_FILE)
    raw_rel = load_jsonl(RELATIONS_FILE)
    print(f"   Raw entities: {len(raw_ent)}")
    print(f"   Raw relations: {len(raw_rel)}")

    print("\n2. Entity resolution (name + type 合併)...")
    merged_ent = merge_entities(raw_ent)
    print(f"   Merged entities: {len(merged_ent)} (壓縮率 {100 * (1 - len(merged_ent) / len(raw_ent)):.1f}%)")

    from collections import Counter
    type_counts = Counter(e["type"] for e in merged_ent.values())
    for t, c in type_counts.most_common():
        print(f"     {t}: {c}")

    high_occur = [(k, v) for k, v in merged_ent.items() if len(v["source_chunks"]) >= 10]
    print(f"   High-occurrence entities (≥10 chunks): {len(high_occur)}")

    print("\n3. Relation resolution (src + tgt + type 合併)...")
    entity_lookup = {k[0]: v["name"] for k, v in merged_ent.items()}
    merged_rel = merge_relations(raw_rel, entity_lookup)
    print(f"   Merged relations: {len(merged_rel)} (壓縮率 {100 * (1 - len(merged_rel) / len(raw_rel)):.1f}%)")

    print("\n4. 建構 NetworkX graph...")
    G = build_graph(merged_ent, merged_rel)
    print(f"   Nodes: {G.number_of_nodes()}")
    print(f"   Edges: {G.number_of_edges()}")
    print(f"   Connected components: {nx.number_connected_components(G)}")

    isolates = list(nx.isolates(G))
    print(f"   Isolated nodes (no edges): {len(isolates)}")

    degrees = dict(G.degree())
    top_10 = sorted(degrees.items(), key=lambda x: -x[1])[:10]
    print(f"   Top 10 by degree:")
    for name, deg in top_10:
        print(f"     {name} [{G.nodes[name].get('type', '?')}]: degree={deg}")

    print("\n5. 輸出 graph.gml...")
    nx.write_gml(G, str(OUTPUT_GML))
    gml_size = OUTPUT_GML.stat().st_size
    print(f"   {OUTPUT_GML} ({gml_size / 1024:.0f} KB)")

    print("\n6. 輸出 merged JSONL...")
    save_merged_jsonl(merged_ent, merged_rel)
    print(f"   {OUTPUT_ENTITIES} ({OUTPUT_ENTITIES.stat().st_size / 1024:.0f} KB)")
    print(f"   {OUTPUT_RELATIONS} ({OUTPUT_RELATIONS.stat().st_size / 1024:.0f} KB)")

    print("\n" + "=" * 60)
    print("Phase 3 完成！")
    print(f"  {len(raw_ent)} raw entities → {len(merged_ent)} merged nodes")
    print(f"  {len(raw_rel)} raw relations → {merged_rel and len(merged_rel)} merged → {G.number_of_edges()} graph edges")
    print(f"  Graph: {G.number_of_nodes()} nodes, {G.number_of_edges()} edges, {nx.number_connected_components(G)} components")


if __name__ == "__main__":
    main()
