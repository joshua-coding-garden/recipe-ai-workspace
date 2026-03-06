-- ==================== Food Mapping & Aliases（PostgreSQL 版）====================
-- 從 MySQL food_mapping.sql 轉換
-- 重點：JSON → JSONB，ENUM → VARCHAR + CHECK，移除 MySQL 視圖和存儲程序

-- FooDB 與 Taiwan Foods 關聯表
CREATE TABLE IF NOT EXISTS food_mapping (
  id                      SERIAL PRIMARY KEY,
  foodb_id                INT,
  foodb_name              VARCHAR(255),
  taiwan_food_id          INT,
  taiwan_food_name        VARCHAR(255),
  taiwan_integration_code VARCHAR(100),
  mapping_confidence      DECIMAL(3,2) DEFAULT 1.0,
  mapping_type            VARCHAR(20)  DEFAULT 'manual'
                          CHECK (mapping_type IN ('exact','similar','manual','translation','fuzzy','unmatched')),
  notes                   TEXT,
  created_at              TIMESTAMP DEFAULT NOW(),
  updated_at              TIMESTAMP DEFAULT NOW()
);

CREATE OR REPLACE TRIGGER trg_food_mapping_updated_at
  BEFORE UPDATE ON food_mapping
  FOR EACH ROW EXECUTE FUNCTION set_updated_at();

CREATE INDEX IF NOT EXISTS idx_food_mapping_foodb_id   ON food_mapping(foodb_id);
CREATE INDEX IF NOT EXISTS idx_food_mapping_taiwan_id  ON food_mapping(taiwan_food_id);
CREATE INDEX IF NOT EXISTS idx_food_mapping_confidence ON food_mapping(mapping_confidence);

-- 食物別名/同義詞表（JSON → JSONB）
CREATE TABLE IF NOT EXISTS food_aliases (
  id                  SERIAL PRIMARY KEY,
  family_key          VARCHAR(100) NOT NULL UNIQUE,
  aliases             JSONB NOT NULL,        -- 使用 JSONB 支援 GIN 索引和 @> 查詢
  category            VARCHAR(50),
  description         TEXT,
  foodb_search_term   VARCHAR(255),
  taiwan_search_term  VARCHAR(255),
  created_at          TIMESTAMP DEFAULT NOW(),
  updated_at          TIMESTAMP DEFAULT NOW()
);

CREATE OR REPLACE TRIGGER trg_food_aliases_updated_at
  BEFORE UPDATE ON food_aliases
  FOR EACH ROW EXECUTE FUNCTION set_updated_at();

-- GIN 索引：JSONB 陣列元素搜尋（aliases @> '["馬鈴薯"]' 或 aliases ? '馬鈴薯'）
CREATE INDEX IF NOT EXISTS idx_food_aliases_gin       ON food_aliases USING GIN (aliases);
CREATE INDEX IF NOT EXISTS idx_food_aliases_category  ON food_aliases(category);
CREATE INDEX IF NOT EXISTS idx_food_aliases_foodb     ON food_aliases(foodb_search_term);
CREATE INDEX IF NOT EXISTS idx_food_aliases_taiwan    ON food_aliases(taiwan_search_term);

