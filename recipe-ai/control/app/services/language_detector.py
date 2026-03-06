"""
language_detector.py
用 CJK Unicode 字符佔比偵測語言
  > 30% → "zh"
  < 5%  → "en"
  其他  → "mixed"（以 CJK 佔比為準，超過 15% 視為 zh）
"""


def detect(text: str) -> str:
    """偵測字串語言，回傳 'zh' | 'en' | 'mixed'。"""
    if not text:
        return "en"

    cleaned = text.replace(" ", "")
    if not cleaned:
        return "en"

    cjk_count = sum(
        1 for ch in cleaned
        if "\u4e00" <= ch <= "\u9fff"   # CJK 統一漢字
        or "\u3400" <= ch <= "\u4dbf"   # CJK 擴展 A
        or "\uf900" <= ch <= "\ufaff"   # CJK 相容漢字
    )
    ratio = cjk_count / len(cleaned)

    if ratio > 0.30:
        return "zh"
    elif ratio < 0.05:
        return "en"
    else:
        return "zh" if ratio >= 0.15 else "mixed"


def detect_keyword(keyword: str) -> str:
    """偵測單一關鍵字的語言（較嚴格閾值）。"""
    if not keyword:
        return "en"
    cjk = sum(1 for ch in keyword if "\u4e00" <= ch <= "\u9fff")
    return "zh" if cjk / max(len(keyword), 1) > 0.1 else "en"
