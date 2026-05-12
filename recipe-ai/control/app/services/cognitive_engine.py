"""
cognitive_engine.py - 認知重建引擎 (CRE)
規則優先提取事實三元組，LLM fallback。
"""
from __future__ import annotations

import re
from loguru import logger


_AGE_RE = re.compile(r"(\d{1,3})\s*歲")
_GENDER_RE = re.compile(r"(男性?|女性?|male|female)", re.IGNORECASE)
_ALLERGY_RE = re.compile(r"過敏.*?[：:]?\s*([^，。、\n]+)")
_DIET_KW = re.compile(r"(素食|全素|蛋奶素|奶蛋素|無麩質|低碳|生酮|地中海飲食|得舒飲食|低鈉|低脂|高蛋白)")
_WEIGHT_RE = re.compile(r"(\d{2,3}(?:\.\d)?)\s*(?:公斤|kg)", re.IGNORECASE)
_HEIGHT_RE = re.compile(r"(\d{2,3}(?:\.\d)?)\s*(?:公分|cm)", re.IGNORECASE)
_PREGNANT_RE = re.compile(r"(懷孕|孕期|孕婦|哺乳)")
_DISEASE_RE = re.compile(r"(糖尿病|高血壓|高血脂|痛風|腎臟病|心臟病|貧血|骨質疏鬆)")


def extract_facts(user_msg: str, ai_reply: str = "",
                  tool_results: list[dict] | None = None) -> list[dict]:
    """從對話中規則提取事實三元組。回傳 [{subject, predicate, object, confidence}]"""
    facts: list[dict] = []
    combined = f"{user_msg} {ai_reply}"

    m = _AGE_RE.search(user_msg)
    if m:
        age = int(m.group(1))
        if 1 <= age <= 120:
            facts.append({"subject": "使用者", "predicate": "年齡", "object": str(age), "confidence": 1.0})

    m = _GENDER_RE.search(user_msg)
    if m:
        raw = m.group(1).lower()
        gender = "男" if raw.startswith("男") or raw == "male" else "女"
        facts.append({"subject": "使用者", "predicate": "性別", "object": gender, "confidence": 1.0})

    m = _ALLERGY_RE.search(user_msg)
    if m:
        allergen = m.group(1).strip()
        if 1 < len(allergen) <= 20:
            facts.append({"subject": "使用者", "predicate": "過敏", "object": allergen, "confidence": 0.9})

    for m in _DIET_KW.finditer(user_msg):
        facts.append({"subject": "使用者", "predicate": "飲食偏好", "object": m.group(1), "confidence": 0.8})

    m = _WEIGHT_RE.search(user_msg)
    if m:
        facts.append({"subject": "使用者", "predicate": "體重", "object": f"{m.group(1)}kg", "confidence": 1.0})

    m = _HEIGHT_RE.search(user_msg)
    if m:
        facts.append({"subject": "使用者", "predicate": "身高", "object": f"{m.group(1)}cm", "confidence": 1.0})

    m = _PREGNANT_RE.search(user_msg)
    if m:
        facts.append({"subject": "使用者", "predicate": "特殊狀態", "object": m.group(1), "confidence": 0.9})

    for m in _DISEASE_RE.finditer(user_msg):
        facts.append({"subject": "使用者", "predicate": "健康狀況", "object": m.group(1), "confidence": 0.8})

    if tool_results:
        for tr in tool_results:
            if tr.get("tool") == "get_user_profile" and "error" not in tr.get("result", {}):
                profile = tr["result"]
                if profile.get("age"):
                    facts.append({"subject": "使用者", "predicate": "年齡", "object": str(profile["age"]), "confidence": 1.0})
                if profile.get("gender"):
                    facts.append({"subject": "使用者", "predicate": "性別", "object": profile["gender"], "confidence": 1.0})

    seen = set()
    unique = []
    for f in facts:
        key = (f["subject"], f["predicate"], f["object"])
        if key not in seen:
            seen.add(key)
            unique.append(f)
    return unique


def reconstruct_context(facts: list[dict], token_budget: int = 200) -> str:
    """從事實列表建構 provider 無關的上下文字串。"""
    if not facts:
        return ""
    lines = []
    budget = token_budget
    for f in facts:
        if budget <= 0:
            break
        line = f"- {f['subject']}的{f['predicate']}：{f['object']}"
        if f.get("confidence", 1.0) < 0.8:
            line += "（待確認）"
        lines.append(line)
        budget -= len(line) // 3
    return "使用者已知資訊：\n" + "\n".join(lines)
