-- 完整的資料庫匯入腳本
-- 創建日期: 2026-02-03
-- 目的：按正確順序匯入所有資料

USE userdb;

-- 1. 刪除並重建 food_aliases 表（使用正確結構）
DROP TABLE IF EXISTS food_aliases;

CREATE TABLE food_aliases (
  id INT AUTO_INCREMENT PRIMARY KEY,
  family_key VARCHAR(100) NOT NULL,
  aliases JSON NOT NULL,
  category VARCHAR(50),
  description TEXT,
  foodb_search_term VARCHAR(255),
  taiwan_search_term VARCHAR(255),
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  UNIQUE INDEX idx_family_key (family_key),
  INDEX idx_category (category),
  INDEX idx_foodb_search (foodb_search_term),
  INDEX idx_taiwan_search (taiwan_search_term)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

SELECT '✅ food_aliases 表重建完成' AS status;

-- 2. 確保 food_mapping 表存在
CREATE TABLE IF NOT EXISTS food_mapping (
  id INT AUTO_INCREMENT PRIMARY KEY,
  foodb_id INT NULL,
  foodb_name VARCHAR(255) NULL,
  taiwan_food_id INT NULL,
  taiwan_food_name VARCHAR(255) NULL,
  taiwan_integration_code VARCHAR(100) NULL,
  mapping_confidence DECIMAL(3,2) DEFAULT 1.0,
  mapping_type ENUM('exact', 'similar', 'manual', 'translation', 'fuzzy', 'unmatched') DEFAULT 'manual',
  notes TEXT,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  INDEX idx_foodb_id (foodb_id),
  INDEX idx_taiwan_id (taiwan_food_id),
  INDEX idx_confidence (mapping_confidence)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

SELECT '✅ food_mapping 表已確認' AS status;
SELECT '✅ 資料庫表格準備完成！' AS info;
SELECT '📥 現在可以匯入資料了' AS next_step;
