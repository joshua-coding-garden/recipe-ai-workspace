"""
recipe_analyzer.py - 食譜分析 7 步管道

步驟：
  1. AI 提取食材關鍵字
  2. 每個關鍵字語言偵測
  3. 雙向翻譯（argostranslate + fallback）
  4. 同義詞展開（中文 → MoeDict，英文 → WordNet）
  5. pg_trgm 相似度搜尋，合併中英文候選（前 20）
  6. 規則優先重排序 + AI 最終判斷最佳匹配
  7. 彙總輸出（無匹配 → "未找到"）
"""
import uuid
import asyncio
from typing import Any
from loguru import logger

from app.config import settings
from app.services import ai_service, language_detector
from app.services.synonym_service import get_chinese_synonyms, get_english_synonyms
from app.services.alias_service import alias_service
from app.services.translate_service import translate_to_english, translate_to_chinese
from app.services.similarity_service import (
    get_exact_candidates,
    get_char_candidates,
    get_candidates,
    get_candidates_separate,
    get_candidates_separate_exact,
)


_LOOKUP_CONCURRENCY = 6
_LOOKUP_TIMEOUT_SEC = 20.0


_ZH_BASE_NORMALIZATION = {
    # ── 原有 ──
    "雞胸肉": "雞胸",
    "高麗菜": "甘藍",
    # ── 蔬菜類 ──
    "紅蘿蔔": "胡蘿蔔", "白蘿蔔": "蘿蔔", "菜頭": "蘿蔔",
    "大白菜": "白菜", "小白菜": "白菜", "山東白菜": "白菜", "娃娃菜": "白菜",
    "青椒": "甜椒", "紅椒": "甜椒", "黃椒": "甜椒", "彩椒": "甜椒",
    "空心菜": "蕹菜", "地瓜葉": "甘薯葉", "番薯葉": "甘薯葉",
    "A菜": "萵苣", "蘿蔓": "萵苣", "美生菜": "萵苣", "大陸妹": "萵苣",
    "花椰菜": "花菜", "白花椰菜": "花菜",
    "青花菜": "青花椰菜", "西蘭花": "青花椰菜", "綠花椰菜": "青花椰菜",
    "甜玉米": "玉米", "水果玉米": "玉米",
    "香菇": "鮮香菇", "乾香菇": "乾香菇",
    "杏鮑菇": "杏鮑菇", "金針菇": "金針菇", "鴻喜菇": "鴻喜菇",
    "雪白菇": "雪白菇", "秀珍菇": "秀珍菇", "猴頭菇": "猴頭菇",
    "木耳": "黑木耳", "白木耳": "銀耳", "雲耳": "黑木耳",
    "蒜頭": "大蒜", "蒜末": "大蒜", "蒜泥": "大蒜", "蒜瓣": "大蒜", "蒜苗": "蒜苗",
    "薑片": "薑", "薑末": "薑", "嫩薑": "薑", "老薑": "薑", "薑絲": "薑",
    "蔥花": "蔥", "蔥段": "蔥", "蔥白": "蔥", "青蔥": "蔥", "蔥絲": "蔥",
    "朝天椒": "辣椒", "小辣椒": "辣椒", "紅辣椒": "辣椒", "青辣椒": "辣椒",
    "紫洋蔥": "洋蔥", "紅洋蔥": "洋蔥", "白洋蔥": "洋蔥",
    "地瓜": "甘薯", "番薯": "甘薯", "紅心地瓜": "甘薯",
    "南瓜": "南瓜", "栗子南瓜": "南瓜",
    "冬瓜": "冬瓜", "苦瓜": "苦瓜", "白苦瓜": "苦瓜", "山苦瓜": "苦瓜",
    "絲瓜": "絲瓜", "澎湖絲瓜": "絲瓜",
    "韭菜": "韭菜", "韭菜花": "韭菜花", "韭黃": "韭黃",
    "芹菜": "芹菜", "西洋芹": "芹菜", "西芹": "芹菜",
    "茄子": "茄子", "日本茄子": "茄子",
    "豆芽": "豆芽菜", "豆芽菜": "豆芽菜", "黃豆芽": "黃豆芽", "綠豆芽": "綠豆芽",
    "四季豆": "四季豆", "敏豆": "四季豆",
    "豌豆": "豌豆", "荷蘭豆": "豌豆", "甜豆": "甜豆",
    "毛豆": "毛豆", "毛豆仁": "毛豆",
    "秋葵": "秋葵", "蘆筍": "蘆筍", "綠蘆筍": "蘆筍", "白蘆筍": "蘆筍",
    "筊白筍": "筊白筍", "茭白筍": "筊白筍", "美人腿": "筊白筍",
    "竹筍": "竹筍", "綠竹筍": "竹筍", "麻竹筍": "竹筍", "桂竹筍": "竹筍",
    "蓮藕": "蓮藕", "牛蒡": "牛蒡", "山藥": "山藥", "日本山藥": "山藥",
    "九層塔": "九層塔", "羅勒": "九層塔",
    "香菜": "芫荽", "芫荽": "芫荽",
    "菠菜": "菠菜", "莧菜": "莧菜", "紅莧菜": "莧菜",
    "龍鬚菜": "龍鬚菜", "過貓": "過貓",
    "小黃瓜": "小黃瓜", "大黃瓜": "大黃瓜", "胡瓜": "小黃瓜",
    "番茄": "番茄", "小番茄": "小番茄", "牛番茄": "番茄", "聖女番茄": "小番茄",
    "西紅柿": "番茄",
    "豆薯": "豆薯", "荸薺": "荸薺", "馬蹄": "荸薺",
    "芋頭": "芋頭", "小芋頭": "芋頭",
    "紅鳳菜": "紅鳳菜", "川七": "川七",
    "油菜": "油菜", "青江菜": "青江菜", "小松菜": "小松菜",
    "芥菜": "芥菜", "刈菜": "芥菜", "長年菜": "芥菜", "雪裡紅": "雪裡紅",
    "茼蒿": "茼蒿", "皇宮菜": "皇宮菜",
    "水蓮": "水蓮", "山蘇": "山蘇",
    "甜菜根": "甜菜根", "櫛瓜": "櫛瓜", "節瓜": "櫛瓜",
    "西洋菜": "西洋菜", "豆苗": "豆苗",
    # ── 肉類 ──
    "雞腿肉": "雞腿", "雞柳": "雞胸", "雞里肌": "雞胸",
    "雞翅": "雞翅", "雞翅膀": "雞翅", "棒棒腿": "棒棒腿",
    "雞肉": "雞肉", "土雞": "雞肉", "仿土雞": "雞肉",
    "雞腳": "雞爪", "雞爪": "雞爪",
    "豬五花": "五花肉", "五花肉": "五花肉", "三層肉": "五花肉",
    "豬里肌": "里肌肉", "豬排": "里肌肉", "里肌": "里肌肉",
    "豬絞肉": "絞肉", "牛絞肉": "絞肉", "絞肉": "絞肉",
    "豬肉": "豬肉", "梅花肉": "梅花肉", "松阪豬": "松阪豬",
    "豬腳": "豬腳", "豬蹄": "豬腳", "豬腱": "豬腱",
    "排骨": "排骨", "豬小排": "排骨", "肋排": "排骨",
    "牛肉": "牛肉", "牛腩": "牛腩", "牛腱": "牛腱",
    "牛排": "牛排", "沙朗": "牛排", "菲力": "菲力",
    "牛肋條": "牛肋條", "牛小排": "牛小排",
    "羊肉": "羊肉", "羊排": "羊排", "羊腿": "羊腿",
    "鴨肉": "鴨肉", "鴨胸": "鴨胸", "鴨腿": "鴨腿",
    "鵝肉": "鵝肉",
    "培根": "培根", "火腿": "火腿", "香腸": "香腸",
    "臘腸": "臘腸", "臘肉": "臘肉",
    "肉鬆": "肉鬆", "肉乾": "肉乾", "肉絲": "豬肉",
    # ── 海鮮 ──
    "蝦仁": "蝦", "草蝦": "蝦", "白蝦": "蝦", "明蝦": "蝦",
    "蝦子": "蝦", "蝦米": "蝦米", "櫻花蝦": "櫻花蝦",
    "鮭魚": "鮭魚", "鯛魚": "鯛魚", "鱈魚": "鱈魚",
    "鱸魚": "鱸魚", "秋刀魚": "秋刀魚", "鯖魚": "鯖魚",
    "吳郭魚": "吳郭魚", "虱目魚": "虱目魚", "石斑": "石斑魚",
    "鮪魚": "鮪魚", "旗魚": "旗魚", "土魠魚": "土魠魚",
    "魚片": "魚", "魚排": "魚",
    "蛤蜊": "蛤蜊", "蛤仔": "蛤蜊", "文蛤": "蛤蜊",
    "花枝": "花枝", "魷魚": "魷魚", "透抽": "魷魚", "小卷": "小卷",
    "章魚": "章魚", "干貝": "干貝",
    "牡蠣": "牡蠣", "蚵仔": "牡蠣", "生蠔": "牡蠣",
    "螃蟹": "螃蟹", "蟹肉": "螃蟹",
    "海帶": "海帶", "昆布": "海帶", "海苔": "海苔", "紫菜": "紫菜",
    # ── 豆製品 ──
    "板豆腐": "豆腐", "嫩豆腐": "嫩豆腐", "凍豆腐": "凍豆腐",
    "豆干": "豆乾", "豆乾": "豆乾", "百頁豆腐": "百頁豆腐",
    "豆皮": "豆皮", "油豆腐": "油豆腐",
    "豆漿": "豆漿", "黃豆": "黃豆", "黑豆": "黑豆",
    "紅豆": "紅豆", "綠豆": "綠豆", "花豆": "花豆",
    # ── 調味料 ──
    "醬油": "醬油", "醬油膏": "醬油膏", "蠔油": "蠔油",
    "米酒": "米酒", "料理酒": "米酒", "紹興酒": "紹興酒",
    "麻油": "麻油", "香油": "麻油", "芝麻油": "麻油",
    "橄欖油": "橄欖油", "沙拉油": "沙拉油", "花生油": "花生油",
    "苦茶油": "苦茶油", "椰子油": "椰子油", "葡萄籽油": "葡萄籽油",
    "白醋": "醋", "烏醋": "醋", "米醋": "醋", "蘋果醋": "醋",
    "白糖": "糖", "砂糖": "糖", "細砂糖": "糖",
    "冰糖": "冰糖", "黑糖": "黑糖", "紅糖": "黑糖",
    "太白粉": "太白粉", "玉米粉": "玉米澱粉", "地瓜粉": "番薯粉",
    "樹薯粉": "樹薯粉", "日本太白粉": "太白粉",
    "中筋麵粉": "麵粉", "低筋麵粉": "低筋麵粉", "高筋麵粉": "高筋麵粉",
    "番茄醬": "番茄醬", "豆瓣醬": "豆瓣醬", "甜麵醬": "甜麵醬",
    "沙茶醬": "沙茶醬", "辣椒醬": "辣椒醬", "XO醬": "XO醬",
    "味醂": "味醂", "味噌": "味噌", "柴魚": "柴魚",
    "五香粉": "五香粉", "白胡椒": "胡椒", "黑胡椒": "胡椒",
    "咖哩粉": "咖哩粉", "薑黃粉": "薑黃", "肉桂粉": "肉桂",
    "八角": "八角", "花椒": "花椒", "月桂葉": "月桂葉",
    "鹽巴": "鹽", "食鹽": "鹽", "海鹽": "鹽", "岩鹽": "鹽",
    "味精": "味精", "雞粉": "雞粉", "高湯塊": "高湯塊",
    "芝麻醬": "芝麻醬", "花生醬": "花生醬",
    "椰漿": "椰漿", "椰奶": "椰漿",
    # ── 水果 ──
    "蘋果": "蘋果", "青蘋果": "蘋果",
    "香蕉": "香蕉", "芭蕉": "香蕉",
    "橘子": "橘子", "柑橘": "橘子", "桶柑": "橘子",
    "柳橙": "柳橙", "柳丁": "柳橙",
    "葡萄": "葡萄", "巨峰葡萄": "葡萄",
    "奇異果": "奇異果", "獼猴桃": "奇異果",
    "芒果": "芒果", "愛文芒果": "芒果",
    "鳳梨": "鳳梨", "菠蘿": "鳳梨",
    "西瓜": "西瓜", "木瓜": "木瓜", "青木瓜": "木瓜",
    "芭樂": "芭樂", "蓮霧": "蓮霧",
    "龍眼": "龍眼", "桂圓": "龍眼",
    "荔枝": "荔枝", "百香果": "百香果",
    "火龍果": "火龍果", "紅龍果": "火龍果",
    "酪梨": "酪梨",
    "檸檬": "檸檬", "萊姆": "萊姆",
    "水蜜桃": "水蜜桃", "桃子": "水蜜桃",
    "李子": "李子", "梅子": "梅",
    "柿子": "柿子", "棗子": "棗",
    "草莓": "草莓", "藍莓": "藍莓", "覆盆子": "覆盆子", "蔓越莓": "蔓越莓",
    "櫻桃": "櫻桃", "梨子": "梨", "水梨": "梨",
    "哈密瓜": "哈密瓜", "香瓜": "香瓜",
    "釋迦": "釋迦", "榴槤": "榴槤",
    # ── 蛋奶 ──
    "雞蛋": "雞蛋", "鴨蛋": "鴨蛋", "皮蛋": "皮蛋", "鹹蛋": "鹹蛋",
    "鵪鶉蛋": "鵪鶉蛋", "蛋黃": "蛋黃", "蛋白": "蛋白",
    "鮮奶": "牛奶", "全脂牛奶": "牛奶", "低脂牛奶": "低脂牛奶",
    "脫脂牛奶": "脫脂牛奶", "保久乳": "牛奶",
    "鮮奶油": "鮮奶油", "奶油": "奶油", "無鹽奶油": "奶油",
    "起司": "乳酪", "起士": "乳酪", "乳酪": "乳酪",
    "帕瑪森起司": "帕瑪森乳酪", "莫札瑞拉起司": "莫札瑞拉乳酪",
    "優格": "優格", "優酪乳": "優酪乳",
    # ── 主食 ──
    "白飯": "白米飯", "米飯": "白米飯",
    "糙米": "糙米", "白米": "白米", "糯米": "糯米",
    "義大利麵": "義大利麵", "筆管麵": "義大利麵", "螺旋麵": "義大利麵",
    "拉麵": "拉麵", "烏龍麵": "烏龍麵", "蕎麥麵": "蕎麥麵",
    "米粉": "米粉", "冬粉": "冬粉", "粉絲": "冬粉",
    "吐司": "白吐司", "全麥吐司": "全麥吐司",
    "饅頭": "饅頭", "麵包": "麵包", "法國麵包": "法國麵包",
    "麵線": "麵線", "油麵": "油麵", "刀削麵": "刀削麵",
    # ── 堅果 ──
    "花生": "花生", "核桃": "核桃", "杏仁": "杏仁",
    "腰果": "腰果", "芝麻": "芝麻", "黑芝麻": "黑芝麻", "白芝麻": "白芝麻",
    "松子": "松子", "開心果": "開心果", "夏威夷豆": "夏威夷豆",
    "南瓜籽": "南瓜籽", "葵花籽": "葵花籽",
    # ── 加工品 ──
    "水餃": "水餃", "餛飩": "餛飩", "湯圓": "湯圓",
    "年糕": "年糕", "蘿蔔糕": "蘿蔔糕",
    "豬血糕": "豬血糕", "米血": "豬血糕",
}