-- 插入預設別名資料（從 MySQL food_mapping.sql 移植，JSON_ARRAY → JSONB 格式）
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES
('potato',         '["potato","spud","tater","馬鈴薯","土豆","洋芋","white potato","irish potato"]',        '蔬菜',   '馬鈴薯 - 包含各種常見別名', 'potato',        '馬鈴薯'),
('tomato',         '["tomato","cherry tomato","heirloom tomato","番茄","西紅柿","plum tomato","roma tomato"]','蔬菜',   '番茄 - 包含不同品種',       'tomato',        '番茄'),
('sweet_potato',   '["sweet potato","yam","地瓜","番薯","紅薯","purple sweet potato","紫薯"]',               '蔬菜',   '地瓜',                      'sweet potato',  '地瓜'),
('carrot',         '["carrot","胡蘿蔔","紅蘿蔔","baby carrot"]',                                             '蔬菜',   '胡蘿蔔',                    'carrot',        '胡蘿蔔'),
('cabbage',        '["cabbage","napa cabbage","chinese cabbage","高麗菜","包心菜","大白菜","圓白菜"]',         '蔬菜',   '高麗菜',                    'cabbage',       '高麗菜'),
('spinach',        '["spinach","菠菜","water spinach","空心菜"]',                                             '蔬菜',   '菠菜',                      'spinach',       '菠菜'),
('apple',          '["apple","gala apple","fuji apple","granny smith","蘋果","青蘋果","紅蘋果"]',             '水果',   '蘋果',                      'apple',         '蘋果'),
('banana',         '["banana","香蕉","plantain","芭蕉","cavendish banana"]',                                  '水果',   '香蕉',                      'banana',        '香蕉'),
('kiwi',           '["kiwi","kiwifruit","奇異果","獼猴桃","golden kiwi","green kiwi"]',                      '水果',   '奇異果',                    'kiwi',          '奇異果'),
('orange',         '["orange","mandarin orange","tangerine","橘子","柳橙","橙子","柑橘"]',                    '水果',   '柑橘',                      'orange',        '橘子'),
('grape',          '["grape","red grape","green grape","葡萄","提子"]',                                       '水果',   '葡萄',                      'grape',         '葡萄'),
('watermelon',     '["watermelon","西瓜","seedless watermelon"]',                                             '水果',   '西瓜',                      'watermelon',    '西瓜'),
('mango',          '["mango","芒果","alphonso mango","ataulfo mango"]',                                       '水果',   '芒果',                      'mango',         '芒果'),
('strawberry',     '["strawberry","草莓"]',                                                                   '水果',   '草莓',                      'strawberry',    '草莓'),
('chicken',        '["chicken","poultry","chicken breast","chicken thigh","雞肉","雞胸","雞腿","雞翅","chicken wing","drumstick"]','肉類','雞肉','chicken','雞肉'),
('pork',           '["pork","pork chop","pork belly","豬肉","五花肉","梅花肉","tenderloin","里肌肉"]',         '肉類',   '豬肉',                      'pork',          '豬肉'),
('beef',           '["beef","steak","ground beef","牛肉","牛排","絞肉","sirloin","ribeye","brisket"]',         '肉類',   '牛肉',                      'beef',          '牛肉'),
('fish',           '["fish","salmon","tuna","魚","鮭魚","鮪魚","cod","鱈魚"]',                                '肉類',   '魚類',                      'fish',          '魚'),
('cilantro',       '["cilantro","coriander","chinese parsley","香菜","芫荽","coriander leaves"]',             '調味料', '香菜 - 葉子部分',           'cilantro',      '香菜'),
('coriander_seed', '["coriander seed","coriander seeds","芫荽籽","香菜籽"]',                                  '調味料', '香菜籽 - 種子部分',         'coriander seed','芫荽籽'),
('basil',          '["basil","sweet basil","thai basil","羅勒","九層塔","holy basil"]',                       '調味料', '羅勒',                      'basil',         '九層塔'),
('ginger',         '["ginger","薑","生薑","fresh ginger","ginger root"]',                                     '調味料', '薑',                        'ginger',        '薑'),
('garlic',         '["garlic","大蒜","蒜頭","garlic clove","minced garlic"]',                                 '調味料', '大蒜',                      'garlic',        '大蒜'),
('green_onion',    '["green onion","scallion","spring onion","蔥","青蔥","小蔥"]',                            '調味料', '蔥',                        'green onion',   '蔥'),
('rice',           '["rice","white rice","brown rice","米飯","白飯","糙米","jasmine rice","basmati rice"]',   '穀物',   '米飯',                      'rice',          '米'),
('noodles',        '["noodles","pasta","spaghetti","麵條","義大利麵","ramen","拉麵"]',                         '穀物',   '麵條',                      'noodles',       '麵'),
('bread',          '["bread","whole wheat bread","white bread","麵包","吐司","toast","全麥麵包"]',             '穀物',   '麵包',                      'bread',         '麵包'),
('tofu',           '["tofu","bean curd","firm tofu","silken tofu","豆腐","嫩豆腐","板豆腐"]',                 '豆類',   '豆腐',                      'tofu',          '豆腐'),
('soybean',        '["soybean","soy","edamame","黃豆","大豆","毛豆"]',                                        '豆類',   '大豆',                      'soybean',       '黃豆'),
('milk',           '["milk","whole milk","skim milk","牛奶","鮮奶","low-fat milk","低脂奶"]',                  '乳製品', '牛奶',                      'milk',          '牛奶'),
('cheese',         '["cheese","cheddar","mozzarella","起司","乳酪","parmesan","cream cheese"]',               '乳製品', '起司',                      'cheese',        '乳酪'),
('yogurt',         '["yogurt","greek yogurt","優格","優酪乳","plain yogurt"]',                                '乳製品', '優格',                      'yogurt',        '優酪乳'),
('almond',         '["almond","almonds","杏仁","raw almond","roasted almond"]',                               '堅果',   '杏仁',                      'almond',        '杏仁'),
('walnut',         '["walnut","walnuts","核桃","black walnut"]',                                              '堅果',   '核桃',                      'walnut',        '核桃'),
('peanut',         '["peanut","peanuts","groundnut","花生","roasted peanut"]',                                '堅果',   '花生',                      'peanut',        '花生')
ON CONFLICT (family_key) DO NOTHING;
