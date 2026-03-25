"""
unit_converter.py - 食材用量單位換算服務

兩層策略：
  Tier 1: 標準量器 → mL/g 對照表
  Tier 2: 常見食材每份/每個重量表（衛福部食物代換表 + USDA）

資料來源：
  - 衛福部國民健康署「食物代換表」
  - USDA FoodData Central FoodPortion
"""
import re
from loguru import logger


# ── Tier 1：標準量器對照表 ──────────────────────────────────────

# 體積單位 → mL
VOLUME_UNITS: dict[str, float] = {
    "大匙": 15.0, "湯匙": 15.0, "tablespoon": 15.0, "tbsp": 15.0, "T": 15.0,
    "小匙": 5.0,  "茶匙": 5.0,  "teaspoon": 5.0,    "tsp": 5.0, "t": 5.0,
    "杯": 240.0,  "cup": 240.0,
    "碗": 300.0,
    "cc": 1.0,    "ml": 1.0,    "mL": 1.0, "毫升": 1.0,
    "升": 1000.0, "L": 1000.0,  "公升": 1000.0,
}

# 重量單位 → g
WEIGHT_UNITS: dict[str, float] = {
    "g": 1.0,      "克": 1.0,      "公克": 1.0,
    "kg": 1000.0,  "公斤": 1000.0,
    "斤": 600.0,   "台斤": 600.0,
    "兩": 37.5,    "台兩": 37.5,
    "oz": 28.35,   "盎司": 28.35,
    "磅": 453.6,   "lb": 453.6, "lbs": 453.6,
}

# 模糊/估計用量
VAGUE_AMOUNTS: dict[str, float] = {
    "少許": 2.0,
    "適量": 5.0,
    "一些": 10.0,
    "半": 0.5,
    "pinch": 1.0,
    "dash": 1.0,
    "to taste": 5.0,
}

# 計數單位（需搭配 PIECE_WEIGHTS 查食材每個重量）
COUNT_UNITS: frozenset[str] = frozenset({
    "顆", "個", "粒", "隻", "條", "片", "塊", "根",
    "把", "包", "罐", "瓶", "支", "束", "朵", "瓣",
    "piece", "pieces", "slice", "slices",
    "whole", "medium", "large", "small",
    "clove", "cloves", "stalk", "stalks",
})


# ── Tier 2：常見食材每份/每個重量（衛福部食物代換表 + USDA） ──────

