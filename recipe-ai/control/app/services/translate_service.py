"""
translate_service.py - argostranslate 離線翻譯橋接
中文 → 英文 / 英文 → 中文，無 API key，無網路依賴
搭配 opencc 做簡體 → 繁體轉換（argostranslate 輸出簡體）

翻譯引擎透過獨立子程序（argos_worker.py）執行，
避免 argostranslate 與 pydantic v2 的衝突。
"""
import json
import subprocess
import sys
import threading
from pathlib import Path

import opencc
from loguru import logger

_s2t = opencc.OpenCC("s2twp")  # 簡體 → 繁體台灣
_initialized = False

# ── Argos 子程序管理 ──────────────────────────────────────────
_WORKER_SCRIPT = str(Path(__file__).parent / "argos_worker.py")
# 使用隔離 venv 的 Python（pydantic v1，避免 spacy 衝突）
_ARGOS_PYTHON = "/opt/argos_venv/bin/python"


class _ArgosProcess:
    """管理 argos_worker.py 長駐子程序。"""

    def __init__(self):
        self._proc: subprocess.Popen | None = None
        self._lock = threading.Lock()
        self._ready = False

    def _ensure_started(self) -> bool:
        if self._proc and self._proc.poll() is None and self._ready:
            return True
        try:
            python_exe = _ARGOS_PYTHON if Path(_ARGOS_PYTHON).exists() else sys.executable
            self._proc = subprocess.Popen(
                [python_exe, _WORKER_SCRIPT],
                stdin=subprocess.PIPE,
                stdout=subprocess.PIPE,
                stderr=subprocess.PIPE,
                text=True,
                bufsize=1,
            )
            # 等待 ready 信號
            ready_line = self._proc.stdout.readline()
            if ready_line:
                msg = json.loads(ready_line.strip())
                if msg.get("ready"):
                    self._ready = True
                    logger.info("argos_worker 子程序已啟動 (pid={})", self._proc.pid)
                    return True
            logger.warning("argos_worker 啟動失敗：未收到 ready 信號")
            self._cleanup()
            return False
        except Exception as e:
            logger.warning("argos_worker 啟動失敗：{}", e)
            self._cleanup()
            return False

    def translate(self, text: str, src: str, tgt: str) -> str | None:
        """翻譯，成功回傳結果，失敗回傳 None。"""
        with self._lock:
            if not self._ensure_started():
                return None
            try:
                req = json.dumps({"text": text, "from": src, "to": tgt}, ensure_ascii=False)
                self._proc.stdin.write(req + "\n")
                self._proc.stdin.flush()
                resp_line = self._proc.stdout.readline()
                if not resp_line:
                    logger.warning("argos_worker 無回應，重啟")
                    self._cleanup()
                    return None
                resp = json.loads(resp_line.strip())
                if resp.get("ok"):
                    return resp["text"]
                return None
            except Exception as e:
                logger.warning("argos_worker 通訊失敗：{}", e)
                self._cleanup()
                return None

    def _cleanup(self):
        self._ready = False
        if self._proc:
            try:
                self._proc.kill()
            except Exception:
                pass
            self._proc = None

    def shutdown(self):
        with self._lock:
            self._cleanup()


_argos = _ArgosProcess()

