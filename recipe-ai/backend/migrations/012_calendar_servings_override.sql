-- 日分析行事曆：每筆 entry 可覆寫當日食用份數。
-- 原食譜 servings 保留為 recipe_servings；servings_override 只代表該日吃了幾份。

ALTER TABLE recipe_calendar_entries
  ADD COLUMN IF NOT EXISTS servings_override NUMERIC DEFAULT 1;
