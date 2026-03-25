"""
ai_service.py - 食譜食材提取服務（純規則解析）
  - extract_keywords         : 從食譜文字提取食材關鍵字
  - extract_keywords_with_amounts : 從食譜文字提取食材關鍵字 + 用量
  - select_best_match        : 從候選中選最佳匹配
"""
import json
import re
import os as _os
import pathlib as _pathlib
from loguru import logger

_DICT_PATH = _pathlib.Path(__file__).resolve().parents[2] / "resources" / "amount_dictionary.json"
try:
    _AMOUNT_DICT = json.loads(_DICT_PATH.read_text(encoding="utf-8"))
except Exception:
    _AMOUNT_DICT = {"vague_terms": {}, "unit_aliases": {}, "unit_to_ml": {}, "unit_to_g": {}}


def _is_processed_variant(keyword: str, candidate_name: str) -> bool:
    lowered = candidate_name.lower()
    processed_tokens = [
        "粉",
        "醬",
        "汁",
        "湯",
        "罐頭",
        "泡麵",
        "調味",
        "濃縮",
        "noodle",
        "sauce",
        "powder",
        "soup",
        "seasoning",
        "instant",
    ]
    if any(token in candidate_name or token in lowered for token in processed_tokens):
        return True
    return False


def _is_mainly_chinese(text: str) -> bool:
    """判斷文字是否主要為中文（CJK 字元佔比 > 15%）。"""
    if not text:
        return False
    cjk = sum(1 for c in text if '\u4e00' <= c <= '\u9fff')
    return cjk > len(text) * 0.15


def _clean_recipe_text(raw_text: str) -> str:
    """
    預處理食譜文字：去除噪音、重複行、網站 metadata，
    優先保留食材區塊。
    """
    text = raw_text.strip()

    # 移除 emoji
    text = re.sub(
        r'[\U0001F300-\U0001F9FF\U00002700-\U000027BF\U0000FE00-\U0000FE0F'
        r'\U0001FA00-\U0001FA6F\U0001FA70-\U0001FAFF\U00002702-\U000027B0'
        r'\U0001F600-\U0001F64F\U0001F680-\U0001F6FF]+', '', text)

    # 移除 hashtag 標籤行（#麻油雞飯 #家常菜 等社群標籤）
    text = re.sub(r'#[^\s#]+', '', text)

    # 移除常見網站噪音
    noise_patterns = [
        r'說讚.*', r'一起做.*', r'瀏覽.*', r'發表.*',
        r'繼續閱讀.*', r'相關搜尋.*', r'熱搜關鍵字.*',
        r'也可以試試看.*', r'關鍵字.*', r'愛料理.*',
        r'avatar.*', r'\d+ 食譜 \d+ 粉絲',
        r'VIP\s*獨享',
    ]
    for pat in noise_patterns:
        text = re.sub(pat, '', text)

    # 去除重複行（保留第一次出現）
    lines = text.split('\n')
    seen = set()
    unique_lines = []
    for line in lines:
        stripped = line.strip()
        if not stripped:
            continue
        if stripped not in seen:
            seen.add(stripped)
            unique_lines.append(stripped)

    # 嘗試找到食材區塊並優先保留
    full_text = '\n'.join(unique_lines)
    ingredient_section = ""
    # 先找行首出現的精確 marker（避免「煨煮食材至軟」這類句中出現誤匹配）
    _heading_markers = ['預備食材', '所有食材', '材料', '食材', 'Ingredients']
    for marker in _heading_markers:
        match = re.search(rf'(?:^|\n)\s*{re.escape(marker)}', full_text)
        if match:
            idx = match.start()
            if full_text[idx] == '\n':
                idx += 1
            rest = full_text[idx:]
            end_markers = ['料理步驟', '做法', '步驟', '作法', '準備', 'Instructions', '小撇步']
            end_idx = len(rest)
            for em in end_markers:
                pos = rest.find(em, len(marker))
                if pos > 0 and pos < end_idx:
                    end_idx = pos
            ingredient_section = rest[:end_idx].strip()
            break

    if ingredient_section and len(ingredient_section) > 20:
        # 有清晰的食材區塊，直接用這段
        result = ingredient_section[:1200]
    else:
        # 沒有明確食材區塊，用去重後的全文
        result = full_text[:1500]

    logger.debug("_clean_recipe_text: {} chars -> {} chars", len(raw_text), len(result))
    return result