_ZH_EN_FALLBACK_MAP: dict[str, str] = {
    # ── 主食/穀物 ──
    "黑糖饅頭": "bread", "饅頭": "bread", "蒸饅頭": "bread",
    "吐司": "toast", "麵包": "bread", "法國麵包": "baguette",
    "白飯": "rice", "米飯": "rice", "糙米": "brown rice",
    "白米": "rice", "糯米": "glutinous rice",
    "米": "rice", "麵": "noodles", "麵條": "noodles",
    "義大利麵": "pasta", "拉麵": "ramen", "烏龍麵": "udon",
    "米粉": "rice noodle", "冬粉": "vermicelli", "麵線": "thin noodles",
    "水餃": "dumpling", "餛飩": "wonton", "湯圓": "rice ball",
    "年糕": "rice cake", "蘿蔔糕": "turnip cake",
    # ── 糖/甜味 ──
    "黑糖": "brown sugar", "紅糖": "brown sugar",
    "糖": "sugar", "砂糖": "sugar", "冰糖": "rock sugar",
    "蜂蜜": "honey",
    # ── 蛋奶 ──
    "雞蛋": "egg", "蛋": "egg", "蛋黃": "egg yolk", "蛋白": "egg white",
    "鴨蛋": "duck egg", "皮蛋": "century egg", "鹹蛋": "salted egg",
    "牛奶": "milk", "鮮奶": "milk", "低脂牛奶": "low-fat milk",
    "鮮奶油": "cream", "奶油": "butter", "起司": "cheese",
    "優格": "yogurt", "優酪乳": "yogurt drink",
    # ── 肉類 ──
    "雞肉": "chicken", "雞胸肉": "chicken breast", "雞胸": "chicken breast",
    "雞腿": "chicken thigh", "雞翅": "chicken wing",
    "豬肉": "pork", "五花肉": "pork belly", "豬五花": "pork belly",
    "里肌肉": "pork loin", "豬排": "pork chop",
    "排骨": "spare ribs", "豬腳": "pork knuckle",
    "絞肉": "ground meat", "豬絞肉": "ground pork",
    "牛肉": "beef", "牛腩": "beef brisket", "牛腱": "beef shank",
    "牛排": "steak", "牛絞肉": "ground beef",
    "羊肉": "lamb", "羊排": "lamb chop",
    "鴨肉": "duck", "鴨胸": "duck breast",
    "培根": "bacon", "火腿": "ham", "香腸": "sausage",
    "臘肉": "cured pork", "肉鬆": "pork floss",
    # ── 海鮮 ──
    "蝦": "shrimp", "蝦仁": "shrimp", "草蝦": "prawn",
    "鮭魚": "salmon", "鮪魚": "tuna", "鱈魚": "cod",
    "鯛魚": "tilapia", "鱸魚": "sea bass", "鯖魚": "mackerel",
    "秋刀魚": "saury", "虱目魚": "milkfish",
    "魚": "fish", "魚片": "fish fillet",
    "蛤蜊": "clam", "花枝": "cuttlefish", "魷魚": "squid",
    "透抽": "squid", "章魚": "octopus",
    "干貝": "scallop", "牡蠣": "oyster", "蚵仔": "oyster",
    "螃蟹": "crab", "蝦米": "dried shrimp",
    "海帶": "kelp", "海苔": "nori", "紫菜": "seaweed",
    # ── 蔬菜 ──
    "高麗菜": "cabbage", "大白菜": "napa cabbage", "小白菜": "bok choy",
    "空心菜": "water spinach", "地瓜葉": "sweet potato leaves",
    "菠菜": "spinach", "莧菜": "amaranth",
    "青江菜": "bok choy", "油菜": "rapeseed greens",
    "芥菜": "mustard greens", "茼蒿": "chrysanthemum greens",
    "萵苣": "lettuce", "A菜": "lettuce",
    "番茄": "tomato", "小番茄": "cherry tomato",
    "紅蘿蔔": "carrot", "白蘿蔔": "daikon radish",
    "馬鈴薯": "potato", "地瓜": "sweet potato", "番薯": "sweet potato",
    "芋頭": "taro", "山藥": "yam",
    "南瓜": "pumpkin", "冬瓜": "winter melon",
    "苦瓜": "bitter melon", "絲瓜": "loofah",
    "茄子": "eggplant", "小黃瓜": "cucumber",
    "青椒": "green pepper", "甜椒": "bell pepper",
    "洋蔥": "onion", "蔥": "green onion", "青蔥": "green onion",
    "蒜頭": "garlic", "大蒜": "garlic",
    "薑": "ginger", "嫩薑": "ginger",
    "辣椒": "chili pepper", "朝天椒": "chili pepper",
    "香菇": "shiitake mushroom", "杏鮑菇": "king oyster mushroom",
    "金針菇": "enoki mushroom", "鴻喜菇": "shimeji mushroom",
    "黑木耳": "black fungus", "銀耳": "white fungus",
    "玉米": "corn", "玉米筍": "baby corn",
    "花椰菜": "cauliflower", "青花菜": "broccoli",
    "竹筍": "bamboo shoot", "筊白筍": "water bamboo",
    "蘆筍": "asparagus", "秋葵": "okra",
    "四季豆": "green bean", "豌豆": "pea", "毛豆": "edamame",
    "韭菜": "chives", "芹菜": "celery",
    "豆芽菜": "bean sprouts", "豆芽": "bean sprouts",
    "蓮藕": "lotus root", "牛蒡": "burdock",
    "水蓮": "water spinach", "九層塔": "basil",
    "香菜": "cilantro", "芫荽": "cilantro",
    "荸薺": "water chestnut", "櫛瓜": "zucchini",
    "甜菜根": "beet",
    # ── 豆製品 ──
    "豆腐": "tofu", "嫩豆腐": "silken tofu", "板豆腐": "firm tofu",
    "豆乾": "dried tofu", "豆皮": "tofu skin",
    "油豆腐": "fried tofu", "百頁豆腐": "tofu",
    "豆漿": "soy milk", "黃豆": "soybean",
    "紅豆": "red bean", "綠豆": "mung bean", "黑豆": "black bean",
    # ── 水果 ──
    "蘋果": "apple", "香蕉": "banana",
    "橘子": "tangerine", "柳橙": "orange",
    "葡萄": "grape", "奇異果": "kiwi", "芒果": "mango",
    "鳳梨": "pineapple", "西瓜": "watermelon", "木瓜": "papaya",
    "芭樂": "guava", "蓮霧": "wax apple",
    "龍眼": "longan", "荔枝": "lychee",
    "百香果": "passion fruit", "火龍果": "dragon fruit",
    "酪梨": "avocado", "檸檬": "lemon", "萊姆": "lime",
    "草莓": "strawberry", "藍莓": "blueberry",
    "櫻桃": "cherry", "梨": "pear", "水蜜桃": "peach",
    "柿子": "persimmon", "釋迦": "sugar apple",
    "榴槤": "durian", "椰子": "coconut",
    "葡萄柚": "grapefruit", "柚子": "pomelo",
    # ── 調味料 ──
    "醬油": "soy sauce", "醬油膏": "thick soy sauce",
    "蠔油": "oyster sauce", "米酒": "rice wine",
    "麻油": "sesame oil", "香油": "sesame oil",
    "橄欖油": "olive oil", "沙拉油": "vegetable oil",
    "醋": "vinegar", "白醋": "white vinegar",
    "番茄醬": "ketchup", "豆瓣醬": "chili bean paste",
    "味噌": "miso", "味醂": "mirin",
    "太白粉": "cornstarch", "麵粉": "flour",
    "鹽": "salt", "胡椒": "pepper",
    "咖哩粉": "curry powder", "五香粉": "five-spice powder",
    "八角": "star anise", "花椒": "Sichuan pepper",
    "沙茶醬": "shacha sauce", "甜麵醬": "sweet bean paste",
    "芝麻醬": "sesame paste", "花生醬": "peanut butter",
    "椰漿": "coconut milk",
    # ── 堅果 ──
    "花生": "peanut", "核桃": "walnut", "杏仁": "almond",
    "腰果": "cashew", "芝麻": "sesame",
    "松子": "pine nut", "開心果": "pistachio",
}

