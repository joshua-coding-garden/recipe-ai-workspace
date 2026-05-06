"""GraphRAG Interactive Demo — 四種檢索方法 × Gemma 4 31B 即時問答。

啟動前先跑 llama-server：
  cd ~/llama.cpp && ./build/bin/llama-server \
    -m ~/models/gemma-4-31B-it-Q6_K.gguf \
    -ngl 20 -c 4096 --flash-attn on --jinja \
    --host 0.0.0.0 --port 8080

用法：
  cd /home/aiiauser/JM/0325new/graph
  .venv/bin/python src/demo.py
"""
import _paths
import sys
import json
import time
import importlib
import requests
import networkx as nx
import chromadb
from sentence_transformers import SentenceTransformer

_mod08 = importlib.import_module("08_retrieval_comparison")
method_a_vector_rag = _mod08.method_a_vector_rag
method_b_local_search = _mod08.method_b_local_search
method_c_global_search = _mod08.method_c_global_search
method_d_drift_search = _mod08.method_d_drift_search

DATA_DIR = _paths.DATA_DIR
GML_FILE = DATA_DIR / "graph.gml"
REPORTS_FILE = DATA_DIR / "reports.jsonl"
MODEL_NAME = "Snowflake/snowflake-arctic-embed-l-v2.0"
CHROMA_DIR = str(_paths.CHROMA_DIR)

GEMMA_URL = "http://localhost:8080/v1/chat/completions"
MAX_CONTEXT_CHARS = 10000

SYSTEM_PROMPT = (
    "You are a sports nutrition research assistant. "
    "Answer the user's question based ONLY on the provided context. "
    "If the context doesn't contain enough information, say so. "
    "Be specific, cite evidence from the context, and provide practical "
    "recommendations when applicable. Answer in the same language as the question."
)

METHOD_NAMES = {
    "A": "Traditional Vector RAG",
    "B": "Local Search (GraphRAG)",
    "C": "Global Search (GraphRAG)",
    "D": "Drift Search (GraphRAG)",
}

EXAMPLES = [
    "How does leucine trigger muscle protein synthesis?",
    "What are the major research themes in sports nutrition?",
    "How do omega-3 and antioxidants interact in reducing EIMD?",
    "What is the recommended daily protein intake for athletes?",
    "How does creatine supplementation affect performance?",
]


def check_gemma():
    try:
        r = requests.get("http://localhost:8080/health", timeout=3)
        return r.status_code == 200
    except Exception:
        return False


def call_gemma(query, context):
    ctx = context[:MAX_CONTEXT_CHARS]
    if len(context) > MAX_CONTEXT_CHARS:
        ctx += "\n\n[... context truncated ...]"

    payload = {
        "model": "gemma-4-31b",
        "messages": [
            {"role": "system", "content": SYSTEM_PROMPT},
            {"role": "user", "content": f"Context:\n{ctx}\n\nQuestion: {query}"},
        ],
        "temperature": 0.3,
        "max_tokens": 16384,
        "stream": True,
    }
    r = requests.post(GEMMA_URL, json=payload, stream=True, timeout=600)
    r.raise_for_status()

    full_text = ""
    for line in r.iter_lines():
        line = line.decode("utf-8")
        if line.startswith("data: ") and line != "data: [DONE]":
            try:
                chunk = json.loads(line[6:])
                content = chunk["choices"][0].get("delta", {}).get("content", "")
                if content:
                    print(content, end="", flush=True)
                    full_text += content
            except (json.JSONDecodeError, KeyError, IndexError):
                pass
    print()
    return full_text


def load_resources():
    print("載入嵌入模型（CPU）+ ChromaDB + 知識圖譜...")
    model = SentenceTransformer(MODEL_NAME, trust_remote_code=True, device="cpu")
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

    print(f"  ✓ 嵌入模型: {MODEL_NAME} (CPU)")
    print(f"  ✓ ChromaDB: entities={col_entities.count()}, chunks={col_chunks.count()}, reports={col_reports.count()}")
    print(f"  ✓ 圖: {G.number_of_nodes()} nodes, {G.number_of_edges()} edges")
    return model, col_entities, col_reports, col_chunks, G, report_lookup


def retrieve(method_key, model, col_entities, col_reports, col_chunks, G, report_lookup, query):
    if method_key == "A":
        return method_a_vector_rag(model, col_chunks, query)
    elif method_key == "B":
        return method_b_local_search(model, col_entities, col_chunks, G, report_lookup, query)
    elif method_key == "C":
        return method_c_global_search(model, col_reports, report_lookup, query)
    elif method_key == "D":
        return method_d_drift_search(model, col_reports, col_entities, col_chunks, G, report_lookup, query)