def _parse_json_array(raw: str) -> list | None:
    """從 AI 回應中提取第一個完整的 JSON 陣列。"""
    start = raw.find("[")
    if start < 0:
        return None
    depth = 0
    end = -1
    for i in range(start, len(raw)):
        if raw[i] == "[":
            depth += 1
        elif raw[i] == "]":
            depth -= 1
            if depth == 0:
                end = i + 1
                break
    if end <= start:
        return None
    try:
        result = json.loads(raw[start:end])
        return result if isinstance(result, list) else None
    except json.JSONDecodeError:
        return None


def _normalize_keywords(keywords: list) -> list[str]:
    """將關鍵字列表標準化為字串列表（處理 dict 格式、去重）。"""
    result = []
    for k in keywords:
        if not k:
            continue
        if isinstance(k, dict):
            name = k.get("name") or k.get("ingredient") or k.get("食材") or ""
            if name:
                result.append(str(name).strip())
        else:
            result.append(str(k).strip())
    # 去重保序
    seen = set()
    deduped = []
    for r in result:
        if r and r not in seen:
            seen.add(r)
            deduped.append(r)
    return deduped


def _normalize_ingredient(name: str) -> str:
    """正規化食材名稱：移除數字、單位、標點。"""
    s = name.strip()
    # 移除數字（含分數與常見 unicode 分數）
    s = re.sub(r'[0-9]+(?:/[0-9]+)?', '', s)
    s = re.sub(r'[¼½¾⅓⅔⅛⅜⅝⅞]', '', s)

    # 中文末段烹飪處理動作剝離（保守：限定有「切」前綴或多字動詞，避免誤剝「蒜末」「豬肉絲」）
    # 必須在中文單位剝除之前，否則「切塊」「切段」的尾字會先被當單位吃掉留下孤兒「切」
    while True:
        prev = s
        s = re.sub(r'切成?[絲丁片塊段末碎]$', '', s)
        s = re.sub(r'(?:刨絲|拍碎|拍扁|磨碎|壓碎|去皮|去籽|去殼|打散)$', '', s)
        s = re.sub(r'去[皮籽殼]$', '', s)
        if s == prev:
            break

    # 英文單位僅用字邊界移除，避免誤刪單字中的字元（例如 cabbage 的 g）
    s = re.sub(
        r'(?i)\b(?:g|kg|ml|cc|tbsp|tsp|cup|cups|tablespoon|tablespoons|teaspoon|teaspoons|oz|ounce|ounces|lb|lbs|inch|inches)\b',
        '',
        s,
    )

    # 中文單位移除：多字單位任意位置、單字單位只在開頭（避免「油條」「麵條」等食材名被拆）
    s = re.sub(r'(公克|公斤|毫升|公升|大匙|小匙|茶匙|湯匙|適量|少許)', '', s)
    s = re.sub(r'^[克匙杯碗包片條根把塊顆個粒斤兩錢]+', '', s)

    # 中文描述性量詞後綴（「一小段」「一小把」「幾片」出現在名稱尾巴時剝離）
    s = re.sub(r'\s*[一二三四五六七八九十幾數半]*[大小]?[段把朵支束瓣]$', '', s)

    # 常見英文描述詞（保留食材主體）
    s = re.sub(
        r'(?i)\b(?:low-?fat|plain|thinly|finely|roughly|sliced|chopped|shredded|green|red|fresh|optional|medium|large|small)\b',
        '',
        s,
    )
    s = re.sub(r'(?i),\s*such as.*$', '', s)
    s = re.sub(r'\([^)]*\)', '', s)

    # 移除標點
    s = re.sub(r'[的、，。！？：～~/()（）【】\[\]\-]', '', s)
    s = s.replace('–', '').replace('—', '')
    s = re.sub(r'\s+', ' ', s)
    s = s.strip()
    return s


