"""生成 viz/graph_data.json 供 interactive_graph.html 載入。

輸出兩層：
  core: 最大連通分量（LCC）的節點 + 邊（與 06_louvain.html 一致）
  extra: LCC 外的小連通分量 / 孤島（搜尋命中時動態加入）
"""
import _paths
import json
import networkx as nx

GML_FILE = _paths.DATA_DIR / "graph.gml"
LEIDEN_FILE = _paths.DATA_DIR / "communities_leiden.json"
OUTPUT = _paths.VIZ_DIR / "graph_data.json"


def node_record(G, n, attr, partition):
    return {
        "id": n,
        "type": attr.get("type", "UNKNOWN"),
        "degree": G.degree(n),
        "community": partition.get(n, -1),
        "description": (attr.get("description", "") or "")[:300],
        "salience": round(float(attr.get("salience", 0)), 2),
        "occurrence": int(attr.get("occurrence", 0)),
    }


def main():
    G = nx.read_gml(str(GML_FILE))

    partition = {}
    if LEIDEN_FILE.exists():
        with open(LEIDEN_FILE) as f:
            leiden = json.load(f)
        partition = leiden.get("partition", {})

    degrees = dict(G.degree())
    max_degree = max(degrees.values()) if degrees else 1

    lcc_nodes = max(nx.connected_components(G.to_undirected() if G.is_directed() else G), key=len)
    print(f"Largest connected component: {len(lcc_nodes)} nodes")

    core_nodes = []
    extra_nodes = []
    for n, attr in G.nodes(data=True):
        rec = node_record(G, n, attr, partition)
        if n in lcc_nodes:
            core_nodes.append(rec)
        else:
            extra_nodes.append(rec)

    core_edges = []
    extra_edges = []
    for u, v, attr in G.edges(data=True):
        rec = {
            "source": u,
            "target": v,
            "types": attr.get("types", ""),
            "weight": round(float(attr.get("strength", attr.get("weight", 5))), 1),
            "description": (attr.get("description", "") or "")[:150],
        }
        if u in lcc_nodes and v in lcc_nodes:
            core_edges.append(rec)
        else:
            extra_edges.append(rec)

    data = {
        "core": {"nodes": core_nodes, "edges": core_edges},
        "extra": {"nodes": extra_nodes, "edges": extra_edges},
        "maxDegree": max_degree,
        "totalNodes": len(core_nodes) + len(extra_nodes),
        "totalEdges": len(core_edges) + len(extra_edges),
    }

    json_str = json.dumps(data, ensure_ascii=False)

    with open(OUTPUT, "w") as f:
        f.write(json_str)

    html_path = _paths.VIZ_DIR / "interactive_graph.html"
    if html_path.exists():
        html = html_path.read_text()
        tag_start = html.find('<script id="graph-data" type="application/json">')
        tag_end = html.find('</script>', tag_start)
        if tag_start != -1 and tag_end != -1:
            before = html[:tag_start + len('<script id="graph-data" type="application/json">\n')]
            after = html[tag_end:]
            html_path.write_text(before + json_str + "\n" + after)
            print(f"Embedded into interactive_graph.html ({html_path.stat().st_size // 1024} KB)")

    print(f"Core (LCC): {len(core_nodes)} nodes, {len(core_edges)} edges")
    print(f"Extra: {len(extra_nodes)} nodes, {len(extra_edges)} edges")
    print(f"Total: {data['totalNodes']} nodes, {data['totalEdges']} edges, maxDegree={max_degree}")
    print(f"File: {OUTPUT} ({OUTPUT.stat().st_size // 1024} KB)")


if __name__ == "__main__":
    main()
