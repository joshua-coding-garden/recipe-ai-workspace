"""
reverse_search_service.py - 反向搜尋食譜食材

流程：
  1. 從兩個資料庫取得所有食物名稱（快取）
  2. 清理食譜文字
  3. 用資料庫食物名直接在食譜中做正向匹配（長名優先）
  4. 未匹配到的部分 → jieba 斷詞
  5. 每個斷詞逐一比對 taiwan_foods 和 FooDB（精確 → 相似度）
"""
import re
import time
import asyncio
from typing import Any

import httpx
import jieba
from loguru import logger

from app.config import settings

_TIMEOUT = httpx.Timeout(connect=3.0, read=30.0, write=5.0, pool=3.0)

# ── 食物名稱快取 ──────────────────────────────────────────────────────
_name_cache: dict[str, list[dict[str, Any]]] | None = None
_cache_ts: float = 0.0
_CACHE_TTL = 3600.0  # 1 小時（食物名稱為靜態資料）
_jieba_dict_loaded = False


# 常見食材名稱（資料庫中可能不存在但食譜中常出現）
_COMMON_FOOD_TERMS = [
    "雞胸肉", "雞腿肉", "雞翅", "雞腿", "雞蛋", "雞肉",
    "豬肉", "豬排", "豬里肌", "豬五花", "豬絞肉",
    "牛肉", "牛排", "牛腩", "牛腱",
    "紅蘿蔔", "白蘿蔔", "高麗菜", "大白菜", "小白菜",
    "青椒", "紅椒", "黃椒", "甜椒", "辣椒",
    "洋蔥", "蔥", "蒜頭", "蒜", "薑", "薑片",
    "番茄", "馬鈴薯", "地瓜", "南瓜", "冬瓜", "苦瓜", "絲瓜",
    "豆腐", "豆乾", "豆皮", "豆芽", "毛豆", "四季豆",
    "花椰菜", "青花菜", "玉米", "玉米筍",
    "香菇", "杏鮑菇", "金針菇", "木耳",
    "米酒", "醬油", "醬油膏", "蠔油", "麻油", "橄欖油",
    "沙拉油", "花生油", "奶油", "味醂", "料理酒",
    "太白粉", "麵粉", "糖", "鹽", "胡椒", "五香粉",
    "九層塔", "香菜", "芹菜", "韭菜", "空心菜", "菠菜",
    "蝦仁", "蝦", "鮭魚", "鯛魚", "花枝", "蛤蜊", "魷魚",
    "培根", "火腿", "香腸", "臘肉",
    "鮮奶", "鮮奶油", "起司", "乳酪",
    "蒜頭", "蒜末", "薑末", "蔥花", "蔥段",
]


def _load_jieba_food_dict(food_names: list[dict[str, Any]]) -> None:
    """將資料庫中文食物名稱 + 常見食材名加入 jieba 自訂詞典，提升斷詞精確度。"""
    global _jieba_dict_loaded
    if _jieba_dict_loaded:
        return
    count = 0
    # 加入資料庫食物名
    for item in food_names:
        name = item.get("name", "")
        if name and len(name) >= 2 and any('\u4e00' <= c <= '\u9fff' for c in name):
            jieba.add_word(name, freq=99999)
            count += 1
    # 加入常見食材名（確保常見詞不被拆開）
    for name in _COMMON_FOOD_TERMS:
        jieba.add_word(name, freq=99999)
        count += 1
    _jieba_dict_loaded = True
    logger.info("jieba_food_dict_loaded words_added={}", count)


async def _fetch_all_food_names() -> dict[str, list[dict[str, Any]]]:
    """從 backend 取得所有食物名稱，並將中文名加入 jieba 詞典。"""
    global _name_cache, _cache_ts
    now = time.time()
    if _name_cache is not None and (now - _cache_ts) < _CACHE_TTL:
        return _name_cache

    url = f"{settings.backend_url}/foods/names/all"
    try:
        async with httpx.AsyncClient(timeout=_TIMEOUT) as client:
            resp = await client.get(url)
            resp.raise_for_status()
            data = resp.json()
            _name_cache = data
            _cache_ts = now
            logger.info(
                "food_names_cache_refreshed taiwan={} foodb={}",
                len(data.get("taiwan_foods", [])),
                len(data.get("foodb", [])),
            )
            # 將中文食物名加入 jieba 詞典
            _load_jieba_food_dict(data.get("taiwan_foods", []))
            return data
    except Exception as e:
        logger.error("fetch_all_food_names_failed: {}", e, exc_info=True)
        return {"taiwan_foods": [], "foodb": [], "warnings": [f"食物名稱載入失敗: {e}"]}


