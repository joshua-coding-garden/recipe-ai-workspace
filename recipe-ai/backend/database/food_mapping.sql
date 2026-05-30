-- 食物資料庫關聯與增強搜尋表
-- 建立日期: 2026-01-27

USE userdb;

-- ==================== 1. FooDB 與 Taiwan Foods 關聯表 ====================

CREATE TABLE IF NOT EXISTS food_mapping (
  id INT AUTO_INCREMENT PRIMARY KEY,
  foodb_id INT NULL,                             -- FooDB 中的食物 ID (允許 NULL)
  foodb_name VARCHAR(255) NULL,                  -- FooDB 中的食物名稱 (允許 NULL)
  taiwan_food_id INT NULL,                       -- Taiwan Foods 的 ID (可為空，因為不是所有食物都有對應)
  taiwan_food_name VARCHAR(255) NULL,            -- Taiwan Foods 中的食物名稱
  taiwan_integration_code VARCHAR(100) NULL,     -- Taiwan Foods 整合編碼
  mapping_confidence DECIMAL(3,2) DEFAULT 1.0,   -- 映射信心度 (0-1)
  mapping_type ENUM('exact', 'similar', 'manual', 'translation', 'fuzzy', 'unmatched') DEFAULT 'manual', -- 映射類型
  notes TEXT,                                     -- 備註
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  INDEX idx_foodb_id (foodb_id),
  INDEX idx_taiwan_id (taiwan_food_id),
  INDEX idx_confidence (mapping_confidence)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- ==================== 2. 食物別名/同義詞表（增強搜尋）====================

CREATE TABLE IF NOT EXISTS food_aliases (
  id INT AUTO_INCREMENT PRIMARY KEY,
  family_key VARCHAR(100) NOT NULL,              -- 家族關鍵字 (如 'potato', 'tomato')
  aliases JSON NOT NULL,                          -- 別名陣列 JSON 格式
  category VARCHAR(50),                           -- 分類 (蔬菜/水果/肉類/調味料等)
  description TEXT,                               -- 描述
  foodb_search_term VARCHAR(255),                 -- FooDB 搜尋關鍵字
  taiwan_search_term VARCHAR(255),                -- Taiwan Foods 搜尋關鍵字
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  UNIQUE INDEX idx_family_key (family_key),
  INDEX idx_category (category),
  INDEX idx_foodb_search (foodb_search_term),
  INDEX idx_taiwan_search (taiwan_search_term)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- ==================== 3. 插入預設的食物別名資料 ====================

INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term) VALUES
('potato', JSON_ARRAY('potato', 'spud', 'tater', '馬鈴薯', '土豆', '洋芋', 'white potato', 'irish potato'), '蔬菜', '馬鈴薯 - 包含各種常見別名', 'potato', '馬鈴薯'),
('tomato', JSON_ARRAY('tomato', 'cherry tomato', 'heirloom tomato', '番茄', '西紅柿', 'plum tomato', 'roma tomato'), '蔬菜', '番茄 - 包含不同品種', 'tomato', '番茄'),
('sweet_potato', JSON_ARRAY('sweet potato', 'yam', '地瓜', '番薯', '紅薯', 'purple sweet potato', '紫薯'), '蔬菜', '地瓜', 'sweet potato', '地瓜'),
('carrot', JSON_ARRAY('carrot', '胡蘿蔔', '紅蘿蔔', 'baby carrot'), '蔬菜', '胡蘿蔔', 'carrot', '胡蘿蔔'),
('cabbage', JSON_ARRAY('cabbage', 'napa cabbage', 'chinese cabbage', '高麗菜', '包心菜', '大白菜', '圓白菜'), '蔬菜', '高麗菜', 'cabbage', '高麗菜'),
('spinach', JSON_ARRAY('spinach', '菠菜', 'water spinach', '空心菜'), '蔬菜', '菠菜', 'spinach', '菠菜'),
('apple', JSON_ARRAY('apple', 'gala apple', 'fuji apple', 'granny smith', '蘋果', '青蘋果', '紅蘋果'), '水果', '蘋果', 'apple', '蘋果'),
('banana', JSON_ARRAY('banana', '香蕉', 'plantain', '芭蕉', 'cavendish banana'), '水果', '香蕉', 'banana', '香蕉'),
('kiwi', JSON_ARRAY('kiwi', 'kiwifruit', '奇異果', '獼猴桃', 'golden kiwi', 'green kiwi'), '水果', '奇異果', 'kiwi', '奇異果'),
('orange', JSON_ARRAY('orange', 'mandarin orange', 'tangerine', '橘子', '柳橙', '橙子', '柑橘'), '水果', '柑橘', 'orange', '橘子'),
('grape', JSON_ARRAY('grape', 'red grape', 'green grape', '葡萄', '提子'), '水果', '葡萄', 'grape', '葡萄'),
('watermelon', JSON_ARRAY('watermelon', '西瓜', 'seedless watermelon'), '水果', '西瓜', 'watermelon', '西瓜'),
('mango', JSON_ARRAY('mango', '芒果', 'alphonso mango', 'ataulfo mango'), '水果', '芒果', 'mango', '芒果'),
('strawberry', JSON_ARRAY('strawberry', '草莓'), '水果', '草莓', 'strawberry', '草莓'),
('chicken', JSON_ARRAY('chicken', 'poultry', 'chicken breast', 'chicken thigh', '雞肉', '雞胸', '雞腿', '雞翅', 'chicken wing', 'drumstick'), '肉類', '雞肉', 'chicken', '雞肉'),
('pork', JSON_ARRAY('pork', 'pork chop', 'pork belly', '豬肉', '五花肉', '梅花肉', 'tenderloin', '里肌肉'), '肉類', '豬肉', 'pork', '豬肉'),
('beef', JSON_ARRAY('beef', 'steak', 'ground beef', '牛肉', '牛排', '絞肉', 'sirloin', 'ribeye', 'brisket'), '肉類', '牛肉', 'beef', '牛肉'),
('fish', JSON_ARRAY('fish', 'salmon', 'tuna', '魚', '鮭魚', '鮪魚', 'cod', '鱈魚'), '肉類', '魚類', 'fish', '魚'),
('cilantro', JSON_ARRAY('cilantro', 'coriander', 'chinese parsley', '香菜', '芫荽', 'coriander leaves'), '調味料', '香菜 - 葉子部分', 'cilantro', '香菜'),
('coriander_seed', JSON_ARRAY('coriander seed', 'coriander seeds', '芫荽籽', '香菜籽'), '調味料', '香菜籽 - 種子部分', 'coriander seed', '芫荽籽'),
('basil', JSON_ARRAY('basil', 'sweet basil', 'thai basil', '羅勒', '九層塔', 'holy basil'), '調味料', '羅勒', 'basil', '九層塔'),
('ginger', JSON_ARRAY('ginger', '薑', '生薑', 'fresh ginger', 'ginger root'), '調味料', '薑', 'ginger', '薑'),
('garlic', JSON_ARRAY('garlic', '大蒜', '蒜頭', 'garlic clove', 'minced garlic'), '調味料', '大蒜', 'garlic', '大蒜'),
('green_onion', JSON_ARRAY('green onion', 'scallion', 'spring onion', '蔥', '青蔥', '小蔥'), '調味料', '蔥', 'green onion', '蔥'),
('rice', JSON_ARRAY('rice', 'white rice', 'brown rice', '米飯', '白飯', '糙米', 'jasmine rice', 'basmati rice'), '穀物', '米飯', 'rice', '米'),
('noodles', JSON_ARRAY('noodles', 'pasta', 'spaghetti', '麵條', '義大利麵', 'ramen', '拉麵'), '穀物', '麵條', 'noodles', '麵'),
('bread', JSON_ARRAY('bread', 'whole wheat bread', 'white bread', '麵包', '吐司', 'toast', '全麥麵包'), '穀物', '麵包', 'bread', '麵包'),
('tofu', JSON_ARRAY('tofu', 'bean curd', 'firm tofu', 'silken tofu', '豆腐', '嫩豆腐', '板豆腐'), '豆類', '豆腐', 'tofu', '豆腐'),
('soybean', JSON_ARRAY('soybean', 'soy', 'edamame', '黃豆', '大豆', '毛豆'), '豆類', '大豆', 'soybean', '黃豆'),
('milk', JSON_ARRAY('milk', 'whole milk', 'skim milk', '牛奶', '鮮奶', 'low-fat milk', '低脂奶'), '乳製品', '牛奶', 'milk', '牛奶'),
('cheese', JSON_ARRAY('cheese', 'cheddar', 'mozzarella', '起司', '乳酪', 'parmesan', 'cream cheese'), '乳製品', '起司', 'cheese', '乳酪'),
('yogurt', JSON_ARRAY('yogurt', 'greek yogurt', '優格', '優酪乳', 'plain yogurt'), '乳製品', '優格', 'yogurt', '優酪乳'),
('almond', JSON_ARRAY('almond', 'almonds', '杏仁', 'raw almond', 'roasted almond'), '堅果', '杏仁', 'almond', '杏仁'),
('walnut', JSON_ARRAY('walnut', 'walnuts', '核桃', 'black walnut'), '堅果', '核桃', 'walnut', '核桃'),
('peanut', JSON_ARRAY('peanut', 'peanuts', 'groundnut', '花生', 'roasted peanut'), '堅果', '花生', 'peanut', '花生');


-- ==================== 4. 建立搜尋輔助函數視圖 ====================

-- 創建一個視圖，方便查詢所有別名
CREATE OR REPLACE VIEW food_alias_search AS
SELECT 
  f.id,
  f.family_key,
  f.category,
  f.description,
  f.foodb_search_term,
  f.taiwan_search_term,
  JSON_UNQUOTE(JSON_EXTRACT(f.aliases, CONCAT('$[', numbers.n, ']'))) AS alias_name
FROM 
  food_aliases f
CROSS JOIN (
  SELECT 0 AS n UNION SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 
  UNION SELECT 5 UNION SELECT 6 UNION SELECT 7 UNION SELECT 8 UNION SELECT 9
  UNION SELECT 10 UNION SELECT 11 UNION SELECT 12 UNION SELECT 13 UNION SELECT 14
  UNION SELECT 15 UNION SELECT 16 UNION SELECT 17 UNION SELECT 18 UNION SELECT 19
) numbers
WHERE JSON_UNQUOTE(JSON_EXTRACT(f.aliases, CONCAT('$[', numbers.n, ']'))) IS NOT NULL;


-- 創建增強搜尋函數（通過別名查找兩個資料庫的資料）
-- 此視圖會將別名連接到 FooDB 和 Taiwan Foods
CREATE OR REPLACE VIEW enhanced_food_search AS
SELECT 
  fa.family_key,
  fa.category,
  alias.alias_name,
  -- FooDB 資料
  f.id AS foodb_id,
  f.name AS foodb_name,
  f.food_group AS foodb_category,
  -- Taiwan Foods 資料  
  tf.food_name AS taiwan_food_name,
  tf.integration_code AS taiwan_code,
  tf.cal_per_100g AS taiwan_calories,
  tf.protein_per_100g AS taiwan_protein,
  tf.carbon_per_100g AS taiwan_carbs,
  tf.fats_per_100g AS taiwan_fats
FROM 
  food_aliases fa
LEFT JOIN (
  SELECT 
    id,
    family_key,
    JSON_UNQUOTE(JSON_EXTRACT(aliases, CONCAT('$[', n, ']'))) AS alias_name
  FROM 
    food_aliases,
    (SELECT 0 AS n UNION SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 
     UNION SELECT 5 UNION SELECT 6 UNION SELECT 7 UNION SELECT 8 UNION SELECT 9
     UNION SELECT 10 UNION SELECT 11 UNION SELECT 12 UNION SELECT 13 UNION SELECT 14) numbers
  WHERE JSON_UNQUOTE(JSON_EXTRACT(aliases, CONCAT('$[', n, ']'))) IS NOT NULL
) alias ON fa.family_key = alias.family_key
LEFT JOIN foodb.foods f ON f.name LIKE CONCAT('%', fa.foodb_search_term, '%')
LEFT JOIN taiwan_foods tf ON tf.food_name LIKE CONCAT('%', fa.taiwan_search_term, '%')
WHERE alias.alias_name IS NOT NULL;


-- ==================== 5. 建立搜尋儲存程序（可選）====================

DELIMITER //

CREATE PROCEDURE SearchFood(IN search_term VARCHAR(255))
BEGIN
  -- 搜尋任何別名並返回兩個資料庫的對應資料
  SELECT DISTINCT
    efs.family_key AS '食物分類',
    efs.category AS '類別',
    efs.alias_name AS '搜尋到的名稱',
    efs.foodb_id AS 'FooDB_ID',
    efs.foodb_name AS 'FooDB_名稱',
    efs.taiwan_food_name AS '台灣食品名稱',
    efs.taiwan_code AS '台灣編碼',
    efs.taiwan_calories AS '熱量(kcal/100g)',
    efs.taiwan_protein AS '蛋白質(g/100g)',
    efs.taiwan_carbs AS '碳水化合物(g/100g)',
    efs.taiwan_fats AS '脂肪(g/100g)'
  FROM 
    enhanced_food_search efs
  WHERE 
    efs.alias_name LIKE CONCAT('%', search_term, '%')
  LIMIT 50;
END //

DELIMITER ;


-- ==================== 6. 使用範例 ====================

-- 範例 1: 使用儲存程序搜尋 "奇異果" 或 "kiwi"
-- CALL SearchFood('奇異果');
-- CALL SearchFood('kiwi');
-- CALL SearchFood('apple');
-- CALL SearchFood('蘋果');

-- 範例 2: 直接查詢增強搜尋視圖
-- SELECT * FROM enhanced_food_search WHERE alias_name LIKE '%雞%';

-- 範例 3: 搜尋特定類別
-- SELECT * FROM enhanced_food_search WHERE category = '水果' AND alias_name LIKE '%果%';

-- 範例 4: 查看所有別名的展開視圖
-- SELECT * FROM food_alias_search WHERE family_key = 'kiwi';

-- 範例 5: 查詢 FooDB 和 Taiwan Foods 的所有蘋果資料
-- SELECT * FROM enhanced_food_search WHERE family_key = 'apple';


-- ==================== 完成提示 ====================

SELECT '✅ 食物關聯與別名表建立完成！' AS status;
SELECT '📝 下一步：執行 build_food_mapping.sql 來建立兩個資料庫的完整映射' AS info;
SELECT '🔍 然後使用 SearchFood() 來搜尋食物別名' AS info;


-- ==================== 7. 執行步驟說明 ====================

/*
執行順序：
1. 首先執行此檔案 (food_mapping.sql) 建立基礎表格和視圖
2. 然後執行 build_food_mapping.sql 來自動建立 FooDB 和 Taiwan Foods 的映射
3. 最後就可以使用增強搜尋功能

使用方式：
-- 搜尋任何中英文食物名稱
CALL SearchFood('蘋果');
CALL SearchFood('apple');
CALL SearchFood('奇異果');
CALL SearchFood('chicken');

-- 查看所有映射
SELECT * FROM food_mapping ORDER BY mapping_confidence DESC LIMIT 100;

-- 查看特定類別的映射
SELECT * FROM enhanced_food_search WHERE category = '水果';

-- 查看未匹配的食物
SELECT * FROM food_mapping WHERE foodb_id IS NULL;  -- 僅在 Taiwan Foods
SELECT * FROM food_mapping WHERE taiwan_food_id IS NULL;  -- 僅在 FooDB
*/
