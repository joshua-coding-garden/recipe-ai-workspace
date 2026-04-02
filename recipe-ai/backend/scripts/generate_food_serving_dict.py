"""
食物份量字典生成腳本
依據：衛福部國健署「食物代換表」2019.5 版
功能：
  1. 從 DB 讀取所有 taiwan_foods
  2. 逐筆用名稱比對 → category fallback 決定 serving_unit / serving_grams
  3. 寫入 DB (UPDATE taiwan_foods)
  4. 輸出 JSON 到 backend/resources/ 和 stdout
"""
import asyncio
import json
import os
import re
import sys

import asyncpg

DB_URL = os.getenv("DATABASE_URL", "postgresql://postgres:recipe_ai_pass@localhost:5432/recipe_ai")

# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
# 18 個 taiwan_foods category 的預設份量（官方代換表推導）
# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
CATEGORY_DEFAULTS = {
    "蛋類":              {"unit": "顆",   "grams": 55},
    "肉類":              {"unit": "份",   "grams": 35},
    "魚貝類":            {"unit": "份",   "grams": 35},
    "豆類":              {"unit": "份",   "grams": 40},
    "蔬菜類":            {"unit": "份",   "grams": 100},
    "菇類":              {"unit": "份",   "grams": 100},
    "藻類":              {"unit": "份",   "grams": 100},
    "水果類":            {"unit": "份",   "grams": 130},
    "穀物類":            {"unit": "碗",   "grams": 40},
    "澱粉類":            {"unit": "碗",   "grams": 40},
    "乳品類":            {"unit": "杯",   "grams": 240},
    "飲料類":            {"unit": "杯",   "grams": 240},
    "油脂類":            {"unit": "茶匙", "grams": 5},
    "堅果及種子類":      {"unit": "湯匙", "grams": 10},
    "調味料及香辛料類":  {"unit": "茶匙", "grams": 5},
    "糖類":              {"unit": "茶匙", "grams": 5},
    "糕餅點心類":        {"unit": "個",   "grams": 50},
    "加工調理食品及其他類": {"unit": "份", "grams": 100},
}

# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
# 名稱比對規則（全部依據官方食物代換表 2019.5 版數值）
# 順序重要：先比對到的先用
# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
NAME_PATTERNS = [
    # ━━━ 複合食品覆蓋（必須在所有食材 pattern 之前）━━━
    # 含其他食材字的植物油（避免被 南瓜/玉米/核桃/葡萄/亞麻仁 搶先）
    (r"核桃油|南瓜籽油|葡萄籽油|玉米油|亞麻仁油", {"unit": "茶匙", "grams": 5}),
    # 蛋糕/蛋塔/蛋捲 → 糕點不是蛋
    (r"蛋糕",                             {"unit": "份",   "grams": 80}),
    (r"蛋塔|蛋撻",                        {"unit": "個",   "grams": 55}),
    (r"蛋捲",                             {"unit": "根",   "grams": 25}),
    (r"蛋黃酥|蛋黃芋頭酥",                {"unit": "個",   "grams": 50}),
    (r"蛋餃",                             {"unit": "顆",   "grams": 25}),
    (r"蛋餅皮",                           {"unit": "片",   "grams": 35}),
    (r"蛋酥",                             {"unit": "份",   "grams": 30}),
    (r"雞蛋豆漿",                         {"unit": "杯",   "grams": 190}),
    (r"雞蛋豆腐",                         {"unit": "塊",   "grams": 80}),
    (r"雞蛋麵",                           {"unit": "碗",   "grams": 120}),
    # 飯糰/炒飯 → 不是白飯或肉鬆
    (r"飯糰|飯團|飯捲|御飯",              {"unit": "個",   "grams": 180}),
    (r"炒飯|燴飯|燉飯|焗飯|拌飯|蓋飯",    {"unit": "碗",   "grams": 200}),
    # 三明治/漢堡/披薩 → 複合食品
    (r"三明治",                           {"unit": "份",   "grams": 150}),
    (r"漢堡肉",                           {"unit": "片",   "grams": 80}),
    (r"可樂餅",                           {"unit": "個",   "grams": 70}),
    (r"披薩|比薩",                        {"unit": "片",   "grams": 100}),
    # 玉米粒 → 不是整根玉米
    (r"玉米粒",                           {"unit": "湯匙", "grams": 15}),
    # 其他複合食品
    (r"燒餅",                             {"unit": "個",   "grams": 90}),
    (r"壽司(?!醋|海苔)",                  {"unit": "份",   "grams": 150}),
    (r"乾酪粉",                           {"unit": "湯匙", "grams": 7}),
    (r"芝麻包",                           {"unit": "個",   "grams": 50}),
    (r"蔥油餅(?!皮)",                     {"unit": "張",   "grams": 100}),
    # 堅果中的「桃」→ 不是水果桃
    (r"核桃|胡桃|扁桃仁",                 {"unit": "份",   "grams": 7}),
    # 含「桃」但不是水果
    (r"櫻桃蘿蔔|櫻桃小番茄|櫻桃鴨|桃太郎", {"unit": "份",   "grams": 100}),
    # 水果「桃」特定品種（必須在 catch-all「桃」前）
    (r"楊桃汁",                           {"unit": "杯",   "grams": 240}),
    (r"楊桃",                             {"unit": "顆",   "grams": 227}),
    (r"櫻桃",                             {"unit": "份",   "grams": 80}),
    (r"桃接李",                           {"unit": "顆",   "grams": 120}),

    # ── 乳品類 ──
    (r"起司|乾酪|cheese",             {"unit": "片",   "grams": 23}),   # 2片=45g
    (r"乳酪絲",                       {"unit": "份",   "grams": 35}),   # 35g
    (r"優格|凝態發酵乳",               {"unit": "杯",   "grams": 210}),  # 3/4杯=210g
    (r"優酪乳|稀釋發酵乳|濃稠發酵乳",   {"unit": "杯",   "grams": 240}),  # 1杯=240ml
    (r"奶粉|乳粉",                    {"unit": "湯匙", "grams": 8}),    # 4湯匙=30g
    (r"煉乳",                         {"unit": "湯匙", "grams": 15}),
    (r"冰淇淋",                       {"unit": "球",   "grams": 80}),
    (r"鮮乳|保久乳|調味乳|羊乳|牛奶|牛乳", {"unit": "杯", "grams": 240}),

    # ── 蛋類 ──
    (r"鵪鶉蛋",                       {"unit": "顆",   "grams": 10}),
    (r"鴨蛋|皮蛋|鹹蛋|鹹鴨蛋",         {"unit": "顆",   "grams": 70}),
    (r"蛋[黃白]",                     {"unit": "份",   "grams": 30}),
    (r"蛋",                           {"unit": "顆",   "grams": 55}),   # 雞蛋1顆=55g

    # ── 魚貝類 ──
    (r"蝦米",                         {"unit": "湯匙", "grams": 15}),   # 15g
    (r"小魚干|小魚乾|丁香魚",          {"unit": "份",   "grams": 10}),   # 10g
    (r"蝦皮",                         {"unit": "湯匙", "grams": 20}),   # 20g
    (r"蝦仁",                         {"unit": "份",   "grams": 50}),   # 50g
    (r"蝦|草蝦|白蝦|明蝦|龍蝦",        {"unit": "份",   "grams": 50}),   # 50g
    (r"花枝|透抽|軟絲|小卷|中卷",       {"unit": "份",   "grams": 60}),   # 60g
    (r"章魚",                         {"unit": "份",   "grams": 55}),   # 55g
    (r"魷魚",                         {"unit": "份",   "grams": 60}),
    (r"魚丸|花枝丸|蝦丸|旗魚丸",       {"unit": "顆",   "grams": 14}),   # 55g/4顆
    (r"牡蠣|蚵仔|蚵",                 {"unit": "份",   "grams": 35}),   # 熟35g
    (r"文蛤|蛤蜊|蜆|海瓜子",           {"unit": "份",   "grams": 60}),
    (r"鮭魚|鱒魚|虱目魚|烏魚|鯖魚|秋刀魚", {"unit": "份", "grams": 35}),
    (r"鱈魚|比目魚",                   {"unit": "份",   "grams": 50}),   # 50g
    (r"白鯧",                         {"unit": "份",   "grams": 40}),   # 40g
    (r"海參",                         {"unit": "份",   "grams": 100}),  # 100g
    (r"魚",                           {"unit": "份",   "grams": 35}),   # 一般魚35g

    # ── 肉類 ──
    (r"雞胸|雞里肌|里肌",              {"unit": "份",   "grams": 30}),   # 30g
    (r"雞腿",                         {"unit": "份",   "grams": 40}),   # 40g
    (r"雞翅|雞排",                     {"unit": "份",   "grams": 40}),   # 40g
    (r"雞爪|雞腳|鳳爪",                {"unit": "份",   "grams": 30}),   # 30g
    (r"鴨賞",                         {"unit": "份",   "grams": 25}),   # 25g
    (r"牛腱",                         {"unit": "份",   "grams": 35}),   # 35g
    (r"豬排|豬小排|豬大排",             {"unit": "份",   "grams": 35}),   # 35g
    (r"五花肉|豬蹄膀|梅花肉",           {"unit": "份",   "grams": 40}),
    (r"牛腩|牛肉條",                   {"unit": "份",   "grams": 40}),   # 40g
    (r"香腸|臘腸|蒜味香腸|臘肉",        {"unit": "條",   "grams": 40}),   # 40g
    (r"熱狗",                         {"unit": "條",   "grams": 50}),   # 50g
    (r"培根",                         {"unit": "片",   "grams": 15}),   # 15g
    (r"火腿",                         {"unit": "片",   "grams": 45}),   # 45g
    (r"肉鬆|肉酥|肉脯",               {"unit": "湯匙", "grams": 15}),
    (r"肉乾|牛肉干|牛肉乾|豬肉干|豬肉乾", {"unit": "片", "grams": 20}),
    (r"貢丸|肉丸",                    {"unit": "顆",   "grams": 14}),
    (r"絞肉|肉末|肉燥",                {"unit": "湯匙", "grams": 15}),

    # ── 內臟 ──
    (r"豬肝|雞肝|膽肝",                {"unit": "份",   "grams": 30}),
    (r"豬心",                         {"unit": "份",   "grams": 45}),   # 45g
    (r"豬肚|豬舌",                     {"unit": "份",   "grams": 50}),   # 50g
    (r"雞肫|雞胗",                     {"unit": "份",   "grams": 40}),   # 40g
    (r"豬腎|腰子",                     {"unit": "份",   "grams": 45}),   # 45g
    (r"豬血",                         {"unit": "份",   "grams": 110}),  # 110g
    (r"豬腦",                         {"unit": "份",   "grams": 60}),   # 60g
    (r"豬小腸|豬大腸|大腸",             {"unit": "份",   "grams": 55}),

    # ── 豆類 ──
    (r"嫩豆腐",                       {"unit": "盒",   "grams": 140}),  # 1/2盒=140g
    (r"臭豆腐",                       {"unit": "塊",   "grams": 50}),   # 50g
    (r"油豆腐",                       {"unit": "個",   "grams": 55}),   # 55g
    (r"百頁豆腐",                     {"unit": "份",   "grams": 70}),   # 70g
    (r"豆腐|板豆腐|傳統豆腐",           {"unit": "塊",   "grams": 80}),   # 80g
    (r"豆干|豆乾|五香豆干|小方豆干",     {"unit": "片",   "grams": 35}),   # 35g
    (r"干絲",                         {"unit": "份",   "grams": 40}),   # 40g
    (r"豆包",                         {"unit": "個",   "grams": 30}),   # 30g
    (r"豆漿|豆奶",                     {"unit": "杯",   "grams": 190}),  # 190ml
    (r"味噌",                         {"unit": "湯匙", "grams": 15}),
    (r"毛豆",                         {"unit": "份",   "grams": 50}),   # 50g
    (r"黃豆|黑豆",                     {"unit": "湯匙", "grams": 20}),
    (r"紅豆|綠豆|花豆|鷹嘴豆",          {"unit": "湯匙", "grams": 25}),
    (r"豆豉",                         {"unit": "份",   "grams": 35}),   # 35g
    (r"素雞|素魚",                     {"unit": "份",   "grams": 40}),   # 35-40g
    (r"麵腸|麵丸",                     {"unit": "份",   "grams": 35}),   # 35-40g
    (r"麵筋泡|烤麩",                   {"unit": "份",   "grams": 15}),   # 15-35g
    (r"百頁結",                       {"unit": "份",   "grams": 50}),   # 50g

    # ── 穀物/澱粉 ──
    (r"飯$|白飯|糙米飯|胚芽米飯|什穀飯", {"unit": "碗",   "grams": 160}),  # 1/4碗=40g
    (r"粥|稀飯",                      {"unit": "碗",   "grams": 250}),  # 1/2碗=125g
    (r"吐司|土司",                     {"unit": "片",   "grams": 30}),   # 30g
    (r"麵包|餐包",                     {"unit": "個",   "grams": 30}),   # 30g
    (r"饅頭|花捲",                     {"unit": "個",   "grams": 90}),   # 1/3個=30g
    (r"包子",                         {"unit": "個",   "grams": 90}),
    (r"麵條|拉麵|烏龍麵|麵線|油麵|鍋燒麵", {"unit": "碗", "grams": 120}),
    (r"通心粉|義大利麵",                {"unit": "碗",   "grams": 60}),   # 乾20g
    (r"冬粉",                         {"unit": "把",   "grams": 30}),   # 乾15g=1/2把
    (r"米粉|河粉|粄條|米苔目",          {"unit": "碗",   "grams": 100}),
    (r"餅乾|蘇打餅|蘇打餅干",           {"unit": "片",   "grams": 7}),    # 3片=20g
    (r"水餃",                         {"unit": "顆",   "grams": 25}),
    (r"餛飩",                         {"unit": "顆",   "grams": 10}),
    (r"湯圓|元宵",                     {"unit": "顆",   "grams": 3}),    # 10粒=30g
    (r"粽子|肉粽",                     {"unit": "個",   "grams": 180}),
    (r"年糕",                         {"unit": "塊",   "grams": 30}),   # 30g
    (r"蘿蔔糕",                       {"unit": "塊",   "grams": 50}),   # 50g
    (r"芋頭糕",                       {"unit": "塊",   "grams": 60}),   # 60g
    (r"豬血糕",                       {"unit": "塊",   "grams": 35}),   # 35g
    (r"馬鈴薯|洋芋",                   {"unit": "個",   "grams": 180}),  # 1/2個=90g
    (r"地瓜|番薯|甘藷",                {"unit": "條",   "grams": 110}),  # 1/2個=55g
    (r"芋頭",                         {"unit": "塊",   "grams": 55}),   # 55g
    (r"山藥",                         {"unit": "塊",   "grams": 80}),   # 80g
    (r"南瓜",                         {"unit": "份",   "grams": 85}),   # 85g
    (r"玉米",                         {"unit": "根",   "grams": 128}),  # 2/3根=85g
    (r"燕麥|麥片|麥粉",                {"unit": "湯匙", "grams": 7}),    # 3湯匙=20g
    (r"米$|糙米|白米|小米|糯米|胚芽米|什穀米", {"unit": "杯", "grams": 160}), # 1/8米杯=20g
    (r"蕎麥|大麥|小麥",                {"unit": "份",   "grams": 20}),   # 20g
    (r"麵粉|糯米粉|地瓜粉|太白粉|玉米粉", {"unit": "湯匙", "grams": 7}),
    (r"薏仁",                         {"unit": "湯匙", "grams": 13}),   # 1.5湯匙=20g
    (r"蓮子",                         {"unit": "份",   "grams": 25}),   # 40粒=25g
    (r"栗子",                         {"unit": "顆",   "grams": 7}),    # 3粒大=20g
    (r"菱角",                         {"unit": "顆",   "grams": 8}),    # 8粒=60g
    (r"荸薺|馬蹄",                     {"unit": "顆",   "grams": 13}),   # 8粒=100g
    (r"蓮藕",                         {"unit": "份",   "grams": 100}),  # 100g
    (r"豌豆仁",                       {"unit": "份",   "grams": 70}),   # 70g
    (r"皇帝豆",                       {"unit": "份",   "grams": 65}),   # 65g
    (r"蛋餅皮|蔥油餅皮",               {"unit": "片",   "grams": 35}),   # 35g
    (r"春捲皮",                       {"unit": "張",   "grams": 20}),   # 1.5張=30g
    (r"餃子皮|餛飩皮",                 {"unit": "張",   "grams": 10}),   # 3張=30g
    (r"爆米花",                       {"unit": "杯",   "grams": 15}),   # 1杯=15g

    # ── 水果類（全部依官方可食量）──
    (r"蘋果",                         {"unit": "顆",   "grams": 125}),  # 小1個115-130g
    (r"柳丁|柳橙",                     {"unit": "顆",   "grams": 130}),  # 1個=130g
    (r"椪柑|桶柑|柑橘|橘子|橘",         {"unit": "顆",   "grams": 150}),  # 1個=150g
    (r"葡萄柚",                       {"unit": "顆",   "grams": 220}),  # 3/4個=165g
    (r"柚|文旦",                      {"unit": "片",   "grams": 165}),  # 白柚165g
    (r"木瓜",                         {"unit": "個",   "grams": 450}),  # 1/3個=150g
    (r"西瓜",                         {"unit": "片",   "grams": 180}),  # 1片=180g
    (r"哈密瓜|香瓜|甜瓜|太陽瓜",        {"unit": "片",   "grams": 150}),  # 1/4個=150g
    (r"金煌芒果",                     {"unit": "片",   "grams": 105}),  # 1片=105g
    (r"愛文芒果",                     {"unit": "片",   "grams": 100}),  # 1.5片=150g
    (r"芒果",                         {"unit": "片",   "grams": 105}),  # 1片=105g
    (r"芭樂|番石榴",                   {"unit": "顆",   "grams": 155}),  # 1個=155g
    (r"梨|水梨",                      {"unit": "顆",   "grams": 193}),  # 3/4個=145g
    (r"水蜜桃",                       {"unit": "顆",   "grams": 145}),  # 小1個=145g
    (r"仙桃",                         {"unit": "顆",   "grams": 50}),   # 1個=50g
    (r"桃",                           {"unit": "顆",   "grams": 145}),
    (r"香蕉|芭蕉",                     {"unit": "根",   "grams": 70}),   # 大1/2根=70g
    (r"葡萄",                         {"unit": "份",   "grams": 85}),   # 13個=85g
    (r"荔枝",                         {"unit": "份",   "grams": 100}),  # 9個=100g
    (r"龍眼",                         {"unit": "份",   "grams": 90}),   # 13個=90g
    (r"火龍果",                       {"unit": "份",   "grams": 110}),  # 110g
    (r"奇異果",                       {"unit": "顆",   "grams": 70}),   # 1.5個=105g
    (r"鳳梨",                         {"unit": "片",   "grams": 110}),  # 110g
    (r"草莓",                         {"unit": "份",   "grams": 160}),  # 小16個=160g
    (r"蓮霧",                         {"unit": "顆",   "grams": 83}),   # 2個=165g
    (r"聖女[蕃番]茄|小[蕃番]茄",        {"unit": "份",   "grams": 220}),  # 23個=220g
    (r"番茄|蕃茄",                     {"unit": "顆",   "grams": 220}),  # 大番茄也歸蔬菜但 DB 分在水果
    (r"百香果",                       {"unit": "顆",   "grams": 70}),   # 2個=140g
    (r"釋迦",                         {"unit": "顆",   "grams": 120}),  # 1/2個=60g
    (r"櫻桃",                         {"unit": "份",   "grams": 80}),   # 9個=80g
    (r"柿餅",                         {"unit": "個",   "grams": 33}),   # 3/4個=33g
    (r"紅柿|柿",                      {"unit": "顆",   "grams": 133}),  # 3/4個=100g
    (r"榴[槤蓮]",                     {"unit": "瓣",   "grams": 45}),   # 1/4瓣=45g
    (r"檸檬",                         {"unit": "顆",   "grams": 130}),
    (r"紅棗|黑棗",                     {"unit": "顆",   "grams": 3}),    # 10個=25g
    (r"綠棗",                         {"unit": "顆",   "grams": 65}),   # 2個=130g
    (r"枇杷",                         {"unit": "份",   "grams": 155}),
    (r"楊桃",                         {"unit": "顆",   "grams": 227}),  # 3/4個=170g
    (r"李|李子|加州李",                 {"unit": "顆",   "grams": 120}),
    (r"山竹",                         {"unit": "顆",   "grams": 17}),   # 5個=84g
    (r"紅毛丹",                       {"unit": "份",   "grams": 80}),
    (r"金桔|金棗",                     {"unit": "顆",   "grams": 20}),   # 6個=120g
    (r"椰棗",                         {"unit": "顆",   "grams": 7}),    # 乾 20g/份
    (r"葡萄乾|蔓越莓乾|芒果乾|芭樂乾|鳳梨乾|無花果乾", {"unit": "份", "grams": 20}),
    (r"龍眼干|桂圓",                   {"unit": "份",   "grams": 22}),   # 22g

    # ── 蔬菜類（統一 100g/份）──
    # 大部分走 category default，只有特殊的覆蓋
    (r"蒜頭|蒜仁",                     {"unit": "瓣",   "grams": 5}),
    (r"薑|老薑|嫩薑",                   {"unit": "片",   "grams": 5}),
    (r"辣椒",                         {"unit": "根",   "grams": 10}),

    # ── 油脂類 ──
    (r"沙拉油|大豆油|花生油|芥花油|橄欖油|葵花油|麻油|椰子油|棕櫚油|玉米油|紅花籽油|苦茶油|芝麻油|香油",
                                      {"unit": "茶匙", "grams": 5}),
    (r"豬油|牛油|雞油",                {"unit": "茶匙", "grams": 5}),
    (r"奶油|乳脂|瑪[琪奇]琳|酥油",      {"unit": "茶匙", "grams": 6}),
    (r"美乃滋|蛋黃醬",                 {"unit": "茶匙", "grams": 8}),    # 8g
    (r"沙拉醬",                       {"unit": "茶匙", "grams": 5}),    # 2茶匙=10g
    (r"花生醬",                       {"unit": "茶匙", "grams": 9}),    # 9g
    (r"鮮奶油",                       {"unit": "湯匙", "grams": 13}),   # 13g
    (r"椰漿",                         {"unit": "湯匙", "grams": 30}),   # 30g
    (r"椰奶",                         {"unit": "湯匙", "grams": 55}),   # 55g

    # ── 堅果種子 ──
    (r"花生",                         {"unit": "份",   "grams": 13}),   # 10粒=13g
    (r"杏仁",                         {"unit": "份",   "grams": 7}),    # 5粒=7g
    (r"腰果",                         {"unit": "份",   "grams": 10}),   # 5粒=10g
    (r"核桃",                         {"unit": "份",   "grams": 7}),    # 2粒=7g
    (r"開心果",                       {"unit": "份",   "grams": 10}),   # 15粒=10g
    (r"黑芝麻|白芝麻|芝麻",             {"unit": "茶匙", "grams": 3}),   # 4茶匙=10g
    (r"瓜子",                         {"unit": "湯匙", "grams": 15}),   # 15g
    (r"南瓜子|葵[花瓜]子",              {"unit": "湯匙", "grams": 10}),   # 10g
    (r"亞麻仁|奇亞籽|松子",             {"unit": "湯匙", "grams": 10}),
    (r"夏威夷豆|榛果|胡桃",             {"unit": "份",   "grams": 10}),

    # ── 調味料 ──
    (r"醬油|蠔油|魚露|烏醋|白醋|醋|味醂|料理米酒", {"unit": "湯匙", "grams": 15}),
    (r"豆瓣醬|辣椒醬|番茄醬|甜麵醬|甜辣醬|沙茶醬|XO醬", {"unit": "湯匙", "grams": 15}),
    (r"鹽|胡椒|五香粉|咖哩粉|薑黃|肉桂|白胡椒|黑胡椒",
                                      {"unit": "茶匙", "grams": 3}),
    (r"味[精醂]|雞粉|高湯粉|柴魚粉|鰹魚粉", {"unit": "茶匙", "grams": 3}),
    (r"糖|砂糖|冰糖|黑糖|蜂蜜|楓糖|果糖", {"unit": "茶匙", "grams": 5}),

    # ── 加工調理 ──
    (r"甜不辣",                       {"unit": "份",   "grams": 70}),   # 70g
    (r"泡麵|速食麵|即食麵",             {"unit": "包",   "grams": 100}),
    (r"罐頭",                         {"unit": "份",   "grams": 100}),
    (r"果汁|蔬果汁|蔬菜汁",             {"unit": "杯",   "grams": 240}),
    (r"可樂|汽水|碳酸飲料|沙士",         {"unit": "杯",   "grams": 240}),
    (r"茶$|紅茶|綠茶|烏龍茶|青茶",       {"unit": "杯",   "grams": 240}),
    (r"咖啡",                         {"unit": "杯",   "grams": 240}),
    (r"豆花",                         {"unit": "碗",   "grams": 200}),
    (r"果醬|果凍",                     {"unit": "湯匙", "grams": 15}),
]

