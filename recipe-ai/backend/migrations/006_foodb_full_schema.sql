-- ============================================================
-- FooDB Full Schema Migration
-- 自動由 import_foodb_full.py 生成
-- 45 張 FooDB 表，全部加 foodb_ 前綴
-- ============================================================

CREATE EXTENSION IF NOT EXISTS pg_trgm;

-- CREATE TABLE
-- ============================================================

CREATE TABLE IF NOT EXISTS foodb_ncbi_taxonomy_maps (
  id SERIAL,
  TaxonomyName varchar(255) DEFAULT NULL,
  Rank varchar(255) DEFAULT NULL,
  created_at TIMESTAMP NOT NULL,
  updated_at TIMESTAMP NOT NULL,
  PRIMARY KEY (id)
);

-- 原始 FooDB 索引
-- ============================================================


-- 額外查詢優化索引
-- ============================================================

-- 額外查詢優化索引
CREATE INDEX IF NOT EXISTS idx_foodb_health_effects_name ON foodb_health_effects(name);
CREATE INDEX IF NOT EXISTS idx_foodb_che_health_effect_id ON foodb_compounds_health_effects(health_effect_id);
CREATE INDEX IF NOT EXISTS idx_foodb_che_compound_id ON foodb_compounds_health_effects(compound_id);
CREATE INDEX IF NOT EXISTS idx_foodb_contents_source ON foodb_contents(source_id, source_type);
CREATE INDEX IF NOT EXISTS idx_foodb_contents_food ON foodb_contents(food_id);
CREATE INDEX IF NOT EXISTS idx_foodb_contents_compound_food ON foodb_contents(source_id, source_type, food_id);
CREATE INDEX IF NOT EXISTS idx_foodb_compounds_name ON foodb_compounds(name);
CREATE INDEX IF NOT EXISTS idx_foodb_foods_name ON foodb_foods(name);

-- trigram 索引（需要 pg_trgm 擴充，用於模糊搜尋）
-- CREATE INDEX IF NOT EXISTS idx_foodb_health_effects_name_trgm ON foodb_health_effects USING gin(name gin_trgm_ops);