# ── 文字前處理 ────────────────────────────────────────────────────────

_NOISE_PATTERNS = re.compile(
    r'說讚|一起做|瀏覽|發表|繼續閱讀|相關搜尋|熱搜關鍵字|'
    r'也可以試試看|關鍵字|愛料理|avatar|VIP\s*獨享|'
    r'\d+\s*食譜\s*\d+\s*粉絲'
)

_SECTION_END_MARKERS = re.compile(
    r'料理步驟|做法|步驟|作法|Instructions|小撇步'
)

_UNIT_AMOUNT_PATTERN = re.compile(
    r'\d+(?:\.\d+)?(?:/\d+)?\s*'
    r'(?:公克|公斤|毫升|公升|克|g|kg|ml|cc|大匙|小匙|茶匙|湯匙|匙|杯|碗|'
    r'顆|個|粒|片|條|根|把|塊|包|罐|瓶|支|束|朵|瓣|tbsp|tsp|cup|cups|oz)',
    re.IGNORECASE,
)


def _clean_text(raw: str) -> str:
    """清理食譜文字，去除噪音、emoji、數量單位。"""
    text = raw.strip()
    # 移除 emoji
    text = re.sub(
        r'[\U0001F300-\U0001F9FF\U00002700-\U000027BF\U0000FE00-\U0000FE0F'
        r'\U0001FA00-\U0001FA6F\U0001FA70-\U0001FAFF\U00002702-\U000027B0'
        r'\U0001F600-\U0001F64F\U0001F680-\U0001F6FF]+', '', text)
    text = _NOISE_PATTERNS.sub('', text)
    # 移除數量+單位（保留食材名稱）
    text = _UNIT_AMOUNT_PATTERN.sub(' ', text)
    # 移除多餘數字
    text = re.sub(r'\b\d+(?:\.\d+)?\b', ' ', text)
    # 常見標點清理
    text = re.sub(r'[，。！？：；、～~\-—()（）\[\]【】/]', ' ', text)
    text = re.sub(r'\s+', ' ', text).strip()
    return text


# ── 第一階段：資料庫名稱直接匹配 ──────────────────────────────────────

def _direct_match(recipe_text: str, food_names: list[dict]) -> tuple[list[dict], set[str]]:
    """
    用資料庫食物名稱直接在食譜文字中比對。
    長名稱優先匹配（避免「雞」先匹配到而漏掉「雞胸肉」）。
    不修改原文，僅回傳匹配結果和已匹配的名稱集合（供斷詞階段去重）。
    回傳：(matched_items, matched_name_set)
    """
    # 按名稱長度降序排列，長的先匹配
    sorted_names = sorted(food_names, key=lambda x: len(x["name"]), reverse=True)

    matched: list[dict] = []
    matched_names: set[str] = set()
    # 追蹤已被更長名稱覆蓋的位置
    covered_positions: list[tuple[int, int]] = []

    for item in sorted_names:
        name = item["name"]
        if not name or len(name) < 2:
            continue
        # 在文字中找到所有出現位置
        start = 0
        while True:
            idx = recipe_text.find(name, start)
            if idx < 0:
                break
            # 確認此位置未被更長的名稱覆蓋
            end = idx + len(name)
            is_covered = any(
                cs <= idx and ce >= end
                for cs, ce in covered_positions
            )
            if not is_covered:
                if item["id"] not in {m["id"] for m in matched}:
                    matched.append(item)
                matched_names.add(name)
                covered_positions.append((idx, end))
            start = end

    return matched, matched_names


# ── 第二階段：jieba 斷詞 ─────────────────────────────────────────────

_MIN_TOKEN_LEN = 2  # 最短有效斷詞長度

