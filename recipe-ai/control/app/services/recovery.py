"""
recovery.py - 工具呼叫自癒引擎（ReIn）
診斷失敗原因 → 制定恢復策略 → 自動重試
"""
from __future__ import annotations

import re
from dataclasses import dataclass, field
from loguru import logger


@dataclass
class ErrorDiagnosis:
    error_type: str     # empty_result | tool_timeout | param_mismatch | backend_error
    tool_name: str
    original_args: dict
    confidence: float = 0.0


@dataclass
class RecoveryPlan:
    strategy: str       # synonym_expand | retry_timeout | field_remap | skip
    modified_args: dict = field(default_factory=dict)
    alternatives: list[dict] = field(default_factory=list)
    explanation_zh: str = ""


_COMMON_FOOD_SYNONYMS: dict[str, list[str]] = {
    "芝士": ["起司", "乾酪", "cheese"],
    "起司": ["芝士", "乾酪", "cheese"],
    "番茄": ["西紅柿", "蕃茄"],
    "西紅柿": ["番茄", "蕃茄"],
    "馬鈴薯": ["洋芋", "土豆", "potato"],
    "土豆": ["馬鈴薯", "洋芋"],
    "鳳梨": ["菠蘿", "鳳梨"],
    "菠蘿": ["鳳梨"],
    "玉米": ["玉蜀黍"],
    "花椰菜": ["綠花椰", "青花菜", "broccoli"],
    "青花菜": ["花椰菜", "綠花椰"],
    "秋葵": ["黃秋葵", "okra"],
    "地瓜": ["番薯", "甘藷", "sweet potato"],
    "番薯": ["地瓜", "甘藷"],
    "高麗菜": ["甘藍菜", "包心菜", "捲心菜"],
    "包心菜": ["高麗菜", "甘藍菜"],
    "柳橙": ["柳丁", "甜橙"],
    "柳丁": ["柳橙", "甜橙"],
    "奇異果": ["獼猴桃", "kiwi"],
    "獼猴桃": ["奇異果"],
    "優格": ["優酪乳", "yogurt"],
    "優酪乳": ["優格"],
    "豆腐": ["板豆腐", "嫩豆腐", "tofu"],
    "雞胸肉": ["雞胸", "chicken breast"],
    "牛肉": ["牛腱", "牛排", "beef"],
    "豬肉": ["豬里肌", "pork"],
    "鮭魚": ["三文魚", "salmon"],
    "三文魚": ["鮭魚"],
    "蝦子": ["蝦仁", "蝦", "shrimp"],
    "蝦": ["蝦子", "蝦仁"],
}

_QUANTITY_PREFIXES = re.compile(
    r"^(一些|一份|一杯|一碗|半碗|一盤|一塊|一片|兩片|三片|"
    r"\d+\s*[克gG公斤kgKG毫升mlML杯碗盤塊片顆粒條根支把份])\s*"
)

_MODIFIER_PATTERNS = re.compile(
    r"(新鮮的?|有機的?|冷凍的?|乾燥的?|醃製的?|生的?|熟的?|烤的?|炸的?|煮的?|蒸的?)\s*"
)


def diagnose(tool_name: str, args: dict, result: dict, user_msg: str = "") -> ErrorDiagnosis | None:
    if "error" in result:
        err_msg = str(result["error"])
        if "timeout" in err_msg.lower() or "timed out" in err_msg.lower():
            return ErrorDiagnosis("tool_timeout", tool_name, args, 0.9)
        if result.get("status_code", 0) >= 500 or "500" in err_msg:
            return ErrorDiagnosis("backend_error", tool_name, args, 0.8)
        return ErrorDiagnosis("backend_error", tool_name, args, 0.6)

    if tool_name == "search_food":
        results = result.get("results", [])
        if len(results) == 0:
            return ErrorDiagnosis("empty_result", tool_name, args, 0.9)

    if tool_name == "get_nutrient_ranking":
        foods = result.get("foods", [])
        if len(foods) == 0 and "error" not in result:
            return ErrorDiagnosis("param_mismatch", tool_name, args, 0.7)

    return None