def _parse_line_format(raw: str) -> list[str]:
    """從逐行格式的回應中提取食材列表。"""
    results = []
    for line in raw.split('\n'):
        line = line.strip()
        # 跳過空行、編號前綴、說明文字
        if not line:
            continue
        # 移除常見前綴：「1. 」「- 」「* 」「① 」
        line = re.sub(r'^[\d]+[.、)）]\s*', '', line)
        line = re.sub(r'^[-*•·]\s*', '', line)
        line = re.sub(r'^[①②③④⑤⑥⑦⑧⑨⑩]\s*', '', line)
        line = line.strip()
        if not line:
            continue
        # 跳過明顯不是食材的行（太長或含特定關鍵字）
        if len(line) > 20:
            continue
        if any(kw in line for kw in ['步驟', '做法', '注意', '提示', 'step', 'note']):
            continue
        results.append(line)
    return results


_UNIT_KEYS = sorted(
    _AMOUNT_DICT.get("unit_aliases", {}).keys(),
    key=len, reverse=True,
)
# Filter out single-char English units that could cause false matches in Chinese text
_UNITS_RE = "|".join(re.escape(u) for u in _UNIT_KEYS if u)
_LINE_AMOUNT_PATTERN = re.compile(
    r'(\d+(?:\.\d+)?(?:/\d+)?|[一二三四五六七八九十百]+分之[一二三四五六七八九十半]+|[一二兩三四五六七八九十半]+)\s*'
    r'(?:' + _UNITS_RE + r')'
    r'(?:\s*[xX*]\s*(\d+(?:\.\d+)?(?:/\d+)?|[一二兩三四五六七八九十半]+)\s*(?:顆|個|粒|片|條|份|人份)?)?',
    re.UNICODE,
)


_NOISE_LINE_KEYWORDS = (
    "都說讚",
    "分享試做成品照",
    "成為第一個",
    "收藏食譜",
    "繼續閱讀",
    "新店區",
    "台北市",
    "臺北市",
    "台湾",
    "食譜步驟",
    "照片",
    "分鐘",
    "說讚",
)

_LIKELY_SECTION_HEADERS = {
    "食材",
    "預備食材",
    "料理",
    "人份",
    "步驟",
}

_VAGUE_AMOUNT_PATTERN = re.compile(r'^(?P<name>.+?)(?P<amount>少許|適量|一些|半)$')


# ── 垃圾過濾 ───────────────────────────────────────────────────
_GARBAGE_PATTERNS = re.compile(
    r'切[絲丁片塊段末碎]|拍碎|備用|打散|刨絲|打入|翻炒|翻動|'
    r'熱鍋|凝固|混合|均勻|慢慢|漸漸|接著|待|完成|上桌|'
    r'好吃|香甜|美味|上面|底部|即可|起鍋|下鍋'
)

_GARBAGE_EXACT = {
    '完成', '上桌', '好吃', '香甜好吃', '美味', '即可',
    '備用', '均勻', '翻炒', '翻動', '慢慢', '預備食材',
    # 火力／鍋具狀態（非食材，避免誤抽）
    '大火', '小火', '中火', '猛火', '微火', '旺火', '文火',
    '高溫', '低溫', '熱鍋', '冷鍋',
    # 廚具／電器部件
    '內鍋', '外鍋', '鍋蓋', '鍋子', '烤盤', '烤箱', '電鍋',
    '保鮮膜', '鋁箔紙', '烘焙紙', '筷子', '湯匙', '鍋鏟',
    # 烹飪狀態／指令
    '跳起', '悶', '放涼', '保溫', '回溫', '退冰',
    '醬料', '調味料', '沾醬', '淋醬',
}