_EN_ZH_FALLBACK_MAP: dict[str, str] = {
    # ── 蔬菜 ──
    "cabbage": "高麗菜", "napa cabbage": "大白菜",
    "bok choy": "小白菜", "pak choi": "小白菜",
    "water spinach": "空心菜", "spinach": "菠菜",
    "lettuce": "萵苣", "romaine": "萵苣",
    "tomato": "番茄", "cherry tomato": "小番茄",
    "carrot": "紅蘿蔔", "daikon": "白蘿蔔", "radish": "白蘿蔔",
    "potato": "馬鈴薯", "sweet potato": "地瓜",
    "taro": "芋頭", "yam": "山藥",
    "pumpkin": "南瓜", "winter melon": "冬瓜",
    "bitter melon": "苦瓜", "bitter gourd": "苦瓜",
    "loofah": "絲瓜", "luffa": "絲瓜",
    "eggplant": "茄子", "aubergine": "茄子",
    "cucumber": "小黃瓜", "zucchini": "櫛瓜",
    "bell pepper": "甜椒", "green pepper": "青椒",
    "onion": "洋蔥", "green onion": "蔥", "scallion": "蔥",
    "shallot": "紅蔥頭", "leek": "韭菜",
    "garlic": "大蒜", "ginger": "薑",
    "chili": "辣椒", "chili pepper": "辣椒",
    "mushroom": "蘑菇", "shiitake": "香菇", "shiitake mushroom": "香菇",
    "enoki mushroom": "金針菇", "king oyster mushroom": "杏鮑菇",
    "black fungus": "黑木耳", "wood ear": "黑木耳", "white fungus": "銀耳",
    "corn": "玉米", "baby corn": "玉米筍",
    "broccoli": "青花菜", "cauliflower": "花椰菜",
    "bamboo shoot": "竹筍", "asparagus": "蘆筍", "okra": "秋葵",
    "green bean": "四季豆", "string bean": "四季豆",
    "pea": "豌豆", "snow pea": "荷蘭豆", "edamame": "毛豆",
    "bean sprouts": "豆芽菜", "bean sprout": "豆芽菜",
    "celery": "芹菜", "chives": "韭菜",
    "lotus root": "蓮藕", "burdock": "牛蒡",
    "basil": "九層塔", "cilantro": "香菜", "coriander": "香菜",
    "water chestnut": "荸薺", "watercress": "西洋菜",
    "kale": "羽衣甘藍", "arugula": "芝麻菜",
    "beet": "甜菜根", "beetroot": "甜菜根",
    "chrysanthemum greens": "茼蒿",
    "sweet potato leaves": "地瓜葉",
    # ── 肉類 ──
    "chicken": "雞肉", "chicken breast": "雞胸肉",
    "chicken thigh": "雞腿", "chicken wing": "雞翅",
    "chicken leg": "雞腿", "chicken drumstick": "棒棒腿",
    "pork": "豬肉", "pork belly": "五花肉", "pork loin": "里肌肉",
    "pork chop": "豬排", "spare ribs": "排骨", "pork ribs": "排骨",
    "ground pork": "豬絞肉", "ground beef": "牛絞肉",
    "ground meat": "絞肉", "minced meat": "絞肉",
    "beef": "牛肉", "steak": "牛排",
    "beef brisket": "牛腩", "beef shank": "牛腱",
    "lamb": "羊肉", "lamb chop": "羊排",
    "duck": "鴨肉", "duck breast": "鴨胸",
    "goose": "鵝肉",
    "bacon": "培根", "ham": "火腿", "sausage": "香腸",
    # ── 海鮮 ──
    "shrimp": "蝦", "prawn": "蝦",
    "salmon": "鮭魚", "tuna": "鮪魚", "cod": "鱈魚",
    "tilapia": "鯛魚", "mackerel": "鯖魚", "sea bass": "鱸魚",
    "fish": "魚", "fish fillet": "魚片",
    "clam": "蛤蜊", "squid": "魷魚", "cuttlefish": "花枝",
    "octopus": "章魚", "scallop": "干貝",
    "oyster": "牡蠣", "crab": "螃蟹",
    "kelp": "海帶", "seaweed": "海帶", "nori": "海苔",
    "dried shrimp": "蝦米",
    # ── 豆製品 ──
    "tofu": "豆腐", "firm tofu": "板豆腐", "silken tofu": "嫩豆腐",
    "dried tofu": "豆乾", "tofu skin": "豆皮",
    "fried tofu": "油豆腐",
    "soy milk": "豆漿", "soybean": "黃豆",
    "red bean": "紅豆", "mung bean": "綠豆", "black bean": "黑豆",
    # ── 蛋奶 ──
    "egg": "雞蛋", "duck egg": "鴨蛋", "century egg": "皮蛋",
    "milk": "牛奶", "cream": "鮮奶油", "butter": "奶油",
    "cheese": "乳酪", "yogurt": "優格",
    "parmesan": "帕瑪森乳酪", "mozzarella": "莫札瑞拉乳酪",
    # ── 水果 ──
    "apple": "蘋果", "banana": "香蕉",
    "orange": "柳橙", "tangerine": "橘子", "mandarin": "橘子",
    "grape": "葡萄", "kiwi": "奇異果", "kiwifruit": "奇異果",
    "mango": "芒果", "pineapple": "鳳梨",
    "watermelon": "西瓜", "papaya": "木瓜",
    "guava": "芭樂", "wax apple": "蓮霧",
    "longan": "龍眼", "lychee": "荔枝",
    "passion fruit": "百香果", "dragon fruit": "火龍果",
    "avocado": "酪梨", "lemon": "檸檬", "lime": "萊姆",
    "strawberry": "草莓", "blueberry": "藍莓",
    "cherry": "櫻桃", "pear": "梨", "peach": "水蜜桃",
    "persimmon": "柿子", "durian": "榴槤",
    "coconut": "椰子", "grapefruit": "葡萄柚", "pomelo": "柚子",
    # ── 主食 ──
    "rice": "白米", "brown rice": "糙米", "glutinous rice": "糯米",
    "noodles": "麵", "pasta": "義大利麵", "spaghetti": "義大利麵",
    "udon": "烏龍麵", "ramen": "拉麵", "soba": "蕎麥麵",
    "bread": "麵包", "toast": "吐司",
    "dumpling": "水餃", "wonton": "餛飩",
    "rice noodle": "米粉", "vermicelli": "冬粉",
    # ── 調味料 ──
    "soy sauce": "醬油", "oyster sauce": "蠔油",
    "rice wine": "米酒", "cooking wine": "米酒",
    "sesame oil": "麻油", "olive oil": "橄欖油",
    "vegetable oil": "沙拉油", "peanut oil": "花生油",
    "vinegar": "醋", "rice vinegar": "米醋",
    "sugar": "糖", "brown sugar": "黑糖", "rock sugar": "冰糖",
    "honey": "蜂蜜",
    "salt": "鹽", "pepper": "胡椒", "black pepper": "黑胡椒",
    "cornstarch": "太白粉", "flour": "麵粉",
    "ketchup": "番茄醬", "tomato sauce": "番茄醬",
    "miso": "味噌", "mirin": "味醂",
    "curry powder": "咖哩粉", "turmeric": "薑黃",
    "star anise": "八角", "cinnamon": "肉桂",
    "bay leaf": "月桂葉", "five-spice powder": "五香粉",
    "sesame paste": "芝麻醬", "peanut butter": "花生醬",
    "coconut milk": "椰漿", "coconut cream": "椰漿",
    # ── 堅果 ──
    "peanut": "花生", "walnut": "核桃", "almond": "杏仁",
    "cashew": "腰果", "sesame": "芝麻",
    "pine nut": "松子", "pistachio": "開心果",
    "macadamia": "夏威夷豆",
}