# 來源標註：
#   HPA = 衛福部國民健康署食物代換表
#   USDA = USDA FoodData Central FoodPortion
PIECE_WEIGHTS: dict[str, dict] = {
    # ── 蛋類（HPA: 蛋白質類 1份=蛋1顆60g）──
    "蛋": {"g": 60, "unit": "顆"},
    "雞蛋": {"g": 60, "unit": "顆"},
    "鴨蛋": {"g": 70, "unit": "顆"},
    "鵪鶉蛋": {"g": 10, "unit": "顆"},
    "皮蛋": {"g": 60, "unit": "顆"},
    "鹹蛋": {"g": 60, "unit": "顆"},
    "egg": {"g": 60, "unit": "piece"},

    # ── 豆腐/豆製品（HPA: 蛋白質類）──
    "豆腐": {"g": 80, "unit": "塊"},      # HPA: 半盒=80g
    "嫩豆腐": {"g": 120, "unit": "塊"},
    "豆干": {"g": 40, "unit": "片"},
    "豆皮": {"g": 30, "unit": "片"},
    "油豆腐": {"g": 55, "unit": "塊"},     # HPA: 1塊
    "tofu": {"g": 120, "unit": "piece"},   # USDA: 1 slice ~120g

    # ── 肉類（HPA: 蛋白質類 1份=生肉30g）──
    "雞胸肉": {"g": 200, "unit": "片"},
    "雞腿": {"g": 200, "unit": "隻"},
    "雞翅": {"g": 50, "unit": "隻"},
    "棒棒腿": {"g": 80, "unit": "隻"},
    "豬排": {"g": 150, "unit": "片"},
    "豬里肌": {"g": 150, "unit": "片"},
    "牛排": {"g": 200, "unit": "片"},
    "香腸": {"g": 50, "unit": "條"},
    "培根": {"g": 15, "unit": "片"},       # USDA: 1 slice cooked ~8g, raw~28g → 取中間
    "bacon": {"g": 15, "unit": "slice"},
    "chicken breast": {"g": 200, "unit": "piece"},  # USDA
    "chicken thigh": {"g": 125, "unit": "piece"},

    # ── 海鮮 ──
    "蝦": {"g": 10, "unit": "隻"},
    "蝦仁": {"g": 8, "unit": "隻"},
    "蛤蜊": {"g": 8, "unit": "顆"},       # 含殼
    "魚片": {"g": 100, "unit": "片"},
    "鮭魚": {"g": 150, "unit": "片"},
    "shrimp": {"g": 10, "unit": "piece"},  # USDA: medium shrimp ~10g

    # ── 水果（HPA: 水果類 1份=可食重100g）──
    "蘋果": {"g": 200, "unit": "顆"},      # 含皮可食約160g，整顆約200g
    "香蕉": {"g": 120, "unit": "根"},      # USDA: 1 medium=118g
    "橘子": {"g": 130, "unit": "顆"},
    "柳橙": {"g": 170, "unit": "顆"},
    "奇異果": {"g": 80, "unit": "顆"},     # USDA: 1 medium=76g
    "芭樂": {"g": 160, "unit": "顆"},
    "番茄": {"g": 120, "unit": "顆"},      # 中型
    "小番茄": {"g": 15, "unit": "顆"},
    "檸檬": {"g": 60, "unit": "顆"},
    "葡萄": {"g": 5, "unit": "顆"},
    "apple": {"g": 200, "unit": "medium"},   # USDA: 1 medium=182g
    "banana": {"g": 118, "unit": "medium"},  # USDA
    "orange": {"g": 140, "unit": "medium"},  # USDA
    "tomato": {"g": 123, "unit": "medium"},  # USDA
    "lemon": {"g": 58, "unit": "medium"},

    # ── 蔬菜（HPA: 蔬菜類 1份=生重100g）──
    "蒜頭": {"g": 5, "unit": "瓣"},
    "薑": {"g": 10, "unit": "片"},
    "蔥": {"g": 15, "unit": "根"},
    "辣椒": {"g": 10, "unit": "根"},
    "洋蔥": {"g": 200, "unit": "顆"},      # 中型
    "紅蘿蔔": {"g": 150, "unit": "根"},
    "馬鈴薯": {"g": 150, "unit": "顆"},
    "地瓜": {"g": 200, "unit": "條"},
    "玉米": {"g": 200, "unit": "根"},      # 含芯
    "青椒": {"g": 120, "unit": "顆"},
    "香菇": {"g": 15, "unit": "朵"},       # 鮮香菇
    "杏鮑菇": {"g": 80, "unit": "根"},
    "garlic": {"g": 3, "unit": "clove"},   # USDA
    "onion": {"g": 150, "unit": "medium"},
    "potato": {"g": 150, "unit": "medium"},
    "carrot": {"g": 72, "unit": "medium"},  # USDA

    # ── 全穀雜糧（HPA: 全穀雜糧類）──
    "吐司": {"g": 30, "unit": "片"},       # HPA: 薄片
    "厚片吐司": {"g": 60, "unit": "片"},
    "饅頭": {"g": 80, "unit": "個"},
    "包子": {"g": 100, "unit": "個"},
    "水餃": {"g": 25, "unit": "顆"},
    "餃子": {"g": 25, "unit": "顆"},
    "湯圓": {"g": 20, "unit": "顆"},       # 小湯圓
    "飯糰": {"g": 200, "unit": "個"},
    "bread": {"g": 30, "unit": "slice"},    # USDA: 1 slice=28-30g
    "tortilla": {"g": 50, "unit": "piece"},
    "wholewheat tortilla": {"g": 50, "unit": "piece"},
    "whole wheat tortilla": {"g": 50, "unit": "piece"},
    "wrap": {"g": 50, "unit": "piece"},

    # ── 乳品（HPA: 乳品類 1杯=240mL）──
    "起司片": {"g": 20, "unit": "片"},
    "cheese": {"g": 28, "unit": "slice"},   # USDA: 1 slice=28g

    # ── 蔬菜（補充）──
    "香菜": {"g": 5, "unit": "根"},
    "芫荽": {"g": 5, "unit": "根"},
    "九層塔": {"g": 2, "unit": "片"},
    "紅椒": {"g": 120, "unit": "顆"},
    "黃椒": {"g": 150, "unit": "顆"},
    "甜椒": {"g": 130, "unit": "顆"},
    "豆芽菜": {"g": 30, "unit": "把"},
    "金針菇": {"g": 200, "unit": "包"},
    "鴻喜菇": {"g": 150, "unit": "包"},
    "雪白菇": {"g": 150, "unit": "包"},
    "秀珍菇": {"g": 100, "unit": "包"},
    "秋葵": {"g": 10, "unit": "根"},
    "蘆筍": {"g": 15, "unit": "根"},
    "小黃瓜": {"g": 100, "unit": "條"},
    "大黃瓜": {"g": 300, "unit": "條"},
    "茄子": {"g": 150, "unit": "條"},
    "絲瓜": {"g": 350, "unit": "條"},
    "苦瓜": {"g": 300, "unit": "條"},
    "南瓜": {"g": 800, "unit": "顆"},
    "冬瓜": {"g": 1000, "unit": "塊"},
    "芋頭": {"g": 250, "unit": "顆"},
    "竹筍": {"g": 200, "unit": "支"},
    "筊白筍": {"g": 80, "unit": "支"},
    "牛蒡": {"g": 150, "unit": "根"},
    "蓮藕": {"g": 200, "unit": "節"},
    "山藥": {"g": 200, "unit": "段"},
    "白蘿蔔": {"g": 500, "unit": "條"},
    "韭菜": {"g": 50, "unit": "把"},
    "芹菜": {"g": 60, "unit": "根"},
    "菠菜": {"g": 30, "unit": "把"},
    "花椰菜": {"g": 400, "unit": "顆"},
    "青花菜": {"g": 350, "unit": "顆"},
    "黑木耳": {"g": 30, "unit": "片"},
    "玉米筍": {"g": 15, "unit": "根"},
    "荸薺": {"g": 15, "unit": "顆"},
    "櫛瓜": {"g": 200, "unit": "條"},
    "甜菜根": {"g": 150, "unit": "顆"},
    # ── 肉類（補充）──
    "豬絞肉": {"g": 300, "unit": "包"},
    "牛絞肉": {"g": 300, "unit": "包"},
    "雞翅膀": {"g": 50, "unit": "隻"},
    "棒棒腿": {"g": 80, "unit": "隻"},
    "鴨肉": {"g": 200, "unit": "塊"},
    "鴨胸": {"g": 250, "unit": "片"},
    "鴨腿": {"g": 250, "unit": "隻"},
    "羊肉": {"g": 200, "unit": "片"},
    "羊排": {"g": 150, "unit": "塊"},
    "五花肉": {"g": 300, "unit": "條"},
    "排骨": {"g": 100, "unit": "塊"},
    "梅花肉": {"g": 200, "unit": "片"},
    "松阪豬": {"g": 150, "unit": "片"},
    "雞腳": {"g": 30, "unit": "隻"},
    # ── 海鮮（補充）──
    "花枝": {"g": 200, "unit": "隻"},
    "魷魚": {"g": 150, "unit": "隻"},
    "透抽": {"g": 120, "unit": "隻"},
    "小卷": {"g": 30, "unit": "隻"},
    "牡蠣": {"g": 10, "unit": "顆"},
    "蚵仔": {"g": 10, "unit": "顆"},
    "螃蟹": {"g": 200, "unit": "隻"},
    "章魚": {"g": 300, "unit": "隻"},
    "干貝": {"g": 15, "unit": "顆"},
    "鱈魚": {"g": 150, "unit": "片"},
    "鯛魚": {"g": 120, "unit": "片"},
    # ── 加工品 ──
    "水餃皮": {"g": 8, "unit": "張"},
    "春捲皮": {"g": 15, "unit": "張"},
    "潤餅皮": {"g": 30, "unit": "張"},
    "年糕": {"g": 50, "unit": "片"},
    "蘿蔔糕": {"g": 60, "unit": "片"},
    "豬血糕": {"g": 80, "unit": "塊"},
    "貢丸": {"g": 25, "unit": "顆"},
    "魚丸": {"g": 20, "unit": "顆"},
    "蛋餃": {"g": 25, "unit": "顆"},
    "豆干": {"g": 40, "unit": "片"},
    "百頁豆腐": {"g": 200, "unit": "塊"},
    # ── 油脂堅果（HPA: 油脂與堅果種子類）──
    "核桃": {"g": 7, "unit": "顆"},
    "杏仁": {"g": 1.2, "unit": "顆"},
    "花生": {"g": 1, "unit": "顆"},
    "腰果": {"g": 3, "unit": "顆"},
    "開心果": {"g": 1, "unit": "顆"},
    "夏威夷豆": {"g": 3, "unit": "顆"},
    "松子": {"g": 0.5, "unit": "顆"},
    # ── 水果（補充）──
    "芒果": {"g": 300, "unit": "顆"},
    "鳳梨": {"g": 1000, "unit": "顆"},
    "木瓜": {"g": 500, "unit": "顆"},
    "西瓜": {"g": 3000, "unit": "顆"},
    "火龍果": {"g": 350, "unit": "顆"},
    "酪梨": {"g": 200, "unit": "顆"},
    "百香果": {"g": 50, "unit": "顆"},
    "草莓": {"g": 15, "unit": "顆"},
    "藍莓": {"g": 2, "unit": "顆"},
    "櫻桃": {"g": 8, "unit": "顆"},
    "荔枝": {"g": 25, "unit": "顆"},
    "龍眼": {"g": 10, "unit": "顆"},
    "蓮霧": {"g": 120, "unit": "顆"},
    "柿子": {"g": 200, "unit": "顆"},
    "梨子": {"g": 200, "unit": "顆"},
    "水蜜桃": {"g": 150, "unit": "顆"},
}


