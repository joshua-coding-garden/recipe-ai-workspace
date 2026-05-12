"""
embedding_service.py - 嵌入服務代理
呼叫 health-vector (port 8003) 的 /embed 端點取得向量嵌入。
"""
import httpx
from loguru import logger

_EMBED_URL = "http://localhost:8003/embed"
_TIMEOUT = httpx.Timeout(5.0, connect=2.0)


async def embed(text: str) -> list[float] | None:
    try:
        async with httpx.AsyncClient(timeout=_TIMEOUT) as c:
            resp = await c.post(_EMBED_URL, json={"texts": [text]})
            if resp.status_code == 200:
                data = resp.json()
                embeddings = data.get("embeddings", [])
                if embeddings:
                    return embeddings[0]
    except Exception as e:
        logger.debug("embedding_service unavailable: {}", str(e))
    return None


async def embed_batch(texts: list[str]) -> list[list[float]] | None:
    try:
        async with httpx.AsyncClient(timeout=_TIMEOUT) as c:
            resp = await c.post(_EMBED_URL, json={"texts": texts})
            if resp.status_code == 200:
                return resp.json().get("embeddings", [])
    except Exception as e:
        logger.debug("embedding_service batch unavailable: {}", str(e))
    return None