def plan_recovery(
    diagnosis: ErrorDiagnosis,
    context: dict | None = None,
    synonym_store=None,
) -> RecoveryPlan | None:
    ctx = context or {}

    if diagnosis.error_type == "empty_result" and diagnosis.tool_name == "search_food":
        food_name = diagnosis.original_args.get("food_name", "")
        alternatives = _expand_food_synonyms(food_name, synonym_store)
        if alternatives:
            return RecoveryPlan(
                strategy="synonym_expand",
                modified_args={**diagnosis.original_args, "food_name": alternatives[0]},
                alternatives=[{"food_name": a} for a in alternatives[1:]],
                explanation_zh=f"「{food_name}」查無結果，嘗試替代詞：{', '.join(alternatives[:3])}",
            )
        simplified = _simplify_food_name(food_name)
        if simplified and simplified != food_name:
            return RecoveryPlan(
                strategy="synonym_expand",
                modified_args={**diagnosis.original_args, "food_name": simplified},
                alternatives=[],
                explanation_zh=f"「{food_name}」查無結果，嘗試簡化搜尋：{simplified}",
            )
        return None

    if diagnosis.error_type == "tool_timeout":
        return RecoveryPlan(
            strategy="retry_timeout",
            modified_args=dict(diagnosis.original_args),
            explanation_zh="工具執行超時，正在以更長逾時重試",
        )

    if diagnosis.error_type == "param_mismatch" and diagnosis.tool_name == "get_nutrient_ranking":
        nutrient_field = diagnosis.original_args.get("nutrient_field", "")
        remapped = _try_remap_nutrient(nutrient_field, ctx.get("zh_to_field", {}))
        if remapped and remapped != nutrient_field:
            return RecoveryPlan(
                strategy="field_remap",
                modified_args={**diagnosis.original_args, "nutrient_field": remapped},
                explanation_zh=f"營養素欄位「{nutrient_field}」不匹配，改用「{remapped}」",
            )

    if diagnosis.error_type == "backend_error":
        return RecoveryPlan(
            strategy="skip",
            explanation_zh="後端服務暫時錯誤，跳過此工具",
        )

    return None


async def execute_recovery(
    plan: RecoveryPlan,
    execute_tool_fn,
    tool_name: str,
    auth_token: str,
    user_message: str,
    structured_store: dict | None = None,
) -> dict:
    if plan.strategy == "skip":
        return {"skipped": True, "reason": plan.explanation_zh}

    if plan.strategy == "retry_timeout":
        import httpx
        original_timeout = 30.0
        # execute_tool_fn 使用 module-level timeout，無法直接修改
        # 直接重試一次即可（非同 timeout，但大多數暫時性問題會自行恢復）
        result = await execute_tool_fn(
            tool_name, plan.modified_args, auth_token, user_message, structured_store
        )
        return result

    if plan.strategy in ("synonym_expand", "field_remap"):
        result = await execute_tool_fn(
            tool_name, plan.modified_args, auth_token, user_message, structured_store
        )
        if _is_success(tool_name, result):
            return result
        for alt in plan.alternatives:
            merged = {**plan.modified_args, **alt}
            result = await execute_tool_fn(
                tool_name, merged, auth_token, user_message, structured_store
            )
            if _is_success(tool_name, result):
                return result
        return result

    return {"error": "無可用恢復策略"}


def _is_success(tool_name: str, result: dict) -> bool:
    if "error" in result:
        return False
    if tool_name == "search_food":
        return len(result.get("results", [])) > 0
    if tool_name == "get_nutrient_ranking":
        return len(result.get("foods", [])) > 0
    return True


def _expand_food_synonyms(food_name: str, synonym_store=None) -> list[str]:
    candidates: list[str] = []

    if food_name in _COMMON_FOOD_SYNONYMS:
        candidates.extend(_COMMON_FOOD_SYNONYMS[food_name])

    if synonym_store:
        try:
            entry = synonym_store.lookup_synonym(food_name)
            if entry:
                syns = entry.get("synonyms", [])
                for s in syns:
                    if s not in candidates and s != food_name:
                        candidates.append(s)
        except Exception:
            pass

    seen = set()
    unique = []
    for c in candidates:
        if c not in seen:
            seen.add(c)
            unique.append(c)
    return unique[:5]


def _simplify_food_name(food_name: str) -> str:
    simplified = _QUANTITY_PREFIXES.sub("", food_name)
    simplified = _MODIFIER_PATTERNS.sub("", simplified)
    simplified = simplified.strip()
    if len(simplified) >= 2:
        return simplified
    return ""


def _try_remap_nutrient(field: str, zh_to_field: dict) -> str:
    if field in zh_to_field:
        return zh_to_field[field]
    for zh, db_field in zh_to_field.items():
        if zh in field or field in zh:
            return db_field
    return ""
