"""Phase 5：節點嵌入 — sentence-transformers 對 entity name+description 嵌入，存入 ChromaDB。

為什麼不直接嵌 chunk？entity-level embedding 把同一概念跨 chunk 的語義集中到
單一向量，讓 Local Search 能精確定位到圖上的「起始節點」再做圖遍歷。

模型：paraphrase-multilingual-MiniLM-L12-v2（計畫.md 指定）
"""
import _paths
import json
import chromadb
from sentence_transformers import SentenceTransformer
from pathlib import Path

DATA_DIR = _paths.DATA_DIR
CHROMA_DIR = _paths.CHROMA_DIR
ENTITIES_MERGED = DATA_DIR / "entities_merged.jsonl"
COLLECTION_NAME = "entities"
MODEL_NAME = "Snowflake/snowflake-arctic-embed-l-v2.0"
BATCH_SIZE = 256


def load_entities(path: Path) -> list[dict]:
    records = []
    with open(path) as f:
        for line in f:
            line = line.strip()
            if not line:
                continue
            records.append(json.loads(line))
    return records


def main():
    print("Phase 5：節點嵌入")
    print("=" * 60)

    print(f"\n1. 載入 merged entities...")
    entities = load_entities(ENTITIES_MERGED)
    print(f"   {len(entities)} entities")

    print(f"\n2. 載入嵌入模型 {MODEL_NAME}...")
    model = SentenceTransformer(MODEL_NAME)
    print(f"   Embedding dimension: {model.get_sentence_embedding_dimension()}")

    print(f"\n3. 準備嵌入文本...")
    texts = []
    ids = []
    metadatas = []
    for i, e in enumerate(entities):
        name = e["name"]
        desc = e.get("description", "")
        if len(desc) > 500:
            desc = desc[:500]
        text = f"{name}: {desc}" if desc else name
        texts.append(text)
        ids.append(f"ent_{i:04d}")
        metadatas.append({
            "name": name,
            "type": e.get("type", "UNKNOWN"),
            "salience": float(e.get("salience", 0)),
            "occurrence": int(e.get("occurrence", 0)),
            "n_docs": int(e.get("n_docs", 0)),
            "taiwan_db_key": e.get("taiwan_db_key") or "",
        })

    print(f"   {len(texts)} texts ready")

    print(f"\n4. 批次嵌入...")
    all_embeddings = []
    for start in range(0, len(texts), BATCH_SIZE):
        end = min(start + BATCH_SIZE, len(texts))
        batch = texts[start:end]
        embeddings = model.encode(batch, show_progress_bar=False, normalize_embeddings=True)
        all_embeddings.extend(embeddings.tolist())
        print(f"   Embedded {end}/{len(texts)}")

    print(f"\n5. 寫入 ChromaDB...")
    CHROMA_DIR.mkdir(parents=True, exist_ok=True)
    client = chromadb.PersistentClient(path=str(CHROMA_DIR))

    existing = [c.name for c in client.list_collections()]
    if COLLECTION_NAME in existing:
        client.delete_collection(COLLECTION_NAME)
        print(f"   Deleted existing collection '{COLLECTION_NAME}'")

    collection = client.create_collection(
        name=COLLECTION_NAME,
        metadata={"hnsw:space": "cosine"},
    )

    for start in range(0, len(ids), BATCH_SIZE):
        end = min(start + BATCH_SIZE, len(ids))
        collection.add(
            ids=ids[start:end],
            embeddings=all_embeddings[start:end],
            documents=texts[start:end],
            metadatas=metadatas[start:end],
        )
        print(f"   Inserted {end}/{len(ids)}")

    print(f"\n6. 驗證...")
    count = collection.count()
    print(f"   Collection '{COLLECTION_NAME}' count: {count}")

    test_query = "protein intake for muscle recovery"
    results = collection.query(query_embeddings=[model.encode(test_query, normalize_embeddings=True).tolist()], n_results=5)
    print(f"\n   Test query: '{test_query}'")
    print(f"   Top 5 results:")
    for doc, meta, dist in zip(results["documents"][0], results["metadatas"][0], results["distances"][0]):
        print(f"     {meta['name']} [{meta['type']}] (dist={dist:.3f})")

    print("\n" + "=" * 60)
    print(f"Phase 5 完成！{count} entities 已嵌入到 ChromaDB collection '{COLLECTION_NAME}'")


if __name__ == "__main__":
    main()