def _is_garbage_ingredient(name: str) -> bool:
    """判斷回傳的「食材名」是否為垃圾（步驟描述、感想等）。"""
    if not name:
        return True
    # hashtag → 社群標籤，不是食材
    if name.startswith('#') or name.startswith('＃'):
        return True
    # 動態停用詞 (使用者自行標記,熱更新) — 優先於靜態規則
    try:
        from app.services.stopword_store import stopword_store
        if name in stopword_store.get_set():
            return True
    except Exception:
        pass
    # 完全匹配已知垃圾詞
    if name in _GARBAGE_EXACT:
        return True
    # 描述性後綴 → 不是食材名（「新鮮都可」「有無皮都可」「料理酒比例」）
    if re.search(r'(?:都可|都行|比例|份量|建議|可省|可略|隨意)$', name):
        return True
    # 超過 5 字且含烹飪/步驟關鍵字 → 幾乎必定是步驟描述
    if len(name) > 5 and _GARBAGE_PATTERNS.search(name):
        return True
    # 含標點符號 → 不是食材
    if re.search(r'[.。!！?？…~～,，、]', name):
        return True
    # 超過 8 字的中文 → 極可能是步驟句
    cjk_count = sum(1 for c in name if '\u4e00' <= c <= '\u9fff')
    if cjk_count > 8:
        return True
    return False


# ── 指令行食材提取 ─────────────────────────────────────────────────────
_COOKING_ACTIONS = re.compile(
    r'切[絲丁片塊段末碎]?|燙|煎|煮|蒸|炒|炸|烤|滷|燉|拌|'
    r'攪|泡|醃|滾|燒|焗|備用|盛起|瀝乾|打散|撈起|過水|'
    r'電鍋|鋪上|灑上|淋上|捲起|收口|完成|下鍋|起鍋|'
    r'依序|放入|加入|倒入|撒上|拍碎|拍扁|磨碎|壓碎|剝皮|去皮|去籽|去殼'
)

_INSTRUCTION_SPLITTERS = re.compile(
    r'切[絲丁片塊段末碎]?|燙熟?|煎熟?|煮熟?|蒸熟?|炒熟?|炸|烤|'
    r'滷|燉|拌|攪|泡|醃|滾水?|燒|焗|備用|盛起|瀝乾|打散|'
    r'撈起|過水|電鍋|鋪上|灑上|淋上|捲起|收口|完成|下鍋|起鍋|'
    r'依序|放入|加入|倒入|撒上|或|加|和|與|把|將|用|拿|取|後|再'
)

_SINGLE_CHAR_FOODS = {
    '蛋', '肉', '蔥', '薑', '蒜', '鹽', '糖', '醋', '油', '酒',
    '水', '米', '麵', '魚', '蝦', '菜', '筍', '藕', '芋', '豆',
}

_CUTTING_SUFFIXES = {'絲', '丁', '片', '塊', '段', '末', '碎'}

_LEADING_QUANTIFIER = re.compile(
    r'^[一二兩三四五六七八九十幾數半]*'
    r'[張層片塊條根顆個粒把份碗杯匙瓣支束朵]*'
)

_NON_FOOD_SEGMENTS = {
    '即可', '上面', '表面', '周圍', '中間', '旁邊', '最後',
    '然後', '接著', '一起', '適量', '少許',
    '大火', '小火', '中火', '猛火', '微火', '旺火', '文火',
    '高溫', '低溫', '熱鍋', '冷鍋',
}


def _is_instruction_line(line: str) -> bool:
    """判斷是否為料理指令行（含 ≥1 個烹飪動詞且長度 > 6）。"""
    if len(line) <= 6:
        return False
    return bool(_COOKING_ACTIONS.search(line))