# 常見食材密度（g/mL），用於體積→重量換算
DENSITY_G_PER_ML: dict[str, float] = {
    "水": 1.0,     "water": 1.0,
    "牛奶": 1.03,  "鮮奶": 1.03,  "milk": 1.03,
    "油": 0.92,    "沙拉油": 0.92, "橄欖油": 0.92, "麻油": 0.92,
    "oil": 0.92,   "olive oil": 0.92, "sesame oil": 0.92,
    "麵粉": 0.53,  "flour": 0.53, "中筋麵粉": 0.53, "低筋麵粉": 0.53, "高筋麵粉": 0.55,
    "糖": 0.85,    "砂糖": 0.85,  "sugar": 0.85, "白糖": 0.85, "紅糖": 0.85,
    "鹽": 1.22,    "salt": 1.22,
    "醬油": 1.15,  "soy sauce": 1.15,
    "蜂蜜": 1.42,  "honey": 1.42,
    "醋": 1.01,    "vinegar": 1.01,
    "米酒": 0.95,  "料理酒": 0.95,
    "奶油": 0.91,  "butter": 0.91,
    "鮮奶油": 0.98, "cream": 0.98,
    "米": 0.75,    "rice": 0.75,   "白米": 0.75,
    "太白粉": 0.56, "cornstarch": 0.56,
    # ── 醬料 ──
    "番茄醬": 1.10,  "ketchup": 1.10,  "tomato sauce": 1.10,
    "味噌": 1.10,    "miso": 1.10,
    "豆瓣醬": 1.15,  "chili bean paste": 1.15,
    "芝麻醬": 1.08,  "sesame paste": 1.08,
    "花生醬": 1.09,  "peanut butter": 1.09,
    "沙茶醬": 1.05,  "shacha sauce": 1.05,
    "甜麵醬": 1.12,  "sweet bean paste": 1.12,
    "蠔油": 1.20,    "oyster sauce": 1.20,
    "辣椒醬": 1.10,  "chili sauce": 1.10,
    "XO醬": 1.05,
    "味醂": 1.10,    "mirin": 1.10,
    "醬油膏": 1.20,  "thick soy sauce": 1.20,
    # ── 乳製品/飲品 ──
    "重鮮奶油": 1.01, "heavy cream": 1.01, "whipping cream": 1.01,
    "椰漿": 1.02,    "coconut milk": 1.02, "coconut cream": 1.04,
    "豆漿": 1.02,    "soy milk": 1.02,
    "煉乳": 1.28,    "condensed milk": 1.28,
    "優格": 1.03,    "yogurt": 1.03,
    # ── 酒類 ──
    "紹興酒": 0.98,  "shaoxing wine": 0.98,
    "白酒": 0.95,    "白蘭地": 0.94, "brandy": 0.94,
    "啤酒": 1.01,    "beer": 1.01,
    "紅酒": 0.99,    "red wine": 0.99, "white wine": 0.99,
    "威士忌": 0.94,  "whiskey": 0.94,
    "清酒": 0.98,    "sake": 0.98,
    # ── 果汁/飲品 ──
    "果汁": 1.04,    "juice": 1.04,
    "柳橙汁": 1.04,  "orange juice": 1.04,
    "檸檬汁": 1.03,  "lemon juice": 1.03,
    "可樂": 1.04,    "cola": 1.04,
    # ── 其他 ──
    "花生油": 0.92,  "peanut oil": 0.92,
    "椰子油": 0.92,  "coconut oil": 0.92,
    "苦茶油": 0.91,
    "葡萄籽油": 0.92, "grapeseed oil": 0.92,
    "玉米粉": 0.56,  "corn starch": 0.56,
    "地瓜粉": 0.60,  "番薯粉": 0.60,
    "糖粉": 0.56,    "powdered sugar": 0.56,
    "可可粉": 0.45,  "cocoa powder": 0.45,
    "泡打粉": 0.90,  "baking powder": 0.90,
    "小蘇打粉": 0.69, "baking soda": 0.69,
}

