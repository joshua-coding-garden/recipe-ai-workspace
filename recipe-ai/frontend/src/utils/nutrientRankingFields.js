// 「依營養素查詢含量最高食物」頁面用的分組與選單。
// 每個 field 必須對應 backend/resources/nutrient_field_map.json 的 key
// （改前/改後都需保持同步，否則 dropdown 選了會 return []）。

export const NUTRIENT_GROUPS = [
  {
    group: "基本",
    items: [
      { field: "waste_rate", label: "廢棄率", unit: "%" },
      { field: "cal_per_100g", label: "熱量", unit: "kcal" },
      { field: "modified_cal_per_100g", label: "修正熱量", unit: "kcal" },
      { field: "water_per_100g", label: "水分", unit: "g" },
      { field: "protein_per_100g", label: "粗蛋白", unit: "g" },
      { field: "fats_per_100g", label: "粗脂肪", unit: "g" },
      { field: "saturated_fat_per_100g", label: "飽和脂肪", unit: "g" },
      { field: "ash_per_100g", label: "灰分", unit: "g" },
      { field: "carbon_per_100g", label: "總碳水化合物", unit: "g" },
      { field: "dietary_fiber_per_100g", label: "膳食纖維", unit: "g" },
    ],
  },
  {
    group: "糖類",
    items: [
      { field: "total_sugar_per_100g", label: "糖質總量", unit: "g" },
      { field: "glucose_per_100g", label: "葡萄糖", unit: "g" },
      { field: "fructose_per_100g", label: "果糖", unit: "g" },
      { field: "galactose_per_100g", label: "半乳糖", unit: "g" },
      { field: "maltose_per_100g", label: "麥芽糖", unit: "g" },
      { field: "sucrose_per_100g", label: "蔗糖", unit: "g" },
      { field: "lactose_per_100g", label: "乳糖", unit: "g" },
    ],
  },
  {
    group: "礦物質",
    items: [
      { field: "sodium_per_100g", label: "鈉", unit: "mg" },
      { field: "potassium_per_100g", label: "鉀", unit: "mg" },
      { field: "calcium_per_100g", label: "鈣", unit: "mg" },
      { field: "magnesium_per_100g", label: "鎂", unit: "mg" },
      { field: "iron_per_100g", label: "鐵", unit: "mg" },
      { field: "zinc_per_100g", label: "鋅", unit: "mg" },
      { field: "phosphorus_per_100g", label: "磷", unit: "mg" },
      { field: "copper_per_100g", label: "銅", unit: "mg" },
      { field: "manganese_per_100g", label: "錳", unit: "mg" },
    ],
  },
  {
    group: "維生素 A",
    items: [
      { field: "vitamin_a_total_iu", label: "維生素 A 總量", unit: "IU" },
      { field: "retinol_equivalent_ug", label: "視網醇當量 (RE)", unit: "μg" },
      { field: "retinol_ug", label: "視網醇", unit: "μg" },
      { field: "alpha_carotene_ug", label: "α-胡蘿蔔素", unit: "μg" },
      { field: "beta_carotene_ug", label: "β-胡蘿蔔素", unit: "μg" },
    ],
  },
  {
    group: "維生素 D",
    items: [
      { field: "vitamin_d_total_iu", label: "維生素 D 總量", unit: "IU" },
      { field: "vitamin_d_total_ug", label: "維生素 D 總量", unit: "μg" },
      { field: "vitamin_d2_ug", label: "維生素 D2", unit: "μg" },
      { field: "vitamin_d3_ug", label: "維生素 D3", unit: "μg" },
    ],
  },
  {
    group: "維生素 E",
    items: [
      { field: "vitamin_e_total_mg", label: "維生素 E 總量", unit: "mg" },
      { field: "alpha_vitamin_e_te_mg", label: "α-維生素 E 當量 (α-TE)", unit: "mg" },
      { field: "alpha_tocopherol_mg", label: "α-生育酚", unit: "mg" },
      { field: "beta_tocopherol_mg", label: "β-生育酚", unit: "mg" },
      { field: "gamma_tocopherol_mg", label: "γ-生育酚", unit: "mg" },
      { field: "delta_tocopherol_mg", label: "δ-生育酚", unit: "mg" },
    ],
  },
  {
    group: "維生素 K",
    items: [
      { field: "vitamin_k_ug", label: "維生素 K（K1+K2 合計）", unit: "μg" },
      { field: "vitamin_k1_ug", label: "維生素 K1", unit: "μg" },
      { field: "vitamin_k2_mk4_ug", label: "維生素 K2 (MK-4)", unit: "μg" },
      { field: "vitamin_k2_mk7_ug", label: "維生素 K2 (MK-7)", unit: "μg" },
    ],
  },
  {
    group: "維生素 B 群",
    items: [
      { field: "vitamin_b1_mg", label: "維生素 B1", unit: "mg" },
      { field: "vitamin_b2_mg", label: "維生素 B2", unit: "mg" },
      { field: "niacin_mg", label: "菸鹼素", unit: "mg" },
      { field: "vitamin_b6_mg", label: "維生素 B6", unit: "mg" },
      { field: "vitamin_b12_ug", label: "維生素 B12", unit: "μg" },
      { field: "folate_ug", label: "葉酸", unit: "μg" },
      { field: "vitamin_c_mg", label: "維生素 C", unit: "mg" },
    ],
  },
  {
    group: "飽和脂肪酸",
    items: [
      { field: "saturated_fatty_acids_total_mg", label: "脂肪酸 S 總量", unit: "mg" },
      { field: "butyric_acid_4_0_mg", label: "酪酸 (4:0)", unit: "mg" },
      { field: "caproic_acid_6_0_mg", label: "己酸 (6:0)", unit: "mg" },
      { field: "caprylic_acid_8_0_mg", label: "辛酸 (8:0)", unit: "mg" },
      { field: "capric_acid_10_0_mg", label: "癸酸 (10:0)", unit: "mg" },
      { field: "lauric_acid_12_0_mg", label: "月桂酸 (12:0)", unit: "mg" },
      { field: "tridecanoic_acid_13_0_mg", label: "十三酸 (13:0)", unit: "mg" },
      { field: "myristic_acid_14_0_mg", label: "肉豆蔻酸 (14:0)", unit: "mg" },
      { field: "pentadecanoic_acid_15_0_mg", label: "十五酸 (15:0)", unit: "mg" },
      { field: "palmitic_acid_16_0_mg", label: "棕櫚酸 (16:0)", unit: "mg" },
      { field: "heptadecanoic_acid_17_0_mg", label: "十七酸 (17:0)", unit: "mg" },
      { field: "stearic_acid_18_0_mg", label: "硬脂酸 (18:0)", unit: "mg" },
      { field: "nonadecanoic_acid_19_0_mg", label: "十九酸 (19:0)", unit: "mg" },
      { field: "arachidic_acid_20_0_mg", label: "花生酸 (20:0)", unit: "mg" },
      { field: "behenic_acid_22_0_mg", label: "山酸 (22:0)", unit: "mg" },
      { field: "lignoceric_acid_24_0_mg", label: "廿四酸 (24:0)", unit: "mg" },
    ],
  },
  {
    group: "單元不飽和脂肪酸",
    items: [
      { field: "monounsaturated_fatty_acids_total_mg", label: "脂肪酸 M 總量", unit: "mg" },
      { field: "myristoleic_acid_14_1_mg", label: "肉豆蔻烯酸 (14:1)", unit: "mg" },
      { field: "palmitoleic_acid_16_1_mg", label: "棕櫚烯酸 (16:1)", unit: "mg" },
      { field: "oleic_acid_18_1_mg", label: "油酸 (18:1)", unit: "mg" },
      { field: "gadoleic_acid_20_1_mg", label: "鱈烯酸 (20:1)", unit: "mg" },
      { field: "erucic_acid_22_1_mg", label: "芥子酸 (22:1)", unit: "mg" },
    ],
  },
  {
    group: "多元不飽和脂肪酸",
    items: [
      { field: "polyunsaturated_fatty_acids_total_mg", label: "脂肪酸 P 總量", unit: "mg" },
      { field: "n3_pufa_total_mg", label: "n-3 多元不飽和（合計）", unit: "mg" },
      { field: "linoleic_acid_18_2_mg", label: "亞麻油酸 (18:2)", unit: "mg" },
      { field: "linolenic_acid_18_3_mg", label: "次亞麻油酸 (18:3)", unit: "mg" },
      { field: "octadecatetraenoic_acid_18_4_mg", label: "十八碳四烯酸 (18:4)", unit: "mg" },
      { field: "arachidonic_acid_20_4_mg", label: "花生油酸 (20:4)", unit: "mg" },
      { field: "epa_20_5_mg", label: "廿碳五烯酸 EPA (20:5)", unit: "mg" },
      { field: "dpa_22_5_mg", label: "廿二碳五烯酸 DPA (22:5)", unit: "mg" },
      { field: "dha_22_6_mg", label: "廿二碳六烯酸 DHA (22:6)", unit: "mg" },
    ],
  },
  {
    group: "胺基酸",
    items: [
      { field: "total_amino_acids_mg", label: "水解胺基酸總量", unit: "mg" },
      { field: "aspartic_acid_mg", label: "天門冬胺酸 (Asp)", unit: "mg" },
      { field: "threonine_mg", label: "酥胺酸 (Thr)", unit: "mg" },
      { field: "serine_mg", label: "絲胺酸 (Ser)", unit: "mg" },
      { field: "glutamic_acid_mg", label: "麩胺酸 (Glu)", unit: "mg" },
      { field: "proline_mg", label: "脯胺酸 (Pro)", unit: "mg" },
      { field: "glycine_mg", label: "甘胺酸 (Gly)", unit: "mg" },
      { field: "alanine_mg", label: "丙胺酸 (Ala)", unit: "mg" },
      { field: "cystine_mg", label: "胱胺酸 (Cys)", unit: "mg" },
      { field: "valine_mg", label: "纈胺酸 (Val)", unit: "mg" },
      { field: "methionine_mg", label: "甲硫胺酸 (Met)", unit: "mg" },
      { field: "isoleucine_mg", label: "異白胺酸 (Ile)", unit: "mg" },
      { field: "leucine_mg", label: "白胺酸 (Leu)", unit: "mg" },
      { field: "tyrosine_mg", label: "酪胺酸 (Tyr)", unit: "mg" },
      { field: "phenylalanine_mg", label: "苯丙胺酸 (Phe)", unit: "mg" },
      { field: "lysine_mg", label: "離胺酸 (Lys)", unit: "mg" },
      { field: "histidine_mg", label: "組胺酸 (His)", unit: "mg" },
      { field: "arginine_mg", label: "精胺酸 (Arg)", unit: "mg" },
      { field: "tryptophan_mg", label: "色胺酸 (Trp)", unit: "mg" },
    ],
  },
  {
    group: "其他",
    items: [
      { field: "trans_fat_mg", label: "反式脂肪", unit: "mg" },
      { field: "cholesterol_mg", label: "膽固醇", unit: "mg" },
      { field: "alcohol_content_g", label: "酒精含量", unit: "g" },
    ],
  },
];

export const FIELD_LOOKUP = (() => {
  const map = {};
  for (const g of NUTRIENT_GROUPS) {
    for (const it of g.items) map[it.field] = { ...it, group: g.group };
  }
  return map;
})();
