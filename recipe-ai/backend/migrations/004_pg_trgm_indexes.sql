-- ==================== pg_trgm GIN 索引（加速中英文相似度搜尋）====================
-- 必須在 taiwan_foods 和 foods（foodb）資料匯入完成後執行

-- 確保擴展已啟用
CREATE EXTENSION IF NOT EXISTS pg_trgm;

-- Taiwan Foods：中文食物名稱 trigram 索引
CREATE INDEX IF NOT EXISTS idx_taiwan_foods_name_trgm
  ON taiwan_foods USING GIN (food_name gin_trgm_ops);

-- Taiwan Foods：類別 trigram 索引
CREATE INDEX IF NOT EXISTS idx_taiwan_category_trgm
  ON taiwan_foods USING GIN (category gin_trgm_ops);

-- 設定 pg_trgm 相似度閾值（0.15 對中文較合適，英文可用預設 0.3）
-- 注意：這是 session 級設定，需要在應用程式中動態設定
-- SET pg_trgm.similarity_threshold = 0.15;

-- food_aliases：foodb_search_term 和 taiwan_search_term 的 trigram 索引
CREATE INDEX IF NOT EXISTS idx_food_aliases_foodb_trgm
  ON food_aliases USING GIN (foodb_search_term gin_trgm_ops);

CREATE INDEX IF NOT EXISTS idx_food_aliases_taiwan_trgm
  ON food_aliases USING GIN (taiwan_search_term gin_trgm_ops);

-- 驗證索引
SELECT
  schemaname,
  tablename,
  indexname,
  indexdef
FROM pg_indexes
WHERE tablename IN ('taiwan_foods', 'food_aliases')
  AND indexname LIKE '%trgm%'
ORDER BY tablename, indexname;