# 預設密度（找不到對應食材時）
_DEFAULT_DENSITY = 1.0


# ── 數字解析正則 ──────────────────────────────────────────────

# 支援：整數、小數、中文數字、分數
_CHINESE_NUMS = {"半": 0.5, "一": 1, "二": 2, "兩": 2, "三": 3, "四": 4,
                 "五": 5, "六": 6, "七": 7, "八": 8, "九": 9, "十": 10}

_AMOUNT_PATTERN = re.compile(
    r'(\d+\.?\d*(?:/\d+)?|[一二兩三四五六七八九十半]+)\s*'
    r'([^\d\s一二兩三四五六七八九十半].*)?',
    re.UNICODE,
)

_FRACTION_CHAR_MAP = str.maketrans({
    "¼": "1/4",
    "½": "1/2",
    "¾": "3/4",
    "⅓": "1/3",
    "⅔": "2/3",
    "⅛": "1/8",
    "⅜": "3/8",
    "⅝": "5/8",
    "⅞": "7/8",
})

_MULTIPLIER_PATTERN = re.compile(
    r'^\s*(?P<left>[^xX*]+?)\s*[xX*]\s*(?P<right>[^xX*]+?)\s*$',
    re.UNICODE,
)


def _parse_chinese_number(s: str) -> float:
    """將簡單中文數字轉為 float。如 '三' → 3, '半' → 0.5, '十二' → 12"""
    if not s:
        return 1.0
    if s in _CHINESE_NUMS:
        return _CHINESE_NUMS[s]
    # "十X" 模式
    if len(s) == 2 and s[0] == "十":
        return 10 + _CHINESE_NUMS.get(s[1], 0)
    if s == "十":
        return 10.0
    return 1.0


