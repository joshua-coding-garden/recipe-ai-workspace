"""
nutrient_registry.py - 營養素登錄表

定義所有可累加的營養素欄位名稱、顯示標籤、單位、分組與優先序。
taiwan_foods 有 140+ 欄位，FooDB 僅 4 欄位，此登錄表統一管理。
"""
from typing import Any
from decimal import Decimal


# 非營養素欄位（metadata / 系統欄位），需排除
_NON_NUTRIENT_COLUMNS = frozenset({
    "id", "integration_code", "category", "food_name",
    "sample_name", "common_name", "waste_rate",
    "p_m_s_ratio",  # VARCHAR，非數值
    "created_at", "updated_at",
    # FooDB 非營養欄位
    "name", "portion_size_per_day", "flavor", "description",
})


NUTRIENT_REGISTRY: dict[str, dict[str, Any]] = {
    # ── 能量與基本營養素 ──────────────────────────────────────
    "cal_per_100g":              {"label": "熱量",       "label_en": "Calories",           "unit": "kcal", "group": "basic",      "priority": 1},
    "modified_cal_per_100g":     {"label": "修正熱量",   "label_en": "Modified Calories",  "unit": "kcal", "group": "basic",      "priority": 2},
    "water_per_100g":            {"label": "水分",       "label_en": "Water",              "unit": "g",    "group": "basic",      "priority": 3},
    "protein_per_100g":          {"label": "蛋白質",     "label_en": "Protein",            "unit": "g",    "group": "basic",      "priority": 4},
    "fats_per_100g":             {"label": "脂肪",       "label_en": "Fat",                "unit": "g",    "group": "basic",      "priority": 5},
    "saturated_fat_per_100g":    {"label": "飽和脂肪",   "label_en": "Saturated Fat",      "unit": "g",    "group": "basic",      "priority": 6},
    "ash_per_100g":              {"label": "灰分",       "label_en": "Ash",                "unit": "g",    "group": "basic",      "priority": 7},
    "carbon_per_100g":           {"label": "碳水化合物", "label_en": "Carbohydrates",      "unit": "g",    "group": "basic",      "priority": 8},
    "dietary_fiber_per_100g":    {"label": "膳食纖維",   "label_en": "Dietary Fiber",      "unit": "g",    "group": "basic",      "priority": 9},

    # ── 糖類細項 ──────────────────────────────────────────────
    "total_sugar_per_100g":      {"label": "總糖",       "label_en": "Total Sugar",        "unit": "g",    "group": "sugar",      "priority": 10},
    "glucose_per_100g":          {"label": "葡萄糖",     "label_en": "Glucose",            "unit": "g",    "group": "sugar",      "priority": 11},
    "fructose_per_100g":         {"label": "果糖",       "label_en": "Fructose",           "unit": "g",    "group": "sugar",      "priority": 12},
    "galactose_per_100g":        {"label": "半乳糖",     "label_en": "Galactose",          "unit": "g",    "group": "sugar",      "priority": 13},
    "maltose_per_100g":          {"label": "麥芽糖",     "label_en": "Maltose",            "unit": "g",    "group": "sugar",      "priority": 14},
    "sucrose_per_100g":          {"label": "蔗糖",       "label_en": "Sucrose",            "unit": "g",    "group": "sugar",      "priority": 15},
    "lactose_per_100g":          {"label": "乳糖",       "label_en": "Lactose",            "unit": "g",    "group": "sugar",      "priority": 16},

    # ── 礦物質 ────────────────────────────────────────────────
    "sodium_per_100g":           {"label": "鈉",         "label_en": "Sodium",             "unit": "mg",   "group": "mineral",    "priority": 20},
    "potassium_per_100g":        {"label": "鉀",         "label_en": "Potassium",          "unit": "mg",   "group": "mineral",    "priority": 21},
    "calcium_per_100g":          {"label": "鈣",         "label_en": "Calcium",            "unit": "mg",   "group": "mineral",    "priority": 22},
    "magnesium_per_100g":        {"label": "鎂",         "label_en": "Magnesium",          "unit": "mg",   "group": "mineral",    "priority": 23},
    "iron_per_100g":             {"label": "鐵",         "label_en": "Iron",               "unit": "mg",   "group": "mineral",    "priority": 24},
    "zinc_per_100g":             {"label": "鋅",         "label_en": "Zinc",               "unit": "mg",   "group": "mineral",    "priority": 25},
    "phosphorus_per_100g":       {"label": "磷",         "label_en": "Phosphorus",         "unit": "mg",   "group": "mineral",    "priority": 26},
    "copper_per_100g":           {"label": "銅",         "label_en": "Copper",             "unit": "mg",   "group": "mineral",    "priority": 27},
    "manganese_per_100g":        {"label": "錳",         "label_en": "Manganese",          "unit": "mg",   "group": "mineral",    "priority": 28},

    # ── 維生素 A ──────────────────────────────────────────────
    "vitamin_a_total_iu":        {"label": "維生素A總量",     "label_en": "Vitamin A (IU)",         "unit": "IU",   "group": "vitamin",    "priority": 30},
    "retinol_equivalent_ug":     {"label": "視網醇當量",     "label_en": "Retinol Equivalent",     "unit": "μg",   "group": "vitamin",    "priority": 31},
    "retinol_ug":                {"label": "視網醇",         "label_en": "Retinol",                "unit": "μg",   "group": "vitamin",    "priority": 32},
    "alpha_carotene_ug":         {"label": "α-胡蘿蔔素",     "label_en": "Alpha-Carotene",         "unit": "μg",   "group": "vitamin",    "priority": 33},
    "beta_carotene_ug":          {"label": "β-胡蘿蔔素",     "label_en": "Beta-Carotene",          "unit": "μg",   "group": "vitamin",    "priority": 34},

    # ── 維生素 D ──────────────────────────────────────────────
    "vitamin_d_total_iu":        {"label": "維生素D(IU)",     "label_en": "Vitamin D (IU)",         "unit": "IU",   "group": "vitamin",    "priority": 35},
    "vitamin_d_total_ug":        {"label": "維生素D(μg)",     "label_en": "Vitamin D (μg)",         "unit": "μg",   "group": "vitamin",    "priority": 36},
    "vitamin_d2_ug":             {"label": "維生素D2",        "label_en": "Vitamin D2",             "unit": "μg",   "group": "vitamin",    "priority": 37},
    "vitamin_d3_ug":             {"label": "維生素D3",        "label_en": "Vitamin D3",             "unit": "μg",   "group": "vitamin",    "priority": 38},

    # ── 維生素 E ──────────────────────────────────────────────
    "vitamin_e_total_mg":        {"label": "維生素E總量",     "label_en": "Vitamin E Total",        "unit": "mg",   "group": "vitamin",    "priority": 39},
    "alpha_vitamin_e_te_mg":     {"label": "α-維生素E當量",   "label_en": "Alpha-TE",               "unit": "mg",   "group": "vitamin",    "priority": 40},
    "alpha_tocopherol_mg":       {"label": "α-生育醇",       "label_en": "Alpha-Tocopherol",       "unit": "mg",   "group": "vitamin",    "priority": 41},
    "beta_tocopherol_mg":        {"label": "β-生育醇",       "label_en": "Beta-Tocopherol",        "unit": "mg",   "group": "vitamin",    "priority": 42},
    "gamma_tocopherol_mg":       {"label": "γ-生育醇",       "label_en": "Gamma-Tocopherol",       "unit": "mg",   "group": "vitamin",    "priority": 43},
    "delta_tocopherol_mg":       {"label": "δ-生育醇",       "label_en": "Delta-Tocopherol",       "unit": "mg",   "group": "vitamin",    "priority": 44},

    # ── 維生素 K ──────────────────────────────────────────────
    "vitamin_k1_ug":             {"label": "維生素K1",        "label_en": "Vitamin K1",             "unit": "μg",   "group": "vitamin",    "priority": 45},
    "vitamin_k2_mk4_ug":         {"label": "維生素K2(MK-4)",  "label_en": "Vitamin K2 (MK-4)",     "unit": "μg",   "group": "vitamin",    "priority": 46},
    "vitamin_k2_mk7_ug":         {"label": "維生素K2(MK-7)",  "label_en": "Vitamin K2 (MK-7)",     "unit": "μg",   "group": "vitamin",    "priority": 47},

    # ── 維生素 B 群 + C ───────────────────────────────────────
    "vitamin_b1_mg":             {"label": "維生素B1",        "label_en": "Thiamine (B1)",          "unit": "mg",   "group": "vitamin",    "priority": 48},
    "vitamin_b2_mg":             {"label": "維生素B2",        "label_en": "Riboflavin (B2)",        "unit": "mg",   "group": "vitamin",    "priority": 49},
    "niacin_mg":                 {"label": "菸鹼素",         "label_en": "Niacin (B3)",            "unit": "mg",   "group": "vitamin",    "priority": 50},
    "vitamin_b6_mg":             {"label": "維生素B6",        "label_en": "Vitamin B6",             "unit": "mg",   "group": "vitamin",    "priority": 51},
    "vitamin_b12_ug":            {"label": "維生素B12",       "label_en": "Vitamin B12",            "unit": "μg",   "group": "vitamin",    "priority": 52},
    "folate_ug":                 {"label": "葉酸",           "label_en": "Folate",                 "unit": "μg",   "group": "vitamin",    "priority": 53},
    "vitamin_c_mg":              {"label": "維生素C",         "label_en": "Vitamin C",              "unit": "mg",   "group": "vitamin",    "priority": 54},

    # ── 飽和脂肪酸 ────────────────────────────────────────────
    "saturated_fatty_acids_total_mg":  {"label": "飽和脂肪酸總量",   "label_en": "Saturated FA Total",      "unit": "mg",   "group": "fatty_acid", "priority": 60},
    "butyric_acid_4_0_mg":             {"label": "丁酸(4:0)",        "label_en": "Butyric Acid (4:0)",      "unit": "mg",   "group": "fatty_acid", "priority": 61},
    "caproic_acid_6_0_mg":             {"label": "己酸(6:0)",        "label_en": "Caproic Acid (6:0)",      "unit": "mg",   "group": "fatty_acid", "priority": 62},
    "caprylic_acid_8_0_mg":            {"label": "辛酸(8:0)",        "label_en": "Caprylic Acid (8:0)",     "unit": "mg",   "group": "fatty_acid", "priority": 63},
    "capric_acid_10_0_mg":             {"label": "癸酸(10:0)",       "label_en": "Capric Acid (10:0)",      "unit": "mg",   "group": "fatty_acid", "priority": 64},
    "lauric_acid_12_0_mg":             {"label": "月桂酸(12:0)",     "label_en": "Lauric Acid (12:0)",      "unit": "mg",   "group": "fatty_acid", "priority": 65},
    "tridecanoic_acid_13_0_mg":        {"label": "十三酸(13:0)",     "label_en": "Tridecanoic Acid (13:0)", "unit": "mg",   "group": "fatty_acid", "priority": 66},
    "myristic_acid_14_0_mg":           {"label": "肉豆蔻酸(14:0)",   "label_en": "Myristic Acid (14:0)",    "unit": "mg",   "group": "fatty_acid", "priority": 67},
    "pentadecanoic_acid_15_0_mg":      {"label": "十五酸(15:0)",     "label_en": "Pentadecanoic (15:0)",    "unit": "mg",   "group": "fatty_acid", "priority": 68},
    "palmitic_acid_16_0_mg":           {"label": "棕櫚酸(16:0)",     "label_en": "Palmitic Acid (16:0)",    "unit": "mg",   "group": "fatty_acid", "priority": 69},
    "heptadecanoic_acid_17_0_mg":      {"label": "十七酸(17:0)",     "label_en": "Heptadecanoic (17:0)",    "unit": "mg",   "group": "fatty_acid", "priority": 70},
    "stearic_acid_18_0_mg":            {"label": "硬脂酸(18:0)",     "label_en": "Stearic Acid (18:0)",     "unit": "mg",   "group": "fatty_acid", "priority": 71},
    "nonadecanoic_acid_19_0_mg":       {"label": "十九酸(19:0)",     "label_en": "Nonadecanoic (19:0)",     "unit": "mg",   "group": "fatty_acid", "priority": 72},
    "arachidic_acid_20_0_mg":          {"label": "花生酸(20:0)",     "label_en": "Arachidic Acid (20:0)",   "unit": "mg",   "group": "fatty_acid", "priority": 73},
    "behenic_acid_22_0_mg":            {"label": "山崳酸(22:0)",     "label_en": "Behenic Acid (22:0)",     "unit": "mg",   "group": "fatty_acid", "priority": 74},
    "lignoceric_acid_24_0_mg":         {"label": "木蠟酸(24:0)",     "label_en": "Lignoceric Acid (24:0)",  "unit": "mg",   "group": "fatty_acid", "priority": 75},

    # ── 單元不飽和脂肪酸 ──────────────────────────────────────
    "monounsaturated_fatty_acids_total_mg":  {"label": "單元不飽和脂肪酸總量", "label_en": "Monounsat. FA Total",    "unit": "mg",   "group": "fatty_acid", "priority": 76},
    "myristoleic_acid_14_1_mg":              {"label": "肉豆蔻油酸(14:1)",     "label_en": "Myristoleic (14:1)",     "unit": "mg",   "group": "fatty_acid", "priority": 77},
    "palmitoleic_acid_16_1_mg":              {"label": "棕櫚油酸(16:1)",       "label_en": "Palmitoleic (16:1)",     "unit": "mg",   "group": "fatty_acid", "priority": 78},
    "oleic_acid_18_1_mg":                    {"label": "油酸(18:1)",           "label_en": "Oleic Acid (18:1)",      "unit": "mg",   "group": "fatty_acid", "priority": 79},
    "gadoleic_acid_20_1_mg":                 {"label": "鱈油酸(20:1)",         "label_en": "Gadoleic Acid (20:1)",   "unit": "mg",   "group": "fatty_acid", "priority": 80},
    "erucic_acid_22_1_mg":                   {"label": "芥酸(22:1)",           "label_en": "Erucic Acid (22:1)",     "unit": "mg",   "group": "fatty_acid", "priority": 81},

    # ── 多元不飽和脂肪酸 ──────────────────────────────────────
    "polyunsaturated_fatty_acids_total_mg":  {"label": "多元不飽和脂肪酸總量", "label_en": "Polyunsat. FA Total",    "unit": "mg",   "group": "fatty_acid", "priority": 82},
    "linoleic_acid_18_2_mg":                 {"label": "亞麻油酸(18:2)",       "label_en": "Linoleic Acid (18:2)",   "unit": "mg",   "group": "fatty_acid", "priority": 83},
    "linolenic_acid_18_3_mg":                {"label": "次亞麻油酸(18:3)",     "label_en": "Linolenic Acid (18:3)",  "unit": "mg",   "group": "fatty_acid", "priority": 84},
    "octadecatetraenoic_acid_18_4_mg":       {"label": "十八碳四烯酸(18:4)",   "label_en": "Stearidonic (18:4)",     "unit": "mg",   "group": "fatty_acid", "priority": 85},
    "arachidonic_acid_20_4_mg":              {"label": "花生四烯酸(20:4)",     "label_en": "Arachidonic (20:4)",     "unit": "mg",   "group": "fatty_acid", "priority": 86},
    "epa_20_5_mg":                           {"label": "EPA(20:5)",            "label_en": "EPA (20:5)",             "unit": "mg",   "group": "fatty_acid", "priority": 87},
    "dpa_22_5_mg":                           {"label": "DPA(22:5)",            "label_en": "DPA (22:5)",             "unit": "mg",   "group": "fatty_acid", "priority": 88},
    "dha_22_6_mg":                           {"label": "DHA(22:6)",            "label_en": "DHA (22:6)",             "unit": "mg",   "group": "fatty_acid", "priority": 89},

    # ── 其他脂肪 ──────────────────────────────────────────────
    "other_fatty_acids_mg":      {"label": "其他脂肪酸",     "label_en": "Other Fatty Acids",      "unit": "mg",   "group": "fatty_acid", "priority": 90},
    "trans_fat_mg":              {"label": "反式脂肪",       "label_en": "Trans Fat",              "unit": "mg",   "group": "fatty_acid", "priority": 91},
    "cholesterol_mg":            {"label": "膽固醇",         "label_en": "Cholesterol",            "unit": "mg",   "group": "fatty_acid", "priority": 92},

    # ── 胺基酸 ────────────────────────────────────────────────
    "total_amino_acids_mg":      {"label": "胺基酸總量",     "label_en": "Total Amino Acids",      "unit": "mg",   "group": "amino_acid", "priority": 100},
    "aspartic_acid_mg":          {"label": "天門冬胺酸",     "label_en": "Aspartic Acid",          "unit": "mg",   "group": "amino_acid", "priority": 101},
    "threonine_mg":              {"label": "蘇胺酸",         "label_en": "Threonine",              "unit": "mg",   "group": "amino_acid", "priority": 102},
    "serine_mg":                 {"label": "絲胺酸",         "label_en": "Serine",                 "unit": "mg",   "group": "amino_acid", "priority": 103},
    "glutamic_acid_mg":          {"label": "麩胺酸",         "label_en": "Glutamic Acid",          "unit": "mg",   "group": "amino_acid", "priority": 104},
    "proline_mg":                {"label": "脯胺酸",         "label_en": "Proline",                "unit": "mg",   "group": "amino_acid", "priority": 105},
    "glycine_mg":                {"label": "甘胺酸",         "label_en": "Glycine",                "unit": "mg",   "group": "amino_acid", "priority": 106},
    "alanine_mg":                {"label": "丙胺酸",         "label_en": "Alanine",                "unit": "mg",   "group": "amino_acid", "priority": 107},
    "cystine_mg":                {"label": "胱胺酸",         "label_en": "Cystine",                "unit": "mg",   "group": "amino_acid", "priority": 108},
    "valine_mg":                 {"label": "纈胺酸",         "label_en": "Valine",                 "unit": "mg",   "group": "amino_acid", "priority": 109},
    "methionine_mg":             {"label": "甲硫胺酸",       "label_en": "Methionine",             "unit": "mg",   "group": "amino_acid", "priority": 110},
    "isoleucine_mg":             {"label": "異白胺酸",       "label_en": "Isoleucine",             "unit": "mg",   "group": "amino_acid", "priority": 111},
    "leucine_mg":                {"label": "白胺酸",         "label_en": "Leucine",                "unit": "mg",   "group": "amino_acid", "priority": 112},
    "tyrosine_mg":               {"label": "酪胺酸",         "label_en": "Tyrosine",               "unit": "mg",   "group": "amino_acid", "priority": 113},
    "phenylalanine_mg":          {"label": "苯丙胺酸",       "label_en": "Phenylalanine",          "unit": "mg",   "group": "amino_acid", "priority": 114},
    "lysine_mg":                 {"label": "離胺酸",         "label_en": "Lysine",                 "unit": "mg",   "group": "amino_acid", "priority": 115},
    "histidine_mg":              {"label": "組胺酸",         "label_en": "Histidine",              "unit": "mg",   "group": "amino_acid", "priority": 116},
    "arginine_mg":               {"label": "精胺酸",         "label_en": "Arginine",               "unit": "mg",   "group": "amino_acid", "priority": 117},
    "tryptophan_mg":             {"label": "色胺酸",         "label_en": "Tryptophan",             "unit": "mg",   "group": "amino_acid", "priority": 118},

    # ── 其他 ──────────────────────────────────────────────────
    "alcohol_content_g":         {"label": "酒精含量",       "label_en": "Alcohol",                "unit": "g",    "group": "other",      "priority": 120},
}

