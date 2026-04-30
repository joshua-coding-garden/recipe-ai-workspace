-- ==================== 日分析行事曆 ====================
-- 食譜與日期的多對多關聯：使用者可把任意食譜匯入到任意日期，
-- 同一食譜可在同日重複出現（不加 unique 限制），
-- 每筆 entry 照原食譜全份營養計入聚合。

CREATE TABLE IF NOT EXISTS recipe_calendar_entries (
  id SERIAL PRIMARY KEY,
  user_id INT NOT NULL REFERENCES users(id) ON DELETE CASCADE,
  entry_date DATE NOT NULL,
  recipe_id INT NOT NULL REFERENCES recipes(id) ON DELETE CASCADE,
  sort_order INT NOT NULL DEFAULT 0,
  created_at TIMESTAMP DEFAULT NOW()
);

CREATE INDEX IF NOT EXISTS idx_calendar_user_date
  ON recipe_calendar_entries(user_id, entry_date);