def _normalize_zh_term(text: str) -> str:
    s = (text or "").strip()
    for token in [
        "台灣", "臺灣", "熟", "生", "水煮", "油炸", "清蒸", "切片", "切丁", "切絲", "片", "湯",
        "大塊", "小塊", "細", "粗", "去皮", "帶皮", "塊", "丁", "絲",
    ]:
        s = s.replace(token, "")
    for ch in "()（）[]【】,，.。:：;；*xX/\\":
        s = s.replace(ch, "")
    return s.strip()


def _fallback_translate_zh_to_en(zh_text: str) -> str:
    normalized = _normalize_zh_term(zh_text)
    if not normalized:
        return zh_text

    for zh, en in _ZH_EN_FALLBACK_MAP.items():
        if zh in normalized:
            return en

    return zh_text


def init_translator() -> None:
    """啟動 argos_worker 子程序（延遲啟動，首次翻譯時自動觸發）。"""
    global _initialized
    if _initialized:
        return
    # 子程序在首次 translate 時自動啟動，這裡只標記已初始化
    _initialized = True
    logger.info("translate_service 初始化完成（子程序模式，延遲啟動）")


def _clean_translation(text: str) -> str:
    """移除翻譯結果中的尾端標點符號（argostranslate 常加句點）。"""
    return text.strip().rstrip(".,。，、；;:：!！?？").strip()


