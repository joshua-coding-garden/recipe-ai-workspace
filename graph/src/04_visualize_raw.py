"""Phase 4：原始圖譜視覺化 — pyvis 互動 HTML。

節點大小 = degree，邊粗細 = strength（weight），
顏色按 entity type 分。只視覺化最大 connected component
（完整圖含 1400+ 孤立節點會變成毛球）。
"""
import _paths
import networkx as nx
from pyvis.network import Network
from pathlib import Path

DATA_DIR = _paths.DATA_DIR
VIZ_DIR = _paths.VIZ_DIR
GML_FILE = DATA_DIR / "graph.gml"
OUTPUT_HTML = VIZ_DIR / "04_raw_graph.html"

TYPE_COLORS = {
    "NUTRIENT": "#2ecc71",
    "FOOD": "#e67e22",
    "DISEASE": "#e74c3c",
    "CONCEPT": "#3498db",
    "PERSON": "#9b59b6",
    "ORGANIZATION": "#1abc9c",
}

DEFAULT_COLOR = "#95a5a6"


def main():
    print("Phase 4：原始圖譜視覺化")
    print("=" * 60)

    VIZ_DIR.mkdir(parents=True, exist_ok=True)

    print("\n1. 載入 graph.gml...")
    G = nx.read_gml(str(GML_FILE))
    print(f"   Full graph: {G.number_of_nodes()} nodes, {G.number_of_edges()} edges")

    print("\n2. 取最大 connected component...")
    largest_cc = max(nx.connected_components(G), key=len)
    Gsub = G.subgraph(largest_cc).copy()
    print(f"   Largest CC: {Gsub.number_of_nodes()} nodes, {Gsub.number_of_edges()} edges")

    degrees = dict(Gsub.degree())
    max_deg = max(degrees.values()) if degrees else 1

    print("\n3. 建構 pyvis Network...")
    net = Network(
        height="900px",
        width="100%",
        bgcolor="#1a1a2e",
        font_color="white",
        notebook=False,
        cdn_resources="in_line",
    )

    net.barnes_hut(
        gravity=-8000,
        central_gravity=0.3,
        spring_length=200,
        spring_strength=0.01,
        damping=0.09,
    )

    for node in Gsub.nodes():
        attrs = Gsub.nodes[node]
        etype = attrs.get("type", "UNKNOWN")
        color = TYPE_COLORS.get(etype, DEFAULT_COLOR)
        deg = degrees.get(node, 0)
        size = 8 + 40 * (deg / max_deg)
        salience = attrs.get("salience", 0)
        occurrence = attrs.get("occurrence", 0)
        desc = attrs.get("description", "")
        if len(desc) > 200:
            desc = desc[:200] + "..."
        title = (
            f"<b>{node}</b><br>"
            f"Type: {etype}<br>"
            f"Degree: {deg}<br>"
            f"Salience: {salience}<br>"
            f"Occurrence: {occurrence}<br>"
            f"Description: {desc}"
        )
        label = node if deg >= 10 else ""
        net.add_node(node, label=label, title=title, color=color, size=size)

    for src, tgt, data in Gsub.edges(data=True):
        weight = data.get("weight", 5)
        width = max(0.5, weight / 2)
        rtype = data.get("types", "")
        desc = data.get("description", "")
        if len(desc) > 150:
            desc = desc[:150] + "..."
        title = f"{rtype}<br>Strength: {weight}<br>{desc}"
        net.add_edge(src, tgt, width=width, title=title, color="#555555")

    legend_html = """
    <div style="position:fixed;top:10px;left:10px;background:rgba(0,0,0,0.7);
    padding:12px;border-radius:8px;font-size:13px;color:white;z-index:9999;">
    <b>Entity Types</b><br>
    <span style="color:#2ecc71">● NUTRIENT</span><br>
    <span style="color:#e67e22">● FOOD</span><br>
    <span style="color:#e74c3c">● DISEASE</span><br>
    <span style="color:#3498db">● CONCEPT</span><br>
    <span style="color:#9b59b6">● PERSON</span><br>
    <span style="color:#1abc9c">● ORGANIZATION</span><br>
    <hr style="border-color:#555">
    <b>Nodes: """ + str(Gsub.number_of_nodes()) + """</b><br>
    <b>Edges: """ + str(Gsub.number_of_edges()) + """</b><br>
    <small>Node size = degree<br>Only labels for degree ≥ 10</small>
    </div>
    """

    print("\n4. 輸出 HTML...")
    net.save_graph(str(OUTPUT_HTML))

    with open(OUTPUT_HTML, "r") as f:
        html = f.read()
    html = html.replace("</body>", legend_html + "</body>")
    with open(OUTPUT_HTML, "w") as f:
        f.write(html)

    size_kb = OUTPUT_HTML.stat().st_size / 1024
    print(f"   {OUTPUT_HTML} ({size_kb:.0f} KB)")

    print("\n" + "=" * 60)
    print("Phase 4 完成！用瀏覽器開啟 viz/04_raw_graph.html 查看互動圖譜。")
    print("這是「毛球圖」原型 — 還沒社群著色。")


if __name__ == "__main__":
    main()