# 預編譯 regex
_COMPILED_PATTERNS = [(re.compile(pat, re.IGNORECASE), val) for pat, val in NAME_PATTERNS]


def match_food(food_name: str, category: str) -> dict:
    """決定一筆食物的 serving_unit / serving_grams"""
    for regex, serving in _COMPILED_PATTERNS:
        if regex.search(food_name):
            return {"unit": serving["unit"], "grams": serving["grams"], "source": "name_pattern"}

    default = CATEGORY_DEFAULTS.get(category)
    if default:
        return {"unit": default["unit"], "grams": default["grams"], "source": "category_default"}

    return {"unit": "份", "grams": 100, "source": "fallback"}


async def main():
    print("連接資料庫...")
    conn = await asyncpg.connect(DB_URL)

    try:
        # 1. 確保欄位存在
        print("確認 serving_unit / serving_grams 欄位...")
        await conn.execute("""
            ALTER TABLE taiwan_foods
            ADD COLUMN IF NOT EXISTS serving_unit VARCHAR(20),
            ADD COLUMN IF NOT EXISTS serving_grams NUMERIC(8,2)
        """)

        # 2. 讀取所有食物
        rows = await conn.fetch(
            "SELECT id, food_name, category FROM taiwan_foods ORDER BY category, food_name"
        )
        print(f"共 {len(rows)} 筆食物")

        # 3. 逐筆比對
        foods_dict = {}
        stats = {"name_pattern": 0, "category_default": 0, "fallback": 0}
        updates = []

        for r in rows:
            fid = r["id"]
            fname = r["food_name"]
            cat = r["category"]
            result = match_food(fname, cat)

            foods_dict[str(fid)] = {
                "name": fname,
                "category": cat,
                "unit": result["unit"],
                "grams": result["grams"],
                "source": result["source"],
            }
            stats[result["source"]] += 1
            updates.append((result["unit"], result["grams"], fid))

        print(f"比對結果: name_pattern={stats['name_pattern']}, "
              f"category_default={stats['category_default']}, "
              f"fallback={stats['fallback']}")

        # 4. 批次 UPDATE DB
        print("寫入 DB...")
        await conn.executemany(
            "UPDATE taiwan_foods SET serving_unit = $1, serving_grams = $2 WHERE id = $3",
            updates,
        )
        print(f"已更新 {len(updates)} 筆")

        # 5. 輸出 JSON
        output = {
            "_meta": {
                "version": "1.0.0",
                "source": "衛福部國健署食物代換表 2019.5",
                "total": len(foods_dict),
                "stats": stats,
            },
            "category_defaults": CATEGORY_DEFAULTS,
            "foods": foods_dict,
        }

        # 寫到 /tmp（容器內 resources/ 可能是 bind-mount 無寫入權限）
        out_path = "/tmp/food_serving_dict.json"
        with open(out_path, "w", encoding="utf-8") as f:
            json.dump(output, f, ensure_ascii=False, indent=2)
        print(f"已寫入: {out_path}")

        # 也輸出摘要到 stdout
        for cat in sorted(set(r["category"] for r in rows)):
            cat_foods = [v for v in foods_dict.values() if v["category"] == cat]
            sample = cat_foods[:3]
            print(f"\n  [{cat}] 共 {len(cat_foods)} 筆, 範例:")
            for s in sample:
                print(f"    {s['name']} → {s['unit']} ({s['grams']}g) [{s['source']}]")

    finally:
        await conn.close()

    print("\n完成!")
    return output


if __name__ == "__main__":
    result = asyncio.run(main())