def _extract_ingredients_from_instruction(line: str) -> list[str]:
    """從指令行中提取可能的食材名稱（保守策略：寧漏勿錯）。"""
    segments = _INSTRUCTION_SPLITTERS.split(line)

    candidates: list[str] = []
    for seg in segments:
        seg = seg.strip()
        if not seg:
            continue
        # 移除非 CJK 前後綴
        seg = re.sub(r'^[^\u4e00-\u9fff]+', '', seg)
        seg = re.sub(r'[^\u4e00-\u9fff]+$', '', seg)
        if not seg:
            continue

        # 剝離前綴量詞（一層、張、幾片 等）
        seg = _LEADING_QUANTIFIER.sub('', seg)
        if not seg:
            continue

        # 過濾已知非食材詞
        if seg in _NON_FOOD_SEGMENTS:
            continue

        # 單字：必須在已知單字食材表中
        if len(seg) == 1:
            if seg in _SINGLE_CHAR_FOODS:
                candidates.append(seg)
            continue

        # 2 字：過濾 suffix 形態詞（如「或絲」「切塊」）
        if len(seg) == 2:
            if seg[1] in _CUTTING_SUFFIXES and seg[0] not in _SINGLE_CHAR_FOODS:
                continue
            if not _COOKING_ACTIONS.fullmatch(seg):
                candidates.append(seg)
            continue

        # >2 字：指令行中 3+ 字段語義模糊，規則解析器不冒險

    return candidates


def _is_amount_only_line(line: str) -> bool:
    """判斷此行是否為純用量行（如「三支」「四分之一個」「適量」「半包」「8尾」）"""
    line = line.strip()
    if not line or len(line) > 12:
        return False
    # Exact match with amount pattern (entire line is just an amount)
    if _LINE_AMOUNT_PATTERN.fullmatch(line):
        return True
    # Chinese fraction + unit: 四分之一個, 三分之一包
    if re.fullmatch(
        r'[一二三四五六七八九十百]+分之[一二三四五六七八九十半]+\s*'
        r'(?:' + _UNITS_RE + r')?',
        line,
    ):
        return True
    # Vague amounts
    if line in ('適量', '少許', '一些', '些許', '若干', '一點', '一點點', '少量', '微量', '大量', '酌量', '隨意'):
        return True
    return False