_EN_TO_ZH_BASE = {
    "cabbage": "高麗菜",
    # ── 蔬菜 ──
    "carrot": "紅蘿蔔", "radish": "白蘿蔔", "daikon": "白蘿蔔",
    "chinese cabbage": "大白菜", "napa cabbage": "大白菜",
    "bok choy": "小白菜", "pak choi": "小白菜",
    "bell pepper": "甜椒", "green pepper": "青椒", "red pepper": "紅椒",
    "water spinach": "空心菜", "sweet potato leaves": "地瓜葉",
    "lettuce": "萵苣", "romaine": "萵苣",
    "cauliflower": "花椰菜", "broccoli": "青花菜",
    "corn": "玉米", "baby corn": "玉米筍", "sweet corn": "甜玉米",
    "shiitake": "香菇", "shiitake mushroom": "香菇",
    "king oyster mushroom": "杏鮑菇", "enoki mushroom": "金針菇",
    "oyster mushroom": "秀珍菇", "mushroom": "蘑菇",
    "black fungus": "黑木耳", "wood ear": "黑木耳", "white fungus": "銀耳",
    "garlic": "大蒜", "ginger": "薑",
    "green onion": "蔥", "scallion": "蔥", "spring onion": "蔥", "leek": "韭菜",
    "chili": "辣椒", "chili pepper": "辣椒", "hot pepper": "辣椒",
    "onion": "洋蔥", "shallot": "紅蔥頭",
    "potato": "馬鈴薯", "sweet potato": "地瓜",
    "pumpkin": "南瓜", "winter melon": "冬瓜",
    "bitter melon": "苦瓜", "bitter gourd": "苦瓜",
    "loofah": "絲瓜", "luffa": "絲瓜",
    "eggplant": "茄子", "aubergine": "茄子",
    "bean sprout": "豆芽菜", "bean sprouts": "豆芽菜",
    "green bean": "四季豆", "string bean": "四季豆",
    "snow pea": "荷蘭豆", "sugar snap pea": "甜豆", "edamame": "毛豆",
    "okra": "秋葵", "asparagus": "蘆筍",
    "bamboo shoot": "竹筍", "water bamboo": "筊白筍",
    "lotus root": "蓮藕", "burdock": "牛蒡",
    "yam": "山藥", "taro": "芋頭",
    "basil": "九層塔", "cilantro": "香菜", "coriander": "香菜",
    "spinach": "菠菜", "amaranth": "莧菜",
    "celery": "芹菜",
    "cucumber": "小黃瓜", "tomato": "番茄", "cherry tomato": "小番茄",
    "water chestnut": "荸薺",
    "zucchini": "櫛瓜", "watercress": "西洋菜",
    "kale": "羽衣甘藍", "arugula": "芝麻菜",
    # ── 肉類 ──
    "chicken": "雞肉", "chicken breast": "雞胸肉", "chicken thigh": "雞腿",
    "chicken wing": "雞翅", "chicken leg": "雞腿",
    "pork": "豬肉", "pork belly": "五花肉", "pork loin": "里肌肉",
    "pork chop": "豬排", "pork ribs": "排骨", "spare ribs": "排骨",
    "ground pork": "豬絞肉", "ground beef": "牛絞肉",
    "beef": "牛肉", "beef brisket": "牛腩", "beef shank": "牛腱",
    "steak": "牛排", "sirloin": "沙朗", "tenderloin": "菲力",
    "lamb": "羊肉", "lamb chop": "羊排", "lamb leg": "羊腿",
    "duck": "鴨肉", "duck breast": "鴨胸",
    "goose": "鵝肉",
    "bacon": "培根", "ham": "火腿", "sausage": "香腸",
    "ground meat": "絞肉", "minced meat": "絞肉",
    # ── 海鮮 ──
    "shrimp": "蝦", "prawn": "蝦",
    "salmon": "鮭魚", "tilapia": "鯛魚", "cod": "鱈魚",
    "tuna": "鮪魚", "mackerel": "鯖魚", "sea bass": "鱸魚",
    "fish": "魚",
    "clam": "蛤蜊", "squid": "魷魚", "cuttlefish": "花枝",
    "octopus": "章魚", "scallop": "干貝",
    "oyster": "牡蠣", "crab": "螃蟹",
    "seaweed": "海帶", "kelp": "海帶", "nori": "海苔",
    "dried shrimp": "蝦米",
    # ── 豆製品 ──
    "tofu": "豆腐", "firm tofu": "板豆腐", "silken tofu": "嫩豆腐",
    "dried tofu": "豆乾", "tofu skin": "豆皮",
    "soy milk": "豆漿", "soybean": "黃豆",
    "red bean": "紅豆", "mung bean": "綠豆",
    "black bean": "黑豆",
    # ── 調味料 ──
    "soy sauce": "醬油", "oyster sauce": "蠔油",
    "rice wine": "米酒", "cooking wine": "米酒",
    "sesame oil": "麻油", "olive oil": "橄欖油",
    "vegetable oil": "沙拉油", "peanut oil": "花生油", "coconut oil": "椰子油",
    "vinegar": "醋", "rice vinegar": "米醋",
    "sugar": "糖", "brown sugar": "黑糖", "rock sugar": "冰糖",
    "cornstarch": "太白粉", "flour": "麵粉",
    "ketchup": "番茄醬", "tomato sauce": "番茄醬",
    "chili bean paste": "豆瓣醬", "miso": "味噌", "mirin": "味醂",
    "curry powder": "咖哩粉", "turmeric": "薑黃",
    "black pepper": "黑胡椒", "white pepper": "白胡椒",
    "star anise": "八角", "cinnamon": "肉桂", "bay leaf": "月桂葉",
    "salt": "鹽", "msg": "味精",
    "sesame paste": "芝麻醬", "peanut butter": "花生醬",
    "coconut milk": "椰漿", "coconut cream": "椰漿",
    "honey": "蜂蜜", "maple syrup": "楓糖漿",
    # ── 水果 ──
    "apple": "蘋果", "banana": "香蕉",
    "orange": "柳橙", "tangerine": "橘子", "mandarin": "橘子",
    "grape": "葡萄", "kiwi": "奇異果", "kiwifruit": "奇異果",
    "mango": "芒果", "pineapple": "鳳梨",
    "watermelon": "西瓜", "papaya": "木瓜",
    "guava": "芭樂", "wax apple": "蓮霧",
    "longan": "龍眼", "lychee": "荔枝", "litchi": "荔枝",
    "passion fruit": "百香果", "dragon fruit": "火龍果", "pitaya": "火龍果",
    "avocado": "酪梨",
    "lemon": "檸檬", "lime": "萊姆",
    "peach": "水蜜桃", "plum": "李子",
    "persimmon": "柿子", "strawberry": "草莓",
    "blueberry": "藍莓", "raspberry": "覆盆子", "cranberry": "蔓越莓",
    "cherry": "櫻桃", "pear": "梨",
    "melon": "哈密瓜", "cantaloupe": "哈密瓜",
    "durian": "榴槤", "coconut": "椰子",
    "grapefruit": "葡萄柚", "pomelo": "柚子",
    # ── 蛋奶 ──
    "egg": "雞蛋", "duck egg": "鴨蛋", "century egg": "皮蛋",
    "milk": "牛奶", "cream": "鮮奶油", "butter": "奶油",
    "cheese": "乳酪", "yogurt": "優格",
    "parmesan": "帕瑪森乳酪", "mozzarella": "莫札瑞拉乳酪",
    # ── 主食 ──
    "rice": "白米", "brown rice": "糙米", "glutinous rice": "糯米",
    "pasta": "義大利麵", "spaghetti": "義大利麵",
    "noodle": "麵", "noodles": "麵",
    "udon": "烏龍麵", "ramen": "拉麵", "soba": "蕎麥麵",
    "rice noodle": "米粉", "vermicelli": "冬粉",
    "bread": "麵包", "toast": "吐司",
    "dumpling": "水餃", "wonton": "餛飩",
    # ── 堅果 ──
    "peanut": "花生", "walnut": "核桃", "almond": "杏仁",
    "cashew": "腰果", "sesame": "芝麻",
    "pine nut": "松子", "pistachio": "開心果", "macadamia": "夏威夷豆",
    "sunflower seed": "葵花籽", "pumpkin seed": "南瓜籽",
}