# 所有可累加的營養素欄位名
NUTRIENT_COLUMNS: list[str] = list(NUTRIENT_REGISTRY.keys())

# 分組顯示順序
GROUP_ORDER: list[str] = ["basic", "sugar", "mineral", "vitamin", "fatty_acid", "amino_acid", "other"]

GROUP_LABELS: dict[str, dict[str, str]] = {
    "basic":      {"label": "能量與基本營養素", "label_en": "Energy & Macronutrients"},
    "sugar":      {"label": "糖類細項",         "label_en": "Sugars"},
    "mineral":    {"label": "礦物質",           "label_en": "Minerals"},
    "vitamin":    {"label": "維生素",           "label_en": "Vitamins"},
    "fatty_acid": {"label": "脂肪酸",          "label_en": "Fatty Acids"},
    "amino_acid": {"label": "胺基酸",          "label_en": "Amino Acids"},
    "other":      {"label": "其他成分",         "label_en": "Other"},
}


def extract_nutrients(row: dict[str, Any]) -> dict[str, float]:
    """
    從資料庫查詢結果（dict）中提取所有非 null 的營養素欄位。
    自動處理 Decimal → float 轉換。
    未登錄在 NUTRIENT_REGISTRY 中的欄位會被忽略。
    """
    nutrients: dict[str, float] = {}
    for col in NUTRIENT_COLUMNS:
        val = row.get(col)
        if val is not None:
            nutrients[col] = float(val) if isinstance(val, Decimal) else float(val)
    return nutrients


def get_nutrient_meta(keys: set[str] | list[str]) -> dict[str, dict]:
    """
    根據一組營養素 key，回傳對應的 metadata（label, unit, group 等）。
    用於 API 回應中附帶前端所需的顯示資訊。
    """
    return {
        k: NUTRIENT_REGISTRY[k]
        for k in keys
        if k in NUTRIENT_REGISTRY
    }
