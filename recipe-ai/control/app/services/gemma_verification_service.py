"""gemma_verification_service.py — 整合點 2：搜尋前最終驗證

在使用者確認食材清單、DB lookup 之前，Gemma 做最後一道語意檢查：
- 歧義食材標記（玉米粉 = 太白粉 or 玉米？）
- 重複偵測（蔥 vs 青蔥）
- 標準化建議（台灣食品資料庫常見名稱）

不增不刪食材，只回傳 warnings + 標準化後的清單。
"""
import json
from loguru import logger
from app.services import gemma_client
from app.services.gemma_client import GemmaUnavailableError, GemmaParseError
from app.config import settings

_SYSTEM_PROMPT = """\
You are a food ingredient list validator for a Taiwanese nutrition database lookup system.
Review the following ingredient list and:
1. Flag AMBIGUOUS ingredients with clarifying notes (e.g. 玉米粉 could mean corn starch or corn flour)
2. Flag DUPLICATE ingredients where the same food appears with different names (e.g. 蔥 and 青蔥)
3. Standardize names to common Taiwanese food database names where possible (e.g. 雞胸肉 → 雞胸)

Do NOT add or remove ingredients — only flag issues and suggest standardized names.

Respond ONLY with JSON:
{"verified": ["食材1", "食材2", ...], "warnings": [{"ingredient": "食材名", "note": "說明"}]}

If all ingredients are clear, return: {"verified": [...original list...], "warnings": []}"""


async def verify_ingredient_list(
    ingredients: list[str],
) -> dict:
    """
    Gemma 搜尋前驗證食材清單。

    Returns:
        {
            "verified": ["雞蛋", "醬油", ...],
            "warnings": [{"ingredient": "玉米粉", "note": "可能指太白粉或玉米"}],
            "gemma_available": True/False,
        }
    """
    if not settings.gemma_enabled or not ingredients:
        return {"verified": ingredients, "warnings": [], "gemma_available": False}

    try:
        result = await _call_gemma(ingredients)
    except (GemmaUnavailableError, GemmaParseError) as e:
        logger.info("gemma verification fallback: {}", e)
        return {"verified": ingredients, "warnings": [], "gemma_available": False}

    verified = result.get("verified", ingredients)
    warnings = result.get("warnings", [])

    if not isinstance(verified, list):
        verified = ingredients
    if not isinstance(warnings, list):
        warnings = []

    # 安全閥：warnings 太多可能 hallucination
    if len(warnings) > len(ingredients):
        logger.warning("gemma verification warnings {} exceed ingredient count {}, trimming",
                        len(warnings), len(ingredients))
        warnings = warnings[:len(ingredients)]

    return {"verified": verified, "warnings": warnings, "gemma_available": True}


async def _call_gemma(ingredients: list[str]) -> dict:
    user_content = f"Ingredient list:\n{json.dumps(ingredients, ensure_ascii=False)}"
    result = await gemma_client.complete_json(
        _SYSTEM_PROMPT,
        user_content,
        temperature=0.2,
        max_tokens=1024,
        timeout=settings.gemma_verification_timeout,
    )
    if isinstance(result, list):
        result = {"verified": result, "warnings": []}
    return result