_RAW_INGREDIENT_NEGATIVE_TOKENS = [
    "粉",
    "醬",
    "汁",
    "湯",
    "罐頭",
    "泡麵",
    "麵",
    "調味",
    "濃縮",
    "速食",
    "noodle",
    "sauce",
    "powder",
    "soup",
    "seasoning",
    "instant",
]

_ONION_VARIANT_TOKENS = [
    "welsh",
    "spring onion",
    "green onion",
    "scallion",
    "shallot",
    "青蔥",
    "小蔥",
]

_ONION_QUERY_TOKENS = [
    "onion",
    "洋蔥",
    "蔥頭",
]


def _build_rerank_query(keyword: str, zh_base: str | None = None, en_base: str | None = None) -> str:
    parts: list[str] = []
    for token in [keyword, zh_base or "", en_base or ""]:
        t = token.strip()
        if t and t not in parts:
            parts.append(t)
    return " ".join(parts)


def _normalize_lookup_bases(keyword: str, lang: str) -> tuple[str, str]:
    """Normalize lookup base terms to reduce corpus naming mismatch."""
    if lang == "zh":
        zh_base = _ZH_BASE_NORMALIZATION.get(keyword, keyword)
        en_base = translate_to_english(keyword)
    else:
        en_base = keyword
        zh_base = _EN_TO_ZH_BASE.get(keyword.lower(), translate_to_chinese(keyword))
    return zh_base, en_base


