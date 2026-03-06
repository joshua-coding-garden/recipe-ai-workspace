-- ==================== PostgreSQL 初始 Schema ====================
-- 從 MySQL userdb schema 轉換
-- 轉換重點：
--   INT AUTO_INCREMENT → SERIAL
--   TIMESTAMP ON UPDATE → trigger 自動更新
--   ENGINE=InnoDB / CHARSET → 移除
--   BOOLEAN 保持不變

-- 啟用必要擴展
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";
CREATE EXTENSION IF NOT EXISTS pg_trgm;

-- 自動更新 updated_at 的 trigger function（全域共用）
CREATE OR REPLACE FUNCTION set_updated_at()
RETURNS TRIGGER AS $$
BEGIN
  NEW.updated_at = NOW();
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- ==================== 使用者相關表格 ====================

CREATE TABLE IF NOT EXISTS users (
  id           SERIAL PRIMARY KEY,
  email        VARCHAR(255) UNIQUE NOT NULL,
  password     VARCHAR(255),
  provider     VARCHAR(50)  DEFAULT 'local',
  google_id    VARCHAR(255),
  name         VARCHAR(255),
  avatar_url   VARCHAR(500),
  created_at   TIMESTAMP DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS profiles (
  id           SERIAL PRIMARY KEY,
  user_id      INT NOT NULL REFERENCES users(id) ON DELETE CASCADE,
  name         VARCHAR(255),
  birthday     DATE,
  height       INT,
  weight       INT,
  sport_type   VARCHAR(50)  DEFAULT 'general',
  gender       VARCHAR(10)  DEFAULT 'male',
  notes        TEXT,
  updated_at   TIMESTAMP DEFAULT NOW()
);

CREATE OR REPLACE TRIGGER trg_profiles_updated_at
  BEFORE UPDATE ON profiles
  FOR EACH ROW EXECUTE FUNCTION set_updated_at();

CREATE TABLE IF NOT EXISTS goals (
  id           SERIAL PRIMARY KEY,
  user_id      INT NOT NULL REFERENCES users(id) ON DELETE CASCADE,
  short_goal   TEXT,
  long_goal    TEXT,
  updated_at   TIMESTAMP DEFAULT NOW()
);

CREATE OR REPLACE TRIGGER trg_goals_updated_at
  BEFORE UPDATE ON goals
  FOR EACH ROW EXECUTE FUNCTION set_updated_at();

-- ==================== 飲食相關表格 ====================

CREATE TABLE IF NOT EXISTS diet_logs (
  id           SERIAL PRIMARY KEY,
  user_id      INT NOT NULL REFERENCES users(id) ON DELETE CASCADE,
  food_name    VARCHAR(255) NOT NULL,
  grams        INT NOT NULL,
  created_at   TIMESTAMP DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS foods (
  id                    SERIAL PRIMARY KEY,
  name                  VARCHAR(255) NOT NULL,
  portion_size_per_day  VARCHAR(100),
  cal_per_100g          DECIMAL(10,2),
  carbon_per_100g       DECIMAL(10,2),
  protein_per_100g      DECIMAL(10,2),
  fats_per_100g         DECIMAL(10,2),
  flavor                VARCHAR(50),
  category              VARCHAR(50),
  description           TEXT,
  created_at            TIMESTAMP DEFAULT NOW()
);

-- ==================== 食譜相關表格 ====================

CREATE TABLE IF NOT EXISTS recipes (
  id              SERIAL PRIMARY KEY,
  user_id         INT NOT NULL REFERENCES users(id) ON DELETE CASCADE,
  recipe_name     VARCHAR(255) NOT NULL,
  recipe_content  TEXT NOT NULL,
  servings        INT DEFAULT 1,
  created_at      TIMESTAMP DEFAULT NOW(),
  updated_at      TIMESTAMP DEFAULT NOW()
);

CREATE OR REPLACE TRIGGER trg_recipes_updated_at
  BEFORE UPDATE ON recipes
  FOR EACH ROW EXECUTE FUNCTION set_updated_at();

CREATE TABLE IF NOT EXISTS recipe_nutrition (
  id          SERIAL PRIMARY KEY,
  recipe_id   INT NOT NULL REFERENCES recipes(id) ON DELETE CASCADE,
  calories    DECIMAL(10,2) DEFAULT 0,
  protein     DECIMAL(10,2) DEFAULT 0,
  carbs       DECIMAL(10,2) DEFAULT 0,
  fat         DECIMAL(10,2) DEFAULT 0,
  fiber       DECIMAL(10,2) DEFAULT 0
);

CREATE TABLE IF NOT EXISTS recipe_ingredients (
  id               SERIAL PRIMARY KEY,
  recipe_id        INT NOT NULL REFERENCES recipes(id) ON DELETE CASCADE,
  ingredient_name  VARCHAR(255) NOT NULL,
  amount           VARCHAR(100)
);

-- ==================== 其他表格 ====================

CREATE TABLE IF NOT EXISTS habits (
  id               SERIAL PRIMARY KEY,
  user_id          INT NOT NULL REFERENCES users(id) ON DELETE CASCADE,
  freq_per_week    INT     DEFAULT 0,
  duration_min     INT     DEFAULT 0,
  meal_breakfast   BOOLEAN DEFAULT FALSE,
  meal_lunch       BOOLEAN DEFAULT FALSE,
  meal_dinner      BOOLEAN DEFAULT FALSE,
  meal_late        BOOLEAN DEFAULT FALSE,
  updated_at       TIMESTAMP DEFAULT NOW()
);

CREATE OR REPLACE TRIGGER trg_habits_updated_at
  BEFORE UPDATE ON habits
  FOR EACH ROW EXECUTE FUNCTION set_updated_at();

CREATE TABLE IF NOT EXISTS chat_logs (
  id          SERIAL PRIMARY KEY,
  user_id     INT NOT NULL REFERENCES users(id) ON DELETE CASCADE,
  role        VARCHAR(20) NOT NULL,
  content     TEXT NOT NULL,
  created_at  TIMESTAMP DEFAULT NOW()
);

-- ==================== 索引 ====================

CREATE INDEX IF NOT EXISTS idx_user_email        ON users(email);
CREATE INDEX IF NOT EXISTS idx_profile_user      ON profiles(user_id);
CREATE INDEX IF NOT EXISTS idx_goals_user        ON goals(user_id);
CREATE INDEX IF NOT EXISTS idx_diet_user         ON diet_logs(user_id);
CREATE INDEX IF NOT EXISTS idx_habits_user       ON habits(user_id);
CREATE INDEX IF NOT EXISTS idx_chat_user         ON chat_logs(user_id);
CREATE INDEX IF NOT EXISTS idx_recipes_user      ON recipes(user_id);
CREATE INDEX IF NOT EXISTS idx_recipes_created   ON recipes(created_at);
CREATE INDEX IF NOT EXISTS idx_nutrition_recipe  ON recipe_nutrition(recipe_id);
CREATE INDEX IF NOT EXISTS idx_ingredients_recipe ON recipe_ingredients(recipe_id);
