"""Phase 7 prep：為每個 Leiden 社群準備 context（節點+關係+chunk 片段），
輸出 data/community_contexts.json 供 Claude subagent 寫 report。
"""
import _paths
import json
import networkx as nx
from pathlib import Path
from collections import defaultdict

DATA_DIR = _paths.DATA_DIR
GML_FILE = DATA_DIR / "graph.gml"
LEIDEN_FILE = DATA_DIR / "communities_leiden.json"
ENTITIES_MERGED = DATA_DIR / "entities_merged.jsonl"
RELATIONS_MERGED = DATA_DIR / "relations_merged.jsonl"
CHUNKS_FILE = DATA_DIR / "chunks.jsonl"
OUTPUT = DATA_DIR / "community_contexts.json"

MAX_CHUNKS_PER_COMMUNITY = 15
MAX_CHUNK_TEXT_LEN = 600


def main():
    print("Phase 7 prep：準備社群 context")
    print("=" * 60)

    G = nx.read_gml(str(GML_FILE))

    with open(LEIDEN_FILE) as f:
        leiden = json.load(f)
    partition = leiden["partition"]

    ent_lookup = {}
    with open(ENTITIES_MERGED) as f:
        for line in f:
            line = line.strip()
            if not line:
                continue
            e = json.loads(line)
            ent_lookup[e["name"].lower()] = e

    rels = []
    with open(RELATIONS_MERGED) as f:
        for line in f:
            line = line.strip()
            if not line:
                continue
            rels.append(json.loads(line))

    raw_entities = []
    with open(DATA_DIR / "entities.jsonl") as f:
        for line in f:
            line = line.strip()
            if not line:
                continue
            raw_entities.append(json.loads(line))

    entity_to_chunks = defaultdict(set)
    for e in raw_entities:
        name_lower = e["name"].strip().lower()
        chunk_id = e.get("chunk_id", "")
        if chunk_id:
            entity_to_chunks[name_lower].add(chunk_id)

    chunk_texts = {}
    with open(CHUNKS_FILE) as f:
        for line in f:
            line = line.strip()
            if not line:
                continue
            c = json.loads(line)
            chunk_texts[c["chunk_id"]] = c["text"][:MAX_CHUNK_TEXT_LEN]

    comm_members = defaultdict(list)
    for node, comm in partition.items():
        comm_members[int(comm)].append(node)

    contexts = {}
    for comm_id, members in sorted(comm_members.items()):
        members_lower = {m.lower() for m in members}
        members_set = set(members)

        entities_info = []
        for m in members:
            info = ent_lookup.get(m.lower(), {})
            entities_info.append({
                "name": m,
                "type": info.get("type", "?"),
                "description": info.get("description", "")[:200],
                "occurrence": info.get("occurrence", 0),
                "degree": G.degree(m) if m in G else 0,
            })
        entities_info.sort(key=lambda x: -x["degree"])

        community_rels = []
        for r in rels:
            src_l = r["source"].lower()
            tgt_l = r["target"].lower()
            if src_l in members_lower and tgt_l in members_lower:
                community_rels.append({
                    "source": r["source"],
                    "target": r["target"],
                    "type": r["type"],
                    "description": r.get("description", "")[:150],
                    "strength": r.get("strength", 5),
                })
        community_rels.sort(key=lambda x: -x["strength"])

        relevant_chunks = set()
        for m in members:
            for cid in entity_to_chunks.get(m.lower(), set()):
                relevant_chunks.add(cid)

        sampled_chunks = []
        for cid in sorted(relevant_chunks)[:MAX_CHUNKS_PER_COMMUNITY]:
            text = chunk_texts.get(cid, "")
            if text:
                sampled_chunks.append({"chunk_id": cid, "text": text})

        contexts[str(comm_id)] = {
            "community_id": comm_id,
            "n_members": len(members),
            "top_entities": entities_info[:30],
            "top_relations": community_rels[:40],
            "sample_chunks": sampled_chunks,
        }

        top3 = ", ".join(e["name"] for e in entities_info[:3])
        print(f"  C{comm_id}: {len(members)} nodes, {len(community_rels)} rels, {len(sampled_chunks)} chunks → {top3}")

    with open(OUTPUT, "w") as f:
        json.dump(contexts, f, ensure_ascii=False, indent=2)
    print(f"\n輸出: {OUTPUT} ({OUTPUT.stat().st_size // 1024} KB)")


if __name__ == "__main__":
    main()