def _merge_terms(base_terms: list[str], extra_terms: list[str]) -> list[str]:
    merged: list[str] = []
    seen: set[str] = set()
    for term in base_terms + extra_terms:
        token = term.strip()
        if not token or token in seen:
            continue
        seen.add(token)
        merged.append(token)
    return merged


def _contains_negative_token(name: str) -> bool:
    lower_name = name.lower()
    return any(token in name or token in lower_name for token in _RAW_INGREDIENT_NEGATIVE_TOKENS)


def _rule_score_candidate(query_text: str, candidate: dict[str, Any]) -> float:
    name = candidate.get("name", "")
    lower_name = name.lower()
    lower_query = query_text.lower()
    score = float(candidate.get("score", 0.0))

    if query_text and query_text in name:
        score += 0.45
    elif name and name in query_text:
        score += 0.25

    overlap = len(set(query_text) & set(name)) if query_text and name else 0
    score += min(overlap, 3) * 0.08

    if _contains_negative_token(name):
        score -= 0.25

    query_has_onion_variant = any(
        token in query_text or token in lower_query for token in _ONION_VARIANT_TOKENS
    )
    name_has_onion_variant = any(token in lower_name for token in _ONION_VARIANT_TOKENS)
    if query_has_onion_variant and name_has_onion_variant:
        score += 0.22

    is_onion_query = any(token in query_text or token in lower_query for token in _ONION_QUERY_TOKENS)
    if (
        "onion" in lower_name
        and is_onion_query
        and name_has_onion_variant
        and not any(token in query_text or token in lower_query for token in _ONION_VARIANT_TOKENS)
    ):
        score -= 0.3

    return score


