-- ==================== 營養素結算系統擴充 ====================
-- 新增 JSONB 欄位以儲存完整營養素明細

-- recipe_nutrition: 儲存食譜的完整營養素結算結果
ALTER TABLE recipe_nutrition
  ADD COLUMN IF NOT EXISTS nutrition_detail JSONB DEFAULT '{}';

-- diet_logs: 連結食物資料庫，儲存每筆飲食記錄的完整營養素
ALTER TABLE diet_logs
  ADD COLUMN IF NOT EXISTS food_id INT,
  ADD COLUMN IF NOT EXISTS food_source VARCHAR(20),
  ADD COLUMN IF NOT EXISTS nutrition_detail JSONB DEFAULT '{}';
