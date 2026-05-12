"""
manual_rag_service.py - 系統說明書 Mini-RAG

啟動時把 system_manual.md 按「## 功能X」切成 chunk，
預算 embedding 長期存在 resources/manual_embeddings.json，
查詢時用 cosine similarity 回傳 top-K 最相關段落。
"""
import json
import math
import pathlib
import re
from loguru import logger

_RESOURCES = pathlib.Path(__file__).resolve().parent.parent.parent / "resources"
_MANUAL_PATH = _RESOURCES / "system_manual.md"
_EMBED_PATH = _RESOURCES / "manual_embeddings.json"

_chunks: list[dict] = []
_embeddings: list[list[float]] = []
_initialized: bool = False


def _split_manual(text: str) -> list[dict]:
    parts = re.split(r"(?=^## 功能)", text, flags=re.MULTILINE)
    chunks = []
    for part in parts:
        part = part.strip()
        if not part or not part.startswith("## 功能"):
            continue
        title_match = re.match(r"## (功能[^：:]+[：:]?\s*.*)", part)
        title = title_match.group(1).strip() if title_match else part[:40]
        chunks.append({"title": title, "text": part})
    return chunks


def _cosine_sim(a: list[float], b: list[float]) -> float:
    dot = sum(x * y for x, y in zip(a, b))
    norm_a = math.sqrt(sum(x * x for x in a))
    norm_b = math.sqrt(sum(x * x for x in b))
    if norm_a == 0 or norm_b == 0:
        return 0.0
    return dot / (norm_a * norm_b)


async def initialize():
    """啟動時呼叫一次。讀 chunk + 載入/計算 embedding。"""
    global _chunks, _embeddings, _initialized

    if not _MANUAL_PATH.exists():
        logger.warning("manual_rag: system_manual.md not found")
        return

    text = _MANUAL_PATH.read_text(encoding="utf-8")
    _chunks = _split_manual(text)
    if not _chunks:
        logger.warning("manual_rag: no chunks extracted")
        return

    if _EMBED_PATH.exists():
        try:
            cached = json.loads(_EMBED_PATH.read_text(encoding="utf-8"))
            cached_titles = [c.get("title") for c in cached.get("chunks", [])]
            current_titles = [c["title"] for c in _chunks]
            if cached_titles == current_titles and cached.get("embeddings"):
                _embeddings = cached["embeddings"]
                _initialized = True
                logger.info("manual_rag: loaded {} cached embeddings", len(_embeddings))
                return
        except Exception as e:
            logger.warning("manual_rag: cache load failed: {}", e)

    await _compute_and_save_embeddings()


async def _compute_and_save_embeddings():
    global _embeddings, _initialized

    from app.services.embedding_service import embed_batch

    texts = [c["text"][:2000] for c in _chunks]
    result = await embed_batch(texts)
    if not result or len(result) != len(_chunks):
        logger.error("manual_rag: embedding failed (got {} for {} chunks)",
                     len(result) if result else 0, len(_chunks))
        return

    _embeddings = result
    _initialized = True

    cache = {
        "chunks": [{"title": c["title"]} for c in _chunks],
        "embeddings": _embeddings,
    }
    try:
        _EMBED_PATH.write_text(json.dumps(cache, ensure_ascii=False), encoding="utf-8")
        logger.info("manual_rag: saved {} embeddings to cache", len(_embeddings))
    except Exception as e:
        logger.warning("manual_rag: cache save failed: {}", e)


async def retrieve(query: str, top_k: int = 2) -> list[dict]:
    """回傳 top-K 最相關的說明書段落。"""
    if not _initialized or not _chunks:
        return []

    from app.services.embedding_service import embed as _embed

    query_emb = await _embed(query)
    if not query_emb:
        return []

    scored = []
    for i, emb in enumerate(_embeddings):
        sim = _cosine_sim(query_emb, emb)
        scored.append((sim, i))
    scored.sort(reverse=True)

    results = []
    for sim, idx in scored[:top_k]:
        results.append({
            "title": _chunks[idx]["title"],
            "text": _chunks[idx]["text"],
            "score": round(sim, 4),
        })
    return results


def get_all_chunks() -> list[dict]:
    """回傳所有 chunk（除錯/測試用）。"""
    return list(_chunks)


def is_ready() -> bool:
    return _initialized