def _rerank_candidates(
    keyword: str,
    candidates: list[dict[str, Any]],
    *,
    zh_base: str | None = None,
    en_base: str | None = None,
) -> list[dict[str, Any]]:
    if not candidates:
        return []

    query_text = _build_rerank_query(keyword, zh_base=zh_base, en_base=en_base)

    rescored: list[dict[str, Any]] = []
    for c in candidates:
        copied = dict(c)
        copied["rule_score"] = _rule_score_candidate(query_text, copied)
        rescored.append(copied)

    rescored.sort(key=lambda x: x.get("rule_score", 0.0), reverse=True)
    return rescored


async def analyze(recipe_text: str, servings: int = 1) -> dict[str, Any]:
    """
    執行完整的食譜分析管道。
    回傳包含每個食材匹配結果與總營養的 dict。
    """
    request_id = str(uuid.uuid4())[:8]
    log = logger.bind(request_id=request_id)

    log.info("recipe_analysis_start text_length={} servings={}", len(recipe_text), servings)

    # ── 步驟 1：AI 提取食材關鍵字 ─────────────────────────────────────────
    keywords = await ai_service.extract_keywords(recipe_text)
    log.info("keywords_extracted keywords={} count={}", keywords, len(keywords))

    if not keywords:
        return {
            "request_id": request_id,
            "ingredients": [],
            "total_nutrition": {},
            "message": "無法從食譜中提取食材",
        }

    # ── 步驟 2-6：對每個關鍵字執行雙向搜尋 ──────────────────────────────
    semaphore = asyncio.Semaphore(_LOOKUP_CONCURRENCY)

    async def _run_one(idx: int, kw: str) -> tuple[int, dict[str, Any]]:
        async with semaphore:
            try:
                result = await asyncio.wait_for(
                    _process_keyword(kw, request_id=request_id),
                    timeout=_LOOKUP_TIMEOUT_SEC,
                )
            except TimeoutError:
                logger.bind(request_id=request_id, keyword=kw).warning(
                    "ingredient_lookup_timeout timeout_sec={}",
                    _LOOKUP_TIMEOUT_SEC,
                )
                result = _not_found(kw)
            except Exception as e:
                logger.bind(request_id=request_id, keyword=kw).error(
                    "ingredient_lookup_failed error={}",
                    e,
                )
                result = _not_found(kw)
            return idx, result

    indexed_results = await asyncio.gather(
        *[_run_one(i, kw) for i, kw in enumerate(keywords)]
    )
    indexed_results.sort(key=lambda x: x[0])
    ingredient_results = [result for _, result in indexed_results]

    # ── 步驟 7：彙總總營養（動態累加所有營養素） ───────────────────────
    total: dict[str, float] = {}
    matched_count = 0
    not_found_count = 0

    for item in ingredient_results:
        if item["status"] == "matched" and item.get("nutrition"):
            for key, value in item["nutrition"].items():
                total[key] = total.get(key, 0) + value
            matched_count += 1
        else:
            not_found_count += 1

    log.info(
        "recipe_analysis_complete matched={} not_found={} total_calories={:.1f}",
        matched_count, not_found_count, total.get("calories", 0.0)
    )

    return {
        "request_id": request_id,
        "ingredients": ingredient_results,
        "total_nutrition": total,
        "summary": {"matched": matched_count, "not_found": not_found_count},
    }