# NOTE: 僅作為 fallback seed,執行期讀取 stopword_store 動態清單。
# 啟動時 seed_stopwords.run_startup_seed() 會把這些詞寫入 stopwords.json。
_STOP_WORDS = {
    # 一般停用詞
    '的', '了', '在', '是', '我', '有', '和', '就', '不', '人', '都',
    '一', '一個', '上', '也', '很', '到', '說', '要', '去', '你',
    '會', '著', '沒有', '看', '好', '自己', '這', '他', '她', '它',
    '把', '那', '被', '從', '如果', '什麼', '但', '可以', '讓', '再',
    '後', '然後', '接著', '最後', '先', '用', '加入', '放入', '倒入',
    '適量', '少許', '一些', '備用', '準備', '半條', '半顆',
    # 烹飪動作詞
    '切丁', '切片', '切塊', '切段', '切絲', '切末', '切碎',
    '翻炒', '拌炒', '快炒', '熱鍋', '熱油', '起鍋', '下鍋',
    '上桌', '即可', '均勻', '變色', '調味', '醃製',
    '預備', '食材', '做法', '步驟', '作法', '分鐘', '小時',
    '煮沸', '煮熟', '燒開', '加熱', '冷卻', '靜置', '攪拌',
    '盛盤', '裝盤', '撒上', '淋上', '鋪上', '完成',
    # 火力／鍋具狀態
    '大火', '小火', '中火', '猛火', '微火', '旺火', '文火',
    '高溫', '低溫', '冷鍋',
}


def _get_active_stop_words() -> set[str]:
    """優先使用動態 stopword_store,store 未就緒時 fallback 到 seed。"""
    try:
        from app.services.stopword_store import stopword_store
        dynamic = stopword_store.get_set()
        if dynamic:
            return dynamic
    except Exception:
        pass
    return _STOP_WORDS


def _segment_text(text: str, exclude_names: set[str] | None = None) -> list[str]:
    """
    用 jieba 對文字做斷詞，過濾停用詞、短詞，以及已在直接匹配中找到的名稱。
    """
    exclude = exclude_names or set()
    stop_set = _get_active_stop_words()
    tokens = jieba.lcut(text)
    result: list[str] = []
    seen: set[str] = set()
    for token in tokens:
        token = token.strip()
        if not token or len(token) < _MIN_TOKEN_LEN:
            continue
        if token in stop_set:
            continue
        if token in seen:
            continue
        if token in exclude:
            continue
        # 只保留含中文或英文字母的 token
        if not re.search(r'[\u4e00-\u9fff a-zA-Z]', token):
            continue
        seen.add(token)
        result.append(token)
    return result


# ── 第三階段：逐詞比對兩個資料庫 ─────────────────────────────────────

async def _match_token_against_dbs(token: str) -> dict[str, Any]:
    """
    單一斷詞同時比對 taiwan_foods 和 FooDB。
    先精確匹配，無結果則用相似度搜尋。
    """
    async with httpx.AsyncClient(timeout=_TIMEOUT) as client:
        # 精確匹配：兩個 DB 同時查
        zh_exact_task = client.get(
            f"{settings.backend_url}/foods/search/zh/exact",
            params={"terms": token, "limit": 3},
        )
        en_exact_task = client.get(
            f"{settings.backend_url}/foods/search/en/exact",
            params={"terms": token, "limit": 3},
        )
        zh_resp, en_resp = await asyncio.gather(
            zh_exact_task, en_exact_task, return_exceptions=True,
        )

        zh_candidates = []
        en_candidates = []

        if not isinstance(zh_resp, Exception) and zh_resp.status_code == 200:
            zh_candidates = zh_resp.json().get("candidates", [])
        if not isinstance(en_resp, Exception) and en_resp.status_code == 200:
            en_candidates = en_resp.json().get("candidates", [])

        # 精確匹配有結果就直接回傳
        if zh_candidates or en_candidates:
            return {
                "token": token,
                "stage": "exact",
                "taiwan_foods": zh_candidates[:3],
                "foodb": en_candidates[:3],
            }

        # Fallback：相似度搜尋
        zh_sim_task = client.get(
            f"{settings.backend_url}/foods/search/zh",
            params={"terms": token, "limit": 3},
        )
        en_sim_task = client.get(
            f"{settings.backend_url}/foods/search/en",
            params={"terms": token, "limit": 3},
        )
        zh_resp2, en_resp2 = await asyncio.gather(
            zh_sim_task, en_sim_task, return_exceptions=True,
        )

        if not isinstance(zh_resp2, Exception) and zh_resp2.status_code == 200:
            zh_candidates = zh_resp2.json().get("candidates", [])
        if not isinstance(en_resp2, Exception) and en_resp2.status_code == 200:
            en_candidates = en_resp2.json().get("candidates", [])

        return {
            "token": token,
            "stage": "similarity" if (zh_candidates or en_candidates) else "not_found",
            "taiwan_foods": zh_candidates[:3],
            "foodb": en_candidates[:3],
        }


