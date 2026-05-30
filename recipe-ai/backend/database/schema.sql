-- 建立資料庫
CREATE DATABASE IF NOT EXISTS userdb CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE userdb;

-- ==================== 使用者相關表格 ====================

-- 1. 使用者表
CREATE TABLE IF NOT EXISTS users (
  id INT AUTO_INCREMENT PRIMARY KEY,
  email VARCHAR(255) UNIQUE NOT NULL,
  password VARCHAR(255) NULL,                    -- ✅ 允許 NULL（Google 登入）
  provider VARCHAR(50) DEFAULT 'local',
  google_id VARCHAR(255),
  name VARCHAR(255),
  avatar_url VARCHAR(500),
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 2. 個人資料表
CREATE TABLE IF NOT EXISTS profiles (
  id INT AUTO_INCREMENT PRIMARY KEY,
  user_id INT NOT NULL,
  name VARCHAR(255),
  birthday DATE,
  height INT,
  weight INT,
  sportType VARCHAR(50) DEFAULT 'general',
  gender VARCHAR(10) DEFAULT 'male',
  notes TEXT,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 3. 目標表
CREATE TABLE IF NOT EXISTS goals (
  id INT AUTO_INCREMENT PRIMARY KEY,
  user_id INT NOT NULL,
  short_goal TEXT,
  long_goal TEXT,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ==================== 飲食相關表格 ====================

-- 4. 飲食記錄表
CREATE TABLE IF NOT EXISTS diet_logs (
  id INT AUTO_INCREMENT PRIMARY KEY,
  user_id INT NOT NULL,
  food_name VARCHAR(255) NOT NULL,
  grams INT NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 5. 食物資料表
CREATE TABLE IF NOT EXISTS foods (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  portion_size_per_day VARCHAR(100),
  cal_per_100g DECIMAL(10,2),
  carbon_per_100g DECIMAL(10,2),
  protein_per_100g DECIMAL(10,2),
  fats_per_100g DECIMAL(10,2),
  flavor VARCHAR(50),
  category VARCHAR(50),
  description TEXT,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ==================== 食譜相關表格（修正版）====================

-- 6. 食譜主表（修正欄位名稱）
CREATE TABLE IF NOT EXISTS recipes (
  id INT AUTO_INCREMENT PRIMARY KEY,
  user_id INT NOT NULL,
  recipe_name VARCHAR(255) NOT NULL,              -- ✅ 改為 recipe_name
  recipe_content TEXT NOT NULL,                   -- ✅ 改為 recipe_content
  servings INT DEFAULT 1,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 7. 食譜營養成分表（新增）
CREATE TABLE IF NOT EXISTS recipe_nutrition (
  id INT AUTO_INCREMENT PRIMARY KEY,
  recipe_id INT NOT NULL,
  calories DECIMAL(10,2) DEFAULT 0,
  protein DECIMAL(10,2) DEFAULT 0,
  carbs DECIMAL(10,2) DEFAULT 0,
  fat DECIMAL(10,2) DEFAULT 0,
  fiber DECIMAL(10,2) DEFAULT 0,
  FOREIGN KEY (recipe_id) REFERENCES recipes(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 8. 食譜食材清單表（新增）
CREATE TABLE IF NOT EXISTS recipe_ingredients (
  id INT AUTO_INCREMENT PRIMARY KEY,
  recipe_id INT NOT NULL,
  ingredient_name VARCHAR(255) NOT NULL,
  amount VARCHAR(100),
  FOREIGN KEY (recipe_id) REFERENCES recipes(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ==================== 其他表格 ====================

-- 9. 運動習慣表
CREATE TABLE IF NOT EXISTS habits (
  id INT AUTO_INCREMENT PRIMARY KEY,
  user_id INT NOT NULL,
  freq_per_week INT DEFAULT 0,
  duration_min INT DEFAULT 0,
  meal_breakfast BOOLEAN DEFAULT FALSE,
  meal_lunch BOOLEAN DEFAULT FALSE,
  meal_dinner BOOLEAN DEFAULT FALSE,
  meal_late BOOLEAN DEFAULT FALSE,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 10. 對話記錄表
CREATE TABLE IF NOT EXISTS chat_logs (
  id INT AUTO_INCREMENT PRIMARY KEY,
  user_id INT NOT NULL,
  role VARCHAR(20) NOT NULL,
  content TEXT NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 11. 舊的 logs 表（相容性，可選）
CREATE TABLE IF NOT EXISTS logs (
  id INT AUTO_INCREMENT PRIMARY KEY,
  user_id INT NOT NULL,
  food_name VARCHAR(255) NOT NULL,
  grams INT NOT NULL,
  created_at BIGINT NOT NULL,
  FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ==================== 建立索引以提升查詢效能 ====================

CREATE INDEX idx_user_email ON users(email);
CREATE INDEX idx_profile_user ON profiles(user_id);
CREATE INDEX idx_goals_user ON goals(user_id);
CREATE INDEX idx_diet_user ON diet_logs(user_id);
CREATE INDEX idx_habits_user ON habits(user_id);
CREATE INDEX idx_chat_user ON chat_logs(user_id);
CREATE INDEX idx_recipes_user ON recipes(user_id);
CREATE INDEX idx_recipes_created ON recipes(created_at);
CREATE INDEX idx_nutrition_recipe ON recipe_nutrition(recipe_id);
CREATE INDEX idx_ingredients_recipe ON recipe_ingredients(recipe_id);

-- ==================== 顯示所有表格 ====================

SHOW TABLES;

-- ==================== 驗證表格結構 ====================

SELECT '============================================' AS info;
SELECT '檢查 recipes 表格結構（應該有 recipe_name 和 recipe_content）' AS info;
DESCRIBE recipes;

SELECT '============================================' AS info;
SELECT '檢查 recipe_nutrition 表格（應該存在）' AS info;
DESCRIBE recipe_nutrition;

SELECT '============================================' AS info;
SELECT '檢查 recipe_ingredients 表格（應該存在）' AS info;
DESCRIBE recipe_ingredients;

-- ==================== 完成提示 ====================

SELECT '✅ 資料庫建立完成！' AS status;
SELECT '📊 總共 11 個表格（包含 3 個食譜相關表格）' AS info;