async def _process_keyword(keyword: str, request_id: str) -> dict[str, Any]:
    """單一關鍵字的完整處理流程（步驟 2-6）。"""
    log = logger.bind(request_id=request_id, keyword=keyword)

    # ── 步驟 2：語言偵測 ────────────────────────────────────────────────
    lang = language_detector.detect_keyword(keyword)
    log.debug("language_detected lang={}", lang)

    # ── 步驟 3：雙向翻譯 ────────────────────────────────────────────────
    zh_base, en_base = _normalize_lookup_bases(keyword, lang)
    if lang == "zh":
        log.debug("translation_zh_to_en translated={} normalized_zh={}", en_base, zh_base)
    else:
        log.debug("translation_en_to_zh translated={} normalized_en={}", zh_base, en_base)

    # ── 步驟 4：同義詞展開 ───────────────────────────────────────────────
    zh_synonyms = get_chinese_synonyms(zh_base)
    en_synonyms = get_english_synonyms(en_base)
    zh_aliases = alias_service.get_aliases(zh_base)
    en_aliases = alias_service.get_aliases(en_base)

    log.debug("synonyms_zh_expanded synonyms={} source=moedict", zh_synonyms)
    log.debug("synonyms_en_expanded synonyms={} source=wordnet", en_synonyms)
    log.debug("aliases_zh_expanded aliases={} source=override", zh_aliases)
    log.debug("aliases_en_expanded aliases={} source=override", en_aliases)

    zh_exact_terms = _merge_terms([zh_base], zh_aliases)
    en_exact_terms = _merge_terms([en_base], en_aliases)
    zh_terms = _merge_terms([zh_base], zh_synonyms + zh_aliases)
    en_terms = _merge_terms([en_base], en_synonyms + en_aliases)

    # ── 步驟 5：三段式搜尋（精確 → 拆字 → 相似度）─────────────────────────
    candidates = await get_exact_candidates(zh_exact_terms, en_exact_terms, limit=20)
    stage = "exact"

    if not candidates:
        candidates = await get_char_candidates(zh_terms, en_terms=en_terms, limit=20)
        stage = "char"

    if not candidates:
        candidates = await get_candidates(zh_terms, en_terms, limit=20)
        stage = "similarity"

    log.info(
        "candidates_retrieved stage={} count={} top={}",
        stage,
        len(candidates),
        candidates[0]["name"] if candidates else "none",
    )

    # ── 步驟 5b：反向搜尋 fallback ────────────────────────────────────────
    top_score = float(candidates[0].get("score", 0)) if candidates else 0.0
    if not candidates or top_score < 0.4:
        log.info("reverse_search_fallback triggered candidates={} top_score={:.3f}", len(candidates), top_score)
        try:
            from app.services.reverse_search_service import _match_token_against_dbs
            rs_result = await _match_token_against_dbs(keyword)
            rs_candidates = []
            for item in rs_result.get("taiwan_foods", []):
                rs_candidates.append(item)
            for item in rs_result.get("foodb", []):
                rs_candidates.append(item)
            if rs_candidates:
                log.info("reverse_search_fallback_found count={}", len(rs_candidates))
                if not candidates:
                    candidates = rs_candidates
                    stage = "reverse_search"
                else:
                    candidates = candidates + rs_candidates
        except Exception as e:
            log.warning("reverse_search_fallback_error: {}", e)

    if not candidates:
        log.warning("ingredient_not_found")
        return _not_found(keyword)

    # ── 步驟 6：規則優先重排序 + AI 最終判斷 ─────────────────────────────
    reranked = _rerank_candidates(keyword, candidates, zh_base=zh_base, en_base=en_base)
    top_rule = reranked[0] if reranked else None

    if top_rule and float(top_rule.get("rule_score", 0.0)) >= 1.05:
        best = top_rule
        log.info(
            "rule_match_selected selected_id={} selected_name={} rule_score={:.3f}",
            best["id"],
            best["name"],
            float(best.get("rule_score", 0.0)),
        )
    else:
        best = await ai_service.select_best_match(keyword, reranked[:10])

        if not best and reranked:
            best = reranked[0]
            log.info(
                "rule_fallback_selected selected_id={} selected_name={} rule_score={:.3f}",
                best["id"],
                best["name"],
                float(best.get("rule_score", 0.0)),
            )

    if not best:
        log.warning("ingredient_not_found after_ai_check")
        return _not_found(keyword)

    log.info(
        "ai_match_selected selected_id={} selected_name={} source={}",
        best["id"], best["name"], best["source"]
    )

    return {
        "input_name": keyword,
        "matched_name": best["name"],
        "matched_id": best["id"],
        "source": best["source"],
        "score": round(best.get("score", 0), 3),
        "nutrition": best.get("nutrition"),
        "status": "matched",
    }