def print_banner():
    print()
    print("=" * 60)
    print("  GraphRAG Interactive Demo")
    print("  四種檢索方法 × Gemma 4 31B")
    print("=" * 60)


def print_help():
    print("\n指令：")
    print("  直接輸入問題     → 跑全部四種方法並排比較")
    print("  A/B/C/D + 問題  → 只跑指定方法（例：B leucine dose）")
    print("  examples         → 顯示範例問題")
    print("  q / quit         → 離開")
    print()
    print("方法說明：")
    print("  A = 傳統 Vector RAG（chunk 向量搜尋 → LLM）")
    print("  B = Local Search（entity 搜尋 → 圖遍歷 → chunk + report → LLM）")
    print("  C = Global Search（社群報告搜尋 → LLM）")
    print("  D = Drift Search（假設答案 → 報告 → 子問題 → 深入 → LLM）")


def main():
    print_banner()

    if not check_gemma():
        print("\n❌ Gemma 4 server 未啟動！請先執行：\n")
        print("  cd ~/llama.cpp && ./build/bin/llama-server \\")
        print("    -m ~/models/gemma-4-31B-it-Q6_K.gguf \\")
        print("    -ngl 20 -c 4096 --flash-attn on --jinja \\")
        print("    --host 0.0.0.0 --port 8080")
        sys.exit(1)

    print("\n✓ Gemma 4 31B server 已連線 (localhost:8080)")
    model, col_entities, col_reports, col_chunks, G, report_lookup = load_resources()
    print_help()

    while True:
        print("─" * 60)
        try:
            user_input = input("🔍 問題: ").strip()
        except (EOFError, KeyboardInterrupt):
            print("\n再見！")
            break

        if not user_input:
            continue
        if user_input.lower() in ("q", "quit", "exit"):
            print("再見！")
            break
        if user_input.lower() == "examples":
            for i, ex in enumerate(EXAMPLES, 1):
                print(f"  {i}. {ex}")
            continue
        if user_input.lower() in ("help", "h", "?"):
            print_help()
            continue

        methods_to_run = ["A", "B", "C", "D"]
        query = user_input
        if len(user_input) > 2 and user_input[0] in "ABCDabcd" and user_input[1] == " ":
            methods_to_run = [user_input[0].upper()]
            query = user_input[2:]

        for mk in methods_to_run:
            print(f"\n{'='*60}")
            print(f"  方法 {mk}: {METHOD_NAMES[mk]}")
            print(f"{'='*60}")

            print("  檢索中...", end=" ", flush=True)
            t0 = time.time()
            result = retrieve(mk, model, col_entities, col_reports, col_chunks, G, report_lookup, query)
            t_ret = time.time() - t0
            ctx_len = len(result["context"])
            n_src = len(result.get("sources", []))
            print(f"✓ ({t_ret:.1f}s, {ctx_len:,} chars, {n_src} sources)")

            if result.get("seed_entities"):
                print(f"  Seed entities: {', '.join(result['seed_entities'][:5])}")
            if result.get("n_neighbors"):
                print(f"  Graph: {result['n_neighbors']} neighbors, {result.get('n_edges', 0)} edges")
            if result.get("n_sub_queries"):
                print(f"  Sub-queries: {result['n_sub_queries']}")

            print(f"\n  Gemma 4 回答 (~0.9 tok/s)：\n")
            t0 = time.time()
            answer = call_gemma(query, result["context"])
            t_llm = time.time() - t0
            n_tokens = len(answer) // 4
            speed = n_tokens / t_llm if t_llm > 0 else 0
            print(f"  ⏱ {t_llm:.0f}s (~{speed:.1f} tok/s)")

        if len(methods_to_run) > 1:
            print(f"\n{'='*60}")
            print("  四種方法回答完成。比較重點：")
            print("  A (Vector RAG) — 只看文字片段相似度，沒有結構資訊")
            print("  B (Local)      — 精準定位 entity 再展開鄰居，適合細節問題")
            print("  C (Global)     — 社群報告全局鳥瞰，適合總結性問題")
            print("  D (Drift)      — 多輪子問題深入，適合多跳推理")
            print(f"{'='*60}")


if __name__ == "__main__":
    main()
