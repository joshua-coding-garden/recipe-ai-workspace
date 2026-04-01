"""
similarity_service.py - 呼叫 backend/ 取前 20 合併候選
中文詞 → /foods/search/zh → taiwan_foods
英文詞 → /foods/search/en → foodb.foods
合併去重後按分數排序取前 limit 名
"""
import asyncio
import httpx
from loguru import logger
from app.config import settings

_TIMEOUT = httpx.Timeout(connect=3.0, read=30.0, write=5.0, pool=3.0)


async def _backend_search(endpoint: str, terms: list[str], limit: int, max_retries: int = 2) -> list[dict]:
    """呼叫 backend/ 的搜尋端點，含指數退避重試。"""
    if not terms:
        return []
    url = f"{settings.backend_url}{endpoint}"
    params = {"terms": ",".join(terms), "limit": limit}
    for attempt in range(max_retries + 1):
        try:
            async with httpx.AsyncClient(timeout=_TIMEOUT) as client:
                resp = await client.get(url, params=params)
                resp.raise_for_status()
                return resp.json().get("candidates", [])
        except Exception as e:
            if attempt < max_retries:
                wait = 0.5 * (2 ** attempt)
                logger.warning(
                    "backend 搜尋失敗 ({} {})，第 {} 次重試，等待 {:.1f}s: {}",
                    endpoint, terms[:2], attempt + 1, wait, e,
                )
                await asyncio.sleep(wait)
                continue
            logger.error("backend 搜尋失敗 ({} {})，已耗盡重試: {}", endpoint, terms[:2], e)
            return []
    return []  # unreachable but satisfies type checker


async def get_exact_candidates(
    zh_terms: list[str],
    en_terms: list[str],
    limit: int = 20,
) -> list[dict]:
    """
    先做精確匹配（中英文），合併去重後回傳。
    """
    zh_task = _backend_search("/foods/search/zh/exact", zh_terms, limit)
    en_task = _backend_search("/foods/search/en/exact", en_terms, limit)
    zh_results, en_results = await asyncio.gather(zh_task, en_task)

    logger.debug(
        "exact_candidates: zh={} 筆, en={} 筆",
        len(zh_results), len(en_results)
    )
    return _merge_candidates(zh_results, en_results, limit)


async def get_char_candidates(
    zh_terms: list[str],
    en_terms: list[str] | None = None,
    limit: int = 20,
) -> list[dict]:
    """
    拆字階段：中文走字元重疊搜尋，同時也搜英文候選以提升召回率。
    """
    tasks = []
    if zh_terms:
        tasks.append(_backend_search("/foods/search/zh", zh_terms, limit))
    if en_terms:
        tasks.append(_backend_search("/foods/search/en", en_terms, limit))
    if not tasks:
        return []
    results = await asyncio.gather(*tasks)
    # 合併所有結果
    all_candidates: list[dict] = []
    for r in results:
        all_candidates.extend(r)
    if len(results) > 1:
        # 去重（以 source:id 為鍵）
        merged = _merge_candidates(
            results[0] if len(results) > 0 else [],
            results[1] if len(results) > 1 else [],
            limit,
        )
        logger.debug("char_candidates: zh={} 筆, en={} 筆, merged={} 筆",
                      len(results[0]), len(results[1]) if len(results) > 1 else 0, len(merged))
        return merged
    logger.debug("char_candidates: zh={} 筆", len(all_candidates))
    return all_candidates[:limit]


async def _backend_search_batch(
    zh_terms: list[str],
    en_terms: list[str],
    limit: int,
) -> tuple[list[dict], list[dict]] | None:
    """
    優先使用 backend 批次端點以降低 round-trip。
    若端點不存在或失敗，回傳 None 供呼叫端 fallback。
    """
    url = f"{settings.backend_url}/foods/search/batch"
    payload = {"zh_terms": zh_terms, "en_terms": en_terms, "limit": limit}
    try:
        async with httpx.AsyncClient(timeout=_TIMEOUT) as client:
            resp = await client.post(url, json=payload)
            # 404 代表後端尚未部署批次端點，視為可預期 fallback
            if resp.status_code == 404:
                logger.debug("batch 搜尋端點不存在，fallback 至雙請求")
                return None
            resp.raise_for_status()
            body = resp.json()
            return body.get("zh_candidates", []), body.get("en_candidates", [])
    except Exception as e:
        logger.warning("batch 搜尋失敗，fallback 至雙請求: {}", e)
        return None


def _merge_candidates(
    zh_candidates: list[dict],
    en_candidates: list[dict],
    limit: int = 20,
) -> list[dict]:
    """合併兩個候選清單，去重（以 source+id 為鍵），按分數排序取前 limit。"""
    merged: dict[str, dict] = {}
    for c in zh_candidates + en_candidates:
        key = f"{c['source']}:{c['id']}"
        if key not in merged or merged[key]["score"] < c["score"]:
            merged[key] = c
    sorted_list = sorted(merged.values(), key=lambda x: x["score"], reverse=True)
    return sorted_list[:limit]


async def get_candidates_separate(
    zh_terms: list[str],
    en_terms: list[str],
    limit: int = 3,
) -> tuple[list[dict], list[dict]]:
    """
    分別回傳台灣候選和 FooDB 候選（不合併），各取前 limit 筆。
    """
    batch_results = await _backend_search_batch(zh_terms, en_terms, limit)
    if batch_results is not None:
        zh_results, en_results = batch_results
    else:
        zh_task = _backend_search("/foods/search/zh", zh_terms, limit)
        en_task = _backend_search("/foods/search/en", en_terms, limit)
        zh_results, en_results = await asyncio.gather(zh_task, en_task)
    return zh_results[:limit], en_results[:limit]


async def get_candidates_separate_exact(
    zh_terms: list[str],
    en_terms: list[str],
    limit: int = 3,
) -> tuple[list[dict], list[dict]]:
    """
    分別回傳台灣候選和 FooDB 候選（精確匹配版本）。
    """
    zh_task = _backend_search("/foods/search/zh/exact", zh_terms, limit)
    en_task = _backend_search("/foods/search/en/exact", en_terms, limit)
    zh_results, en_results = await asyncio.gather(zh_task, en_task)
    return zh_results[:limit], en_results[:limit]


async def get_candidates(
    zh_terms: list[str],
    en_terms: list[str],
    limit: int = 20,
) -> list[dict]:
    """
    同時向 backend/ 發起中英文搜尋，合併回傳前 limit 個候選。
    zh_terms: 中文詞 + 中文同義詞（搜 taiwan_foods）
    en_terms: 英文詞 + 英文同義詞（搜 foodb.foods）
    """
    batch_results = await _backend_search_batch(zh_terms, en_terms, limit)
    if batch_results is not None:
        zh_results, en_results = batch_results
    else:
        zh_task = _backend_search("/foods/search/zh", zh_terms, limit)
        en_task = _backend_search("/foods/search/en", en_terms, limit)
        zh_results, en_results = await asyncio.gather(zh_task, en_task)

    logger.debug(
        "candidates: zh={} 筆, en={} 筆",
        len(zh_results), len(en_results)
    )
    return _merge_candidates(zh_results, en_results, limit)