async def lookup_ingredient(keyword: str, top_n: int = 3) -> list[dict]:
    """
    查詢單一食材，回傳前 top_n 筆匹配結果。
    每筆包含 tw（台灣資料庫）和 en（FooDB）的配對。
    整合 Gemma 搜尋增強：分類 + 搜尋詞擴展 + 灰色地帶驗證。
    """
    from app.services import gemma_search_service

    log = logger.bind(keyword=keyword)

    lang = language_detector.detect_keyword(keyword)

    zh_base, en_base = _normalize_lookup_bases(keyword, lang)

    zh_synonyms = get_chinese_synonyms(zh_base)
    en_synonyms = get_english_synonyms(en_base)
    zh_aliases = alias_service.get_aliases(zh_base)
    en_aliases = alias_service.get_aliases(en_base)

    # Track B：Gemma 搜尋詞擴展（預設關閉，llama-server 單線程逐食材呼叫太慢）
    gemma_zh = []
    gemma_en = []
    if settings.gemma_lookup_enhance:
        gemma_terms = await gemma_search_service.generate_search_terms(keyword)
        gemma_zh = gemma_terms.get("zh_terms", [])
        gemma_en = gemma_terms.get("en_terms", [])
        if gemma_zh or gemma_en:
            log.debug("gemma_search_terms zh={} en={}", gemma_zh, gemma_en)

    zh_exact_terms = _merge_terms([zh_base], zh_aliases)
    en_exact_terms = _merge_terms([en_base], en_aliases)
    zh_terms = _merge_terms([zh_base], zh_synonyms + zh_aliases + gemma_zh)
    en_terms = _merge_terms([en_base], en_synonyms + en_aliases + gemma_en)

    tw_candidates, en_candidates = await get_candidates_separate_exact(
        zh_exact_terms, en_exact_terms, limit=top_n
    )
    stage = "exact"

    if not tw_candidates and not en_candidates:
        tw_candidates, en_candidates = await get_candidates_separate(
            zh_terms, en_terms, limit=top_n
        )
        stage = "similarity"

    tw_candidates = _rerank_candidates(keyword, tw_candidates, zh_base=zh_base, en_base=en_base)[:top_n]
    en_candidates = _rerank_candidates(keyword, en_candidates, zh_base=zh_base, en_base=en_base)[:top_n]

    # Track B：Gemma 灰色地帶驗證（預設關閉，llama-server 單線程逐食材呼叫太慢）
    if settings.gemma_lookup_enhance:
        for candidates_list in [tw_candidates, en_candidates]:
            if candidates_list:
                top = candidates_list[0]
                rs = float(top.get("rule_score", 0.0))
                if 0.3 < rs < 1.05 and len(candidates_list) > 1:
                    verification = await gemma_search_service.verify_match(keyword, top)
                    if not verification["is_correct_match"] and verification["confidence"] > 0.7:
                        log.info(
                            "gemma_verify_swap keyword={} rejected={} reason={} trying_next={}",
                            keyword, top["name"], verification["reason"], candidates_list[1]["name"],
                        )
                        v2 = await gemma_search_service.verify_match(keyword, candidates_list[1])
                        if v2["is_correct_match"]:
                            candidates_list[0], candidates_list[1] = candidates_list[1], candidates_list[0]

    log.info(
        "lookup stage={} tw={} en={}",
        stage,
        len(tw_candidates),
        len(en_candidates),
    )

    # 組成配對：每一筆是 {tw: {...}, en: {...}}
    matches = []
    max_len = max(len(tw_candidates), len(en_candidates), 1)
    for i in range(min(max_len, top_n)):
        tw = tw_candidates[i] if i < len(tw_candidates) else None
        en = en_candidates[i] if i < len(en_candidates) else None
        matches.append({"tw": tw, "en": en})

    return matches


def _not_found(keyword: str) -> dict:
    return {
        "input_name": keyword,
        "matched_name": None,
        "matched_id": None,
        "source": None,
        "score": 0,
        "nutrition": None,
        "status": "not_found",
        "message": "未找到",
    }


def _empty_nutrition() -> dict:
    return {}
