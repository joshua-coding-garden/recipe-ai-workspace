"""Phase 6b：Leiden 社群偵測。

跑 leidenalg.find_partition 用 RBConfigurationVertexPartition（CPM），
印同樣指標。預期 modularity 略高、社群保證連通、執行更快。
"""
import _paths
import json
import time
import networkx as nx
import igraph as ig
import leidenalg
from pathlib import Path

DATA_DIR = _paths.DATA_DIR
GML_FILE = DATA_DIR / "graph.gml"
OUTPUT_FILE = DATA_DIR / "communities_leiden.json"


def nx_to_igraph(G_nx: nx.Graph) -> tuple[ig.Graph, list[str]]:
    node_list = list(G_nx.nodes())
    node_idx = {n: i for i, n in enumerate(node_list)}
    edges = [(node_idx[u], node_idx[v]) for u, v in G_nx.edges()]
    weights = [G_nx[u][v].get("weight", 1.0) for u, v in G_nx.edges()]
    G_ig = ig.Graph(n=len(node_list), edges=edges, directed=False)
    G_ig.es["weight"] = weights
    G_ig.vs["name"] = node_list
    for attr in ["type", "description", "salience", "occurrence"]:
        G_ig.vs[attr] = [G_nx.nodes[n].get(attr, "") for n in node_list]
    return G_ig, node_list


def main():
    print("Phase 6b：Leiden 社群偵測")
    print("=" * 60)

    print("\n1. 載入 graph 最大 connected component...")
    G_full = nx.read_gml(str(GML_FILE))
    largest_cc = max(nx.connected_components(G_full), key=len)
    G_nx = G_full.subgraph(largest_cc).copy()
    print(f"   Nodes: {G_nx.number_of_nodes()}, Edges: {G_nx.number_of_edges()}")

    print("\n2. 轉換為 igraph...")
    G_ig, node_list = nx_to_igraph(G_nx)
    print(f"   igraph: {G_ig.vcount()} vertices, {G_ig.ecount()} edges")

    print("\n3. 跑 Leiden (RBConfigurationVertexPartition)...")
    t0 = time.time()
    partition = leidenalg.find_partition(
        G_ig,
        leidenalg.RBConfigurationVertexPartition,
        weights="weight",
        seed=42,
    )
    elapsed = time.time() - t0
    print(f"   完成，耗時 {elapsed:.2f}s")

    modularity = partition.modularity
    print(f"   Modularity: {modularity:.4f}")

    n_communities = len(partition)
    print(f"   社群數: {n_communities}")

    sizes = sorted([len(c) for c in partition], reverse=True)
    print(f"   社群大小 (前 20): {sizes[:20]}")
    print(f"   社群大小 (最小 10): {sorted(sizes)[:10]}")

    print("\n4. 檢查每個社群是否內部連通...")
    disconnected = []
    for i, members_idx in enumerate(partition):
        if len(members_idx) <= 1:
            continue
        subg = G_ig.subgraph(members_idx)
        if not subg.is_connected():
            n_comp = len(subg.connected_components())
            disconnected.append((i, len(members_idx), n_comp))

    if disconnected:
        print(f"   ⚠️  {len(disconnected)} 個社群內部不連通！")
        for comm_id, size, n_comp in disconnected[:10]:
            print(f"     Community {comm_id}: {size} nodes, {n_comp} components")
    else:
        print("   ✅ 所有社群內部連通（Leiden 保證）")

    print("\n5. 輸出社群分配...")
    node_to_comm = {}
    comm_sizes = {}
    for i, members_idx in enumerate(partition):
        comm_sizes[str(i)] = len(members_idx)
        for idx in members_idx:
            node_to_comm[node_list[idx]] = i

    output = {
        "method": "leiden",
        "modularity": round(modularity, 4),
        "n_communities": n_communities,
        "elapsed_s": round(elapsed, 2),
        "disconnected_communities": len(disconnected),
        "community_sizes": dict(sorted(comm_sizes.items(), key=lambda x: -x[1])),
        "partition": node_to_comm,
    }
    with open(OUTPUT_FILE, "w") as f:
        json.dump(output, f, ensure_ascii=False, indent=2)
    print(f"   {OUTPUT_FILE}")

    print("\n6. 社群主要節點（前 10 社群）...")
    comm_members = {}
    for node, comm in node_to_comm.items():
        comm_members.setdefault(comm, []).append(node)

    from collections import Counter
    size_counter = Counter({c: len(m) for c, m in comm_members.items()})
    for comm_id, size in size_counter.most_common(10):
        members = comm_members[comm_id]
        member_degrees = {m: G_nx.degree(m) for m in members}
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
    print(f"Leiden 結果: {json.dumps(summary)}")


if __name__ == "__main__":
    main()
