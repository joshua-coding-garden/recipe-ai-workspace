"""gemma_search_service.py — 整合點 3：Gemma 資料庫搜尋增強

三個子功能：
1. classify_ingredient — 食材分類（標準中文名、英文名、類別）
2. generate_search_terms — 搜尋詞擴展（補充同義詞表的盲區）
3. verify_match — 灰色地帶匹配驗證（rule_score 0.3~1.05 時才跑）

所有結果都走既有的參數化查詢（text-to-search-parameters），不產生 SQL。
"""
import json
from typing import Any
from loguru import logger
from app.services import gemma_client
from app.services.gemma_client import GemmaUnavailableError, GemmaParseError
from app.config import settings

_CLASSIFY_SYSTEM_PROMPT = """\
You are a food ingredient classifier for a Taiwanese nutrition database.
Given a list of ingredient names, classify each one.

For each ingredient provide:
- canonical_zh: Standard Traditional Chinese food name (as used in Taiwan food databases)
- canonical_en: Standard English food name
- category: Food category (蔬菜類/肉類/海鮮類/蛋類/豆製品/調味料/水果/主食/堅果/乳製品/油脂/加工品)

Respond ONLY with JSON array:
[{"input": "原始名", "canonical_zh": "標準中文", "canonical_en": "english", "category": "類別"}, ...]"""

_SEARCH_TERMS_SYSTEM_PROMPT = """\
You are helping search a Taiwanese food nutrition database.
Given an ingredient name and its classification, generate additional search terms that could match the food in a database.

Include:
- zh_terms: Alternative Chinese names, abbreviations, or colloquial forms (max 5)
- en_terms: Alternative English names (max 3)

Respond ONLY with JSON:
{"zh_terms": ["term1", "term2"], "en_terms": ["term1", "term2"]}"""

_VERIFY_SYSTEM_PROMPT = """\
You are verifying if a database food match is correct.
Given an ingredient name from a recipe and a candidate food from a nutrition database, determine if they refer to the same food.

The database may use formal/scientific names while recipes use colloquial names.
Consider: 雞胸肉 matches 清雞胸肉, but 玉米粉 does NOT match 玉米.

Respond ONLY with JSON:
{"is_correct_match": true, "confidence": 0.9, "reason": "brief reason"}"""


async def classify_ingredients_batch(keywords: list[str]) -> dict[str, dict]:
    """
    批次分類食材。回傳 {keyword: classification} 映射。
    失敗回傳空 dict。
    """
    if not settings.gemma_enabled or not keywords:
        return {}

    try:
        user_content = f"Ingredients to classify:\n{json.dumps(keywords, ensure_ascii=False)}"
        result = await gemma_client.complete_json(
            _CLASSIFY_SYSTEM_PROMPT,
            user_content,
            temperature=0.2,
            max_tokens=max(512, len(keywords) * 120),
            timeout=settings.gemma_search_timeout,
        )
    except (GemmaUnavailableError, GemmaParseError) as e:
        logger.debug("gemma classify batch failed: {}", e)
        return {}

    if not isinstance(result, list):
        return {}

    mapping = {}
    for item in result:
        if isinstance(item, dict) and "input" in item:
            mapping[item["input"]] = item
    return mapping


async def generate_search_terms(
    keyword: str,
    classification: dict | None = None,
) -> dict:
    """
    為單一食材生成擴展搜尋詞。
    回傳 {"zh_terms": [...], "en_terms": [...]}，失敗回傳空 terms。
    """
    if not settings.gemma_enabled:
        return {"zh_terms": [], "en_terms": []}

    try:
        context_parts = [f"Ingredient: {keyword}"]
        if classification:
            context_parts.append(f"Classification: {json.dumps(classification, ensure_ascii=False)}")

        result = await gemma_client.complete_json(
            _SEARCH_TERMS_SYSTEM_PROMPT,
            "\n".join(context_parts),
            temperature=0.2,
            max_tokens=512,
            timeout=settings.gemma_search_timeout,
        )
    except (GemmaUnavailableError, GemmaParseError) as e:
        logger.debug("gemma search terms failed for {}: {}", keyword, e)
        return {"zh_terms": [], "en_terms": []}

    if not isinstance(result, dict):
        return {"zh_terms": [], "en_terms": []}

    zh = result.get("zh_terms", [])
    en = result.get("en_terms", [])

    # 安全上限：避免 Gemma 輸出過多 terms 造成搜尋爆炸
    return {
        "zh_terms": zh[:5] if isinstance(zh, list) else [],
        "en_terms": en[:3] if isinstance(en, list) else [],
    }


async def verify_match(
    keyword: str,
    candidate: dict[str, Any],
) -> dict:
    """
    驗證候選匹配是否正確。只在 rule_score 灰色地帶 (0.3~1.05) 才呼叫。
    回傳 {"is_correct_match": bool, "confidence": float, "reason": str}
    """
    if not settings.gemma_enabled:
        return {"is_correct_match": True, "confidence": 0.5, "reason": "gemma disabled"}

    candidate_name = candidate.get("name", "")
    candidate_source = candidate.get("source", "")

    try:
        user_content = (
            f"Recipe ingredient: {keyword}\n"
            f"Database candidate: {candidate_name} (source: {candidate_source})"
        )
        result = await gemma_client.complete_json(
            _VERIFY_SYSTEM_PROMPT,
            user_content,
            temperature=0.1,
            max_tokens=256,
            timeout=settings.gemma_verification_timeout,
        )
    except (GemmaUnavailableError, GemmaParseError) as e:
        logger.debug("gemma verify match failed for {} vs {}: {}", keyword, candidate_name, e)
        return {"is_correct_match": True, "confidence": 0.5, "reason": "gemma unavailable"}

    if not isinstance(result, dict):
        return {"is_correct_match": True, "confidence": 0.5, "reason": "parse error"}

    return {
        "is_correct_match": bool(result.get("is_correct_match", True)),
        "confidence": float(result.get("confidence", 0.5)),
        "reason": str(result.get("reason", "")),
    }