def translate_to_english(zh_text: str, *, return_status: bool = False) -> str | tuple[str, bool]:
    """中文 → 英文（透過 argos_worker 子程序）。
    return_status=True 時回傳 (text, success) tuple。"""
    if not zh_text.strip():
        return (zh_text, False) if return_status else zh_text

    result = _argos.translate(zh_text, "zh", "en")
    if result:
        cleaned = _clean_translation(result)
        logger.debug("translate zh→en: '{}' → '{}'", zh_text, cleaned)
        return (cleaned, True) if return_status else cleaned

    # fallback
    fallback = _fallback_translate_zh_to_en(zh_text)
    used_fallback = fallback != zh_text
    if used_fallback:
        logger.info("zh→en fallback 命中: '{}' -> '{}'", zh_text, fallback)
    return (fallback, used_fallback) if return_status else fallback


def _fallback_translate_en_to_zh(en_text: str) -> str:
    """英→中 fallback：先嘗試完整匹配，再嘗試子字串匹配。"""
    normalized = en_text.strip().lower()
    if not normalized:
        return en_text

    # 完整匹配
    if normalized in _EN_ZH_FALLBACK_MAP:
        return _EN_ZH_FALLBACK_MAP[normalized]

    # 子字串匹配（長 key 優先）
    for en, zh in sorted(_EN_ZH_FALLBACK_MAP.items(), key=lambda x: len(x[0]), reverse=True):
        if en in normalized:
            return zh

    return en_text


def translate_to_chinese(en_text: str, *, return_status: bool = False) -> str | tuple[str, bool]:
    """英文 → 中文（透過 argos_worker 子程序），輸出結果再轉繁體。
    return_status=True 時回傳 (text, success) tuple。"""
    if not en_text.strip():
        return (en_text, False) if return_status else en_text

    result = _argos.translate(en_text, "en", "zh")
    if result:
        traditional = _clean_translation(_s2t.convert(result))
        logger.debug("translate en→zh: '{}' → '{}' (繁體: '{}')",
                     en_text, result, traditional)
        return (traditional, True) if return_status else traditional

    # fallback
    fallback = _fallback_translate_en_to_zh(en_text)
    used_fallback = fallback != en_text
    if used_fallback:
        logger.info("en→zh fallback 命中: '{}' -> '{}'", en_text, fallback)
    return (fallback, used_fallback) if return_status else fallback
