-- ==================== Taiwan Foods 資料表（PostgreSQL 版）====================
-- 從 MySQL taiwan_foods_schema.sql 轉換

CREATE TABLE IF NOT EXISTS taiwan_foods (
  id               SERIAL PRIMARY KEY,

  -- 基本資訊
  integration_code VARCHAR(100) UNIQUE,
  category         VARCHAR(100),
  food_name        VARCHAR(255) NOT NULL,
  sample_name      VARCHAR(500),
  common_name      VARCHAR(255),
  waste_rate       DECIMAL(5,2),

  -- 能量與基本營養素
  cal_per_100g               DECIMAL(10,4),
  modified_cal_per_100g      DECIMAL(10,4),
  water_per_100g             DECIMAL(10,4),
  protein_per_100g           DECIMAL(10,4),
  fats_per_100g              DECIMAL(10,4),
  saturated_fat_per_100g     DECIMAL(10,4),
  ash_per_100g               DECIMAL(10,4),
  carbon_per_100g            DECIMAL(10,4),
  dietary_fiber_per_100g     DECIMAL(10,4),

  -- 糖類細項
  total_sugar_per_100g   DECIMAL(10,4),
  glucose_per_100g       DECIMAL(10,4),
  fructose_per_100g      DECIMAL(10,4),
  galactose_per_100g     DECIMAL(10,4),
  maltose_per_100g       DECIMAL(10,4),
  sucrose_per_100g       DECIMAL(10,4),
  lactose_per_100g       DECIMAL(10,4),

  -- 礦物質
  sodium_per_100g       DECIMAL(10,4),
  potassium_per_100g    DECIMAL(10,4),
  calcium_per_100g      DECIMAL(10,4),
  magnesium_per_100g    DECIMAL(10,4),
  iron_per_100g         DECIMAL(10,4),
  zinc_per_100g         DECIMAL(10,4),
  phosphorus_per_100g   DECIMAL(10,4),
  copper_per_100g       DECIMAL(10,4),
  manganese_per_100g    DECIMAL(10,4),

  -- 維生素 A
  vitamin_a_total_iu       DECIMAL(10,4),
  retinol_equivalent_ug    DECIMAL(10,4),
  retinol_ug               DECIMAL(10,4),
  alpha_carotene_ug        DECIMAL(10,4),
  beta_carotene_ug         DECIMAL(10,4),

  -- 維生素 D
  vitamin_d_total_iu  DECIMAL(10,4),
  vitamin_d_total_ug  DECIMAL(10,4),
  vitamin_d2_ug       DECIMAL(10,4),
  vitamin_d3_ug       DECIMAL(10,4),

  -- 維生素 E
  vitamin_e_total_mg      DECIMAL(10,4),
  alpha_vitamin_e_te_mg   DECIMAL(10,4),
  alpha_tocopherol_mg     DECIMAL(10,4),
  beta_tocopherol_mg      DECIMAL(10,4),
  gamma_tocopherol_mg     DECIMAL(10,4),
  delta_tocopherol_mg     DECIMAL(10,4),

  -- 維生素 K
  vitamin_k1_ug       DECIMAL(10,4),
  vitamin_k2_mk4_ug   DECIMAL(10,4),
  vitamin_k2_mk7_ug   DECIMAL(10,4),

  -- 維生素 B 群
  vitamin_b1_mg   DECIMAL(10,4),
  vitamin_b2_mg   DECIMAL(10,4),
  niacin_mg       DECIMAL(10,4),
  vitamin_b6_mg   DECIMAL(10,4),
  vitamin_b12_ug  DECIMAL(10,4),
  folate_ug       DECIMAL(10,4),
  vitamin_c_mg    DECIMAL(10,4),

  -- 飽和脂肪酸細項
  saturated_fatty_acids_total_mg  DECIMAL(10,4),
  butyric_acid_4_0_mg             DECIMAL(10,4),
  caproic_acid_6_0_mg             DECIMAL(10,4),
  caprylic_acid_8_0_mg            DECIMAL(10,4),
  capric_acid_10_0_mg             DECIMAL(10,4),
  lauric_acid_12_0_mg             DECIMAL(10,4),
  tridecanoic_acid_13_0_mg        DECIMAL(10,4),
  myristic_acid_14_0_mg           DECIMAL(10,4),
  pentadecanoic_acid_15_0_mg      DECIMAL(10,4),
  palmitic_acid_16_0_mg           DECIMAL(10,4),
  heptadecanoic_acid_17_0_mg      DECIMAL(10,4),
  stearic_acid_18_0_mg            DECIMAL(10,4),
  nonadecanoic_acid_19_0_mg       DECIMAL(10,4),
  arachidic_acid_20_0_mg          DECIMAL(10,4),
  behenic_acid_22_0_mg            DECIMAL(10,4),
  lignoceric_acid_24_0_mg         DECIMAL(10,4),

  -- 單元不飽和脂肪酸
  monounsaturated_fatty_acids_total_mg  DECIMAL(10,4),
  myristoleic_acid_14_1_mg             DECIMAL(10,4),
  palmitoleic_acid_16_1_mg             DECIMAL(10,4),
  oleic_acid_18_1_mg                   DECIMAL(10,4),
  gadoleic_acid_20_1_mg                DECIMAL(10,4),
  erucic_acid_22_1_mg                  DECIMAL(10,4),

  -- 多元不飽和脂肪酸
  polyunsaturated_fatty_acids_total_mg  DECIMAL(10,4),
  linoleic_acid_18_2_mg                DECIMAL(10,4),
  linolenic_acid_18_3_mg               DECIMAL(10,4),
  octadecatetraenoic_acid_18_4_mg      DECIMAL(10,4),
  arachidonic_acid_20_4_mg             DECIMAL(10,4),
  epa_20_5_mg                          DECIMAL(10,4),
  dpa_22_5_mg                          DECIMAL(10,4),
  dha_22_6_mg                          DECIMAL(10,4),

  -- 其他脂肪資訊
  other_fatty_acids_mg  DECIMAL(10,4),
  p_m_s_ratio           VARCHAR(50),
  trans_fat_mg          DECIMAL(10,4),
  cholesterol_mg        DECIMAL(10,4),

  -- 胺基酸
  total_amino_acids_mg  DECIMAL(10,4),
  aspartic_acid_mg      DECIMAL(10,4),
  threonine_mg          DECIMAL(10,4),
  serine_mg             DECIMAL(10,4),
  glutamic_acid_mg      DECIMAL(10,4),
  proline_mg            DECIMAL(10,4),
  glycine_mg            DECIMAL(10,4),
  alanine_mg            DECIMAL(10,4),
  cystine_mg            DECIMAL(10,4),
  valine_mg             DECIMAL(10,4),
  methionine_mg         DECIMAL(10,4),
  isoleucine_mg         DECIMAL(10,4),
  leucine_mg            DECIMAL(10,4),
  tyrosine_mg           DECIMAL(10,4),
  phenylalanine_mg      DECIMAL(10,4),
  lysine_mg             DECIMAL(10,4),
  histidine_mg          DECIMAL(10,4),
  arginine_mg           DECIMAL(10,4),
  tryptophan_mg         DECIMAL(10,4),

  -- 其他成分
  alcohol_content_g  DECIMAL(10,4),

  -- 系統欄位
  created_at  TIMESTAMP DEFAULT NOW(),
  updated_at  TIMESTAMP DEFAULT NOW()
);

CREATE OR REPLACE TRIGGER trg_taiwan_foods_updated_at
  BEFORE UPDATE ON taiwan_foods
  FOR EACH ROW EXECUTE FUNCTION set_updated_at();

-- 基本索引
CREATE INDEX IF NOT EXISTS idx_taiwan_food_name      ON taiwan_foods(food_name);
CREATE INDEX IF NOT EXISTS idx_taiwan_category       ON taiwan_foods(category);
CREATE INDEX IF NOT EXISTS idx_taiwan_integration    ON taiwan_foods(integration_code);