def parse_amount(raw: str) -> tuple[float, str]:
    """
    解析用量字串，回傳 (數量, 單位)。

    範例：
      "2大匙"   → (2.0, "大匙")
      "300g"    → (300.0, "g")
      "3顆"    → (3.0, "顆")
      "半匙"   → (0.5, "匙")
      "少許"   → (1.0, "少許")    # 模糊量
      "1/2杯"  → (0.5, "杯")
      ""       → (1.0, "")        # 無用量
    """
    raw = raw.strip()
    raw = raw.translate(_FRACTION_CHAR_MAP)
    if not raw:
        return 1.0, ""

    # 先檢查模糊用量（僅完整匹配，避免 "半杯" 被誤判為 "半"）
    if raw in VAGUE_AMOUNTS:
        return 1.0, raw

    m = _AMOUNT_PATTERN.match(raw)
    if not m:
        return 1.0, raw

    num_str = m.group(1)
    unit_raw = (m.group(2) or "").strip()

    # 僅保留首段單位，去除「，切丁」「）」「。」「...」等尾巴。
    unit = re.split(r'[，,。；;、\s]+', unit_raw, maxsplit=1)[0].strip()
    unit = unit.strip('()（）[]{}:：.!！？?"\'')

    # normalize mL/L shorthand casing
    if unit == "Ml":
        unit = "mL"
    elif unit == "l":
        unit = "L"

    # 例如 1 (8-inch) 視為 1 份（單位交由食材 piece-weight 判斷）
    if unit.startswith("(") and "inch" in unit.lower():
        unit = ""

    # 解析數字
    if "/" in num_str:
        parts = num_str.split("/")
        denominator = float(parts[1])
        amount = float(parts[0]) / denominator if denominator != 0 else float(parts[0])
    elif any(c in _CHINESE_NUMS for c in num_str):
        amount = _parse_chinese_number(num_str)
    else:
        amount = float(num_str)

    return amount, unit


