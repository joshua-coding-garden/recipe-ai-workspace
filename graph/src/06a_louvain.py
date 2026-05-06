"""Phase 6a：Louvain 社群偵測。

跑 python-louvain 的 community.best_partition，印出社群數、modularity、
每個社群大小、檢查每個社群是否連通。
預期會看到「不連通的社群」—— Leiden 論文要解決的問題。
"""
import _paths
import json
import time
import networkx as nx
import community as community_louvain
from pathlib import Path

DATA_DIR = _paths.DATA_DIR
GML_FILE = DATA_DIR / "graph.gml"
OUTPUT_FILE = DATA_DIR / "communities_louvain.json"


def main():
    print("Phase 6a：Louvain 社群偵測")
    print("=" * 60)

    print("\n1. 載入 graph 最大 connected component...")
    G_full = nx.read_gml(str(GML_FILE))
    largest_cc = max(nx.connected_components(G_full), key=len)
    G = G_full.subgraph(largest_cc).copy()
    print(f"   Nodes: {G.number_of_nodes()}, Edges: {G.number_of_edges()}")

    print("\n2. 跑 Louvain...")
    t0 = time.time()
    partition = community_louvain.best_partition(G, weight="weight", random_state=42)
    elapsed = time.time() - t0
    print(f"   完成，耗時 {elapsed:.2f}s")

    modularity = community_louvain.modularity(partition, G, weight="weight")
    print(f"   Modularity: {modularity:.4f}")

    from collections import Counter
    comm_sizes = Counter(partition.values())
    n_communities = len(comm_sizes)
    print(f"   社群數: {n_communities}")

    sizes = sorted(comm_sizes.values(), reverse=True)
    print(f"   社群大小 (前 20): {sizes[:20]}")
    print(f"   社群大小 (最小 10): {sorted(sizes)[:10]}")

    print("\n3. 檢查每個社群是否內部連通...")
    disconnected = []
    for comm_id in range(n_communities):
        members = [n for n, c in partition.items() if c == comm_id]
        if len(members) <= 1:
            continue
        subg = G.subgraph(members)
        n_comp = nx.number_connected_components(subg)
        if n_comp > 1:
            disconnected.append((comm_id, len(members), n_comp))

    if disconnected:
        print(f"   ⚠️  {len(disconnected)} 個社群內部不連通！")
        for comm_id, size, n_comp in disconnected[:10]:
            print(f"     Community {comm_id}: {size} nodes, {n_comp} components")
    else:
        print("   ✅ 所有社群內部連通")

    print("\n4. 輸出社群分配...")
    output = {
        "method": "louvain",
        "modularity": round(modularity, 4),
        "n_communities": n_communities,
        "elapsed_s": round(elapsed, 2),
        "disconnected_communities": len(disconnected),
        "community_sizes": {str(k): v for k, v in comm_sizes.most_common()},
        "partition": partition,
    }
    with open(OUTPUT_FILE, "w") as f:
        json.dump(output, f, ensure_ascii=False, indent=2)
    print(f"   {OUTPUT_FILE}")

    print("\n5. 社群主要節點（前 10 社群）...")
    for comm_id, size in comm_sizes.most_common(10):
        members = [n for n, c in partition.items() if c == comm_id]
        member_degrees = {m: G.degree(m) for m in members}
        top3 = sorted(member_degrees.items(), key=lambda x: -x[1])[:3]
        top3_str = ", ".join(f"{n}({d})" for n, d in top3)
        print(f"   C{comm_id} ({size} nodes): {top3_str}")

    print("\n" + "=" * 60)
    summary = {
        "modularity": round(modularity, 4),
        "n_communities": n_communities,
        "elapsed_s": round(elapsed, 2),
        "disconnected": len(disconnected),
        "all_connected": len(disconnected) == 0,
    }
    print(f"Louvain 結果: {json.dumps(summary)}")


if __name__ == "__main__":
    main()