def _extract_ingredient_amounts_from_text(recipe_text: str) -> list[dict]:
    """從原始食譜逐行解析「食材 + 用量」。"""
    results: list[dict] = []
    seen: set[str] = set()

    # ── 預處理：合併「名稱行 + 用量行」的多行格式 ──
    raw_lines = [l.strip() for l in str(recipe_text or "").splitlines()]
    merged_lines: list[str] = []
    i = 0
    while i < len(raw_lines):
        line = raw_lines[i]
        if not line:
            i += 1
            continue
        # If current line has no amount pattern AND next line is a pure amount → merge
        if (i + 1 < len(raw_lines)
            and not _LINE_AMOUNT_PATTERN.search(line)
            and not _VAGUE_AMOUNT_PATTERN.match(line)
            and _is_amount_only_line(raw_lines[i + 1])):
            merged_lines.append(f"{line} {raw_lines[i + 1]}")
            i += 2
            continue
        merged_lines.append(line)
        i += 1

    for raw_line in merged_lines:
        line = raw_line.strip()
        if not line:
            continue

        line = re.sub(r'^[\d]+[.、)）]\s*', '', line)
        line = re.sub(r'^[-*•·]\s*', '', line)
        line = line.strip()
        if not line or len(line) > 120:
            continue

        # Truncate cooking descriptions after comma: "薑，切片" → "薑"
        # Only for Chinese-dominant lines (not English ingredients)
        if _is_mainly_chinese(line) and re.search(r'[,，]', line):
            parts = re.split(r'[,，]', line)
            # Keep first part (ingredient name), check if rest looks like cooking instruction
            if len(parts) > 1:
                rest = ''.join(parts[1:])
                if _COOKING_ACTIONS.search(rest):
                    line = parts[0].strip()

        line_lower = line.lower()
        if any(kw in line for kw in _NOISE_LINE_KEYWORDS):
            continue

        if any(kw in line for kw in ["步驟", "做法", "作法", "注意", "提示", "step", "note", "ingredient"]):
            continue

        # Split "雞蛋/嫩豆腐/板豆腐 適量" into separate items
        if re.search(r'[/／]', line):
            amount_m = _LINE_AMOUNT_PATTERN.search(line)
            vm = _VAGUE_AMOUNT_PATTERN.match(line) if not amount_m else None
            if amount_m:
                names_part = line[:amount_m.start()].strip(' ：:,-')
                amount_part = line[amount_m.start():].strip()
            elif vm:
                # For vague amounts, the whole line matches - extract name part
                names_part = vm.group("name")
                amount_part = vm.group("amount")
            else:
                names_part = line
                amount_part = ""

            sub_names = re.split(r'[/／]', names_part)
            for sub in sub_names:
                sub = sub.strip()
                if not sub:
                    continue
                name = _normalize_ingredient(sub)
                if name and name not in seen and not _is_garbage_ingredient(name):
                    seen.add(name)
                    results.append({"name": name, "amount": amount_part})
            continue

        m = _LINE_AMOUNT_PATTERN.search(line)
        if m:
            name_raw = line[:m.start()].strip(' ：:,-')
            amount_raw = line[m.start():].strip()
            if not name_raw:
                continue

            # 避免「成為第一個分享...」這類句子被切成假食材
            if re.search(r'[!！?？❤️👏😋]', name_raw):
                continue

            name = _normalize_ingredient(name_raw)
            if not name or name in seen:
                continue

            seen.add(name)
            results.append({"name": name, "amount": amount_raw})
            continue

        # 補抓「油少許／羅勒少許」這種無數字但有模糊量詞格式
        vm = _VAGUE_AMOUNT_PATTERN.match(line)
        if vm:
            name = _normalize_ingredient(vm.group("name"))
            amount_raw = vm.group("amount")
            if name and name not in seen:
                seen.add(name)
                results.append({"name": name, "amount": amount_raw})
            continue

        # 偵測指令行：含烹飪動詞的長句 → 從中提取食材
        if _is_instruction_line(line):
            extracted = _extract_ingredients_from_instruction(line)
            for ing_name in extracted:
                name = _normalize_ingredient(ing_name)
                if name and name not in seen and name not in _LIKELY_SECTION_HEADERS:
                    seen.add(name)
                    results.append({"name": name, "amount": ""})
            continue

        # 補抓純食材行 — 交給 Gemma 做最終判斷，這裡只擋明顯非食材
        if any(sep in line for sep in (":", "：")):
            continue
        if re.search(r'\d', line):
            continue
        if _COOKING_ACTIONS.search(line):
            continue
        if re.search(r'[.。!！?？…~～]', line):
            continue

        name = _normalize_ingredient(line)
        if not name or name in seen or name in _LIKELY_SECTION_HEADERS:
            continue
        if _is_garbage_ingredient(name):
            continue

        seen.add(name)
        results.append({"name": name, "amount": ""})

    return results


_INGREDIENTS_SECTION_END_MARKERS = {
    "directions", "direction", "instructions", "method", "steps",
    "local offers", "jump to recipe", "keep screen awake", "nutrition profile",
}


def _extract_ingredients_section_lines(recipe_text: str) -> list[str]:
    lines = [x.strip() for x in str(recipe_text or "").splitlines()]
    start = -1
    for i, line in enumerate(lines):
        if line.lower() in {"ingredients", "ingredient"}:
            start = i + 1
            break
    if start < 0:
        return []

    out = []
    for line in lines[start:]:
        low = line.lower().strip(': ')
        if not low:
            continue
        if low in _INGREDIENTS_SECTION_END_MARKERS:
            break
        if re.fullmatch(r'\d+\.?\d*\s*\([^)]*\)', line):
            continue
        if low in {"1/2x", "1x", "2x", "save", "rate", "print", "share"}:
            continue
        out.append(line)
    return out