# ── 主流程 ───────────────────────────────────────────────────────────

_CONCURRENCY = 6


async def reverse_search(recipe_text: str) -> dict[str, Any]:
    """
    反向搜尋食譜食材：
    1. 資料庫食物名直接匹配食譜文字
    2. 未匹配部分用 jieba 斷詞
    3. 每個斷詞逐一比對兩個資料庫
    """
    log = logger.bind(flow="reverse_search")
    log.info("reverse_search_start text_length={}", len(recipe_text))

    # 取得所有食物名稱
    all_names = await _fetch_all_food_names()
    tw_names = all_names.get("taiwan_foods", [])
    foodb_names = all_names.get("foodb", [])
    log.info("food_names_loaded taiwan={} foodb={}", len(tw_names), len(foodb_names))

    # 清理食譜文字
    cleaned = _clean_text(recipe_text)
    log.debug("cleaned_text='{}'", cleaned[:300])

    # ── 階段 1：資料庫名稱直接匹配 ──────────────────────────────────
    tw_matched, tw_matched_names = _direct_match(cleaned, tw_names)
    foodb_matched, foodb_matched_names = _direct_match(cleaned, foodb_names)
    all_matched_names = tw_matched_names | foodb_matched_names

    direct_results: list[dict] = []
    for item in tw_matched:
        direct_results.append({
            "token": item["name"],
            "stage": "direct",
            "source": "taiwan_foods",
            "id": item["id"],
            "name": item["name"],
        })
    for item in foodb_matched:
        direct_results.append({
            "token": item["name"],
            "stage": "direct",
            "source": "foodb",
            "id": item["id"],
            "name": item["name"],
        })

    log.info(
        "direct_match_done taiwan={} foodb={} matched_names={}",
        len(tw_matched), len(foodb_matched), all_matched_names,
    )

    # ── 階段 2：jieba 斷詞（排除已直接匹配的名稱）────────────────────
    tokens = _segment_text(cleaned, exclude_names=all_matched_names)
    log.info("jieba_segmentation tokens={} values={}", len(tokens), tokens)

    if not tokens:
        return {
            "direct_matches": direct_results,
            "token_matches": [],
            "tokens_segmented": [],
            "summary": {
                "direct_count": len(direct_results),
                "token_count": 0,
                "total_matched": len(direct_results),
            },
        }

    # ── 階段 3：逐詞比對兩個資料庫 ─────────────────────────────────
    semaphore = asyncio.Semaphore(_CONCURRENCY)

    async def _search_one(token: str) -> dict[str, Any]:
        async with semaphore:
            try:
                return await asyncio.wait_for(
                    _match_token_against_dbs(token),
                    timeout=15.0,
                )
            except Exception as e:
                log.warning("token_search_failed token={} error={}", token, e)
                return {
                    "token": token,
                    "stage": "error",
                    "taiwan_foods": [],
                    "foodb": [],
                }

    token_results = await asyncio.gather(*[_search_one(t) for t in tokens])

    # 過濾掉完全沒結果的
    meaningful_results = [
        r for r in token_results
        if r.get("taiwan_foods") or r.get("foodb")
    ]

    matched_token_count = len(meaningful_results)
    log.info(
        "reverse_search_done direct={} token_matched={} token_total={}",
        len(direct_results), matched_token_count, len(tokens),
    )

    return {
        "direct_matches": direct_results,
        "token_matches": meaningful_results,
        "tokens_segmented": tokens,
        "summary": {
            "direct_count": len(direct_results),
            "token_count": matched_token_count,
            "token_not_found": len(tokens) - matched_token_count,
            "total_matched": len(direct_results) + matched_token_count,
        },
    }