def _find_density(food_name: str) -> float:
    """根據食材名稱查找密度，找不到回傳預設值。"""
    food_lower = food_name.lower()
    for key, density in DENSITY_G_PER_ML.items():
        if key in food_lower or food_lower in key:
            return density
    return _DEFAULT_DENSITY


def _find_piece_weight(food_name: str) -> dict | None:
    """根據食材名稱查找每個/每份重量。支援模糊匹配。"""
    food_lower = food_name.lower()

    food_compact = re.sub(r'\s+', '', food_lower)

    # 精確匹配
    if food_name in PIECE_WEIGHTS:
        return PIECE_WEIGHTS[food_name]
    if food_lower in PIECE_WEIGHTS:
        return PIECE_WEIGHTS[food_lower]
    if food_compact in PIECE_WEIGHTS:
        return PIECE_WEIGHTS[food_compact]

    # 子字串匹配：food_name 包含 key 或 key 包含 food_name
    best = None
    best_len = 0
    for key, data in PIECE_WEIGHTS.items():
        key_compact = re.sub(r'\s+', '', key.lower())
        if key in food_name or food_name in key:
            if len(key) > best_len:
                best = data
                best_len = len(key)
        elif key in food_lower or food_lower in key:
            if len(key) > best_len:
                best = data
                best_len = len(key)
        elif key_compact in food_compact or food_compact in key_compact:
            if len(key) > best_len:
                best = data
                best_len = len(key)
    return best