def _extract_ingredient_amounts_from_ingredients_section(recipe_text: str) -> list[dict]:
    """解析英文食譜頁 Ingredients 區塊（數量在前）。"""
    lines = _extract_ingredients_section_lines(recipe_text)
    if not lines:
        return []

    results = []
    seen = set()

    amount_first = re.compile(
        r'^(?P<amount>(?:\d+(?:\.\d+)?(?:/\d+)?|[¼½¾⅓⅔⅛⅜⅝⅞])(?:\s*\([^)]*\))?(?:\s*(?:cup|cups|tablespoon|tablespoons|tbsp|teaspoon|teaspoons|tsp|oz|ounce|ounces|inch|inches|g|kg|ml|l))?)\s+(?P<name>.+)$',
        re.IGNORECASE,
    )

    for line in lines:
        m = amount_first.match(line.strip())
        if not m:
            continue

        amount = m.group("amount").strip()
        raw_name = m.group("name").strip(" .")
        name = _normalize_ingredient(raw_name)
        if not name or name in seen:
            continue

        seen.add(name)
        results.append({"name": name, "amount": amount})

    return results


def _amount_quality(amount: str) -> tuple[int, int]:
    """用量品質分數：優先乘數格式，再看字串長度。"""
    text = str(amount or "").strip()
    if not text:
        return (0, 0)
    has_multiplier = 1 if re.search(r'[xX*]', text) else 0
    return (has_multiplier, len(text))


def _should_replace_amount(current: str, candidate: str) -> bool:
    return _amount_quality(candidate) > _amount_quality(current)


def _contains_name_in_text(name: str, recipe_text: str) -> bool:
    if not name:
        return False
    return str(name).lower() in str(recipe_text or "").lower()


def _filter_stopwords(names: list[str]) -> list[str]:
    """最終出口去除動態停用詞(使用者拖曳或管理頁標記的詞)。"""
    try:
        from app.services.stopword_store import stopword_store
        stops = stopword_store.get_set()
    except Exception:
        return names
    filtered = [n for n in names if n not in stops]
    if len(filtered) != len(names):
        removed = [n for n in names if n in stops]
        logger.info("extract stopwords_removed count={} words={}", len(removed), removed)
    return filtered


async def extract_keywords(recipe_text: str) -> list[str]:
    """
    從食譜文字提取食材關鍵字列表（純規則解析）。
    優先使用英文 Ingredients 區塊，再 fallback 到逐行解析。
    """
    # 先嘗試英文 Ingredients 區塊
    section_items = _extract_ingredient_amounts_from_ingredients_section(recipe_text)
    if section_items:
        names = [x["name"] for x in section_items if x.get("name")]
        if names:
            names = _filter_stopwords(names)
            logger.info("extract_keywords ingredients_section_hit count={} keywords={}", len(names), names)
            return names

    # Fallback: 清理文字後逐行解析
    cleaned = _clean_recipe_text(recipe_text)
    logger.debug("extract_keywords_cleaned_text='{}'", cleaned[:400])

    line_results = _extract_ingredient_amounts_from_text(cleaned)
    names = [x["name"] for x in line_results if x.get("name")]

    # 去重保序
    seen = set()
    deduped = []
    for n in names:
        if n not in seen:
            seen.add(n)
            deduped.append(n)

    deduped = _filter_stopwords(deduped)
    logger.info("extract_keywords (rule-based): {}", deduped)
    return deduped


def _standardize_amount(raw_amount: str) -> str:
    """保留原始量詞文字，不轉換為克數估算。"""
    text = raw_amount.strip()
    if not text:
        return ""
    return text


def _extract_context_for_ingredient(name: str, recipe_text: str, window: int = 10) -> list[str]:
    """找到食材名在原文中所有出現位置，提取前後各 window 個字的上下文。"""
    contexts = []
    text = str(recipe_text or "")
    start = 0
    while True:
        idx = text.find(name, start)
        if idx < 0:
            break
        left = max(0, idx - window)
        right = min(len(text), idx + len(name) + window)
        ctx = text[left:right]
        contexts.append(ctx)
        start = idx + len(name)
    return contexts


async def extract_keywords_with_amounts(recipe_text: str) -> list[dict]:
    """
    從食譜文字提取食材關鍵字 + 用量（純規則解析）。
    回傳: [{"name": "雞蛋", "amount": "3顆"}, {"name": "醬油", "amount": "2大匙"}, ...]
    """
    # 先嘗試英文 Ingredients 區塊
    section_items = _extract_ingredient_amounts_from_ingredients_section(recipe_text)
    if section_items:
        try:
            from app.services.stopword_store import stopword_store
            stops = stopword_store.get_set()
            section_items = [x for x in section_items if x.get("name") not in stops]
        except Exception:
            pass
        logger.info(
            "extract_with_amounts ingredients_section_hit item_count={} items={}",
            len(section_items),
            section_items,
        )
        return section_items

    # Fallback: 清理文字後逐行解析
    cleaned = _clean_recipe_text(recipe_text)
    logger.debug("extract_with_amounts_cleaned_text='{}'", cleaned[:400])

    results = _extract_ingredient_amounts_from_text(cleaned)
    # 最終出口過濾停用詞
    try:
        from app.services.stopword_store import stopword_store
        stops = stopword_store.get_set()
        before = len(results)
        results = [r for r in results if r.get("name") not in stops]
        if len(results) != before:
            logger.info("extract_with_amounts stopwords_removed={}", before - len(results))
    except Exception:
        pass
    logger.debug("extract_with_amounts_line_results={}", results)

    # 標準化用量
    for r in results:
        if r.get("amount"):
            r["amount"] = _standardize_amount(r["amount"])

    if results:
        logger.info("extract_keywords_with_amounts: {} items", len(results))
        return results

    return []


async def select_best_match(keyword: str, candidates: list[dict]) -> dict | None:
    """
    從候選中選出最佳匹配的食物（純分數篩選）。
    回傳選中的 candidate dict，或 None（未找到）。
    """
    if not candidates:
        return None

    top_score = candidates[0].get("score", 0)

    # 高分直接採用
    if top_score >= 0.85:
        logger.debug("select_best_match '{}' -> high score: {}", keyword, candidates[0]["name"])
        return candidates[0]

    # 過濾：只保留名稱包含關鍵字字元（至少 2 字重疊）或分數 >= 0.3 的候選
    kw_chars = set(keyword)
    def _relevant(c: dict) -> bool:
        name = c.get("name", "")
        overlap = sum(1 for ch in name if ch in kw_chars)
        if _is_processed_variant(keyword, name):
            return False
        return overlap >= 2 or c.get("score", 0) >= 0.3

    filtered = [c for c in candidates if _relevant(c)]

    if not filtered:
        logger.info("select_best_match '{}' -> all candidates irrelevant, returning None", keyword)
        return None

    # 過濾後只剩一個，直接用
    if len(filtered) == 1:
        logger.debug("select_best_match '{}' -> single candidate: {}", keyword, filtered[0]["name"])
        return filtered[0]

    # 過濾後第一名分數夠高，直接用
    if filtered[0].get("score", 0) >= 0.4:
        logger.debug("select_best_match '{}' -> top filtered score: {}", keyword, filtered[0]["name"])
        return filtered[0]

    # 無 AI，直接用最高分的候選
    logger.debug("select_best_match '{}' -> fallback to top filtered: {}", keyword, filtered[0]["name"])
    return filtered[0]