def to_grams(amount: float, unit: str, food_name: str = "") -> tuple[float, bool]:
    """
    將 (數量, 單位) 轉為公克數。

    回傳: (grams, estimated)
      - estimated=True 表示使用了估計值（非精確換算）

    換算順序：
      1. 重量單位 → 直接換算
      2. 體積單位 → mL × 密度
      3. 計數單位 → 查 PIECE_WEIGHTS
      4. 模糊用量 → 預設公克數
      5. 都找不到 → 預設 100g，標記為估計
    """
    if not unit:
        # 無單位，嘗試找 PIECE_WEIGHTS（可能是 "3 雞蛋" 這種格式）
        pw = _find_piece_weight(food_name)
        if pw:
            return amount * pw["g"], False
        return amount * 100.0, True  # 預設 100g per unit

    # 1. 重量單位
    if unit in WEIGHT_UNITS:
        return amount * WEIGHT_UNITS[unit], False

    # 2. 體積單位
    if unit in VOLUME_UNITS:
        ml = amount * VOLUME_UNITS[unit]
        density = _find_density(food_name)
        return ml * density, False

    # 匙（未指定大小時預設為大匙 15mL）
    if unit in ("匙",):
        ml = amount * 15.0
        density = _find_density(food_name)
        return ml * density, False

    # 3. 計數單位
    if unit in COUNT_UNITS:
        pw = _find_piece_weight(food_name)
        if pw:
            return amount * pw["g"], False
        logger.warning("piece_weight_not_found food={} unit={}", food_name, unit)
        return amount * 100.0, True

    # 4. 模糊用量
    if unit in VAGUE_AMOUNTS:
        return VAGUE_AMOUNTS[unit], True

    # 5. 找不到 → 嘗試把 unit 當食材名查 PIECE_WEIGHTS
    pw = _find_piece_weight(unit)
    if pw:
        return amount * pw["g"], False

    logger.warning("unknown_unit unit={} food={}, defaulting to 100g", unit, food_name)
    return amount * 100.0, True


def convert_ingredient_amount(
    food_name: str,
    raw_amount: str,
) -> dict:
    """
    完整換算入口：解析用量字串 → 轉公克。

    回傳:
    {
        "grams": float,
        "parsed_amount": float,
        "parsed_unit": str,
        "estimated": bool,
        "raw": str,
    }
    """
    raw = str(raw_amount or "").strip()

    # 優先處理乘數格式，例如：20g*4顆、250ml x 2。
    # 規則：有重量/體積單位的一側先轉 grams，另一側視為倍數。
    mm = _MULTIPLIER_PATTERN.match(raw)
    if mm:
        left_raw = mm.group("left").strip()
        right_raw = mm.group("right").strip()

        left_amount, left_unit = parse_amount(left_raw)
        right_amount, right_unit = parse_amount(right_raw)

        left_grams, left_est = to_grams(left_amount, left_unit, food_name)
        right_grams, right_est = to_grams(right_amount, right_unit, food_name)

        if left_unit in WEIGHT_UNITS or left_unit in VOLUME_UNITS:
            grams = left_grams * max(right_amount, 0)
            estimated = left_est
        elif right_unit in WEIGHT_UNITS or right_unit in VOLUME_UNITS:
            grams = right_grams * max(left_amount, 0)
            estimated = right_est
        else:
            # 若兩側都不是重量/體積，退回左側換算後乘倍數。
            grams = left_grams * max(right_amount, 0)
            estimated = left_est or right_est

        out = {
            "grams": round(grams, 1),
            "parsed_amount": left_amount * right_amount,
            "parsed_unit": f"{left_unit}*{right_unit}".strip("*"),
            "estimated": estimated,
            "raw": raw_amount,
        }
        logger.debug(
            "UNIT_CONVERT_MULTIPLIER food='{}' raw='{}' left='{}' right='{}' grams={} estimated={}",
            food_name,
            raw_amount,
            left_raw,
            right_raw,
            out["grams"],
            out["estimated"],
        )
        return out

    amount, unit = parse_amount(raw)
    grams, estimated = to_grams(amount, unit, food_name)

    # 無用量時標記為估計
    if not raw:
        estimated = True

    out = {
        "grams": round(grams, 1),
        "parsed_amount": amount,
        "parsed_unit": unit,
        "estimated": estimated,
        "raw": raw_amount,
    }
    logger.debug(
        "UNIT_CONVERT_SIMPLE food='{}' raw='{}' parsed_amount={} parsed_unit='{}' grams={} estimated={}",
        food_name,
        raw_amount,
        out["parsed_amount"],
        out["parsed_unit"],
        out["grams"],
        out["estimated"],
    )
    return out
