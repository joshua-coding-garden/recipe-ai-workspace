-- 完整 food_aliases 腳本（包括所有映射記錄）
-- 自動生成於: 2026-01-27T16:01:45.890Z
-- 基於 3087 筆映射記錄

USE userdb;

-- 清空現有別名（保留手動添加的前 35 筆）
DELETE FROM food_aliases WHERE family_key LIKE 'map_%';

-- 插入別名資料
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_11', '[\"中國對蝦\",\"對蝦;明蝦;大蝦;黃蝦;青蝦;大正蝦\",\"Shrimp\",\"shrimp\",\"Caridea\"]', '魚貝類', '自動生成: 中國對蝦 ↔ Shrimp', 'Shrimp', '中國對蝦');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_13', '[\"中脂人造奶油\",\"植物性奶油\",\"American butterfish\",\"american butterfish\",\"Peprilus triacanthus\"]', '油脂類', '自動生成: 中脂人造奶油 ↔ American butterfish', 'American butterfish', '中脂人造奶油');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_15', '[\"中脂凝態發酵乳(草莓)\",\"中脂凝態發酵乳\",\"優格\",\"Strawberry\",\"strawberry\",\"Fragaria X ananassa\"]', '乳品類', '自動生成: 中脂凝態發酵乳(草莓) ↔ Strawberry', 'Strawberry', '中脂凝態發酵乳(草莓)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_19', '[\"中脂濃稠發酵乳(無糖&纖維強化)\",\"中脂濃稠發酵乳\",\"優酪乳\",\"Sugar\",\"sugar\"]', '乳品類', '自動生成: 中脂濃稠發酵乳(無糖&纖維強化) ↔ Sugar', 'Sugar', '中脂濃稠發酵乳(無糖&纖維強化)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_20', '[\"中脂濃稠發酵乳(草莓)\",\"中脂濃稠發酵乳\",\"優酪乳\",\"Strawberry\",\"strawberry\",\"Fragaria X ananassa\"]', '乳品類', '自動生成: 中脂濃稠發酵乳(草莓) ↔ Strawberry', 'Strawberry', '中脂濃稠發酵乳(草莓)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_23', '[\"中脂調味乳(果汁)\",\"中脂調味乳\",\"牛乳\",\"牛奶\",\"Fruit juice\",\"fruit juice\"]', '乳品類', '自動生成: 中脂調味乳(果汁) ↔ Fruit juice', 'Fruit juice', '中脂調味乳(果汁)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_30', '[\"中脂調味保久羊乳(果汁)\",\"中脂調味保久羊乳\",\"羊奶\",\"Fruit juice\",\"fruit juice\"]', '乳品類', '自動生成: 中脂調味保久羊乳(果汁) ↔ Fruit juice', 'Fruit juice', '中脂調味保久羊乳(果汁)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_36', '[\"乳酪蛋糕\",\"Blue cheese\",\"blue cheese\"]', '糕餅點心類', '自動生成: 乳酪蛋糕 ↔ Blue cheese', 'Blue cheese', '乳酪蛋糕');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_48', '[\"乾玉米粒\",\"Acorn\",\"acorn\",\"Quercus\"]', '穀物類', '自動生成: 乾玉米粒 ↔ Acorn', 'Acorn', '乾玉米粒');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_67', '[\"五穀米\",\"Annual wild rice\",\"annual wild rice\",\"Zizania aquatica\"]', '穀物類', '自動生成: 五穀米 ↔ Annual wild rice', 'Annual wild rice', '五穀米');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_74', '[\"人造奶油(2021年取樣)\",\"人造奶油\",\"乳瑪琳\",\"American butterfish\",\"american butterfish\",\"Peprilus triacanthus\"]', '油脂類', '自動生成: 人造奶油(2021年取樣) ↔ American butterfish', 'American butterfish', '人造奶油(2021年取樣)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_75', '[\"人造奶油(低熱量)\",\"人造奶油\",\"American butterfish\",\"american butterfish\",\"Peprilus triacanthus\"]', '油脂類', '自動生成: 人造奶油(低熱量) ↔ American butterfish', 'American butterfish', '人造奶油(低熱量)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_76', '[\"人造奶油(維生素強化)\",\"人造奶油\",\"植物性奶油\",\"American butterfish\",\"american butterfish\",\"Peprilus triacanthus\"]', '油脂類', '自動生成: 人造奶油(維生素強化) ↔ American butterfish', 'American butterfish', '人造奶油(維生素強化)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_82', '[\"低眼無齒芒魚片(芒加魚邊)\",\"低眼無齒芒魚片\",\"Alaska blackfish\",\"alaska blackfish\",\"Dallia pectoralis\"]', '魚貝類', '自動生成: 低眼無齒芒魚片(芒加魚邊) ↔ Alaska blackfish', 'Alaska blackfish', '低眼無齒芒魚片(芒加魚邊)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_84', '[\"低脂強化保久乳(寡糖強化)\",\"低脂強化保久乳\",\"牛乳\",\"牛奶\",\"Sugar\",\"sugar\"]', '乳品類', '自動生成: 低脂強化保久乳(寡糖強化) ↔ Sugar', 'Sugar', '低脂強化保久乳(寡糖強化)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_88', '[\"低脂調味乳(木瓜)\",\"低脂調味乳\",\"牛乳\",\"牛奶\",\"Papaya\",\"papaya\",\"Carica papaya\"]', '乳品類', '自動生成: 低脂調味乳(木瓜) ↔ Papaya', 'Papaya', '低脂調味乳(木瓜)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_91', '[\"低鈉鹽\",\"Salt\",\"salt\"]', '調味料及香辛料類', '自動生成: 低鈉鹽 ↔ Salt', 'Salt', '低鈉鹽');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_92', '[\"保久米漿\",\"Annual wild rice\",\"annual wild rice\",\"Zizania aquatica\"]', '加工調理食品及其他類', '自動生成: 保久米漿 ↔ Annual wild rice', 'Annual wild rice', '保久米漿');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_95', '[\"傳統豆腐\",\"板豆腐\",\"Tofu\",\"tofu\"]', '加工調理食品及其他類', '自動生成: 傳統豆腐 ↔ Tofu', 'Tofu', '傳統豆腐');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_96', '[\"傳統豆腐(2022年取樣)\",\"傳統豆腐\",\"板豆腐\",\"Tofu\",\"tofu\"]', '加工調理食品及其他類', '自動生成: 傳統豆腐(2022年取樣) ↔ Tofu', 'Tofu', '傳統豆腐(2022年取樣)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_97', '[\"傳統豆花(未加糖)\",\"傳統豆花\",\"Sugar\",\"sugar\"]', '糕餅點心類', '自動生成: 傳統豆花(未加糖) ↔ Sugar', 'Sugar', '傳統豆花(未加糖)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_122', '[\"冬瓜糖磚\",\"Sugar\",\"sugar\"]', '糖類', '自動生成: 冬瓜糖磚 ↔ Sugar', 'Sugar', '冬瓜糖磚');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_123', '[\"冬瓜茶\",\"Black tea\",\"black tea\"]', '飲料類', '自動生成: 冬瓜茶 ↔ Black tea', 'Black tea', '冬瓜茶');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_126', '[\"冰糖\",\"Sugar\",\"sugar\"]', '糖類', '自動生成: 冰糖 ↔ Sugar', 'Sugar', '冰糖');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_129', '[\"冷凍冬菜蝦仁餛飩\",\"雲吞\",\"Shrimp\",\"shrimp\",\"Caridea\"]', '加工調理食品及其他類', '自動生成: 冷凍冬菜蝦仁餛飩 ↔ Shrimp', 'Shrimp', '冷凍冬菜蝦仁餛飩');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_132', '[\"冷凍可樂餅(奶汁)\",\"冷凍可樂餅\",\"Chocolate\",\"chocolate\"]', '加工調理食品及其他類', '自動生成: 冷凍可樂餅(奶汁) ↔ Chocolate', 'Chocolate', '冷凍可樂餅(奶汁)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_134', '[\"冷凍小香腸\",\"Sausage\",\"sausage\"]', '加工調理食品及其他類', '自動生成: 冷凍小香腸 ↔ Sausage', 'Sausage', '冷凍小香腸');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_135', '[\"冷凍帶殼花生(熟)\",\"冷凍帶殼花生\",\"土豆\",\"長生果\",\"落花生\",\"Peanut\",\"peanut\",\"Arachis hypogaea\"]', '堅果及種子類', '自動生成: 冷凍帶殼花生(熟) ↔ Peanut', 'Peanut', '冷凍帶殼花生(熟)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_137', '[\"冷凍披薩(黑胡椒火腿)\",\"冷凍披薩\",\"Hamburger\",\"hamburger\"]', '加工調理食品及其他類', '自動生成: 冷凍披薩(黑胡椒火腿) ↔ Hamburger', 'Hamburger', '冷凍披薩(黑胡椒火腿)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_138', '[\"冷凍文蛤丸\",\"Bivalvia (Clam, Mussel, Oyster)\",\"bivalvia (clam, mussel, oyster)\",\"Bivalvia\"]', '加工調理食品及其他類', '自動生成: 冷凍文蛤丸 ↔ Bivalvia (Clam, Mussel, Oyster)', 'Bivalvia (Clam, Mussel, Oyster)', '冷凍文蛤丸');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_139', '[\"冷凍旗魚丸\",\"Alaska blackfish\",\"alaska blackfish\",\"Dallia pectoralis\"]', '加工調理食品及其他類', '自動生成: 冷凍旗魚丸 ↔ Alaska blackfish', 'Alaska blackfish', '冷凍旗魚丸');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_140', '[\"冷凍旗魚塊\",\"Alaska blackfish\",\"alaska blackfish\",\"Dallia pectoralis\"]', '加工調理食品及其他類', '自動生成: 冷凍旗魚塊 ↔ Alaska blackfish', 'Alaska blackfish', '冷凍旗魚塊');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_146', '[\"冷凍洋蔥圈\",\"Garden onion\",\"garden onion\",\"Allium cepa\"]', '加工調理食品及其他類', '自動生成: 冷凍洋蔥圈 ↔ Garden onion', 'Garden onion', '冷凍洋蔥圈');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_147', '[\"冷凍火腿炒飯\",\"Hamburger\",\"hamburger\"]', '加工調理食品及其他類', '自動生成: 冷凍火腿炒飯 ↔ Hamburger', 'Hamburger', '冷凍火腿炒飯');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_152', '[\"冷凍牛肉包子\",\"Beefalo\",\"beefalo\",\"Bos taurus X Bison bison\"]', '加工調理食品及其他類', '自動生成: 冷凍牛肉包子 ↔ Beefalo', 'Beefalo', '冷凍牛肉包子');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_153', '[\"冷凍牛肉水餃\",\"Beefalo\",\"beefalo\",\"Bos taurus X Bison bison\"]', '加工調理食品及其他類', '自動生成: 冷凍牛肉水餃 ↔ Beefalo', 'Beefalo', '冷凍牛肉水餃');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_154', '[\"冷凍牛肉漢堡肉\",\"Beefalo\",\"beefalo\",\"Bos taurus X Bison bison\"]', '加工調理食品及其他類', '自動生成: 冷凍牛肉漢堡肉 ↔ Beefalo', 'Beefalo', '冷凍牛肉漢堡肉');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_155', '[\"冷凍玉米粒\",\"Acorn\",\"acorn\",\"Quercus\"]', '穀物類', '自動生成: 冷凍玉米粒 ↔ Acorn', 'Acorn', '冷凍玉米粒');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_160', '[\"冷凍筒仔米糕\",\"Annual wild rice\",\"annual wild rice\",\"Zizania aquatica\"]', '加工調理食品及其他類', '自動生成: 冷凍筒仔米糕 ↔ Annual wild rice', 'Annual wild rice', '冷凍筒仔米糕');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_165', '[\"冷凍胡蘿蔔\",\"紅蘿蔔\",\"紅菜頭\",\"黃蘿蔔\",\"丁香蘿蔔\",\"人參\",\"金筍\",\"Carrot\",\"carrot\",\"Daucus carota ssp. sativus\"]', '蔬菜類', '自動生成: 冷凍胡蘿蔔 ↔ Carrot', 'Carrot', '冷凍胡蘿蔔');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_168', '[\"冷凍芝麻包\",\"Sesame\",\"sesame\",\"Sesamum orientale\"]', '加工調理食品及其他類', '自動生成: 冷凍芝麻包 ↔ Sesame', 'Sesame', '冷凍芝麻包');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_169', '[\"冷凍芝麻湯圓\",\"Sesame\",\"sesame\",\"Sesamum orientale\"]', '加工調理食品及其他類', '自動生成: 冷凍芝麻湯圓 ↔ Sesame', 'Sesame', '冷凍芝麻湯圓');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_170', '[\"冷凍花枝丸\",\"Cuttlefish\",\"cuttlefish\",\"Sepiidae\"]', '加工調理食品及其他類', '自動生成: 冷凍花枝丸 ↔ Cuttlefish', 'Cuttlefish', '冷凍花枝丸');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_171', '[\"冷凍花枝塊\",\"Cuttlefish\",\"cuttlefish\",\"Sepiidae\"]', '加工調理食品及其他類', '自動生成: 冷凍花枝塊 ↔ Cuttlefish', 'Cuttlefish', '冷凍花枝塊');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_172', '[\"冷凍花枝排\",\"Cuttlefish\",\"cuttlefish\",\"Sepiidae\"]', '加工調理食品及其他類', '自動生成: 冷凍花枝排 ↔ Cuttlefish', 'Cuttlefish', '冷凍花枝排');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_173', '[\"冷凍花枝漿\",\"Cuttlefish\",\"cuttlefish\",\"Sepiidae\"]', '加工調理食品及其他類', '自動生成: 冷凍花枝漿 ↔ Cuttlefish', 'Cuttlefish', '冷凍花枝漿');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_174', '[\"冷凍花枝羹\",\"Cuttlefish\",\"cuttlefish\",\"Sepiidae\"]', '加工調理食品及其他類', '自動生成: 冷凍花枝羹 ↔ Cuttlefish', 'Cuttlefish', '冷凍花枝羹');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_175', '[\"冷凍花枝餃\",\"Cuttlefish\",\"cuttlefish\",\"Sepiidae\"]', '加工調理食品及其他類', '自動生成: 冷凍花枝餃 ↔ Cuttlefish', 'Cuttlefish', '冷凍花枝餃');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_176', '[\"冷凍花椰菜\",\"花菜\",\"菜花\",\"白花菜\",\"白菜花\",\"Broccoli\",\"broccoli\",\"Brassica oleracea var. italica\"]', '蔬菜類', '自動生成: 冷凍花椰菜 ↔ Broccoli', 'Broccoli', '冷凍花椰菜');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_177', '[\"冷凍花生湯圓\",\"Peanut\",\"peanut\",\"Arachis hypogaea\"]', '加工調理食品及其他類', '自動生成: 冷凍花生湯圓 ↔ Peanut', 'Peanut', '冷凍花生湯圓');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_181', '[\"冷凍菠菜\",\"菠菱菜\",\"赤根菜\",\"飛龍菜\",\"角菜\",\"波斯草\",\"波斯菜\",\"波菱菜\",\"Malabar spinach\",\"malabar spinach\",\"Basella alba\"]', '蔬菜類', '自動生成: 冷凍菠菜 ↔ Malabar spinach', 'Malabar spinach', '冷凍菠菜');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_184', '[\"冷凍虱目魚丸\",\"Alaska blackfish\",\"alaska blackfish\",\"Dallia pectoralis\"]', '加工調理食品及其他類', '自動生成: 冷凍虱目魚丸 ↔ Alaska blackfish', 'Alaska blackfish', '冷凍虱目魚丸');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_185', '[\"冷凍蚵捲\",\"Bivalvia (Clam, Mussel, Oyster)\",\"bivalvia (clam, mussel, oyster)\",\"Bivalvia\"]', '加工調理食品及其他類', '自動生成: 冷凍蚵捲 ↔ Bivalvia (Clam, Mussel, Oyster)', 'Bivalvia (Clam, Mussel, Oyster)', '冷凍蚵捲');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_186', '[\"冷凍蛋餃\",\"Egg roll\",\"egg roll\"]', '加工調理食品及其他類', '自動生成: 冷凍蛋餃 ↔ Egg roll', 'Egg roll', '冷凍蛋餃');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_187', '[\"冷凍蛋餅皮\",\"Egg roll\",\"egg roll\"]', '加工調理食品及其他類', '自動生成: 冷凍蛋餅皮 ↔ Egg roll', 'Egg roll', '冷凍蛋餅皮');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_188', '[\"冷凍蝦丸\",\"Shrimp\",\"shrimp\",\"Caridea\"]', '加工調理食品及其他類', '自動生成: 冷凍蝦丸 ↔ Shrimp', 'Shrimp', '冷凍蝦丸');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_189', '[\"冷凍蝦仁炒飯\",\"Shrimp\",\"shrimp\",\"Caridea\"]', '加工調理食品及其他類', '自動生成: 冷凍蝦仁炒飯 ↔ Shrimp', 'Shrimp', '冷凍蝦仁炒飯');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_190', '[\"冷凍蝦捲\",\"Shrimp\",\"shrimp\",\"Caridea\"]', '加工調理食品及其他類', '自動生成: 冷凍蝦捲 ↔ Shrimp', 'Shrimp', '冷凍蝦捲');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_191', '[\"冷凍蝦餃\",\"Shrimp\",\"shrimp\",\"Caridea\"]', '加工調理食品及其他類', '自動生成: 冷凍蝦餃 ↔ Shrimp', 'Shrimp', '冷凍蝦餃');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_192', '[\"冷凍蝦餅\",\"Shrimp\",\"shrimp\",\"Caridea\"]', '加工調理食品及其他類', '自動生成: 冷凍蝦餅 ↔ Shrimp', 'Shrimp', '冷凍蝦餅');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_195', '[\"冷凍豆腐\",\"凍豆腐\",\"Tofu\",\"tofu\"]', '加工調理食品及其他類', '自動生成: 冷凍豆腐 ↔ Tofu', 'Tofu', '冷凍豆腐');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_196', '[\"冷凍豌豆仁\",\"荷蓮豆仁\",\"荷仁豆仁\",\"荷蘭豆仁\",\"花蓮豆仁\",\"飛龍豆仁\",\"青豆仁\",\"胡豆仁\",\"畢豆仁\",\"宛豆仁\",\"孫豆仁\",\"丸豆仁\",\"留\",\"Asian pear\",\"asian pear\",\"Pyrus pyrifolia\"]', '豆類', '自動生成: 冷凍豌豆仁 ↔ Asian pear', 'Asian pear', '冷凍豌豆仁');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_203', '[\"冷凍豬肉韭菜水餃\",\"Chinese chives\",\"chinese chives\",\"Allium tuberosum\"]', '加工調理食品及其他類', '自動生成: 冷凍豬肉韭菜水餃 ↔ Chinese chives', 'Chinese chives', '冷凍豬肉韭菜水餃');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_209', '[\"冷凍雞肉丸\",\"Chicken\",\"chicken\",\"Gallus gallus\"]', '加工調理食品及其他類', '自動生成: 冷凍雞肉丸 ↔ Chicken', 'Chicken', '冷凍雞肉丸');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_211', '[\"冷凍青花菜\",\"(青花菜非綠色花椰菜)青(綠)花菜\",\"美國花菜\",\"青花苔\",\"花(青)菜苔\",\"菜苔\",\"花菜苞\",\"Broccoli\",\"broccoli\",\"Brassica oleracea var. italica\"]', '蔬菜類', '自動生成: 冷凍青花菜 ↔ Broccoli', 'Broccoli', '冷凍青花菜');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_212', '[\"冷凍香菇雞肉水餃\",\"Chicken\",\"chicken\",\"Gallus gallus\"]', '加工調理食品及其他類', '自動生成: 冷凍香菇雞肉水餃 ↔ Chicken', 'Chicken', '冷凍香菇雞肉水餃');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_216', '[\"冷凍馬鈴薯條\",\"薯條\",\"Baked potato\",\"baked potato\"]', '加工調理食品及其他類', '自動生成: 冷凍馬鈴薯條 ↔ Baked potato', 'Baked potato', '冷凍馬鈴薯條');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_217', '[\"冷凍魚卵卷\",\"Alaska blackfish\",\"alaska blackfish\",\"Dallia pectoralis\"]', '加工調理食品及其他類', '自動生成: 冷凍魚卵卷 ↔ Alaska blackfish', 'Alaska blackfish', '冷凍魚卵卷');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_218', '[\"冷凍魚捲\",\"Alaska blackfish\",\"alaska blackfish\",\"Dallia pectoralis\"]', '加工調理食品及其他類', '自動生成: 冷凍魚捲 ↔ Alaska blackfish', 'Alaska blackfish', '冷凍魚捲');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_219', '[\"冷凍魚餃\",\"Alaska blackfish\",\"alaska blackfish\",\"Dallia pectoralis\"]', '加工調理食品及其他類', '自動生成: 冷凍魚餃 ↔ Alaska blackfish', 'Alaska blackfish', '冷凍魚餃');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_220', '[\"冷凍魷魚圈\",\"Squid\",\"squid\",\"Teuthida\"]', '加工調理食品及其他類', '自動生成: 冷凍魷魚圈 ↔ Squid', 'Squid', '冷凍魷魚圈');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_222', '[\"冷凍鮪魚水餃\",\"Albacore tuna\",\"albacore tuna\",\"Thunnus alalunga\"]', '加工調理食品及其他類', '自動生成: 冷凍鮪魚水餃 ↔ Albacore tuna', 'Albacore tuna', '冷凍鮪魚水餃');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_223', '[\"冷凍鱈魚丸\",\"Atlantic cod\",\"atlantic cod\",\"Gadus morhua\"]', '加工調理食品及其他類', '自動生成: 冷凍鱈魚丸 ↔ Atlantic cod', 'Atlantic cod', '冷凍鱈魚丸');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_224', '[\"冷凍麻竹筍\",\"蔴竹\",\"甜竹\",\"巨竹\",\"坭竹\",\"大綠竹\",\"瓦坭竹\",\"巨麻竹\",\"美濃麻竹\",\"吊絲麻竹\",\"Bamboo shoots\",\"bamboo shoots\",\"Phyllostachys edulis\"]', '蔬菜類', '自動生成: 冷凍麻竹筍 ↔ Bamboo shoots', 'Bamboo shoots', '冷凍麻竹筍');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_228', '[\"冷藏廣式蘿蔔糕\",\"菜頭粿\",\"Black radish\",\"black radish\",\"Raphanus sativus var. niger\"]', '糕餅點心類', '自動生成: 冷藏廣式蘿蔔糕 ↔ Black radish', 'Black radish', '冷藏廣式蘿蔔糕');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_231', '[\"凱特芒果\",\"檬果\",\"檨仔\",\"菴羅果\",\"Mango\",\"mango\",\"Mangifera indica\"]', '水果類', '自動生成: 凱特芒果 ↔ Mango', 'Mango', '凱特芒果');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_235', '[\"切片火腿(牛肉)\",\"切片火腿\",\"三明治火腿\",\"火腿片\",\"Beefalo\",\"beefalo\",\"Bos taurus X Bison bison\"]', '加工調理食品及其他類', '自動生成: 切片火腿(牛肉) ↔ Beefalo', 'Beefalo', '切片火腿(牛肉)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_236', '[\"切片火腿(豬肉)\",\"切片火腿\",\"三明治火腿\",\"火腿片\",\"Hamburger\",\"hamburger\"]', '加工調理食品及其他類', '自動生成: 切片火腿(豬肉) ↔ Hamburger', 'Hamburger', '切片火腿(豬肉)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_237', '[\"切片火腿(雞肉)\",\"切片火腿\",\"三明治火腿\",\"火腿片\",\"Chicken\",\"chicken\",\"Gallus gallus\"]', '加工調理食品及其他類', '自動生成: 切片火腿(雞肉) ↔ Chicken', 'Chicken', '切片火腿(雞肉)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_238', '[\"初卵雞蛋\",\"Egg roll\",\"egg roll\"]', '蛋類', '自動生成: 初卵雞蛋 ↔ Egg roll', 'Egg roll', '初卵雞蛋');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_247', '[\"加拉蘋果\",\"柰\",\"林檎\",\"Apple\",\"apple\",\"Malus pumila\"]', '水果類', '自動生成: 加拉蘋果 ↔ Apple', 'Apple', '加拉蘋果');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_248', '[\"加糖部份脫脂煉乳\",\"Sugar\",\"sugar\"]', '乳品類', '自動生成: 加糖部份脫脂煉乳 ↔ Sugar', 'Sugar', '加糖部份脫脂煉乳');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_249', '[\"加鈣米\",\"Annual wild rice\",\"annual wild rice\",\"Zizania aquatica\"]', '穀物類', '自動生成: 加鈣米 ↔ Annual wild rice', 'Annual wild rice', '加鈣米');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_250', '[\"加鹽沙士\",\"Salt\",\"salt\"]', '飲料類', '自動生成: 加鹽沙士 ↔ Salt', 'Salt', '加鹽沙士');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_254', '[\"北方長額蝦(加工)\",\"北方長額蝦\",\"北極蝦\",\"北極甜蝦\",\"冷水蝦\",\"Shrimp\",\"shrimp\",\"Caridea\"]', '魚貝類', '自動生成: 北方長額蝦(加工) ↔ Shrimp', 'Shrimp', '北方長額蝦(加工)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_266', '[\"南瓜平均值\",\"金瓜\",\"飯瓜\",\"番(翻)瓜\",\"倭(窩)瓜\",\"紅(冬/西洋)南瓜\",\"南瓜\",\"北瓜\",\"玉瓜\",\"筍瓜\",\"Japanese pumpkin\",\"japanese pumpkin\",\"Cucurbita maxima\"]', '蔬菜類', '自動生成: 南瓜平均值 ↔ Japanese pumpkin', 'Japanese pumpkin', '南瓜平均值');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_267', '[\"南瓜籽油\",\"Japanese pumpkin\",\"japanese pumpkin\",\"Cucurbita maxima\"]', '油脂類', '自動生成: 南瓜籽油 ↔ Japanese pumpkin', 'Japanese pumpkin', '南瓜籽油');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_270', '[\"印度鐮齒魚\",\"水狗母\",\"粉粘\",\"那哥\",\"那個魚\",\"Alaska blackfish\",\"alaska blackfish\",\"Dallia pectoralis\"]', '魚貝類', '自動生成: 印度鐮齒魚 ↔ Alaska blackfish', 'Alaska blackfish', '印度鐮齒魚');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_271', '[\"即溶咖啡粉\",\"Arabica coffee\",\"arabica coffee\",\"Coffea arabica\"]', '飲料類', '自動生成: 即溶咖啡粉 ↔ Arabica coffee', 'Arabica coffee', '即溶咖啡粉');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_275', '[\"原味松子仁\",\"Pine nut\",\"pine nut\",\"Pinus\"]', '堅果及種子類', '自動生成: 原味松子仁 ↔ Pine nut', 'Pine nut', '原味松子仁');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_277', '[\"原味腰果\",\"Cashew nut\",\"cashew nut\",\"Anacardium occidentale\"]', '堅果及種子類', '自動生成: 原味腰果 ↔ Cashew nut', 'Cashew nut', '原味腰果');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_285', '[\"去膜花生仁(生)\",\"去膜花生仁\",\"土豆\",\"長生果\",\"落花生\",\"Peanut\",\"peanut\",\"Arachis hypogaea\"]', '堅果及種子類', '自動生成: 去膜花生仁(生) ↔ Peanut', 'Peanut', '去膜花生仁(生)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_288', '[\"去骨肩頸眼羊肉\",\"Lambsquarters\",\"lambsquarters\",\"Chenopodium album\"]', '肉類', '自動生成: 去骨肩頸眼羊肉 ↔ Lambsquarters', 'Lambsquarters', '去骨肩頸眼羊肉');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_295', '[\"可樂\",\"Chocolate\",\"chocolate\"]', '飲料類', '自動生成: 可樂 ↔ Chocolate', 'Chocolate', '可樂');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_296', '[\"可樂(低熱量)\",\"可樂\",\"Chocolate\",\"chocolate\"]', '飲料類', '自動生成: 可樂(低熱量) ↔ Chocolate', 'Chocolate', '可樂(低熱量)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_299', '[\"台灣南瓜\",\"金瓜\",\"飯瓜\",\"番(翻)瓜\",\"倭(窩)瓜\",\"紅(冬/西洋)南瓜\",\"南瓜\",\"北瓜\",\"玉瓜\",\"筍瓜\",\"Japanese pumpkin\",\"japanese pumpkin\",\"Cucurbita maxima\"]', '蔬菜類', '自動生成: 台灣南瓜 ↔ Japanese pumpkin', 'Japanese pumpkin', '台灣南瓜');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_303', '[\"台灣鯛魚湯(水煮)\",\"台灣鯛魚湯\",\"Alaska blackfish\",\"alaska blackfish\",\"Dallia pectoralis\"]', '魚貝類', '自動生成: 台灣鯛魚湯(水煮) ↔ Alaska blackfish', 'Alaska blackfish', '台灣鯛魚湯(水煮)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_304', '[\"台灣鯛魚片(微波)\",\"台灣鯛魚片\",\"Alaska blackfish\",\"alaska blackfish\",\"Dallia pectoralis\"]', '魚貝類', '自動生成: 台灣鯛魚片(微波) ↔ Alaska blackfish', 'Alaska blackfish', '台灣鯛魚片(微波)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_305', '[\"台灣鯛魚片(水煮)\",\"台灣鯛魚片\",\"Alaska blackfish\",\"alaska blackfish\",\"Dallia pectoralis\"]', '魚貝類', '自動生成: 台灣鯛魚片(水煮) ↔ Alaska blackfish', 'Alaska blackfish', '台灣鯛魚片(水煮)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_306', '[\"台灣鯛魚片(油煎)\",\"台灣鯛魚片\",\"Alaska blackfish\",\"alaska blackfish\",\"Dallia pectoralis\"]', '魚貝類', '自動生成: 台灣鯛魚片(油煎) ↔ Alaska blackfish', 'Alaska blackfish', '台灣鯛魚片(油煎)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_307', '[\"台灣鯛魚片(清蒸)\",\"台灣鯛魚片\",\"Alaska blackfish\",\"alaska blackfish\",\"Dallia pectoralis\"]', '魚貝類', '自動生成: 台灣鯛魚片(清蒸) ↔ Alaska blackfish', 'Alaska blackfish', '台灣鯛魚片(清蒸)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_308', '[\"台灣鯛魚片(烤,190℃,10分鐘)\",\"台灣鯛魚片\",\"Alaska blackfish\",\"alaska blackfish\",\"Dallia pectoralis\"]', '魚貝類', '自動生成: 台灣鯛魚片(烤,190℃,10分鐘) ↔ Alaska blackfish', 'Alaska blackfish', '台灣鯛魚片(烤,190℃,10分鐘)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_309', '[\"台灣鯛魚片(烤,190℃,20分鐘)\",\"台灣鯛魚片\",\"Alaska blackfish\",\"alaska blackfish\",\"Dallia pectoralis\"]', '魚貝類', '自動生成: 台灣鯛魚片(烤,190℃,20分鐘) ↔ Alaska blackfish', 'Alaska blackfish', '台灣鯛魚片(烤,190℃,20分鐘)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_310', '[\"台灣鯛魚片(烤,230℃,10分鐘)\",\"台灣鯛魚片\",\"Alaska blackfish\",\"alaska blackfish\",\"Dallia pectoralis\"]', '魚貝類', '自動生成: 台灣鯛魚片(烤,230℃,10分鐘) ↔ Alaska blackfish', 'Alaska blackfish', '台灣鯛魚片(烤,230℃,10分鐘)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_311', '[\"台灣鯛魚片(烤,230℃,20分鐘)\",\"台灣鯛魚片\",\"Alaska blackfish\",\"alaska blackfish\",\"Dallia pectoralis\"]', '魚貝類', '自動生成: 台灣鯛魚片(烤,230℃,20分鐘) ↔ Alaska blackfish', 'Alaska blackfish', '台灣鯛魚片(烤,230℃,20分鐘)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_312', '[\"台灣鯛魚片(生)\",\"台灣鯛魚片\",\"Alaska blackfish\",\"alaska blackfish\",\"Dallia pectoralis\"]', '魚貝類', '自動生成: 台灣鯛魚片(生) ↔ Alaska blackfish', 'Alaska blackfish', '台灣鯛魚片(生)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_313', '[\"台灣鯛魚片(生)(2021年)\",\"台灣鯛魚片\",\"Alaska blackfish\",\"alaska blackfish\",\"Dallia pectoralis\"]', '魚貝類', '自動生成: 台灣鯛魚片(生)(2021年) ↔ Alaska blackfish', 'Alaska blackfish', '台灣鯛魚片(生)(2021年)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_314', '[\"史氏紅諧魚\",\"紅鰱魚\",\"紅肉欉仔\",\"紅嘴唇仔\",\"紅唇仔\",\"紅魚仔\",\"白肉蒜\",\"紅肉蒜\",\"Alaska blackfish\",\"alaska blackfish\",\"Dallia pectoralis\"]', '魚貝類', '自動生成: 史氏紅諧魚 ↔ Alaska blackfish', 'Alaska blackfish', '史氏紅諧魚');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_315', '[\"向陽二號胡蘿蔔\",\"紅蘿蔔\",\"紅菜頭\",\"黃蘿蔔\",\"丁香蘿蔔\",\"人參\",\"金筍\",\"Carrot\",\"carrot\",\"Daucus carota ssp. sativus\"]', '蔬菜類', '自動生成: 向陽二號胡蘿蔔 ↔ Carrot', 'Carrot', '向陽二號胡蘿蔔');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_322', '[\"咖啡(三合一)\",\"咖啡\",\"咖啡牛奶\",\"Arabica coffee\",\"arabica coffee\",\"Coffea arabica\"]', '飲料類', '自動生成: 咖啡(三合一) ↔ Arabica coffee', 'Arabica coffee', '咖啡(三合一)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_323', '[\"咖啡凍\",\"Arabica coffee\",\"arabica coffee\",\"Coffea arabica\"]', '糕餅點心類', '自動生成: 咖啡凍 ↔ Arabica coffee', 'Arabica coffee', '咖啡凍');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_324', '[\"咖啡沖泡包(三合一)\",\"咖啡沖泡包\",\"Arabica coffee\",\"arabica coffee\",\"Coffea arabica\"]', '飲料類', '自動生成: 咖啡沖泡包(三合一) ↔ Arabica coffee', 'Arabica coffee', '咖啡沖泡包(三合一)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_325', '[\"咖啡沖泡包(二合一)\",\"咖啡沖泡包\",\"Arabica coffee\",\"arabica coffee\",\"Coffea arabica\"]', '飲料類', '自動生成: 咖啡沖泡包(二合一) ↔ Arabica coffee', 'Arabica coffee', '咖啡沖泡包(二合一)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_326', '[\"咖啡豆(曼特寧)\",\"咖啡豆\",\"Arabica coffee\",\"arabica coffee\",\"Coffea arabica\"]', '堅果及種子類', '自動生成: 咖啡豆(曼特寧) ↔ Arabica coffee', 'Arabica coffee', '咖啡豆(曼特寧)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_327', '[\"哈氏彷對蝦\",\"長角仿對蝦\",\"劍蝦\",\"紅(正)劍\",\"硬槍蝦\",\"Shrimp\",\"shrimp\",\"Caridea\"]', '魚貝類', '自動生成: 哈氏彷對蝦 ↔ Shrimp', 'Shrimp', '哈氏彷對蝦');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_328', '[\"啤酒\",\"Beer\",\"beer\"]', '加工調理食品及其他類', '自動生成: 啤酒 ↔ Beer', 'Beer', '啤酒');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_337', '[\"四季芒果\",\"檬果\",\"檨仔\",\"菴羅果(四季檨)\",\"Mango\",\"mango\",\"Mangifera indica\"]', '水果類', '自動生成: 四季芒果 ↔ Mango', 'Mango', '四季芒果');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_342', '[\"圓茄子\",\"日本茄子\",\"迷你茄\",\"Eggplant\",\"eggplant\",\"Solanum melongena\"]', '蔬菜類', '自動生成: 圓茄子 ↔ Eggplant', 'Eggplant', '圓茄子');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_343', '[\"圓鱈魚卵(加工)\",\"圓鱈魚卵\",\"Atlantic cod\",\"atlantic cod\",\"Gadus morhua\"]', '加工調理食品及其他類', '自動生成: 圓鱈魚卵(加工) ↔ Atlantic cod', 'Atlantic cod', '圓鱈魚卵(加工)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_344', '[\"圓鱈魚鰓肉\",\"Atlantic cod\",\"atlantic cod\",\"Gadus morhua\"]', '魚貝類', '自動生成: 圓鱈魚鰓肉 ↔ Atlantic cod', 'Atlantic cod', '圓鱈魚鰓肉');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_348', '[\"土芒果\",\"檬果\",\"檨仔\",\"菴羅果(柴檨\",\"土檨仔)\",\"Mango\",\"mango\",\"Mangifera indica\"]', '水果類', '自動生成: 土芒果 ↔ Mango', 'Mango', '土芒果');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_351', '[\"土雞皮蛋\",\"Egg roll\",\"egg roll\"]', '蛋類', '自動生成: 土雞皮蛋 ↔ Egg roll', 'Egg roll', '土雞皮蛋');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_352', '[\"土雞蛋\",\"Egg roll\",\"egg roll\"]', '蛋類', '自動生成: 土雞蛋 ↔ Egg roll', 'Egg roll', '土雞蛋');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_353', '[\"土雞蛋(2022年取樣)\",\"土雞蛋\",\"Egg roll\",\"egg roll\"]', '蛋類', '自動生成: 土雞蛋(2022年取樣) ↔ Egg roll', 'Egg roll', '土雞蛋(2022年取樣)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_354', '[\"埔里米粉\",\"Annual wild rice\",\"annual wild rice\",\"Zizania aquatica\"]', '加工調理食品及其他類', '自動生成: 埔里米粉 ↔ Annual wild rice', 'Annual wild rice', '埔里米粉');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_359', '[\"壽司醋\",\"Vinegar\",\"vinegar\"]', '調味料及香辛料類', '自動生成: 壽司醋 ↔ Vinegar', 'Vinegar', '壽司醋');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_360', '[\"多多綠茶(全糖)\",\"多多綠茶\",\"Black tea\",\"black tea\"]', '飲料類', '自動生成: 多多綠茶(全糖) ↔ Black tea', 'Black tea', '多多綠茶(全糖)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_367', '[\"大文蛤\",\"文蛤\",\"普通文蛤\",\"Bivalvia (Clam, Mussel, Oyster)\",\"bivalvia (clam, mussel, oyster)\",\"Bivalvia\"]', '魚貝類', '自動生成: 大文蛤 ↔ Bivalvia (Clam, Mussel, Oyster)', 'Bivalvia (Clam, Mussel, Oyster)', '大文蛤');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_369', '[\"大番茄平均值(紅色系)\",\"大番茄平均值\",\"柑仔蜜\",\"甘仔(阿)蜜\",\"草柿\",\"臭柿仔\",\"西紅柿\",\"小金瓜\",\"番柿\",\"六月柿\",\"洋柿(茄)子\",\"紅茄\",\"毛臘果\",\"Cherry tomato\",\"cherry tomato\",\"Solanum lycopersicum var. cerasiforme\"]', '蔬菜類', '自動生成: 大番茄平均值(紅色系) ↔ Cherry tomato', 'Cherry tomato', '大番茄平均值(紅色系)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_370', '[\"大番茄平均值(綠色系)\",\"大番茄平均值\",\"柑仔蜜\",\"甘仔(阿)蜜\",\"草柿\",\"臭柿仔\",\"西紅柿\",\"小金瓜\",\"番柿\",\"六月柿\",\"洋柿(茄)子\",\"紅茄\",\"毛臘果\",\"Cherry tomato\",\"cherry tomato\",\"Solanum lycopersicum var. cerasiforme\"]', '蔬菜類', '自動生成: 大番茄平均值(綠色系) ↔ Cherry tomato', 'Cherry tomato', '大番茄平均值(綠色系)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_372', '[\"大眼金梭魚\",\"針梭\",\"竹梭\",\"巴拉庫答\",\"Alaska blackfish\",\"alaska blackfish\",\"Dallia pectoralis\"]', '魚貝類', '自動生成: 大眼金梭魚 ↔ Alaska blackfish', 'Alaska blackfish', '大眼金梭魚');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_373', '[\"大管鞭蝦\",\"憂鬱管鞭蝦\",\"大頭紅蝦\",\"大頭蝦\",\"紅中蝦\",\"蔥頭蝦\",\"Shrimp\",\"shrimp\",\"Caridea\"]', '魚貝類', '自動生成: 大管鞭蝦 ↔ Shrimp', 'Shrimp', '大管鞭蝦');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_375', '[\"大蒜\",\"蒜頭\",\"大蒜頭\",\"蒜球\",\"蒜瓣\",\"蒜仔頭\",\"Garlic\",\"garlic\",\"Allium sativum\"]', '蔬菜類', '自動生成: 大蒜 ↔ Garlic', 'Garlic', '大蒜');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_376', '[\"大西洋鮭魚(台灣養殖)\",\"大西洋鮭魚\",\"Atlantic salmon\",\"atlantic salmon\",\"Salmo salar\"]', '魚貝類', '自動生成: 大西洋鮭魚(台灣養殖) ↔ Atlantic salmon', 'Atlantic salmon', '大西洋鮭魚(台灣養殖)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_377', '[\"大西洋鮭魚切片(中段)\",\"大西洋鮭魚切片\",\"Atlantic salmon\",\"atlantic salmon\",\"Salmo salar\"]', '魚貝類', '自動生成: 大西洋鮭魚切片(中段) ↔ Atlantic salmon', 'Atlantic salmon', '大西洋鮭魚切片(中段)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_378', '[\"大西洋鮭魚切片(尾段)\",\"大西洋鮭魚切片\",\"Atlantic salmon\",\"atlantic salmon\",\"Salmo salar\"]', '魚貝類', '自動生成: 大西洋鮭魚切片(尾段) ↔ Atlantic salmon', 'Atlantic salmon', '大西洋鮭魚切片(尾段)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_379', '[\"大西洋鮭魚平均值(去皮)\",\"大西洋鮭魚平均值\",\"Atlantic salmon\",\"atlantic salmon\",\"Salmo salar\"]', '魚貝類', '自動生成: 大西洋鮭魚平均值(去皮) ↔ Atlantic salmon', 'Atlantic salmon', '大西洋鮭魚平均值(去皮)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_380', '[\"大西洋鮭魚生魚片\",\"Atlantic salmon\",\"atlantic salmon\",\"Salmo salar\"]', '魚貝類', '自動生成: 大西洋鮭魚生魚片 ↔ Atlantic salmon', 'Atlantic salmon', '大西洋鮭魚生魚片');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_381', '[\"大西洋鮭魚腹肉\",\"Atlantic salmon\",\"atlantic salmon\",\"Salmo salar\"]', '魚貝類', '自動生成: 大西洋鮭魚腹肉 ↔ Atlantic salmon', 'Atlantic salmon', '大西洋鮭魚腹肉');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_386', '[\"大頭蝦仁\",\"Shrimp\",\"shrimp\",\"Caridea\"]', '魚貝類', '自動生成: 大頭蝦仁 ↔ Shrimp', 'Shrimp', '大頭蝦仁');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_391', '[\"大黃魚\",\"黃魚\",\"黃瓜\",\"黃花魚\",\"黃口\",\"火口\",\"大黃花\",\"Alaska blackfish\",\"alaska blackfish\",\"Dallia pectoralis\"]', '魚貝類', '自動生成: 大黃魚 ↔ Alaska blackfish', 'Alaska blackfish', '大黃魚');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_394', '[\"天貝(黃豆)\",\"天貝\",\"Soybean oil\",\"soybean oil\"]', '豆類', '自動生成: 天貝(黃豆) ↔ Soybean oil', 'Soybean oil', '天貝(黃豆)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_396', '[\"太妃糖\",\"Sugar\",\"sugar\"]', '糕餅點心類', '自動生成: 太妃糖 ↔ Sugar', 'Sugar', '太妃糖');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_401', '[\"夾心餅乾(草莓)\",\"夾心餅乾\",\"Strawberry\",\"strawberry\",\"Fragaria X ananassa\"]', '糕餅點心類', '自動生成: 夾心餅乾(草莓) ↔ Strawberry', 'Strawberry', '夾心餅乾(草莓)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_403', '[\"奇異果\",\"彌猴桃\",\"猴桃\",\"猴梨\",\"藤梨\",\"毛桃\",\"羊桃\",\"紅藤梨\",\"金桃\",\"楊桃\",\"Kiwi\",\"kiwi\",\"Actinidia chinensis\"]', '水果類', '自動生成: 奇異果 ↔ Kiwi', 'Kiwi', '奇異果');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_404', '[\"奶油(固態,不加鹽)\",\"奶油\",\"動物性奶油(CNS命名\\\"乳酪\\\")\",\"American butterfish\",\"american butterfish\",\"Peprilus triacanthus\"]', '油脂類', '自動生成: 奶油(固態,不加鹽) ↔ American butterfish', 'American butterfish', '奶油(固態,不加鹽)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_405', '[\"奶油(固態,加鹽)\",\"奶油\",\"動物性奶油(CNS命名\\\"乳酪\\\")\",\"American butterfish\",\"american butterfish\",\"Peprilus triacanthus\"]', '油脂類', '自動生成: 奶油(固態,加鹽) ↔ American butterfish', 'American butterfish', '奶油(固態,加鹽)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_406', '[\"奶油(液態)\",\"奶油\",\"動物性奶油\",\"鮮奶油(CNS命名\\\"乳油\\\")\",\"American butterfish\",\"american butterfish\",\"Peprilus triacanthus\"]', '油脂類', '自動生成: 奶油(液態) ↔ American butterfish', 'American butterfish', '奶油(液態)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_407', '[\"奶油萵苣(日本種)\",\"奶油萵苣\",\"葉萵苣\",\"葉萵\",\"萵仔菜\",\"刈葉萵苣\",\"生菜\",\"妹(媚)仔菜\",\"鵝仔菜(草)\",\"春不老\",\"印度萵苣\",\"American butterfish\",\"american butterfish\",\"Peprilus triacanthus\"]', '蔬菜類', '自動生成: 奶油萵苣(日本種) ↔ American butterfish', 'American butterfish', '奶油萵苣(日本種)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_411', '[\"奶茶(三合一)\",\"奶茶\",\"Black tea\",\"black tea\"]', '飲料類', '自動生成: 奶茶(三合一) ↔ Black tea', 'Black tea', '奶茶(三合一)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_412', '[\"奶茶沖泡包(三合一)\",\"奶茶沖泡包\",\"Black tea\",\"black tea\"]', '飲料類', '自動生成: 奶茶沖泡包(三合一) ↔ Black tea', 'Black tea', '奶茶沖泡包(三合一)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_413', '[\"奶酥麵包\",\"Breadfruit\",\"breadfruit\",\"Artocarpus altilis\"]', '糕餅點心類', '自動生成: 奶酥麵包 ↔ Breadfruit', 'Breadfruit', '奶酥麵包');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_415', '[\"姬魚\",\"仙女魚\",\"狗母\",\"汕狗母\",\"Alaska blackfish\",\"alaska blackfish\",\"Dallia pectoralis\"]', '魚貝類', '自動生成: 姬魚 ↔ Alaska blackfish', 'Alaska blackfish', '姬魚');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_417', '[\"嫩薑\",\"薑仔\",\"生薑\",\"生姜\",\"羌\",\"蘘荷\",\"茗荷\",\"甘露子\",\"紫薑\",\"Ginger\",\"ginger\",\"Zingiber officinale\"]', '蔬菜類', '自動生成: 嫩薑 ↔ Ginger', 'Ginger', '嫩薑');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_418', '[\"嫩豆腐\",\"Tofu\",\"tofu\"]', '加工調理食品及其他類', '自動生成: 嫩豆腐 ↔ Tofu', 'Tofu', '嫩豆腐');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_420', '[\"孟宗竹筍\",\"毛竹\",\"茅竹\",\"茅茹竹\",\"江南竹\",\"貓竹\",\"貓兒竹\",\"楠竹\",\"南竹\",\"至竹\",\"斑竹(冬筍)\",\"Bamboo shoots\",\"bamboo shoots\",\"Phyllostachys edulis\"]', '蔬菜類', '自動生成: 孟宗竹筍 ↔ Bamboo shoots', 'Bamboo shoots', '孟宗竹筍');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_423', '[\"密點少棘胡椒鯛\",\"雞仔魚\",\"加志\",\"少棘石鱸\",\"圭誌/烏嘉誌(澎湖)\",\"Cubanelle pepper\",\"cubanelle pepper\"]', '魚貝類', '自動生成: 密點少棘胡椒鯛 ↔ Cubanelle pepper', 'Cubanelle pepper', '密點少棘胡椒鯛');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_424', '[\"富士蘋果\",\"柰\",\"林檎\",\"Apple\",\"apple\",\"Malus pumila\"]', '水果類', '自動生成: 富士蘋果 ↔ Apple', 'Apple', '富士蘋果');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_425', '[\"富士蘋果(帶皮)\",\"富士蘋果\",\"柰\",\"林檎\",\"Apple\",\"apple\",\"Malus pumila\"]', '水果類', '自動生成: 富士蘋果(帶皮) ↔ Apple', 'Apple', '富士蘋果(帶皮)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_431', '[\"小三角油豆腐\",\"Tofu\",\"tofu\"]', '加工調理食品及其他類', '自動生成: 小三角油豆腐 ↔ Tofu', 'Tofu', '小三角油豆腐');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_433', '[\"小巧香腸\",\"小香腸\",\"Sausage\",\"sausage\"]', '加工調理食品及其他類', '自動生成: 小巧香腸 ↔ Sausage', 'Sausage', '小巧香腸');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_435', '[\"小玉西瓜\",\"水瓜\",\"寒瓜\",\"夏瓜\",\"Watermelon\",\"watermelon\",\"Citrullus lanatus\"]', '水果類', '自動生成: 小玉西瓜 ↔ Watermelon', 'Watermelon', '小玉西瓜');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_437', '[\"小番茄平均值(橙色系)\",\"小番茄平均值\",\"柑(甘)仔蜜\",\"草(番\",\"西紅\",\"六月)柿\",\"臭柿仔\",\"小金瓜\",\"洋柿(茄)子\",\"紅茄\",\"毛臘果\",\"Cherry tomato\",\"cherry tomato\",\"Solanum lycopersicum var. cerasiforme\"]', '蔬菜類', '自動生成: 小番茄平均值(橙色系) ↔ Cherry tomato', 'Cherry tomato', '小番茄平均值(橙色系)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_438', '[\"小番茄平均值(紅色系)\",\"小番茄平均值\",\"柑仔蜜\",\"甘仔(阿)蜜\",\"草柿\",\"臭柿仔\",\"西紅柿\",\"小金瓜\",\"番柿\",\"六月柿\",\"洋柿(茄)子\",\"紅茄\",\"毛臘果\",\"Cherry tomato\",\"cherry tomato\",\"Solanum lycopersicum var. cerasiforme\"]', '蔬菜類', '自動生成: 小番茄平均值(紅色系) ↔ Cherry tomato', 'Cherry tomato', '小番茄平均值(紅色系)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_453', '[\"小米\",\"Annual wild rice\",\"annual wild rice\",\"Zizania aquatica\"]', '穀物類', '自動生成: 小米 ↔ Annual wild rice', 'Annual wild rice', '小米');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_457', '[\"小馬鈴薯(珍珠馬鈴薯)\",\"小馬鈴薯\",\"洋芋\",\"洋薯\",\"洋山芋\",\"荷蘭薯\",\"日本番薯\",\"塊茄\",\"Baked potato\",\"baked potato\"]', '澱粉類', '自動生成: 小馬鈴薯(珍珠馬鈴薯) ↔ Baked potato', 'Baked potato', '小馬鈴薯(珍珠馬鈴薯)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_458', '[\"小魚干\",\"Alaska blackfish\",\"alaska blackfish\",\"Dallia pectoralis\"]', '魚貝類', '自動生成: 小魚干 ↔ Alaska blackfish', 'Alaska blackfish', '小魚干');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_463', '[\"小黃魚(去皮)\",\"小黃魚\",\"黃魚\",\"小黃瓜\",\"厚鱗仔\",\"黃口\",\"黃順\",\"黃瓜\",\"紅瓜\",\"Alaska blackfish\",\"alaska blackfish\",\"Dallia pectoralis\"]', '魚貝類', '自動生成: 小黃魚(去皮) ↔ Alaska blackfish', 'Alaska blackfish', '小黃魚(去皮)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_464', '[\"小黃魚(含皮)\",\"小黃魚\",\"黃魚\",\"小黃瓜\",\"厚鱗仔\",\"黃口\",\"黃順\",\"黃瓜\",\"紅瓜\",\"Alaska blackfish\",\"alaska blackfish\",\"Dallia pectoralis\"]', '魚貝類', '自動生成: 小黃魚(含皮) ↔ Alaska blackfish', 'Alaska blackfish', '小黃魚(含皮)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_476', '[\"山羊帶皮羊肉塊\",\"Lambsquarters\",\"lambsquarters\",\"Chenopodium album\"]', '肉類', '自動生成: 山羊帶皮羊肉塊 ↔ Lambsquarters', 'Lambsquarters', '山羊帶皮羊肉塊');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_478', '[\"山芹菜\",\"鴨兒芹\",\"三葉芹\",\"三葉山芹菜\",\"Celery leaves\",\"celery leaves\",\"Apium graveolens var. secalinum\"]', '蔬菜類', '自動生成: 山芹菜 ↔ Celery leaves', 'Celery leaves', '山芹菜');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_498', '[\"岩鹽\",\"Salt\",\"salt\"]', '調味料及香辛料類', '自動生成: 岩鹽 ↔ Salt', 'Salt', '岩鹽');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_500', '[\"巧克力夾心糖\",\"Sugar\",\"sugar\"]', '糕餅點心類', '自動生成: 巧克力夾心糖 ↔ Sugar', 'Sugar', '巧克力夾心糖');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_501', '[\"巧克力牛奶軟糖\",\"Almond milk\",\"almond milk\"]', '糕餅點心類', '自動生成: 巧克力牛奶軟糖 ↔ Almond milk', 'Almond milk', '巧克力牛奶軟糖');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_503', '[\"巨峰葡萄\",\"蒲桃\",\"蒲萄\",\"草龍珠\",\"蒲陶\",\"葡桃\",\"Common grape\",\"common grape\",\"Vitis vinifera\"]', '水果類', '自動生成: 巨峰葡萄 ↔ Common grape', 'Common grape', '巨峰葡萄');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_508', '[\"帶殼熟綠竹筍\",\"甜竹\",\"甜竹筍\",\"綠仔筍\",\"綠仔笋\",\"綠竹笋\",\"Bamboo shoots\",\"bamboo shoots\",\"Phyllostachys edulis\"]', '蔬菜類', '自動生成: 帶殼熟綠竹筍 ↔ Bamboo shoots', 'Bamboo shoots', '帶殼熟綠竹筍');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_509', '[\"帶殼真牡蠣(生蠔)\",\"帶殼真牡蠣\",\"正(大/長/鑄大)牡蠣\",\"正(青)蚵\",\"蚵仔\",\"蚵\",\"蠔\",\"Bivalvia (Clam, Mussel, Oyster)\",\"bivalvia (clam, mussel, oyster)\",\"Bivalvia\"]', '魚貝類', '自動生成: 帶殼真牡蠣(生蠔) ↔ Bivalvia (Clam, Mussel, Oyster)', 'Bivalvia (Clam, Mussel, Oyster)', '帶殼真牡蠣(生蠔)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_510', '[\"帶殼花生(生)\",\"帶殼花生\",\"土豆\",\"長生果\",\"落花生\",\"Peanut\",\"peanut\",\"Arachis hypogaea\"]', '堅果及種子類', '自動生成: 帶殼花生(生) ↔ Peanut', 'Peanut', '帶殼花生(生)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_511', '[\"帶殼龍眼乾\",\"桂圓乾\",\"龍目乾\",\"圓眼乾\",\"Longan\",\"longan\",\"Dimocarpus longan\"]', '水果類', '自動生成: 帶殼龍眼乾 ↔ Longan', 'Longan', '帶殼龍眼乾');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_512', '[\"帶膜花生仁(生)(1995年之前取樣)\",\"帶膜花生仁\",\"土豆\",\"長生果\",\"落花生\",\"Peanut\",\"peanut\",\"Arachis hypogaea\"]', '堅果及種子類', '自動生成: 帶膜花生仁(生)(1995年之前取樣) ↔ Peanut', 'Peanut', '帶膜花生仁(生)(1995年之前取樣)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_513', '[\"帶膜花生仁(生)(2004年取樣)\",\"帶膜花生仁\",\"土豆\",\"長生果\",\"落花生\",\"Peanut\",\"peanut\",\"Arachis hypogaea\"]', '堅果及種子類', '自動生成: 帶膜花生仁(生)(2004年取樣) ↔ Peanut', 'Peanut', '帶膜花生仁(生)(2004年取樣)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_529', '[\"德國香腸\",\"Sausage\",\"sausage\"]', '加工調理食品及其他類', '自動生成: 德國香腸 ↔ Sausage', 'Sausage', '德國香腸');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_530', '[\"意大利葡萄\",\"蒲桃\",\"蒲萄\",\"草龍珠\",\"蒲陶\",\"葡桃\",\"Common grape\",\"common grape\",\"Vitis vinifera\"]', '水果類', '自動生成: 意大利葡萄 ↔ Common grape', 'Common grape', '意大利葡萄');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_532', '[\"愛文芒果\",\"檬果\",\"檨仔\",\"菴羅果(蘋果芒果)\",\"Mango\",\"mango\",\"Mangifera indica\"]', '水果類', '自動生成: 愛文芒果 ↔ Mango', 'Mango', '愛文芒果');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_534', '[\"扁魚干\",\"Alaska blackfish\",\"alaska blackfish\",\"Dallia pectoralis\"]', '魚貝類', '自動生成: 扁魚干 ↔ Alaska blackfish', 'Alaska blackfish', '扁魚干');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_537', '[\"抹茶粉\",\"綠茶粉\",\"Black tea\",\"black tea\"]', '飲料類', '自動生成: 抹茶粉 ↔ Black tea', 'Black tea', '抹茶粉');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_539', '[\"拿鐵咖啡(無糖)\",\"拿鐵咖啡\",\"咖啡牛奶\",\"Arabica coffee\",\"arabica coffee\",\"Coffea arabica\"]', '飲料類', '自動生成: 拿鐵咖啡(無糖) ↔ Arabica coffee', 'Arabica coffee', '拿鐵咖啡(無糖)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_542', '[\"提拉米蘇(圓形)\",\"提拉米蘇\",\"Annual wild rice\",\"annual wild rice\",\"Zizania aquatica\"]', '糕餅點心類', '自動生成: 提拉米蘇(圓形) ↔ Annual wild rice', 'Annual wild rice', '提拉米蘇(圓形)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_547', '[\"文蛤\",\"粉蟯\",\"蚶仔\",\"麗文蛤\",\"普通文蛤\",\"Bivalvia (Clam, Mussel, Oyster)\",\"bivalvia (clam, mussel, oyster)\",\"Bivalvia\"]', '魚貝類', '自動生成: 文蛤 ↔ Bivalvia (Clam, Mussel, Oyster)', 'Bivalvia (Clam, Mussel, Oyster)', '文蛤');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_548', '[\"斑帶石斑魚\",\"石斑\",\"過魚\",\"罔仔\",\"竹節鱠\",\"擬青石斑魚\",\"Alaska blackfish\",\"alaska blackfish\",\"Dallia pectoralis\"]', '魚貝類', '自動生成: 斑帶石斑魚 ↔ Alaska blackfish', 'Alaska blackfish', '斑帶石斑魚');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_550', '[\"斑鰭飛魚\",\"小烏\",\"飛烏\",\"花烏(澎湖)\",\"Alaska blackfish\",\"alaska blackfish\",\"Dallia pectoralis\"]', '魚貝類', '自動生成: 斑鰭飛魚 ↔ Alaska blackfish', 'Alaska blackfish', '斑鰭飛魚');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_561', '[\"方糖\",\"Sugar\",\"sugar\"]', '糖類', '自動生成: 方糖 ↔ Sugar', 'Sugar', '方糖');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_562', '[\"旗魚切片\",\"翹翅仔\",\"白肉旗魚\",\"闊胸仔\",\"立翅旗魚\",\"白皮丁挽\",\"白皮旗魚\",\"Alaska blackfish\",\"alaska blackfish\",\"Dallia pectoralis\"]', '魚貝類', '自動生成: 旗魚切片 ↔ Alaska blackfish', 'Alaska blackfish', '旗魚切片');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_563', '[\"旗魚肚\",\"Alaska blackfish\",\"alaska blackfish\",\"Dallia pectoralis\"]', '魚貝類', '自動生成: 旗魚肚 ↔ Alaska blackfish', 'Alaska blackfish', '旗魚肚');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_564', '[\"旗魚腹肉\",\"翹翅仔\",\"白肉旗魚\",\"闊胸仔\",\"立翅旗魚\",\"白皮丁挽\",\"白皮旗魚\",\"Alaska blackfish\",\"alaska blackfish\",\"Dallia pectoralis\"]', '魚貝類', '自動生成: 旗魚腹肉 ↔ Alaska blackfish', 'Alaska blackfish', '旗魚腹肉');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_565', '[\"旗魚鬆\",\"Alaska blackfish\",\"alaska blackfish\",\"Dallia pectoralis\"]', '加工調理食品及其他類', '自動生成: 旗魚鬆 ↔ Alaska blackfish', 'Alaska blackfish', '旗魚鬆');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_568', '[\"日本南瓜\",\"金瓜\",\"飯瓜\",\"番(翻)瓜\",\"倭(窩)瓜\",\"紅(冬/西洋)南瓜\",\"南瓜\",\"北瓜\",\"玉瓜\",\"筍瓜\",\"Japanese pumpkin\",\"japanese pumpkin\",\"Cucurbita maxima\"]', '蔬菜類', '自動生成: 日本南瓜 ↔ Japanese pumpkin', 'Japanese pumpkin', '日本南瓜');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_569', '[\"日本對蝦(大)\",\"日本對蝦\",\"斑節蝦\",\"雷公蝦\",\"明蝦\",\"九節蝦\",\"Shrimp\",\"shrimp\",\"Caridea\"]', '魚貝類', '自動生成: 日本對蝦(大) ↔ Shrimp', 'Shrimp', '日本對蝦(大)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_570', '[\"日本對蝦(小)\",\"日本對蝦\",\"斑節蝦\",\"雷公蝦\",\"明蝦\",\"九節蝦\",\"Shrimp\",\"shrimp\",\"Caridea\"]', '魚貝類', '自動生成: 日本對蝦(小) ↔ Shrimp', 'Shrimp', '日本對蝦(小)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_571', '[\"日本對蝦平均值\",\"斑節蝦\",\"雷公蝦\",\"明蝦\",\"九節蝦\",\"Shrimp\",\"shrimp\",\"Caridea\"]', '魚貝類', '自動生成: 日本對蝦平均值 ↔ Shrimp', 'Shrimp', '日本對蝦平均值');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_573', '[\"日本玻璃蝦\",\"水晶蝦\",\"白丁\",\"Shrimp\",\"shrimp\",\"Caridea\"]', '魚貝類', '自動生成: 日本玻璃蝦 ↔ Shrimp', 'Shrimp', '日本玻璃蝦');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_575', '[\"日本竹筴魚\",\"巴攏\",\"竹莢魚\",\"瓜仔魚\",\"真鰺\",\"巴蘭\",\"瓜魚\",\"巴弄/硬尾(澎湖)\",\"黑尾\",\"Alaska blackfish\",\"alaska blackfish\",\"Dallia pectoralis\"]', '魚貝類', '自動生成: 日本竹筴魚 ↔ Alaska blackfish', 'Alaska blackfish', '日本竹筴魚');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_586', '[\"日本銀帶鯡魚干(丁香魚脯)\",\"日本銀帶鯡魚干\",\"針嘴鰮\",\"丁香魚\",\"魩仔\",\"丁香\",\"鱙仔\",\"灰海荷鰮\",\"Alaska blackfish\",\"alaska blackfish\",\"Dallia pectoralis\"]', '魚貝類', '自動生成: 日本銀帶鯡魚干(丁香魚脯) ↔ Alaska blackfish', 'Alaska blackfish', '日本銀帶鯡魚干(丁香魚脯)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_587', '[\"日本馬頭魚\",\"馬頭\",\"方頭魚\",\"吧唄\",\"紅尾\",\"吧口弄\",\"紅馬頭\",\"紅甘鯛\",\"Alaska blackfish\",\"alaska blackfish\",\"Dallia pectoralis\"]', '魚貝類', '自動生成: 日本馬頭魚 ↔ Alaska blackfish', 'Alaska blackfish', '日本馬頭魚');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_588', '[\"日本鰻鱺魚片(生)\",\"日本鰻鱺魚片\",\"白鰻\",\"日本鰻\",\"正鰻\",\"白鱔\",\"鰻鱺\",\"土鰻(澎湖)\",\"淡水鰻(澎湖)\",\"Alaska blackfish\",\"alaska blackfish\",\"Dallia pectoralis\"]', '魚貝類', '自動生成: 日本鰻鱺魚片(生) ↔ Alaska blackfish', 'Alaska blackfish', '日本鰻鱺魚片(生)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_589', '[\"日本鰻鱺魚片(蒲燒)\",\"日本鰻鱺魚片\",\"白鰻\",\"日本鰻\",\"正鰻\",\"白鱔\",\"鰻鱺\",\"土鰻(澎湖)\",\"淡水鰻(澎湖)\",\"Alaska blackfish\",\"alaska blackfish\",\"Dallia pectoralis\"]', '加工調理食品及其他類', '自動生成: 日本鰻鱺魚片(蒲燒) ↔ Alaska blackfish', 'Alaska blackfish', '日本鰻鱺魚片(蒲燒)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_590', '[\"日本龍蝦\",\"龍蝦;台灣龍蝦;紅腳蝦;紅殼仔;正龍蝦;紅龍蝦\",\"Shrimp\",\"shrimp\",\"Caridea\"]', '魚貝類', '自動生成: 日本龍蝦 ↔ Shrimp', 'Shrimp', '日本龍蝦');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_592', '[\"明蝦仁\",\"Shrimp\",\"shrimp\",\"Caridea\"]', '魚貝類', '自動生成: 明蝦仁 ↔ Shrimp', 'Shrimp', '明蝦仁');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_594', '[\"星雞魚\",\"雞仔魚\",\"石鱸\",\"厚鱸\",\"頭額/金龍/刣額(澎湖)\",\"Alaska blackfish\",\"alaska blackfish\",\"Dallia pectoralis\"]', '魚貝類', '自動生成: 星雞魚 ↔ Alaska blackfish', 'Alaska blackfish', '星雞魚');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_601', '[\"木瓜(11月取樣)\",\"木瓜\",\"番木瓜\",\"番瓜\",\"Papaya\",\"papaya\",\"Carica papaya\"]', '水果類', '自動生成: 木瓜(11月取樣) ↔ Papaya', 'Papaya', '木瓜(11月取樣)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_602', '[\"木瓜(2月取樣)\",\"木瓜\",\"番木瓜\",\"番瓜\",\"Papaya\",\"papaya\",\"Carica papaya\"]', '水果類', '自動生成: 木瓜(2月取樣) ↔ Papaya', 'Papaya', '木瓜(2月取樣)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_603', '[\"木瓜(5月取樣)\",\"木瓜\",\"番木瓜\",\"番瓜\",\"Papaya\",\"papaya\",\"Carica papaya\"]', '水果類', '自動生成: 木瓜(5月取樣) ↔ Papaya', 'Papaya', '木瓜(5月取樣)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_604', '[\"木瓜(8月取樣)\",\"木瓜\",\"番木瓜\",\"番瓜\",\"Papaya\",\"papaya\",\"Carica papaya\"]', '水果類', '自動生成: 木瓜(8月取樣) ↔ Papaya', 'Papaya', '木瓜(8月取樣)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_605', '[\"木瓜平均值\",\"番木瓜\",\"番瓜\",\"Papaya\",\"papaya\",\"Carica papaya\"]', '水果類', '自動生成: 木瓜平均值 ↔ Papaya', 'Papaya', '木瓜平均值');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_606', '[\"木瓜牛奶\",\"Papaya\",\"papaya\",\"Carica papaya\"]', '乳品類', '自動生成: 木瓜牛奶 ↔ Papaya', 'Papaya', '木瓜牛奶');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_627', '[\"杏仁茶沖泡包\",\"綜合堅果穀粉\",\"Almond\",\"almond\",\"Prunus dulcis\"]', '加工調理食品及其他類', '自動生成: 杏仁茶沖泡包 ↔ Almond', 'Almond', '杏仁茶沖泡包');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_628', '[\"杏仁霜\",\"杏仁粉\",\"杏仁茶\",\"Almond\",\"almond\",\"Prunus dulcis\"]', '加工調理食品及其他類', '自動生成: 杏仁霜 ↔ Almond', 'Almond', '杏仁霜');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_636', '[\"東方異腕蝦\",\"米諾蝦\",\"鐵甲蝦\",\"蝦母\",\"大頭蝦\",\"Shrimp\",\"shrimp\",\"Caridea\"]', '魚貝類', '自動生成: 東方異腕蝦 ↔ Shrimp', 'Shrimp', '東方異腕蝦');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_637', '[\"松子仁(生)\",\"松子仁\",\"Pine nut\",\"pine nut\",\"Pinus\"]', '堅果及種子類', '自動生成: 松子仁(生) ↔ Pine nut', 'Pine nut', '松子仁(生)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_643', '[\"枇杷糖\",\"Sugar\",\"sugar\"]', '糕餅點心類', '自動生成: 枇杷糖 ↔ Sugar', 'Sugar', '枇杷糖');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_645', '[\"果寡糖\",\"Sugar\",\"sugar\"]', '糖類', '自動生成: 果寡糖 ↔ Sugar', 'Sugar', '果寡糖');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_646', '[\"果汁醋飲料(綜合)\",\"果汁醋飲料\",\"Fruit juice\",\"fruit juice\"]', '飲料類', '自動生成: 果汁醋飲料(綜合) ↔ Fruit juice', 'Fruit juice', '果汁醋飲料(綜合)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_647', '[\"果糖\",\"高果糖糖漿\",\"Sugar\",\"sugar\"]', '糖類', '自動生成: 果糖 ↔ Sugar', 'Sugar', '果糖');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_651', '[\"柳橙\",\"甜橙\",\"柳丁\",\"印子柑\",\"廣柑\",\"Mandarin orange (Clementine, Tangerine)\",\"mandarin orange (clementine, tangerine)\",\"Citrus reticulata\"]', '水果類', '自動生成: 柳橙 ↔ Mandarin orange (Clementine, Tangerine)', 'Mandarin orange (Clementine, Tangerine)', '柳橙');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_652', '[\"柳橙汁(100%)\",\"柳橙汁\",\"Mandarin orange (Clementine, Tangerine)\",\"mandarin orange (clementine, tangerine)\",\"Citrus reticulata\"]', '飲料類', '自動生成: 柳橙汁(100%) ↔ Mandarin orange (Clementine, Tangerine)', 'Mandarin orange (Clementine, Tangerine)', '柳橙汁(100%)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_653', '[\"柳橙汁(非原汁)\",\"柳橙汁\",\"Mandarin orange (Clementine, Tangerine)\",\"mandarin orange (clementine, tangerine)\",\"Citrus reticulata\"]', '飲料類', '自動生成: 柳橙汁(非原汁) ↔ Mandarin orange (Clementine, Tangerine)', 'Mandarin orange (Clementine, Tangerine)', '柳橙汁(非原汁)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_654', '[\"柴魚片\",\"Alaska blackfish\",\"alaska blackfish\",\"Dallia pectoralis\"]', '魚貝類', '自動生成: 柴魚片 ↔ Alaska blackfish', 'Alaska blackfish', '柴魚片');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_656', '[\"栗子(生)\",\"栗子\",\"Chestnut\",\"chestnut\",\"Castanea\"]', '堅果及種子類', '自動生成: 栗子(生) ↔ Chestnut', 'Chestnut', '栗子(生)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_657', '[\"栗子仁(生)\",\"栗子仁\",\"Chestnut\",\"chestnut\",\"Castanea\"]', '堅果及種子類', '自動生成: 栗子仁(生) ↔ Chestnut', 'Chestnut', '栗子仁(生)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_658', '[\"栗子南瓜\",\"金瓜\",\"飯瓜\",\"番(翻)瓜\",\"倭(窩)瓜\",\"紅(冬/西洋)南瓜\",\"南瓜\",\"北瓜\",\"玉瓜\",\"筍瓜\",\"Japanese pumpkin\",\"japanese pumpkin\",\"Cucurbita maxima\"]', '蔬菜類', '自動生成: 栗子南瓜 ↔ Japanese pumpkin', 'Japanese pumpkin', '栗子南瓜');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_659', '[\"核桃油\",\"Black walnut\",\"black walnut\",\"Juglans nigra\"]', '油脂類', '自動生成: 核桃油 ↔ Black walnut', 'Black walnut', '核桃油');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_663', '[\"桂竹筍片\",\"Bamboo shoots\",\"bamboo shoots\",\"Phyllostachys edulis\"]', '加工調理食品及其他類', '自動生成: 桂竹筍片 ↔ Bamboo shoots', 'Bamboo shoots', '桂竹筍片');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_664', '[\"桃太郎番茄\",\"柑(甘)仔蜜\",\"草(番\",\"西紅\",\"六月)柿\",\"臭柿仔\",\"小金瓜\",\"洋柿(茄)子\",\"紅茄\",\"毛臘果\",\"Cherry tomato\",\"cherry tomato\",\"Solanum lycopersicum var. cerasiforme\"]', '蔬菜類', '自動生成: 桃太郎番茄 ↔ Cherry tomato', 'Cherry tomato', '桃太郎番茄');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_672', '[\"條狀火腿(牛肉,黑胡椒)\",\"條狀火腿\",\"Beefalo\",\"beefalo\",\"Bos taurus X Bison bison\"]', '加工調理食品及其他類', '自動生成: 條狀火腿(牛肉,黑胡椒) ↔ Beefalo', 'Beefalo', '條狀火腿(牛肉,黑胡椒)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_673', '[\"條狀火腿(豬肉)\",\"條狀火腿\",\"Hamburger\",\"hamburger\"]', '加工調理食品及其他類', '自動生成: 條狀火腿(豬肉) ↔ Hamburger', 'Hamburger', '條狀火腿(豬肉)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_678', '[\"棉花糖\",\"Sugar\",\"sugar\"]', '糕餅點心類', '自動生成: 棉花糖 ↔ Sugar', 'Sugar', '棉花糖');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_682', '[\"棕點石斑魚\",\"老虎斑\",\"過魚\",\"Alaska blackfish\",\"alaska blackfish\",\"Dallia pectoralis\"]', '魚貝類', '自動生成: 棕點石斑魚 ↔ Alaska blackfish', 'Alaska blackfish', '棕點石斑魚');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_687', '[\"椰子油\",\"Coconut oil\",\"coconut oil\"]', '油脂類', '自動生成: 椰子油 ↔ Coconut oil', 'Coconut oil', '椰子油');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_697', '[\"楓糖\",\"Sugar\",\"sugar\"]', '糖類', '自動生成: 楓糖 ↔ Sugar', 'Sugar', '楓糖');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_698', '[\"榛果牛奶巧克力\",\"Almond milk\",\"almond milk\"]', '糕餅點心類', '自動生成: 榛果牛奶巧克力 ↔ Almond milk', 'Almond milk', '榛果牛奶巧克力');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_703', '[\"橄欖油\",\"Olive oil\",\"olive oil\"]', '油脂類', '自動生成: 橄欖油 ↔ Olive oil', 'Olive oil', '橄欖油');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_707', '[\"橫紋鸚哥魚(含皮)\",\"橫紋鸚哥魚\",\"鸚哥\",\"Alaska blackfish\",\"alaska blackfish\",\"Dallia pectoralis\"]', '魚貝類', '自動生成: 橫紋鸚哥魚(含皮) ↔ Alaska blackfish', 'Alaska blackfish', '橫紋鸚哥魚(含皮)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_711', '[\"檸檬\",\"Lemon\",\"lemon\",\"Citrus limon\"]', '水果類', '自動生成: 檸檬 ↔ Lemon', 'Lemon', '檸檬');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_712', '[\"檸檬愛玉凍\",\"愛玉\",\"草子仔\",\"草枳子\",\"天拋藤\",\"玉枳\",\"枳子\",\"天拋\",\"風不動\",\"Lemon\",\"lemon\",\"Citrus limon\"]', '糕餅點心類', '自動生成: 檸檬愛玉凍 ↔ Lemon', 'Lemon', '檸檬愛玉凍');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_713', '[\"檸檬果乾\",\"Lemon\",\"lemon\",\"Citrus limon\"]', '糕餅點心類', '自動生成: 檸檬果乾 ↔ Lemon', 'Lemon', '檸檬果乾');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_714', '[\"檸檬柑\",\"三寶柑\",\"甜檸檬\",\"Lemon\",\"lemon\",\"Citrus limon\"]', '水果類', '自動生成: 檸檬柑 ↔ Lemon', 'Lemon', '檸檬柑');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_715', '[\"檸檬汁(綠皮)\",\"檸檬汁\",\"Lemon\",\"lemon\",\"Citrus limon\"]', '水果類', '自動生成: 檸檬汁(綠皮) ↔ Lemon', 'Lemon', '檸檬汁(綠皮)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_716', '[\"檸檬汁(非原汁)\",\"檸檬汁\",\"Lemon\",\"lemon\",\"Citrus limon\"]', '飲料類', '自動生成: 檸檬汁(非原汁) ↔ Lemon', 'Lemon', '檸檬汁(非原汁)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_717', '[\"檸檬汁(黃皮)\",\"檸檬汁\",\"Lemon\",\"lemon\",\"Citrus limon\"]', '水果類', '自動生成: 檸檬汁(黃皮) ↔ Lemon', 'Lemon', '檸檬汁(黃皮)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_718', '[\"檸檬汁平均值\",\"Lemon\",\"lemon\",\"Citrus limon\"]', '水果類', '自動生成: 檸檬汁平均值 ↔ Lemon', 'Lemon', '檸檬汁平均值');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_719', '[\"櫻桃\",\"中國櫻桃又稱鶯桃\",\"荊桃\",\"Cherry tomato\",\"cherry tomato\",\"Solanum lycopersicum var. cerasiforme\"]', '水果類', '自動生成: 櫻桃 ↔ Cherry tomato', 'Cherry tomato', '櫻桃');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_720', '[\"櫻桃小番茄\",\"柑(甘)仔蜜\",\"草(番\",\"西紅\",\"六月)柿\",\"臭柿仔\",\"小金瓜\",\"洋柿(茄)子\",\"紅茄\",\"毛臘果\",\"Cherry tomato\",\"cherry tomato\",\"Solanum lycopersicum var. cerasiforme\"]', '蔬菜類', '自動生成: 櫻桃小番茄 ↔ Cherry tomato', 'Cherry tomato', '櫻桃小番茄');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_721', '[\"櫻桃蘿蔔\",\"蘿蔔\",\"菜頭\",\"萊菔\",\"小根蘿蔔\",\"二十日蘿蔔\",\"小粒菜頭\",\"Cherry tomato\",\"cherry tomato\",\"Solanum lycopersicum var. cerasiforme\"]', '蔬菜類', '自動生成: 櫻桃蘿蔔 ↔ Cherry tomato', 'Cherry tomato', '櫻桃蘿蔔');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_722', '[\"櫻桃鴨胸肉片\",\"Cherry tomato\",\"cherry tomato\",\"Solanum lycopersicum var. cerasiforme\"]', '肉類', '自動生成: 櫻桃鴨胸肉片 ↔ Cherry tomato', 'Cherry tomato', '櫻桃鴨胸肉片');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_723', '[\"正櫻蝦(熟)\",\"正櫻蝦\",\"櫻花蝦\",\"花殼仔\",\"櫻桃蝦\",\"玫瑰蝦\",\"火焰蝦\",\"Shrimp\",\"shrimp\",\"Caridea\"]', '魚貝類', '自動生成: 正櫻蝦(熟) ↔ Shrimp', 'Shrimp', '正櫻蝦(熟)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_724', '[\"正櫻蝦(生)\",\"正櫻蝦\",\"櫻花蝦\",\"花殼仔\",\"櫻桃蝦\",\"玫瑰蝦\",\"火焰蝦\",\"Shrimp\",\"shrimp\",\"Caridea\"]', '魚貝類', '自動生成: 正櫻蝦(生) ↔ Shrimp', 'Shrimp', '正櫻蝦(生)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_725', '[\"正櫻蝦乾\",\"櫻花蝦\",\"花殼仔\",\"櫻桃蝦\",\"玫瑰蝦\",\"火焰蝦\",\"Shrimp\",\"shrimp\",\"Caridea\"]', '魚貝類', '自動生成: 正櫻蝦乾 ↔ Shrimp', 'Shrimp', '正櫻蝦乾');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_727', '[\"毛綠豆\",\"菉豆\",\"綠小豆\",\"輻莢豆\",\"Mung bean\",\"mung bean\",\"Vigna radiata\"]', '豆類', '自動生成: 毛綠豆 ↔ Mung bean', 'Mung bean', '毛綠豆');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_730', '[\"毛鱗魚\",\"喜相逢\",\"多春魚\",\"樺太柳葉魚（日文）\",\"Alaska blackfish\",\"alaska blackfish\",\"Dallia pectoralis\"]', '魚貝類', '自動生成: 毛鱗魚 ↔ Alaska blackfish', 'Alaska blackfish', '毛鱗魚');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_731', '[\"毛鱗魚(柳葉魚)(裹粉未炸)\",\"毛鱗魚\",\"柳葉魚\",\"Alaska blackfish\",\"alaska blackfish\",\"Dallia pectoralis\"]', '加工調理食品及其他類', '自動生成: 毛鱗魚(柳葉魚)(裹粉未炸) ↔ Alaska blackfish', 'Alaska blackfish', '毛鱗魚(柳葉魚)(裹粉未炸)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_732', '[\"水果QQ軟糖\",\"Sugar\",\"sugar\"]', '糕餅點心類', '自動生成: 水果QQ軟糖 ↔ Sugar', 'Sugar', '水果QQ軟糖');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_733', '[\"水果軟糖\",\"Sugar\",\"sugar\"]', '糕餅點心類', '自動生成: 水果軟糖 ↔ Sugar', 'Sugar', '水果軟糖');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_746', '[\"沙士(低糖)\",\"沙士\",\"Sugar\",\"sugar\"]', '飲料類', '自動生成: 沙士(低糖) ↔ Sugar', 'Sugar', '沙士(低糖)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_751', '[\"沙茶粉\",\"Black tea\",\"black tea\"]', '調味料及香辛料類', '自動生成: 沙茶粉 ↔ Black tea', 'Black tea', '沙茶粉');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_752', '[\"沙茶醬\",\"Black tea\",\"black tea\"]', '調味料及香辛料類', '自動生成: 沙茶醬 ↔ Black tea', 'Black tea', '沙茶醬');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_755', '[\"油炸花生仁\",\"土豆\",\"長生果\",\"落花生\",\"Peanut\",\"peanut\",\"Arachis hypogaea\"]', '加工調理食品及其他類', '自動生成: 油炸花生仁 ↔ Peanut', 'Peanut', '油炸花生仁');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_756', '[\"油茶油\",\"苦茶(籽)油\",\"山茶油\",\"天綠果油\",\"大果種油茶油\",\"Black tea\",\"black tea\"]', '油脂類', '自動生成: 油茶油 ↔ Black tea', 'Black tea', '油茶油');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_761', '[\"油豆腐粉絲(阿給)\",\"油豆腐粉絲\",\"阿給\",\"Tofu\",\"tofu\"]', '加工調理食品及其他類', '自動生成: 油豆腐粉絲(阿給) ↔ Tofu', 'Tofu', '油豆腐粉絲(阿給)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_762', '[\"油魚卵(加工)\",\"油魚卵\",\"油魚子\",\"Alaska blackfish\",\"alaska blackfish\",\"Dallia pectoralis\"]', '加工調理食品及其他類', '自動生成: 油魚卵(加工) ↔ Alaska blackfish', 'Alaska blackfish', '油魚卵(加工)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_768', '[\"泡魷魚\",\"Squid\",\"squid\",\"Teuthida\"]', '魚貝類', '自動生成: 泡魷魚 ↔ Squid', 'Squid', '泡魷魚');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_769', '[\"泡麵(牛肉口味)\",\"泡麵\",\"Beefalo\",\"beefalo\",\"Bos taurus X Bison bison\"]', '加工調理食品及其他類', '自動生成: 泡麵(牛肉口味) ↔ Beefalo', 'Beefalo', '泡麵(牛肉口味)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_770', '[\"泡麵(鮮蝦口味)\",\"泡麵\",\"Shrimp\",\"shrimp\",\"Caridea\"]', '加工調理食品及其他類', '自動生成: 泡麵(鮮蝦口味) ↔ Shrimp', 'Shrimp', '泡麵(鮮蝦口味)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_778', '[\"洋蔥粉\",\"Garden onion\",\"garden onion\",\"Allium cepa\"]', '調味料及香辛料類', '自動生成: 洋蔥粉 ↔ Garden onion', 'Garden onion', '洋蔥粉');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_779', '[\"洋蔥麵包醬\",\"Garden onion\",\"garden onion\",\"Allium cepa\"]', '調味料及香辛料類', '自動生成: 洋蔥麵包醬 ↔ Garden onion', 'Garden onion', '洋蔥麵包醬');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_784', '[\"津輕蜜蘋果\",\"柰\",\"林檎\",\"Apple\",\"apple\",\"Malus pumila\"]', '水果類', '自動生成: 津輕蜜蘋果 ↔ Apple', 'Apple', '津輕蜜蘋果');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_792', '[\"海綿蛋糕(圓形)\",\"海綿蛋糕\",\"Egg roll\",\"egg roll\"]', '糕餅點心類', '自動生成: 海綿蛋糕(圓形) ↔ Egg roll', 'Egg roll', '海綿蛋糕(圓形)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_795', '[\"海頓芒果\",\"檬果\",\"檨仔\",\"菴羅果\",\"Mango\",\"mango\",\"Mangifera indica\"]', '水果類', '自動生成: 海頓芒果 ↔ Mango', 'Mango', '海頓芒果');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_797', '[\"海鱸蝦仁\",\"Shrimp\",\"shrimp\",\"Caridea\"]', '魚貝類', '自動生成: 海鱸蝦仁 ↔ Shrimp', 'Shrimp', '海鱸蝦仁');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_799', '[\"海鱺魚片\",\"海麗仔\",\"軍曹魚\",\"海龍魚\",\"黑魽\",\"海麗(臺東)\",\"海魚戾魚\",\"錫臘白\",\"海鱺/鱺魚/紅目鱺(澎湖)\",\"Alaska blackfish\",\"alaska blackfish\",\"Dallia pectoralis\"]', '魚貝類', '自動生成: 海鱺魚片 ↔ Alaska blackfish', 'Alaska blackfish', '海鱺魚片');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_803', '[\"淡色醬油\",\"Soy sauce\",\"soy sauce\"]', '調味料及香辛料類', '自動生成: 淡色醬油 ↔ Soy sauce', 'Soy sauce', '淡色醬油');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_805', '[\"深海鱗角魚\",\"深海角魚\",\"雞角\",\"角仔魚\",\"Alaska blackfish\",\"alaska blackfish\",\"Dallia pectoralis\"]', '魚貝類', '自動生成: 深海鱗角魚 ↔ Alaska blackfish', 'Alaska blackfish', '深海鱗角魚');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_809', '[\"清蒸蝦仁肉圓\",\"肉丸\",\"Shrimp\",\"shrimp\",\"Caridea\"]', '加工調理食品及其他類', '自動生成: 清蒸蝦仁肉圓 ↔ Shrimp', 'Shrimp', '清蒸蝦仁肉圓');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_811', '[\"溫泉蛋\",\"Egg roll\",\"egg roll\"]', '蛋類', '自動生成: 溫泉蛋 ↔ Egg roll', 'Egg roll', '溫泉蛋');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_814', '[\"滷蛋平均值\",\"Egg roll\",\"egg roll\"]', '蛋類', '自動生成: 滷蛋平均值 ↔ Egg roll', 'Egg roll', '滷蛋平均值');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_815', '[\"滷蛋白平均值\",\"Egg roll\",\"egg roll\"]', '蛋類', '自動生成: 滷蛋白平均值 ↔ Egg roll', 'Egg roll', '滷蛋白平均值');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_816', '[\"滷蛋黃平均值\",\"Egg roll\",\"egg roll\"]', '蛋類', '自動生成: 滷蛋黃平均值 ↔ Egg roll', 'Egg roll', '滷蛋黃平均值');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_821', '[\"澳洲胡蘿蔔(細長型)\",\"澳洲胡蘿蔔\",\"紅蘿蔔\",\"紅菜頭\",\"黃蘿蔔\",\"丁香蘿蔔\",\"人參\",\"金筍\",\"Carrot\",\"carrot\",\"Daucus carota ssp. sativus\"]', '蔬菜類', '自動生成: 澳洲胡蘿蔔(細長型) ↔ Carrot', 'Carrot', '澳洲胡蘿蔔(細長型)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_822', '[\"濁水米粉\",\"Annual wild rice\",\"annual wild rice\",\"Zizania aquatica\"]', '加工調理食品及其他類', '自動生成: 濁水米粉 ↔ Annual wild rice', 'Annual wild rice', '濁水米粉');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_824', '[\"火腿蛋三明治\",\"Hamburger\",\"hamburger\"]', '加工調理食品及其他類', '自動生成: 火腿蛋三明治 ↔ Hamburger', 'Hamburger', '火腿蛋三明治');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_825', '[\"火雞肉\",\"七面鳥\",\"吐綬雞\",\"Chicken\",\"chicken\",\"Gallus gallus\"]', '肉類', '自動生成: 火雞肉 ↔ Chicken', 'Chicken', '火雞肉');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_828', '[\"炒蛋(加油3大匙)\",\"炒蛋\",\"Egg roll\",\"egg roll\"]', '蛋類', '自動生成: 炒蛋(加油3大匙) ↔ Egg roll', 'Egg roll', '炒蛋(加油3大匙)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_833', '[\"烏殼綠竹筍\",\"烏殼筍\",\"烏殼綠\",\"烏綠竹\",\"烏腳綠竹筍\",\"烏腳綠仔\",\"四季竹\",\"南洋竹\",\"食用刺竹\",\"Bamboo shoots\",\"bamboo shoots\",\"Phyllostachys edulis\"]', '蔬菜類', '自動生成: 烏殼綠竹筍 ↔ Bamboo shoots', 'Bamboo shoots', '烏殼綠竹筍');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_835', '[\"烏醋\",\"Vinegar\",\"vinegar\"]', '調味料及香辛料類', '自動生成: 烏醋 ↔ Vinegar', 'Vinegar', '烏醋');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_837', '[\"烏骨雞蛋\",\"Egg roll\",\"egg roll\"]', '蛋類', '自動生成: 烏骨雞蛋 ↔ Egg roll', 'Egg roll', '烏骨雞蛋');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_838', '[\"烏骨雞蛋白\",\"Egg roll\",\"egg roll\"]', '蛋類', '自動生成: 烏骨雞蛋白 ↔ Egg roll', 'Egg roll', '烏骨雞蛋白');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_839', '[\"烏骨雞蛋黃\",\"Egg roll\",\"egg roll\"]', '蛋類', '自動生成: 烏骨雞蛋黃 ↔ Egg roll', 'Egg roll', '烏骨雞蛋黃');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_841', '[\"烏龍奶茶(去冰,全糖)\",\"烏龍奶茶\",\"Black tea\",\"black tea\"]', '飲料類', '自動生成: 烏龍奶茶(去冰,全糖) ↔ Black tea', 'Black tea', '烏龍奶茶(去冰,全糖)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_842', '[\"烏龍奶茶(去冰,半糖)\",\"烏龍奶茶\",\"Black tea\",\"black tea\"]', '飲料類', '自動生成: 烏龍奶茶(去冰,半糖) ↔ Black tea', 'Black tea', '烏龍奶茶(去冰,半糖)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_843', '[\"烏龍奶茶(去冰,微糖)\",\"烏龍奶茶\",\"Black tea\",\"black tea\"]', '飲料類', '自動生成: 烏龍奶茶(去冰,微糖) ↔ Black tea', 'Black tea', '烏龍奶茶(去冰,微糖)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_844', '[\"烏龍茶\",\"Black tea\",\"black tea\"]', '飲料類', '自動生成: 烏龍茶 ↔ Black tea', 'Black tea', '烏龍茶');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_845', '[\"烏龍茶(去冰,全糖)\",\"烏龍茶\",\"Black tea\",\"black tea\"]', '飲料類', '自動生成: 烏龍茶(去冰,全糖) ↔ Black tea', 'Black tea', '烏龍茶(去冰,全糖)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_846', '[\"烏龍茶(去冰,半糖)\",\"烏龍茶\",\"Black tea\",\"black tea\"]', '飲料類', '自動生成: 烏龍茶(去冰,半糖) ↔ Black tea', 'Black tea', '烏龍茶(去冰,半糖)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_847', '[\"烏龍茶(去冰,微糖)\",\"烏龍茶\",\"Black tea\",\"black tea\"]', '飲料類', '自動生成: 烏龍茶(去冰,微糖) ↔ Black tea', 'Black tea', '烏龍茶(去冰,微糖)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_848', '[\"烏龍茶茶湯\",\"Black tea\",\"black tea\"]', '飲料類', '自動生成: 烏龍茶茶湯 ↔ Black tea', 'Black tea', '烏龍茶茶湯');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_854', '[\"無子紅葡萄(含皮)\",\"無子紅葡萄\",\"蒲桃\",\"蒲萄\",\"草龍珠\",\"蒲陶\",\"葡桃\",\"Common grape\",\"common grape\",\"Vitis vinifera\"]', '水果類', '自動生成: 無子紅葡萄(含皮) ↔ Common grape', 'Common grape', '無子紅葡萄(含皮)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_857', '[\"無籽西瓜\",\"水瓜\",\"寒瓜\",\"夏瓜\",\"Watermelon\",\"watermelon\",\"Citrullus lanatus\"]', '水果類', '自動生成: 無籽西瓜 ↔ Watermelon', 'Watermelon', '無籽西瓜');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_858', '[\"無糖咖啡飲料\",\"Arabica coffee\",\"arabica coffee\",\"Coffea arabica\"]', '飲料類', '自動生成: 無糖咖啡飲料 ↔ Arabica coffee', 'Arabica coffee', '無糖咖啡飲料');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_859', '[\"無糖黑芝麻醬\",\"Sesame\",\"sesame\",\"Sesamum orientale\"]', '調味料及香辛料類', '自動生成: 無糖黑芝麻醬 ↔ Sesame', 'Sesame', '無糖黑芝麻醬');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_862', '[\"無蛋沙拉醬\",\"Egg roll\",\"egg roll\"]', '調味料及香辛料類', '自動生成: 無蛋沙拉醬 ↔ Egg roll', 'Egg roll', '無蛋沙拉醬');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_863', '[\"無蛋沙拉醬(2021年取樣)\",\"無蛋沙拉醬\",\"Egg roll\",\"egg roll\"]', '調味料及香辛料類', '自動生成: 無蛋沙拉醬(2021年取樣) ↔ Egg roll', 'Egg roll', '無蛋沙拉醬(2021年取樣)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_865', '[\"煎蛋(不加油)\",\"煎蛋\",\"Egg roll\",\"egg roll\"]', '蛋類', '自動生成: 煎蛋(不加油) ↔ Egg roll', 'Egg roll', '煎蛋(不加油)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_868', '[\"熟桂竹筍\",\"桂竹仔筍\",\"石竹仔筍\",\"簍竹\",\"筀竹筍\",\"Bamboo shoots\",\"bamboo shoots\",\"Phyllostachys edulis\"]', '蔬菜類', '自動生成: 熟桂竹筍 ↔ Bamboo shoots', 'Bamboo shoots', '熟桂竹筍');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_869', '[\"熟水餃(高麗菜水餃)\",\"熟水餃\",\"Black cabbage\",\"black cabbage\",\"Brassica oleracea var. viridis\"]', '加工調理食品及其他類', '自動生成: 熟水餃(高麗菜水餃) ↔ Black cabbage', 'Black cabbage', '熟水餃(高麗菜水餃)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_870', '[\"熟油茶油\",\"苦茶(籽)油\",\"山茶油\",\"天綠果油\",\"大果種油茶油\",\"Black tea\",\"black tea\"]', '油脂類', '自動生成: 熟油茶油 ↔ Black tea', 'Black tea', '熟油茶油');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_871', '[\"熟箭竹筍\",\"箭筍\",\"台灣箭竹\",\"矢竹仔\",\"玉山箭竹\",\"Bamboo shoots\",\"bamboo shoots\",\"Phyllostachys edulis\"]', '蔬菜類', '自動生成: 熟箭竹筍 ↔ Bamboo shoots', 'Bamboo shoots', '熟箭竹筍');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_884', '[\"片狀肉乾(牛肉,辣味)\",\"片狀肉乾\",\"辣味牛肉干\",\"Beefalo\",\"beefalo\",\"Bos taurus X Bison bison\"]', '加工調理食品及其他類', '自動生成: 片狀肉乾(牛肉,辣味) ↔ Beefalo', 'Beefalo', '片狀肉乾(牛肉,辣味)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_885', '[\"片狀肉乾(牛肉)\",\"片狀肉乾\",\"牛肉干\",\"Beefalo\",\"beefalo\",\"Bos taurus X Bison bison\"]', '加工調理食品及其他類', '自動生成: 片狀肉乾(牛肉) ↔ Beefalo', 'Beefalo', '片狀肉乾(牛肉)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_891', '[\"牛奶巧克力\",\"Almond milk\",\"almond milk\"]', '糕餅點心類', '自動生成: 牛奶巧克力 ↔ Almond milk', 'Almond milk', '牛奶巧克力');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_892', '[\"牛奶果\",\"星蘋果\",\"Almond milk\",\"almond milk\"]', '水果類', '自動生成: 牛奶果 ↔ Almond milk', 'Almond milk', '牛奶果');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_893', '[\"牛奶軟糖\",\"Almond milk\",\"almond milk\"]', '糕餅點心類', '自動生成: 牛奶軟糖 ↔ Almond milk', 'Almond milk', '牛奶軟糖');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_894', '[\"牛奶鳳梨\",\"旺來\",\"波羅\",\"黃萊\",\"黃梨\",\"王萊(台農20號)\",\"Pineapple\",\"pineapple\",\"Ananas comosus\"]', '水果類', '自動生成: 牛奶鳳梨 ↔ Pineapple', 'Pineapple', '牛奶鳳梨');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_906', '[\"牛番茄\",\"柑(甘)仔蜜\",\"草(番\",\"西紅\",\"六月)柿\",\"臭柿仔\",\"小金瓜\",\"洋柿(茄)子\",\"紅茄\",\"毛臘果\",\"Cherry tomato\",\"cherry tomato\",\"Solanum lycopersicum var. cerasiforme\"]', '蔬菜類', '自動生成: 牛番茄 ↔ Cherry tomato', 'Cherry tomato', '牛番茄');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_909', '[\"牛肉火鍋片平均值\",\"Beefalo\",\"beefalo\",\"Bos taurus X Bison bison\"]', '肉類', '自動生成: 牛肉火鍋片平均值 ↔ Beefalo', 'Beefalo', '牛肉火鍋片平均值');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_910', '[\"牛肉醬\",\"Beefalo\",\"beefalo\",\"Bos taurus X Bison bison\"]', '調味料及香辛料類', '自動生成: 牛肉醬 ↔ Beefalo', 'Beefalo', '牛肉醬');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_911', '[\"牛肉餡餅\",\"Beefalo\",\"beefalo\",\"Bos taurus X Bison bison\"]', '加工調理食品及其他類', '自動生成: 牛肉餡餅 ↔ Beefalo', 'Beefalo', '牛肉餡餅');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_912', '[\"牛肉香腸\",\"Beefalo\",\"beefalo\",\"Bos taurus X Bison bison\"]', '加工調理食品及其他類', '自動生成: 牛肉香腸 ↔ Beefalo', 'Beefalo', '牛肉香腸');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_921', '[\"牛軋糖\",\"Sugar\",\"sugar\"]', '糕餅點心類', '自動生成: 牛軋糖 ↔ Sugar', 'Sugar', '牛軋糖');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_922', '[\"牡蠣干\",\"蚵干\",\"Bivalvia (Clam, Mussel, Oyster)\",\"bivalvia (clam, mussel, oyster)\",\"Bivalvia\"]', '魚貝類', '自動生成: 牡蠣干 ↔ Bivalvia (Clam, Mussel, Oyster)', 'Bivalvia (Clam, Mussel, Oyster)', '牡蠣干');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_923', '[\"犬牙南極魚切片\",\"南極鱈\",\"美露鱈\",\"黑狗鱈\",\"智利海鱸(圓鱈)\",\"Alaska blackfish\",\"alaska blackfish\",\"Dallia pectoralis\"]', '魚貝類', '自動生成: 犬牙南極魚切片 ↔ Alaska blackfish', 'Alaska blackfish', '犬牙南極魚切片');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_925', '[\"狗母魚(蛇鯔)\",\"狗母魚\",\"狗母梭\",\"狗母\",\"Alaska blackfish\",\"alaska blackfish\",\"Dallia pectoralis\"]', '魚貝類', '自動生成: 狗母魚(蛇鯔) ↔ Alaska blackfish', 'Alaska blackfish', '狗母魚(蛇鯔)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_928', '[\"玉文芒果\",\"檬果\",\"檨仔\",\"菴羅果\",\"Mango\",\"mango\",\"Mangifera indica\"]', '水果類', '自動生成: 玉文芒果 ↔ Mango', 'Mango', '玉文芒果');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_929', '[\"玉桂西瓜子\",\"Watermelon\",\"watermelon\",\"Citrullus lanatus\"]', '加工調理食品及其他類', '自動生成: 玉桂西瓜子 ↔ Watermelon', 'Watermelon', '玉桂西瓜子');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_930', '[\"玉米油\",\"粟米油\",\"玉米胚芽油\",\"Acorn\",\"acorn\",\"Quercus\"]', '油脂類', '自動生成: 玉米油 ↔ Acorn', 'Acorn', '玉米油');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_931', '[\"玉米濃湯調理包\",\"Acorn\",\"acorn\",\"Quercus\"]', '加工調理食品及其他類', '自動生成: 玉米濃湯調理包 ↔ Acorn', 'Acorn', '玉米濃湯調理包');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_932', '[\"玉米筍\",\"番麥筍\",\"珍珠筍\",\"Acorn\",\"acorn\",\"Quercus\"]', '蔬菜類', '自動生成: 玉米筍 ↔ Acorn', 'Acorn', '玉米筍');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_933', '[\"玉米粉\",\"Acorn\",\"acorn\",\"Quercus\"]', '穀物類', '自動生成: 玉米粉 ↔ Acorn', 'Acorn', '玉米粉');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_934', '[\"玉米粒罐頭\",\"Acorn\",\"acorn\",\"Quercus\"]', '加工調理食品及其他類', '自動生成: 玉米粒罐頭 ↔ Acorn', 'Acorn', '玉米粒罐頭');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_935', '[\"玉米胚芽\",\"玉米仁\",\"珍珠米\",\"Acorn\",\"acorn\",\"Quercus\"]', '穀物類', '自動生成: 玉米胚芽 ↔ Acorn', 'Acorn', '玉米胚芽');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_936', '[\"玉米醬罐頭\",\"Acorn\",\"acorn\",\"Quercus\"]', '加工調理食品及其他類', '自動生成: 玉米醬罐頭 ↔ Acorn', 'Acorn', '玉米醬罐頭');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_937', '[\"玉米餅乾(原味)\",\"玉米餅乾\",\"Acorn\",\"acorn\",\"Quercus\"]', '糕餅點心類', '自動生成: 玉米餅乾(原味) ↔ Acorn', 'Acorn', '玉米餅乾(原味)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_942', '[\"珍珠奶茶(去冰,全糖)\",\"珍珠奶茶\",\"Black tea\",\"black tea\"]', '飲料類', '自動生成: 珍珠奶茶(去冰,全糖) ↔ Black tea', 'Black tea', '珍珠奶茶(去冰,全糖)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_943', '[\"珍珠奶茶(去冰,半糖)\",\"珍珠奶茶\",\"Black tea\",\"black tea\"]', '飲料類', '自動生成: 珍珠奶茶(去冰,半糖) ↔ Black tea', 'Black tea', '珍珠奶茶(去冰,半糖)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_944', '[\"珍珠奶茶(去冰,微糖)\",\"珍珠奶茶\",\"Black tea\",\"black tea\"]', '飲料類', '自動生成: 珍珠奶茶(去冰,微糖) ↔ Black tea', 'Black tea', '珍珠奶茶(去冰,微糖)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_951', '[\"環文蛤\",\"赤嘴蛤\",\"赤嘴仔\",\"青蛤\",\"海蜆\",\"公代\",\"Bivalvia (Clam, Mussel, Oyster)\",\"bivalvia (clam, mussel, oyster)\",\"Bivalvia\"]', '魚貝類', '自動生成: 環文蛤 ↔ Bivalvia (Clam, Mussel, Oyster)', 'Bivalvia (Clam, Mussel, Oyster)', '環文蛤');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_959', '[\"甘蔗鳳梨\",\"旺來\",\"波羅\",\"黃萊\",\"黃梨\",\"王萊(台農13號\",\"冬蜜鳳梨)\",\"Pineapple\",\"pineapple\",\"Ananas comosus\"]', '水果類', '自動生成: 甘蔗鳳梨 ↔ Pineapple', 'Pineapple', '甘蔗鳳梨');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_971', '[\"甜核桃\",\"Black walnut\",\"black walnut\",\"Juglans nigra\"]', '加工調理食品及其他類', '自動生成: 甜核桃 ↔ Black walnut', 'Black walnut', '甜核桃');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_978', '[\"甜玉米\",\"玉米\",\"黃玉米\",\"Acorn\",\"acorn\",\"Quercus\"]', '穀物類', '自動生成: 甜玉米 ↔ Acorn', 'Acorn', '甜玉米');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_983', '[\"甜蜜蜜鳳梨\",\"旺來\",\"波羅\",\"黃萊\",\"黃梨\",\"王萊(台農16號)\",\"Pineapple\",\"pineapple\",\"Ananas comosus\"]', '水果類', '自動生成: 甜蜜蜜鳳梨 ↔ Pineapple', 'Pineapple', '甜蜜蜜鳳梨');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_984', '[\"甜豌豆莢\",\"甜脆豌豆\",\"甜荷蘭豆\",\"甜荷仁豆\",\"Asian pear\",\"asian pear\",\"Pyrus pyrifolia\"]', '豆類', '自動生成: 甜豌豆莢 ↔ Asian pear', 'Asian pear', '甜豌豆莢');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_988', '[\"生啤酒\",\"Beer\",\"beer\"]', '加工調理食品及其他類', '自動生成: 生啤酒 ↔ Beer', 'Beer', '生啤酒');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_989', '[\"生核桃\",\"Black walnut\",\"black walnut\",\"Juglans nigra\"]', '堅果及種子類', '自動生成: 生核桃 ↔ Black walnut', 'Black walnut', '生核桃');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_992', '[\"發芽稉米(台稉71號)\",\"發芽稉米\",\"發芽糙米\",\"益全香米發芽米\",\"Annual wild rice\",\"annual wild rice\",\"Zizania aquatica\"]', '穀物類', '自動生成: 發芽稉米(台稉71號) ↔ Annual wild rice', 'Annual wild rice', '發芽稉米(台稉71號)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_993', '[\"發芽稉米(台稉9號）\",\"發芽糙米\",\"Annual wild rice\",\"annual wild rice\",\"Zizania aquatica\"]', '穀物類', '自動生成: 發芽稉米(台稉9號） ↔ Annual wild rice', 'Annual wild rice', '發芽稉米(台稉9號）');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_994', '[\"發芽稉米平均值\",\"發芽糙米\",\"Annual wild rice\",\"annual wild rice\",\"Zizania aquatica\"]', '穀物類', '自動生成: 發芽稉米平均值 ↔ Annual wild rice', 'Annual wild rice', '發芽稉米平均值');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_995', '[\"白姑魚\",\"白口\",\"帕頭\",\"黃順\",\"加網(澎湖)\",\"Alaska blackfish\",\"alaska blackfish\",\"Dallia pectoralis\"]', '魚貝類', '自動生成: 白姑魚 ↔ Alaska blackfish', 'Alaska blackfish', '白姑魚');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_996', '[\"白對蝦(大)\",\"白對蝦\",\"南美白蝦\",\"美洲白蝦\",\"南美白對蝦\",\"白蝦\",\"Shrimp\",\"shrimp\",\"Caridea\"]', '魚貝類', '自動生成: 白對蝦(大) ↔ Shrimp', 'Shrimp', '白對蝦(大)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_997', '[\"白對蝦(小)\",\"白對蝦\",\"南美白蝦\",\"美洲白蝦\",\"南美白對蝦\",\"白蝦\",\"Shrimp\",\"shrimp\",\"Caridea\"]', '魚貝類', '自動生成: 白對蝦(小) ↔ Shrimp', 'Shrimp', '白對蝦(小)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_998', '[\"白對蝦(小)(2022年取樣)\",\"白對蝦\",\"南美白蝦\",\"美洲白蝦\",\"南美白對蝦\",\"白蝦\",\"Shrimp\",\"shrimp\",\"Caridea\"]', '魚貝類', '自動生成: 白對蝦(小)(2022年取樣) ↔ Shrimp', 'Shrimp', '白對蝦(小)(2022年取樣)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_999', '[\"白對蝦平均值\",\"南美白蝦\",\"美洲白蝦\",\"南美白對蝦\",\"白蝦\",\"Shrimp\",\"shrimp\",\"Caridea\"]', '魚貝類', '自動生成: 白對蝦平均值 ↔ Shrimp', 'Shrimp', '白對蝦平均值');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1000', '[\"白巧克力風味糖\",\"Sugar\",\"sugar\"]', '糕餅點心類', '自動生成: 白巧克力風味糖 ↔ Sugar', 'Sugar', '白巧克力風味糖');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1001', '[\"白帶魚\",\"白魚\",\"裙帶\",\"肥帶\",\"油帶\",\"天竺帶魚\",\"黃稜油帶(澎湖)\",\"Alaska blackfish\",\"alaska blackfish\",\"Dallia pectoralis\"]', '魚貝類', '自動生成: 白帶魚 ↔ Alaska blackfish', 'Alaska blackfish', '白帶魚');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1003', '[\"白櫻桃\",\"中國櫻桃又稱鶯桃\",\"荊桃\",\"Cherry tomato\",\"cherry tomato\",\"Solanum lycopersicum var. cerasiforme\"]', '水果類', '自動生成: 白櫻桃 ↔ Cherry tomato', 'Cherry tomato', '白櫻桃');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1006', '[\"白洋蔥\",\"玉蔥\",\"蔥頭\",\"球蔥\",\"胡蔥\",\"日本蔥頭\",\"大粒蔥頭\",\"洋蔥頭\",\"大蔥頭\",\"Garden onion\",\"garden onion\",\"Allium cepa\"]', '蔬菜類', '自動生成: 白洋蔥 ↔ Garden onion', 'Garden onion', '白洋蔥');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1008', '[\"白玉米\",\"Acorn\",\"acorn\",\"Quercus\"]', '穀物類', '自動生成: 白玉米 ↔ Acorn', 'Acorn', '白玉米');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1011', '[\"白糯米粉\",\"Annual wild rice\",\"annual wild rice\",\"Zizania aquatica\"]', '穀物類', '自動生成: 白糯米粉 ↔ Annual wild rice', 'Annual wild rice', '白糯米粉');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1013', '[\"白肉鮭魚切片\",\"Atlantic salmon\",\"atlantic salmon\",\"Salmo salar\"]', '魚貝類', '自動生成: 白肉鮭魚切片 ↔ Atlantic salmon', 'Atlantic salmon', '白肉鮭魚切片');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1014', '[\"白胡椒粉\",\"Cubanelle pepper\",\"cubanelle pepper\"]', '調味料及香辛料類', '自動生成: 白胡椒粉 ↔ Cubanelle pepper', 'Cubanelle pepper', '白胡椒粉');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1015', '[\"白芝麻(熟)\",\"白芝麻\",\"Sesame\",\"sesame\",\"Sesamum orientale\"]', '堅果及種子類', '自動生成: 白芝麻(熟) ↔ Sesame', 'Sesame', '白芝麻(熟)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1016', '[\"白芝麻(熟)2022年取樣)\",\"白芝麻2022年取樣)\",\"Sesame\",\"sesame\",\"Sesamum orientale\"]', '堅果及種子類', '自動生成: 白芝麻(熟)2022年取樣) ↔ Sesame', 'Sesame', '白芝麻(熟)2022年取樣)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1017', '[\"白芝麻(生)\",\"白芝麻\",\"Sesame\",\"sesame\",\"Sesamum orientale\"]', '堅果及種子類', '自動生成: 白芝麻(生) ↔ Sesame', 'Sesame', '白芝麻(生)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1018', '[\"白芝麻油\",\"Sesame oil\",\"sesame oil\"]', '油脂類', '自動生成: 白芝麻油 ↔ Sesame oil', 'Sesame oil', '白芝麻油');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1019', '[\"白芝麻糖\",\"Sesame\",\"sesame\",\"Sesamum orientale\"]', '糕餅點心類', '自動生成: 白芝麻糖 ↔ Sesame', 'Sesame', '白芝麻糖');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1020', '[\"白芝麻麵包醬\",\"Breadfruit\",\"breadfruit\",\"Artocarpus altilis\"]', '調味料及香辛料類', '自動生成: 白芝麻麵包醬 ↔ Breadfruit', 'Breadfruit', '白芝麻麵包醬');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1024', '[\"白葡萄酒\",\"Common grape\",\"common grape\",\"Vitis vinifera\"]', '加工調理食品及其他類', '自動生成: 白葡萄酒 ↔ Common grape', 'Common grape', '白葡萄酒');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1026', '[\"白蘿蔔\",\"蘿蔔\",\"菜頭\",\"萊菔\",\"蘆萉\",\"仙人骨\",\"大菜\",\"大根\",\"Black radish\",\"black radish\",\"Raphanus sativus var. niger\"]', '蔬菜類', '自動生成: 白蘿蔔 ↔ Black radish', 'Black radish', '白蘿蔔');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1027', '[\"白蘿蔔(長形)\",\"白蘿蔔\",\"蘿蔔\",\"菜頭\",\"萊菔\",\"蘆萉\",\"仙人骨\",\"大菜\",\"大根\",\"Black radish\",\"black radish\",\"Raphanus sativus var. niger\"]', '蔬菜類', '自動生成: 白蘿蔔(長形) ↔ Black radish', 'Black radish', '白蘿蔔(長形)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1028', '[\"白蘿蔔平均值\",\"蘿蔔\",\"菜頭\",\"萊菔\",\"蘆萉\",\"仙人骨\",\"大菜\",\"大根\",\"Black radish\",\"black radish\",\"Raphanus sativus var. niger\"]', '蔬菜類', '自動生成: 白蘿蔔平均值 ↔ Black radish', 'Black radish', '白蘿蔔平均值');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1033', '[\"白馬頭魚\",\"馬頭\",\"方頭魚\",\"白馬頭\",\"拉崙(澎湖)\",\"白甘鯛\",\"Alaska blackfish\",\"alaska blackfish\",\"Dallia pectoralis\"]', '魚貝類', '自動生成: 白馬頭魚 ↔ Alaska blackfish', 'Alaska blackfish', '白馬頭魚');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1040', '[\"百頁豆腐\",\"千張豆腐\",\"Tofu\",\"tofu\"]', '加工調理食品及其他類', '自動生成: 百頁豆腐 ↔ Tofu', 'Tofu', '百頁豆腐');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1042', '[\"百香果汁\",\"時計果汁\",\"西番果汁\",\"西番蓮汁\",\"美里瓜汁\",\"Fruit juice\",\"fruit juice\"]', '水果類', '自動生成: 百香果汁 ↔ Fruit juice', 'Fruit juice', '百香果汁');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1044', '[\"皇宮西瓜\",\"水瓜\",\"寒瓜\",\"夏瓜\",\"Watermelon\",\"watermelon\",\"Citrullus lanatus\"]', '水果類', '自動生成: 皇宮西瓜 ↔ Watermelon', 'Watermelon', '皇宮西瓜');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1045', '[\"相模後海螯蝦\",\"相模角蝦\",\"小龍蝦\",\"鐵甲蝦\",\"角蝦\",\"蝦猴\",\"Shrimp\",\"shrimp\",\"Caridea\"]', '魚貝類', '自動生成: 相模後海螯蝦 ↔ Shrimp', 'Shrimp', '相模後海螯蝦');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1049', '[\"真牡蠣\",\"正(大/長/鑄大)牡蠣\",\"正(青)蚵\",\"蚵仔\",\"蚵\",\"蠔\",\"Bivalvia (Clam, Mussel, Oyster)\",\"bivalvia (clam, mussel, oyster)\",\"Bivalvia\"]', '魚貝類', '自動生成: 真牡蠣 ↔ Bivalvia (Clam, Mussel, Oyster)', 'Bivalvia (Clam, Mussel, Oyster)', '真牡蠣');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1050', '[\"真牡蠣平均值\",\"正(大/長/鑄大)牡蠣\",\"正(青)蚵\",\"蚵仔\",\"蚵\",\"蠔\",\"Bivalvia (Clam, Mussel, Oyster)\",\"bivalvia (clam, mussel, oyster)\",\"Bivalvia\"]', '魚貝類', '自動生成: 真牡蠣平均值 ↔ Bivalvia (Clam, Mussel, Oyster)', 'Bivalvia (Clam, Mussel, Oyster)', '真牡蠣平均值');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1058', '[\"眼斑擬石首魚\",\"紅鼓魚\",\"Alaska blackfish\",\"alaska blackfish\",\"Dallia pectoralis\"]', '魚貝類', '自動生成: 眼斑擬石首魚 ↔ Alaska blackfish', 'Alaska blackfish', '眼斑擬石首魚');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1059', '[\"眼眶魚\",\"皮刀\",\"庖刀魚\",\"皮鞋刀\",\"菜刀魚\",\"剃頭刀(澎湖)\",\"Alaska blackfish\",\"alaska blackfish\",\"Dallia pectoralis\"]', '魚貝類', '自動生成: 眼眶魚 ↔ Alaska blackfish', 'Alaska blackfish', '眼眶魚');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1062', '[\"砂糖橘\",\"十月桔\",\"沙糖桔\",\"沙糖橘\",\"砂糖桔\",\"Sugar\",\"sugar\"]', '水果類', '自動生成: 砂糖橘 ↔ Sugar', 'Sugar', '砂糖橘');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1065', '[\"福氏鸚哥魚(去皮)\",\"福氏鸚哥魚\",\"紅鸚哥\",\"青鸚哥仔\",\"青衣\",\"青衫(雄)\",\"蠔魚(雌)\",\"紅海逮\",\"紅咬齒\",\"番仔魚(臺東)\",\"Alaska blackfish\",\"alaska blackfish\",\"Dallia pectoralis\"]', '魚貝類', '自動生成: 福氏鸚哥魚(去皮) ↔ Alaska blackfish', 'Alaska blackfish', '福氏鸚哥魚(去皮)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1068', '[\"秈型糯米(台中糯70號)\",\"秈型糯米\",\"長糯米\",\"Annual wild rice\",\"annual wild rice\",\"Zizania aquatica\"]', '穀物類', '自動生成: 秈型糯米(台中糯70號) ↔ Annual wild rice', 'Annual wild rice', '秈型糯米(台中糯70號)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1069', '[\"秈米(台中在來2號)\",\"秈米\",\"在來米\",\"長米\",\"Annual wild rice\",\"annual wild rice\",\"Zizania aquatica\"]', '穀物類', '自動生成: 秈米(台中在來2號) ↔ Annual wild rice', 'Annual wild rice', '秈米(台中在來2號)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1070', '[\"秈米(台中秈10號)\",\"秈米\",\"在來米\",\"長米\",\"Annual wild rice\",\"annual wild rice\",\"Zizania aquatica\"]', '穀物類', '自動生成: 秈米(台中秈10號) ↔ Annual wild rice', 'Annual wild rice', '秈米(台中秈10號)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1071', '[\"秈米(台中秈10號)(2024年取樣)\",\"秈米\",\"在來米\",\"長米\",\"Annual wild rice\",\"annual wild rice\",\"Zizania aquatica\"]', '穀物類', '自動生成: 秈米(台中秈10號)(2024年取樣) ↔ Annual wild rice', 'Annual wild rice', '秈米(台中秈10號)(2024年取樣)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1072', '[\"秈米平均值\",\"在來米\",\"長米\",\"Annual wild rice\",\"annual wild rice\",\"Zizania aquatica\"]', '穀物類', '自動生成: 秈米平均值 ↔ Annual wild rice', 'Annual wild rice', '秈米平均值');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1073', '[\"秈米粉\",\"在來米粉\",\"Annual wild rice\",\"annual wild rice\",\"Zizania aquatica\"]', '穀物類', '自動生成: 秈米粉 ↔ Annual wild rice', 'Annual wild rice', '秈米粉');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1074', '[\"秋刀魚\",\"竹刀魚\",\"山瑪魚\",\"Alaska blackfish\",\"alaska blackfish\",\"Dallia pectoralis\"]', '魚貝類', '自動生成: 秋刀魚 ↔ Alaska blackfish', 'Alaska blackfish', '秋刀魚');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1076', '[\"秋香蘋果\",\"柰\",\"林檎\",\"Apple\",\"apple\",\"Malus pumila\"]', '水果類', '自動生成: 秋香蘋果 ↔ Apple', 'Apple', '秋香蘋果');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1077', '[\"稉型糯米\",\"圓糯米\",\"Annual wild rice\",\"annual wild rice\",\"Zizania aquatica\"]', '穀物類', '自動生成: 稉型糯米 ↔ Annual wild rice', 'Annual wild rice', '稉型糯米');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1078', '[\"稉型糯米(台稉糯1號)\",\"稉型糯米\",\"圓糯米\",\"Annual wild rice\",\"annual wild rice\",\"Zizania aquatica\"]', '穀物類', '自動生成: 稉型糯米(台稉糯1號) ↔ Annual wild rice', 'Annual wild rice', '稉型糯米(台稉糯1號)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1079', '[\"稉型糯米平均值\",\"圓糯米\",\"Annual wild rice\",\"annual wild rice\",\"Zizania aquatica\"]', '穀物類', '自動生成: 稉型糯米平均值 ↔ Annual wild rice', 'Annual wild rice', '稉型糯米平均值');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1080', '[\"稉米(台中189號)\",\"稉米\",\"蓬萊米\",\"圓米\",\"Annual wild rice\",\"annual wild rice\",\"Zizania aquatica\"]', '穀物類', '自動生成: 稉米(台中189號) ↔ Annual wild rice', 'Annual wild rice', '稉米(台中189號)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1081', '[\"稉米(台南11號)\",\"稉米\",\"蓬萊米\",\"圓米\",\"Annual wild rice\",\"annual wild rice\",\"Zizania aquatica\"]', '穀物類', '自動生成: 稉米(台南11號) ↔ Annual wild rice', 'Annual wild rice', '稉米(台南11號)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1082', '[\"稉米(台稉2號)\",\"稉米\",\"蓬萊米\",\"圓米\",\"Annual wild rice\",\"annual wild rice\",\"Zizania aquatica\"]', '穀物類', '自動生成: 稉米(台稉2號) ↔ Annual wild rice', 'Annual wild rice', '稉米(台稉2號)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1083', '[\"稉米(台稉8號)\",\"稉米\",\"蓬萊米\",\"圓米\",\"Annual wild rice\",\"annual wild rice\",\"Zizania aquatica\"]', '穀物類', '自動生成: 稉米(台稉8號) ↔ Annual wild rice', 'Annual wild rice', '稉米(台稉8號)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1084', '[\"稉米(台稉9號)\",\"稉米\",\"蓬萊米\",\"圓米\",\"Annual wild rice\",\"annual wild rice\",\"Zizania aquatica\"]', '穀物類', '自動生成: 稉米(台稉9號) ↔ Annual wild rice', 'Annual wild rice', '稉米(台稉9號)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1085', '[\"稉米(台農71號)\",\"稉米\",\"蓬萊米\",\"圓米\",\"益全香米\",\"Annual wild rice\",\"annual wild rice\",\"Zizania aquatica\"]', '穀物類', '自動生成: 稉米(台農71號) ↔ Annual wild rice', 'Annual wild rice', '稉米(台農71號)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1086', '[\"稉米(高雄139號)\",\"稉米\",\"蓬萊米\",\"圓米\",\"Annual wild rice\",\"annual wild rice\",\"Zizania aquatica\"]', '穀物類', '自動生成: 稉米(高雄139號) ↔ Annual wild rice', 'Annual wild rice', '稉米(高雄139號)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1087', '[\"稉米(高雄139號)(2021年取樣)\",\"稉米\",\"蓬萊米\",\"圓米\",\"Annual wild rice\",\"annual wild rice\",\"Zizania aquatica\"]', '穀物類', '自動生成: 稉米(高雄139號)(2021年取樣) ↔ Annual wild rice', 'Annual wild rice', '稉米(高雄139號)(2021年取樣)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1088', '[\"稉米(高雄142號)\",\"稉米\",\"蓬萊米\",\"圓米\",\"Annual wild rice\",\"annual wild rice\",\"Zizania aquatica\"]', '穀物類', '自動生成: 稉米(高雄142號) ↔ Annual wild rice', 'Annual wild rice', '稉米(高雄142號)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1089', '[\"稉米(高雄145號)\",\"稉米\",\"Annual wild rice\",\"annual wild rice\",\"Zizania aquatica\"]', '穀物類', '自動生成: 稉米(高雄145號) ↔ Annual wild rice', 'Annual wild rice', '稉米(高雄145號)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1090', '[\"稉米平均值\",\"蓬萊米\",\"圓米\",\"Annual wild rice\",\"annual wild rice\",\"Zizania aquatica\"]', '穀物類', '自動生成: 稉米平均值 ↔ Annual wild rice', 'Annual wild rice', '稉米平均值');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1092', '[\"章魚\",\"厚嘴仔\",\"石居\",\"八爪魚\",\"坐蛸\",\"石吸\",\"望潮\",\"死牛\",\"Common octopus\",\"common octopus\",\"Octopus vulgaris\"]', '魚貝類', '自動生成: 章魚 ↔ Common octopus', 'Common octopus', '章魚');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1093', '[\"竹筍包\",\"Bamboo shoots\",\"bamboo shoots\",\"Phyllostachys edulis\"]', '加工調理食品及其他類', '自動生成: 竹筍包 ↔ Bamboo shoots', 'Bamboo shoots', '竹筍包');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1096', '[\"筒仔米糕\",\"Annual wild rice\",\"annual wild rice\",\"Zizania aquatica\"]', '加工調理食品及其他類', '自動生成: 筒仔米糕 ↔ Annual wild rice', 'Annual wild rice', '筒仔米糕');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1097', '[\"米油(秈米)\",\"米油\",\"米糠油\",\"玄米油\",\"胚芽米油\",\"Annual wild rice\",\"annual wild rice\",\"Zizania aquatica\"]', '油脂類', '自動生成: 米油(秈米) ↔ Annual wild rice', 'Annual wild rice', '米油(秈米)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1098', '[\"米油(粳米)\",\"米油\",\"米糠油\",\"玄米油\",\"胚芽米油\",\"Annual wild rice\",\"annual wild rice\",\"Zizania aquatica\"]', '油脂類', '自動生成: 米油(粳米) ↔ Annual wild rice', 'Annual wild rice', '米油(粳米)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1099', '[\"米漿(散裝)\",\"米漿\",\"Annual wild rice\",\"annual wild rice\",\"Zizania aquatica\"]', '加工調理食品及其他類', '自動生成: 米漿(散裝) ↔ Annual wild rice', 'Annual wild rice', '米漿(散裝)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1100', '[\"米漿粉\",\"Annual wild rice\",\"annual wild rice\",\"Zizania aquatica\"]', '加工調理食品及其他類', '自動生成: 米漿粉 ↔ Annual wild rice', 'Annual wild rice', '米漿粉');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1101', '[\"米粄條\",\"美濃粄條\",\"Annual wild rice\",\"annual wild rice\",\"Zizania aquatica\"]', '加工調理食品及其他類', '自動生成: 米粄條 ↔ Annual wild rice', 'Annual wild rice', '米粄條');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1102', '[\"米粩\",\"豬油粩\",\"Annual wild rice\",\"annual wild rice\",\"Zizania aquatica\"]', '糕餅點心類', '自動生成: 米粩 ↔ Annual wild rice', 'Annual wild rice', '米粩');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1103', '[\"米胚芽\",\"Annual wild rice\",\"annual wild rice\",\"Zizania aquatica\"]', '穀物類', '自動生成: 米胚芽 ↔ Annual wild rice', 'Annual wild rice', '米胚芽');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1104', '[\"米苔目\",\"Annual wild rice\",\"annual wild rice\",\"Zizania aquatica\"]', '加工調理食品及其他類', '自動生成: 米苔目 ↔ Annual wild rice', 'Annual wild rice', '米苔目');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1105', '[\"米豆\",\"飯豆\",\"蛋白豆\",\"赤山豆\",\"繖形豇豆\",\"島田豇豆\",\"Annual wild rice\",\"annual wild rice\",\"Zizania aquatica\"]', '豆類', '自動生成: 米豆 ↔ Annual wild rice', 'Annual wild rice', '米豆');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1106', '[\"米豆醬\",\"Annual wild rice\",\"annual wild rice\",\"Zizania aquatica\"]', '調味料及香辛料類', '自動生成: 米豆醬 ↔ Annual wild rice', 'Annual wild rice', '米豆醬');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1107', '[\"米醋\",\"Annual wild rice\",\"annual wild rice\",\"Zizania aquatica\"]', '調味料及香辛料類', '自動生成: 米醋 ↔ Annual wild rice', 'Annual wild rice', '米醋');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1108', '[\"米醋飲料\",\"Annual wild rice\",\"annual wild rice\",\"Zizania aquatica\"]', '飲料類', '自動生成: 米醋飲料 ↔ Annual wild rice', 'Annual wild rice', '米醋飲料');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1110', '[\"粉柿番茄\",\"柑(甘)仔蜜\",\"草(番\",\"西紅\",\"六月)柿\",\"臭柿仔\",\"小金瓜\",\"洋柿(茄)子\",\"紅茄\",\"毛臘果(粉柿仔)\",\"Cherry tomato\",\"cherry tomato\",\"Solanum lycopersicum var. cerasiforme\"]', '蔬菜類', '自動生成: 粉柿番茄 ↔ Cherry tomato', 'Cherry tomato', '粉柿番茄');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1112', '[\"粉薑\",\"薑仔\",\"生薑\",\"生姜\",\"羌\",\"蘘荷\",\"茗荷\",\"甘露子\",\"紫薑\",\"Ginger\",\"ginger\",\"Zingiber officinale\"]', '蔬菜類', '自動生成: 粉薑 ↔ Ginger', 'Ginger', '粉薑');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1115', '[\"糖漬花生仁\",\"土豆\",\"長生果\",\"落花生\",\"Peanut\",\"peanut\",\"Arachis hypogaea\"]', '加工調理食品及其他類', '自動生成: 糖漬花生仁 ↔ Peanut', 'Peanut', '糖漬花生仁');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1116', '[\"糖漬蓮子\",\"Sugar\",\"sugar\"]', '加工調理食品及其他類', '自動生成: 糖漬蓮子 ↔ Sugar', 'Sugar', '糖漬蓮子');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1117', '[\"糖炒栗子\",\"Chestnut\",\"chestnut\",\"Castanea\"]', '加工調理食品及其他類', '自動生成: 糖炒栗子 ↔ Chestnut', 'Chestnut', '糖炒栗子');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1118', '[\"糖粉\",\"Sugar\",\"sugar\"]', '調味料及香辛料類', '自動生成: 糖粉 ↔ Sugar', 'Sugar', '糖粉');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1119', '[\"糖粒甜甜圈(油炸)\",\"糖粒甜甜圈\",\"Sugar\",\"sugar\"]', '糕餅點心類', '自動生成: 糖粒甜甜圈(油炸) ↔ Sugar', 'Sugar', '糖粒甜甜圈(油炸)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1120', '[\"糖衣牛奶巧克力\",\"Almond milk\",\"almond milk\"]', '糕餅點心類', '自動生成: 糖衣牛奶巧克力 ↔ Almond milk', 'Almond milk', '糖衣牛奶巧克力');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1121', '[\"糖醋醬\",\"Sugar\",\"sugar\"]', '調味料及香辛料類', '自動生成: 糖醋醬 ↔ Sugar', 'Sugar', '糖醋醬');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1122', '[\"糙秈米\",\"糙米\",\"Annual wild rice\",\"annual wild rice\",\"Zizania aquatica\"]', '穀物類', '自動生成: 糙秈米 ↔ Annual wild rice', 'Annual wild rice', '糙秈米');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1123', '[\"糙秈米漿\",\"Annual wild rice\",\"annual wild rice\",\"Zizania aquatica\"]', '穀物類', '自動生成: 糙秈米漿 ↔ Annual wild rice', 'Annual wild rice', '糙秈米漿');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1124', '[\"糙稉米(台稉71號)\",\"糙稉米\",\"益全香米糙米\",\"Annual wild rice\",\"annual wild rice\",\"Zizania aquatica\"]', '穀物類', '自動生成: 糙稉米(台稉71號) ↔ Annual wild rice', 'Annual wild rice', '糙稉米(台稉71號)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1125', '[\"糙稉米(台稉9號)\",\"糙稉米\",\"糙米\",\"Annual wild rice\",\"annual wild rice\",\"Zizania aquatica\"]', '穀物類', '自動生成: 糙稉米(台稉9號) ↔ Annual wild rice', 'Annual wild rice', '糙稉米(台稉9號)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1126', '[\"糙稉米平均值\",\"糙米\",\"Annual wild rice\",\"annual wild rice\",\"Zizania aquatica\"]', '穀物類', '自動生成: 糙稉米平均值 ↔ Annual wild rice', 'Annual wild rice', '糙稉米平均值');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1127', '[\"糙米漿\",\"Annual wild rice\",\"annual wild rice\",\"Zizania aquatica\"]', '加工調理食品及其他類', '自動生成: 糙米漿 ↔ Annual wild rice', 'Annual wild rice', '糙米漿');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1128', '[\"糙米粉\",\"Annual wild rice\",\"annual wild rice\",\"Zizania aquatica\"]', '穀物類', '自動生成: 糙米粉 ↔ Annual wild rice', 'Annual wild rice', '糙米粉');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1129', '[\"糙米麩\",\"Annual wild rice\",\"annual wild rice\",\"Zizania aquatica\"]', '加工調理食品及其他類', '自動生成: 糙米麩 ↔ Annual wild rice', 'Annual wild rice', '糙米麩');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1131', '[\"糯小米\",\"Annual wild rice\",\"annual wild rice\",\"Zizania aquatica\"]', '穀物類', '自動生成: 糯小米 ↔ Annual wild rice', 'Annual wild rice', '糯小米');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1132', '[\"糯玉米\",\"Acorn\",\"acorn\",\"Quercus\"]', '穀物類', '自動生成: 糯玉米 ↔ Acorn', 'Acorn', '糯玉米');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1133', '[\"糯米椒\",\"辣椒\",\"番椒\",\"番仔薑\",\"臘椒(伏見甘長辣椒)\",\"Annual wild rice\",\"annual wild rice\",\"Zizania aquatica\"]', '蔬菜類', '自動生成: 糯米椒 ↔ Annual wild rice', 'Annual wild rice', '糯米椒');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1134', '[\"糯米漿\",\"Annual wild rice\",\"annual wild rice\",\"Zizania aquatica\"]', '加工調理食品及其他類', '自動生成: 糯米漿 ↔ Annual wild rice', 'Annual wild rice', '糯米漿');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1135', '[\"糯米醋\",\"Annual wild rice\",\"annual wild rice\",\"Zizania aquatica\"]', '調味料及香辛料類', '自動生成: 糯米醋 ↔ Annual wild rice', 'Annual wild rice', '糯米醋');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1136', '[\"糯米飯糰\",\"Annual wild rice\",\"annual wild rice\",\"Zizania aquatica\"]', '加工調理食品及其他類', '自動生成: 糯米飯糰 ↔ Annual wild rice', 'Annual wild rice', '糯米飯糰');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1138', '[\"紅土帶殼花生(熟)\",\"紅土帶殼花生\",\"土豆\",\"長生果\",\"落花生\",\"Peanut\",\"peanut\",\"Arachis hypogaea\"]', '堅果及種子類', '自動生成: 紅土帶殼花生(熟) ↔ Peanut', 'Peanut', '紅土帶殼花生(熟)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1140', '[\"紅寶石葡萄柚(古坑)\",\"紅寶石葡萄柚\",\"西柚\",\"朱欒\",\"Common grape\",\"common grape\",\"Vitis vinifera\"]', '水果類', '自動生成: 紅寶石葡萄柚(古坑) ↔ Common grape', 'Common grape', '紅寶石葡萄柚(古坑)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1151', '[\"紅番茄\",\"柑(甘)仔蜜\",\"草(番\",\"西紅\",\"六月)柿\",\"臭柿仔\",\"小金瓜\",\"洋柿(茄)子\",\"紅茄\",\"毛臘果\",\"Cherry tomato\",\"cherry tomato\",\"Solanum lycopersicum var. cerasiforme\"]', '蔬菜類', '自動生成: 紅番茄 ↔ Cherry tomato', 'Cherry tomato', '紅番茄');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1154', '[\"紅砂糖\",\"紅糖\",\"Sugar\",\"sugar\"]', '糖類', '自動生成: 紅砂糖 ↔ Sugar', 'Sugar', '紅砂糖');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1155', '[\"紅糯糙米\",\"Annual wild rice\",\"annual wild rice\",\"Zizania aquatica\"]', '穀物類', '自動生成: 紅糯糙米 ↔ Annual wild rice', 'Annual wild rice', '紅糯糙米');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1159', '[\"紅肉鮭魚切片\",\"Atlantic salmon\",\"atlantic salmon\",\"Salmo salar\"]', '魚貝類', '自動生成: 紅肉鮭魚切片 ↔ Atlantic salmon', 'Atlantic salmon', '紅肉鮭魚切片');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1160', '[\"紅胡椒粒\",\"Cubanelle pepper\",\"cubanelle pepper\"]', '調味料及香辛料類', '自動生成: 紅胡椒粒 ↔ Cubanelle pepper', 'Cubanelle pepper', '紅胡椒粒');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1161', '[\"紅色吳郭魚\",\"尼羅魚;台灣鯛\",\"紅色尼羅魚\",\"姬鯛\",\"紅吳郭魚\",\"濱鯛\",\"Alaska blackfish\",\"alaska blackfish\",\"Dallia pectoralis\"]', '魚貝類', '自動生成: 紅色吳郭魚 ↔ Alaska blackfish', 'Alaska blackfish', '紅色吳郭魚');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1163', '[\"紅茶(大麥)\",\"紅茶\",\"Black tea\",\"black tea\"]', '飲料類', '自動生成: 紅茶(大麥) ↔ Black tea', 'Black tea', '紅茶(大麥)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1164', '[\"紅茶(蘋果)\",\"紅茶\",\"水果茶\",\"Apple\",\"apple\",\"Malus pumila\"]', '飲料類', '自動生成: 紅茶(蘋果) ↔ Apple', 'Apple', '紅茶(蘋果)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1165', '[\"紅茶沖泡包(檸檬)\",\"紅茶沖泡包\",\"Lemon\",\"lemon\",\"Citrus limon\"]', '飲料類', '自動生成: 紅茶沖泡包(檸檬) ↔ Lemon', 'Lemon', '紅茶沖泡包(檸檬)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1166', '[\"紅茶茶湯\",\"Black tea\",\"black tea\"]', '飲料類', '自動生成: 紅茶茶湯 ↔ Black tea', 'Black tea', '紅茶茶湯');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1169', '[\"紅葡萄酒\",\"Common grape\",\"common grape\",\"Vitis vinifera\"]', '加工調理食品及其他類', '自動生成: 紅葡萄酒 ↔ Common grape', 'Common grape', '紅葡萄酒');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1172', '[\"紅蘿蔔麵\",\"Carrot\",\"carrot\",\"Daucus carota ssp. sativus\"]', '加工調理食品及其他類', '自動生成: 紅蘿蔔麵 ↔ Carrot', 'Carrot', '紅蘿蔔麵');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1173', '[\"紅蝦仁\",\"Shrimp\",\"shrimp\",\"Caridea\"]', '魚貝類', '自動生成: 紅蝦仁 ↔ Shrimp', 'Shrimp', '紅蝦仁');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1177', '[\"紅豆牛奶冰棒\",\"Almond milk\",\"almond milk\"]', '糕餅點心類', '自動生成: 紅豆牛奶冰棒 ↔ Almond milk', 'Almond milk', '紅豆牛奶冰棒');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1179', '[\"紅豆罐頭(糖漬)\",\"紅豆罐頭\",\"小豆\",\"赤小豆\",\"赤豆\",\"通常小豆\",\"小紅豆\",\"紅小豆\",\"Sugar\",\"sugar\"]', '加工調理食品及其他類', '自動生成: 紅豆罐頭(糖漬) ↔ Sugar', 'Sugar', '紅豆罐頭(糖漬)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1182', '[\"紅醋\",\"紅酢\",\"Vinegar\",\"vinegar\"]', '調味料及香辛料類', '自動生成: 紅醋 ↔ Vinegar', 'Vinegar', '紅醋');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1183', '[\"紅鈴西瓜\",\"水瓜\",\"寒瓜\",\"夏瓜\",\"Watermelon\",\"watermelon\",\"Citrullus lanatus\"]', '水果類', '自動生成: 紅鈴西瓜 ↔ Watermelon', 'Watermelon', '紅鈴西瓜');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1185', '[\"紅面番鴨蛋\",\"Egg roll\",\"egg roll\"]', '蛋類', '自動生成: 紅面番鴨蛋 ↔ Egg roll', 'Egg roll', '紅面番鴨蛋');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1186', '[\"紅馬鈴薯(粉紅珍珠馬鈴薯)\",\"紅馬鈴薯\",\"洋芋\",\"洋薯\",\"洋山芋\",\"荷蘭薯\",\"日本番薯\",\"塊茄\",\"Baked potato\",\"baked potato\"]', '澱粉類', '自動生成: 紅馬鈴薯(粉紅珍珠馬鈴薯) ↔ Baked potato', 'Baked potato', '紅馬鈴薯(粉紅珍珠馬鈴薯)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1192', '[\"素沙茶醬\",\"Black tea\",\"black tea\"]', '調味料及香辛料類', '自動生成: 素沙茶醬 ↔ Black tea', 'Black tea', '素沙茶醬');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1196', '[\"素食烏醋\",\"Vinegar\",\"vinegar\"]', '調味料及香辛料類', '自動生成: 素食烏醋 ↔ Vinegar', 'Vinegar', '素食烏醋');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1199', '[\"紫洋蔥\",\"玉蔥\",\"蔥頭\",\"球蔥\",\"胡蔥\",\"日本蔥頭\",\"大粒蔥頭\",\"洋蔥頭\",\"大蔥頭\",\"Garden onion\",\"garden onion\",\"Allium cepa\"]', '蔬菜類', '自動生成: 紫洋蔥 ↔ Garden onion', 'Garden onion', '紫洋蔥');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1200', '[\"紫玉米\",\"Acorn\",\"acorn\",\"Quercus\"]', '穀物類', '自動生成: 紫玉米 ↔ Acorn', 'Acorn', '紫玉米');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1202', '[\"紫米酒釀\",\"Annual wild rice\",\"annual wild rice\",\"Zizania aquatica\"]', '加工調理食品及其他類', '自動生成: 紫米酒釀 ↔ Annual wild rice', 'Annual wild rice', '紫米酒釀');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1204', '[\"紫色花椰菜\",\"Broccoli\",\"broccoli\",\"Brassica oleracea var. italica\"]', '蔬菜類', '自動生成: 紫色花椰菜 ↔ Broccoli', 'Broccoli', '紫色花椰菜');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1207', '[\"細米粉\",\"Annual wild rice\",\"annual wild rice\",\"Zizania aquatica\"]', '加工調理食品及其他類', '自動生成: 細米粉 ↔ Annual wild rice', 'Annual wild rice', '細米粉');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1216', '[\"綠番茄\",\"柑(甘)仔蜜\",\"草(番\",\"西紅\",\"六月)柿\",\"臭柿仔\",\"小金瓜\",\"洋柿(茄)子\",\"紅茄\",\"毛臘果\",\"Cherry tomato\",\"cherry tomato\",\"Solanum lycopersicum var. cerasiforme\"]', '蔬菜類', '自動生成: 綠番茄 ↔ Cherry tomato', 'Cherry tomato', '綠番茄');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1218', '[\"綠竹筍\",\"甜竹\",\"甜竹筍\",\"綠仔筍\",\"綠仔笋\",\"綠竹笋\",\"Bamboo shoots\",\"bamboo shoots\",\"Phyllostachys edulis\"]', '蔬菜類', '自動生成: 綠竹筍 ↔ Bamboo shoots', 'Bamboo shoots', '綠竹筍');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1219', '[\"綠胡椒粒\",\"Cubanelle pepper\",\"cubanelle pepper\"]', '調味料及香辛料類', '自動生成: 綠胡椒粒 ↔ Cubanelle pepper', 'Cubanelle pepper', '綠胡椒粒');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1220', '[\"綠茶\",\"Black tea\",\"black tea\"]', '飲料類', '自動生成: 綠茶 ↔ Black tea', 'Black tea', '綠茶');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1221', '[\"綠茶茶湯\",\"Black tea\",\"black tea\"]', '飲料類', '自動生成: 綠茶茶湯 ↔ Black tea', 'Black tea', '綠茶茶湯');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1222', '[\"綠葡萄平均值\",\"葡萄\",\"蒲桃\",\"蒲萄\",\"草龍珠\",\"蒲陶\",\"葡桃\",\"Common grape\",\"common grape\",\"Vitis vinifera\"]', '水果類', '自動生成: 綠葡萄平均值 ↔ Common grape', 'Common grape', '綠葡萄平均值');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1227', '[\"綠豆\",\"菉豆\",\"綠小豆\",\"輻莢豆\",\"Mung bean\",\"mung bean\",\"Vigna radiata\"]', '豆類', '自動生成: 綠豆 ↔ Mung bean', 'Mung bean', '綠豆');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1228', '[\"綠豆仁\",\"菉豆\",\"綠小豆\",\"輻莢豆\",\"Mung bean\",\"mung bean\",\"Vigna radiata\"]', '豆類', '自動生成: 綠豆仁 ↔ Mung bean', 'Mung bean', '綠豆仁');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1229', '[\"綠豆凸\",\"綠豆椪\",\"Mung bean\",\"mung bean\",\"Vigna radiata\"]', '糕餅點心類', '自動生成: 綠豆凸 ↔ Mung bean', 'Mung bean', '綠豆凸');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1230', '[\"綠豆球\",\"Mung bean\",\"mung bean\",\"Vigna radiata\"]', '糕餅點心類', '自動生成: 綠豆球 ↔ Mung bean', 'Mung bean', '綠豆球');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1231', '[\"綠豆粉\",\"菉豆\",\"綠小豆\",\"輻莢豆\",\"Mung bean\",\"mung bean\",\"Vigna radiata\"]', '豆類', '自動生成: 綠豆粉 ↔ Mung bean', 'Mung bean', '綠豆粉');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1232', '[\"綠豆芽\",\"豆芽菜\",\"豆菜\",\"綠豆菜\",\"Mung bean\",\"mung bean\",\"Vigna radiata\"]', '蔬菜類', '自動生成: 綠豆芽 ↔ Mung bean', 'Mung bean', '綠豆芽');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1233', '[\"維生素C口含錠(檸檬)\",\"維生素C口含錠\",\"Lemon\",\"lemon\",\"Citrus limon\"]', '糕餅點心類', '自動生成: 維生素C口含錠(檸檬) ↔ Lemon', 'Lemon', '維生素C口含錠(檸檬)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1236', '[\"維生素強化飲料(胡蘿蔔素)\",\"維生素強化飲料\",\"Carrot\",\"carrot\",\"Daucus carota ssp. sativus\"]', '飲料類', '自動生成: 維生素強化飲料(胡蘿蔔素) ↔ Carrot', 'Carrot', '維生素強化飲料(胡蘿蔔素)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1237', '[\"網紋龍占魚\",\"龍尖\",\"龍占(臺東)\",\"Alaska blackfish\",\"alaska blackfish\",\"Dallia pectoralis\"]', '魚貝類', '自動生成: 網紋龍占魚 ↔ Alaska blackfish', 'Alaska blackfish', '網紋龍占魚');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1238', '[\"綿羊肉切片\",\"Lambsquarters\",\"lambsquarters\",\"Chenopodium album\"]', '肉類', '自動生成: 綿羊肉切片 ↔ Lambsquarters', 'Lambsquarters', '綿羊肉切片');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1241', '[\"羅氏沼蝦\",\"泰國蝦\",\"泰國長臂大蝦\",\"淡水長臂大蝦\",\"Shrimp\",\"shrimp\",\"Caridea\"]', '魚貝類', '自動生成: 羅氏沼蝦 ↔ Shrimp', 'Shrimp', '羅氏沼蝦');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1244', '[\"羊肉爐醬\",\"Lambsquarters\",\"lambsquarters\",\"Chenopodium album\"]', '調味料及香辛料類', '自動生成: 羊肉爐醬 ↔ Lambsquarters', 'Lambsquarters', '羊肉爐醬');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1245', '[\"美國五爪蘋果\",\"柰\",\"林檎\",\"紅蘋果(元帥)\",\"Apple\",\"apple\",\"Malus pumila\"]', '水果類', '自動生成: 美國五爪蘋果 ↔ Apple', 'Apple', '美國五爪蘋果');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1246', '[\"美國紅葡萄\",\"蒲桃\",\"蒲萄\",\"草龍珠\",\"蒲陶\",\"葡桃\",\"Common grape\",\"common grape\",\"Vitis vinifera\"]', '水果類', '自動生成: 美國紅葡萄 ↔ Common grape', 'Common grape', '美國紅葡萄');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1247', '[\"美國紅葡萄(含皮)\",\"美國紅葡萄\",\"蒲桃\",\"蒲萄\",\"草龍珠\",\"蒲陶\",\"葡桃\",\"Common grape\",\"common grape\",\"Vitis vinifera\"]', '水果類', '自動生成: 美國紅葡萄(含皮) ↔ Common grape', 'Common grape', '美國紅葡萄(含皮)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1248', '[\"美國紫葡萄(含皮)\",\"美國紫葡萄\",\"蒲桃\",\"蒲萄\",\"草龍珠\",\"蒲陶\",\"葡桃\",\"Common grape\",\"common grape\",\"Vitis vinifera\"]', '水果類', '自動生成: 美國紫葡萄(含皮) ↔ Common grape', 'Common grape', '美國紫葡萄(含皮)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1249', '[\"美國綠葡萄\",\"蒲桃\",\"蒲萄\",\"草龍珠\",\"蒲陶\",\"葡桃(青葡萄\",\"白葡萄)\",\"Common grape\",\"common grape\",\"Vitis vinifera\"]', '水果類', '自動生成: 美國綠葡萄 ↔ Common grape', 'Common grape', '美國綠葡萄');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1250', '[\"美國綠葡萄(含皮)\",\"美國綠葡萄\",\"蒲桃\",\"蒲萄\",\"草龍珠\",\"蒲陶\",\"葡桃(青葡萄\",\"白葡萄)\",\"Common grape\",\"common grape\",\"Vitis vinifera\"]', '水果類', '自動生成: 美國綠葡萄(含皮) ↔ Common grape', 'Common grape', '美國綠葡萄(含皮)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1251', '[\"美國黑葡萄(含皮)\",\"美國黑葡萄\",\"蒲桃\",\"蒲萄\",\"草龍珠\",\"蒲陶\",\"葡桃\",\"Common grape\",\"common grape\",\"Vitis vinifera\"]', '水果類', '自動生成: 美國黑葡萄(含皮) ↔ Common grape', 'Common grape', '美國黑葡萄(含皮)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1252', '[\"美式咖啡(無糖)\",\"美式咖啡\",\"Arabica coffee\",\"arabica coffee\",\"Coffea arabica\"]', '飲料類', '自動生成: 美式咖啡(無糖) ↔ Arabica coffee', 'Arabica coffee', '美式咖啡(無糖)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1255', '[\"義式乳酪醬\",\"Blue cheese\",\"blue cheese\"]', '調味料及香辛料類', '自動生成: 義式乳酪醬 ↔ Blue cheese', 'Blue cheese', '義式乳酪醬');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1259', '[\"翠玉青蘋果\",\"柰\",\"林檎\",\"青蘋果(翡翠\",\"青玉\",\"史蜜斯)\",\"Apple\",\"apple\",\"Malus pumila\"]', '水果類', '自動生成: 翠玉青蘋果 ↔ Apple', 'Apple', '翠玉青蘋果');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1260', '[\"翠玉青蘋果(帶皮)\",\"翠玉青蘋果\",\"柰\",\"林檎\",\"青蘋果(翡翠\",\"青玉\",\"史蜜斯)\",\"Apple\",\"apple\",\"Malus pumila\"]', '水果類', '自動生成: 翠玉青蘋果(帶皮) ↔ Apple', 'Apple', '翠玉青蘋果(帶皮)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1263', '[\"翻車魨魚皮\",\"曼波魚皮\",\"翻車魚皮\",\"Alaska blackfish\",\"alaska blackfish\",\"Dallia pectoralis\"]', '魚貝類', '自動生成: 翻車魨魚皮 ↔ Alaska blackfish', 'Alaska blackfish', '翻車魨魚皮');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1265', '[\"老薑\",\"薑仔\",\"生薑\",\"生姜\",\"羌\",\"蘘荷\",\"茗荷\",\"甘露子\",\"紫薑\",\"Ginger\",\"ginger\",\"Zingiber officinale\"]', '蔬菜類', '自動生成: 老薑 ↔ Ginger', 'Ginger', '老薑');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1266', '[\"聖女小番茄\",\"柑(甘)仔蜜\",\"草(番\",\"西紅\",\"六月)柿\",\"臭柿仔\",\"小金瓜\",\"洋柿(茄)子\",\"紅茄\",\"毛臘果\",\"Cherry tomato\",\"cherry tomato\",\"Solanum lycopersicum var. cerasiforme\"]', '蔬菜類', '自動生成: 聖女小番茄 ↔ Cherry tomato', 'Cherry tomato', '聖女小番茄');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1267', '[\"聖心芒果\",\"檬果\",\"檨仔\",\"菴羅果\",\"Mango\",\"mango\",\"Mangifera indica\"]', '水果類', '自動生成: 聖心芒果 ↔ Mango', 'Mango', '聖心芒果');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1274', '[\"肉鬆麵包\",\"Breadfruit\",\"breadfruit\",\"Artocarpus altilis\"]', '糕餅點心類', '自動生成: 肉鬆麵包 ↔ Breadfruit', 'Breadfruit', '肉鬆麵包');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1275', '[\"肯特芒果\",\"檬果\",\"檨仔\",\"菴羅果\",\"Mango\",\"mango\",\"Mangifera indica\"]', '水果類', '自動生成: 肯特芒果 ↔ Mango', 'Mango', '肯特芒果');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1276', '[\"胚芽秈米(台中秈10號)\",\"胚芽秈米\",\"Annual wild rice\",\"annual wild rice\",\"Zizania aquatica\"]', '穀物類', '自動生成: 胚芽秈米(台中秈10號) ↔ Annual wild rice', 'Annual wild rice', '胚芽秈米(台中秈10號)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1277', '[\"胚芽稉米(台稉10號）\",\"Annual wild rice\",\"annual wild rice\",\"Zizania aquatica\"]', '穀物類', '自動生成: 胚芽稉米(台稉10號） ↔ Annual wild rice', 'Annual wild rice', '胚芽稉米(台稉10號）');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1278', '[\"胚芽稉米(台稉9號)\",\"胚芽稉米\",\"Annual wild rice\",\"annual wild rice\",\"Zizania aquatica\"]', '穀物類', '自動生成: 胚芽稉米(台稉9號) ↔ Annual wild rice', 'Annual wild rice', '胚芽稉米(台稉9號)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1279', '[\"胚芽稉米平均值\",\"Annual wild rice\",\"annual wild rice\",\"Zizania aquatica\"]', '穀物類', '自動生成: 胚芽稉米平均值 ↔ Annual wild rice', 'Annual wild rice', '胚芽稉米平均值');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1281', '[\"胡蘿蔔\",\"紅蘿蔔\",\"紅菜頭\",\"黃蘿蔔\",\"丁香蘿蔔\",\"人參\",\"金筍\",\"Carrot\",\"carrot\",\"Daucus carota ssp. sativus\"]', '蔬菜類', '自動生成: 胡蘿蔔 ↔ Carrot', 'Carrot', '胡蘿蔔');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1282', '[\"胡蘿蔔平均值\",\"紅蘿蔔\",\"紅菜頭\",\"黃蘿蔔\",\"丁香蘿蔔\",\"人參\",\"金筍\",\"Carrot\",\"carrot\",\"Daucus carota ssp. sativus\"]', '蔬菜類', '自動生成: 胡蘿蔔平均值 ↔ Carrot', 'Carrot', '胡蘿蔔平均值');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1283', '[\"胭脂蝦\",\"文蝦(\\\"葉狀擬鬚蝦或雄壯鬚蝦\\\")\",\"Shrimp\",\"shrimp\",\"Caridea\"]', '魚貝類', '自動生成: 胭脂蝦 ↔ Shrimp', 'Shrimp', '胭脂蝦');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1286', '[\"脫脂保久濃稠發酵乳(草莓&蘋果)\",\"脫脂保久濃稠發酵乳\",\"保久優酪乳\",\"Apple\",\"apple\",\"Malus pumila\"]', '乳品類', '自動生成: 脫脂保久濃稠發酵乳(草莓&蘋果) ↔ Apple', 'Apple', '脫脂保久濃稠發酵乳(草莓&蘋果)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1300', '[\"脫脂濃稠發酵乳(啤酒酵母)\",\"脫脂濃稠發酵乳\",\"優酪乳\",\"Beer\",\"beer\"]', '乳品類', '自動生成: 脫脂濃稠發酵乳(啤酒酵母) ↔ Beer', 'Beer', '脫脂濃稠發酵乳(啤酒酵母)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1301', '[\"脫脂濃稠發酵乳(草莓)\",\"脫脂濃稠發酵乳\",\"優酪乳\",\"Strawberry\",\"strawberry\",\"Fragaria X ananassa\"]', '乳品類', '自動生成: 脫脂濃稠發酵乳(草莓) ↔ Strawberry', 'Strawberry', '脫脂濃稠發酵乳(草莓)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1305', '[\"腰果(生)\",\"腰果\",\"Cashew nut\",\"cashew nut\",\"Anacardium occidentale\"]', '堅果及種子類', '自動生成: 腰果(生) ↔ Cashew nut', 'Cashew nut', '腰果(生)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1318', '[\"芒果乾\",\"Mango\",\"mango\",\"Mangifera indica\"]', '水果類', '自動生成: 芒果乾 ↔ Mango', 'Mango', '芒果乾');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1319', '[\"芒果平均值(新興種)\",\"芒果平均值\",\"檬果\",\"檨仔\",\"菴羅果\",\"Mango\",\"mango\",\"Mangifera indica\"]', '水果類', '自動生成: 芒果平均值(新興種) ↔ Mango', 'Mango', '芒果平均值(新興種)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1320', '[\"芒果平均值(西洋種)\",\"芒果平均值\",\"檬果\",\"檨仔\",\"菴羅果\",\"Mango\",\"mango\",\"Mangifera indica\"]', '水果類', '自動生成: 芒果平均值(西洋種) ↔ Mango', 'Mango', '芒果平均值(西洋種)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1321', '[\"芒果青\",\"Mango\",\"mango\",\"Mangifera indica\"]', '糕餅點心類', '自動生成: 芒果青 ↔ Mango', 'Mango', '芒果青');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1322', '[\"芝麻糊沖泡包\",\"Sesame\",\"sesame\",\"Sesamum orientale\"]', '加工調理食品及其他類', '自動生成: 芝麻糊沖泡包 ↔ Sesame', 'Sesame', '芝麻糊沖泡包');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1333', '[\"花尾唇指翁(翁加魚邊) \",\"花尾唇指翁\",\"咬破布\",\"三康\",\"金花\",\"萬年瘦\",\"瘦仔/蝨鬢(澎湖)\",\"Alaska blackfish\",\"alaska blackfish\",\"Dallia pectoralis\"]', '魚貝類', '自動生成: 花尾唇指翁(翁加魚邊)  ↔ Alaska blackfish', 'Alaska blackfish', '花尾唇指翁(翁加魚邊) ');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1337', '[\"花椰菜\",\"花菜\",\"菜花\",\"白花菜\",\"白菜花\",\"Broccoli\",\"broccoli\",\"Brassica oleracea var. italica\"]', '蔬菜類', '自動生成: 花椰菜 ↔ Broccoli', 'Broccoli', '花椰菜');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1338', '[\"花椰菜乾\",\"Broccoli\",\"broccoli\",\"Brassica oleracea var. italica\"]', '蔬菜類', '自動生成: 花椰菜乾 ↔ Broccoli', 'Broccoli', '花椰菜乾');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1340', '[\"花生仁湯\",\"Peanut\",\"peanut\",\"Arachis hypogaea\"]', '糕餅點心類', '自動生成: 花生仁湯 ↔ Peanut', 'Peanut', '花生仁湯');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1341', '[\"花生油\",\"Peanut oil\",\"peanut oil\"]', '油脂類', '自動生成: 花生油 ↔ Peanut oil', 'Peanut oil', '花生油');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1342', '[\"花生牛奶巧克力\",\"Almond milk\",\"almond milk\"]', '糕餅點心類', '自動生成: 花生牛奶巧克力 ↔ Almond milk', 'Almond milk', '花生牛奶巧克力');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1343', '[\"花生粉\",\"Peanut\",\"peanut\",\"Arachis hypogaea\"]', '堅果及種子類', '自動生成: 花生粉 ↔ Peanut', 'Peanut', '花生粉');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1344', '[\"花生糖\",\"Peanut\",\"peanut\",\"Arachis hypogaea\"]', '糕餅點心類', '自動生成: 花生糖 ↔ Peanut', 'Peanut', '花生糖');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1345', '[\"花生貢糖\",\"Peanut\",\"peanut\",\"Arachis hypogaea\"]', '糕餅點心類', '自動生成: 花生貢糖 ↔ Peanut', 'Peanut', '花生貢糖');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1346', '[\"花生醬\",\"Peanut\",\"peanut\",\"Arachis hypogaea\"]', '調味料及香辛料類', '自動生成: 花生醬 ↔ Peanut', 'Peanut', '花生醬');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1347', '[\"花生麵筋罐頭\",\"Peanut\",\"peanut\",\"Arachis hypogaea\"]', '加工調理食品及其他類', '自動生成: 花生麵筋罐頭 ↔ Peanut', 'Peanut', '花生麵筋罐頭');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1353', '[\"花豆罐頭(糖漬)\",\"花豆罐頭\",\"紅花豆\",\"紅(赤)花菜豆\",\"花仔(阿/柳)豆\",\"Sugar\",\"sugar\"]', '加工調理食品及其他類', '自動生成: 花豆罐頭(糖漬) ↔ Sugar', 'Sugar', '花豆罐頭(糖漬)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1354', '[\"花身副麗魚\",\"珍珠石斑\",\"淡水石斑\",\"馬拉麗體魚\",\"Alaska blackfish\",\"alaska blackfish\",\"Dallia pectoralis\"]', '魚貝類', '自動生成: 花身副麗魚 ↔ Alaska blackfish', 'Alaska blackfish', '花身副麗魚');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1356', '[\"芹菜\",\"旱芹\",\"藥芹\",\"洋芹\",\"白芹\",\"塘蒿\",\"和蘭鴨兒芹\",\"Celery leaves\",\"celery leaves\",\"Apium graveolens var. secalinum\"]', '蔬菜類', '自動生成: 芹菜 ↔ Celery leaves', 'Celery leaves', '芹菜');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1357', '[\"芹菜(青梗)\",\"芹菜\",\"旱芹\",\"藥芹\",\"洋芹\",\"白芹\",\"塘蒿\",\"和蘭鴨兒芹\",\"Celery leaves\",\"celery leaves\",\"Apium graveolens var. secalinum\"]', '蔬菜類', '自動生成: 芹菜(青梗) ↔ Celery leaves', 'Celery leaves', '芹菜(青梗)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1358', '[\"芹菜平均值\",\"旱芹\",\"藥芹\",\"洋芹\",\"白芹\",\"塘蒿\",\"和蘭鴨兒芹\",\"Celery leaves\",\"celery leaves\",\"Apium graveolens var. secalinum\"]', '蔬菜類', '自動生成: 芹菜平均值 ↔ Celery leaves', 'Celery leaves', '芹菜平均值');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1362', '[\"苦茶糖\",\"Black tea\",\"black tea\"]', '糕餅點心類', '自動生成: 苦茶糖 ↔ Black tea', 'Black tea', '苦茶糖');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1365', '[\"茄汁鯖魚罐頭\",\"Atlantic mackerel\",\"atlantic mackerel\",\"Scomber scombrus\"]', '加工調理食品及其他類', '自動生成: 茄汁鯖魚罐頭 ↔ Atlantic mackerel', 'Atlantic mackerel', '茄汁鯖魚罐頭');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1366', '[\"茉莉花茶\",\"Black tea\",\"black tea\"]', '飲料類', '自動生成: 茉莉花茶 ↔ Black tea', 'Black tea', '茉莉花茶');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1367', '[\"茉莉花茶湯\",\"香片\",\"Black tea\",\"black tea\"]', '飲料類', '自動生成: 茉莉花茶湯 ↔ Black tea', 'Black tea', '茉莉花茶湯');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1370', '[\"茶葉蛋(市售)\",\"茶葉蛋\",\"Egg roll\",\"egg roll\"]', '蛋類', '自動生成: 茶葉蛋(市售) ↔ Egg roll', 'Egg roll', '茶葉蛋(市售)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1371', '[\"茶葉蛋(浸泡隔夜)\",\"茶葉蛋\",\"Egg roll\",\"egg roll\"]', '蛋類', '自動生成: 茶葉蛋(浸泡隔夜) ↔ Egg roll', 'Egg roll', '茶葉蛋(浸泡隔夜)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1372', '[\"茶葉蛋平均值\",\"Egg roll\",\"egg roll\"]', '蛋類', '自動生成: 茶葉蛋平均值 ↔ Egg roll', 'Egg roll', '茶葉蛋平均值');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1373', '[\"茶葉蛋白(浸泡隔夜)\",\"茶葉蛋白\",\"Egg roll\",\"egg roll\"]', '蛋類', '自動生成: 茶葉蛋白(浸泡隔夜) ↔ Egg roll', 'Egg roll', '茶葉蛋白(浸泡隔夜)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1374', '[\"茶葉蛋黃(浸泡隔夜)\",\"茶葉蛋黃\",\"Egg roll\",\"egg roll\"]', '蛋類', '自動生成: 茶葉蛋黃(浸泡隔夜) ↔ Egg roll', 'Egg roll', '茶葉蛋黃(浸泡隔夜)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1375', '[\"茶鵝\",\"Black tea\",\"black tea\"]', '加工調理食品及其他類', '自動生成: 茶鵝 ↔ Black tea', 'Black tea', '茶鵝');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1377', '[\"草對蝦\",\"草蝦;烏斑節仔\",\"Shrimp\",\"shrimp\",\"Caridea\"]', '魚貝類', '自動生成: 草對蝦 ↔ Shrimp', 'Shrimp', '草對蝦');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1379', '[\"草莓\",\"Strawberry\",\"strawberry\",\"Fragaria X ananassa\"]', '水果類', '自動生成: 草莓 ↔ Strawberry', 'Strawberry', '草莓');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1380', '[\"草莓果醬\",\"Strawberry\",\"strawberry\",\"Fragaria X ananassa\"]', '調味料及香辛料類', '自動生成: 草莓果醬 ↔ Strawberry', 'Strawberry', '草莓果醬');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1383', '[\"草蝦仁\",\"Shrimp\",\"shrimp\",\"Caridea\"]', '魚貝類', '自動生成: 草蝦仁 ↔ Shrimp', 'Shrimp', '草蝦仁');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1384', '[\"草魚(含皮)\",\"草魚\",\"鯇\",\"鯤\",\"池魚\",\"草根魚\",\"草鰱(高屏地區)\",\"Alaska blackfish\",\"alaska blackfish\",\"Dallia pectoralis\"]', '魚貝類', '自動生成: 草魚(含皮) ↔ Alaska blackfish', 'Alaska blackfish', '草魚(含皮)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1385', '[\"草魚切片\",\"鯇\",\"鯤\",\"池魚\",\"草根魚\",\"草鰱(高屏地區)\",\"Alaska blackfish\",\"alaska blackfish\",\"Dallia pectoralis\"]', '魚貝類', '自動生成: 草魚切片 ↔ Alaska blackfish', 'Alaska blackfish', '草魚切片');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1388', '[\"荷包蛋(不加油)\",\"荷包蛋\",\"Egg roll\",\"egg roll\"]', '蛋類', '自動生成: 荷包蛋(不加油) ↔ Egg roll', 'Egg roll', '荷包蛋(不加油)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1389', '[\"荷包蛋(加油1小匙)\",\"荷包蛋\",\"Egg roll\",\"egg roll\"]', '蛋類', '自動生成: 荷包蛋(加油1小匙) ↔ Egg roll', 'Egg roll', '荷包蛋(加油1小匙)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1395', '[\"菊花南瓜\",\"金瓜\",\"飯瓜\",\"番(翻)瓜\",\"倭(窩)瓜\",\"紅(冬/西洋)南瓜\",\"南瓜\",\"北瓜\",\"玉瓜\",\"筍瓜\",\"Japanese pumpkin\",\"japanese pumpkin\",\"Cucurbita maxima\"]', '蔬菜類', '自動生成: 菊花南瓜 ↔ Japanese pumpkin', 'Japanese pumpkin', '菊花南瓜');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1396', '[\"菊花茶\",\"Black tea\",\"black tea\"]', '飲料類', '自動生成: 菊花茶 ↔ Black tea', 'Black tea', '菊花茶');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1397', '[\"菠菜\",\"菠菱菜\",\"赤根菜\",\"飛龍菜\",\"角菜\",\"波斯草\",\"波斯菜\",\"波菱菜\",\"Malabar spinach\",\"malabar spinach\",\"Basella alba\"]', '蔬菜類', '自動生成: 菠菜 ↔ Malabar spinach', 'Malabar spinach', '菠菜');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1398', '[\"菠菜(葉)(有機)\",\"菠菜\",\"菠菱菜\",\"赤根菜\",\"飛龍菜\",\"角菜\",\"波斯草\",\"波斯菜\",\"波菱菜\",\"Malabar spinach\",\"malabar spinach\",\"Basella alba\"]', '蔬菜類', '自動生成: 菠菜(葉)(有機) ↔ Malabar spinach', 'Malabar spinach', '菠菜(葉)(有機)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1399', '[\"菠菜麵\",\"Malabar spinach\",\"malabar spinach\",\"Basella alba\"]', '加工調理食品及其他類', '自動生成: 菠菜麵 ↔ Malabar spinach', 'Malabar spinach', '菠菜麵');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1401', '[\"菠蘿麵包\",\"Breadfruit\",\"breadfruit\",\"Artocarpus altilis\"]', '糕餅點心類', '自動生成: 菠蘿麵包 ↔ Breadfruit', 'Breadfruit', '菠蘿麵包');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1402', '[\"華寶大西瓜(花蓮)\",\"華寶大西瓜\",\"水瓜\",\"寒瓜\",\"夏瓜\",\"Watermelon\",\"watermelon\",\"Citrullus lanatus\"]', '水果類', '自動生成: 華寶大西瓜(花蓮) ↔ Watermelon', 'Watermelon', '華寶大西瓜(花蓮)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1407', '[\"菱角牛奶甘藷\",\"甘薯\",\"番薯\",\"甜薯\",\"地瓜\",\"田薯\",\"土薯\",\"白薯\",\"Almond milk\",\"almond milk\"]', '澱粉類', '自動生成: 菱角牛奶甘藷 ↔ Almond milk', 'Almond milk', '菱角牛奶甘藷');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1410', '[\"萊姆\",\"無子檸檬\",\"Lime\",\"lime\",\"Citrus aurantiifolia\"]', '水果類', '自動生成: 萊姆 ↔ Lime', 'Lime', '萊姆');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1411', '[\"萊姆汁\",\"無子檸檬\",\"Lime\",\"lime\",\"Citrus aurantiifolia\"]', '水果類', '自動生成: 萊姆汁 ↔ Lime', 'Lime', '萊姆汁');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1416', '[\"葛仙米藻\",\"雨來菇\",\"地木耳\",\"地軟兒\",\"地皮菜\",\"草皮菇\",\"情人的眼淚\",\"Annual wild rice\",\"annual wild rice\",\"Zizania aquatica\"]', '藻類', '自動生成: 葛仙米藻 ↔ Annual wild rice', 'Annual wild rice', '葛仙米藻');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1417', '[\"葡萄乾\",\"Common grape\",\"common grape\",\"Vitis vinifera\"]', '水果類', '自動生成: 葡萄乾 ↔ Common grape', 'Common grape', '葡萄乾');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1418', '[\"葡萄乾奶酥麵包\",\"Common grape\",\"common grape\",\"Vitis vinifera\"]', '糕餅點心類', '自動生成: 葡萄乾奶酥麵包 ↔ Common grape', 'Common grape', '葡萄乾奶酥麵包');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1419', '[\"葡萄果醬\",\"Common grape\",\"common grape\",\"Vitis vinifera\"]', '調味料及香辛料類', '自動生成: 葡萄果醬 ↔ Common grape', 'Common grape', '葡萄果醬');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1420', '[\"葡萄柚汁(非原汁)\",\"葡萄柚汁\",\"Common grape\",\"common grape\",\"Vitis vinifera\"]', '飲料類', '自動生成: 葡萄柚汁(非原汁) ↔ Common grape', 'Common grape', '葡萄柚汁(非原汁)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1421', '[\"葡萄籽油\",\"Common grape\",\"common grape\",\"Vitis vinifera\"]', '油脂類', '自動生成: 葡萄籽油 ↔ Common grape', 'Common grape', '葡萄籽油');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1434', '[\"蒟蒻香腸(蒜味)\",\"蒟蒻香腸\",\"Sausage\",\"sausage\"]', '加工調理食品及其他類', '自動生成: 蒟蒻香腸(蒜味) ↔ Sausage', 'Sausage', '蒟蒻香腸(蒜味)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1439', '[\"蒸蛋(市售)\",\"蒸蛋\",\"芙蓉豆腐\",\"Egg roll\",\"egg roll\"]', '蛋類', '自動生成: 蒸蛋(市售) ↔ Egg roll', 'Egg roll', '蒸蛋(市售)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1440', '[\"蒸蛋(微波爐)\",\"蒸蛋\",\"Egg roll\",\"egg roll\"]', '蛋類', '自動生成: 蒸蛋(微波爐) ↔ Egg roll', 'Egg roll', '蒸蛋(微波爐)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1441', '[\"蒸蛋(電鍋)\",\"蒸蛋\",\"Egg roll\",\"egg roll\"]', '蛋類', '自動生成: 蒸蛋(電鍋) ↔ Egg roll', 'Egg roll', '蒸蛋(電鍋)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1442', '[\"蒸蛋平均值\",\"Egg roll\",\"egg roll\"]', '蛋類', '自動生成: 蒸蛋平均值 ↔ Egg roll', 'Egg roll', '蒸蛋平均值');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1445', '[\"蓮花芒果\",\"檬果\",\"檨仔\",\"菴羅果\",\"Mango\",\"mango\",\"Mangifera indica\"]', '水果類', '自動生成: 蓮花芒果 ↔ Mango', 'Mango', '蓮花芒果');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1448', '[\"蓮藕糖\",\"Sugar\",\"sugar\"]', '糕餅點心類', '自動生成: 蓮藕糖 ↔ Sugar', 'Sugar', '蓮藕糖');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1458', '[\"蕃茄義大利麵醬\",\"Other pasta dish\",\"other pasta dish\"]', '調味料及香辛料類', '自動生成: 蕃茄義大利麵醬 ↔ Other pasta dish', 'Other pasta dish', '蕃茄義大利麵醬');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1477', '[\"薄鹽醬油(低鈉)\",\"薄鹽醬油\",\"低鹽醬油\",\"Salt\",\"salt\"]', '調味料及香辛料類', '自動生成: 薄鹽醬油(低鈉) ↔ Salt', 'Salt', '薄鹽醬油(低鈉)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1478', '[\"薄鹽醬油(低鈉高鉀)\",\"薄鹽醬油\",\"Salt\",\"salt\"]', '調味料及香辛料類', '自動生成: 薄鹽醬油(低鈉高鉀) ↔ Salt', 'Salt', '薄鹽醬油(低鈉高鉀)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1479', '[\"薄鹽黑豆醬油膏\",\"Salt\",\"salt\"]', '調味料及香辛料類', '自動生成: 薄鹽黑豆醬油膏 ↔ Salt', 'Salt', '薄鹽黑豆醬油膏');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1482', '[\"薏仁醋\",\"Vinegar\",\"vinegar\"]', '調味料及香辛料類', '自動生成: 薏仁醋 ↔ Vinegar', 'Vinegar', '薏仁醋');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1483', '[\"薏仁醬油\",\"Soy sauce\",\"soy sauce\"]', '調味料及香辛料類', '自動生成: 薏仁醬油 ↔ Soy sauce', 'Soy sauce', '薏仁醬油');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1484', '[\"薑母茶\",\"Ginger\",\"ginger\",\"Zingiber officinale\"]', '飲料類', '自動生成: 薑母茶 ↔ Ginger', 'Ginger', '薑母茶');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1485', '[\"薑粉\",\"Ginger\",\"ginger\",\"Zingiber officinale\"]', '調味料及香辛料類', '自動生成: 薑粉 ↔ Ginger', 'Ginger', '薑粉');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1486', '[\"薑糖\",\"Ginger\",\"ginger\",\"Zingiber officinale\"]', '糕餅點心類', '自動生成: 薑糖 ↔ Ginger', 'Ginger', '薑糖');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1487', '[\"薑茶沖泡包\",\"Ginger\",\"ginger\",\"Zingiber officinale\"]', '飲料類', '自動生成: 薑茶沖泡包 ↔ Ginger', 'Ginger', '薑茶沖泡包');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1488', '[\"薑蓉醬\",\"Ginger\",\"ginger\",\"Zingiber officinale\"]', '調味料及香辛料類', '自動生成: 薑蓉醬 ↔ Ginger', 'Ginger', '薑蓉醬');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1489', '[\"薑黃粉\",\"Ginger\",\"ginger\",\"Zingiber officinale\"]', '調味料及香辛料類', '自動生成: 薑黃粉 ↔ Ginger', 'Ginger', '薑黃粉');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1490', '[\"薔薇項鰭魚(去皮)\",\"薔薇項鰭魚\",\"薔薇連鰭唇魚\",\"扁礫仔\",\"紅姑娘仔\",\"紅新娘\",\"豎停仔\",\"胭脂冷\",\"角龍\",\"平倍良\",\"薔薇楔鯛\",\"薔薇離鰭鯛\",\"薔薇虹彩\",\"Alaska blackfish\",\"alaska blackfish\",\"Dallia pectoralis\"]', '魚貝類', '自動生成: 薔薇項鰭魚(去皮) ↔ Alaska blackfish', 'Alaska blackfish', '薔薇項鰭魚(去皮)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1491', '[\"薔薇項鰭魚(含皮)\",\"薔薇項鰭魚\",\"薔薇連鰭唇魚\",\"扁礫仔\",\"紅姑娘仔\",\"紅新娘\",\"豎停仔\",\"胭脂冷\",\"角龍\",\"平倍良\",\"薔薇楔鯛\",\"薔薇離鰭鯛\",\"薔薇虹彩\",\"Alaska blackfish\",\"alaska blackfish\",\"Dallia pectoralis\"]', '魚貝類', '自動生成: 薔薇項鰭魚(含皮) ↔ Alaska blackfish', 'Alaska blackfish', '薔薇項鰭魚(含皮)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1495', '[\"藍對蝦\",\"藍蝦\",\"Shrimp\",\"shrimp\",\"Caridea\"]', '魚貝類', '自動生成: 藍對蝦 ↔ Shrimp', 'Shrimp', '藍對蝦');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1497', '[\"藍豬齒魚\",\"石老\",\"四齒仔\",\"西齒\",\"簾仔\",\"寒鯛\",\"鰱仔(澎湖)\",\"Alaska blackfish\",\"alaska blackfish\",\"Dallia pectoralis\"]', '魚貝類', '自動生成: 藍豬齒魚 ↔ Alaska blackfish', 'Alaska blackfish', '藍豬齒魚');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1498', '[\"藍點鸚哥魚\",\"鸚哥\",\"黃衣魚\",\"青衫(雄)\",\"紅蠔魚(雌)\",\"紅衫\",\"蠔魚(雌)(澎湖)\",\"Alaska blackfish\",\"alaska blackfish\",\"Dallia pectoralis\"]', '魚貝類', '自動生成: 藍點鸚哥魚 ↔ Alaska blackfish', 'Alaska blackfish', '藍點鸚哥魚');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1504', '[\"蘋果平均值(混色)\",\"蘋果平均值\",\"柰\",\"林檎\",\"Apple\",\"apple\",\"Malus pumila\"]', '水果類', '自動生成: 蘋果平均值(混色) ↔ Apple', 'Apple', '蘋果平均值(混色)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1505', '[\"蘋果平均值(青皮)\",\"蘋果平均值\",\"柰\",\"林檎\",\"Apple\",\"apple\",\"Malus pumila\"]', '水果類', '自動生成: 蘋果平均值(青皮) ↔ Apple', 'Apple', '蘋果平均值(青皮)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1506', '[\"蘋果汁(100%)\",\"蘋果汁\",\"Apple\",\"apple\",\"Malus pumila\"]', '飲料類', '自動生成: 蘋果汁(100%) ↔ Apple', 'Apple', '蘋果汁(100%)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1507', '[\"蘋果汁(非原汁)\",\"蘋果汁\",\"Apple\",\"apple\",\"Malus pumila\"]', '飲料類', '自動生成: 蘋果汁(非原汁) ↔ Apple', 'Apple', '蘋果汁(非原汁)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1510', '[\"蘿蔔乾\",\"菜脯乾\",\"菜脯\",\"Black radish\",\"black radish\",\"Raphanus sativus var. niger\"]', '蔬菜類', '自動生成: 蘿蔔乾 ↔ Black radish', 'Black radish', '蘿蔔乾');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1511', '[\"蘿蔔芽\",\"蘿蔔嬰\",\"菜頭嬰(苗/芽)\",\"菜頭苗\",\"貝芽菜\",\"Black radish\",\"black radish\",\"Raphanus sativus var. niger\"]', '蔬菜類', '自動生成: 蘿蔔芽 ↔ Black radish', 'Black radish', '蘿蔔芽');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1512', '[\"蘿蔔葉\",\"葉蘿蔔\",\"Black radish\",\"black radish\",\"Raphanus sativus var. niger\"]', '蔬菜類', '自動生成: 蘿蔔葉 ↔ Black radish', 'Black radish', '蘿蔔葉');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1513', '[\"蘿蔔酥\",\"Black radish\",\"black radish\",\"Raphanus sativus var. niger\"]', '糕餅點心類', '自動生成: 蘿蔔酥 ↔ Black radish', 'Black radish', '蘿蔔酥');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1515', '[\"虱目魚(12月)\",\"虱目魚\",\"海草魚\",\"遮目魚\",\"殺目魚\",\"安平魚\",\"國姓魚\",\"麻虱目仔\",\"虱目/麻虱目(澎湖)\",\"Alaska blackfish\",\"alaska blackfish\",\"Dallia pectoralis\"]', '魚貝類', '自動生成: 虱目魚(12月) ↔ Alaska blackfish', 'Alaska blackfish', '虱目魚(12月)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1516', '[\"虱目魚(2022年取樣)\",\"虱目魚\",\"海草魚\",\"遮目魚\",\"殺目魚\",\"安平魚\",\"國姓魚\",\"麻虱目仔\",\"虱目/麻虱目(澎湖)\",\"Alaska blackfish\",\"alaska blackfish\",\"Dallia pectoralis\"]', '魚貝類', '自動生成: 虱目魚(2022年取樣) ↔ Alaska blackfish', 'Alaska blackfish', '虱目魚(2022年取樣)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1517', '[\"虱目魚(2月)\",\"虱目魚\",\"海草魚\",\"遮目魚\",\"殺目魚\",\"安平魚\",\"國姓魚\",\"麻虱目仔\",\"虱目/麻虱目(澎湖)\",\"Alaska blackfish\",\"alaska blackfish\",\"Dallia pectoralis\"]', '魚貝類', '自動生成: 虱目魚(2月) ↔ Alaska blackfish', 'Alaska blackfish', '虱目魚(2月)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1518', '[\"虱目魚(5月)\",\"虱目魚\",\"海草魚\",\"遮目魚\",\"殺目魚\",\"安平魚\",\"國姓魚\",\"麻虱目仔\",\"虱目/麻虱目(澎湖)\",\"Alaska blackfish\",\"alaska blackfish\",\"Dallia pectoralis\"]', '魚貝類', '自動生成: 虱目魚(5月) ↔ Alaska blackfish', 'Alaska blackfish', '虱目魚(5月)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1519', '[\"虱目魚(8月)\",\"虱目魚\",\"海草魚\",\"遮目魚\",\"殺目魚\",\"安平魚\",\"國姓魚\",\"麻虱目仔\",\"虱目/麻虱目(澎湖)\",\"Alaska blackfish\",\"alaska blackfish\",\"Dallia pectoralis\"]', '魚貝類', '自動生成: 虱目魚(8月) ↔ Alaska blackfish', 'Alaska blackfish', '虱目魚(8月)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1520', '[\"虱目魚(9月)\",\"虱目魚\",\"海草魚\",\"遮目魚\",\"殺目魚\",\"安平魚\",\"國姓魚\",\"麻虱目仔\",\"虱目/麻虱目(澎湖)\",\"Alaska blackfish\",\"alaska blackfish\",\"Dallia pectoralis\"]', '魚貝類', '自動生成: 虱目魚(9月) ↔ Alaska blackfish', 'Alaska blackfish', '虱目魚(9月)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1521', '[\"虱目魚(含皮)\",\"虱目魚\",\"海草魚\",\"遮目魚\",\"殺目魚\",\"安平魚\",\"國姓魚\",\"麻虱目仔\",\"虱目/麻虱目(澎湖)\",\"Alaska blackfish\",\"alaska blackfish\",\"Dallia pectoralis\"]', '魚貝類', '自動生成: 虱目魚(含皮) ↔ Alaska blackfish', 'Alaska blackfish', '虱目魚(含皮)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1522', '[\"虱目魚平均值(去皮)\",\"虱目魚平均值\",\"麻虱目仔\",\"麻虱(蝨)目\",\"蝨(遮/塞)目魚\",\"虱麻魚\",\"海草魚\",\"安平魚\",\"國姓(聖)魚\",\"Alaska blackfish\",\"alaska blackfish\",\"Dallia pectoralis\"]', '魚貝類', '自動生成: 虱目魚平均值(去皮) ↔ Alaska blackfish', 'Alaska blackfish', '虱目魚平均值(去皮)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1523', '[\"虱目魚腹肉(虱目魚肚)\",\"虱目魚腹肉\",\"Alaska blackfish\",\"alaska blackfish\",\"Dallia pectoralis\"]', '魚貝類', '自動生成: 虱目魚腹肉(虱目魚肚) ↔ Alaska blackfish', 'Alaska blackfish', '虱目魚腹肉(虱目魚肚)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1524', '[\"蚵仔煎\",\"Bivalvia (Clam, Mussel, Oyster)\",\"bivalvia (clam, mussel, oyster)\",\"Bivalvia\"]', '加工調理食品及其他類', '自動生成: 蚵仔煎 ↔ Bivalvia (Clam, Mussel, Oyster)', 'Bivalvia (Clam, Mussel, Oyster)', '蚵仔煎');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1525', '[\"蚵仔白菜(2022年取樣)\",\"蚵仔白菜\",\"白菜\",\"青菜\",\"散葉白菜\",\"無心菜\",\"菘\",\"不結球白菜\",\"尼龍白菜\",\"皺(碎/曲)葉白菜\",\"皺葉中蕓苔\",\"Bivalvia (Clam, Mussel, Oyster)\",\"bivalvia (clam, mussel, oyster)\",\"Bivalvia\"]', '蔬菜類', '自動生成: 蚵仔白菜(2022年取樣) ↔ Bivalvia (Clam, Mussel, Oyster)', 'Bivalvia (Clam, Mussel, Oyster)', '蚵仔白菜(2022年取樣)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1527', '[\"蛋塔\",\"Egg roll\",\"egg roll\"]', '糕餅點心類', '自動生成: 蛋塔 ↔ Egg roll', 'Egg roll', '蛋塔');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1528', '[\"蛋塔(葡式)\",\"蛋塔\",\"Egg roll\",\"egg roll\"]', '糕餅點心類', '自動生成: 蛋塔(葡式) ↔ Egg roll', 'Egg roll', '蛋塔(葡式)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1529', '[\"蛋捲(芝麻)\",\"蛋捲\",\"Egg roll\",\"egg roll\"]', '糕餅點心類', '自動生成: 蛋捲(芝麻) ↔ Egg roll', 'Egg roll', '蛋捲(芝麻)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1530', '[\"蛋蕉(2023年取樣)\",\"蛋蕉\",\"旦蕉\",\"一口蕉\",\"Egg roll\",\"egg roll\"]', '水果類', '自動生成: 蛋蕉(2023年取樣) ↔ Egg roll', 'Egg roll', '蛋蕉(2023年取樣)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1531', '[\"蛋酥花生仁\",\"土豆\",\"長生果\",\"落花生\",\"Egg roll\",\"egg roll\"]', '加工調理食品及其他類', '自動生成: 蛋酥花生仁 ↔ Egg roll', 'Egg roll', '蛋酥花生仁');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1532', '[\"蛋黃果\",\"仙桃\",\"Egg roll\",\"egg roll\"]', '水果類', '自動生成: 蛋黃果 ↔ Egg roll', 'Egg roll', '蛋黃果');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1533', '[\"蛋黃芋頭酥\",\"Egg roll\",\"egg roll\"]', '糕餅點心類', '自動生成: 蛋黃芋頭酥 ↔ Egg roll', 'Egg roll', '蛋黃芋頭酥');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1534', '[\"蛋黃酥\",\"Egg roll\",\"egg roll\"]', '糕餅點心類', '自動生成: 蛋黃酥 ↔ Egg roll', 'Egg roll', '蛋黃酥');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1538', '[\"蜂蜜蛋糕(原味)\",\"蜂蜜蛋糕\",\"Egg roll\",\"egg roll\"]', '糕餅點心類', '自動生成: 蜂蜜蛋糕(原味) ↔ Egg roll', 'Egg roll', '蜂蜜蛋糕(原味)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1539', '[\"蜂蜜蛋糕(巧克力)\",\"蜂蜜蛋糕\",\"Egg roll\",\"egg roll\"]', '糕餅點心類', '自動生成: 蜂蜜蛋糕(巧克力) ↔ Egg roll', 'Egg roll', '蜂蜜蛋糕(巧克力)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1540', '[\"蜂蜜蛋糕(起司)\",\"蜂蜜蛋糕\",\"Blue cheese\",\"blue cheese\"]', '糕餅點心類', '自動生成: 蜂蜜蛋糕(起司) ↔ Blue cheese', 'Blue cheese', '蜂蜜蛋糕(起司)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1546', '[\"蜜汁松子仁\",\"Pine nut\",\"pine nut\",\"Pinus\"]', '加工調理食品及其他類', '自動生成: 蜜汁松子仁 ↔ Pine nut', 'Pine nut', '蜜汁松子仁');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1547', '[\"蜜汁腰果\",\"Cashew nut\",\"cashew nut\",\"Anacardium occidentale\"]', '加工調理食品及其他類', '自動生成: 蜜汁腰果 ↔ Cashew nut', 'Cashew nut', '蜜汁腰果');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1548', '[\"蜜糖甜甜圈(波/摩堤)\",\"蜜糖甜甜圈\",\"波(摩)堤\",\"Sugar\",\"sugar\"]', '糕餅點心類', '自動生成: 蜜糖甜甜圈(波/摩堤) ↔ Sugar', 'Sugar', '蜜糖甜甜圈(波/摩堤)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1549', '[\"蝦夷海扇蛤\",\"扇貝\",\"立帆蛤\",\"帆立貝\",\"Shrimp\",\"shrimp\",\"Caridea\"]', '魚貝類', '自動生成: 蝦夷海扇蛤 ↔ Shrimp', 'Shrimp', '蝦夷海扇蛤');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1550', '[\"蝦油\",\"Shrimp\",\"shrimp\",\"Caridea\"]', '調味料及香辛料類', '自動生成: 蝦油 ↔ Shrimp', 'Shrimp', '蝦油');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1551', '[\"蝦皮\",\"Shrimp\",\"shrimp\",\"Caridea\"]', '魚貝類', '自動生成: 蝦皮 ↔ Shrimp', 'Shrimp', '蝦皮');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1552', '[\"蝦米\",\"Shrimp\",\"shrimp\",\"Caridea\"]', '魚貝類', '自動生成: 蝦米 ↔ Shrimp', 'Shrimp', '蝦米');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1553', '[\"蝦醬\",\"Shrimp\",\"shrimp\",\"Caridea\"]', '調味料及香辛料類', '自動生成: 蝦醬 ↔ Shrimp', 'Shrimp', '蝦醬');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1554', '[\"蝸牛肉\",\"Beefalo\",\"beefalo\",\"Bos taurus X Bison bison\"]', '魚貝類', '自動生成: 蝸牛肉 ↔ Beefalo', 'Beefalo', '蝸牛肉');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1555', '[\"螳螂蝦\",\"蝦蛄\",\"蝦猴\",\"蝦姑仔\",\"攋尿蝦(常誤寫為瀨或賴)\",\"Shrimp\",\"shrimp\",\"Caridea\"]', '魚貝類', '自動生成: 螳螂蝦 ↔ Shrimp', 'Shrimp', '螳螂蝦');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1564', '[\"褐臭肚魚\",\"臭肚\",\"象魚\",\"樹魚\",\"羊鍋\",\"疏網\",\"茄冬仔\",\"象耳/臭肚仔/羊矮仔/盧矮仔(澎湖)\",\"Alaska blackfish\",\"alaska blackfish\",\"Dallia pectoralis\"]', '魚貝類', '自動生成: 褐臭肚魚 ↔ Alaska blackfish', 'Alaska blackfish', '褐臭肚魚');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1571', '[\"西洋芹菜\",\"美國芹菜\",\"洋芹菜\",\"金白芹菜\",\"巨無霸芹菜\",\"Celery leaves\",\"celery leaves\",\"Apium graveolens var. secalinum\"]', '蔬菜類', '自動生成: 西洋芹菜 ↔ Celery leaves', 'Celery leaves', '西洋芹菜');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1572', '[\"西洋芹菜片\",\"Celery leaves\",\"celery leaves\",\"Apium graveolens var. secalinum\"]', '調味料及香辛料類', '自動生成: 西洋芹菜片 ↔ Celery leaves', 'Celery leaves', '西洋芹菜片');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1573', '[\"西瓜平均值(紅肉小瓜)\",\"西瓜平均值\",\"水瓜\",\"寒瓜\",\"夏瓜\",\"Watermelon\",\"watermelon\",\"Citrullus lanatus\"]', '水果類', '自動生成: 西瓜平均值(紅肉小瓜) ↔ Watermelon', 'Watermelon', '西瓜平均值(紅肉小瓜)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1574', '[\"西瓜平均值(黃肉小瓜)\",\"西瓜平均值\",\"水瓜\",\"寒瓜\",\"夏瓜\",\"Watermelon\",\"watermelon\",\"Citrullus lanatus\"]', '水果類', '自動生成: 西瓜平均值(黃肉小瓜) ↔ Watermelon', 'Watermelon', '西瓜平均值(黃肉小瓜)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1575', '[\"西瓜汁(非原汁)\",\"西瓜汁\",\"Watermelon\",\"watermelon\",\"Citrullus lanatus\"]', '飲料類', '自動生成: 西瓜汁(非原汁) ↔ Watermelon', 'Watermelon', '西瓜汁(非原汁)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1576', '[\"西谷米\",\"Annual wild rice\",\"annual wild rice\",\"Zizania aquatica\"]', '加工調理食品及其他類', '自動生成: 西谷米 ↔ Annual wild rice', 'Annual wild rice', '西谷米');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1578', '[\"試交二號小番茄\",\"柑(甘)仔蜜\",\"草(番\",\"西紅\",\"六月)柿\",\"臭柿仔\",\"小金瓜\",\"洋柿(茄)子\",\"紅茄\",\"毛臘果\",\"Cherry tomato\",\"cherry tomato\",\"Solanum lycopersicum var. cerasiforme\"]', '蔬菜類', '自動生成: 試交二號小番茄 ↔ Cherry tomato', 'Cherry tomato', '試交二號小番茄');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1580', '[\"調合芝麻油\",\"Sesame oil\",\"sesame oil\"]', '油脂類', '自動生成: 調合芝麻油 ↔ Sesame oil', 'Sesame oil', '調合芝麻油');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1581', '[\"調合花生油\",\"Peanut oil\",\"peanut oil\"]', '油脂類', '自動生成: 調合花生油 ↔ Peanut oil', 'Peanut oil', '調合花生油');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1582', '[\"調味南瓜子(去殼)\",\"調味南瓜子\",\"白瓜子\",\"Japanese pumpkin\",\"japanese pumpkin\",\"Cucurbita maxima\"]', '加工調理食品及其他類', '自動生成: 調味南瓜子(去殼) ↔ Japanese pumpkin', 'Japanese pumpkin', '調味南瓜子(去殼)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1583', '[\"調味南瓜子(帶殼)\",\"調味南瓜子\",\"白瓜子\",\"Japanese pumpkin\",\"japanese pumpkin\",\"Cucurbita maxima\"]', '加工調理食品及其他類', '自動生成: 調味南瓜子(帶殼) ↔ Japanese pumpkin', 'Japanese pumpkin', '調味南瓜子(帶殼)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1585', '[\"豆干片(沙茶)\",\"豆干片\",\"Black tea\",\"black tea\"]', '糕餅點心類', '自動生成: 豆干片(沙茶) ↔ Black tea', 'Black tea', '豆干片(沙茶)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1588', '[\"豆漿\",\"豆奶\",\"Soy milk\",\"soy milk\"]', '加工調理食品及其他類', '自動生成: 豆漿 ↔ Soy milk', 'Soy milk', '豆漿');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1589', '[\"豆漿(無糖)\",\"豆漿\",\"Soy milk\",\"soy milk\"]', '豆類', '自動生成: 豆漿(無糖) ↔ Soy milk', 'Soy milk', '豆漿(無糖)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1590', '[\"豆漿優酪乳\",\"豆奶優酪乳\",\"Soy milk\",\"soy milk\"]', '加工調理食品及其他類', '自動生成: 豆漿優酪乳 ↔ Soy milk', 'Soy milk', '豆漿優酪乳');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1591', '[\"豆漿粉\",\"豆奶粉\",\"Soy milk\",\"soy milk\"]', '加工調理食品及其他類', '自動生成: 豆漿粉 ↔ Soy milk', 'Soy milk', '豆漿粉');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1594', '[\"豆腐皮\",\"豆皮\",\"Tofu\",\"tofu\"]', '加工調理食品及其他類', '自動生成: 豆腐皮 ↔ Tofu', 'Tofu', '豆腐皮');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1595', '[\"豆花(花生)\",\"豆花\",\"Peanut\",\"peanut\",\"Arachis hypogaea\"]', '糕餅點心類', '自動生成: 豆花(花生) ↔ Peanut', 'Peanut', '豆花(花生)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1601', '[\"豌豆仁\",\"荷蓮豆仁\",\"荷仁豆仁\",\"荷蘭豆仁\",\"花蓮豆仁\",\"飛龍豆仁\",\"青豆仁\",\"胡豆仁\",\"畢豆仁\",\"宛豆仁\",\"孫豆仁\",\"丸豆仁\",\"留\",\"Asian pear\",\"asian pear\",\"Pyrus pyrifolia\"]', '豆類', '自動生成: 豌豆仁 ↔ Asian pear', 'Asian pear', '豌豆仁');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1602', '[\"豌豆仁罐頭\",\"荷蓮豆仁\",\"荷仁豆仁\",\"荷蘭豆仁\",\"花蓮豆仁\",\"飛龍豆仁\",\"青豆仁\",\"胡豆仁\",\"畢豆仁\",\"宛豆仁\",\"孫豆仁\",\"丸豆仁\",\"留\",\"Asian pear\",\"asian pear\",\"Pyrus pyrifolia\"]', '加工調理食品及其他類', '自動生成: 豌豆仁罐頭 ↔ Asian pear', 'Asian pear', '豌豆仁罐頭');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1603', '[\"豌豆芽\",\"豌豆嬰\",\"荷蘭豆芽(嬰)\",\"Asian pear\",\"asian pear\",\"Pyrus pyrifolia\"]', '蔬菜類', '自動生成: 豌豆芽 ↔ Asian pear', 'Asian pear', '豌豆芽');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1604', '[\"豌豆苗\",\"豆苗\",\"豆鬚\",\"荷蘭豆苗(鬚)\",\"飛龍豆苗\",\"Asian pear\",\"asian pear\",\"Pyrus pyrifolia\"]', '蔬菜類', '自動生成: 豌豆苗 ↔ Asian pear', 'Asian pear', '豌豆苗');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1605', '[\"豌豆莢\",\"荷蓮豆\",\"荷仁豆\",\"荷蘭豆\",\"花蓮豆\",\"飛龍豆\",\"青豆莢\",\"胡豆莢\",\"畢豆莢\",\"宛豆莢\",\"孫豆莢\",\"丸豆莢\",\"留豆莢\",\"戎菽\",\"Asian pear\",\"asian pear\",\"Pyrus pyrifolia\"]', '豆類', '自動生成: 豌豆莢 ↔ Asian pear', 'Asian pear', '豌豆莢');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1667', '[\"越光米\",\"蓬萊米\",\"圓米\",\"Annual wild rice\",\"annual wild rice\",\"Zizania aquatica\"]', '穀物類', '自動生成: 越光米 ↔ Annual wild rice', 'Annual wild rice', '越光米');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1668', '[\"越光米(台南16號)(2024年取樣)\",\"越光米\",\"蓬萊米\",\"圓米\",\"Annual wild rice\",\"annual wild rice\",\"Zizania aquatica\"]', '穀物類', '自動生成: 越光米(台南16號)(2024年取樣) ↔ Annual wild rice', 'Annual wild rice', '越光米(台南16號)(2024年取樣)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1677', '[\"迷你竹筍白菜\",\"大白菜\",\"黃芽菜\",\"包心白菜\",\"卷心白菜\",\"山東白菜\",\"結球白菜\",\"Bamboo shoots\",\"bamboo shoots\",\"Phyllostachys edulis\"]', '蔬菜類', '自動生成: 迷你竹筍白菜 ↔ Bamboo shoots', 'Bamboo shoots', '迷你竹筍白菜');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1683', '[\"部份脫脂低乳糖奶粉\",\"乳粉\",\"Sugar\",\"sugar\"]', '乳品類', '自動生成: 部份脫脂低乳糖奶粉 ↔ Sugar', 'Sugar', '部份脫脂低乳糖奶粉');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1691', '[\"部份脫脂調味奶粉(果汁)\",\"部份脫脂調味奶粉\",\"乳粉\",\"Fruit juice\",\"fruit juice\"]', '乳品類', '自動生成: 部份脫脂調味奶粉(果汁) ↔ Fruit juice', 'Fruit juice', '部份脫脂調味奶粉(果汁)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1702', '[\"醃漬花生仁\",\"土豆\",\"長生果\",\"落花生\",\"Peanut\",\"peanut\",\"Arachis hypogaea\"]', '加工調理食品及其他類', '自動生成: 醃漬花生仁 ↔ Peanut', 'Peanut', '醃漬花生仁');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1706', '[\"醃漬鮭魚卵\",\"Atlantic salmon\",\"atlantic salmon\",\"Salmo salar\"]', '加工調理食品及其他類', '自動生成: 醃漬鮭魚卵 ↔ Atlantic salmon', 'Atlantic salmon', '醃漬鮭魚卵');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1709', '[\"醬油\",\"Soy sauce\",\"soy sauce\"]', '調味料及香辛料類', '自動生成: 醬油 ↔ Soy sauce', 'Soy sauce', '醬油');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1710', '[\"醬油膏\",\"Soy sauce\",\"soy sauce\"]', '調味料及香辛料類', '自動生成: 醬油膏 ↔ Soy sauce', 'Soy sauce', '醬油膏');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1711', '[\"醬油西瓜子\",\"Watermelon\",\"watermelon\",\"Citrullus lanatus\"]', '加工調理食品及其他類', '自動生成: 醬油西瓜子 ↔ Watermelon', 'Watermelon', '醬油西瓜子');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1717', '[\"野生紅米\",\"Annual wild rice\",\"annual wild rice\",\"Zizania aquatica\"]', '穀物類', '自動生成: 野生紅米 ↔ Annual wild rice', 'Annual wild rice', '野生紅米');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1721', '[\"金冠蘋果\",\"柰\",\"林檎\",\"黃蘋果(黃元帥)\",\"Apple\",\"apple\",\"Malus pumila\"]', '水果類', '自動生成: 金冠蘋果 ↔ Apple', 'Apple', '金冠蘋果');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1723', '[\"金女小番茄\",\"柑(甘)仔蜜\",\"草(番\",\"西紅\",\"六月)柿\",\"臭柿仔\",\"小金瓜\",\"洋柿(茄)子\",\"紅茄\",\"毛臘果\",\"Cherry tomato\",\"cherry tomato\",\"Solanum lycopersicum var. cerasiforme\"]', '蔬菜類', '自動生成: 金女小番茄 ↔ Cherry tomato', 'Cherry tomato', '金女小番茄');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1726', '[\"金煌芒果\",\"檬果\",\"檨仔\",\"菴羅果\",\"Mango\",\"mango\",\"Mangifera indica\"]', '水果類', '自動生成: 金煌芒果 ↔ Mango', 'Mango', '金煌芒果');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1727', '[\"金線魚\",\"金線鰱\",\"黃線\",\"紅杉\",\"Alaska blackfish\",\"alaska blackfish\",\"Dallia pectoralis\"]', '魚貝類', '自動生成: 金線魚 ↔ Alaska blackfish', 'Alaska blackfish', '金線魚');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1728', '[\"金興芒果\",\"檬果\",\"檨仔\",\"菴羅果\",\"Mango\",\"mango\",\"Mangifera indica\"]', '水果類', '自動生成: 金興芒果 ↔ Mango', 'Mango', '金興芒果');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1729', '[\"金蘭西瓜\",\"水瓜\",\"寒瓜\",\"夏瓜\",\"Watermelon\",\"watermelon\",\"Citrullus lanatus\"]', '水果類', '自動生成: 金蘭西瓜 ↔ Watermelon', 'Watermelon', '金蘭西瓜');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1730', '[\"金蜜芒果\",\"檬果\",\"檨仔\",\"菴羅果\",\"Mango\",\"mango\",\"Mangifera indica\"]', '水果類', '自動生成: 金蜜芒果 ↔ Mango', 'Mango', '金蜜芒果');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1736', '[\"金鉤蝦乾\",\"海米\",\"扁米\",\"開洋\",\"Shrimp\",\"shrimp\",\"Caridea\"]', '魚貝類', '自動生成: 金鉤蝦乾 ↔ Shrimp', 'Shrimp', '金鉤蝦乾');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1737', '[\"金錢魚\",\"變身苦\",\"遍身苦(澎湖)\",\"金鼓\",\"Alaska blackfish\",\"alaska blackfish\",\"Dallia pectoralis\"]', '魚貝類', '自動生成: 金錢魚 ↔ Alaska blackfish', 'Alaska blackfish', '金錢魚');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1738', '[\"金鑽鳳梨\",\"旺來\",\"波羅\",\"黃萊\",\"黃梨\",\"王萊(台農17號\",\"春蜜鳳梨)\",\"Pineapple\",\"pineapple\",\"Ananas comosus\"]', '水果類', '自動生成: 金鑽鳳梨 ↔ Pineapple', 'Pineapple', '金鑽鳳梨');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1740', '[\"金香葡萄(含皮)\",\"金香葡萄\",\"蒲桃\",\"蒲萄\",\"草龍珠\",\"蒲陶\",\"葡桃\",\"Common grape\",\"common grape\",\"Vitis vinifera\"]', '水果類', '自動生成: 金香葡萄(含皮) ↔ Common grape', 'Common grape', '金香葡萄(含皮)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1741', '[\"金鱗魚\",\"Alaska blackfish\",\"alaska blackfish\",\"Dallia pectoralis\"]', '魚貝類', '自動生成: 金鱗魚 ↔ Alaska blackfish', 'Alaska blackfish', '金鱗魚');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1742', '[\"金黃奇異果\",\"彌猴桃\",\"猴桃\",\"猴梨\",\"藤梨\",\"毛桃\",\"羊桃\",\"紅藤梨\",\"金桃\",\"楊桃\",\"Kiwi\",\"kiwi\",\"Actinidia chinensis\"]', '水果類', '自動生成: 金黃奇異果 ↔ Kiwi', 'Kiwi', '金黃奇異果');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1746', '[\"銀魚\",\"水晶魚\",\"小銀魚\",\"Alaska blackfish\",\"alaska blackfish\",\"Dallia pectoralis\"]', '魚貝類', '自動生成: 銀魚 ↔ Alaska blackfish', 'Alaska blackfish', '銀魚');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1759', '[\"長茄子\",\"茄\",\"茄仔\",\"紅皮菜\",\"紅茄(菜)\",\"紅茄仔\",\"落蘇\",\"崑崙瓜\",\"紫瓜\",\"酪酥\",\"小蓏\",\"長茄\",\"Eggplant\",\"eggplant\",\"Solanum melongena\"]', '蔬菜類', '自動生成: 長茄子 ↔ Eggplant', 'Eggplant', '長茄子');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1762', '[\"長體油胡瓜魚\",\"柳葉魚\",\"Alaska blackfish\",\"alaska blackfish\",\"Dallia pectoralis\"]', '魚貝類', '自動生成: 長體油胡瓜魚 ↔ Alaska blackfish', 'Alaska blackfish', '長體油胡瓜魚');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1763', '[\"長鰭鰤魚\",\"油甘\",\"黃尾鰺\",\"甘仔\",\"扁午\",\"扁甘\",\"柴魽\",\"Alaska blackfish\",\"alaska blackfish\",\"Dallia pectoralis\"]', '魚貝類', '自動生成: 長鰭鰤魚 ↔ Alaska blackfish', 'Alaska blackfish', '長鰭鰤魚');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1765', '[\"開心果\",\"Pistachio\",\"pistachio\",\"Pistacia vera\"]', '堅果及種子類', '自動生成: 開心果 ↔ Pistachio', 'Pistachio', '開心果');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1766', '[\"開英種1號鳳梨\",\"旺來\",\"波羅\",\"黃萊\",\"黃梨\",\"王萊(開英種1號\",\"1號仔\",\"突目仔)\",\"Pineapple\",\"pineapple\",\"Ananas comosus\"]', '水果類', '自動生成: 開英種1號鳳梨 ↔ Pineapple', 'Pineapple', '開英種1號鳳梨');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1771', '[\"隆脊管鞭蝦\",\"大頭紅蝦\",\"大頭蝦\",\"紅蝦\",\"蔥頭蝦\",\"Shrimp\",\"shrimp\",\"Caridea\"]', '魚貝類', '自動生成: 隆脊管鞭蝦 ↔ Shrimp', 'Shrimp', '隆脊管鞭蝦');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1777', '[\"雙胞胎麵包\",\"Breadfruit\",\"breadfruit\",\"Artocarpus altilis\"]', '糕餅點心類', '自動生成: 雙胞胎麵包 ↔ Breadfruit', 'Breadfruit', '雙胞胎麵包');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1778', '[\"雙色水果玉米\",\"玉米\",\"黃玉米\",\"Acorn\",\"acorn\",\"Quercus\"]', '穀物類', '自動生成: 雙色水果玉米 ↔ Acorn', 'Acorn', '雙色水果玉米');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1790', '[\"雞水波蛋\",\"(不帶殼水煮蛋)\",\"Egg roll\",\"egg roll\"]', '蛋類', '自動生成: 雞水波蛋 ↔ Egg roll', 'Egg roll', '雞水波蛋');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1791', '[\"雞水煮蛋\",\"Egg roll\",\"egg roll\"]', '蛋類', '自動生成: 雞水煮蛋 ↔ Egg roll', 'Egg roll', '雞水煮蛋');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1792', '[\"雞水煮蛋白\",\"Egg roll\",\"egg roll\"]', '蛋類', '自動生成: 雞水煮蛋白 ↔ Egg roll', 'Egg roll', '雞水煮蛋白');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1793', '[\"雞水煮蛋黃\",\"Egg roll\",\"egg roll\"]', '蛋類', '自動生成: 雞水煮蛋黃 ↔ Egg roll', 'Egg roll', '雞水煮蛋黃');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1795', '[\"雞滷蛋(市售)\",\"雞滷蛋\",\"Egg roll\",\"egg roll\"]', '蛋類', '自動生成: 雞滷蛋(市售) ↔ Egg roll', 'Egg roll', '雞滷蛋(市售)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1796', '[\"雞滷蛋(浸泡隔夜)\",\"雞滷蛋\",\"Egg roll\",\"egg roll\"]', '蛋類', '自動生成: 雞滷蛋(浸泡隔夜) ↔ Egg roll', 'Egg roll', '雞滷蛋(浸泡隔夜)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1797', '[\"雞滷蛋(現煮)\",\"雞滷蛋\",\"Egg roll\",\"egg roll\"]', '蛋類', '自動生成: 雞滷蛋(現煮) ↔ Egg roll', 'Egg roll', '雞滷蛋(現煮)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1798', '[\"雞滷蛋白(浸泡隔夜)\",\"雞滷蛋白\",\"Egg roll\",\"egg roll\"]', '蛋類', '自動生成: 雞滷蛋白(浸泡隔夜) ↔ Egg roll', 'Egg roll', '雞滷蛋白(浸泡隔夜)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1799', '[\"雞滷蛋白(現煮)\",\"雞滷蛋白\",\"Egg roll\",\"egg roll\"]', '蛋類', '自動生成: 雞滷蛋白(現煮) ↔ Egg roll', 'Egg roll', '雞滷蛋白(現煮)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1800', '[\"雞滷蛋黃(浸泡隔夜)\",\"雞滷蛋黃\",\"Egg roll\",\"egg roll\"]', '蛋類', '自動生成: 雞滷蛋黃(浸泡隔夜) ↔ Egg roll', 'Egg roll', '雞滷蛋黃(浸泡隔夜)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1801', '[\"雞滷蛋黃(現煮)\",\"雞滷蛋黃\",\"Egg roll\",\"egg roll\"]', '蛋類', '自動生成: 雞滷蛋黃(現煮) ↔ Egg roll', 'Egg roll', '雞滷蛋黃(現煮)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1803', '[\"雞皮蛋\",\"Egg roll\",\"egg roll\"]', '蛋類', '自動生成: 雞皮蛋 ↔ Egg roll', 'Egg roll', '雞皮蛋');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1804', '[\"雞皮蛋平均值\",\"Egg roll\",\"egg roll\"]', '蛋類', '自動生成: 雞皮蛋平均值 ↔ Egg roll', 'Egg roll', '雞皮蛋平均值');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1809', '[\"雞肉酥\",\"雞肉鬆\",\"Chicken\",\"chicken\",\"Gallus gallus\"]', '加工調理食品及其他類', '自動生成: 雞肉酥 ↔ Chicken', 'Chicken', '雞肉酥');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1810', '[\"雞肉香腸(大)\",\"雞肉香腸\",\"Chicken\",\"chicken\",\"Gallus gallus\"]', '加工調理食品及其他類', '自動生成: 雞肉香腸(大) ↔ Chicken', 'Chicken', '雞肉香腸(大)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1811', '[\"雞肉香腸(小)\",\"雞肉香腸\",\"Chicken\",\"chicken\",\"Gallus gallus\"]', '加工調理食品及其他類', '自動生成: 雞肉香腸(小) ↔ Chicken', 'Chicken', '雞肉香腸(小)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1819', '[\"雞蛋(白殼)\",\"雞蛋\",\"Egg roll\",\"egg roll\"]', '蛋類', '自動生成: 雞蛋(白殼) ↔ Egg roll', 'Egg roll', '雞蛋(白殼)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1820', '[\"雞蛋(高DHA)\",\"雞蛋\",\"Egg roll\",\"egg roll\"]', '蛋類', '自動生成: 雞蛋(高DHA) ↔ Egg roll', 'Egg roll', '雞蛋(高DHA)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1821', '[\"雞蛋(高亞麻油酸)\",\"雞蛋\",\"Egg roll\",\"egg roll\"]', '蛋類', '自動生成: 雞蛋(高亞麻油酸) ↔ Egg roll', 'Egg roll', '雞蛋(高亞麻油酸)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1822', '[\"雞蛋(高次亞麻油酸)\",\"雞蛋\",\"Egg roll\",\"egg roll\"]', '蛋類', '自動生成: 雞蛋(高次亞麻油酸) ↔ Egg roll', 'Egg roll', '雞蛋(高次亞麻油酸)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1823', '[\"雞蛋(高維生素A&E)\",\"雞蛋\",\"Egg roll\",\"egg roll\"]', '蛋類', '自動生成: 雞蛋(高維生素A&E) ↔ Egg roll', 'Egg roll', '雞蛋(高維生素A&E)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1824', '[\"雞蛋(高維生素E)\",\"雞蛋\",\"Egg roll\",\"egg roll\"]', '蛋類', '自動生成: 雞蛋(高維生素E) ↔ Egg roll', 'Egg roll', '雞蛋(高維生素E)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1825', '[\"雞蛋(黃殼)\",\"雞蛋\",\"Egg roll\",\"egg roll\"]', '蛋類', '自動生成: 雞蛋(黃殼) ↔ Egg roll', 'Egg roll', '雞蛋(黃殼)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1826', '[\"雞蛋平均值\",\"Egg roll\",\"egg roll\"]', '蛋類', '自動生成: 雞蛋平均值 ↔ Egg roll', 'Egg roll', '雞蛋平均值');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1827', '[\"雞蛋白(白殼)\",\"雞蛋白\",\"Egg roll\",\"egg roll\"]', '蛋類', '自動生成: 雞蛋白(白殼) ↔ Egg roll', 'Egg roll', '雞蛋白(白殼)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1828', '[\"雞蛋白(黃殼)\",\"雞蛋白\",\"Egg roll\",\"egg roll\"]', '蛋類', '自動生成: 雞蛋白(黃殼) ↔ Egg roll', 'Egg roll', '雞蛋白(黃殼)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1829', '[\"雞蛋白平均值\",\"Egg roll\",\"egg roll\"]', '蛋類', '自動生成: 雞蛋白平均值 ↔ Egg roll', 'Egg roll', '雞蛋白平均值');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1830', '[\"雞蛋豆漿\",\"雞蛋豆奶\",\"Soy milk\",\"soy milk\"]', '加工調理食品及其他類', '自動生成: 雞蛋豆漿 ↔ Soy milk', 'Soy milk', '雞蛋豆漿');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1831', '[\"雞蛋豆腐\",\"Tofu\",\"tofu\"]', '加工調理食品及其他類', '自動生成: 雞蛋豆腐 ↔ Tofu', 'Tofu', '雞蛋豆腐');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1832', '[\"雞蛋麵\",\"Egg roll\",\"egg roll\"]', '加工調理食品及其他類', '自動生成: 雞蛋麵 ↔ Egg roll', 'Egg roll', '雞蛋麵');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1833', '[\"雞蛋黃(白殼)\",\"雞蛋黃\",\"Egg roll\",\"egg roll\"]', '蛋類', '自動生成: 雞蛋黃(白殼) ↔ Egg roll', 'Egg roll', '雞蛋黃(白殼)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1834', '[\"雞蛋黃(高維生素E)\",\"雞蛋黃\",\"Egg roll\",\"egg roll\"]', '蛋類', '自動生成: 雞蛋黃(高維生素E) ↔ Egg roll', 'Egg roll', '雞蛋黃(高維生素E)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1835', '[\"雞蛋黃(黃殼)\",\"雞蛋黃\",\"Egg roll\",\"egg roll\"]', '蛋類', '自動生成: 雞蛋黃(黃殼) ↔ Egg roll', 'Egg roll', '雞蛋黃(黃殼)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1836', '[\"雞蛋黃平均值\",\"Egg roll\",\"egg roll\"]', '蛋類', '自動生成: 雞蛋黃平均值 ↔ Egg roll', 'Egg roll', '雞蛋黃平均值');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1837', '[\"雞鐵蛋\",\"Egg roll\",\"egg roll\"]', '蛋類', '自動生成: 雞鐵蛋 ↔ Egg roll', 'Egg roll', '雞鐵蛋');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1845', '[\"青嘴龍占魚\",\"龍尖\",\"龍占\",\"青嘴仔\",\"青嘴/尖嘴仔(澎湖)\",\"Alaska blackfish\",\"alaska blackfish\",\"Dallia pectoralis\"]', '魚貝類', '自動生成: 青嘴龍占魚 ↔ Alaska blackfish', 'Alaska blackfish', '青嘴龍占魚');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1848', '[\"青星九刺鮨魚片\",\"紅鱠\",\"紅格仔\",\"過魚\",\"石斑\",\"條舅\",\"紅條\",\"鱠仔(臺東)\",\"Alaska blackfish\",\"alaska blackfish\",\"Dallia pectoralis\"]', '魚貝類', '自動生成: 青星九刺鮨魚片 ↔ Alaska blackfish', 'Alaska blackfish', '青星九刺鮨魚片');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1849', '[\"青木瓜\",\"青番木瓜\",\"青番瓜\",\"Papaya\",\"papaya\",\"Carica papaya\"]', '水果類', '自動生成: 青木瓜 ↔ Papaya', 'Papaya', '青木瓜');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1864', '[\"青皮葡萄柚\",\"西柚\",\"朱欒\",\"Common grape\",\"common grape\",\"Vitis vinifera\"]', '水果類', '自動生成: 青皮葡萄柚 ↔ Common grape', 'Common grape', '青皮葡萄柚');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1865', '[\"青花菜(1999年取樣)\",\"青花菜\",\"(青花菜非綠色花椰菜)青(綠)花菜\",\"美國花菜\",\"青花苔\",\"花(青)菜苔\",\"菜苔\",\"花菜苞\",\"Broccoli\",\"broccoli\",\"Brassica oleracea var. italica\"]', '蔬菜類', '自動生成: 青花菜(1999年取樣) ↔ Broccoli', 'Broccoli', '青花菜(1999年取樣)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1866', '[\"青花菜(2021年取樣)\",\"青花菜\",\"(青花菜非綠色花椰菜)青(綠)花菜\",\"美國花菜\",\"青花苔\",\"花(青)菜苔\",\"菜苔\",\"花菜苞\",\"Broccoli\",\"broccoli\",\"Brassica oleracea var. italica\"]', '蔬菜類', '自動生成: 青花菜(2021年取樣) ↔ Broccoli', 'Broccoli', '青花菜(2021年取樣)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1867', '[\"青花菜筍\",\"Broccoli\",\"broccoli\",\"Brassica oleracea var. italica\"]', '蔬菜類', '自動生成: 青花菜筍 ↔ Broccoli', 'Broccoli', '青花菜筍');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1868', '[\"青花菜芽\",\"青花椰苗\",\"青花菜苗\",\"花菜苔芽\",\"Broccoli\",\"broccoli\",\"Brassica oleracea var. italica\"]', '蔬菜類', '自動生成: 青花菜芽 ↔ Broccoli', 'Broccoli', '青花菜芽');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1873', '[\"青蘿蔔\",\"蘿蔔\",\"菜頭\",\"萊菔\",\"綠蘿蔔\",\"綠長蘿蔔\",\"青菜頭\",\"青大根\",\"Black radish\",\"black radish\",\"Raphanus sativus var. niger\"]', '蔬菜類', '自動生成: 青蘿蔔 ↔ Black radish', 'Black radish', '青蘿蔔');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1876', '[\"青龍蘋果\",\"柰\",\"林檎\",\"青蘋果\",\"Apple\",\"apple\",\"Malus pumila\"]', '水果類', '自動生成: 青龍蘋果 ↔ Apple', 'Apple', '青龍蘋果');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1877', '[\"鞍帶石斑魚片\",\"龍膽石斑\",\"過魚\",\"槍頭石斑魚\",\"倒吞鱟\",\"鴛鴦鱠\",\"龍躉(香港)\",\"Alaska blackfish\",\"alaska blackfish\",\"Dallia pectoralis\"]', '魚貝類', '自動生成: 鞍帶石斑魚片 ↔ Alaska blackfish', 'Alaska blackfish', '鞍帶石斑魚片');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1880', '[\"韭菜盒子\",\"Chinese chives\",\"chinese chives\",\"Allium tuberosum\"]', '加工調理食品及其他類', '自動生成: 韭菜盒子 ↔ Chinese chives', 'Chinese chives', '韭菜盒子');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1892', '[\"香水芒果\",\"檬果\",\"檨仔\",\"菴羅果\",\"Mango\",\"mango\",\"Mangifera indica\"]', '水果類', '自動生成: 香水芒果 ↔ Mango', 'Mango', '香水芒果');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1895', '[\"香筍鮪魚罐頭\",\"Albacore tuna\",\"albacore tuna\",\"Thunnus alalunga\"]', '加工調理食品及其他類', '自動生成: 香筍鮪魚罐頭 ↔ Albacore tuna', 'Albacore tuna', '香筍鮪魚罐頭');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1896', '[\"香腸\",\"Sausage\",\"sausage\"]', '加工調理食品及其他類', '自動生成: 香腸 ↔ Sausage', 'Sausage', '香腸');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1897', '[\"香腸(蒜味)\",\"香腸\",\"Sausage\",\"sausage\"]', '加工調理食品及其他類', '自動生成: 香腸(蒜味) ↔ Sausage', 'Sausage', '香腸(蒜味)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1907', '[\"香醋\",\"Vinegar\",\"vinegar\"]', '調味料及香辛料類', '自動生成: 香醋 ↔ Vinegar', 'Vinegar', '香醋');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1908', '[\"香魚\",\"桀(加魚邊)魚\",\"Ayu\",\"年魚\",\"Alaska blackfish\",\"alaska blackfish\",\"Dallia pectoralis\"]', '魚貝類', '自動生成: 香魚 ↔ Alaska blackfish', 'Alaska blackfish', '香魚');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1909', '[\"香魚片\",\"Alaska blackfish\",\"alaska blackfish\",\"Dallia pectoralis\"]', '加工調理食品及其他類', '自動生成: 香魚片 ↔ Alaska blackfish', 'Alaska blackfish', '香魚片');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1911', '[\"馬鈴薯\",\"洋芋\",\"洋薯\",\"洋山芋\",\"荷蘭薯\",\"日本番薯\",\"塊茄\",\"Baked potato\",\"baked potato\"]', '澱粉類', '自動生成: 馬鈴薯 ↔ Baked potato', 'Baked potato', '馬鈴薯');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1912', '[\"馬鈴薯(2022年取樣)\",\"馬鈴薯\",\"洋芋\",\"洋薯\",\"洋山芋\",\"荷蘭薯\",\"日本番薯\",\"塊茄\",\"Baked potato\",\"baked potato\"]', '澱粉類', '自動生成: 馬鈴薯(2022年取樣) ↔ Baked potato', 'Baked potato', '馬鈴薯(2022年取樣)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1913', '[\"馬鈴薯粉\",\"太白粉\",\"Baked potato\",\"baked potato\"]', '澱粉類', '自動生成: 馬鈴薯粉 ↔ Baked potato', 'Baked potato', '馬鈴薯粉');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1919', '[\"高山大豌豆莢\",\"荷蓮豆\",\"荷仁豆\",\"荷蘭豆\",\"花蓮豆\",\"飛龍豆\",\"青豆莢\",\"胡豆莢\",\"畢豆莢\",\"宛豆莢\",\"孫豆莢\",\"丸豆莢\",\"留豆莢\",\"戎菽\",\"Asian pear\",\"asian pear\",\"Pyrus pyrifolia\"]', '豆類', '自動生成: 高山大豌豆莢 ↔ Asian pear', 'Asian pear', '高山大豌豆莢');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1922', '[\"高梁醋\",\"Vinegar\",\"vinegar\"]', '調味料及香辛料類', '自動生成: 高梁醋 ↔ Vinegar', 'Vinegar', '高梁醋');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1929', '[\"高湯塊(雞肉)\",\"高湯塊\",\"Chicken\",\"chicken\",\"Gallus gallus\"]', '調味料及香辛料類', '自動生成: 高湯塊(雞肉) ↔ Chicken', 'Chicken', '高湯塊(雞肉)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1933', '[\"高纖米\",\"高纖蓬萊米\",\"Annual wild rice\",\"annual wild rice\",\"Zizania aquatica\"]', '穀物類', '自動生成: 高纖米 ↔ Annual wild rice', 'Annual wild rice', '高纖米');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1946', '[\"鬚赤蝦\",\"鬚赤對蝦\",\"厚殼蝦(仔)\",\"火燒蝦\",\"狗蝦\",\"大厚殼\",\"Shrimp\",\"shrimp\",\"Caridea\"]', '魚貝類', '自動生成: 鬚赤蝦 ↔ Shrimp', 'Shrimp', '鬚赤蝦');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1947', '[\"鬚赤蝦仁\",\"火燒蝦仁\",\"Shrimp\",\"shrimp\",\"Caridea\"]', '魚貝類', '自動生成: 鬚赤蝦仁 ↔ Shrimp', 'Shrimp', '鬚赤蝦仁');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1949', '[\"鬼頭刀魚片\",\"鱰魚\",\"萬魚\",\"飛烏虎\",\"鬼頭刀(臺東)\",\"鱰\",\"萬引\",\"扁頭刀(澎湖)\",\"九萬仔(澎湖)\",\"Alaska blackfish\",\"alaska blackfish\",\"Dallia pectoralis\"]', '魚貝類', '自動生成: 鬼頭刀魚片 ↔ Alaska blackfish', 'Alaska blackfish', '鬼頭刀魚片');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1950', '[\"魚板\",\"Alaska blackfish\",\"alaska blackfish\",\"Dallia pectoralis\"]', '加工調理食品及其他類', '自動生成: 魚板 ↔ Alaska blackfish', 'Alaska blackfish', '魚板');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1951', '[\"魚漿(旗魚)\",\"魚漿\",\"Alaska blackfish\",\"alaska blackfish\",\"Dallia pectoralis\"]', '魚貝類', '自動生成: 魚漿(旗魚) ↔ Alaska blackfish', 'Alaska blackfish', '魚漿(旗魚)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1952', '[\"魚翅唇\",\"Alaska blackfish\",\"alaska blackfish\",\"Dallia pectoralis\"]', '魚貝類', '自動生成: 魚翅唇 ↔ Alaska blackfish', 'Alaska blackfish', '魚翅唇');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1953', '[\"魚肉脯\",\"Alaska blackfish\",\"alaska blackfish\",\"Dallia pectoralis\"]', '加工調理食品及其他類', '自動生成: 魚肉脯 ↔ Alaska blackfish', 'Alaska blackfish', '魚肉脯');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1954', '[\"魚肉鬆\",\"魚肉酥\",\"Alaska blackfish\",\"alaska blackfish\",\"Dallia pectoralis\"]', '加工調理食品及其他類', '自動生成: 魚肉鬆 ↔ Alaska blackfish', 'Alaska blackfish', '魚肉鬆');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1955', '[\"魚酥\",\"Alaska blackfish\",\"alaska blackfish\",\"Dallia pectoralis\"]', '糕餅點心類', '自動生成: 魚酥 ↔ Alaska blackfish', 'Alaska blackfish', '魚酥');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1956', '[\"魚露\",\"Alaska blackfish\",\"alaska blackfish\",\"Dallia pectoralis\"]', '調味料及香辛料類', '自動生成: 魚露 ↔ Alaska blackfish', 'Alaska blackfish', '魚露');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1957', '[\"魟魚\",\"Alaska blackfish\",\"alaska blackfish\",\"Dallia pectoralis\"]', '魚貝類', '自動生成: 魟魚 ↔ Alaska blackfish', 'Alaska blackfish', '魟魚');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1958', '[\"魩仔魚\",\"魩仔\",\"Alaska blackfish\",\"alaska blackfish\",\"Dallia pectoralis\"]', '魚貝類', '自動生成: 魩仔魚 ↔ Alaska blackfish', 'Alaska blackfish', '魩仔魚');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1959', '[\"魩仔魚(加工,大)\",\"魩仔魚\",\"魩仔\",\"Alaska blackfish\",\"alaska blackfish\",\"Dallia pectoralis\"]', '魚貝類', '自動生成: 魩仔魚(加工,大) ↔ Alaska blackfish', 'Alaska blackfish', '魩仔魚(加工,大)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1960', '[\"魩仔魚(加工,小)\",\"魩仔魚\",\"魩仔\",\"Alaska blackfish\",\"alaska blackfish\",\"Dallia pectoralis\"]', '魚貝類', '自動生成: 魩仔魚(加工,小) ↔ Alaska blackfish', 'Alaska blackfish', '魩仔魚(加工,小)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1961', '[\"魩仔魚(加工)\",\"魩仔魚\",\"Alaska blackfish\",\"alaska blackfish\",\"Dallia pectoralis\"]', '魚貝類', '自動生成: 魩仔魚(加工) ↔ Alaska blackfish', 'Alaska blackfish', '魩仔魚(加工)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1962', '[\"魩仔魚平均值(加工)\",\"魩仔魚平均值\",\"魩仔\",\"Alaska blackfish\",\"alaska blackfish\",\"Dallia pectoralis\"]', '魚貝類', '自動生成: 魩仔魚平均值(加工) ↔ Alaska blackfish', 'Alaska blackfish', '魩仔魚平均值(加工)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1963', '[\"鮑魚\",\"鰒魚;石決明;石決明貝\",\"Alaska blackfish\",\"alaska blackfish\",\"Dallia pectoralis\"]', '魚貝類', '自動生成: 鮑魚 ↔ Alaska blackfish', 'Alaska blackfish', '鮑魚');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1964', '[\"鮑魚菇\",\"夏季鮑魚菇\",\"高溫平菇\",\"台灣平菇\",\"黑美人菇\",\"人工口蘑(囊狀側耳)\",\"Alaska blackfish\",\"alaska blackfish\",\"Dallia pectoralis\"]', '菇類', '自動生成: 鮑魚菇 ↔ Alaska blackfish', 'Alaska blackfish', '鮑魚菇');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1966', '[\"鮟鱇魚肝\",\"Alaska blackfish\",\"alaska blackfish\",\"Dallia pectoralis\"]', '魚貝類', '自動生成: 鮟鱇魚肝 ↔ Alaska blackfish', 'Alaska blackfish', '鮟鱇魚肝');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1967', '[\"鮪魚生魚片\",\"Albacore tuna\",\"albacore tuna\",\"Thunnus alalunga\"]', '魚貝類', '自動生成: 鮪魚生魚片 ↔ Albacore tuna', 'Albacore tuna', '鮪魚生魚片');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1968', '[\"鮪魚肚\",\"Albacore tuna\",\"albacore tuna\",\"Thunnus alalunga\"]', '魚貝類', '自動生成: 鮪魚肚 ↔ Albacore tuna', 'Albacore tuna', '鮪魚肚');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1969', '[\"鮭魚鬆\",\"Atlantic salmon\",\"atlantic salmon\",\"Salmo salar\"]', '加工調理食品及其他類', '自動生成: 鮭魚鬆 ↔ Atlantic salmon', 'Atlantic salmon', '鮭魚鬆');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1973', '[\"鮮奶茶(無糖)\",\"鮮奶茶\",\"紅茶拿鐵\",\"Black tea\",\"black tea\"]', '飲料類', '自動生成: 鮮奶茶(無糖) ↔ Black tea', 'Black tea', '鮮奶茶(無糖)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1976', '[\"鮸魚卵(加工)\",\"鮸魚卵\",\"Alaska blackfish\",\"alaska blackfish\",\"Dallia pectoralis\"]', '魚貝類', '自動生成: 鮸魚卵(加工) ↔ Alaska blackfish', 'Alaska blackfish', '鮸魚卵(加工)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1978', '[\"鯊魚切片\",\"沙魚\",\"Alaska blackfish\",\"alaska blackfish\",\"Dallia pectoralis\"]', '魚貝類', '自動生成: 鯊魚切片 ↔ Alaska blackfish', 'Alaska blackfish', '鯊魚切片');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1979', '[\"鯊魚煙\",\"Alaska blackfish\",\"alaska blackfish\",\"Dallia pectoralis\"]', '加工調理食品及其他類', '自動生成: 鯊魚煙 ↔ Alaska blackfish', 'Alaska blackfish', '鯊魚煙');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1980', '[\"鯊魚皮\",\"Alaska blackfish\",\"alaska blackfish\",\"Dallia pectoralis\"]', '魚貝類', '自動生成: 鯊魚皮 ↔ Alaska blackfish', 'Alaska blackfish', '鯊魚皮');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1981', '[\"鯊魚翅\",\"魚翅\",\"Alaska blackfish\",\"alaska blackfish\",\"Dallia pectoralis\"]', '魚貝類', '自動生成: 鯊魚翅 ↔ Alaska blackfish', 'Alaska blackfish', '鯊魚翅');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1982', '[\"鯔(11月,雄魚)\",\"鯔\",\"青頭仔(幼魚)\",\"奇目仔(成魚)\",\"信魚\",\"正烏\",\"烏魚\",\"正頭烏\",\"回頭烏\",\"大烏(澎湖)\",\"Alaska blackfish\",\"alaska blackfish\",\"Dallia pectoralis\"]', '魚貝類', '自動生成: 鯔(11月,雄魚) ↔ Alaska blackfish', 'Alaska blackfish', '鯔(11月,雄魚)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1983', '[\"鯔(11月,雌魚)\",\"鯔\",\"青頭仔(幼魚)\",\"奇目仔(成魚)\",\"信魚\",\"正烏\",\"烏魚\",\"正頭烏\",\"回頭烏\",\"大烏(澎湖)\",\"Alaska blackfish\",\"alaska blackfish\",\"Dallia pectoralis\"]', '魚貝類', '自動生成: 鯔(11月,雌魚) ↔ Alaska blackfish', 'Alaska blackfish', '鯔(11月,雌魚)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1984', '[\"鯔(12月,雄魚)\",\"鯔\",\"青頭仔(幼魚)\",\"奇目仔(成魚)\",\"信魚\",\"正烏\",\"烏魚\",\"正頭烏\",\"回頭烏\",\"大烏(澎湖)\",\"Alaska blackfish\",\"alaska blackfish\",\"Dallia pectoralis\"]', '魚貝類', '自動生成: 鯔(12月,雄魚) ↔ Alaska blackfish', 'Alaska blackfish', '鯔(12月,雄魚)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1985', '[\"鯔(12月,雌魚)\",\"鯔\",\"青頭仔(幼魚)\",\"奇目仔(成魚)\",\"信魚\",\"正烏\",\"烏魚\",\"正頭烏\",\"回頭烏\",\"大烏(澎湖)\",\"Alaska blackfish\",\"alaska blackfish\",\"Dallia pectoralis\"]', '魚貝類', '自動生成: 鯔(12月,雌魚) ↔ Alaska blackfish', 'Alaska blackfish', '鯔(12月,雌魚)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1992', '[\"鯔魚卵\",\"烏魚卵\",\"Alaska blackfish\",\"alaska blackfish\",\"Dallia pectoralis\"]', '魚貝類', '自動生成: 鯔魚卵 ↔ Alaska blackfish', 'Alaska blackfish', '鯔魚卵');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1993', '[\"鯔魚卵(加工)\",\"鯔魚卵\",\"烏魚卵\",\"烏魚子\",\"Alaska blackfish\",\"alaska blackfish\",\"Dallia pectoralis\"]', '加工調理食品及其他類', '自動生成: 鯔魚卵(加工) ↔ Alaska blackfish', 'Alaska blackfish', '鯔魚卵(加工)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1994', '[\"鯔魚卵(加工)(2022年取樣)\",\"鯔魚卵\",\"烏魚卵\",\"烏魚子\",\"Alaska blackfish\",\"alaska blackfish\",\"Dallia pectoralis\"]', '加工調理食品及其他類', '自動生成: 鯔魚卵(加工)(2022年取樣) ↔ Alaska blackfish', 'Alaska blackfish', '鯔魚卵(加工)(2022年取樣)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1995', '[\"鯔魚精囊\",\"鯔(烏)魚鰾(膘)\",\"Alaska blackfish\",\"alaska blackfish\",\"Dallia pectoralis\"]', '魚貝類', '自動生成: 鯔魚精囊 ↔ Alaska blackfish', 'Alaska blackfish', '鯔魚精囊');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1996', '[\"鯖魚(炒)\",\"鯖魚\",\"Atlantic mackerel\",\"atlantic mackerel\",\"Scomber scombrus\"]', '魚貝類', '自動生成: 鯖魚(炒) ↔ Atlantic mackerel', 'Atlantic mackerel', '鯖魚(炒)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1997', '[\"鯖魚(炸)\",\"鯖魚\",\"Atlantic mackerel\",\"atlantic mackerel\",\"Scomber scombrus\"]', '魚貝類', '自動生成: 鯖魚(炸) ↔ Atlantic mackerel', 'Atlantic mackerel', '鯖魚(炸)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1998', '[\"鯖魚(烤,150度,10分)\",\"鯖魚\",\"Atlantic mackerel\",\"atlantic mackerel\",\"Scomber scombrus\"]', '魚貝類', '自動生成: 鯖魚(烤,150度,10分) ↔ Atlantic mackerel', 'Atlantic mackerel', '鯖魚(烤,150度,10分)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1999', '[\"鯖魚(烤,150度,20分)\",\"鯖魚\",\"Atlantic mackerel\",\"atlantic mackerel\",\"Scomber scombrus\"]', '魚貝類', '自動生成: 鯖魚(烤,150度,20分) ↔ Atlantic mackerel', 'Atlantic mackerel', '鯖魚(烤,150度,20分)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2000', '[\"鯖魚(烤,150度,30分)\",\"鯖魚\",\"Atlantic mackerel\",\"atlantic mackerel\",\"Scomber scombrus\"]', '魚貝類', '自動生成: 鯖魚(烤,150度,30分) ↔ Atlantic mackerel', 'Atlantic mackerel', '鯖魚(烤,150度,30分)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2001', '[\"鯖魚(烤,180度,10分)\",\"鯖魚\",\"Atlantic mackerel\",\"atlantic mackerel\",\"Scomber scombrus\"]', '魚貝類', '自動生成: 鯖魚(烤,180度,10分) ↔ Atlantic mackerel', 'Atlantic mackerel', '鯖魚(烤,180度,10分)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2002', '[\"鯖魚(烤,210度,10分)\",\"鯖魚\",\"Atlantic mackerel\",\"atlantic mackerel\",\"Scomber scombrus\"]', '魚貝類', '自動生成: 鯖魚(烤,210度,10分) ↔ Atlantic mackerel', 'Atlantic mackerel', '鯖魚(烤,210度,10分)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2003', '[\"鯖魚(煎)\",\"鯖魚\",\"Atlantic mackerel\",\"atlantic mackerel\",\"Scomber scombrus\"]', '魚貝類', '自動生成: 鯖魚(煎) ↔ Atlantic mackerel', 'Atlantic mackerel', '鯖魚(煎)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2004', '[\"鯖魚(煮)\",\"鯖魚\",\"Atlantic mackerel\",\"atlantic mackerel\",\"Scomber scombrus\"]', '魚貝類', '自動生成: 鯖魚(煮) ↔ Atlantic mackerel', 'Atlantic mackerel', '鯖魚(煮)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2005', '[\"鯖魚(生)\",\"鯖魚\",\"Atlantic mackerel\",\"atlantic mackerel\",\"Scomber scombrus\"]', '魚貝類', '自動生成: 鯖魚(生) ↔ Atlantic mackerel', 'Atlantic mackerel', '鯖魚(生)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2006', '[\"鯖魚(蒸)\",\"鯖魚\",\"Atlantic mackerel\",\"atlantic mackerel\",\"Scomber scombrus\"]', '魚貝類', '自動生成: 鯖魚(蒸) ↔ Atlantic mackerel', 'Atlantic mackerel', '鯖魚(蒸)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2007', '[\"鯖魚(醃製)\",\"鯖魚\",\"鹹鯖魚\",\"Atlantic mackerel\",\"atlantic mackerel\",\"Scomber scombrus\"]', '加工調理食品及其他類', '自動生成: 鯖魚(醃製) ↔ Atlantic mackerel', 'Atlantic mackerel', '鯖魚(醃製)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2008', '[\"鯖魚(醃製)(2022年取樣)\",\"鯖魚\",\"鹹鯖魚\",\"Atlantic mackerel\",\"atlantic mackerel\",\"Scomber scombrus\"]', '加工調理食品及其他類', '自動生成: 鯖魚(醃製)(2022年取樣) ↔ Atlantic mackerel', 'Atlantic mackerel', '鯖魚(醃製)(2022年取樣)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2009', '[\"鯖魚肉脯\",\"Atlantic mackerel\",\"atlantic mackerel\",\"Scomber scombrus\"]', '加工調理食品及其他類', '自動生成: 鯖魚肉脯 ↔ Atlantic mackerel', 'Atlantic mackerel', '鯖魚肉脯');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2010', '[\"鯛魚下巴\",\"鯛魚喉\",\"Alaska blackfish\",\"alaska blackfish\",\"Dallia pectoralis\"]', '魚貝類', '自動生成: 鯛魚下巴 ↔ Alaska blackfish', 'Alaska blackfish', '鯛魚下巴');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2011', '[\"鰆魚卵\",\"土魠魚卵\",\"Alaska blackfish\",\"alaska blackfish\",\"Dallia pectoralis\"]', '魚貝類', '自動生成: 鰆魚卵 ↔ Alaska blackfish', 'Alaska blackfish', '鰆魚卵');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2012', '[\"鰈魚切片\",\"大比目魚(扁鱈)\",\"Alaska blackfish\",\"alaska blackfish\",\"Dallia pectoralis\"]', '魚貝類', '自動生成: 鰈魚切片 ↔ Alaska blackfish', 'Alaska blackfish', '鰈魚切片');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2013', '[\"鰹魚卵\",\"Alaska blackfish\",\"alaska blackfish\",\"Dallia pectoralis\"]', '魚貝類', '自動生成: 鰹魚卵 ↔ Alaska blackfish', 'Alaska blackfish', '鰹魚卵');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2014', '[\"鰹魚粉\",\"Alaska blackfish\",\"alaska blackfish\",\"Dallia pectoralis\"]', '調味料及香辛料類', '自動生成: 鰹魚粉 ↔ Alaska blackfish', 'Alaska blackfish', '鰹魚粉');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2019', '[\"鱗馬鞭魚\",\"馬鞭魚\",\"馬戍\",\"槍管\",\"火管\",\"剃仔\",\"土管(臺東)\",\"Alaska blackfish\",\"alaska blackfish\",\"Dallia pectoralis\"]', '魚貝類', '自動生成: 鱗馬鞭魚 ↔ Alaska blackfish', 'Alaska blackfish', '鱗馬鞭魚');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2020', '[\"鱗鰭叫姑魚\",\"春子\",\"油口/臭肚仔/金線加網(澎湖)\",\"Alaska blackfish\",\"alaska blackfish\",\"Dallia pectoralis\"]', '魚貝類', '自動生成: 鱗鰭叫姑魚 ↔ Alaska blackfish', 'Alaska blackfish', '鱗鰭叫姑魚');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2021', '[\"鱙仔魚(加工)\",\"鱙仔魚\",\"針魩仔\",\"鱙仔\",\"寮仔魚\",\"Alaska blackfish\",\"alaska blackfish\",\"Dallia pectoralis\"]', '魚貝類', '自動生成: 鱙仔魚(加工) ↔ Alaska blackfish', 'Alaska blackfish', '鱙仔魚(加工)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2023', '[\"鳳光西瓜\",\"水瓜\",\"寒瓜\",\"夏瓜\",\"Watermelon\",\"watermelon\",\"Citrullus lanatus\"]', '水果類', '自動生成: 鳳光西瓜 ↔ Watermelon', 'Watermelon', '鳳光西瓜');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2025', '[\"鳳尾蝦仁\",\"Shrimp\",\"shrimp\",\"Caridea\"]', '魚貝類', '自動生成: 鳳尾蝦仁 ↔ Shrimp', 'Shrimp', '鳳尾蝦仁');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2026', '[\"鳳梨平均值(雜交種)\",\"鳳梨平均值\",\"鳳梨\",\"旺來\",\"波羅\",\"黃萊\",\"黃梨\",\"王萊\",\"Pineapple\",\"pineapple\",\"Ananas comosus\"]', '水果類', '自動生成: 鳳梨平均值(雜交種) ↔ Pineapple', 'Pineapple', '鳳梨平均值(雜交種)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2027', '[\"鳳梨果乾\",\"Pineapple\",\"pineapple\",\"Ananas comosus\"]', '糕餅點心類', '自動生成: 鳳梨果乾 ↔ Pineapple', 'Pineapple', '鳳梨果乾');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2028', '[\"鳳梨汁(非原汁)\",\"鳳梨汁\",\"Pineapple\",\"pineapple\",\"Ananas comosus\"]', '飲料類', '自動生成: 鳳梨汁(非原汁) ↔ Pineapple', 'Pineapple', '鳳梨汁(非原汁)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2029', '[\"鳳梨酥\",\"Pineapple\",\"pineapple\",\"Ananas comosus\"]', '糕餅點心類', '自動生成: 鳳梨酥 ↔ Pineapple', 'Pineapple', '鳳梨酥');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2030', '[\"鳳梨釋迦\",\"旺來釋迦\",\"奇美釋迦\",\"蜜釋迦\",\"Pineapple\",\"pineapple\",\"Ananas comosus\"]', '水果類', '自動生成: 鳳梨釋迦 ↔ Pineapple', 'Pineapple', '鳳梨釋迦');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2036', '[\"鴨熟鹹蛋\",\"Egg roll\",\"egg roll\"]', '蛋類', '自動生成: 鴨熟鹹蛋 ↔ Egg roll', 'Egg roll', '鴨熟鹹蛋');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2037', '[\"鴨熟鹹蛋(薄鹽)\",\"鴨熟鹹蛋\",\"Egg roll\",\"egg roll\"]', '蛋類', '自動生成: 鴨熟鹹蛋(薄鹽) ↔ Egg roll', 'Egg roll', '鴨熟鹹蛋(薄鹽)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2038', '[\"鴨生鹹蛋\",\"Egg roll\",\"egg roll\"]', '蛋類', '自動生成: 鴨生鹹蛋 ↔ Egg roll', 'Egg roll', '鴨生鹹蛋');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2039', '[\"鴨皮蛋\",\"Egg roll\",\"egg roll\"]', '蛋類', '自動生成: 鴨皮蛋 ↔ Egg roll', 'Egg roll', '鴨皮蛋');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2045', '[\"鴨蛋\",\"Egg roll\",\"egg roll\"]', '蛋類', '自動生成: 鴨蛋 ↔ Egg roll', 'Egg roll', '鴨蛋');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2046', '[\"鴨蛋白\",\"Egg roll\",\"egg roll\"]', '蛋類', '自動生成: 鴨蛋白 ↔ Egg roll', 'Egg roll', '鴨蛋白');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2047', '[\"鴨蛋黃\",\"Egg roll\",\"egg roll\"]', '蛋類', '自動生成: 鴨蛋黃 ↔ Egg roll', 'Egg roll', '鴨蛋黃');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2052', '[\"鴨鹹蛋平均值\",\"Egg roll\",\"egg roll\"]', '蛋類', '自動生成: 鴨鹹蛋平均值 ↔ Egg roll', 'Egg roll', '鴨鹹蛋平均值');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2053', '[\"鴨鹹蛋黃\",\"Egg roll\",\"egg roll\"]', '蛋類', '自動生成: 鴨鹹蛋黃 ↔ Egg roll', 'Egg roll', '鴨鹹蛋黃');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2055', '[\"鴿蛋\",\"鳥蛋\",\"Egg roll\",\"egg roll\"]', '蛋類', '自動生成: 鴿蛋 ↔ Egg roll', 'Egg roll', '鴿蛋');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2063', '[\"鵝蛋\",\"Egg roll\",\"egg roll\"]', '蛋類', '自動生成: 鵝蛋 ↔ Egg roll', 'Egg roll', '鵝蛋');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2064', '[\"鵪鶉水煮蛋\",\"鳥蛋\",\"Egg roll\",\"egg roll\"]', '蛋類', '自動生成: 鵪鶉水煮蛋 ↔ Egg roll', 'Egg roll', '鵪鶉水煮蛋');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2065', '[\"鵪鶉滷蛋\",\"鳥蛋\",\"Egg roll\",\"egg roll\"]', '蛋類', '自動生成: 鵪鶉滷蛋 ↔ Egg roll', 'Egg roll', '鵪鶉滷蛋');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2066', '[\"鵪鶉皮蛋\",\"鳥蛋\",\"Egg roll\",\"egg roll\"]', '蛋類', '自動生成: 鵪鶉皮蛋 ↔ Egg roll', 'Egg roll', '鵪鶉皮蛋');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2067', '[\"鵪鶉蛋\",\"鳥蛋\",\"Egg roll\",\"egg roll\"]', '蛋類', '自動生成: 鵪鶉蛋 ↔ Egg roll', 'Egg roll', '鵪鶉蛋');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2068', '[\"鵪鶉鐵蛋\",\"鳥蛋\",\"Egg roll\",\"egg roll\"]', '蛋類', '自動生成: 鵪鶉鐵蛋 ↔ Egg roll', 'Egg roll', '鵪鶉鐵蛋');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2069', '[\"鵪鶉鹹蛋\",\"鳥蛋\",\"Egg roll\",\"egg roll\"]', '蛋類', '自動生成: 鵪鶉鹹蛋 ↔ Egg roll', 'Egg roll', '鵪鶉鹹蛋');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2074', '[\"鹹豆漿\",\"Soy milk\",\"soy milk\"]', '加工調理食品及其他類', '自動生成: 鹹豆漿 ↔ Soy milk', 'Soy milk', '鹹豆漿');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2077', '[\"鹽漬小鱗脂眼鯡(鹹馧仔)\",\"鹽漬小鱗脂眼鯡\",\"臭肉鰮\",\"鰮仔\",\"圓眼仔\",\"鰮魚\",\"鰮仔魚\",\"圓仔魚(幼魚)\",\"脂眼鯡\",\"臭肉\",\"臭肉魚/肉鰮(澎湖)\",\"Salt\",\"salt\"]', '加工調理食品及其他類', '自動生成: 鹽漬小鱗脂眼鯡(鹹馧仔) ↔ Salt', 'Salt', '鹽漬小鱗脂眼鯡(鹹馧仔)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2078', '[\"鹽酥夏威夷豆\",\"夏威夷火山豆\",\"Salt\",\"salt\"]', '加工調理食品及其他類', '自動生成: 鹽酥夏威夷豆 ↔ Salt', 'Salt', '鹽酥夏威夷豆');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2079', '[\"鹽酥帶殼花生(熟)\",\"鹽酥帶殼花生\",\"土豆\",\"長生果\",\"落花生\",\"Peanut\",\"peanut\",\"Arachis hypogaea\"]', '加工調理食品及其他類', '自動生成: 鹽酥帶殼花生(熟) ↔ Peanut', 'Peanut', '鹽酥帶殼花生(熟)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2080', '[\"鹽酥花生仁\",\"土豆\",\"長生果\",\"落花生\",\"Peanut\",\"peanut\",\"Arachis hypogaea\"]', '加工調理食品及其他類', '自動生成: 鹽酥花生仁 ↔ Peanut', 'Peanut', '鹽酥花生仁');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2081', '[\"鹽酥葵瓜子(帶殼)\",\"鹽酥葵瓜子\",\"Salt\",\"salt\"]', '加工調理食品及其他類', '自動生成: 鹽酥葵瓜子(帶殼) ↔ Salt', 'Salt', '鹽酥葵瓜子(帶殼)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2082', '[\"鹽酥蠶豆\",\"蠶豆酥\",\"蠶豆子\",\"蠶豆花\",\"Salt\",\"salt\"]', '加工調理食品及其他類', '自動生成: 鹽酥蠶豆 ↔ Salt', 'Salt', '鹽酥蠶豆');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2087', '[\"麥芽糖\",\"Sugar\",\"sugar\"]', '糖類', '自動生成: 麥芽糖 ↔ Sugar', 'Sugar', '麥芽糖');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2088', '[\"麥茶\",\"Black tea\",\"black tea\"]', '飲料類', '自動生成: 麥茶 ↔ Black tea', 'Black tea', '麥茶');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2089', '[\"麵包果\",\"釋迦果\",\"馬檳榔\",\"Breadfruit\",\"breadfruit\",\"Artocarpus altilis\"]', '蔬菜類', '自動生成: 麵包果 ↔ Breadfruit', 'Breadfruit', '麵包果');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2090', '[\"麵包粉\",\"Breadfruit\",\"breadfruit\",\"Artocarpus altilis\"]', '調味料及香辛料類', '自動生成: 麵包粉 ↔ Breadfruit', 'Breadfruit', '麵包粉');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2094', '[\"麵茶粉\",\"Black tea\",\"black tea\"]', '加工調理食品及其他類', '自動生成: 麵茶粉 ↔ Black tea', 'Black tea', '麵茶粉');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2096', '[\"麻油辣腐乳\",\"Sesame oil\",\"sesame oil\"]', '加工調理食品及其他類', '自動生成: 麻油辣腐乳 ↔ Sesame oil', 'Sesame oil', '麻油辣腐乳');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2097', '[\"麻竹筍\",\"蔴竹\",\"甜竹\",\"巨竹\",\"坭竹\",\"大綠竹\",\"瓦坭竹\",\"巨麻竹\",\"美濃麻竹\",\"吊絲麻竹\",\"Bamboo shoots\",\"bamboo shoots\",\"Phyllostachys edulis\"]', '蔬菜類', '自動生成: 麻竹筍 ↔ Bamboo shoots', 'Bamboo shoots', '麻竹筍');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2098', '[\"麻竹筍干\",\"Bamboo shoots\",\"bamboo shoots\",\"Phyllostachys edulis\"]', '加工調理食品及其他類', '自動生成: 麻竹筍干 ↔ Bamboo shoots', 'Bamboo shoots', '麻竹筍干');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2101', '[\"黃姑魚\",\"春子\",\"假黃魚\",\"黃婆\",\"紅花(臺南安平)\",\"Alaska blackfish\",\"alaska blackfish\",\"Dallia pectoralis\"]', '魚貝類', '自動生成: 黃姑魚 ↔ Alaska blackfish', 'Alaska blackfish', '黃姑魚');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2105', '[\"黃洋蔥\",\"玉蔥\",\"蔥頭\",\"球蔥\",\"胡蔥\",\"日本蔥頭\",\"大粒蔥頭\",\"洋蔥頭\",\"大蔥頭\",\"Garden onion\",\"garden onion\",\"Allium cepa\"]', '蔬菜類', '自動生成: 黃洋蔥 ↔ Garden onion', 'Garden onion', '黃洋蔥');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2106', '[\"黃番茄\",\"柑(甘)仔蜜\",\"草(番\",\"西紅\",\"六月)柿\",\"臭柿仔\",\"小金瓜\",\"洋柿(茄)子\",\"紅茄\",\"毛臘果\",\"Cherry tomato\",\"cherry tomato\",\"Solanum lycopersicum var. cerasiforme\"]', '蔬菜類', '自動生成: 黃番茄 ↔ Cherry tomato', 'Cherry tomato', '黃番茄');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2107', '[\"黃皮葡萄柚\",\"西柚\",\"朱欒\",\"Common grape\",\"common grape\",\"Vitis vinifera\"]', '水果類', '自動生成: 黃皮葡萄柚 ↔ Common grape', 'Common grape', '黃皮葡萄柚');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2108', '[\"黃皮葡萄柚(進口)\",\"黃皮葡萄柚\",\"西柚\",\"朱欒\",\"Common grape\",\"common grape\",\"Vitis vinifera\"]', '水果類', '自動生成: 黃皮葡萄柚(進口) ↔ Common grape', 'Common grape', '黃皮葡萄柚(進口)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2114', '[\"黃胡蘿蔔\",\"紅蘿蔔\",\"紅菜頭\",\"黃蘿蔔\",\"丁香蘿蔔\",\"人參\",\"金筍\",\"Carrot\",\"carrot\",\"Daucus carota ssp. sativus\"]', '蔬菜類', '自動生成: 黃胡蘿蔔 ↔ Carrot', 'Carrot', '黃胡蘿蔔');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2116', '[\"黃豆\",\"大豆\",\"菽\",\"Soybean oil\",\"soybean oil\"]', '豆類', '自動生成: 黃豆 ↔ Soybean oil', 'Soybean oil', '黃豆');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2117', '[\"黃豆粉\",\"大豆\",\"Soybean oil\",\"soybean oil\"]', '豆類', '自動生成: 黃豆粉 ↔ Soybean oil', 'Soybean oil', '黃豆粉');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2118', '[\"黃豆粉(有機)\",\"黃豆粉\",\"大豆粉(有機)\",\"Soybean oil\",\"soybean oil\"]', '豆類', '自動生成: 黃豆粉(有機) ↔ Soybean oil', 'Soybean oil', '黃豆粉(有機)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2119', '[\"黃豆胚芽\",\"大豆胚芽\",\"Soybean oil\",\"soybean oil\"]', '豆類', '自動生成: 黃豆胚芽 ↔ Soybean oil', 'Soybean oil', '黃豆胚芽');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2120', '[\"黃豆芽\",\"大豆芽\",\"Soybean oil\",\"soybean oil\"]', '蔬菜類', '自動生成: 黃豆芽 ↔ Soybean oil', 'Soybean oil', '黃豆芽');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2121', '[\"黃豆芽(有機,2023年取樣)\",\"黃豆芽\",\"大豆芽\",\"Soybean oil\",\"soybean oil\"]', '蔬菜類', '自動生成: 黃豆芽(有機,2023年取樣) ↔ Soybean oil', 'Soybean oil', '黃豆芽(有機,2023年取樣)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2125', '[\"黃金聖女小番茄\",\"柑(甘)仔蜜\",\"草(番\",\"西紅\",\"六月)柿\",\"臭柿仔\",\"小金瓜\",\"洋柿(茄)子\",\"紅茄\",\"毛臘果\",\"Cherry tomato\",\"cherry tomato\",\"Solanum lycopersicum var. cerasiforme\"]', '蔬菜類', '自動生成: 黃金聖女小番茄 ↔ Cherry tomato', 'Cherry tomato', '黃金聖女小番茄');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2133', '[\"黑柿番茄\",\"柑(甘)仔蜜\",\"草(番\",\"西紅\",\"六月)柿\",\"臭柿仔\",\"小金瓜\",\"洋柿(茄)子\",\"紅茄\",\"毛臘果\",\"Cherry tomato\",\"cherry tomato\",\"Solanum lycopersicum var. cerasiforme\"]', '蔬菜類', '自動生成: 黑柿番茄 ↔ Cherry tomato', 'Cherry tomato', '黑柿番茄');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2135', '[\"黑棗茶\",\"Black tea\",\"black tea\"]', '飲料類', '自動生成: 黑棗茶 ↔ Black tea', 'Black tea', '黑棗茶');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2138', '[\"黑森林蛋糕\",\"巧克力鮮奶油蛋糕\",\"Egg roll\",\"egg roll\"]', '糕餅點心類', '自動生成: 黑森林蛋糕 ↔ Egg roll', 'Egg roll', '黑森林蛋糕');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2140', '[\"黑砂糖\",\"黑糖\",\"Sugar\",\"sugar\"]', '糖類', '自動生成: 黑砂糖 ↔ Sugar', 'Sugar', '黑砂糖');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2141', '[\"黑秈糙米\",\"黑米\",\"Annual wild rice\",\"annual wild rice\",\"Zizania aquatica\"]', '穀物類', '自動生成: 黑秈糙米 ↔ Annual wild rice', 'Annual wild rice', '黑秈糙米');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2142', '[\"黑秈糯糙米\",\"黑糯米\",\"紫糯米\",\"紫米\",\"貢米\",\"長生米\",\"Annual wild rice\",\"annual wild rice\",\"Zizania aquatica\"]', '穀物類', '自動生成: 黑秈糯糙米 ↔ Annual wild rice', 'Annual wild rice', '黑秈糯糙米');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2143', '[\"黑糖蜜\",\"Sugar\",\"sugar\"]', '糖類', '自動生成: 黑糖蜜 ↔ Sugar', 'Sugar', '黑糖蜜');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2144', '[\"黑糖饅頭\",\"Sugar\",\"sugar\"]', '加工調理食品及其他類', '自動生成: 黑糖饅頭 ↔ Sugar', 'Sugar', '黑糖饅頭');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2145', '[\"黑糯米漿\",\"Annual wild rice\",\"annual wild rice\",\"Zizania aquatica\"]', '加工調理食品及其他類', '自動生成: 黑糯米漿 ↔ Annual wild rice', 'Annual wild rice', '黑糯米漿');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2146', '[\"黑美人葡萄(含皮)\",\"黑美人葡萄\",\"蒲桃\",\"蒲萄\",\"草龍珠\",\"蒲陶\",\"葡桃\",\"Common grape\",\"common grape\",\"Vitis vinifera\"]', '水果類', '自動生成: 黑美人葡萄(含皮) ↔ Common grape', 'Common grape', '黑美人葡萄(含皮)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2147', '[\"黑美人西瓜\",\"水瓜\",\"寒瓜\",\"夏瓜\",\"Watermelon\",\"watermelon\",\"Citrullus lanatus\"]', '水果類', '自動生成: 黑美人西瓜 ↔ Watermelon', 'Watermelon', '黑美人西瓜');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2148', '[\"黑胡椒粉\",\"Cubanelle pepper\",\"cubanelle pepper\"]', '調味料及香辛料類', '自動生成: 黑胡椒粉 ↔ Cubanelle pepper', 'Cubanelle pepper', '黑胡椒粉');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2149', '[\"黑胡椒醬\",\"Cubanelle pepper\",\"cubanelle pepper\"]', '調味料及香辛料類', '自動生成: 黑胡椒醬 ↔ Cubanelle pepper', 'Cubanelle pepper', '黑胡椒醬');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2150', '[\"黑芝麻(熟)\",\"黑芝麻\",\"Sesame\",\"sesame\",\"Sesamum orientale\"]', '堅果及種子類', '自動生成: 黑芝麻(熟) ↔ Sesame', 'Sesame', '黑芝麻(熟)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2151', '[\"黑芝麻(熟)(2022年取樣)\",\"黑芝麻\",\"Sesame\",\"sesame\",\"Sesamum orientale\"]', '堅果及種子類', '自動生成: 黑芝麻(熟)(2022年取樣) ↔ Sesame', 'Sesame', '黑芝麻(熟)(2022年取樣)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2152', '[\"黑芝麻(生)\",\"黑芝麻\",\"Sesame\",\"sesame\",\"Sesamum orientale\"]', '堅果及種子類', '自動生成: 黑芝麻(生) ↔ Sesame', 'Sesame', '黑芝麻(生)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2153', '[\"黑芝麻油\",\"Sesame oil\",\"sesame oil\"]', '油脂類', '自動生成: 黑芝麻油 ↔ Sesame oil', 'Sesame oil', '黑芝麻油');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2154', '[\"黑芝麻粉\",\"Sesame\",\"sesame\",\"Sesamum orientale\"]', '堅果及種子類', '自動生成: 黑芝麻粉 ↔ Sesame', 'Sesame', '黑芝麻粉');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2155', '[\"黑芝麻糖\",\"Sesame\",\"sesame\",\"Sesamum orientale\"]', '糕餅點心類', '自動生成: 黑芝麻糖 ↔ Sesame', 'Sesame', '黑芝麻糖');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2156', '[\"黑芝麻麵包醬\",\"Breadfruit\",\"breadfruit\",\"Artocarpus altilis\"]', '調味料及香辛料類', '自動生成: 黑芝麻麵包醬 ↔ Breadfruit', 'Breadfruit', '黑芝麻麵包醬');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2164', '[\"黑豆茶\",\"Black tea\",\"black tea\"]', '飲料類', '自動生成: 黑豆茶 ↔ Black tea', 'Black tea', '黑豆茶');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2165', '[\"黑豆醬油\",\"黑豆蔭油\",\"蔭油\",\"Soy sauce\",\"soy sauce\"]', '調味料及香辛料類', '自動生成: 黑豆醬油 ↔ Soy sauce', 'Soy sauce', '黑豆醬油');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2166', '[\"黑金剛花生(生)\",\"黑金剛花生\",\"花生\",\"土豆\",\"長壽果\",\"Peanut\",\"peanut\",\"Arachis hypogaea\"]', '堅果及種子類', '自動生成: 黑金剛花生(生) ↔ Peanut', 'Peanut', '黑金剛花生(生)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2167', '[\"黑香芒果\",\"檬果\",\"檨仔\",\"菴羅果\",\"Mango\",\"mango\",\"Mangifera indica\"]', '水果類', '自動生成: 黑香芒果 ↔ Mango', 'Mango', '黑香芒果');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2170', '[\"黑齒牡蠣\",\"石蚵\",\"Bivalvia (Clam, Mussel, Oyster)\",\"bivalvia (clam, mussel, oyster)\",\"Bivalvia\"]', '魚貝類', '自動生成: 黑齒牡蠣 ↔ Bivalvia (Clam, Mussel, Oyster)', 'Bivalvia (Clam, Mussel, Oyster)', '黑齒牡蠣');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2173', '[\"龍眼\",\"桂圓\",\"龍目\",\"圓眼\",\"Longan\",\"longan\",\"Dimocarpus longan\"]', '水果類', '自動生成: 龍眼 ↔ Longan', 'Longan', '龍眼');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2174', '[\"龍眼乾\",\"桂圓乾\",\"龍目乾\",\"圓眼乾\",\"Longan\",\"longan\",\"Dimocarpus longan\"]', '水果類', '自動生成: 龍眼乾 ↔ Longan', 'Longan', '龍眼乾');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2176', '[\"龍虎石斑魚\",\"龍虎斑\",\"巴龍膽\",\"珍珠龍膽\",\"虎膽\",\"Alaska blackfish\",\"alaska blackfish\",\"Dallia pectoralis\"]', '魚貝類', '自動生成: 龍虎石斑魚 ↔ Alaska blackfish', 'Alaska blackfish', '龍虎石斑魚');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2177', '[\"龍蝦卵(調味)\",\"龍蝦卵\",\"Shrimp\",\"shrimp\",\"Caridea\"]', '加工調理食品及其他類', '自動生成: 龍蝦卵(調味) ↔ Shrimp', 'Shrimp', '龍蝦卵(調味)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2179', '[\"龜苓茶\",\"Black tea\",\"black tea\"]', '飲料類', '自動生成: 龜苓茶 ↔ Black tea', 'Black tea', '龜苓茶');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1', '[\"七味唐辛子\"]', '調味料及香辛料類', '自動生成: 七味唐辛子 (僅台灣資料庫)', NULL, '七味唐辛子');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2', '[\"七股香洋香瓜\",\"甜瓜\",\"甘瓜\",\"果瓜\",\"香瓜\",\"梨仔瓜\",\"澎湖瓜\",\"洋香瓜\",\"網仔瓜\",\"哈蜜瓜\"]', '水果類', '自動生成: 七股香洋香瓜 (僅台灣資料庫)', NULL, '七股香洋香瓜');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_3', '[\"三合一麥片(野菜蘑菇)\",\"三合一麥片\"]', '加工調理食品及其他類', '自動生成: 三合一麥片(野菜蘑菇) (僅台灣資料庫)', NULL, '三合一麥片(野菜蘑菇)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_4', '[\"三節翅(土雞)\",\"三節翅\"]', '肉類', '自動生成: 三節翅(土雞) (僅台灣資料庫)', NULL, '三節翅(土雞)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_5', '[\"三節翅(肉雞)\",\"三節翅\"]', '肉類', '自動生成: 三節翅(肉雞) (僅台灣資料庫)', NULL, '三節翅(肉雞)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_6', '[\"三節翅平均值\"]', '肉類', '自動生成: 三節翅平均值 (僅台灣資料庫)', NULL, '三節翅平均值');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_7', '[\"三線磯鱸\",\"三線雞魚\",\"黃雞仔\",\"雞仔魚\",\"番仔加誌\",\"黃公仔魚\",\"黃雞魚\",\"三爪仔\",\"雞魚(澎湖)\",\"青筆\"]', '魚貝類', '自動生成: 三線磯鱸 (僅台灣資料庫)', NULL, '三線磯鱸');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_8', '[\"三角飯糰(肉鬆)\",\"三角飯糰\"]', '加工調理食品及其他類', '自動生成: 三角飯糰(肉鬆) (僅台灣資料庫)', NULL, '三角飯糰(肉鬆)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_9', '[\"不結球萵苣平均值\",\"葉萵苣\",\"葉萵\",\"萵仔菜\",\"刈葉萵苣\",\"生菜\",\"妹(媚)仔菜\",\"鵝仔菜(草)\",\"春不老\",\"印度萵苣\"]', '蔬菜類', '自動生成: 不結球萵苣平均值 (僅台灣資料庫)', NULL, '不結球萵苣平均值');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_10', '[\"世紀芭樂\",\"番石榴\",\"芭樂\",\"拔仔\",\"扒仔\",\"朳仔\",\"那拔仔\",\"藍拔\"]', '水果類', '自動生成: 世紀芭樂 (僅台灣資料庫)', NULL, '世紀芭樂');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_12', '[\"中筋麵粉\"]', '穀物類', '自動生成: 中筋麵粉 (僅台灣資料庫)', NULL, '中筋麵粉');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_14', '[\"中脂保久乳\",\"牛乳\",\"牛奶\"]', '乳品類', '自動生成: 中脂保久乳 (僅台灣資料庫)', NULL, '中脂保久乳');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_16', '[\"中脂凝態發酵乳(蘆薈)\",\"中脂凝態發酵乳\",\"優格\"]', '乳品類', '自動生成: 中脂凝態發酵乳(蘆薈) (僅台灣資料庫)', NULL, '中脂凝態發酵乳(蘆薈)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_17', '[\"中脂強化鮮乳(脂肪酸調整)\",\"中脂強化鮮乳\",\"牛乳\",\"牛奶\"]', '乳品類', '自動生成: 中脂強化鮮乳(脂肪酸調整) (僅台灣資料庫)', NULL, '中脂強化鮮乳(脂肪酸調整)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_18', '[\"中脂濃稠發酵乳\",\"優酪乳\"]', '乳品類', '自動生成: 中脂濃稠發酵乳 (僅台灣資料庫)', NULL, '中脂濃稠發酵乳');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_21', '[\"中脂調味乳(多穀類)\",\"中脂調味乳\",\"牛乳\",\"牛奶\"]', '乳品類', '自動生成: 中脂調味乳(多穀類) (僅台灣資料庫)', NULL, '中脂調味乳(多穀類)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_22', '[\"中脂調味乳(巧克力)\",\"中脂調味乳\",\"牛乳\",\"牛奶\"]', '乳品類', '自動生成: 中脂調味乳(巧克力) (僅台灣資料庫)', NULL, '中脂調味乳(巧克力)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_24', '[\"中脂調味乳(維生素強化)\",\"中脂調味乳\",\"牛乳\",\"牛奶\"]', '乳品類', '自動生成: 中脂調味乳(維生素強化) (僅台灣資料庫)', NULL, '中脂調味乳(維生素強化)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_25', '[\"中脂調味乳(纖維&維生素E強化)\",\"中脂調味乳\",\"牛乳\",\"牛奶\"]', '乳品類', '自動生成: 中脂調味乳(纖維&維生素E強化) (僅台灣資料庫)', NULL, '中脂調味乳(纖維&維生素E強化)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_26', '[\"中脂調味乳(鈣強化)\",\"中脂調味乳\",\"牛乳\",\"牛奶\"]', '乳品類', '自動生成: 中脂調味乳(鈣強化) (僅台灣資料庫)', NULL, '中脂調味乳(鈣強化)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_27', '[\"中脂調味保久乳(巧克力)\",\"中脂調味保久乳\",\"牛乳\",\"牛奶\"]', '乳品類', '自動生成: 中脂調味保久乳(巧克力) (僅台灣資料庫)', NULL, '中脂調味保久乳(巧克力)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_28', '[\"中脂調味保久乳(布丁)\",\"中脂調味保久乳\",\"牛乳\",\"牛奶\"]', '乳品類', '自動生成: 中脂調味保久乳(布丁) (僅台灣資料庫)', NULL, '中脂調味保久乳(布丁)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_29', '[\"中脂調味保久羊乳(巧克力)\",\"中脂調味保久羊乳\",\"羊奶\"]', '乳品類', '自動生成: 中脂調味保久羊乳(巧克力) (僅台灣資料庫)', NULL, '中脂調味保久羊乳(巧克力)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_31', '[\"中脂鮮乳\",\"牛乳\",\"牛奶\"]', '乳品類', '自動生成: 中脂鮮乳 (僅台灣資料庫)', NULL, '中脂鮮乳');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_32', '[\"中脂鮮羊乳\",\"羊奶\"]', '乳品類', '自動生成: 中脂鮮羊乳 (僅台灣資料庫)', NULL, '中脂鮮羊乳');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_33', '[\"中鏈脂肪酸油\"]', '油脂類', '自動生成: 中鏈脂肪酸油 (僅台灣資料庫)', NULL, '中鏈脂肪酸油');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_34', '[\"九孔螺\",\"九孔;雜色鮑;石決明\"]', '魚貝類', '自動生成: 九孔螺 (僅台灣資料庫)', NULL, '九孔螺');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_35', '[\"九層塔\",\"千層塔\",\"羅勒\",\"家佩蘭\",\"零陵菜\",\"香菜(草)\",\"薰草\",\"西王母菜\",\"塞香菜\",\"光明子\",\"醒頭香\"]', '蔬菜類', '自動生成: 九層塔 (僅台灣資料庫)', NULL, '九層塔');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_37', '[\"乳酸球\"]', '糕餅點心類', '自動生成: 乳酸球 (僅台灣資料庫)', NULL, '乳酸球');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_38', '[\"乳酸飲料\"]', '飲料類', '自動生成: 乳酸飲料 (僅台灣資料庫)', NULL, '乳酸飲料');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_39', '[\"乾姬松茸\",\"姬松菇\",\"巴西蘑菇\",\"柏氏蘑菇\",\"小松菇\"]', '菇類', '自動生成: 乾姬松茸 (僅台灣資料庫)', NULL, '乾姬松茸');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_40', '[\"乾川耳\"]', '菇類', '自動生成: 乾川耳 (僅台灣資料庫)', NULL, '乾川耳');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_41', '[\"乾木耳(紅耳仔)\",\"乾木耳\",\"黑木耳\",\"桑耳\",\"白背毛木耳\",\"木樟(檽/菌/茸/蛾/樅)\",\"樹雞(毛木耳)\"]', '菇類', '自動生成: 乾木耳(紅耳仔) (僅台灣資料庫)', NULL, '乾木耳(紅耳仔)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_42', '[\"乾木耳(黑耳仔)\",\"乾木耳\",\"黑木耳\",\"桑耳\",\"白背毛木耳\",\"木樟(檽/菌/茸/蛾/樅)\",\"樹雞(毛木耳)\"]', '菇類', '自動生成: 乾木耳(黑耳仔) (僅台灣資料庫)', NULL, '乾木耳(黑耳仔)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_43', '[\"乾木耳平均值\",\"黑木耳\",\"桑耳\",\"白背毛木耳\",\"木樟(檽/菌/茸/蛾/樅)\",\"樹雞(毛木耳)\"]', '菇類', '自動生成: 乾木耳平均值 (僅台灣資料庫)', NULL, '乾木耳平均值');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_44', '[\"乾柳松菇\",\"柳松茸\",\"茶樹菇\",\"楊樹菇\",\"田頭菇(柱狀田頭菇)\"]', '菇類', '自動生成: 乾柳松菇 (僅台灣資料庫)', NULL, '乾柳松菇');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_45', '[\"乾海帶\",\"乾江白菜\",\"乾昆布\",\"乾海昆布\"]', '藻類', '自動生成: 乾海帶 (僅台灣資料庫)', NULL, '乾海帶');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_46', '[\"乾海茸芯\",\"海海洋竹笙\",\"乾素蹄筋\"]', '藻類', '自動生成: 乾海茸芯 (僅台灣資料庫)', NULL, '乾海茸芯');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_47', '[\"乾猴頭菇\",\"猴頭蘑\",\"刺蝟菌\",\"蝟菌\",\"花菜菇\",\"圓頭菇\",\"陰陽蘑\",\"對臉蘑\"]', '菇類', '自動生成: 乾猴頭菇 (僅台灣資料庫)', NULL, '乾猴頭菇');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_49', '[\"乾白花菇\",\"冬(北/花/厚/毛)菇\",\"椎茸\",\"香蕈(信/椹)\",\"合蕈\"]', '菇類', '自動生成: 乾白花菇 (僅台灣資料庫)', NULL, '乾白花菇');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_50', '[\"乾百合鱗片\",\"乾百合\",\"乾百合花鱗片\",\"乾蒜腦藷\"]', '蔬菜類', '自動生成: 乾百合鱗片 (僅台灣資料庫)', NULL, '乾百合鱗片');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_51', '[\"乾竹笙\",\"竹蓀\",\"竹參(長裙竹蓀)\"]', '菇類', '自動生成: 乾竹笙 (僅台灣資料庫)', NULL, '乾竹笙');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_52', '[\"乾花菇\",\"冬(北/花/厚/毛)菇\",\"椎茸\",\"香蕈(信/椹)\",\"合蕈\"]', '菇類', '自動生成: 乾花菇 (僅台灣資料庫)', NULL, '乾花菇');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_53', '[\"乾裙帶菜\",\"乾海帶芽\",\"乾嫩海帶\"]', '藻類', '自動生成: 乾裙帶菜 (僅台灣資料庫)', NULL, '乾裙帶菜');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_54', '[\"乾裙帶菜根\",\"乾海帶芽根\",\"乾嫩海帶根\"]', '藻類', '自動生成: 乾裙帶菜根 (僅台灣資料庫)', NULL, '乾裙帶菜根');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_55', '[\"乾酪粉\",\"起司粉\",\"芝士粉(市售亦稱\\\"乳酪粉\\\")\"]', '乳品類', '自動生成: 乾酪粉 (僅台灣資料庫)', NULL, '乾酪粉');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_56', '[\"乾鈕釦菇\",\"冬(北/花/厚/毛)菇\",\"椎茸\",\"香蕈(信/椹)\",\"合蕈\"]', '菇類', '自動生成: 乾鈕釦菇 (僅台灣資料庫)', NULL, '乾鈕釦菇');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_57', '[\"乾銀耳\",\"白木耳\",\"雪耳\"]', '菇類', '自動生成: 乾銀耳 (僅台灣資料庫)', NULL, '乾銀耳');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_58', '[\"乾長辣椒(紅皮)\",\"乾長辣椒\",\"辣椒\",\"番椒\",\"番仔薑\",\"臘椒\"]', '蔬菜類', '自動生成: 乾長辣椒(紅皮) (僅台灣資料庫)', NULL, '乾長辣椒(紅皮)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_59', '[\"乾香菇\",\"冬(北/花/厚/毛)菇\",\"椎茸\",\"香蕈(信/椹)\",\"合蕈\"]', '菇類', '自動生成: 乾香菇 (僅台灣資料庫)', NULL, '乾香菇');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_60', '[\"乾香菇平均值\",\"冬(北/花/厚/毛)菇\",\"椎茸\",\"香蕈(信/椹)\",\"合蕈\"]', '菇類', '自動生成: 乾香菇平均值 (僅台灣資料庫)', NULL, '乾香菇平均值');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_61', '[\"乾麒麟菜\",\"乾麒麟草\",\"乾海麒麟草\",\"乾海珊湖\",\"乾珊湖藻(草)\",\"乾鹹(鹽/神/福)草\"]', '藻類', '自動生成: 乾麒麟菜 (僅台灣資料庫)', NULL, '乾麒麟菜');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_62', '[\"乾麵條\"]', '加工調理食品及其他類', '自動生成: 乾麵條 (僅台灣資料庫)', NULL, '乾麵條');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_63', '[\"二節翅(土雞)\",\"二節翅\"]', '肉類', '自動生成: 二節翅(土雞) (僅台灣資料庫)', NULL, '二節翅(土雞)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_64', '[\"二節翅(肉雞)\",\"二節翅\"]', '肉類', '自動生成: 二節翅(肉雞) (僅台灣資料庫)', NULL, '二節翅(肉雞)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_65', '[\"二節翅平均值\"]', '肉類', '自動生成: 二節翅平均值 (僅台灣資料庫)', NULL, '二節翅平均值');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_66', '[\"五味醬\"]', '調味料及香辛料類', '自動生成: 五味醬 (僅台灣資料庫)', NULL, '五味醬');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_68', '[\"五香粉\"]', '調味料及香辛料類', '自動生成: 五香粉 (僅台灣資料庫)', NULL, '五香粉');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_69', '[\"五香豆干\"]', '加工調理食品及其他類', '自動生成: 五香豆干 (僅台灣資料庫)', NULL, '五香豆干');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_70', '[\"亞麻仁油\"]', '油脂類', '自動生成: 亞麻仁油 (僅台灣資料庫)', NULL, '亞麻仁油');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_71', '[\"亞麻仁籽\"]', '堅果及種子類', '自動生成: 亞麻仁籽 (僅台灣資料庫)', NULL, '亞麻仁籽');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_72', '[\"亞麻仁籽粉\"]', '堅果及種子類', '自動生成: 亞麻仁籽粉 (僅台灣資料庫)', NULL, '亞麻仁籽粉');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_73', '[\"人心果\",\"吳鳳柿\",\"沙漠吉拉\",\"查某囝仔\",\"人蔘果\"]', '水果類', '自動生成: 人心果 (僅台灣資料庫)', NULL, '人心果');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_77', '[\"仙草凍\"]', '糕餅點心類', '自動生成: 仙草凍 (僅台灣資料庫)', NULL, '仙草凍');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_78', '[\"仙草凍(2020取樣)\",\"仙草凍\"]', '糕餅點心類', '自動生成: 仙草凍(2020取樣) (僅台灣資料庫)', NULL, '仙草凍(2020取樣)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_79', '[\"仙草蜜\"]', '飲料類', '自動生成: 仙草蜜 (僅台灣資料庫)', NULL, '仙草蜜');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_80', '[\"仿刺參\",\"刺參\"]', '魚貝類', '自動生成: 仿刺參 (僅台灣資料庫)', NULL, '仿刺參');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_81', '[\"佃煮黑豆\"]', '加工調理食品及其他類', '自動生成: 佃煮黑豆 (僅台灣資料庫)', NULL, '佃煮黑豆');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_83', '[\"低筋麵粉\"]', '穀物類', '自動生成: 低筋麵粉 (僅台灣資料庫)', NULL, '低筋麵粉');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_85', '[\"低脂強化鮮乳(寡醣強化)\",\"低脂強化鮮乳\",\"牛乳\",\"牛奶\"]', '乳品類', '自動生成: 低脂強化鮮乳(寡醣強化) (僅台灣資料庫)', NULL, '低脂強化鮮乳(寡醣強化)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_86', '[\"低脂強化鮮乳(維生素E強化)\",\"低脂強化鮮乳\",\"牛乳\",\"牛奶\"]', '乳品類', '自動生成: 低脂強化鮮乳(維生素E強化) (僅台灣資料庫)', NULL, '低脂強化鮮乳(維生素E強化)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_87', '[\"低脂濃稠發酵乳\",\"優酪乳\"]', '乳品類', '自動生成: 低脂濃稠發酵乳 (僅台灣資料庫)', NULL, '低脂濃稠發酵乳');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_89', '[\"低脂高湯\"]', '調味料及香辛料類', '自動生成: 低脂高湯 (僅台灣資料庫)', NULL, '低脂高湯');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_90', '[\"低脂鮮乳\",\"牛乳\",\"牛奶\"]', '乳品類', '自動生成: 低脂鮮乳 (僅台灣資料庫)', NULL, '低脂鮮乳');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_93', '[\"保久羊乳\",\"羊奶\"]', '乳品類', '自動生成: 保久羊乳 (僅台灣資料庫)', NULL, '保久羊乳');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_94', '[\"假人蔘\",\"土人參\",\"參仔葉(草)\",\"土高麗參\",\"臺灣(野)參\",\"櫨蘭\",\"東洋參\",\"參草\"]', '蔬菜類', '自動生成: 假人蔘 (僅台灣資料庫)', NULL, '假人蔘');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_98', '[\"僧帽肌\",\"離緣肉\"]', '肉類', '自動生成: 僧帽肌 (僅台灣資料庫)', NULL, '僧帽肌');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_99', '[\"克氏兔頭魨\",\"鯖河魨\",\"煙仔規\",\"黃魚規\",\"烏魚規\",\"青皮魚規\",\"金紙規\",\"規仔\",\"金規(澎湖)\"]', '魚貝類', '自動生成: 克氏兔頭魨 (僅台灣資料庫)', NULL, '克氏兔頭魨');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_100', '[\"免煮飯\"]', '加工調理食品及其他類', '自動生成: 免煮飯 (僅台灣資料庫)', NULL, '免煮飯');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_101', '[\"全脂保久乳\",\"牛乳\",\"牛奶\"]', '乳品類', '自動生成: 全脂保久乳 (僅台灣資料庫)', NULL, '全脂保久乳');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_102', '[\"全脂凝態發酵乳\",\"優格\"]', '乳品類', '自動生成: 全脂凝態發酵乳 (僅台灣資料庫)', NULL, '全脂凝態發酵乳');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_103', '[\"全脂奶粉\",\"乳粉\"]', '乳品類', '自動生成: 全脂奶粉 (僅台灣資料庫)', NULL, '全脂奶粉');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_104', '[\"全脂強化奶粉(纖維強化)\",\"全脂強化奶粉\",\"乳粉\"]', '乳品類', '自動生成: 全脂強化奶粉(纖維強化) (僅台灣資料庫)', NULL, '全脂強化奶粉(纖維強化)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_105', '[\"全脂濃稠發酵乳\",\"優酪乳\"]', '乳品類', '自動生成: 全脂濃稠發酵乳 (僅台灣資料庫)', NULL, '全脂濃稠發酵乳');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_106', '[\"全脂羊奶粉\",\"羊乳粉\"]', '乳品類', '自動生成: 全脂羊奶粉 (僅台灣資料庫)', NULL, '全脂羊奶粉');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_107', '[\"全脂羊奶粉(即溶)\",\"全脂羊奶粉\",\"羊乳粉\"]', '乳品類', '自動生成: 全脂羊奶粉(即溶) (僅台灣資料庫)', NULL, '全脂羊奶粉(即溶)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_108', '[\"全脂鮮乳(10月取樣)\",\"全脂鮮乳\",\"牛乳\",\"牛奶\"]', '乳品類', '自動生成: 全脂鮮乳(10月取樣) (僅台灣資料庫)', NULL, '全脂鮮乳(10月取樣)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_109', '[\"全脂鮮乳(11月取樣)\",\"全脂鮮乳\",\"牛乳\",\"牛奶\"]', '乳品類', '自動生成: 全脂鮮乳(11月取樣) (僅台灣資料庫)', NULL, '全脂鮮乳(11月取樣)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_110', '[\"全脂鮮乳(12月取樣)\",\"全脂鮮乳\",\"牛乳\",\"牛奶\"]', '乳品類', '自動生成: 全脂鮮乳(12月取樣) (僅台灣資料庫)', NULL, '全脂鮮乳(12月取樣)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_111', '[\"全脂鮮乳(1月取樣)\",\"全脂鮮乳\",\"牛乳\",\"牛奶\"]', '乳品類', '自動生成: 全脂鮮乳(1月取樣) (僅台灣資料庫)', NULL, '全脂鮮乳(1月取樣)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_112', '[\"全脂鮮乳(4月取樣)\",\"全脂鮮乳\",\"牛乳\",\"牛奶\"]', '乳品類', '自動生成: 全脂鮮乳(4月取樣) (僅台灣資料庫)', NULL, '全脂鮮乳(4月取樣)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_113', '[\"全脂鮮乳(6月取樣)\",\"全脂鮮乳\",\"牛乳\",\"牛奶\"]', '乳品類', '自動生成: 全脂鮮乳(6月取樣) (僅台灣資料庫)', NULL, '全脂鮮乳(6月取樣)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_114', '[\"全脂鮮乳(7月取樣)\",\"全脂鮮乳\",\"牛乳\",\"牛奶\"]', '乳品類', '自動生成: 全脂鮮乳(7月取樣) (僅台灣資料庫)', NULL, '全脂鮮乳(7月取樣)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_115', '[\"全脂鮮乳(9月取樣)\",\"全脂鮮乳\",\"牛乳\",\"牛奶\"]', '乳品類', '自動生成: 全脂鮮乳(9月取樣) (僅台灣資料庫)', NULL, '全脂鮮乳(9月取樣)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_116', '[\"全脂鮮乳平均值\",\"牛乳\",\"牛奶\"]', '乳品類', '自動生成: 全脂鮮乳平均值 (僅台灣資料庫)', NULL, '全脂鮮乳平均值');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_117', '[\"全麥麵粉\"]', '穀物類', '自動生成: 全麥麵粉 (僅台灣資料庫)', NULL, '全麥麵粉');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_118', '[\"八角\",\"大茴\",\"茴香\"]', '調味料及香辛料類', '自動生成: 八角 (僅台灣資料庫)', NULL, '八角');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_119', '[\"冬瓜\",\"白瓜\",\"東瓜\",\"枕瓜\",\"水芝\",\"地芝\"]', '蔬菜類', '自動生成: 冬瓜 (僅台灣資料庫)', NULL, '冬瓜');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_120', '[\"冬瓜(2022年取樣)\",\"冬瓜\",\"白瓜\",\"東瓜\",\"枕瓜\",\"水芝\",\"地芝\"]', '蔬菜類', '自動生成: 冬瓜(2022年取樣) (僅台灣資料庫)', NULL, '冬瓜(2022年取樣)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_121', '[\"冬瓜平均值\",\"白瓜\",\"東瓜\",\"枕瓜\",\"水芝\",\"地芝\"]', '蔬菜類', '自動生成: 冬瓜平均值 (僅台灣資料庫)', NULL, '冬瓜平均值');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_124', '[\"冬粉\",\"粉絲\"]', '加工調理食品及其他類', '自動生成: 冬粉 (僅台灣資料庫)', NULL, '冬粉');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_125', '[\"冰淇淋粉(香草)\",\"冰淇淋粉\"]', '糕餅點心類', '自動生成: 冰淇淋粉(香草) (僅台灣資料庫)', NULL, '冰淇淋粉(香草)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_127', '[\"冰花\",\"冰菜\",\"水晶冰花\",\"冰葉日中花\"]', '蔬菜類', '自動生成: 冰花 (僅台灣資料庫)', NULL, '冰花');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_128', '[\"冷凍,水晶餃\"]', '加工調理食品及其他類', '自動生成: 冷凍,水晶餃 (僅台灣資料庫)', NULL, '冷凍,水晶餃');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_130', '[\"冷凍叉燒包\"]', '加工調理食品及其他類', '自動生成: 冷凍叉燒包 (僅台灣資料庫)', NULL, '冷凍叉燒包');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_131', '[\"冷凍叉燒包子\"]', '加工調理食品及其他類', '自動生成: 冷凍叉燒包子 (僅台灣資料庫)', NULL, '冷凍叉燒包子');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_133', '[\"冷凍咕咾肉\"]', '加工調理食品及其他類', '自動生成: 冷凍咕咾肉 (僅台灣資料庫)', NULL, '冷凍咕咾肉');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_136', '[\"冷凍干貝酥\"]', '加工調理食品及其他類', '自動生成: 冷凍干貝酥 (僅台灣資料庫)', NULL, '冷凍干貝酥');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_141', '[\"冷凍春捲\"]', '加工調理食品及其他類', '自動生成: 冷凍春捲 (僅台灣資料庫)', NULL, '冷凍春捲');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_142', '[\"冷凍木耳\",\"黑木耳\",\"桑耳\",\"白背毛木耳\",\"木樟(檽/菌/茸/蛾/樅)\",\"樹雞(毛木耳)\"]', '菇類', '自動生成: 冷凍木耳 (僅台灣資料庫)', NULL, '冷凍木耳');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_143', '[\"冷凍毛豆仁\",\"大豆\",\"青大豆\",\"青皮豆\"]', '豆類', '自動生成: 冷凍毛豆仁 (僅台灣資料庫)', NULL, '冷凍毛豆仁');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_144', '[\"冷凍水晶包\"]', '加工調理食品及其他類', '自動生成: 冷凍水晶包 (僅台灣資料庫)', NULL, '冷凍水晶包');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_145', '[\"冷凍洋菇\",\"西洋蘑菇(蘑菇\",\"雙孢蘑菇)\"]', '菇類', '自動生成: 冷凍洋菇 (僅台灣資料庫)', NULL, '冷凍洋菇');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_148', '[\"冷凍烏龍麵\"]', '加工調理食品及其他類', '自動生成: 冷凍烏龍麵 (僅台灣資料庫)', NULL, '冷凍烏龍麵');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_149', '[\"冷凍烤雞翅\"]', '加工調理食品及其他類', '自動生成: 冷凍烤雞翅 (僅台灣資料庫)', NULL, '冷凍烤雞翅');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_150', '[\"冷凍燒賣\"]', '加工調理食品及其他類', '自動生成: 冷凍燒賣 (僅台灣資料庫)', NULL, '冷凍燒賣');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_151', '[\"冷凍燕餃\"]', '加工調理食品及其他類', '自動生成: 冷凍燕餃 (僅台灣資料庫)', NULL, '冷凍燕餃');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_156', '[\"冷凍珍珠丸\"]', '加工調理食品及其他類', '自動生成: 冷凍珍珠丸 (僅台灣資料庫)', NULL, '冷凍珍珠丸');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_157', '[\"冷凍甘薯條\",\"薯條\"]', '加工調理食品及其他類', '自動生成: 冷凍甘薯條 (僅台灣資料庫)', NULL, '冷凍甘薯條');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_158', '[\"冷凍甘藍\",\"高麗菜\",\"包菜\",\"洋白菜\",\"玻璃菜\",\"玉菜\",\"捲心菜\",\"球葉甘藍\",\"結球甘藍\",\"蕃芥藍\"]', '蔬菜類', '自動生成: 冷凍甘藍 (僅台灣資料庫)', NULL, '冷凍甘藍');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_159', '[\"冷凍白饅頭\"]', '加工調理食品及其他類', '自動生成: 冷凍白饅頭 (僅台灣資料庫)', NULL, '冷凍白饅頭');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_161', '[\"冷凍素菜包子\"]', '加工調理食品及其他類', '自動生成: 冷凍素菜包子 (僅台灣資料庫)', NULL, '冷凍素菜包子');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_162', '[\"冷凍素雞塊\"]', '加工調理食品及其他類', '自動生成: 冷凍素雞塊 (僅台灣資料庫)', NULL, '冷凍素雞塊');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_163', '[\"冷凍素食水餃\"]', '加工調理食品及其他類', '自動生成: 冷凍素食水餃 (僅台灣資料庫)', NULL, '冷凍素食水餃');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_164', '[\"冷凍素食熟水餃\"]', '加工調理食品及其他類', '自動生成: 冷凍素食熟水餃 (僅台灣資料庫)', NULL, '冷凍素食熟水餃');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_166', '[\"冷凍芋泥包\"]', '加工調理食品及其他類', '自動生成: 冷凍芋泥包 (僅台灣資料庫)', NULL, '冷凍芋泥包');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_167', '[\"冷凍芋頭塊\"]', '澱粉類', '自動生成: 冷凍芋頭塊 (僅台灣資料庫)', NULL, '冷凍芋頭塊');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_178', '[\"冷凍荔枝\",\"丹荔\",\"荔錦\",\"麗枝\",\"離枝\"]', '水果類', '自動生成: 冷凍荔枝 (僅台灣資料庫)', NULL, '冷凍荔枝');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_179', '[\"冷凍菜肉餛飩\",\"雲吞\"]', '加工調理食品及其他類', '自動生成: 冷凍菜肉餛飩 (僅台灣資料庫)', NULL, '冷凍菜肉餛飩');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_180', '[\"冷凍菜豆(莢)\",\"冷凍菜豆\",\"四季豆\",\"雲藕豆\",\"隱之(元)豆\",\"白(花)雲豆\",\"敏(雲/芸/粉/醜)豆\"]', '豆類', '自動生成: 冷凍菜豆(莢) (僅台灣資料庫)', NULL, '冷凍菜豆(莢)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_182', '[\"冷凍蓮蓉包\"]', '加工調理食品及其他類', '自動生成: 冷凍蓮蓉包 (僅台灣資料庫)', NULL, '冷凍蓮蓉包');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_183', '[\"冷凍蔥油餅\",\"蔥油派\"]', '加工調理食品及其他類', '自動生成: 冷凍蔥油餅 (僅台灣資料庫)', NULL, '冷凍蔥油餅');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_193', '[\"冷凍蟹味棒\",\"蟹肉棒\"]', '加工調理食品及其他類', '自動生成: 冷凍蟹味棒 (僅台灣資料庫)', NULL, '冷凍蟹味棒');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_194', '[\"冷凍豆沙包\"]', '加工調理食品及其他類', '自動生成: 冷凍豆沙包 (僅台灣資料庫)', NULL, '冷凍豆沙包');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_197', '[\"冷凍豬肉包子\"]', '加工調理食品及其他類', '自動生成: 冷凍豬肉包子 (僅台灣資料庫)', NULL, '冷凍豬肉包子');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_198', '[\"冷凍豬肉水餃\"]', '加工調理食品及其他類', '自動生成: 冷凍豬肉水餃 (僅台灣資料庫)', NULL, '冷凍豬肉水餃');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_199', '[\"冷凍豬肉湯包\"]', '加工調理食品及其他類', '自動生成: 冷凍豬肉湯包 (僅台灣資料庫)', NULL, '冷凍豬肉湯包');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_200', '[\"冷凍豬肉湯圓\"]', '加工調理食品及其他類', '自動生成: 冷凍豬肉湯圓 (僅台灣資料庫)', NULL, '冷凍豬肉湯圓');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_201', '[\"冷凍豬肉熟水餃\"]', '加工調理食品及其他類', '自動生成: 冷凍豬肉熟水餃 (僅台灣資料庫)', NULL, '冷凍豬肉熟水餃');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_202', '[\"冷凍豬肉蟹黃水餃\"]', '加工調理食品及其他類', '自動生成: 冷凍豬肉蟹黃水餃 (僅台灣資料庫)', NULL, '冷凍豬肉蟹黃水餃');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_204', '[\"冷凍豬肉餛飩\",\"雲吞\"]', '加工調理食品及其他類', '自動生成: 冷凍豬肉餛飩 (僅台灣資料庫)', NULL, '冷凍豬肉餛飩');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_205', '[\"冷凍貢丸\"]', '加工調理食品及其他類', '自動生成: 冷凍貢丸 (僅台灣資料庫)', NULL, '冷凍貢丸');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_206', '[\"冷凍酸菜焢肉包子\"]', '加工調理食品及其他類', '自動生成: 冷凍酸菜焢肉包子 (僅台灣資料庫)', NULL, '冷凍酸菜焢肉包子');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_207', '[\"冷凍銀絲卷(奶黃)\",\"冷凍銀絲卷\"]', '加工調理食品及其他類', '自動生成: 冷凍銀絲卷(奶黃) (僅台灣資料庫)', NULL, '冷凍銀絲卷(奶黃)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_208', '[\"冷凍雞塊\"]', '加工調理食品及其他類', '自動生成: 冷凍雞塊 (僅台灣資料庫)', NULL, '冷凍雞塊');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_210', '[\"冷凍雪螺餃\"]', '加工調理食品及其他類', '自動生成: 冷凍雪螺餃 (僅台灣資料庫)', NULL, '冷凍雪螺餃');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_213', '[\"冷凍香菇餃\"]', '加工調理食品及其他類', '自動生成: 冷凍香菇餃 (僅台灣資料庫)', NULL, '冷凍香菇餃');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_214', '[\"冷凍馬拉糕\"]', '糕餅點心類', '自動生成: 冷凍馬拉糕 (僅台灣資料庫)', NULL, '冷凍馬拉糕');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_215', '[\"冷凍馬蹄條\"]', '糕餅點心類', '自動生成: 冷凍馬蹄條 (僅台灣資料庫)', NULL, '冷凍馬蹄條');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_221', '[\"冷凍鮪排\"]', '加工調理食品及其他類', '自動生成: 冷凍鮪排 (僅台灣資料庫)', NULL, '冷凍鮪排');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_225', '[\"冷藏堅果饅頭\"]', '加工調理食品及其他類', '自動生成: 冷藏堅果饅頭 (僅台灣資料庫)', NULL, '冷藏堅果饅頭');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_226', '[\"冷藏寧波年糕\"]', '糕餅點心類', '自動生成: 冷藏寧波年糕 (僅台灣資料庫)', NULL, '冷藏寧波年糕');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_227', '[\"冷藏廣式芋頭粿\"]', '糕餅點心類', '自動生成: 冷藏廣式芋頭粿 (僅台灣資料庫)', NULL, '冷藏廣式芋頭粿');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_229', '[\"冷藏甜年糕\"]', '糕餅點心類', '自動生成: 冷藏甜年糕 (僅台灣資料庫)', NULL, '冷藏甜年糕');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_230', '[\"凱撒沙拉醬\"]', '調味料及香辛料類', '自動生成: 凱撒沙拉醬 (僅台灣資料庫)', NULL, '凱撒沙拉醬');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_232', '[\"刀削麵\"]', '加工調理食品及其他類', '自動生成: 刀削麵 (僅台灣資料庫)', NULL, '刀削麵');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_233', '[\"切片乾酪\",\"起司\",\"芝士(市售亦稱\\\"乳酪\\\")\"]', '乳品類', '自動生成: 切片乾酪 (僅台灣資料庫)', NULL, '切片乾酪');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_234', '[\"切片乾酪(低脂)\",\"切片乾酪\",\"起司\",\"芝士(市售亦稱\\\"乳酪\\\")\"]', '乳品類', '自動生成: 切片乾酪(低脂) (僅台灣資料庫)', NULL, '切片乾酪(低脂)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_239', '[\"刨絲乾酪\",\"起司\",\"芝士(市售亦稱\\\"乳酪\\\")\"]', '乳品類', '自動生成: 刨絲乾酪 (僅台灣資料庫)', NULL, '刨絲乾酪');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_240', '[\"刺鯧(去皮)\",\"刺鯧\",\"肉魚\",\"肉鯽仔\",\"土肉\",\"肉鯽\",\"瓜仔鯧\"]', '魚貝類', '自動生成: 刺鯧(去皮) (僅台灣資料庫)', NULL, '刺鯧(去皮)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_241', '[\"刺鯧(含皮)\",\"刺鯧\",\"肉魚\",\"肉鯽仔\",\"土肉\",\"肉鯽\",\"瓜仔鯧\"]', '魚貝類', '自動生成: 刺鯧(含皮) (僅台灣資料庫)', NULL, '刺鯧(含皮)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_242', '[\"前鱗笛鯛\",\"赤筆仔\"]', '魚貝類', '自動生成: 前鱗笛鯛 (僅台灣資料庫)', NULL, '前鱗笛鯛');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_243', '[\"加州紅李(台灣)\",\"加州紅李\",\"李子\"]', '水果類', '自動生成: 加州紅李(台灣) (僅台灣資料庫)', NULL, '加州紅李(台灣)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_244', '[\"加州紅李(進口)\",\"加州紅李\",\"李子\"]', '水果類', '自動生成: 加州紅李(進口) (僅台灣資料庫)', NULL, '加州紅李(進口)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_245', '[\"加州蜜李(進口)\",\"加州蜜李\",\"李子\"]', '水果類', '自動生成: 加州蜜李(進口) (僅台灣資料庫)', NULL, '加州蜜李(進口)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_246', '[\"加州青李\",\"李子\"]', '水果類', '自動生成: 加州青李 (僅台灣資料庫)', NULL, '加州青李');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_251', '[\"包心白菜\",\"大白菜\",\"黃芽菜\",\"卷心白菜\",\"山東白菜\",\"結球白菜\"]', '蔬菜類', '自動生成: 包心白菜 (僅台灣資料庫)', NULL, '包心白菜');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_252', '[\"包心芥菜\",\"包心刈菜\",\"捲心芥菜\"]', '蔬菜類', '自動生成: 包心芥菜 (僅台灣資料庫)', NULL, '包心芥菜');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_253', '[\"包餡甜麻糬(紅豆)\",\"包餡甜麻糬\"]', '糕餅點心類', '自動生成: 包餡甜麻糬(紅豆) (僅台灣資料庫)', NULL, '包餡甜麻糬(紅豆)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_255', '[\"北蕉(0天,綠皮)\",\"北蕉\",\"香蕉\",\"芎蕉\",\"弓蕉\",\"甘蕉\"]', '水果類', '自動生成: 北蕉(0天,綠皮) (僅台灣資料庫)', NULL, '北蕉(0天,綠皮)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_256', '[\"北蕉(11月取樣)\",\"北蕉\",\"香蕉\",\"芎蕉\",\"弓蕉\",\"甘蕉\"]', '水果類', '自動生成: 北蕉(11月取樣) (僅台灣資料庫)', NULL, '北蕉(11月取樣)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_257', '[\"北蕉(1天)\",\"北蕉\",\"香蕉\",\"芎蕉\",\"弓蕉\",\"甘蕉\"]', '水果類', '自動生成: 北蕉(1天) (僅台灣資料庫)', NULL, '北蕉(1天)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_258', '[\"北蕉(2月取樣)\",\"北蕉\",\"香蕉\",\"芎蕉\",\"弓蕉\",\"甘蕉\"]', '水果類', '自動生成: 北蕉(2月取樣) (僅台灣資料庫)', NULL, '北蕉(2月取樣)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_259', '[\"北蕉(3天)\",\"北蕉\",\"香蕉\",\"芎蕉\",\"弓蕉\",\"甘蕉\"]', '水果類', '自動生成: 北蕉(3天) (僅台灣資料庫)', NULL, '北蕉(3天)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_260', '[\"北蕉(5月取樣)\",\"北蕉\",\"香蕉\",\"芎蕉\",\"弓蕉\",\"甘蕉\"]', '水果類', '自動生成: 北蕉(5月取樣) (僅台灣資料庫)', NULL, '北蕉(5月取樣)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_261', '[\"北蕉(7天)\",\"北蕉\",\"香蕉\",\"芎蕉\",\"弓蕉\",\"甘蕉\"]', '水果類', '自動生成: 北蕉(7天) (僅台灣資料庫)', NULL, '北蕉(7天)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_262', '[\"北蕉(9月取樣)\",\"北蕉\",\"香蕉\",\"芎蕉\",\"弓蕉\",\"甘蕉\"]', '水果類', '自動生成: 北蕉(9月取樣) (僅台灣資料庫)', NULL, '北蕉(9月取樣)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_263', '[\"北蕉平均值\",\"香蕉\",\"芎蕉\",\"弓蕉\",\"甘蕉\"]', '水果類', '自動生成: 北蕉平均值 (僅台灣資料庫)', NULL, '北蕉平均值');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_264', '[\"千寶菜\"]', '蔬菜類', '自動生成: 千寶菜 (僅台灣資料庫)', NULL, '千寶菜');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_265', '[\"千島沙拉醬\"]', '調味料及香辛料類', '自動生成: 千島沙拉醬 (僅台灣資料庫)', NULL, '千島沙拉醬');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_268', '[\"南美刺參\"]', '魚貝類', '自動生成: 南美刺參 (僅台灣資料庫)', NULL, '南美刺參');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_269', '[\"南華蕉\",\"香蕉\",\"芎蕉\",\"弓蕉\",\"甘蕉(芭蕉)\"]', '水果類', '自動生成: 南華蕉 (僅台灣資料庫)', NULL, '南華蕉');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_272', '[\"即食燕麥片\"]', '穀物類', '自動生成: 即食燕麥片 (僅台灣資料庫)', NULL, '即食燕麥片');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_273', '[\"原味夏威夷豆\",\"夏威夷火山豆\"]', '堅果及種子類', '自動生成: 原味夏威夷豆 (僅台灣資料庫)', NULL, '原味夏威夷豆');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_274', '[\"原味愛玉凍\",\"愛玉\",\"草子仔\",\"草枳子\",\"天拋藤\",\"玉枳\",\"枳子\",\"天拋\",\"風不動\"]', '糕餅點心類', '自動生成: 原味愛玉凍 (僅台灣資料庫)', NULL, '原味愛玉凍');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_276', '[\"原味榛果\"]', '堅果及種子類', '自動生成: 原味榛果 (僅台灣資料庫)', NULL, '原味榛果');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_278', '[\"原味葵瓜子(去殼)\",\"原味葵瓜子\"]', '堅果及種子類', '自動生成: 原味葵瓜子(去殼) (僅台灣資料庫)', NULL, '原味葵瓜子(去殼)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_279', '[\"厥子\"]', '蔬菜類', '自動生成: 厥子 (僅台灣資料庫)', NULL, '厥子');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_280', '[\"去皮去骨雞腿(肉雞)\",\"去皮去骨雞腿\"]', '肉類', '自動生成: 去皮去骨雞腿(肉雞) (僅台灣資料庫)', NULL, '去皮去骨雞腿(肉雞)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_281', '[\"去皮清肉(土雞)\",\"去皮清肉\",\"去皮雞胸肉\"]', '肉類', '自動生成: 去皮清肉(土雞) (僅台灣資料庫)', NULL, '去皮清肉(土雞)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_282', '[\"去皮清肉(肉雞)\",\"去皮清肉\",\"去皮雞胸肉\"]', '肉類', '自動生成: 去皮清肉(肉雞) (僅台灣資料庫)', NULL, '去皮清肉(肉雞)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_283', '[\"去皮清肉平均值\"]', '肉類', '自動生成: 去皮清肉平均值 (僅台灣資料庫)', NULL, '去皮清肉平均值');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_284', '[\"去筋麵粉\",\"澄粉\"]', '穀物類', '自動生成: 去筋麵粉 (僅台灣資料庫)', NULL, '去筋麵粉');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_286', '[\"去骨牛小排\",\"肥牛肉\",\"小肋排\"]', '肉類', '自動生成: 去骨牛小排 (僅台灣資料庫)', NULL, '去骨牛小排');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_287', '[\"去骨紐約克牛排\",\"外條\",\"西冷\",\"去骨前腰脊肉\"]', '肉類', '自動生成: 去骨紐約克牛排 (僅台灣資料庫)', NULL, '去骨紐約克牛排');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_289', '[\"去骨鴨掌\"]', '肉類', '自動生成: 去骨鴨掌 (僅台灣資料庫)', NULL, '去骨鴨掌');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_290', '[\"叉燒肉\"]', '加工調理食品及其他類', '自動生成: 叉燒肉 (僅台灣資料庫)', NULL, '叉燒肉');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_291', '[\"可可椰子汁(屏東)\",\"可可椰子汁\",\"椰子汁\",\"越王頭汁\"]', '水果類', '自動生成: 可可椰子汁(屏東) (僅台灣資料庫)', NULL, '可可椰子汁(屏東)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_292', '[\"可可椰子汁(進口)\",\"可可椰子汁\",\"椰子汁\",\"越王頭汁\"]', '水果類', '自動生成: 可可椰子汁(進口) (僅台灣資料庫)', NULL, '可可椰子汁(進口)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_293', '[\"可可椰子汁平均值\",\"椰子汁\",\"越王頭汁\"]', '水果類', '自動生成: 可可椰子汁平均值 (僅台灣資料庫)', NULL, '可可椰子汁平均值');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_294', '[\"可可粉\"]', '飲料類', '自動生成: 可可粉 (僅台灣資料庫)', NULL, '可可粉');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_297', '[\"可頌\"]', '糕餅點心類', '自動生成: 可頌 (僅台灣資料庫)', NULL, '可頌');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_298', '[\"台式泡菜\"]', '加工調理食品及其他類', '自動生成: 台式泡菜 (僅台灣資料庫)', NULL, '台式泡菜');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_300', '[\"台灣藜(紅)(帶殼)\",\"台灣藜\",\"藜\",\"赤藜\",\"紫藜\",\"紅心藜\",\"紅藜\",\"食用藜\"]', '穀物類', '自動生成: 台灣藜(紅)(帶殼) (僅台灣資料庫)', NULL, '台灣藜(紅)(帶殼)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_301', '[\"台灣蜆\",\"蜆(蜊/拉)仔\",\"河蜆\"]', '魚貝類', '自動生成: 台灣蜆 (僅台灣資料庫)', NULL, '台灣蜆');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_302', '[\"台灣鎖管\",\"鎖管\",\"小卷\"]', '魚貝類', '自動生成: 台灣鎖管 (僅台灣資料庫)', NULL, '台灣鎖管');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_316', '[\"味噌\"]', '調味料及香辛料類', '自動生成: 味噌 (僅台灣資料庫)', NULL, '味噌');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_317', '[\"味精\"]', '調味料及香辛料類', '自動生成: 味精 (僅台灣資料庫)', NULL, '味精');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_318', '[\"味醂\",\"米醂\",\"米霖\"]', '調味料及香辛料類', '自動生成: 味醂 (僅台灣資料庫)', NULL, '味醂');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_319', '[\"和風沙拉醬\"]', '調味料及香辛料類', '自動生成: 和風沙拉醬 (僅台灣資料庫)', NULL, '和風沙拉醬');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_320', '[\"咖哩塊\"]', '調味料及香辛料類', '自動生成: 咖哩塊 (僅台灣資料庫)', NULL, '咖哩塊');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_321', '[\"咖哩粉\"]', '調味料及香辛料類', '自動生成: 咖哩粉 (僅台灣資料庫)', NULL, '咖哩粉');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_329', '[\"喜來菇\"]', '菇類', '自動生成: 喜來菇 (僅台灣資料庫)', NULL, '喜來菇');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_330', '[\"單斑笛鯛\",\"點記\",\"黑點仔\",\"黃翅\",\"赤筆仔\",\"點誌仔\",\"龍王(臺東)\"]', '魚貝類', '自動生成: 單斑笛鯛 (僅台灣資料庫)', NULL, '單斑笛鯛');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_331', '[\"單角革單棘魨(去皮)\",\"單角革單棘魨\",\"白達仔\",\"一角剝\",\"薄葉剝\",\"光復魚\",\"剝皮魚\",\"狄仔魚(興達)\",\"掃帚\"]', '魚貝類', '自動生成: 單角革單棘魨(去皮) (僅台灣資料庫)', NULL, '單角革單棘魨(去皮)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_332', '[\"單角革單棘魨(含皮)\",\"單角革單棘魨\",\"白達仔\",\"一角剝\",\"薄葉剝\",\"光復魚\",\"剝皮魚\",\"狄仔魚(興達)\",\"掃帚\"]', '魚貝類', '自動生成: 單角革單棘魨(含皮) (僅台灣資料庫)', NULL, '單角革單棘魨(含皮)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_333', '[\"嘉寶果\",\"樹葡萄\"]', '水果類', '自動生成: 嘉寶果 (僅台灣資料庫)', NULL, '嘉寶果');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_334', '[\"嘉寶瓜\",\"水瓜\",\"寒瓜\",\"夏瓜(嘉寶兵瓜)\"]', '水果類', '自動生成: 嘉寶瓜 (僅台灣資料庫)', NULL, '嘉寶瓜');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_335', '[\"嘉玉甜瓜\",\"甜瓜\",\"甘瓜\",\"果瓜\",\"香瓜\",\"梨仔瓜\",\"澎湖瓜\"]', '水果類', '自動生成: 嘉玉甜瓜 (僅台灣資料庫)', NULL, '嘉玉甜瓜');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_336', '[\"四周柿\",\"柿子\",\"柹\",\"香柿(紅柿\",\"軟柿)\"]', '水果類', '自動生成: 四周柿 (僅台灣資料庫)', NULL, '四周柿');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_338', '[\"國產甜柿\",\"柿子\",\"柹\",\"香柿\"]', '水果類', '自動生成: 國產甜柿 (僅台灣資料庫)', NULL, '國產甜柿');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_339', '[\"國產紅棗\",\"紅棗\"]', '水果類', '自動生成: 國產紅棗 (僅台灣資料庫)', NULL, '國產紅棗');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_340', '[\"圓果金柑\",\"金桔\",\"金橘\",\"桔子\"]', '水果類', '自動生成: 圓果金柑 (僅台灣資料庫)', NULL, '圓果金柑');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_341', '[\"圓果金柑汁(綠皮)\",\"圓果金柑汁\",\"金桔\",\"金橘\",\"桔子\"]', '水果類', '自動生成: 圓果金柑汁(綠皮) (僅台灣資料庫)', NULL, '圓果金柑汁(綠皮)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_345', '[\"土司\"]', '糕餅點心類', '自動生成: 土司 (僅台灣資料庫)', NULL, '土司');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_346', '[\"土司(含全穀粉)\",\"土司\"]', '糕餅點心類', '自動生成: 土司(含全穀粉) (僅台灣資料庫)', NULL, '土司(含全穀粉)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_347', '[\"土番鴨\"]', '肉類', '自動生成: 土番鴨 (僅台灣資料庫)', NULL, '土番鴨');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_349', '[\"土芭樂\",\"番石榴\",\"芭樂\",\"拔仔\",\"扒仔\",\"朳仔\",\"那拔仔\",\"藍拔\"]', '水果類', '自動生成: 土芭樂 (僅台灣資料庫)', NULL, '土芭樂');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_350', '[\"土雞\",\"放山雞\",\"走地雞\"]', '肉類', '自動生成: 土雞 (僅台灣資料庫)', NULL, '土雞');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_355', '[\"培根\",\"三層煙肉\"]', '加工調理食品及其他類', '自動生成: 培根 (僅台灣資料庫)', NULL, '培根');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_356', '[\"塔菇菜(有機)\",\"塔菇菜\",\"塌棵菜；塔菜；瓢兒芥\"]', '蔬菜類', '自動生成: 塔菇菜(有機) (僅台灣資料庫)', NULL, '塔菇菜(有機)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_357', '[\"壽司(豆皮壽司)\",\"壽司\",\"稻禾壽司\"]', '加工調理食品及其他類', '自動生成: 壽司(豆皮壽司) (僅台灣資料庫)', NULL, '壽司(豆皮壽司)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_358', '[\"壽司海苔片\"]', '藻類', '自動生成: 壽司海苔片 (僅台灣資料庫)', NULL, '壽司海苔片');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_361', '[\"多鱗四指馬鮁\",\"四絲馬鮁\",\"四指馬鮁\",\"竹午\",\"大午\",\"午仔\",\"鬚午仔/發鬚午仔(澎湖)\"]', '魚貝類', '自動生成: 多鱗四指馬鮁 (僅台灣資料庫)', NULL, '多鱗四指馬鮁');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_362', '[\"多鱗沙鮻\",\"沙腸仔\",\"kiss 魚\"]', '魚貝類', '自動生成: 多鱗沙鮻 (僅台灣資料庫)', NULL, '多鱗沙鮻');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_363', '[\"大口逆鈎鰺\",\"七星仔\",\"棘蔥仔\",\"鬼平\",\"龜濱\",\"龜柄\",\"油面仔(臺東)\",\"歸秉/龜秉/肥柄(澎湖)\"]', '魚貝類', '自動生成: 大口逆鈎鰺 (僅台灣資料庫)', NULL, '大口逆鈎鰺');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_364', '[\"大口鰜切片(含皮)\",\"大口鰜切片\",\"咬龍狗\",\"左口\",\"扁魚\",\"皇帝魚\",\"比目魚\",\"咬網狗/肉瞇仔(澎湖)\"]', '魚貝類', '自動生成: 大口鰜切片(含皮) (僅台灣資料庫)', NULL, '大口鰜切片(含皮)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_365', '[\"大口黑鱸\",\"黑鱸\",\"加州鱸\",\"淡水鱸\"]', '魚貝類', '自動生成: 大口黑鱸 (僅台灣資料庫)', NULL, '大口黑鱸');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_366', '[\"大心芥菜\",\"大心菜\",\"菜心\",\"大骨芥菜\",\"大莖菜\"]', '蔬菜類', '自動生成: 大心芥菜 (僅台灣資料庫)', NULL, '大心芥菜');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_368', '[\"大甲鰺\",\"鐵甲\",\"扁甲\",\"大目巴攏\"]', '魚貝類', '自動生成: 大甲鰺 (僅台灣資料庫)', NULL, '大甲鰺');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_371', '[\"大目鮪\",\"大目仔\",\"大眼鮪\",\"大目串\",\"短墩\",\"串仔(澎湖)\",\"短鮪\"]', '魚貝類', '自動生成: 大目鮪 (僅台灣資料庫)', NULL, '大目鮪');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_374', '[\"大芥菜\",\"芥菜\",\"大心芥菜\",\"大葉芥菜\",\"長年菜\",\"孤腰菜\"]', '蔬菜類', '自動生成: 大芥菜 (僅台灣資料庫)', NULL, '大芥菜');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_382', '[\"大豆油\",\"黃豆油\",\"沙拉油\"]', '油脂類', '自動生成: 大豆油 (僅台灣資料庫)', NULL, '大豆油');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_383', '[\"大豆油(卵磷脂強化)\",\"大豆油\"]', '油脂類', '自動生成: 大豆油(卵磷脂強化) (僅台灣資料庫)', NULL, '大豆油(卵磷脂強化)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_384', '[\"大豆油(多種維生素強化)\",\"大豆油\",\"沙拉油\"]', '油脂類', '自動生成: 大豆油(多種維生素強化) (僅台灣資料庫)', NULL, '大豆油(多種維生素強化)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_385', '[\"大雪梨\",\"梨子\",\"水梨\",\"山褵\",\"快果\",\"果宗\"]', '水果類', '自動生成: 大雪梨 (僅台灣資料庫)', NULL, '大雪梨');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_387', '[\"大餅包小餅(紅豆)\",\"大餅包小餅\"]', '加工調理食品及其他類', '自動生成: 大餅包小餅(紅豆) (僅台灣資料庫)', NULL, '大餅包小餅(紅豆)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_388', '[\"大麥仁\",\"小薏仁\",\"洋薏仁\",\"珍珠薏仁\"]', '穀物類', '自動生成: 大麥仁 (僅台灣資料庫)', NULL, '大麥仁');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_389', '[\"大麥仁粉\",\"小薏仁粉\",\"洋薏仁粉\",\"珍珠薏仁粉\"]', '穀物類', '自動生成: 大麥仁粉 (僅台灣資料庫)', NULL, '大麥仁粉');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_390', '[\"大麥片\"]', '穀物類', '自動生成: 大麥片 (僅台灣資料庫)', NULL, '大麥片');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_392', '[\"天喜菇\"]', '菇類', '自動生成: 天喜菇 (僅台灣資料庫)', NULL, '天喜菇');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_393', '[\"天婦羅\",\"甜不辣\"]', '加工調理食品及其他類', '自動生成: 天婦羅 (僅台灣資料庫)', NULL, '天婦羅');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_395', '[\"天香洋香瓜\",\"甜瓜\",\"甘瓜\",\"果瓜\",\"香瓜\",\"梨仔瓜\",\"澎湖瓜\",\"洋香瓜\",\"網仔瓜\",\"哈蜜瓜\"]', '水果類', '自動生成: 天香洋香瓜 (僅台灣資料庫)', NULL, '天香洋香瓜');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_397', '[\"太空鴨\"]', '肉類', '自動生成: 太空鴨 (僅台灣資料庫)', NULL, '太空鴨');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_398', '[\"太空鴨(去皮)\",\"太空鴨\"]', '肉類', '自動生成: 太空鴨(去皮) (僅台灣資料庫)', NULL, '太空鴨(去皮)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_399', '[\"太陽洋香瓜\",\"甜瓜\",\"甘瓜\",\"果瓜\",\"香瓜\",\"梨仔瓜\",\"澎湖瓜\",\"洋香瓜\"]', '水果類', '自動生成: 太陽洋香瓜 (僅台灣資料庫)', NULL, '太陽洋香瓜');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_400', '[\"太陽餅\"]', '糕餅點心類', '自動生成: 太陽餅 (僅台灣資料庫)', NULL, '太陽餅');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_402', '[\"奇亞子\"]', '堅果及種子類', '自動生成: 奇亞子 (僅台灣資料庫)', NULL, '奇亞子');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_408', '[\"奶精粉\",\"奶精\",\"植物性奶精\"]', '調味料及香辛料類', '自動生成: 奶精粉 (僅台灣資料庫)', NULL, '奶精粉');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_409', '[\"奶精粉(2021年)\",\"奶精粉\",\"奶精\"]', '調味料及香辛料類', '自動生成: 奶精粉(2021年) (僅台灣資料庫)', NULL, '奶精粉(2021年)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_410', '[\"奶精粉(低脂)\",\"奶精粉\",\"奶精\",\"植物性奶精\"]', '調味料及香辛料類', '自動生成: 奶精粉(低脂) (僅台灣資料庫)', NULL, '奶精粉(低脂)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_414', '[\"姬松茸\",\"姬松菇\",\"巴西蘑菇\",\"柏氏蘑菇\",\"小松菇\"]', '菇類', '自動生成: 姬松茸 (僅台灣資料庫)', NULL, '姬松茸');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_416', '[\"嫩莖萵苣\",\"鵝菜心\",\"莖用萵苣\",\"萵(鵝)仔菜心\",\"大心萵(媚)仔菜\",\"萵苣筍(莖)\",\"妹仔菜筍\"]', '蔬菜類', '自動生成: 嫩莖萵苣 (僅台灣資料庫)', NULL, '嫩莖萵苣');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_419', '[\"孟加拉笛鯛\",\"赤筆仔\",\"黃雞母(澎湖)\"]', '魚貝類', '自動生成: 孟加拉笛鯛 (僅台灣資料庫)', NULL, '孟加拉笛鯛');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_421', '[\"安石榴\",\"石榴\",\"榭榴\",\"謝榴\",\"樹榴\"]', '水果類', '自動生成: 安石榴 (僅台灣資料庫)', NULL, '安石榴');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_422', '[\"宜蘭粉蔥\",\"蔥\",\"葉蔥\",\"蔥仔\",\"水蔥\",\"漢蔥\"]', '蔬菜類', '自動生成: 宜蘭粉蔥 (僅台灣資料庫)', NULL, '宜蘭粉蔥');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_426', '[\"富有甜柿(大雪山)\",\"富有甜柿\",\"柿子\",\"柹\",\"香柿\"]', '水果類', '自動生成: 富有甜柿(大雪山) (僅台灣資料庫)', NULL, '富有甜柿(大雪山)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_427', '[\"富珍茸\"]', '菇類', '自動生成: 富珍茸 (僅台灣資料庫)', NULL, '富珍茸');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_428', '[\"寒天脆藻\",\"水晶脆藻\"]', '加工調理食品及其他類', '自動生成: 寒天脆藻 (僅台灣資料庫)', NULL, '寒天脆藻');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_429', '[\"寬粉\",\"寬條冬粉\"]', '加工調理食品及其他類', '自動生成: 寬粉 (僅台灣資料庫)', NULL, '寬粉');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_430', '[\"將軍蜜梨\",\"梨子\",\"水梨\",\"山褵\",\"快果\",\"果宗(三星上將梨)\"]', '水果類', '自動生成: 將軍蜜梨 (僅台灣資料庫)', NULL, '將軍蜜梨');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_432', '[\"小卷干\",\"鎖管干(乾)\"]', '魚貝類', '自動生成: 小卷干 (僅台灣資料庫)', NULL, '小卷干');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_434', '[\"小方豆干\"]', '加工調理食品及其他類', '自動生成: 小方豆干 (僅台灣資料庫)', NULL, '小方豆干');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_436', '[\"小甜椒(青皮)\",\"小甜椒\",\"甜椒\",\"甜番椒\",\"大同仔\",\"番羌仔\",\"燈籠椒\",\"生番薑\",\"獅子椒\",\"甘椒\",\"生椒(青椒\",\"青辣椒)\"]', '蔬菜類', '自動生成: 小甜椒(青皮) (僅台灣資料庫)', NULL, '小甜椒(青皮)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_439', '[\"小白菜(土植)(10月取樣)\",\"小白菜\",\"土白菜\",\"青菜\",\"白菜\",\"不結球白菜\",\"水白菜\"]', '蔬菜類', '自動生成: 小白菜(土植)(10月取樣) (僅台灣資料庫)', NULL, '小白菜(土植)(10月取樣)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_440', '[\"小白菜(土植)(1月取樣)\",\"小白菜\",\"土白菜\",\"青菜\",\"白菜\",\"不結球白菜\",\"水白菜\"]', '蔬菜類', '自動生成: 小白菜(土植)(1月取樣) (僅台灣資料庫)', NULL, '小白菜(土植)(1月取樣)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_441', '[\"小白菜(土植)(3月取樣)\",\"小白菜\",\"土白菜\",\"青菜\",\"白菜\",\"不結球白菜\",\"水白菜\"]', '蔬菜類', '自動生成: 小白菜(土植)(3月取樣) (僅台灣資料庫)', NULL, '小白菜(土植)(3月取樣)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_442', '[\"小白菜(土植)(4月取樣)\",\"小白菜\",\"土白菜\",\"青菜\",\"白菜\",\"不結球白菜\",\"水白菜\"]', '蔬菜類', '自動生成: 小白菜(土植)(4月取樣) (僅台灣資料庫)', NULL, '小白菜(土植)(4月取樣)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_443', '[\"小白菜(土植)(7月取樣)\",\"小白菜\",\"土白菜\",\"青菜\",\"白菜\",\"不結球白菜\",\"水白菜\"]', '蔬菜類', '自動生成: 小白菜(土植)(7月取樣) (僅台灣資料庫)', NULL, '小白菜(土植)(7月取樣)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_444', '[\"小白菜(有機)(10月取樣)\",\"小白菜\",\"土白菜\",\"青菜\",\"白菜\",\"不結球白菜\",\"水白菜\"]', '蔬菜類', '自動生成: 小白菜(有機)(10月取樣) (僅台灣資料庫)', NULL, '小白菜(有機)(10月取樣)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_445', '[\"小白菜(有機)(1月取樣)\",\"小白菜\",\"土白菜\",\"青菜\",\"白菜\",\"不結球白菜\",\"水白菜\"]', '蔬菜類', '自動生成: 小白菜(有機)(1月取樣) (僅台灣資料庫)', NULL, '小白菜(有機)(1月取樣)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_446', '[\"小白菜(有機)(4月取樣)\",\"小白菜\",\"土白菜\",\"青菜\",\"白菜\",\"不結球白菜\",\"水白菜\"]', '蔬菜類', '自動生成: 小白菜(有機)(4月取樣) (僅台灣資料庫)', NULL, '小白菜(有機)(4月取樣)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_447', '[\"小白菜(有機)(7月取樣)\",\"小白菜\",\"土白菜\",\"青菜\",\"白菜\",\"不結球白菜\",\"水白菜\"]', '蔬菜類', '自動生成: 小白菜(有機)(7月取樣) (僅台灣資料庫)', NULL, '小白菜(有機)(7月取樣)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_448', '[\"小白菜(水耕)(10月取樣)\",\"小白菜\",\"土白菜\",\"青菜\",\"白菜\",\"不結球白菜\",\"水白菜\"]', '蔬菜類', '自動生成: 小白菜(水耕)(10月取樣) (僅台灣資料庫)', NULL, '小白菜(水耕)(10月取樣)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_449', '[\"小白菜(水耕)(1月取樣)\",\"小白菜\",\"土白菜\",\"青菜\",\"白菜\",\"不結球白菜\",\"水白菜\"]', '蔬菜類', '自動生成: 小白菜(水耕)(1月取樣) (僅台灣資料庫)', NULL, '小白菜(水耕)(1月取樣)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_450', '[\"小白菜(水耕)(4月取樣)\",\"小白菜\",\"土白菜\",\"青菜\",\"白菜\",\"不結球白菜\",\"水白菜\"]', '蔬菜類', '自動生成: 小白菜(水耕)(4月取樣) (僅台灣資料庫)', NULL, '小白菜(水耕)(4月取樣)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_451', '[\"小白菜(水耕)(7月取樣)\",\"小白菜\",\"土白菜\",\"青菜\",\"白菜\",\"不結球白菜\",\"水白菜\"]', '蔬菜類', '自動生成: 小白菜(水耕)(7月取樣) (僅台灣資料庫)', NULL, '小白菜(水耕)(7月取樣)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_452', '[\"小籠包\"]', '加工調理食品及其他類', '自動生成: 小籠包 (僅台灣資料庫)', NULL, '小籠包');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_454', '[\"小羊腰脊肉\",\"去骨腰脊肉\"]', '肉類', '自動生成: 小羊腰脊肉 (僅台灣資料庫)', NULL, '小羊腰脊肉');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_455', '[\"小芋頭(山芋)\",\"小芋頭\",\"芋頭\",\"芋艿\",\"芋乃\",\"芋仔\",\"青芋\",\"土芝\"]', '澱粉類', '自動生成: 小芋頭(山芋) (僅台灣資料庫)', NULL, '小芋頭(山芋)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_456', '[\"小茴香粉\",\"孜然粉\"]', '調味料及香辛料類', '自動生成: 小茴香粉 (僅台灣資料庫)', NULL, '小茴香粉');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_459', '[\"小麥\"]', '穀物類', '自動生成: 小麥 (僅台灣資料庫)', NULL, '小麥');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_460', '[\"小麥胚芽\"]', '穀物類', '自動生成: 小麥胚芽 (僅台灣資料庫)', NULL, '小麥胚芽');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_461', '[\"小麥苗\"]', '蔬菜類', '自動生成: 小麥苗 (僅台灣資料庫)', NULL, '小麥苗');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_462', '[\"小麥草粉\",\"小麥苗粉\"]', '飲料類', '自動生成: 小麥草粉 (僅台灣資料庫)', NULL, '小麥草粉');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_465', '[\"尖嘴鱸(去皮)\",\"尖嘴鱸\",\"金目鱸\",\"盲槽\",\"扁紅目鱸\"]', '魚貝類', '自動生成: 尖嘴鱸(去皮) (僅台灣資料庫)', NULL, '尖嘴鱸(去皮)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_466', '[\"尖嘴鱸(含皮)\",\"尖嘴鱸\",\"金目鱸\",\"盲槽\",\"扁紅目鱸\"]', '魚貝類', '自動生成: 尖嘴鱸(含皮) (僅台灣資料庫)', NULL, '尖嘴鱸(含皮)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_467', '[\"尖鎖管 \",\"尖鎖管\",\"尖仔鎖管\",\"詩博加槍烏賊\",\"尖仔\",\"小卷(幼體)\"]', '魚貝類', '自動生成: 尖鎖管  (僅台灣資料庫)', NULL, '尖鎖管 ');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_468', '[\"尼羅口孵非鯽(去皮)\",\"尼羅口孵非鯽\",\"南洋鯽仔\",\"尼羅吳郭魚\"]', '魚貝類', '自動生成: 尼羅口孵非鯽(去皮) (僅台灣資料庫)', NULL, '尼羅口孵非鯽(去皮)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_469', '[\"尼羅口孵非鯽(含皮)\",\"尼羅口孵非鯽\",\"南洋鯽仔\",\"尼羅吳郭魚\"]', '魚貝類', '自動生成: 尼羅口孵非鯽(含皮) (僅台灣資料庫)', NULL, '尼羅口孵非鯽(含皮)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_470', '[\"尼羅口孵非鯽(含皮)(2022年取樣)\",\"尼羅口孵非鯽\",\"南洋鯽仔\",\"尼羅吳郭魚\"]', '魚貝類', '自動生成: 尼羅口孵非鯽(含皮)(2022年取樣) (僅台灣資料庫)', NULL, '尼羅口孵非鯽(含皮)(2022年取樣)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_471', '[\"山東大蔥\",\"蔥\",\"大蔥\",\"葉蔥\",\"蔥仔\",\"水蔥\",\"漢蔥\"]', '蔬菜類', '自動生成: 山東大蔥 (僅台灣資料庫)', NULL, '山東大蔥');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_472', '[\"山楂\"]', '調味料及香辛料類', '自動生成: 山楂 (僅台灣資料庫)', NULL, '山楂');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_473', '[\"山竹\",\"鳳果\",\"都捻子\",\"倒稔子\",\"羅漢果\",\"莽吉柿\",\"果中之后\"]', '水果類', '自動生成: 山竹 (僅台灣資料庫)', NULL, '山竹');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_474', '[\"山粉圓\"]', '堅果及種子類', '自動生成: 山粉圓 (僅台灣資料庫)', NULL, '山粉圓');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_475', '[\"山羊前腿肉片\"]', '肉類', '自動生成: 山羊前腿肉片 (僅台灣資料庫)', NULL, '山羊前腿肉片');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_477', '[\"山羊後腿肉火鍋片\"]', '肉類', '自動生成: 山羊後腿肉火鍋片 (僅台灣資料庫)', NULL, '山羊後腿肉火鍋片');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_479', '[\"山葵粉\"]', '調味料及香辛料類', '自動生成: 山葵粉 (僅台灣資料庫)', NULL, '山葵粉');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_480', '[\"山葵醬\",\"芥茉醬\"]', '調味料及香辛料類', '自動生成: 山葵醬 (僅台灣資料庫)', NULL, '山葵醬');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_481', '[\"山藥(中國長品)\",\"山藥\",\"山芋\",\"山薯\",\"田薯\",\"薯蕷\",\"長薯;淮山(加工後)\"]', '澱粉類', '自動生成: 山藥(中國長品) (僅台灣資料庫)', NULL, '山藥(中國長品)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_482', '[\"山藥(二刺)\",\"山藥\",\"山芋\",\"山薯\",\"田薯\",\"薯蕷\",\"長薯;淮山(加工後)\"]', '澱粉類', '自動生成: 山藥(二刺) (僅台灣資料庫)', NULL, '山藥(二刺)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_483', '[\"山藥(台農1號)\",\"山藥\",\"山芋\",\"山薯\",\"田薯\",\"薯蕷\",\"長薯;淮山(加工後)\"]', '澱粉類', '自動生成: 山藥(台農1號) (僅台灣資料庫)', NULL, '山藥(台農1號)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_484', '[\"山藥(台農2號)\",\"山藥\",\"山芋\",\"山薯\",\"田薯\",\"薯蕷\",\"長薯;淮山(加工後)\"]', '澱粉類', '自動生成: 山藥(台農2號) (僅台灣資料庫)', NULL, '山藥(台農2號)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_485', '[\"山藥(大刺)\",\"山藥\",\"山芋\",\"山薯\",\"田薯\",\"薯蕷\",\"長薯;淮山(加工後)\"]', '澱粉類', '自動生成: 山藥(大刺) (僅台灣資料庫)', NULL, '山藥(大刺)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_486', '[\"山藥(大汕1號)\",\"山藥\",\"山芋\",\"山薯\",\"田薯\",\"薯蕷\",\"長薯;淮山(加工後)\"]', '澱粉類', '自動生成: 山藥(大汕1號) (僅台灣資料庫)', NULL, '山藥(大汕1號)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_487', '[\"山藥(大汕3號)\",\"山藥\",\"山芋\",\"山薯\",\"田薯\",\"薯蕷\",\"長薯;淮山(加工後)\"]', '澱粉類', '自動生成: 山藥(大汕3號) (僅台灣資料庫)', NULL, '山藥(大汕3號)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_488', '[\"山藥(宜蘭原生種)\",\"山藥\",\"山芋\",\"山薯\",\"田薯\",\"薯蕷\",\"長薯;淮山(加工後)\"]', '澱粉類', '自動生成: 山藥(宜蘭原生種) (僅台灣資料庫)', NULL, '山藥(宜蘭原生種)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_489', '[\"山藥(尖石原生種)\",\"山藥\",\"山芋\",\"山薯\",\"田薯\",\"薯蕷\",\"長薯;淮山(加工後)\"]', '澱粉類', '自動生成: 山藥(尖石原生種) (僅台灣資料庫)', NULL, '山藥(尖石原生種)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_490', '[\"山藥(白皮削)\",\"山藥\",\"山芋\",\"山薯\",\"田薯\",\"薯蕷\",\"長薯;淮山(加工後)\"]', '澱粉類', '自動生成: 山藥(白皮削) (僅台灣資料庫)', NULL, '山藥(白皮削)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_491', '[\"山藥(白肉)\",\"山藥\",\"日本山藥\"]', '澱粉類', '自動生成: 山藥(白肉) (僅台灣資料庫)', NULL, '山藥(白肉)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_492', '[\"山藥(花蓮3號)\",\"山藥\",\"山芋\",\"山薯\",\"田薯\",\"薯蕷\",\"長薯;淮山(加工後)\"]', '澱粉類', '自動生成: 山藥(花蓮3號) (僅台灣資料庫)', NULL, '山藥(花蓮3號)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_493', '[\"山藥(青森)\",\"山藥\",\"山芋\",\"山薯\",\"田薯\",\"薯蕷\",\"長薯;淮山(加工後)\"]', '澱粉類', '自動生成: 山藥(青森) (僅台灣資料庫)', NULL, '山藥(青森)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_494', '[\"山藥(高田)\",\"山藥\",\"山芋\",\"山薯\",\"田薯\",\"薯蕷\",\"長薯;淮山(加工後)\"]', '澱粉類', '自動生成: 山藥(高田) (僅台灣資料庫)', NULL, '山藥(高田)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_495', '[\"山藥平均值\",\"山芋\",\"山薯\",\"田薯\",\"薯蕷\",\"長薯;淮山(加工後)\"]', '澱粉類', '自動生成: 山藥平均值 (僅台灣資料庫)', NULL, '山藥平均值');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_496', '[\"山蘇菜\",\"山蘇花\",\"鳥巢蕨\",\"山翅菜\",\"雀(鳥)巢羊齒\",\"歪頭 菜\",\"巢鐵角蕨\",\"掌草\"]', '蔬菜類', '自動生成: 山蘇菜 (僅台灣資料庫)', NULL, '山蘇菜');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_497', '[\"山豬肉片\",\"山豬肉\"]', '肉類', '自動生成: 山豬肉片 (僅台灣資料庫)', NULL, '山豬肉片');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_499', '[\"巧克力冰淇淋\"]', '糕餅點心類', '自動生成: 巧克力冰淇淋 (僅台灣資料庫)', NULL, '巧克力冰淇淋');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_502', '[\"巧克力醬(液體)\",\"巧克力醬\"]', '調味料及香辛料類', '自動生成: 巧克力醬(液體) (僅台灣資料庫)', NULL, '巧克力醬(液體)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_504', '[\"布丁粉\"]', '糕餅點心類', '自動生成: 布丁粉 (僅台灣資料庫)', NULL, '布丁粉');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_505', '[\"布氏鯧鰺(去皮)\",\"布氏鯧鰺\",\"金槍\",\"金鯧\",\"紅杉\",\"紅沙瓜仔\",\"長鰭黃臘鰺\",\"甘仔魚(臺東)\",\"紅紗(澎湖)\"]', '魚貝類', '自動生成: 布氏鯧鰺(去皮) (僅台灣資料庫)', NULL, '布氏鯧鰺(去皮)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_506', '[\"布氏鯧鰺(含皮)\",\"布氏鯧鰺\",\"金槍\",\"金鯧\",\"紅杉\",\"紅沙瓜仔\",\"長鰭黃臘鰺\",\"甘仔魚(臺東)\",\"紅紗(澎湖)\"]', '魚貝類', '自動生成: 布氏鯧鰺(含皮) (僅台灣資料庫)', NULL, '布氏鯧鰺(含皮)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_507', '[\"希氏姬鯛\",\"鎖吾\",\"散午\",\"紅魚仔\",\"紅臭魚仔\",\"紅臭魚(臺東)\",\"白肉蒜\"]', '魚貝類', '自動生成: 希氏姬鯛 (僅台灣資料庫)', NULL, '希氏姬鯛');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_514', '[\"帶骨去皮對切胸(肉雞)\",\"帶骨去皮對切胸\"]', '肉類', '自動生成: 帶骨去皮對切胸(肉雞) (僅台灣資料庫)', NULL, '帶骨去皮對切胸(肉雞)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_515', '[\"帶骨帶皮對切胸(肉雞)\",\"帶骨帶皮對切胸\"]', '肉類', '自動生成: 帶骨帶皮對切胸(肉雞) (僅台灣資料庫)', NULL, '帶骨帶皮對切胸(肉雞)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_516', '[\"帶骨牛小排\",\"牛仔骨\"]', '肉類', '自動生成: 帶骨牛小排 (僅台灣資料庫)', NULL, '帶骨牛小排');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_517', '[\"干貝(乾)\",\"干貝\",\"元貝\",\"瑤柱\"]', '魚貝類', '自動生成: 干貝(乾) (僅台灣資料庫)', NULL, '干貝(乾)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_518', '[\"干貝(乾)平均值\",\"干貝平均值\"]', '魚貝類', '自動生成: 干貝(乾)平均值 (僅台灣資料庫)', NULL, '干貝(乾)平均值');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_519', '[\"干貝(冷凍)\",\"干貝\",\"元貝\",\"瑤柱\"]', '魚貝類', '自動生成: 干貝(冷凍) (僅台灣資料庫)', NULL, '干貝(冷凍)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_520', '[\"干貝醬\",\"XO醬\"]', '調味料及香辛料類', '自動生成: 干貝醬 (僅台灣資料庫)', NULL, '干貝醬');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_521', '[\"平鯛\",\"黃錫鯛\",\"枋頭\",\"邦頭/枋頭/白嘉鱲(澎湖)\"]', '魚貝類', '自動生成: 平鯛 (僅台灣資料庫)', NULL, '平鯛');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_522', '[\"幸水梨\",\"梨子\",\"水梨\",\"山褵\",\"快果\",\"果宗\"]', '水果類', '自動生成: 幸水梨 (僅台灣資料庫)', NULL, '幸水梨');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_523', '[\"康氏馬加鰆切片(去皮)\",\"康氏馬加鰆切片\",\"土魠\",\"馬加\",\"馬鮫\",\"梭齒\",\"頭魠\",\"鰆\",\"土托\",\"康氏馬發\",\"塗魠(澎湖)\"]', '魚貝類', '自動生成: 康氏馬加鰆切片(去皮) (僅台灣資料庫)', NULL, '康氏馬加鰆切片(去皮)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_524', '[\"康氏馬加鰆切片(含皮)\",\"康氏馬加鰆切片\",\"土魠\",\"馬加\",\"馬鮫\",\"梭齒\",\"頭魠\",\"鰆\",\"土托\",\"康氏馬發\",\"塗魠(澎湖)\"]', '魚貝類', '自動生成: 康氏馬加鰆切片(含皮) (僅台灣資料庫)', NULL, '康氏馬加鰆切片(含皮)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_525', '[\"廣島野菜\",\"廣島菜\"]', '蔬菜類', '自動生成: 廣島野菜 (僅台灣資料庫)', NULL, '廣島野菜');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_526', '[\"廣東粥\"]', '加工調理食品及其他類', '自動生成: 廣東粥 (僅台灣資料庫)', NULL, '廣東粥');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_527', '[\"廣東萵苣\",\"皺葉萵苣\",\"縮葉萵苣\",\"皺萵仔菜\",\"皺妹菜\"]', '蔬菜類', '自動生成: 廣東萵苣 (僅台灣資料庫)', NULL, '廣東萵苣');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_528', '[\"後刺尾鯛\",\"倒吊\",\"粗皮仔\",\"番倒吊(澎湖)\",\"半水吊\"]', '魚貝類', '自動生成: 後刺尾鯛 (僅台灣資料庫)', NULL, '後刺尾鯛');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_531', '[\"意麵\"]', '加工調理食品及其他類', '自動生成: 意麵 (僅台灣資料庫)', NULL, '意麵');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_533', '[\"愛玉子\",\"愛玉\",\"草子仔\",\"草枳子\",\"天拋藤\",\"玉枳\",\"枳子\",\"天拋\",\"風不動\"]', '堅果及種子類', '自動生成: 愛玉子 (僅台灣資料庫)', NULL, '愛玉子');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_535', '[\"披薩(夏威夷)\",\"披薩\"]', '加工調理食品及其他類', '自動生成: 披薩(夏威夷) (僅台灣資料庫)', NULL, '披薩(夏威夷)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_536', '[\"抱子芥菜\",\"娃娃菜\"]', '蔬菜類', '自動生成: 抱子芥菜 (僅台灣資料庫)', NULL, '抱子芥菜');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_538', '[\"拉麵\"]', '加工調理食品及其他類', '自動生成: 拉麵 (僅台灣資料庫)', NULL, '拉麵');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_540', '[\"捲心酥\"]', '糕餅點心類', '自動生成: 捲心酥 (僅台灣資料庫)', NULL, '捲心酥');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_541', '[\"排骨醬\"]', '調味料及香辛料類', '自動生成: 排骨醬 (僅台灣資料庫)', NULL, '排骨醬');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_543', '[\"擔仔麵\"]', '加工調理食品及其他類', '自動生成: 擔仔麵 (僅台灣資料庫)', NULL, '擔仔麵');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_544', '[\"敏豆莢\",\"菜豆莢\",\"四季豆\",\"雲藕豆\",\"隱之(元)豆\",\"白(花)雲豆\",\"敏(雲/芸/粉/醜)豆\"]', '豆類', '自動生成: 敏豆莢 (僅台灣資料庫)', NULL, '敏豆莢');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_545', '[\"文旦\",\"柚子\",\"內紫\",\"朱欒\",\"香欒\",\"座凡\",\"拋\",\"欒\"]', '水果類', '自動生成: 文旦 (僅台灣資料庫)', NULL, '文旦');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_546', '[\"文旦(2023年取樣)\",\"文旦\",\"麻豆文旦\",\"文旦柚\"]', '水果類', '自動生成: 文旦(2023年取樣) (僅台灣資料庫)', NULL, '文旦(2023年取樣)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_549', '[\"斑海鯰\",\"成仔魚\",\"成仔丁\",\"銀成\",\"白肉成\",\"臭臊成\",\"生仔魚\",\"鰻鯰\",\"賓士魚\"]', '魚貝類', '自動生成: 斑海鯰 (僅台灣資料庫)', NULL, '斑海鯰');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_551', '[\"斑鱧\",\"鮕鮘\",\"雷魚\",\"南鱧\",\"臺灣雷魚\",\"臺灣魚虎\"]', '魚貝類', '自動生成: 斑鱧 (僅台灣資料庫)', NULL, '斑鱧');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_552', '[\"斑鱵\",\"補網師\",\"水針\",\"莎優莉\",\"簪針(澎湖)\",\"七星針(南部)\"]', '魚貝類', '自動生成: 斑鱵 (僅台灣資料庫)', NULL, '斑鱵');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_553', '[\"斑點九刺鮨(去皮)\",\"斑點九刺鮨\",\"眼斑鱠\",\"過魚\",\"石斑\",\"油鱠\",\"青貓\",\"黑鱠僅\",\"黑鱠仔(澎湖)\"]', '魚貝類', '自動生成: 斑點九刺鮨(去皮) (僅台灣資料庫)', NULL, '斑點九刺鮨(去皮)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_554', '[\"斑點九刺鮨(含皮)\",\"斑點九刺鮨\",\"眼斑鱠\",\"過魚\",\"石斑\",\"油鱠\",\"青貓\",\"黑鱠僅\",\"黑鱠仔(澎湖)\"]', '魚貝類', '自動生成: 斑點九刺鮨(含皮) (僅台灣資料庫)', NULL, '斑點九刺鮨(含皮)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_555', '[\"斑點雞籠鯧\",\"銅盤仔\",\"鏡鯧\",\"金鏡\",\"定盤\",\"咬破埔\",\"金鐘(澎湖)\"]', '魚貝類', '自動生成: 斑點雞籠鯧 (僅台灣資料庫)', NULL, '斑點雞籠鯧');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_556', '[\"斯氏長鰭烏魴\",\"深海三角仔\",\"黑飛刀\",\"黑皮刀\",\"三角仔(臺東)\",\"大鱗烏鯧(澎湖)\"]', '魚貝類', '自動生成: 斯氏長鰭烏魴 (僅台灣資料庫)', NULL, '斯氏長鰭烏魴');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_557', '[\"新世紀梨\",\"梨子\",\"水梨\",\"山褵\",\"快果\",\"果宗\"]', '水果類', '自動生成: 新世紀梨 (僅台灣資料庫)', NULL, '新世紀梨');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_558', '[\"新疆哈密瓜\",\"網仔瓜\",\"哈密瓜\"]', '水果類', '自動生成: 新疆哈密瓜 (僅台灣資料庫)', NULL, '新疆哈密瓜');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_559', '[\"新興梨\",\"梨子\",\"水梨\",\"山褵\",\"快果\",\"果宗\"]', '水果類', '自動生成: 新興梨 (僅台灣資料庫)', NULL, '新興梨');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_560', '[\"方塊酥\",\"恩典酥\"]', '糕餅點心類', '自動生成: 方塊酥 (僅台灣資料庫)', NULL, '方塊酥');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_566', '[\"日式炸豆皮\"]', '加工調理食品及其他類', '自動生成: 日式炸豆皮 (僅台灣資料庫)', NULL, '日式炸豆皮');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_567', '[\"日式照燒醬\"]', '調味料及香辛料類', '自動生成: 日式照燒醬 (僅台灣資料庫)', NULL, '日式照燒醬');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_572', '[\"日本油菜(有機)\",\"日本油菜\",\"鶯菜\",\"小松菜\"]', '蔬菜類', '自動生成: 日本油菜(有機) (僅台灣資料庫)', NULL, '日本油菜(有機)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_574', '[\"日本甜蔥\",\"蔥\",\"大蔥\",\"葉蔥\",\"蔥仔\",\"水蔥\",\"漢蔥\"]', '蔬菜類', '自動生成: 日本甜蔥 (僅台灣資料庫)', NULL, '日本甜蔥');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_576', '[\"日本紅目大眼鯛\",\"紅目鰱\",\"嚴公仔\",\"大目仔(臺東)\",\"紅目孔(澎湖)\",\"嚴公舅(澎湖)\"]', '魚貝類', '自動生成: 日本紅目大眼鯛 (僅台灣資料庫)', NULL, '日本紅目大眼鯛');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_577', '[\"日本花鱸((11月)\",\"日本花鱸\",\"七星鱸\",\"花鱸\",\"青鱸\",\"鱸魚\",\"日本真鱸\"]', '魚貝類', '自動生成: 日本花鱸((11月) (僅台灣資料庫)', NULL, '日本花鱸((11月)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_578', '[\"日本花鱸((12月)\",\"日本花鱸\",\"七星鱸\",\"花鱸\",\"青鱸\",\"鱸魚\",\"日本真鱸\"]', '魚貝類', '自動生成: 日本花鱸((12月) (僅台灣資料庫)', NULL, '日本花鱸((12月)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_579', '[\"日本花鱸((3月)\",\"日本花鱸\",\"七星鱸\",\"花鱸\",\"青鱸\",\"鱸魚\",\"日本真鱸\"]', '魚貝類', '自動生成: 日本花鱸((3月) (僅台灣資料庫)', NULL, '日本花鱸((3月)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_580', '[\"日本花鱸((8月)\",\"日本花鱸\",\"七星鱸\",\"花鱸\",\"青鱸\",\"鱸魚\",\"日本真鱸\"]', '魚貝類', '自動生成: 日本花鱸((8月) (僅台灣資料庫)', NULL, '日本花鱸((8月)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_581', '[\"日本花鱸(2月)\",\"日本花鱸\",\"七星鱸\",\"花鱸\",\"青鱸\",\"鱸魚\",\"日本真鱸\"]', '魚貝類', '自動生成: 日本花鱸(2月) (僅台灣資料庫)', NULL, '日本花鱸(2月)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_582', '[\"日本花鱸(含皮)\",\"日本花鱸\",\"七星鱸\",\"花鱸\",\"青鱸\",\"鱸魚\",\"日本真鱸\"]', '魚貝類', '自動生成: 日本花鱸(含皮) (僅台灣資料庫)', NULL, '日本花鱸(含皮)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_583', '[\"日本花鱸平均值\",\"七星鱸\",\"花鱸\",\"青鱸\",\"鱸魚\",\"日本真鱸\"]', '魚貝類', '自動生成: 日本花鱸平均值 (僅台灣資料庫)', NULL, '日本花鱸平均值');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_584', '[\"日本茼蒿(有機)\",\"日本茼蒿\",\"春菊\",\"山茼蒿\",\"小葉茼蒿\"]', '蔬菜類', '自動生成: 日本茼蒿(有機) (僅台灣資料庫)', NULL, '日本茼蒿(有機)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_585', '[\"日本銀帶鯡(加工)\",\"日本銀帶鯡\",\"針嘴鰮\",\"丁香魚\",\"魩仔\",\"丁香\",\"鱙仔\",\"灰海荷鰮\"]', '魚貝類', '自動生成: 日本銀帶鯡(加工) (僅台灣資料庫)', NULL, '日本銀帶鯡(加工)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_591', '[\"明日葉\",\"鹹草\",\"明日草\",\"長壽草\",\"八丈草\",\"還陽草\",\"珍立草\",\"海峰人參\",\"天賜草\"]', '蔬菜類', '自動生成: 明日葉 (僅台灣資料庫)', NULL, '明日葉');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_593', '[\"星斑真鯧\",\"(市售稱\\\"花鯧\\\")\"]', '魚貝類', '自動生成: 星斑真鯧 (僅台灣資料庫)', NULL, '星斑真鯧');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_595', '[\"春捲皮\"]', '加工調理食品及其他類', '自動生成: 春捲皮 (僅台灣資料庫)', NULL, '春捲皮');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_596', '[\"昭和草\",\"山茼蒿\",\"野茼蒿\",\"太子原\",\"飛機草\",\"神仙草\"]', '蔬菜類', '自動生成: 昭和草 (僅台灣資料庫)', NULL, '昭和草');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_597', '[\"月餅(棗泥)\",\"月餅\"]', '糕餅點心類', '自動生成: 月餅(棗泥) (僅台灣資料庫)', NULL, '月餅(棗泥)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_598', '[\"朝天椒(圓果)\",\"朝天椒\",\"辣椒\",\"番椒\",\"番仔薑\",\"臘椒\",\"指(向)天椒\",\"赤穗生番椒\",\"叢果番椒\",\"海椒(雞心椒)\"]', '蔬菜類', '自動生成: 朝天椒(圓果) (僅台灣資料庫)', NULL, '朝天椒(圓果)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_599', '[\"朝天椒(長果)\",\"朝天椒\",\"辣椒\",\"番椒\",\"番仔薑\",\"臘椒\",\"指(向)天椒\",\"赤穗生番椒\",\"叢果番椒\",\"海椒\"]', '蔬菜類', '自動生成: 朝天椒(長果) (僅台灣資料庫)', NULL, '朝天椒(長果)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_600', '[\"朝鮮醬\"]', '調味料及香辛料類', '自動生成: 朝鮮醬 (僅台灣資料庫)', NULL, '朝鮮醬');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_607', '[\"木耳\",\"黑木耳\",\"桑耳\",\"白背毛木耳\",\"木樟(檽/菌/茸/蛾/樅)\",\"樹雞(毛木耳)\"]', '菇類', '自動生成: 木耳 (僅台灣資料庫)', NULL, '木耳');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_608', '[\"木薯粉\",\"樹薯粉\"]', '澱粉類', '自動生成: 木薯粉 (僅台灣資料庫)', NULL, '木薯粉');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_609', '[\"本島萵苣(土植)(10月取樣)\",\"本島萵苣\",\"葉萵苣\",\"葉萵\",\"萵仔菜\",\"刈葉萵苣\",\"生菜\",\"妹(媚)仔菜\",\"鵝仔菜(草)\",\"春不老\",\"印度萵苣\"]', '蔬菜類', '自動生成: 本島萵苣(土植)(10月取樣) (僅台灣資料庫)', NULL, '本島萵苣(土植)(10月取樣)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_610', '[\"本島萵苣(土植)(1月取樣)\",\"本島萵苣\",\"葉萵苣\",\"葉萵\",\"萵仔菜\",\"刈葉萵苣\",\"生菜\",\"妹(媚)仔菜\",\"鵝仔菜(草)\",\"春不老\",\"印度萵苣\"]', '蔬菜類', '自動生成: 本島萵苣(土植)(1月取樣) (僅台灣資料庫)', NULL, '本島萵苣(土植)(1月取樣)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_611', '[\"本島萵苣(土植)(3月取樣)\",\"本島萵苣\",\"葉萵苣\",\"葉萵\",\"萵仔菜\",\"刈葉萵苣\",\"生菜\",\"妹(媚)仔菜\",\"鵝仔菜(草)\",\"春不老\",\"印度萵苣\"]', '蔬菜類', '自動生成: 本島萵苣(土植)(3月取樣) (僅台灣資料庫)', NULL, '本島萵苣(土植)(3月取樣)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_612', '[\"本島萵苣(土植)(4月取樣)\",\"本島萵苣\",\"葉萵苣\",\"葉萵\",\"萵仔菜\",\"刈葉萵苣\",\"生菜\",\"妹(媚)仔菜\",\"鵝仔菜(草)\",\"春不老\",\"印度萵苣\"]', '蔬菜類', '自動生成: 本島萵苣(土植)(4月取樣) (僅台灣資料庫)', NULL, '本島萵苣(土植)(4月取樣)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_613', '[\"本島萵苣(土植)(7月取樣)\",\"本島萵苣\",\"葉萵苣\",\"葉萵\",\"萵仔菜\",\"刈葉萵苣\",\"生菜\",\"妹(媚)仔菜\",\"鵝仔菜(草)\",\"春不老\",\"印度萵苣\"]', '蔬菜類', '自動生成: 本島萵苣(土植)(7月取樣) (僅台灣資料庫)', NULL, '本島萵苣(土植)(7月取樣)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_614', '[\"本島萵苣(有機)(10月取樣)\",\"本島萵苣\",\"葉萵苣\",\"葉萵\",\"萵仔菜\",\"刈葉萵苣\",\"生菜\",\"妹(媚)仔菜\",\"鵝仔菜(草)\",\"春不老\",\"印度萵苣\"]', '蔬菜類', '自動生成: 本島萵苣(有機)(10月取樣) (僅台灣資料庫)', NULL, '本島萵苣(有機)(10月取樣)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_615', '[\"本島萵苣(有機)(1月取樣)\",\"本島萵苣\",\"葉萵苣\",\"葉萵\",\"萵仔菜\",\"刈葉萵苣\",\"生菜\",\"妹(媚)仔菜\",\"鵝仔菜(草)\",\"春不老\",\"印度萵苣\"]', '蔬菜類', '自動生成: 本島萵苣(有機)(1月取樣) (僅台灣資料庫)', NULL, '本島萵苣(有機)(1月取樣)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_616', '[\"本島萵苣(有機)(4月取樣)\",\"本島萵苣\",\"葉萵苣\",\"葉萵\",\"萵仔菜\",\"刈葉萵苣\",\"生菜\",\"妹(媚)仔菜\",\"鵝仔菜(草)\",\"春不老\",\"印度萵苣\"]', '蔬菜類', '自動生成: 本島萵苣(有機)(4月取樣) (僅台灣資料庫)', NULL, '本島萵苣(有機)(4月取樣)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_617', '[\"本島萵苣(有機)(7月取樣)\",\"本島萵苣\",\"葉萵苣\",\"葉萵\",\"萵仔菜\",\"刈葉萵苣\",\"生菜\",\"妹(媚)仔菜\",\"鵝仔菜(草)\",\"春不老\",\"印度萵苣\"]', '蔬菜類', '自動生成: 本島萵苣(有機)(7月取樣) (僅台灣資料庫)', NULL, '本島萵苣(有機)(7月取樣)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_618', '[\"本島萵苣(水耕)(10月取樣)\",\"本島萵苣\",\"葉萵苣\",\"葉萵\",\"萵仔菜\",\"刈葉萵苣\",\"生菜\",\"妹(媚)仔菜\",\"鵝仔菜(草)\",\"春不老\",\"印度萵苣\"]', '蔬菜類', '自動生成: 本島萵苣(水耕)(10月取樣) (僅台灣資料庫)', NULL, '本島萵苣(水耕)(10月取樣)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_619', '[\"本島萵苣(水耕)(1月取樣)\",\"本島萵苣\",\"葉萵苣\",\"葉萵\",\"萵仔菜\",\"刈葉萵苣\",\"生菜\",\"妹(媚)仔菜\",\"鵝仔菜(草)\",\"春不老\",\"印度萵苣\"]', '蔬菜類', '自動生成: 本島萵苣(水耕)(1月取樣) (僅台灣資料庫)', NULL, '本島萵苣(水耕)(1月取樣)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_620', '[\"本島萵苣(水耕)(4月取樣)\",\"本島萵苣\",\"葉萵苣\",\"葉萵\",\"萵仔菜\",\"刈葉萵苣\",\"生菜\",\"妹(媚)仔菜\",\"鵝仔菜(草)\",\"春不老\",\"印度萵苣\"]', '蔬菜類', '自動生成: 本島萵苣(水耕)(4月取樣) (僅台灣資料庫)', NULL, '本島萵苣(水耕)(4月取樣)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_621', '[\"本島萵苣(水耕)(7月取樣)\",\"本島萵苣\",\"葉萵苣\",\"葉萵\",\"萵仔菜\",\"刈葉萵苣\",\"生菜\",\"妹(媚)仔菜\",\"鵝仔菜(草)\",\"春不老\",\"印度萵苣\"]', '蔬菜類', '自動生成: 本島萵苣(水耕)(7月取樣) (僅台灣資料庫)', NULL, '本島萵苣(水耕)(7月取樣)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_622', '[\"李子平均值(紅皮紅肉)\",\"李子平均值\",\"李子\"]', '水果類', '自動生成: 李子平均值(紅皮紅肉) (僅台灣資料庫)', NULL, '李子平均值(紅皮紅肉)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_623', '[\"李子平均值(紅皮黃肉)\",\"李子平均值\",\"李子\"]', '水果類', '自動生成: 李子平均值(紅皮黃肉) (僅台灣資料庫)', NULL, '李子平均值(紅皮黃肉)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_624', '[\"李子平均值(青皮黃肉)\",\"李子平均值\",\"李子\"]', '水果類', '自動生成: 李子平均值(青皮黃肉) (僅台灣資料庫)', NULL, '李子平均值(青皮黃肉)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_625', '[\"李林蕉(2007年取樣)\",\"李林蕉\",\"香蕉\",\"芎蕉\",\"弓蕉\",\"甘蕉(牛角蕉\",\"佛手蕉\",\"美人蕉\",\"樹蕉)\"]', '水果類', '自動生成: 李林蕉(2007年取樣) (僅台灣資料庫)', NULL, '李林蕉(2007年取樣)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_626', '[\"李林蕉(2012年取樣)\",\"李林蕉\",\"香蕉\",\"芎蕉\",\"弓蕉\",\"甘蕉(牛角蕉\",\"佛手蕉\",\"美人蕉\",\"樹蕉)\"]', '水果類', '自動生成: 李林蕉(2012年取樣) (僅台灣資料庫)', NULL, '李林蕉(2012年取樣)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_629', '[\"杏香菇\",\"香微蘑\",\"雪茸\",\"帝王菇\",\"平菇王\"]', '菇類', '自動生成: 杏香菇 (僅台灣資料庫)', NULL, '杏香菇');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_630', '[\"杏鮑菇(中)\",\"杏鮑菇\",\"鳳尾菇\",\"雪茸\",\"帝王菇\",\"平菇王\",\"蠔菇王\",\"干貝菇\",\"刺芹側耳\",\"義大利側耳\",\"義大利蠔菌\",\"杏鮑茸\",\"西洋刺耳\"]', '菇類', '自動生成: 杏鮑菇(中) (僅台灣資料庫)', NULL, '杏鮑菇(中)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_631', '[\"杏鮑菇(大)\",\"杏鮑菇\",\"鳳尾菇\",\"雪茸\",\"帝王菇\",\"平菇王\",\"蠔菇王\",\"干貝菇\",\"刺芹側耳\",\"義大利側耳\",\"義大利蠔菌\",\"杏鮑茸\",\"西洋刺耳\"]', '菇類', '自動生成: 杏鮑菇(大) (僅台灣資料庫)', NULL, '杏鮑菇(大)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_632', '[\"杏鮑菇(小)\",\"杏鮑菇\",\"鳳尾菇\",\"雪茸\",\"帝王菇\",\"平菇王\",\"蠔菇王\",\"干貝菇\",\"刺芹側耳\",\"義大利側耳\",\"義大利蠔菌\",\"杏鮑茸\",\"西洋刺耳\"]', '菇類', '自動生成: 杏鮑菇(小) (僅台灣資料庫)', NULL, '杏鮑菇(小)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_633', '[\"杏鮑菇平均值\",\"鳳尾菇\",\"雪茸\",\"帝王菇\",\"平菇王\",\"蠔菇王\",\"干貝菇\",\"刺芹側耳\",\"義大利側耳\",\"義大利蠔菌\",\"杏鮑茸\",\"西洋刺耳\"]', '菇類', '自動生成: 杏鮑菇平均值 (僅台灣資料庫)', NULL, '杏鮑菇平均值');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_634', '[\"杜氏刺尾鯛\",\"眼紋倒吊\",\"粗皮仔\",\"倒吊(臺東)\"]', '魚貝類', '自動生成: 杜氏刺尾鯛 (僅台灣資料庫)', NULL, '杜氏刺尾鯛');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_635', '[\"杜氏鰤\",\"紅甘\",\"紅甘鰺\",\"竹午\",\"汕午\",\"紅頭午\"]', '魚貝類', '自動生成: 杜氏鰤 (僅台灣資料庫)', NULL, '杜氏鰤');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_638', '[\"松茸\",\"台灣松茸\",\"松口蘑\",\"大花菌\",\"松蕈\",\"剝皮菌(台灣松口蘑)\"]', '菇類', '自動生成: 松茸 (僅台灣資料庫)', NULL, '松茸');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_639', '[\"松茸白菇\"]', '菇類', '自動生成: 松茸白菇 (僅台灣資料庫)', NULL, '松茸白菇');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_640', '[\"松鯛\",\"打鐵婆\",\"枯葉\",\"石鯽\",\"睡魚\",\"庫羅黛\",\"睏魚\",\"海南洋仔\",\"南洋鱸魚\",\"海吳郭\",\"流魚/柴魚/打鐵鱸(澎湖)\"]', '魚貝類', '自動生成: 松鯛 (僅台灣資料庫)', NULL, '松鯛');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_641', '[\"板腱 \",\"板腱\",\"板腱牛排;白蘭地牛排;上肩胛脊底肌\"]', '肉類', '自動生成: 板腱  (僅台灣資料庫)', NULL, '板腱 ');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_642', '[\"枇杷\",\"琶琵果\"]', '水果類', '自動生成: 枇杷 (僅台灣資料庫)', NULL, '枇杷');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_644', '[\"果凍\"]', '糕餅點心類', '自動生成: 果凍 (僅台灣資料庫)', NULL, '果凍');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_648', '[\"枸杞乾\",\"枸杞\",\"地骨子\",\"甘杞\",\"杞子\",\"枸忌\",\"苦杞\",\"血杞\",\"天精子\"]', '蔬菜類', '自動生成: 枸杞乾 (僅台灣資料庫)', NULL, '枸杞乾');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_649', '[\"柚子果醬\"]', '調味料及香辛料類', '自動生成: 柚子果醬 (僅台灣資料庫)', NULL, '柚子果醬');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_650', '[\"柳松菇\",\"柳松茸\",\"茶樹菇\",\"楊樹菇\",\"田頭菇(柱狀田頭菇)\"]', '菇類', '自動生成: 柳松菇 (僅台灣資料庫)', NULL, '柳松菇');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_655', '[\"柿餅\"]', '水果類', '自動生成: 柿餅 (僅台灣資料庫)', NULL, '柿餅');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_660', '[\"核棗糕\"]', '糕餅點心類', '自動生成: 核棗糕 (僅台灣資料庫)', NULL, '核棗糕');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_661', '[\"根菾菜根\",\"甜菜根\",\"火焰菜根\"]', '蔬菜類', '自動生成: 根菾菜根 (僅台灣資料庫)', NULL, '根菾菜根');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_662', '[\"根菾菜根(2023年取樣)\",\"根菾菜根\",\"甜菜根\",\"火焰菜根\"]', '蔬菜類', '自動生成: 根菾菜根(2023年取樣) (僅台灣資料庫)', NULL, '根菾菜根(2023年取樣)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_665', '[\"桃接李(大)\",\"桃接李\",\"李子\"]', '水果類', '自動生成: 桃接李(大) (僅台灣資料庫)', NULL, '桃接李(大)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_666', '[\"桃接李(小)\",\"桃接李\",\"李子\"]', '水果類', '自動生成: 桃接李(小) (僅台灣資料庫)', NULL, '桃接李(小)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_667', '[\"桑葚\",\"桑果\",\"桑葚兒\"]', '水果類', '自動生成: 桑葚 (僅台灣資料庫)', NULL, '桑葚');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_668', '[\"桑葚果醬\"]', '調味料及香辛料類', '自動生成: 桑葚果醬 (僅台灣資料庫)', NULL, '桑葚果醬');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_669', '[\"桑葚汁\",\"桑果\",\"桑葚兒\"]', '水果類', '自動生成: 桑葚汁 (僅台灣資料庫)', NULL, '桑葚汁');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_670', '[\"梅乾菜\"]', '加工調理食品及其他類', '自動生成: 梅乾菜 (僅台灣資料庫)', NULL, '梅乾菜');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_671', '[\"梅子粉\"]', '調味料及香辛料類', '自動生成: 梅子粉 (僅台灣資料庫)', NULL, '梅子粉');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_674', '[\"條狀肉乾(豬肉)\",\"條狀肉乾\",\"豬肉乾\",\"豬肉干\"]', '加工調理食品及其他類', '自動生成: 條狀肉乾(豬肉) (僅台灣資料庫)', NULL, '條狀肉乾(豬肉)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_675', '[\"條紋狼鱸\"]', '魚貝類', '自動生成: 條紋狼鱸 (僅台灣資料庫)', NULL, '條紋狼鱸');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_676', '[\"梨山甘藍(尖球形)\",\"梨山甘藍\",\"高麗菜\",\"包菜\",\"洋白菜\",\"玻璃菜\",\"玉菜\",\"捲心菜\",\"球葉甘藍\",\"結球甘藍\",\"蕃芥藍\"]', '蔬菜類', '自動生成: 梨山甘藍(尖球形) (僅台灣資料庫)', NULL, '梨山甘藍(尖球形)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_677', '[\"梨山蜜梨\",\"梨子\",\"水梨\",\"山褵\",\"快果\",\"果宗\"]', '水果類', '自動生成: 梨山蜜梨 (僅台灣資料庫)', NULL, '梨山蜜梨');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_679', '[\"棒棒腿(土雞)\",\"棒棒腿\",\"雞腿\"]', '肉類', '自動生成: 棒棒腿(土雞) (僅台灣資料庫)', NULL, '棒棒腿(土雞)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_680', '[\"棒棒腿(肉雞)\",\"棒棒腿\",\"雞腿\"]', '肉類', '自動生成: 棒棒腿(肉雞) (僅台灣資料庫)', NULL, '棒棒腿(肉雞)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_681', '[\"棒棒腿平均值\"]', '肉類', '自動生成: 棒棒腿平均值 (僅台灣資料庫)', NULL, '棒棒腿平均值');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_683', '[\"棺材板\"]', '加工調理食品及其他類', '自動生成: 棺材板 (僅台灣資料庫)', NULL, '棺材板');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_684', '[\"植物燕麥奶粉(營養強化)\",\"植物燕麥奶粉\"]', '加工調理食品及其他類', '自動生成: 植物燕麥奶粉(營養強化) (僅台灣資料庫)', NULL, '植物燕麥奶粉(營養強化)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_685', '[\"椪柑\",\"橘子\",\"蘆柑\",\"壼柑\",\"凸柑\",\"乳柑\",\"潮州柑\"]', '水果類', '自動生成: 椪柑 (僅台灣資料庫)', NULL, '椪柑');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_686', '[\"椰奶\"]', '飲料類', '自動生成: 椰奶 (僅台灣資料庫)', NULL, '椰奶');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_688', '[\"椰子粉\"]', '調味料及香辛料類', '自動生成: 椰子粉 (僅台灣資料庫)', NULL, '椰子粉');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_689', '[\"椰漿\"]', '調味料及香辛料類', '自動生成: 椰漿 (僅台灣資料庫)', NULL, '椰漿');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_690', '[\"楊桃(11月取樣)\",\"楊桃\",\"羊桃\",\"洋桃\",\"陽桃\",\"五稜子\",\"五斂子\"]', '水果類', '自動生成: 楊桃(11月取樣) (僅台灣資料庫)', NULL, '楊桃(11月取樣)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_691', '[\"楊桃(2月取樣)\",\"楊桃\",\"羊桃\",\"洋桃\",\"陽桃\",\"五稜子\",\"五斂子\"]', '水果類', '自動生成: 楊桃(2月取樣) (僅台灣資料庫)', NULL, '楊桃(2月取樣)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_692', '[\"楊桃(4月取樣)\",\"楊桃\",\"羊桃\",\"洋桃\",\"陽桃\",\"五稜子\",\"五斂子\"]', '水果類', '自動生成: 楊桃(4月取樣) (僅台灣資料庫)', NULL, '楊桃(4月取樣)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_693', '[\"楊桃(5月取樣)\",\"楊桃\",\"羊桃\",\"洋桃\",\"陽桃\",\"五稜子\",\"五斂子\"]', '水果類', '自動生成: 楊桃(5月取樣) (僅台灣資料庫)', NULL, '楊桃(5月取樣)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_694', '[\"楊桃(9月取樣)\",\"楊桃\",\"羊桃\",\"洋桃\",\"陽桃\",\"五稜子\",\"五斂子\"]', '水果類', '自動生成: 楊桃(9月取樣) (僅台灣資料庫)', NULL, '楊桃(9月取樣)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_695', '[\"楊桃平均值\",\"羊桃\",\"洋桃\",\"陽桃\",\"五稜子\",\"五斂子\"]', '水果類', '自動生成: 楊桃平均值 (僅台灣資料庫)', NULL, '楊桃平均值');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_696', '[\"楊桃汁(非原汁)\",\"楊桃汁\"]', '飲料類', '自動生成: 楊桃汁(非原汁) (僅台灣資料庫)', NULL, '楊桃汁(非原汁)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_699', '[\"榨菜\",\"榨菜藺蕓苔\",\"四川榨菜\",\"疙瘩菜\",\"稜角菜\",\"筆架菜\",\"香爐菜\",\"瘤菜\"]', '加工調理食品及其他類', '自動生成: 榨菜 (僅台灣資料庫)', NULL, '榨菜');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_700', '[\"榴槤\",\"榴蓮\",\"流連\",\"山韶子\"]', '水果類', '自動生成: 榴槤 (僅台灣資料庫)', NULL, '榴槤');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_701', '[\"榴槤蜜\",\"尖百達\",\"尖蜜拉\",\"小樹菠蘿\",\"小波羅蜜\"]', '水果類', '自動生成: 榴槤蜜 (僅台灣資料庫)', NULL, '榴槤蜜');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_702', '[\"樹豆(白)\",\"樹豆\",\"木豆\",\"白樹豆\",\"柳豆\",\"米豆\",\"放屁豆\",\"番仔豆\",\"蒲姜豆\"]', '豆類', '自動生成: 樹豆(白) (僅台灣資料庫)', NULL, '樹豆(白)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_704', '[\"橙蕃茄\",\"柑(甘)仔蜜\",\"草(番\",\"西紅\",\"六月)柿\",\"臭柿仔\",\"小金瓜\",\"洋柿(茄)子\",\"紅茄\",\"毛臘果\"]', '蔬菜類', '自動生成: 橙蕃茄 (僅台灣資料庫)', NULL, '橙蕃茄');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_705', '[\"橫山梨\",\"梨子\",\"水梨\",\"山褵\",\"快果\",\"果宗(三灣冬梨\",\"粗梨)\"]', '水果類', '自動生成: 橫山梨 (僅台灣資料庫)', NULL, '橫山梨');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_706', '[\"橫紋九刺鮨\",\"橫帶鱠\",\"過魚\",\"石斑\",\"黑貓仔\",\"黑絲貓\",\"竹鱠仔\",\"黑青貓仔(澎湖)\",\"烏絲(香港)\"]', '魚貝類', '自動生成: 橫紋九刺鮨 (僅台灣資料庫)', NULL, '橫紋九刺鮨');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_708', '[\"檳榔嫩莖\",\"半天筍\",\"檳榔樹心\"]', '蔬菜類', '自動生成: 檳榔嫩莖 (僅台灣資料庫)', NULL, '檳榔嫩莖');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_709', '[\"檳榔心芋\",\"芋頭\",\"芋艿\",\"芋乃\",\"芋仔\",\"青芋\",\"土芝\"]', '澱粉類', '自動生成: 檳榔心芋 (僅台灣資料庫)', NULL, '檳榔心芋');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_710', '[\"檳榔心芋(2021年取樣)\",\"檳榔心芋\",\"芋頭\",\"芋艿\",\"芋乃\",\"芋仔\",\"青芋\",\"土芝\"]', '澱粉類', '自動生成: 檳榔心芋(2021年取樣) (僅台灣資料庫)', NULL, '檳榔心芋(2021年取樣)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_726', '[\"正鰹\",\"煙仔虎\",\"煙仔\",\"小串\",\"柴魚\",\"肥煙\",\"鯤(臺東)\",\"煙仔魚\",\"卓鮶/大煙(澎湖)\"]', '魚貝類', '自動生成: 正鰹 (僅台灣資料庫)', NULL, '正鰹');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_728', '[\"毛豆仁\",\"大豆\",\"青大豆\",\"青皮豆\"]', '豆類', '自動生成: 毛豆仁 (僅台灣資料庫)', NULL, '毛豆仁');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_729', '[\"毛豆莢(高雄13號)\",\"毛豆莢\",\"大豆\",\"青大豆\",\"青皮豆\"]', '豆類', '自動生成: 毛豆莢(高雄13號) (僅台灣資料庫)', NULL, '毛豆莢(高雄13號)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_734', '[\"水煎包\"]', '加工調理食品及其他類', '自動生成: 水煎包 (僅台灣資料庫)', NULL, '水煎包');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_735', '[\"水耕波士頓萵苣\"]', '蔬菜類', '自動生成: 水耕波士頓萵苣 (僅台灣資料庫)', NULL, '水耕波士頓萵苣');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_736', '[\"水菜(日本種)\",\"水菜\"]', '蔬菜類', '自動生成: 水菜(日本種) (僅台灣資料庫)', NULL, '水菜(日本種)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_737', '[\"水蕹菜\"]', '蔬菜類', '自動生成: 水蕹菜 (僅台灣資料庫)', NULL, '水蕹菜');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_738', '[\"水蜜桃\",\"毛桃\",\"白桃\"]', '水果類', '自動生成: 水蜜桃 (僅台灣資料庫)', NULL, '水蜜桃');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_739', '[\"水蜜桃平均值\",\"毛桃\",\"白桃\"]', '水果類', '自動生成: 水蜜桃平均值 (僅台灣資料庫)', NULL, '水蜜桃平均值');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_740', '[\"水餃皮\"]', '加工調理食品及其他類', '自動生成: 水餃皮 (僅台灣資料庫)', NULL, '水餃皮');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_741', '[\"汽水(綜合口味)\",\"汽水\"]', '飲料類', '自動生成: 汽水(綜合口味) (僅台灣資料庫)', NULL, '汽水(綜合口味)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_742', '[\"汽水(維生素強化)\",\"汽水\"]', '飲料類', '自動生成: 汽水(維生素強化) (僅台灣資料庫)', NULL, '汽水(維生素強化)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_743', '[\"沖泡濃湯(海鮮)\",\"沖泡濃湯\"]', '加工調理食品及其他類', '自動生成: 沖泡濃湯(海鮮) (僅台灣資料庫)', NULL, '沖泡濃湯(海鮮)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_744', '[\"沙其馬\"]', '糕餅點心類', '自動生成: 沙其馬 (僅台灣資料庫)', NULL, '沙其馬');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_745', '[\"沙士\"]', '飲料類', '自動生成: 沙士 (僅台灣資料庫)', NULL, '沙士');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_747', '[\"沙拉筍塊\",\"涼筍\"]', '蔬菜類', '自動生成: 沙拉筍塊 (僅台灣資料庫)', NULL, '沙拉筍塊');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_748', '[\"沙拉醬\"]', '調味料及香辛料類', '自動生成: 沙拉醬 (僅台灣資料庫)', NULL, '沙拉醬');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_749', '[\"沙拉醬(2021年取樣)\",\"沙拉醬\",\"蛋黃醬\"]', '調味料及香辛料類', '自動生成: 沙拉醬(2021年取樣) (僅台灣資料庫)', NULL, '沙拉醬(2021年取樣)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_750', '[\"沙朗牛排\",\"里肌\",\"大里肌\",\"肋眼\",\"修清肋眼肉;修清肉眼\"]', '肉類', '自動生成: 沙朗牛排 (僅台灣資料庫)', NULL, '沙朗牛排');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_753', '[\"油條\"]', '加工調理食品及其他類', '自動生成: 油條 (僅台灣資料庫)', NULL, '油條');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_754', '[\"油炸脫水甘藷\"]', '澱粉類', '自動生成: 油炸脫水甘藷 (僅台灣資料庫)', NULL, '油炸脫水甘藷');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_757', '[\"油菜(有機)\",\"油菜\",\"蕓苔\"]', '蔬菜類', '自動生成: 油菜(有機) (僅台灣資料庫)', NULL, '油菜(有機)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_758', '[\"油菜心\"]', '蔬菜類', '自動生成: 油菜心 (僅台灣資料庫)', NULL, '油菜心');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_759', '[\"油菜籽油\"]', '油脂類', '自動生成: 油菜籽油 (僅台灣資料庫)', NULL, '油菜籽油');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_760', '[\"油蔥酥\"]', '調味料及香辛料類', '自動生成: 油蔥酥 (僅台灣資料庫)', NULL, '油蔥酥');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_763', '[\"油麵條\",\"油麵\"]', '加工調理食品及其他類', '自動生成: 油麵條 (僅台灣資料庫)', NULL, '油麵條');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_764', '[\"法式奶酥醬\"]', '調味料及香辛料類', '自動生成: 法式奶酥醬 (僅台灣資料庫)', NULL, '法式奶酥醬');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_765', '[\"法式羊排\",\"羊肋排\",\"羊小排\"]', '肉類', '自動生成: 法式羊排 (僅台灣資料庫)', NULL, '法式羊排');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_766', '[\"法式香蒜醬\"]', '調味料及香辛料類', '自動生成: 法式香蒜醬 (僅台灣資料庫)', NULL, '法式香蒜醬');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_767', '[\"泡芙(巧克力)\",\"泡芙\"]', '糕餅點心類', '自動生成: 泡芙(巧克力) (僅台灣資料庫)', NULL, '泡芙(巧克力)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_771', '[\"波紋橫簾蛤 \",\"波紋橫簾蛤\",\"波紋巴非蛤\",\"山瓜仔(子)\",\"海瓜仔(子)\"]', '魚貝類', '自動生成: 波紋橫簾蛤  (僅台灣資料庫)', NULL, '波紋橫簾蛤 ');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_772', '[\"泥螺\",\"黃泥螺\"]', '魚貝類', '自動生成: 泥螺 (僅台灣資料庫)', NULL, '泥螺');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_773', '[\"泰勃圓鰺\",\"硬尾\"]', '魚貝類', '自動生成: 泰勃圓鰺 (僅台灣資料庫)', NULL, '泰勃圓鰺');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_774', '[\"泰國芭樂\",\"番石榴\",\"芭樂\",\"拔仔\",\"扒仔\",\"朳仔\",\"那拔仔\",\"藍拔\"]', '水果類', '自動生成: 泰國芭樂 (僅台灣資料庫)', NULL, '泰國芭樂');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_775', '[\"洋芋片\"]', '糕餅點心類', '自動生成: 洋芋片 (僅台灣資料庫)', NULL, '洋芋片');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_776', '[\"洋菇\",\"西洋蘑菇(蘑菇\",\"雙孢蘑菇)\"]', '菇類', '自動生成: 洋菇 (僅台灣資料庫)', NULL, '洋菇');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_777', '[\"洋菇罐頭\",\"西洋蘑菇(蘑菇\",\"雙孢蘑菇)\"]', '加工調理食品及其他類', '自動生成: 洋菇罐頭 (僅台灣資料庫)', NULL, '洋菇罐頭');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_780', '[\"洋香瓜(卡蜜拉)\",\"洋香瓜\",\"網仔瓜\",\"哈密瓜\"]', '水果類', '自動生成: 洋香瓜(卡蜜拉) (僅台灣資料庫)', NULL, '洋香瓜(卡蜜拉)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_781', '[\"洋香瓜(新世紀)\",\"洋香瓜\",\"網仔瓜\",\"哈密瓜\"]', '水果類', '自動生成: 洋香瓜(新世紀) (僅台灣資料庫)', NULL, '洋香瓜(新世紀)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_782', '[\"洋香菜片\"]', '調味料及香辛料類', '自動生成: 洋香菜片 (僅台灣資料庫)', NULL, '洋香菜片');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_783', '[\"洛神花乾\",\"玫瑰茄\",\"洛神葵\",\"洛神果\",\"洛濟葵\"]', '蔬菜類', '自動生成: 洛神花乾 (僅台灣資料庫)', NULL, '洛神花乾');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_785', '[\"海帶卷\",\"江白菜卷\",\"昆布卷\",\"海昆布卷\"]', '藻類', '自動生成: 海帶卷 (僅台灣資料庫)', NULL, '海帶卷');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_786', '[\"海帶平均值\",\"江白菜\",\"昆布\",\"海昆布\"]', '藻類', '自動生成: 海帶平均值 (僅台灣資料庫)', NULL, '海帶平均值');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_787', '[\"海帶梗\",\"海帶根\"]', '藻類', '自動生成: 海帶梗 (僅台灣資料庫)', NULL, '海帶梗');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_788', '[\"海帶結\",\"江白菜結\",\"昆布結\",\"海昆布結\"]', '藻類', '自動生成: 海帶結 (僅台灣資料庫)', NULL, '海帶結');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_789', '[\"海帶絲\",\"江白菜絲\",\"昆布絲\",\"海昆布絲\"]', '藻類', '自動生成: 海帶絲 (僅台灣資料庫)', NULL, '海帶絲');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_790', '[\"海帶茸\",\"江白菜茸\",\"昆布茸\",\"海昆布茸\"]', '藻類', '自動生成: 海帶茸 (僅台灣資料庫)', NULL, '海帶茸');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_791', '[\"海梨桶柑\",\"年柑\",\"草山柑\",\"焦柑\",\"蜜桶\",\"漳柑\",\"草山桔(海梨)\"]', '水果類', '自動生成: 海梨桶柑 (僅台灣資料庫)', NULL, '海梨桶柑');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_793', '[\"海苔醬\"]', '調味料及香辛料類', '自動生成: 海苔醬 (僅台灣資料庫)', NULL, '海苔醬');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_794', '[\"海蜇皮\",\"瑝魚\",\"海蛇\",\"紅(面)蜇\",\"鮓魚\"]', '魚貝類', '自動生成: 海蜇皮 (僅台灣資料庫)', NULL, '海蜇皮');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_796', '[\"海鮮醬\"]', '調味料及香辛料類', '自動生成: 海鮮醬 (僅台灣資料庫)', NULL, '海鮮醬');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_798', '[\"海鱺\",\"海麗仔\",\"軍曹魚\",\"海龍魚\",\"黑魽\",\"海麗(臺東)\",\"海魚戾魚\",\"錫臘白\",\"海鱺/鱺魚/紅目鱺(澎湖)\"]', '魚貝類', '自動生成: 海鱺 (僅台灣資料庫)', NULL, '海鱺');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_800', '[\"液體奶精\",\"奶精\"]', '調味料及香辛料類', '自動生成: 液體奶精 (僅台灣資料庫)', NULL, '液體奶精');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_801', '[\"液體奶精(2021年)\",\"液體奶精\",\"奶精\"]', '調味料及香辛料類', '自動生成: 液體奶精(2021年) (僅台灣資料庫)', NULL, '液體奶精(2021年)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_802', '[\"淡煉乳\",\"蒸發乳\",\"奶水\"]', '乳品類', '自動生成: 淡煉乳 (僅台灣資料庫)', NULL, '淡煉乳');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_804', '[\"淮山\",\"山芋\",\"山薯\",\"田薯\",\"薯蕷\",\"長薯;淮山(加工後)\"]', '澱粉類', '自動生成: 淮山 (僅台灣資料庫)', NULL, '淮山');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_806', '[\"清腿(土雞)\",\"清腿\",\"雞腿\"]', '肉類', '自動生成: 清腿(土雞) (僅台灣資料庫)', NULL, '清腿(土雞)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_807', '[\"清腿(肉雞)\",\"清腿\",\"雞腿\"]', '肉類', '自動生成: 清腿(肉雞) (僅台灣資料庫)', NULL, '清腿(肉雞)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_808', '[\"清腿平均值\"]', '肉類', '自動生成: 清腿平均值 (僅台灣資料庫)', NULL, '清腿平均值');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_810', '[\"溫州餛飩\",\"大餛飩\"]', '加工調理食品及其他類', '自動生成: 溫州餛飩 (僅台灣資料庫)', NULL, '溫州餛飩');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_812', '[\"滑菇\",\"珍珠菇\",\"滑子\",\"滑子蘑\",\"光蓋鱗傘\",\"光帽黃傘(滑鱗傘)\"]', '菇類', '自動生成: 滑菇 (僅台灣資料庫)', NULL, '滑菇');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_813', '[\"滷牛筋\",\"滷蹄筋\"]', '加工調理食品及其他類', '自動生成: 滷牛筋 (僅台灣資料庫)', NULL, '滷牛筋');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_817', '[\"滷豬腳\"]', '加工調理食品及其他類', '自動生成: 滷豬腳 (僅台灣資料庫)', NULL, '滷豬腳');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_818', '[\"漢堡包\"]', '糕餅點心類', '自動生成: 漢堡包 (僅台灣資料庫)', NULL, '漢堡包');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_819', '[\"澳洲甜橙(進口)\",\"澳洲甜橙\",\"甜橙\",\"柳橙\",\"柳丁\",\"印子柑\",\"廣柑\"]', '水果類', '自動生成: 澳洲甜橙(進口) (僅台灣資料庫)', NULL, '澳洲甜橙(進口)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_820', '[\"澳洲綠蘆筍(粗短型)\",\"澳洲綠蘆筍\",\"野天門冬\",\"松葉土當歸\",\"石刁柏\",\"龍鬚菜\"]', '蔬菜類', '自動生成: 澳洲綠蘆筍(粗短型) (僅台灣資料庫)', NULL, '澳洲綠蘆筍(粗短型)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_823', '[\"火炭母草\",\"川七\",\"清飯藤\",\"冷飯藤\",\"雞糞(屎)藤\",\"烏炭子\"]', '蔬菜類', '自動生成: 火炭母草 (僅台灣資料庫)', NULL, '火炭母草');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_826', '[\"灰海鰻\",\"虎鰻\",\"海鰻\",\"錢鰻(臺東)\"]', '魚貝類', '自動生成: 灰海鰻 (僅台灣資料庫)', NULL, '灰海鰻');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_827', '[\"炒板條\"]', '加工調理食品及其他類', '自動生成: 炒板條 (僅台灣資料庫)', NULL, '炒板條');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_829', '[\"炸排粉\"]', '調味料及香辛料類', '自動生成: 炸排粉 (僅台灣資料庫)', NULL, '炸排粉');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_830', '[\"炸醬\"]', '調味料及香辛料類', '自動生成: 炸醬 (僅台灣資料庫)', NULL, '炸醬');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_831', '[\"炸雞粉\"]', '調味料及香辛料類', '自動生成: 炸雞粉 (僅台灣資料庫)', NULL, '炸雞粉');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_832', '[\"烏梅汁\"]', '飲料類', '自動生成: 烏梅汁 (僅台灣資料庫)', NULL, '烏梅汁');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_834', '[\"烏賊精囊\",\"烏賊鰾(膘)\",\"花枝鰾(膘)\"]', '魚貝類', '自動生成: 烏賊精囊 (僅台灣資料庫)', NULL, '烏賊精囊');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_836', '[\"烏骨雞\",\"竹絲雞\",\"絲羽烏骨雞\",\"武山雞\",\"烏雞\"]', '肉類', '自動生成: 烏骨雞 (僅台灣資料庫)', NULL, '烏骨雞');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_840', '[\"烏鯧\",\"烏昌\",\"三角昌\",\"昌鼠魚\",\"黑鯧\",\"暗鯧\",\"黑鰭\",\"燕尾鯧\"]', '魚貝類', '自動生成: 烏鯧 (僅台灣資料庫)', NULL, '烏鯧');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_849', '[\"烘烤黑豆\",\"烏豆\",\"枝仔豆\",\"黑大豆\"]', '豆類', '自動生成: 烘烤黑豆 (僅台灣資料庫)', NULL, '烘烤黑豆');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_850', '[\"烤布丁\"]', '糕餅點心類', '自動生成: 烤布丁 (僅台灣資料庫)', NULL, '烤布丁');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_851', '[\"烤肉醬\"]', '調味料及香辛料類', '自動生成: 烤肉醬 (僅台灣資料庫)', NULL, '烤肉醬');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_852', '[\"烤酥油\"]', '油脂類', '自動生成: 烤酥油 (僅台灣資料庫)', NULL, '烤酥油');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_853', '[\"烤雞\",\"手扒雞\"]', '加工調理食品及其他類', '自動生成: 烤雞 (僅台灣資料庫)', NULL, '烤雞');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_855', '[\"無子芭樂\",\"番石榴\",\"芭樂\",\"拔仔\",\"扒仔\",\"朳仔\",\"那拔仔\",\"藍拔\"]', '水果類', '自動生成: 無子芭樂 (僅台灣資料庫)', NULL, '無子芭樂');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_856', '[\"無斑圓鰺\",\"紅瓜魚\",\"巴攏\",\"紅扁鰺\",\"赤尾仔(臺東)\",\"赤尾\",\"馬尾冬\",\"紅瓜鰺\",\"紅尾巴弄(澎湖)\"]', '魚貝類', '自動生成: 無斑圓鰺 (僅台灣資料庫)', NULL, '無斑圓鰺');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_860', '[\"無花果\"]', '水果類', '自動生成: 無花果 (僅台灣資料庫)', NULL, '無花果');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_861', '[\"無花果乾\",\"無花果\"]', '水果類', '自動生成: 無花果乾 (僅台灣資料庫)', NULL, '無花果乾');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_864', '[\"無骨牛小排(美牛)\",\"無骨牛小排\"]', '肉類', '自動生成: 無骨牛小排(美牛) (僅台灣資料庫)', NULL, '無骨牛小排(美牛)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_866', '[\"煎餅\"]', '糕餅點心類', '自動生成: 煎餅 (僅台灣資料庫)', NULL, '煎餅');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_867', '[\"煙台白菜\",\"大白菜\",\"黃芽菜\",\"包心白菜\",\"卷心白菜\",\"山東白菜\",\"結球白菜(包頭蓮)\"]', '蔬菜類', '自動生成: 煙台白菜 (僅台灣資料庫)', NULL, '煙台白菜');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_872', '[\"熟紫菜\",\"海苔\"]', '藻類', '自動生成: 熟紫菜 (僅台灣資料庫)', NULL, '熟紫菜');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_873', '[\"熟蓮藕\",\"蓮根\",\"藕\",\"芙蕖\",\"荷花藕\"]', '澱粉類', '自動生成: 熟蓮藕 (僅台灣資料庫)', NULL, '熟蓮藕');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_874', '[\"熟蓮藕切片(水煮)\",\"熟蓮藕切片\",\"蓮根\",\"藕\",\"芙蕖\",\"荷花藕\"]', '澱粉類', '自動生成: 熟蓮藕切片(水煮) (僅台灣資料庫)', NULL, '熟蓮藕切片(水煮)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_875', '[\"熟豬肚\",\"豬胃\"]', '肉類', '自動生成: 熟豬肚 (僅台灣資料庫)', NULL, '熟豬肚');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_876', '[\"熟鵝腿肉\"]', '加工調理食品及其他類', '自動生成: 熟鵝腿肉 (僅台灣資料庫)', NULL, '熟鵝腿肉');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_877', '[\"熱狗\"]', '加工調理食品及其他類', '自動生成: 熱狗 (僅台灣資料庫)', NULL, '熱狗');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_878', '[\"熱狗粉\"]', '調味料及香辛料類', '自動生成: 熱狗粉 (僅台灣資料庫)', NULL, '熱狗粉');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_879', '[\"燒餅\"]', '加工調理食品及其他類', '自動生成: 燒餅 (僅台灣資料庫)', NULL, '燒餅');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_880', '[\"燕麥\"]', '穀物類', '自動生成: 燕麥 (僅台灣資料庫)', NULL, '燕麥');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_881', '[\"燕麥奶\"]', '加工調理食品及其他類', '自動生成: 燕麥奶 (僅台灣資料庫)', NULL, '燕麥奶');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_882', '[\"燕麥片\"]', '穀物類', '自動生成: 燕麥片 (僅台灣資料庫)', NULL, '燕麥片');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_883', '[\"營養口糧\"]', '糕餅點心類', '自動生成: 營養口糧 (僅台灣資料庫)', NULL, '營養口糧');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_886', '[\"片狀肉乾(豬肉)\",\"片狀肉乾\",\"豬肉干\"]', '加工調理食品及其他類', '自動生成: 片狀肉乾(豬肉) (僅台灣資料庫)', NULL, '片狀肉乾(豬肉)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_887', '[\"牛五花肉火鍋片\"]', '肉類', '自動生成: 牛五花肉火鍋片 (僅台灣資料庫)', NULL, '牛五花肉火鍋片');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_888', '[\"牛修清前胸肉\",\"修清牛腩\",\"修清前胸腋肌\"]', '肉類', '自動生成: 牛修清前胸肉 (僅台灣資料庫)', NULL, '牛修清前胸肉');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_889', '[\"牛前胸肉\",\"去骨前胸肉\",\"牛腩\"]', '肉類', '自動生成: 牛前胸肉 (僅台灣資料庫)', NULL, '牛前胸肉');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_890', '[\"牛去骨肩胛小排\",\"肥牛肉\"]', '肉類', '自動生成: 牛去骨肩胛小排 (僅台灣資料庫)', NULL, '牛去骨肩胛小排');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_895', '[\"牛嫩肩里肌火鍋片\"]', '肉類', '自動生成: 牛嫩肩里肌火鍋片 (僅台灣資料庫)', NULL, '牛嫩肩里肌火鍋片');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_896', '[\"牛小排平均值\",\"肥牛肉\",\"小肋排\",\"牛仔骨\"]', '肉類', '自動生成: 牛小排平均值 (僅台灣資料庫)', NULL, '牛小排平均值');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_897', '[\"牛後腿肉\"]', '肉類', '自動生成: 牛後腿肉 (僅台灣資料庫)', NULL, '牛後腿肉');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_898', '[\"牛後腿股肉\",\"和尚頭\",\"牛霖\"]', '肉類', '自動生成: 牛後腿股肉 (僅台灣資料庫)', NULL, '牛後腿股肉');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_899', '[\"牛後腿腱子心\",\"牛腱\",\"腱子\"]', '肉類', '自動生成: 牛後腿腱子心 (僅台灣資料庫)', NULL, '牛後腿腱子心');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_900', '[\"牛後腿腱子心(2022年取樣)\",\"牛後腿腱子心\",\"牛腱\",\"腱子\"]', '肉類', '自動生成: 牛後腿腱子心(2022年取樣) (僅台灣資料庫)', NULL, '牛後腿腱子心(2022年取樣)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_901', '[\"牛心柿\",\"柿子\",\"柹\",\"香柿(水柿\",\"浸柿\",\"硬柿\",\"脆柿)\"]', '水果類', '自動生成: 牛心柿 (僅台灣資料庫)', NULL, '牛心柿');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_902', '[\"牛排醬\"]', '調味料及香辛料類', '自動生成: 牛排醬 (僅台灣資料庫)', NULL, '牛排醬');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_903', '[\"牛梅花肉火鍋片\"]', '肉類', '自動生成: 牛梅花肉火鍋片 (僅台灣資料庫)', NULL, '牛梅花肉火鍋片');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_904', '[\"牛油(未精煉)\",\"牛油\"]', '油脂類', '自動生成: 牛油(未精煉) (僅台灣資料庫)', NULL, '牛油(未精煉)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_905', '[\"牛油(精煉)\",\"牛油\"]', '油脂類', '自動生成: 牛油(精煉) (僅台灣資料庫)', NULL, '牛油(精煉)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_907', '[\"牛筋\",\"蹄筋\"]', '肉類', '自動生成: 牛筋 (僅台灣資料庫)', NULL, '牛筋');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_908', '[\"牛紐約客火鍋片\"]', '肉類', '自動生成: 牛紐約客火鍋片 (僅台灣資料庫)', NULL, '牛紐約客火鍋片');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_913', '[\"牛肋條\",\"腩條\",\"條肉\"]', '肉類', '自動生成: 牛肋條 (僅台灣資料庫)', NULL, '牛肋條');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_914', '[\"牛肋條(2021年取樣)\",\"牛肋條\"]', '肉類', '自動生成: 牛肋條(2021年取樣) (僅台灣資料庫)', NULL, '牛肋條(2021年取樣)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_915', '[\"牛肚(瘤胃)\",\"牛肚\",\"百葉胃\",\"毛肚\",\"牛百葉\",\"牛百頁\",\"牛草肚(牛之第一胃\",\"山鏈狀)\"]', '肉類', '自動生成: 牛肚(瘤胃) (僅台灣資料庫)', NULL, '牛肚(瘤胃)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_916', '[\"牛肚(蜂巢胃)\",\"牛肚\",\"蜂巢肚\",\"金錢肚(牛之第二胃)\"]', '肉類', '自動生成: 牛肚(蜂巢胃) (僅台灣資料庫)', NULL, '牛肚(蜂巢胃)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_917', '[\"牛肚切片(瘤胃)\",\"牛肚切片\",\"百葉胃\",\"毛肚\",\"牛百葉\",\"牛百頁\",\"牛草肚(牛之第一胃)\"]', '肉類', '自動生成: 牛肚切片(瘤胃) (僅台灣資料庫)', NULL, '牛肚切片(瘤胃)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_918', '[\"牛肚平均值\",\"百葉胃\",\"毛肚\",\"牛百葉\",\"牛百頁\",\"牛草肚(牛之第一胃);蜂巢肚\",\"金錢肚(牛之第二胃)\"]', '肉類', '自動生成: 牛肚平均值 (僅台灣資料庫)', NULL, '牛肚平均值');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_919', '[\"牛舌餅\"]', '糕餅點心類', '自動生成: 牛舌餅 (僅台灣資料庫)', NULL, '牛舌餅');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_920', '[\"牛蒡\",\"吳帽\",\"吳某\",\"牛菜\",\"蒡翁菜\",\"鼠黏\"]', '蔬菜類', '自動生成: 牛蒡 (僅台灣資料庫)', NULL, '牛蒡');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_924', '[\"狀元瓜\",\"甜瓜\",\"甘瓜\",\"果瓜\",\"香瓜\",\"梨仔瓜\",\"澎湖瓜\",\"洋香瓜\"]', '水果類', '自動生成: 狀元瓜 (僅台灣資料庫)', NULL, '狀元瓜');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_926', '[\"猴頭菇\",\"猴頭蘑\",\"刺蝟菌\",\"蝟菌\",\"花菜菇\",\"圓頭菇\",\"陰陽蘑\",\"對臉蘑\"]', '菇類', '自動生成: 猴頭菇 (僅台灣資料庫)', NULL, '猴頭菇');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_927', '[\"猴頭菇罐頭\",\"猴頭蘑\",\"刺蝟菌\",\"蝟菌\",\"花菜菇\",\"圓頭菇\",\"陰陽蘑\",\"對臉蘑\"]', '加工調理食品及其他類', '自動生成: 猴頭菇罐頭 (僅台灣資料庫)', NULL, '猴頭菇罐頭');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_938', '[\"玉荷苞荔枝\",\"丹荔\",\"荔錦\",\"麗枝\",\"離枝\"]', '水果類', '自動生成: 玉荷苞荔枝 (僅台灣資料庫)', NULL, '玉荷苞荔枝');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_939', '[\"玫瑰桃\",\"桃子\",\"脆桃\",\"甜桃\"]', '水果類', '自動生成: 玫瑰桃 (僅台灣資料庫)', NULL, '玫瑰桃');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_940', '[\"玫瑰菇\",\"紅側耳\",\"桃紅平菇\",\"紅平菇\",\"粉紅菇\"]', '菇類', '自動生成: 玫瑰菇 (僅台灣資料庫)', NULL, '玫瑰菇');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_941', '[\"珊瑚菇\",\"金頂鮑魚菇\",\"金頂蘑\",\"榆黃蘑\",\"榆(黃)蘑\",\"黃金菇\",\"玉皇(米)菇\",\"粗口黃\",\"楊柳菌\",\"黃樹窩(金頂側耳)\"]', '菇類', '自動生成: 珊瑚菇 (僅台灣資料庫)', NULL, '珊瑚菇');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_945', '[\"珍珠小白菜\",\"珍珠白菜\"]', '蔬菜類', '自動生成: 珍珠小白菜 (僅台灣資料庫)', NULL, '珍珠小白菜');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_946', '[\"珍珠芭樂\",\"番石榴\",\"芭樂\",\"拔仔\",\"扒仔\",\"朳仔\",\"那拔仔\",\"藍拔\"]', '水果類', '自動生成: 珍珠芭樂 (僅台灣資料庫)', NULL, '珍珠芭樂');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_947', '[\"珍珠苦瓜\",\"錦荔枝\",\"癩蒲萄\",\"涼瓜\",\"癩瓜\",\"紅姑娘(青苦瓜)\"]', '蔬菜類', '自動生成: 珍珠苦瓜 (僅台灣資料庫)', NULL, '珍珠苦瓜');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_948', '[\"珍珠蜜棗\",\"棗子\",\"棗仔\"]', '水果類', '自動生成: 珍珠蜜棗 (僅台灣資料庫)', NULL, '珍珠蜜棗');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_949', '[\"珠貝(乾)\",\"珠貝\",\"珍珠干貝\"]', '魚貝類', '自動生成: 珠貝(乾) (僅台灣資料庫)', NULL, '珠貝(乾)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_950', '[\"球莖甘藍\",\"大頭菜\",\"結頭菜\",\"芥頭\",\"菜菜鵠\",\"菜叩\",\"莖藍\",\"蕪菁蕓苔\"]', '蔬菜類', '自動生成: 球莖甘藍 (僅台灣資料庫)', NULL, '球莖甘藍');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_952', '[\"環紋簑鮋\",\"龍鬚簑鮋\",\"獅子魚\",\"長獅\",\"魔鬼\",\"國公\",\"石狗敢\",\"虎魚\",\"雞公\",\"紅虎\",\"火烘\",\"石頭魚\"]', '魚貝類', '自動生成: 環紋簑鮋 (僅台灣資料庫)', NULL, '環紋簑鮋');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_953', '[\"甘扁桃仁(熟)\",\"甘扁桃仁\",\"杏仁果(熟)\"]', '堅果及種子類', '自動生成: 甘扁桃仁(熟) (僅台灣資料庫)', NULL, '甘扁桃仁(熟)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_954', '[\"甘扁桃仁片(熟)\",\"甘扁桃仁片\",\"杏仁片(熟)\"]', '堅果及種子類', '自動生成: 甘扁桃仁片(熟) (僅台灣資料庫)', NULL, '甘扁桃仁片(熟)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_955', '[\"甘扁桃仁片(生)\",\"甘扁桃仁片\",\"杏仁片(生)\"]', '堅果及種子類', '自動生成: 甘扁桃仁片(生) (僅台灣資料庫)', NULL, '甘扁桃仁片(生)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_956', '[\"甘納豆\"]', '加工調理食品及其他類', '自動生成: 甘納豆 (僅台灣資料庫)', NULL, '甘納豆');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_957', '[\"甘草粉\"]', '調味料及香辛料類', '自動生成: 甘草粉 (僅台灣資料庫)', NULL, '甘草粉');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_958', '[\"甘草葵瓜子(帶殼)\",\"甘草葵瓜子\"]', '加工調理食品及其他類', '自動生成: 甘草葵瓜子(帶殼) (僅台灣資料庫)', NULL, '甘草葵瓜子(帶殼)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_960', '[\"甘薯蜜餞\"]', '糕餅點心類', '自動生成: 甘薯蜜餞 (僅台灣資料庫)', NULL, '甘薯蜜餞');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_961', '[\"甘藍(圓球形)\",\"甘藍\",\"高麗菜\",\"包菜\",\"洋白菜\",\"玻璃菜\",\"玉菜\",\"捲心菜\",\"球葉甘藍\",\"結球甘藍\",\"蕃芥藍\"]', '蔬菜類', '自動生成: 甘藍(圓球形) (僅台灣資料庫)', NULL, '甘藍(圓球形)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_962', '[\"甘藍(圓球形)(2021年取樣)\",\"甘藍\",\"高麗菜\"]', '蔬菜類', '自動生成: 甘藍(圓球形)(2021年取樣) (僅台灣資料庫)', NULL, '甘藍(圓球形)(2021年取樣)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_963', '[\"甘藍(扁圓形)\",\"甘藍\",\"高麗菜\",\"包菜\",\"洋白菜\",\"玻璃菜\",\"玉菜\",\"捲心菜\",\"球葉甘藍\",\"結球甘藍\",\"蕃芥藍\"]', '蔬菜類', '自動生成: 甘藍(扁圓形) (僅台灣資料庫)', NULL, '甘藍(扁圓形)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_964', '[\"甘藍乾\",\"高麗菜乾\"]', '加工調理食品及其他類', '自動生成: 甘藍乾 (僅台灣資料庫)', NULL, '甘藍乾');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_965', '[\"甘藍平均值\",\"高麗菜\",\"包菜\",\"洋白菜\",\"玻璃菜\",\"玉菜\",\"捲心菜\",\"球葉甘藍\",\"結球甘藍\",\"蕃芥藍\"]', '蔬菜類', '自動生成: 甘藍平均值 (僅台灣資料庫)', NULL, '甘藍平均值');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_966', '[\"甘藍芽\",\"高麗菜芽\"]', '蔬菜類', '自動生成: 甘藍芽 (僅台灣資料庫)', NULL, '甘藍芽');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_967', '[\"甘藷粉\",\"甘薯粉\",\"蕃薯粉\",\"甜薯粉\",\"地瓜粉\"]', '澱粉類', '自動生成: 甘藷粉 (僅台灣資料庫)', NULL, '甘藷粉');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_968', '[\"甘藷葉\",\"地瓜葉\",\"番藷葉\",\"過溝菜(藷同薯)\"]', '蔬菜類', '自動生成: 甘藷葉 (僅台灣資料庫)', NULL, '甘藷葉');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_969', '[\"甜柿(進口)\",\"甜柿\",\"柿子\",\"柹\",\"香柿\"]', '水果類', '自動生成: 甜柿(進口) (僅台灣資料庫)', NULL, '甜柿(進口)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_970', '[\"甜柿平均值\",\"柿子\",\"柹\",\"香柿\"]', '水果類', '自動生成: 甜柿平均值 (僅台灣資料庫)', NULL, '甜柿平均值');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_972', '[\"甜椒(橙皮)\",\"甜椒\",\"甜番椒\",\"大同仔\",\"番羌仔\",\"燈籠椒\",\"生番薑\",\"獅子椒\",\"甘椒\",\"生椒\"]', '蔬菜類', '自動生成: 甜椒(橙皮) (僅台灣資料庫)', NULL, '甜椒(橙皮)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_973', '[\"甜椒(紅皮)\",\"甜椒\",\"甜番椒\",\"大同仔\",\"番羌仔\",\"燈籠椒\",\"生番薑\",\"獅子椒\",\"甘椒\",\"生椒(紅椒\",\"紅番(辣)椒\",\"紅色大唐)\"]', '蔬菜類', '自動生成: 甜椒(紅皮) (僅台灣資料庫)', NULL, '甜椒(紅皮)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_974', '[\"甜椒(青皮)\",\"甜椒\",\"甜番椒\",\"大同仔\",\"番羌仔\",\"燈籠椒\",\"生番薑\",\"獅子椒\",\"甘椒\",\"生椒(青椒\",\"青辣椒)\"]', '蔬菜類', '自動生成: 甜椒(青皮) (僅台灣資料庫)', NULL, '甜椒(青皮)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_975', '[\"甜椒(黃皮)\",\"甜椒\",\"甜番椒\",\"大同仔\",\"番羌仔\",\"燈籠椒\",\"生番薑\",\"獅子椒\",\"甘椒\",\"生椒\"]', '蔬菜類', '自動生成: 甜椒(黃皮) (僅台灣資料庫)', NULL, '甜椒(黃皮)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_976', '[\"甜椒平均值(青皮)\",\"甜椒平均值\",\"青椒\",\"(甜)番椒\",\"青辣椒\",\"大同仔\",\"番羌仔\",\"燈籠椒\",\"生番薑\",\"獅子椒\",\"甘椒\",\"生椒\"]', '蔬菜類', '自動生成: 甜椒平均值(青皮) (僅台灣資料庫)', NULL, '甜椒平均值(青皮)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_977', '[\"甜橙平均值(普遍系)\",\"甜橙平均值\",\"甜橙\",\"柳橙\",\"柳丁\",\"印子柑\",\"廣柑\"]', '水果類', '自動生成: 甜橙平均值(普遍系) (僅台灣資料庫)', NULL, '甜橙平均值(普遍系)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_979', '[\"甜瓜平均值(光皮洋香瓜)\",\"甜瓜平均值\",\"甜瓜\",\"甘瓜\",\"果瓜\",\"香瓜\",\"梨仔瓜\",\"澎湖瓜\",\"洋香瓜\"]', '水果類', '自動生成: 甜瓜平均值(光皮洋香瓜) (僅台灣資料庫)', NULL, '甜瓜平均值(光皮洋香瓜)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_980', '[\"甜瓜平均值(東洋系脆瓜)\",\"甜瓜平均值\",\"甜瓜\",\"甘瓜\",\"果瓜\",\"香瓜\",\"梨仔瓜\",\"澎湖瓜\"]', '水果類', '自動生成: 甜瓜平均值(東洋系脆瓜) (僅台灣資料庫)', NULL, '甜瓜平均值(東洋系脆瓜)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_981', '[\"甜瓜平均值(網紋洋香瓜)\",\"甜瓜平均值\",\"甜瓜\",\"甘瓜\",\"果瓜\",\"香瓜\",\"梨仔瓜\",\"澎湖瓜\",\"洋香瓜\",\"網仔瓜\",\"哈蜜瓜\"]', '水果類', '自動生成: 甜瓜平均值(網紋洋香瓜) (僅台灣資料庫)', NULL, '甜瓜平均值(網紋洋香瓜)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_982', '[\"甜蜜桃\",\"毛桃\",\"白桃\"]', '水果類', '自動生成: 甜蜜桃 (僅台灣資料庫)', NULL, '甜蜜桃');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_985', '[\"甜辣醬\"]', '調味料及香辛料類', '自動生成: 甜辣醬 (僅台灣資料庫)', NULL, '甜辣醬');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_986', '[\"甜酒釀\"]', '加工調理食品及其他類', '自動生成: 甜酒釀 (僅台灣資料庫)', NULL, '甜酒釀');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_987', '[\"甜麵醬\"]', '調味料及香辛料類', '自動生成: 甜麵醬 (僅台灣資料庫)', NULL, '甜麵醬');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_990', '[\"番石榴(珍珠拔)(有機)\",\"番石榴\",\"牛乳芭樂\",\"牛奶芭樂\",\"芭樂\",\"拔仔\",\"扒仔\",\"朳仔\",\"那拔仔\",\"藍拔\"]', '水果類', '自動生成: 番石榴(珍珠拔)(有機) (僅台灣資料庫)', NULL, '番石榴(珍珠拔)(有機)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_991', '[\"番鴨\",\"麝番鴨\",\"紅面鴨\",\"紅面(正)番鴨\"]', '肉類', '自動生成: 番鴨 (僅台灣資料庫)', NULL, '番鴨');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1002', '[\"白柚\",\"柚子\",\"內紫\",\"朱欒\",\"香欒\",\"座凡\",\"拋\",\"欒\"]', '水果類', '自動生成: 白柚 (僅台灣資料庫)', NULL, '白柚');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1004', '[\"白毛木耳\",\"毛木耳(白化)\",\"雪珍耳\"]', '菇類', '自動生成: 白毛木耳 (僅台灣資料庫)', NULL, '白毛木耳');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1005', '[\"白油桃\",\"桃子\",\"脆桃\",\"甜桃\"]', '水果類', '自動生成: 白油桃 (僅台灣資料庫)', NULL, '白油桃');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1007', '[\"白海參\",\"海蚯蚓\",\"沙糞\"]', '魚貝類', '自動生成: 白海參 (僅台灣資料庫)', NULL, '白海參');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1009', '[\"白皮甘藷\",\"甘薯\",\"番薯\",\"甜薯\",\"地瓜\",\"田薯\",\"土薯\",\"白薯\"]', '澱粉類', '自動生成: 白皮甘藷 (僅台灣資料庫)', NULL, '白皮甘藷');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1010', '[\"白皮蛇瓜\",\"蛇王瓜\",\"毛烏瓜\"]', '蔬菜類', '自動生成: 白皮蛇瓜 (僅台灣資料庫)', NULL, '白皮蛇瓜');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1012', '[\"白緣星鱠\",\"闊嘴格仔\",\"鱠\",\"過魚\",\"石斑\",\"紅朱鱠(臺東)\",\"粉條(澎湖)\"]', '魚貝類', '自動生成: 白緣星鱠 (僅台灣資料庫)', NULL, '白緣星鱠');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1021', '[\"白茯苓\",\"松(雲/安/閩)苓\",\"玉(茯)靈\",\"茯兔(龜)\",\"松柏芋\",\"松薯\",\"不死麵\",\"萬靈桂(精)\",\"更生\",\"金翁\"]', '菇類', '自動生成: 白茯苓 (僅台灣資料庫)', NULL, '白茯苓');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1022', '[\"白莧菜\",\"杏菜\",\"荇菜\",\"莕菜\",\"茵菜\",\"白杏菜\",\"白荇菜\"]', '蔬菜類', '自動生成: 白莧菜 (僅台灣資料庫)', NULL, '白莧菜');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1023', '[\"白菜芽\",\"娃娃菜\"]', '蔬菜類', '自動生成: 白菜芽 (僅台灣資料庫)', NULL, '白菜芽');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1025', '[\"白蘆筍\",\"野天門冬\",\"松葉土當歸\",\"石刁柏\",\"龍鬚菜\"]', '蔬菜類', '自動生成: 白蘆筍 (僅台灣資料庫)', NULL, '白蘆筍');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1029', '[\"白蠔菇\"]', '菇類', '自動生成: 白蠔菇 (僅台灣資料庫)', NULL, '白蠔菇');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1030', '[\"白醬\"]', '調味料及香辛料類', '自動生成: 白醬 (僅台灣資料庫)', NULL, '白醬');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1031', '[\"白飯\"]', '穀物類', '自動生成: 白飯 (僅台灣資料庫)', NULL, '白飯');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1032', '[\"白饅頭\"]', '加工調理食品及其他類', '自動生成: 白饅頭 (僅台灣資料庫)', NULL, '白饅頭');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1034', '[\"白鱸\"]', '魚貝類', '自動生成: 白鱸 (僅台灣資料庫)', NULL, '白鱸');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1035', '[\"白鳳菜\",\"白蓊菜\"]', '蔬菜類', '自動生成: 白鳳菜 (僅台灣資料庫)', NULL, '白鳳菜');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1036', '[\"白鳳豆(台灣)\",\"白鳳豆\",\"矮性刀豆\",\"洋刀豆\",\"立刀豆\"]', '豆類', '自動生成: 白鳳豆(台灣) (僅台灣資料庫)', NULL, '白鳳豆(台灣)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1037', '[\"白鳳豆(進口)\",\"白鳳豆\",\"矮性刀豆\",\"洋刀豆\",\"立刀豆\"]', '豆類', '自動生成: 白鳳豆(進口) (僅台灣資料庫)', NULL, '白鳳豆(進口)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1038', '[\"白鳳豆平均值\",\"矮性刀豆\",\"洋刀豆\",\"立刀豆\"]', '豆類', '自動生成: 白鳳豆平均值 (僅台灣資料庫)', NULL, '白鳳豆平均值');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1039', '[\"百合鱗片\",\"百合\",\"百合花鱗片\",\"蒜腦藷\"]', '蔬菜類', '自動生成: 百合鱗片 (僅台灣資料庫)', NULL, '百合鱗片');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1041', '[\"百香果(台農一號)\",\"百香果\",\"時計果\",\"西番果\"]', '水果類', '自動生成: 百香果(台農一號) (僅台灣資料庫)', NULL, '百香果(台農一號)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1043', '[\"皇宮菜\"]', '蔬菜類', '自動生成: 皇宮菜 (僅台灣資料庫)', NULL, '皇宮菜');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1046', '[\"真烏賊(大)\",\"真烏賊\",\"花枝\",\"墨魚\",\"金烏賊\",\"烏鰂\",\"墨鬥魚\"]', '魚貝類', '自動生成: 真烏賊(大) (僅台灣資料庫)', NULL, '真烏賊(大)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1047', '[\"真烏賊(小)\",\"真烏賊\",\"花枝\",\"墨魚\",\"金烏賊\",\"烏鰂\",\"墨鬥魚\"]', '魚貝類', '自動生成: 真烏賊(小) (僅台灣資料庫)', NULL, '真烏賊(小)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1048', '[\"真烏賊平均值\",\"花枝\",\"墨魚\",\"金烏賊\",\"烏鰂\",\"墨鬥魚\"]', '魚貝類', '自動生成: 真烏賊平均值 (僅台灣資料庫)', NULL, '真烏賊平均值');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1051', '[\"真鯛(11月)\",\"真鯛\",\"嘉鱲魚\",\"正鯛\",\"加臘\",\"加蚋\",\"加魶\",\"加幾魚\",\"銅盆魚\",\"棘鬣魚\"]', '魚貝類', '自動生成: 真鯛(11月) (僅台灣資料庫)', NULL, '真鯛(11月)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1052', '[\"真鯛(1月)\",\"真鯛\",\"嘉鱲魚\",\"正鯛\",\"加臘\",\"加蚋\",\"加魶\",\"加幾魚\",\"銅盆魚\",\"棘鬣魚\"]', '魚貝類', '自動生成: 真鯛(1月) (僅台灣資料庫)', NULL, '真鯛(1月)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1053', '[\"真鯛(3月)\",\"真鯛\",\"嘉鱲魚\",\"正鯛\",\"加臘\",\"加蚋\",\"加魶\",\"加幾魚\",\"銅盆魚\",\"棘鬣魚\"]', '魚貝類', '自動生成: 真鯛(3月) (僅台灣資料庫)', NULL, '真鯛(3月)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1054', '[\"真鯛(5月)\",\"真鯛\",\"嘉鱲魚\",\"正鯛\",\"加臘\",\"加蚋\",\"加魶\",\"加幾魚\",\"銅盆魚\",\"棘鬣魚\"]', '魚貝類', '自動生成: 真鯛(5月) (僅台灣資料庫)', NULL, '真鯛(5月)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1055', '[\"真鯛(8月)\",\"真鯛\",\"嘉鱲魚\",\"正鯛\",\"加臘\",\"加蚋\",\"加魶\",\"加幾魚\",\"銅盆魚\",\"棘鬣魚\"]', '魚貝類', '自動生成: 真鯛(8月) (僅台灣資料庫)', NULL, '真鯛(8月)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1056', '[\"真鯛(9月)\",\"真鯛\",\"嘉鱲魚\",\"正鯛\",\"加臘\",\"加蚋\",\"加魶\",\"加幾魚\",\"銅盆魚\",\"棘鬣魚\"]', '魚貝類', '自動生成: 真鯛(9月) (僅台灣資料庫)', NULL, '真鯛(9月)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1057', '[\"真鯛平均值(去皮)\",\"真鯛平均值\",\"嘉鱲魚\",\"正鯛\",\"加臘\",\"加蚋\",\"加魶\",\"真鯛\",\"加幾魚\",\"銅盆魚\",\"棘鬣魚\"]', '魚貝類', '自動生成: 真鯛平均值(去皮) (僅台灣資料庫)', NULL, '真鯛平均值(去皮)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1060', '[\"石狗公\",\"石頭魚\",\"獅甕(澎湖)\",\"紅鱠仔\"]', '魚貝類', '自動生成: 石狗公 (僅台灣資料庫)', NULL, '石狗公');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1061', '[\"石蓮花\",\"蓮座草\"]', '蔬菜類', '自動生成: 石蓮花 (僅台灣資料庫)', NULL, '石蓮花');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1063', '[\"礁膜\",\"海菜(澎湖人稱)\"]', '藻類', '自動生成: 礁膜 (僅台灣資料庫)', NULL, '礁膜');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1064', '[\"福壽桃\",\"桃子\",\"脆桃\",\"甜桃\"]', '水果類', '自動生成: 福壽桃 (僅台灣資料庫)', NULL, '福壽桃');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1066', '[\"秀珍菇\",\"平菇\",\"小平菇\",\"側耳平菇\",\"蠔菇\",\"袖珍(鮑魚)菇(側耳)\"]', '菇類', '自動生成: 秀珍菇 (僅台灣資料庫)', NULL, '秀珍菇');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1067', '[\"秀珍菇罐頭\",\"平菇\",\"小平菇\",\"側耳平菇\",\"蠔菇\",\"袖珍(鮑魚)菇(側耳)\"]', '加工調理食品及其他類', '自動生成: 秀珍菇罐頭 (僅台灣資料庫)', NULL, '秀珍菇罐頭');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1075', '[\"秋香洋香瓜\",\"甜瓜\",\"甘瓜\",\"果瓜\",\"香瓜\",\"梨仔瓜\",\"澎湖瓜\",\"洋香瓜\",\"網仔瓜\",\"哈蜜瓜\"]', '水果類', '自動生成: 秋香洋香瓜 (僅台灣資料庫)', NULL, '秋香洋香瓜');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1091', '[\"稜角絲瓜\",\"澎湖絲瓜\",\"十角絲瓜\",\"十捻菜瓜\",\"角瓜\",\"廣東絲瓜\",\"雨傘絲瓜\",\"金門絲瓜\",\"香港絲瓜\"]', '蔬菜類', '自動生成: 稜角絲瓜 (僅台灣資料庫)', NULL, '稜角絲瓜');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1094', '[\"竹蟶(冷凍)\",\"竹蟶\",\"竹蛤\",\"竹蚶\",\"蟶仔\",\"竹節蟶\"]', '魚貝類', '自動生成: 竹蟶(冷凍) (僅台灣資料庫)', NULL, '竹蟶(冷凍)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1095', '[\"筆柿\",\"柿子\",\"柹\",\"香柿(長柿\",\"珍寶柿\",\"筆干柿)\"]', '水果類', '自動生成: 筆柿 (僅台灣資料庫)', NULL, '筆柿');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1109', '[\"粉圓\"]', '加工調理食品及其他類', '自動生成: 粉圓 (僅台灣資料庫)', NULL, '粉圓');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1111', '[\"粉粿\"]', '糕餅點心類', '自動生成: 粉粿 (僅台灣資料庫)', NULL, '粉粿');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1113', '[\"粉豆莢\",\"菜豆莢\",\"四季豆\",\"雲藕豆\",\"隱之(元)豆\",\"白(花)雲豆\",\"敏(雲/芸/粉/醜)豆\"]', '豆類', '自動生成: 粉豆莢 (僅台灣資料庫)', NULL, '粉豆莢');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1114', '[\"粿仔條\"]', '加工調理食品及其他類', '自動生成: 粿仔條 (僅台灣資料庫)', NULL, '粿仔條');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1130', '[\"糙薏仁\",\"紅薏仁\"]', '穀物類', '自動生成: 糙薏仁 (僅台灣資料庫)', NULL, '糙薏仁');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1137', '[\"糯高梁\"]', '穀物類', '自動生成: 糯高梁 (僅台灣資料庫)', NULL, '糯高梁');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1139', '[\"紅寶石洋香瓜\",\"甜瓜\",\"甘瓜\",\"果瓜\",\"香瓜\",\"梨仔瓜\",\"澎湖瓜\",\"洋香瓜\",\"網仔瓜\",\"哈蜜瓜\"]', '水果類', '自動生成: 紅寶石洋香瓜 (僅台灣資料庫)', NULL, '紅寶石洋香瓜');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1141', '[\"紅心芭樂\",\"番石榴\",\"芭樂\",\"拔仔\",\"扒仔\",\"朳仔\",\"那拔仔\",\"藍拔\"]', '水果類', '自動生成: 紅心芭樂 (僅台灣資料庫)', NULL, '紅心芭樂');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1142', '[\"紅扁豆仁\"]', '豆類', '自動生成: 紅扁豆仁 (僅台灣資料庫)', NULL, '紅扁豆仁');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1143', '[\"紅柑\",\"美人(女)柑\",\"明尼吉柚\",\"葡萄蜜柑\",\"迷你葡萄柚\"]', '水果類', '自動生成: 紅柑 (僅台灣資料庫)', NULL, '紅柑');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1144', '[\"紅梗珍珠菜\",\"角菜\",\"香芹(甜)菜\",\"山芹菜\",\"甜菜\",\"乳白艾\",\"香甜菜\",\"納艾香\"]', '蔬菜類', '自動生成: 紅梗珍珠菜 (僅台灣資料庫)', NULL, '紅梗珍珠菜');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1145', '[\"紅棗(乾)\",\"紅棗\",\"大棗\",\"棗仔\"]', '水果類', '自動生成: 紅棗(乾) (僅台灣資料庫)', NULL, '紅棗(乾)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1146', '[\"紅毛丹\",\"韶子\",\"毛龍眼\",\"毛荔枝\"]', '水果類', '自動生成: 紅毛丹 (僅台灣資料庫)', NULL, '紅毛丹');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1147', '[\"紅毛苔\",\"海發菜\",\"海髮菜\",\"頭髮菜\",\"紅毛菜\"]', '藻類', '自動生成: 紅毛苔 (僅台灣資料庫)', NULL, '紅毛苔');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1148', '[\"紅海參\"]', '魚貝類', '自動生成: 紅海參 (僅台灣資料庫)', NULL, '紅海參');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1149', '[\"紅甘蔗汁\",\"甘蔗汁、高貴蔗汁、果蔗汁、干蔗汁、薯蔗汁、竹蔗汁\"]', '水果類', '自動生成: 紅甘蔗汁 (僅台灣資料庫)', NULL, '紅甘蔗汁');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1150', '[\"紅甘蔗汁(有機,2023年取樣)\",\"紅甘蔗汁\",\"甘蔗汁、高貴蔗汁、果蔗汁、干蔗汁、薯蔗汁、竹蔗汁\"]', '水果類', '自動生成: 紅甘蔗汁(有機,2023年取樣) (僅台灣資料庫)', NULL, '紅甘蔗汁(有機,2023年取樣)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1152', '[\"紅皮蕉(2004年取樣)\",\"紅皮蕉\",\"香蕉\",\"芎蕉\",\"弓蕉\",\"甘蕉\",\"蘋果蕉\"]', '水果類', '自動生成: 紅皮蕉(2004年取樣) (僅台灣資料庫)', NULL, '紅皮蕉(2004年取樣)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1153', '[\"紅皮蕉(2012年取樣)\",\"紅皮蕉\",\"香蕉\",\"芎蕉\",\"弓蕉\",\"甘蕉\",\"蘋果蕉\"]', '水果類', '自動生成: 紅皮蕉(2012年取樣) (僅台灣資料庫)', NULL, '紅皮蕉(2012年取樣)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1156', '[\"紅肉李(大)\",\"紅肉李\",\"李子\"]', '水果類', '自動生成: 紅肉李(大) (僅台灣資料庫)', NULL, '紅肉李(大)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1157', '[\"紅肉李(小)\",\"紅肉李\",\"李子\"]', '水果類', '自動生成: 紅肉李(小) (僅台灣資料庫)', NULL, '紅肉李(小)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1158', '[\"紅肉甘藷\",\"甘薯\",\"番薯\",\"甜薯\",\"地瓜\",\"田薯\",\"土薯\"]', '澱粉類', '自動生成: 紅肉甘藷 (僅台灣資料庫)', NULL, '紅肉甘藷');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1162', '[\"紅花籽油\"]', '油脂類', '自動生成: 紅花籽油 (僅台灣資料庫)', NULL, '紅花籽油');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1167', '[\"紅莧菜\",\"紅莧\",\"虎菜\",\"紅虎莧\",\"赤莧\",\"紅杏(荇)菜\",\"赤杏菜\",\"紫杏(莧)菜\"]', '蔬菜類', '自動生成: 紅莧菜 (僅台灣資料庫)', NULL, '紅莧菜');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1168', '[\"紅葉萵苣(荷蘭種）\",\"彩葉萵苣\",\"彩色媚仔菜\",\"紅色萵苣菜\",\"紅萵仔菜\"]', '蔬菜類', '自動生成: 紅葉萵苣(荷蘭種） (僅台灣資料庫)', NULL, '紅葉萵苣(荷蘭種）');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1170', '[\"紅蔥頭\",\"油蔥頭\",\"珠蔥頭\",\"分蔥頭\",\"大頭蔥頭\",\"四季蔥頭\"]', '蔬菜類', '自動生成: 紅蔥頭 (僅台灣資料庫)', NULL, '紅蔥頭');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1171', '[\"紅藜麥\"]', '穀物類', '自動生成: 紅藜麥 (僅台灣資料庫)', NULL, '紅藜麥');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1174', '[\"紅蟳\",\"青蟳(蟹)(交配後卵巢成熟雌蟹)\",\"菜蟳\"]', '魚貝類', '自動生成: 紅蟳 (僅台灣資料庫)', NULL, '紅蟳');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1175', '[\"紅豆\",\"小豆\",\"赤小豆\",\"赤豆\",\"通常小豆\",\"小紅豆\",\"紅小豆\"]', '豆類', '自動生成: 紅豆 (僅台灣資料庫)', NULL, '紅豆');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1176', '[\"紅豆土司\"]', '糕餅點心類', '自動生成: 紅豆土司 (僅台灣資料庫)', NULL, '紅豆土司');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1178', '[\"紅豆球\"]', '糕餅點心類', '自動生成: 紅豆球 (僅台灣資料庫)', NULL, '紅豆球');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1180', '[\"紅辣椒平均值\",\"辣椒\",\"番椒\",\"番仔薑\",\"牛角辣椒\",\"羊角辣椒\",\"長辣(番)椒\",\"紅辣椒\",\"臘椒\"]', '蔬菜類', '自動生成: 紅辣椒平均值 (僅台灣資料庫)', NULL, '紅辣椒平均值');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1181', '[\"紅辣椒油\"]', '調味料及香辛料類', '自動生成: 紅辣椒油 (僅台灣資料庫)', NULL, '紅辣椒油');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1184', '[\"紅雲豆(大紅豆)\",\"紅雲豆\",\"紅菜豆\",\"大紅豆\"]', '豆類', '自動生成: 紅雲豆(大紅豆) (僅台灣資料庫)', NULL, '紅雲豆(大紅豆)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1187', '[\"紅鳳菜\",\"紅蓊菜\",\"紅菜\",\"紅葉\",\"紫背天葵\",\"雙色三七草\",\"天青地紅\",\"地黃菜\",\"腳目草\"]', '蔬菜類', '自動生成: 紅鳳菜 (僅台灣資料庫)', NULL, '紅鳳菜');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1188', '[\"紅麴醬\"]', '調味料及香辛料類', '自動生成: 紅麴醬 (僅台灣資料庫)', NULL, '紅麴醬');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1189', '[\"紅麵線\"]', '加工調理食品及其他類', '自動生成: 紅麵線 (僅台灣資料庫)', NULL, '紅麵線');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1190', '[\"紅龍果(白肉)\",\"紅龍果\",\"火龍果\",\"仙蜜果\"]', '水果類', '自動生成: 紅龍果(白肉) (僅台灣資料庫)', NULL, '紅龍果(白肉)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1191', '[\"紅龍果(紅肉)\",\"紅龍果\",\"火龍果\",\"仙蜜果\"]', '水果類', '自動生成: 紅龍果(紅肉) (僅台灣資料庫)', NULL, '紅龍果(紅肉)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1193', '[\"素肉\"]', '加工調理食品及其他類', '自動生成: 素肉 (僅台灣資料庫)', NULL, '素肉');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1194', '[\"素肉燥\"]', '調味料及香辛料類', '自動生成: 素肉燥 (僅台灣資料庫)', NULL, '素肉燥');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1195', '[\"素食炸醬\"]', '調味料及香辛料類', '自動生成: 素食炸醬 (僅台灣資料庫)', NULL, '素食炸醬');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1197', '[\"素食高湯\"]', '調味料及香辛料類', '自動生成: 素食高湯 (僅台灣資料庫)', NULL, '素食高湯');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1198', '[\"紫山藥\",\"山薯\",\"田薯\",\"薯蕷\",\"長薯\",\"血薯;淮山(加工後)\"]', '澱粉類', '自動生成: 紫山藥 (僅台灣資料庫)', NULL, '紫山藥');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1201', '[\"紫甘藍芽\"]', '蔬菜類', '自動生成: 紫甘藍芽 (僅台灣資料庫)', NULL, '紫甘藍芽');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1203', '[\"紫色甘藍\",\"紫甘藍\",\"紫色高麗菜\",\"紅色高麗菜\",\"紅玻璃菜\",\"紅玉菜\"]', '蔬菜類', '自動生成: 紫色甘藍 (僅台灣資料庫)', NULL, '紫色甘藍');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1205', '[\"紫菜\",\"海苔\"]', '藻類', '自動生成: 紫菜 (僅台灣資料庫)', NULL, '紫菜');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1206', '[\"紫蘇\",\"蘇草\",\"紅(赤/綠/青)紫蘇\",\"桂荏\"]', '蔬菜類', '自動生成: 紫蘇 (僅台灣資料庫)', NULL, '紫蘇');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1208', '[\"結球白菜平均值\",\"大白菜\",\"黃芽菜\",\"包心白菜\",\"卷心白菜\",\"山東白菜\",\"結球白菜\"]', '蔬菜類', '自動生成: 結球白菜平均值 (僅台灣資料庫)', NULL, '結球白菜平均值');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1209', '[\"結球萵苣\",\"球萵苣\",\"包心萵苣\",\"捲心萵苣\",\"生菜\",\"包心媚仔菜\",\"結球妹仔菜\"]', '蔬菜類', '自動生成: 結球萵苣 (僅台灣資料庫)', NULL, '結球萵苣');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1210', '[\"絲瓜\",\"菜瓜\",\"布瓜\",\"蠻瓜\",\"天絲瓜\",\"水瓜\",\"天羅\",\"天絡\",\"仙人拐\",\"魚鰦\"]', '蔬菜類', '自動生成: 絲瓜 (僅台灣資料庫)', NULL, '絲瓜');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1211', '[\"絲瓜花\",\"菜瓜花\"]', '蔬菜類', '自動生成: 絲瓜花 (僅台灣資料庫)', NULL, '絲瓜花');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1212', '[\"綜合堅果穀物沖泡包\"]', '加工調理食品及其他類', '自動生成: 綜合堅果穀物沖泡包 (僅台灣資料庫)', NULL, '綜合堅果穀物沖泡包');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1213', '[\"綠櫛瓜\"]', '蔬菜類', '自動生成: 綠櫛瓜 (僅台灣資料庫)', NULL, '綠櫛瓜');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1214', '[\"綠殼菜蛤\",\"孔雀蛤\",\"淡菜\",\"翡翠貽貝\"]', '魚貝類', '自動生成: 綠殼菜蛤 (僅台灣資料庫)', NULL, '綠殼菜蛤');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1215', '[\"綠殼菜蛤干\",\"孔雀蛤干\",\"淡菜干\",\"翡翠貽貝干\"]', '魚貝類', '自動生成: 綠殼菜蛤干 (僅台灣資料庫)', NULL, '綠殼菜蛤干');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1217', '[\"綠皮蛇瓜\",\"蛇王瓜\",\"毛烏瓜\"]', '蔬菜類', '自動生成: 綠皮蛇瓜 (僅台灣資料庫)', NULL, '綠皮蛇瓜');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1223', '[\"綠蘆筍\",\"野天門冬\",\"松葉土當歸\",\"石刁柏\",\"龍鬚菜\"]', '蔬菜類', '自動生成: 綠蘆筍 (僅台灣資料庫)', NULL, '綠蘆筍');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1224', '[\"綠蘆筍(短型)\",\"綠蘆筍\",\"野天門冬\",\"松葉土當歸\",\"石刁柏\",\"龍鬚菜\"]', '蔬菜類', '自動生成: 綠蘆筍(短型) (僅台灣資料庫)', NULL, '綠蘆筍(短型)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1225', '[\"綠蘆筍(細短型)\",\"綠蘆筍\",\"野天門冬\",\"松葉土當歸\",\"石刁柏\",\"龍鬚菜\"]', '蔬菜類', '自動生成: 綠蘆筍(細短型) (僅台灣資料庫)', NULL, '綠蘆筍(細短型)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1226', '[\"綠蘆筍平均值\",\"野天門冬\",\"松葉土當歸\",\"石刁柏\",\"龍鬚菜\"]', '蔬菜類', '自動生成: 綠蘆筍平均值 (僅台灣資料庫)', NULL, '綠蘆筍平均值');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1234', '[\"維生素強化飲料(綜合)\",\"維生素強化飲料\"]', '飲料類', '自動生成: 維生素強化飲料(綜合) (僅台灣資料庫)', NULL, '維生素強化飲料(綜合)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1235', '[\"維生素強化飲料(維生素C)\",\"維生素強化飲料\"]', '飲料類', '自動生成: 維生素強化飲料(維生素C) (僅台灣資料庫)', NULL, '維生素強化飲料(維生素C)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1239', '[\"綿羊腹脅肉火鍋片\",\"五花肉火鍋片\"]', '肉類', '自動生成: 綿羊腹脅肉火鍋片 (僅台灣資料庫)', NULL, '綿羊腹脅肉火鍋片');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1240', '[\"羅勒片\"]', '調味料及香辛料類', '自動生成: 羅勒片 (僅台灣資料庫)', NULL, '羅勒片');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1242', '[\"羊乳片\"]', '糕餅點心類', '自動生成: 羊乳片 (僅台灣資料庫)', NULL, '羊乳片');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1243', '[\"羊羹\"]', '糕餅點心類', '自動生成: 羊羹 (僅台灣資料庫)', NULL, '羊羹');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1253', '[\"美濃瓜\",\"甜瓜\",\"甘瓜\",\"果瓜\",\"香瓜\",\"梨仔瓜\",\"澎湖瓜\"]', '水果類', '自動生成: 美濃瓜 (僅台灣資料庫)', NULL, '美濃瓜');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1254', '[\"義大利茼蒿\"]', '蔬菜類', '自動生成: 義大利茼蒿 (僅台灣資料庫)', NULL, '義大利茼蒿');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1256', '[\"羽衣甘藍(有機)\",\"羽衣甘藍\"]', '蔬菜類', '自動生成: 羽衣甘藍(有機) (僅台灣資料庫)', NULL, '羽衣甘藍(有機)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1257', '[\"翅腿(肉雞)\",\"翅腿\",\"小雞腿\"]', '肉類', '自動生成: 翅腿(肉雞) (僅台灣資料庫)', NULL, '翅腿(肉雞)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1258', '[\"翠玉白菜\",\"天津白菜\",\"直筒白菜\",\"長筒白菜\",\"竹筒白菜\"]', '蔬菜類', '自動生成: 翠玉白菜 (僅台灣資料庫)', NULL, '翠玉白菜');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1261', '[\"翡翠李\",\"李子\"]', '水果類', '自動生成: 翡翠李 (僅台灣資料庫)', NULL, '翡翠李');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1262', '[\"翻車魨腹肉\",\"翻車魚\",\"蜇魴\",\"蜇魚\",\"海蟲(澎湖)\",\"曼波(成功)\"]', '魚貝類', '自動生成: 翻車魨腹肉 (僅台灣資料庫)', NULL, '翻車魨腹肉');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1264', '[\"翼豆\",\"四角豆、翅豆、羊角豆、 楊桃豆、四稜豆\"]', '豆類', '自動生成: 翼豆 (僅台灣資料庫)', NULL, '翼豆');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1268', '[\"肉圓\",\"肉丸\"]', '加工調理食品及其他類', '自動生成: 肉圓 (僅台灣資料庫)', NULL, '肉圓');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1269', '[\"肉桂粉\"]', '調味料及香辛料類', '自動生成: 肉桂粉 (僅台灣資料庫)', NULL, '肉桂粉');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1270', '[\"肉燥\"]', '調味料及香辛料類', '自動生成: 肉燥 (僅台灣資料庫)', NULL, '肉燥');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1271', '[\"肉粽\"]', '加工調理食品及其他類', '自動生成: 肉粽 (僅台灣資料庫)', NULL, '肉粽');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1272', '[\"肉羹\"]', '加工調理食品及其他類', '自動生成: 肉羹 (僅台灣資料庫)', NULL, '肉羹');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1273', '[\"肉雞\",\"飼料雞\"]', '肉類', '自動生成: 肉雞 (僅台灣資料庫)', NULL, '肉雞');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1280', '[\"胡瓜\",\"大黃瓜\",\"刺瓜\",\"黃瓜\",\"生瓜\",\"王瓜\",\"花瓜\",\"黑瓜\",\"大瓜\"]', '蔬菜類', '自動生成: 胡瓜 (僅台灣資料庫)', NULL, '胡瓜');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1284', '[\"脆桃平均值\",\"桃子\",\"甜桃\"]', '水果類', '自動生成: 脆桃平均值 (僅台灣資料庫)', NULL, '脆桃平均值');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1285', '[\"脫水甘藍\"]', '蔬菜類', '自動生成: 脫水甘藍 (僅台灣資料庫)', NULL, '脫水甘藍');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1287', '[\"脫脂保久稀釋發酵乳\",\"乳酸飲料\"]', '乳品類', '自動生成: 脫脂保久稀釋發酵乳 (僅台灣資料庫)', NULL, '脫脂保久稀釋發酵乳');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1288', '[\"脫脂凝態發酵乳(纖維強化)\",\"脫脂凝態發酵乳\",\"優格\"]', '乳品類', '自動生成: 脫脂凝態發酵乳(纖維強化) (僅台灣資料庫)', NULL, '脫脂凝態發酵乳(纖維強化)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1289', '[\"脫脂奶粉\",\"乳粉\"]', '乳品類', '自動生成: 脫脂奶粉 (僅台灣資料庫)', NULL, '脫脂奶粉');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1290', '[\"脫脂奶粉(即溶)\",\"脫脂奶粉\",\"乳粉\"]', '乳品類', '自動生成: 脫脂奶粉(即溶) (僅台灣資料庫)', NULL, '脫脂奶粉(即溶)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1291', '[\"脫脂強化奶粉(抗氧化)\",\"脫脂強化奶粉\",\"乳粉\"]', '乳品類', '自動生成: 脫脂強化奶粉(抗氧化) (僅台灣資料庫)', NULL, '脫脂強化奶粉(抗氧化)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1292', '[\"脫脂強化奶粉(鈣&維生素A強化)\",\"脫脂強化奶粉\",\"乳粉\"]', '乳品類', '自動生成: 脫脂強化奶粉(鈣&維生素A強化) (僅台灣資料庫)', NULL, '脫脂強化奶粉(鈣&維生素A強化)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1293', '[\"脫脂強化奶粉(鈣&維生素C,E強化)\",\"脫脂強化奶粉\",\"乳粉\"]', '乳品類', '自動生成: 脫脂強化奶粉(鈣&維生素C,E強化) (僅台灣資料庫)', NULL, '脫脂強化奶粉(鈣&維生素C,E強化)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1294', '[\"脫脂強化奶粉(鈣&鐵強化)\",\"脫脂強化奶粉\",\"乳粉\"]', '乳品類', '自動生成: 脫脂強化奶粉(鈣&鐵強化) (僅台灣資料庫)', NULL, '脫脂強化奶粉(鈣&鐵強化)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1295', '[\"脫脂強化鮮乳(寡醣強化)\",\"脫脂強化鮮乳\",\"牛乳\",\"牛奶\"]', '乳品類', '自動生成: 脫脂強化鮮乳(寡醣強化) (僅台灣資料庫)', NULL, '脫脂強化鮮乳(寡醣強化)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1296', '[\"脫脂強化鮮乳(鈣強化)\",\"脫脂強化鮮乳\",\"牛乳\",\"牛奶\"]', '乳品類', '自動生成: 脫脂強化鮮乳(鈣強化) (僅台灣資料庫)', NULL, '脫脂強化鮮乳(鈣強化)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1297', '[\"脫脂強化鮮乳(鐵強化)\",\"脫脂強化鮮乳\",\"牛乳\",\"牛奶\"]', '乳品類', '自動生成: 脫脂強化鮮乳(鐵強化) (僅台灣資料庫)', NULL, '脫脂強化鮮乳(鐵強化)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1298', '[\"脫脂濃稠發酵乳\",\"優酪乳\"]', '乳品類', '自動生成: 脫脂濃稠發酵乳 (僅台灣資料庫)', NULL, '脫脂濃稠發酵乳');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1299', '[\"脫脂濃稠發酵乳(低熱量)\",\"脫脂濃稠發酵乳\",\"優酪乳\"]', '乳品類', '自動生成: 脫脂濃稠發酵乳(低熱量) (僅台灣資料庫)', NULL, '脫脂濃稠發酵乳(低熱量)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1302', '[\"脫脂稀釋發酵乳\",\"活菌乳酸飲料\"]', '乳品類', '自動生成: 脫脂稀釋發酵乳 (僅台灣資料庫)', NULL, '脫脂稀釋發酵乳');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1303', '[\"脫脂稀釋發酵乳(鈣強化)\",\"脫脂稀釋發酵乳\",\"活菌乳酸飲料\"]', '乳品類', '自動生成: 脫脂稀釋發酵乳(鈣強化) (僅台灣資料庫)', NULL, '脫脂稀釋發酵乳(鈣強化)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1304', '[\"腓力牛排\",\"菲力牛排\",\"牛柳\",\"小里肌\",\"腰內肉\",\"去脂腰里肌肉\",\"全修清去膜腰裡脊肉\"]', '肉類', '自動生成: 腓力牛排 (僅台灣資料庫)', NULL, '腓力牛排');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1306', '[\"膽肝\",\"鹹豬肝\",\"粉肝\",\"柴肝\"]', '加工調理食品及其他類', '自動生成: 膽肝 (僅台灣資料庫)', NULL, '膽肝');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1307', '[\"臘肉(五花肉)\",\"臘肉\"]', '加工調理食品及其他類', '自動生成: 臘肉(五花肉) (僅台灣資料庫)', NULL, '臘肉(五花肉)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1308', '[\"臘肉(腿肉)\",\"臘肉\"]', '加工調理食品及其他類', '自動生成: 臘肉(腿肉) (僅台灣資料庫)', NULL, '臘肉(腿肉)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1309', '[\"臺灣馬加鰆\",\"白北\",\"白腹仔\"]', '魚貝類', '自動生成: 臺灣馬加鰆 (僅台灣資料庫)', NULL, '臺灣馬加鰆');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1310', '[\"舞菇\",\"舞茸\",\"灰樹花\",\"葉多孔菌\",\"栗子蘑\",\"千佛菌\",\"蓮花菌\"]', '菇類', '自動生成: 舞菇 (僅台灣資料庫)', NULL, '舞菇');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1311', '[\"芋仔餅\"]', '糕餅點心類', '自動生成: 芋仔餅 (僅台灣資料庫)', NULL, '芋仔餅');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1312', '[\"芋圓\"]', '加工調理食品及其他類', '自動生成: 芋圓 (僅台灣資料庫)', NULL, '芋圓');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1313', '[\"芋心甘藷\",\"甘薯\",\"番薯\",\"甜薯\",\"地瓜\",\"田薯\",\"土薯\",\"紅薯\",\"紫心甘薯\",\"芋頭(仔)番薯\"]', '澱粉類', '自動生成: 芋心甘藷 (僅台灣資料庫)', NULL, '芋心甘藷');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1314', '[\"芋莖\",\"芋拐\",\"芋橫\",\"芋葉梗\"]', '蔬菜類', '自動生成: 芋莖 (僅台灣資料庫)', NULL, '芋莖');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1315', '[\"芋頭\",\"芋艿\",\"芋乃\",\"芋仔\",\"青芋\",\"土芝\"]', '澱粉類', '自動生成: 芋頭 (僅台灣資料庫)', NULL, '芋頭');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1316', '[\"芋頭粉\"]', '澱粉類', '自動生成: 芋頭粉 (僅台灣資料庫)', NULL, '芋頭粉');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1317', '[\"芋頭饅頭\"]', '加工調理食品及其他類', '自動生成: 芋頭饅頭 (僅台灣資料庫)', NULL, '芋頭饅頭');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1323', '[\"芡實\",\"雞頭米\",\"雞頭\"]', '堅果及種子類', '自動生成: 芡實 (僅台灣資料庫)', NULL, '芡實');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1324', '[\"芥花油\",\"芥花籽油\",\"菜籽油\"]', '油脂類', '自動生成: 芥花油 (僅台灣資料庫)', NULL, '芥花油');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1325', '[\"芥菜\",\"刈菜\",\"大菜\",\"芥葉菜\",\"雞冠菜\",\"孤腰菜\"]', '蔬菜類', '自動生成: 芥菜 (僅台灣資料庫)', NULL, '芥菜');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1326', '[\"芥菜平均值\",\"刈菜\",\"大菜\",\"芥葉菜\",\"雞冠菜\",\"孤腰菜\"]', '蔬菜類', '自動生成: 芥菜平均值 (僅台灣資料庫)', NULL, '芥菜平均值');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1327', '[\"芥藍芽\",\"菜嬰\",\"格藍菜嬰\"]', '蔬菜類', '自動生成: 芥藍芽 (僅台灣資料庫)', NULL, '芥藍芽');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1328', '[\"芥藍菜\",\"芥蘭菜\",\"格藍菜\",\"綠葉甘藍\",\"佛光菜\",\"隔暝仔菜\"]', '蔬菜類', '自動生成: 芥藍菜 (僅台灣資料庫)', NULL, '芥藍菜');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1329', '[\"芫荽\",\"香菜\",\"香荽\",\"胡荽\",\"蒝荽\",\"芫蓑\",\"松鬚菜\"]', '蔬菜類', '自動生成: 芫荽 (僅台灣資料庫)', NULL, '芫荽');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1330', '[\"芭樂平均值(白肉)\",\"芭樂平均值\",\"番石榴\",\"芭樂\",\"拔仔\",\"扒仔\",\"朳仔\",\"那拔仔\",\"藍拔\"]', '水果類', '自動生成: 芭樂平均值(白肉) (僅台灣資料庫)', NULL, '芭樂平均值(白肉)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1331', '[\"芭樂果乾\"]', '糕餅點心類', '自動生成: 芭樂果乾 (僅台灣資料庫)', NULL, '芭樂果乾');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1332', '[\"芭樂汁(非原汁)\",\"芭樂汁\"]', '飲料類', '自動生成: 芭樂汁(非原汁) (僅台灣資料庫)', NULL, '芭樂汁(非原汁)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1334', '[\"花捲\"]', '加工調理食品及其他類', '自動生成: 花捲 (僅台灣資料庫)', NULL, '花捲');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1335', '[\"花椒粉\"]', '調味料及香辛料類', '自動生成: 花椒粉 (僅台灣資料庫)', NULL, '花椒粉');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1336', '[\"花椒粒\"]', '調味料及香辛料類', '自動生成: 花椒粒 (僅台灣資料庫)', NULL, '花椒粒');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1339', '[\"花瓜罐頭\"]', '加工調理食品及其他類', '自動生成: 花瓜罐頭 (僅台灣資料庫)', NULL, '花瓜罐頭');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1348', '[\"花胡瓜(有機)\",\"花胡瓜\",\"小黃瓜\",\"花瓜\",\"小胡瓜\",\"小刺瓜\"]', '蔬菜類', '自動生成: 花胡瓜(有機) (僅台灣資料庫)', NULL, '花胡瓜(有機)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1349', '[\"花腹鯖\",\"花飛\",\"青輝\",\"飛威/青飛/胡麻鯖\"]', '魚貝類', '自動生成: 花腹鯖 (僅台灣資料庫)', NULL, '花腹鯖');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1350', '[\"花菇\",\"冬(北/花/厚/毛)菇\",\"椎茸\",\"香蕈(信/椹)\",\"合蕈\"]', '菇類', '自動生成: 花菇 (僅台灣資料庫)', NULL, '花菇');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1351', '[\"花蒲瓜(圓形)\",\"花蒲瓜\",\"扁蒲\",\"蒲仔\",\"瓠瓜\",\"匏瓜\",\"葫蘆瓜\",\"瓢簞\",\"天瓜\",\"龍蛋瓜\",\"蒲(葫/壺)蘆\"]', '蔬菜類', '自動生成: 花蒲瓜(圓形) (僅台灣資料庫)', NULL, '花蒲瓜(圓形)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1352', '[\"花豆\",\"紅花豆\",\"紅(赤)花菜豆\",\"花仔(阿/柳)豆\"]', '豆類', '自動生成: 花豆 (僅台灣資料庫)', NULL, '花豆');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1355', '[\"花身鯻\",\"花身仔\",\"斑吾\",\"雞仔魚\",\"三抓仔\",\"邦五/斑午/兵舅仔/斑龜仔(澎湖)\"]', '魚貝類', '自動生成: 花身鯻 (僅台灣資料庫)', NULL, '花身鯻');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1359', '[\"苜蓿芽\",\"苜蓿嬰\"]', '蔬菜類', '自動生成: 苜蓿芽 (僅台灣資料庫)', NULL, '苜蓿芽');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1360', '[\"苦瓜(白皮)\",\"苦瓜\",\"錦荔枝\",\"癩蒲萄\",\"涼瓜\",\"癩瓜\",\"紅姑娘\"]', '蔬菜類', '自動生成: 苦瓜(白皮) (僅台灣資料庫)', NULL, '苦瓜(白皮)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1361', '[\"苦瓜(青皮)\",\"苦瓜\",\"錦荔枝\",\"癩蒲萄\",\"涼瓜\",\"癩瓜\",\"紅姑娘\"]', '蔬菜類', '自動生成: 苦瓜(青皮) (僅台灣資料庫)', NULL, '苦瓜(青皮)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1363', '[\"茂谷柑\",\"柑\"]', '水果類', '自動生成: 茂谷柑 (僅台灣資料庫)', NULL, '茂谷柑');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1364', '[\"范氏副葉鰺\",\"甘仔魚\"]', '魚貝類', '自動生成: 范氏副葉鰺 (僅台灣資料庫)', NULL, '范氏副葉鰺');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1368', '[\"茭白筍\",\"茭白\",\"茭筍\",\"茭草\",\"水筍\",\"腳白筍\",\"加白筍\",\"菰\",\"菰菜\",\"菰筍\",\"菰蔣\"]', '蔬菜類', '自動生成: 茭白筍 (僅台灣資料庫)', NULL, '茭白筍');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1369', '[\"茴香\",\"蘹香\",\"小茴香\",\"茴香子\",\"臭蒝荽\",\"客人蒝荽\",\"香絲菜\",\"茴香八角珠\",\"蒝荽\"]', '蔬菜類', '自動生成: 茴香 (僅台灣資料庫)', NULL, '茴香');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1376', '[\"茼蒿\",\"茼蒿菜\",\"春菊\",\"打某(妻)菜\",\"苳蒿菜\",\"花冠菊\",\"艾菜\",\"蓬蒿\",\"菊蒿菜\",\"菊花菜\",\"實盡菜\"]', '蔬菜類', '自動生成: 茼蒿 (僅台灣資料庫)', NULL, '茼蒿');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1378', '[\"草石蠶\",\"甘露兒\",\"甘露菜\",\"寶塔菜\",\"地蠶\",\"螺獅菜\",\"土蛹(坊間誤稱為冬蟲夏草)\"]', '蔬菜類', '自動生成: 草石蠶 (僅台灣資料庫)', NULL, '草石蠶');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1381', '[\"草菇\",\"蘭花菇\",\"美味草菇\",\"包腳菇\",\"中國蘑菇\",\"稈(麻/貢)菇\",\"南華菇\",\"家生菇(小包腳菇)\"]', '菇類', '自動生成: 草菇 (僅台灣資料庫)', NULL, '草菇');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1382', '[\"草菇罐頭\",\"蘭花菇\",\"美味草菇\",\"包腳菇\",\"中國蘑菇\",\"稈(麻/貢)菇\",\"南華菇\",\"家生菇(小包腳菇)\"]', '加工調理食品及其他類', '自動生成: 草菇罐頭 (僅台灣資料庫)', NULL, '草菇罐頭');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1386', '[\"荔枝平均值\",\"丹荔\",\"荔錦\",\"麗枝\",\"離枝\"]', '水果類', '自動生成: 荔枝平均值 (僅台灣資料庫)', NULL, '荔枝平均值');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1387', '[\"荳蔻粉\"]', '調味料及香辛料類', '自動生成: 荳蔻粉 (僅台灣資料庫)', NULL, '荳蔻粉');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1390', '[\"荷葉白菜\",\"白菜\",\"青菜\",\"散葉白菜\",\"無心菜\",\"菘\",\"不結球白菜\"]', '蔬菜類', '自動生成: 荷葉白菜 (僅台灣資料庫)', NULL, '荷葉白菜');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1391', '[\"荷蘭豆菜心\"]', '蔬菜類', '自動生成: 荷蘭豆菜心 (僅台灣資料庫)', NULL, '荷蘭豆菜心');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1392', '[\"荸薺\",\"水栗\",\"地栗\",\"馬蹄\",\"馬薯\",\"烏芋\",\"水燈心草\",\"海蔥仔\",\"水蔥仔\"]', '澱粉類', '自動生成: 荸薺 (僅台灣資料庫)', NULL, '荸薺');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1393', '[\"荸薺粉\",\"水栗粉\",\"地栗粉\",\"馬蹄粉\",\"馬薯粉\",\"烏芋粉\",\"水燈心草粉\",\"海蔥仔粉\",\"水蔥仔粉\"]', '澱粉類', '自動生成: 荸薺粉 (僅台灣資料庫)', NULL, '荸薺粉');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1394', '[\"莫三比克口孵非鯽\",\"非洲仔\",\"南洋鯽仔\",\"在來吳郭魚\",\"吳郭魚/鹹水吳郭(澎湖)\"]', '魚貝類', '自動生成: 莫三比克口孵非鯽 (僅台灣資料庫)', NULL, '莫三比克口孵非鯽');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1400', '[\"菠蘿蜜\",\"天波羅\",\"樹波羅\"]', '水果類', '自動生成: 菠蘿蜜 (僅台灣資料庫)', NULL, '菠蘿蜜');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1403', '[\"華翠菇\",\"滿天星菇\",\"黃色金針菇(絨柄金錢菇)\"]', '菇類', '自動生成: 華翠菇 (僅台灣資料庫)', NULL, '華翠菇');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1404', '[\"菱角(熟)\",\"菱角\",\"菱\",\"芰\",\"龍角\",\"羊家\",\"紅菱\"]', '澱粉類', '自動生成: 菱角(熟) (僅台灣資料庫)', NULL, '菱角(熟)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1405', '[\"菱角(生)\",\"菱角\",\"菱\",\"芰\",\"龍角\",\"羊家\",\"紅菱\"]', '澱粉類', '自動生成: 菱角(生) (僅台灣資料庫)', NULL, '菱角(生)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1406', '[\"菱角仁(生)\",\"菱角仁\"]', '澱粉類', '自動生成: 菱角仁(生) (僅台灣資料庫)', NULL, '菱角仁(生)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1408', '[\"菲律賓簾蛤\",\"菲律賓蛤仔\",\"海瓜子(仔)蛤\",\"花蛤\"]', '魚貝類', '自動生成: 菲律賓簾蛤 (僅台灣資料庫)', NULL, '菲律賓簾蛤');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1409', '[\"菾菜\",\"葉用甜菜\",\"莙薘菜\",\"牛皮菜\",\"豬乸菜\"]', '蔬菜類', '自動生成: 菾菜 (僅台灣資料庫)', NULL, '菾菜');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1412', '[\"萊豆仁(去膜)\",\"萊豆仁\",\"皇帝豆\",\"皇格豆\",\"白扁豆\",\"觀音豆\",\"雪豆\",\"大馬萊豆\",\"細綿豆\"]', '豆類', '自動生成: 萊豆仁(去膜) (僅台灣資料庫)', NULL, '萊豆仁(去膜)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1413', '[\"萊豆仁(帶膜)\",\"萊豆仁\",\"皇帝豆\",\"皇格豆\",\"白扁豆\",\"觀音豆\",\"雪豆\",\"大馬萊豆\",\"細綿豆\"]', '豆類', '自動生成: 萊豆仁(帶膜) (僅台灣資料庫)', NULL, '萊豆仁(帶膜)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1414', '[\"落葵\",\"皇宮菜\",\"蟳菜\",\"胭(臙)脂菜\",\"紅落葵\",\"潺菜\",\"蔠菜\",\"藤葵\",\"藤菜\",\"天葵\",\"御菜\",\"牛皮凍\"]', '蔬菜類', '自動生成: 落葵 (僅台灣資料庫)', NULL, '落葵');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1415', '[\"葉唇笛鯛\",\"厚唇仔\",\"紅魚\"]', '魚貝類', '自動生成: 葉唇笛鯛 (僅台灣資料庫)', NULL, '葉唇笛鯛');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1422', '[\"葫蘆瓜\",\"扁蒲\",\"蒲仔\",\"瓠瓜\",\"匏瓜\",\"瓢簞\",\"天瓜\",\"龍蛋瓜\",\"蒲(葫/壺)蘆\"]', '蔬菜類', '自動生成: 葫蘆瓜 (僅台灣資料庫)', NULL, '葫蘆瓜');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1423', '[\"葵扇白菜\",\"白菜\",\"青菜\",\"散葉白菜\",\"無心菜\",\"菘\",\"不結球白菜\",\"江戶(門)白菜\",\"黑葉白菜\",\"扇子白菜\",\"黑芥菜\",\"排菜\"]', '蔬菜類', '自動生成: 葵扇白菜 (僅台灣資料庫)', NULL, '葵扇白菜');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1424', '[\"葵花籽油\"]', '油脂類', '自動生成: 葵花籽油 (僅台灣資料庫)', NULL, '葵花籽油');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1425', '[\"葵花籽油(多種維生素強化)\",\"葵花籽油\"]', '油脂類', '自動生成: 葵花籽油(多種維生素強化) (僅台灣資料庫)', NULL, '葵花籽油(多種維生素強化)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1426', '[\"葵花芽\"]', '蔬菜類', '自動生成: 葵花芽 (僅台灣資料庫)', NULL, '葵花芽');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1427', '[\"蒜味甘扁桃仁\",\"蒜味杏仁果\"]', '加工調理食品及其他類', '自動生成: 蒜味甘扁桃仁 (僅台灣資料庫)', NULL, '蒜味甘扁桃仁');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1428', '[\"蒜味豆豉醬\"]', '調味料及香辛料類', '自動生成: 蒜味豆豉醬 (僅台灣資料庫)', NULL, '蒜味豆豉醬');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1429', '[\"蒜粉\"]', '調味料及香辛料類', '自動生成: 蒜粉 (僅台灣資料庫)', NULL, '蒜粉');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1430', '[\"蒜苗\",\"蒜黃\"]', '蔬菜類', '自動生成: 蒜苗 (僅台灣資料庫)', NULL, '蒜苗');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1431', '[\"蒜蓉醬\"]', '調味料及香辛料類', '自動生成: 蒜蓉醬 (僅台灣資料庫)', NULL, '蒜蓉醬');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1432', '[\"蒜頭酥\"]', '調味料及香辛料類', '自動生成: 蒜頭酥 (僅台灣資料庫)', NULL, '蒜頭酥');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1433', '[\"蒟蒻粉\"]', '澱粉類', '自動生成: 蒟蒻粉 (僅台灣資料庫)', NULL, '蒟蒻粉');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1435', '[\"蒲瓜(圓形)\",\"蒲瓜\",\"扁蒲\",\"蒲仔\",\"瓠瓜\",\"匏瓜\",\"葫蘆瓜\",\"瓢簞\",\"天瓜\",\"龍蛋瓜\",\"蒲(葫/壺)蘆\"]', '蔬菜類', '自動生成: 蒲瓜(圓形) (僅台灣資料庫)', NULL, '蒲瓜(圓形)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1436', '[\"蒲瓜(長形)\",\"蒲瓜\",\"扁蒲\",\"蒲仔\",\"瓠瓜\",\"匏瓜\",\"葫蘆瓜\",\"瓢簞\",\"天瓜\",\"龍蛋瓜\",\"蒲(葫/壺)蘆\"]', '蔬菜類', '自動生成: 蒲瓜(長形) (僅台灣資料庫)', NULL, '蒲瓜(長形)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1437', '[\"蒲瓜平均值\",\"扁蒲\",\"蒲仔\",\"瓠子(瓜/餔)\",\"匏仔(瓜)\",\"葫蘆瓜\",\"瓢簞\",\"天瓜\",\"龍蛋瓜\",\"蒲(葫/壺)蘆\"]', '蔬菜類', '自動生成: 蒲瓜平均值 (僅台灣資料庫)', NULL, '蒲瓜平均值');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1438', '[\"蒸肉粉(五香)\",\"蒸肉粉\"]', '調味料及香辛料類', '自動生成: 蒸肉粉(五香) (僅台灣資料庫)', NULL, '蒸肉粉(五香)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1443', '[\"蓮子\"]', '堅果及種子類', '自動生成: 蓮子 (僅台灣資料庫)', NULL, '蓮子');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1444', '[\"蓮子(乾)\",\"蓮子\"]', '堅果及種子類', '自動生成: 蓮子(乾) (僅台灣資料庫)', NULL, '蓮子(乾)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1446', '[\"蓮藕\",\"蓮根\",\"藕\",\"芙蕖\",\"荷花藕\"]', '澱粉類', '自動生成: 蓮藕 (僅台灣資料庫)', NULL, '蓮藕');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1447', '[\"蓮藕粉\"]', '澱粉類', '自動生成: 蓮藕粉 (僅台灣資料庫)', NULL, '蓮藕粉');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1449', '[\"蓮霧(紅寶石)\",\"蓮霧\",\"璉霧\",\"輦霧\",\"洋蒲桃\",\"水蓊\"]', '水果類', '自動生成: 蓮霧(紅寶石) (僅台灣資料庫)', NULL, '蓮霧(紅寶石)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1450', '[\"蓮霧(黑珍珠)\",\"蓮霧\",\"璉霧\",\"輦霧\",\"洋蒲桃\",\"水蓊\"]', '水果類', '自動生成: 蓮霧(黑珍珠) (僅台灣資料庫)', NULL, '蓮霧(黑珍珠)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1451', '[\"蓮霧(黑金剛)\",\"蓮霧\",\"璉霧\",\"輦霧\",\"洋蒲桃\",\"水蓊\"]', '水果類', '自動生成: 蓮霧(黑金剛) (僅台灣資料庫)', NULL, '蓮霧(黑金剛)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1452', '[\"蓮霧平均值(粉紅色種)\",\"蓮霧平均值\",\"璉霧\",\"輦霧\",\"洋蒲桃\"]', '水果類', '自動生成: 蓮霧平均值(粉紅色種) (僅台灣資料庫)', NULL, '蓮霧平均值(粉紅色種)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1453', '[\"蔓越莓汁(非原汁)\",\"蔓越莓汁\"]', '飲料類', '自動生成: 蔓越莓汁(非原汁) (僅台灣資料庫)', NULL, '蔓越莓汁(非原汁)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1454', '[\"蔘鬚\"]', '蔬菜類', '自動生成: 蔘鬚 (僅台灣資料庫)', NULL, '蔘鬚');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1455', '[\"蔥油餅\"]', '加工調理食品及其他類', '自動生成: 蔥油餅 (僅台灣資料庫)', NULL, '蔥油餅');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1456', '[\"蔥醬\"]', '調味料及香辛料類', '自動生成: 蔥醬 (僅台灣資料庫)', NULL, '蔥醬');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1457', '[\"蕃茄汁(非原汁)\",\"蕃茄汁\"]', '飲料類', '自動生成: 蕃茄汁(非原汁) (僅台灣資料庫)', NULL, '蕃茄汁(非原汁)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1459', '[\"蕃茄醬\"]', '調味料及香辛料類', '自動生成: 蕃茄醬 (僅台灣資料庫)', NULL, '蕃茄醬');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1460', '[\"蕃薯餅\"]', '糕餅點心類', '自動生成: 蕃薯餅 (僅台灣資料庫)', NULL, '蕃薯餅');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1461', '[\"蕎麥(甜蕎)\",\"蕎麥\",\"三角米\"]', '穀物類', '自動生成: 蕎麥(甜蕎) (僅台灣資料庫)', NULL, '蕎麥(甜蕎)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1462', '[\"蕎麥芽\",\"烏麥芽\",\"花蕎芽\",\"荍麥芽\"]', '蔬菜類', '自動生成: 蕎麥芽 (僅台灣資料庫)', NULL, '蕎麥芽');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1463', '[\"蕎麥麵(乾)\",\"蕎麥麵\"]', '加工調理食品及其他類', '自動生成: 蕎麥麵(乾) (僅台灣資料庫)', NULL, '蕎麥麵(乾)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1464', '[\"蕎麥麵(濕)\",\"蕎麥麵\"]', '加工調理食品及其他類', '自動生成: 蕎麥麵(濕) (僅台灣資料庫)', NULL, '蕎麥麵(濕)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1465', '[\"蕹菜(土植)(10月取樣)\",\"蕹菜\",\"空心菜\",\"應菜\",\"壅菜\",\"甕菜\",\"草菜\",\"無心菜\",\"藤藤菜\",\"竹葉菜\",\"葛菜\"]', '蔬菜類', '自動生成: 蕹菜(土植)(10月取樣) (僅台灣資料庫)', NULL, '蕹菜(土植)(10月取樣)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1466', '[\"蕹菜(土植)(1月取樣)\",\"蕹菜\",\"空心菜\",\"應菜\",\"壅菜\",\"甕菜\",\"草菜\",\"無心菜\",\"藤藤菜\",\"竹葉菜\",\"葛菜\"]', '蔬菜類', '自動生成: 蕹菜(土植)(1月取樣) (僅台灣資料庫)', NULL, '蕹菜(土植)(1月取樣)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1467', '[\"蕹菜(土植)(4月取樣)\",\"蕹菜\",\"空心菜\",\"應菜\",\"壅菜\",\"甕菜\",\"草菜\",\"無心菜\",\"藤藤菜\",\"竹葉菜\",\"葛菜\"]', '蔬菜類', '自動生成: 蕹菜(土植)(4月取樣) (僅台灣資料庫)', NULL, '蕹菜(土植)(4月取樣)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1468', '[\"蕹菜(土植)(7月取樣)\",\"蕹菜\",\"空心菜\",\"應菜\",\"壅菜\",\"甕菜\",\"草菜\",\"無心菜\",\"藤藤菜\",\"竹葉菜\",\"葛菜\"]', '蔬菜類', '自動生成: 蕹菜(土植)(7月取樣) (僅台灣資料庫)', NULL, '蕹菜(土植)(7月取樣)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1469', '[\"蕹菜(有機)(10月取樣)\",\"蕹菜\",\"空心菜\",\"應菜\",\"壅菜\",\"甕菜\",\"草菜\",\"無心菜\",\"藤藤菜\",\"竹葉菜\",\"葛菜\"]', '蔬菜類', '自動生成: 蕹菜(有機)(10月取樣) (僅台灣資料庫)', NULL, '蕹菜(有機)(10月取樣)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1470', '[\"蕹菜(有機)(4月取樣)\",\"蕹菜\",\"空心菜\",\"應菜\",\"壅菜\",\"甕菜\",\"草菜\",\"無心菜\",\"藤藤菜\",\"竹葉菜\",\"葛菜\"]', '蔬菜類', '自動生成: 蕹菜(有機)(4月取樣) (僅台灣資料庫)', NULL, '蕹菜(有機)(4月取樣)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1471', '[\"蕹菜(水耕)(10月取樣)\",\"蕹菜\",\"空心菜\",\"應菜\",\"壅菜\",\"甕菜\",\"草菜\",\"無心菜\",\"藤藤菜\",\"竹葉菜\",\"葛菜\"]', '蔬菜類', '自動生成: 蕹菜(水耕)(10月取樣) (僅台灣資料庫)', NULL, '蕹菜(水耕)(10月取樣)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1472', '[\"蕹菜(水耕)(1月取樣)\",\"蕹菜\",\"空心菜\",\"應菜\",\"壅菜\",\"甕菜\",\"草菜\",\"無心菜\",\"藤藤菜\",\"竹葉菜\",\"葛菜\"]', '蔬菜類', '自動生成: 蕹菜(水耕)(1月取樣) (僅台灣資料庫)', NULL, '蕹菜(水耕)(1月取樣)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1473', '[\"蕹菜(水耕)(4月取樣)\",\"蕹菜\",\"空心菜\",\"應菜\",\"壅菜\",\"甕菜\",\"草菜\",\"無心菜\",\"藤藤菜\",\"竹葉菜\",\"葛菜\"]', '蔬菜類', '自動生成: 蕹菜(水耕)(4月取樣) (僅台灣資料庫)', NULL, '蕹菜(水耕)(4月取樣)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1474', '[\"蕹菜(水耕)(7月取樣)\",\"蕹菜\",\"空心菜\",\"應菜\",\"壅菜\",\"甕菜\",\"草菜\",\"無心菜\",\"藤藤菜\",\"竹葉菜\",\"葛菜\"]', '蔬菜類', '自動生成: 蕹菜(水耕)(7月取樣) (僅台灣資料庫)', NULL, '蕹菜(水耕)(7月取樣)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1475', '[\"蕺菜\",\"魚腥草\",\"臭腥草\",\"臭臊草\",\"臭瘥草\",\"手藥\"]', '蔬菜類', '自動生成: 蕺菜 (僅台灣資料庫)', NULL, '蕺菜');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1476', '[\"薄荷\",\"仁丹草\",\"升陽藥\",\"南薄荷\",\"夜息花\",\"野薄荷\",\"新卜荷\"]', '蔬菜類', '自動生成: 薄荷 (僅台灣資料庫)', NULL, '薄荷');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1480', '[\"薏仁\",\"薏苡仁\"]', '穀物類', '自動生成: 薏仁 (僅台灣資料庫)', NULL, '薏仁');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1481', '[\"薏仁粉\"]', '穀物類', '自動生成: 薏仁粉 (僅台灣資料庫)', NULL, '薏仁粉');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1492', '[\"薤\",\"蕗蕎\",\"薤頭\",\"火蔥\",\"蕎蔥\",\"大韭(韮)\",\"露京\",\"蕎頭\",\"叫頭\"]', '加工調理食品及其他類', '自動生成: 薤 (僅台灣資料庫)', NULL, '薤');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1493', '[\"藍圓鰺\",\"硬尾\",\"廣仔\",\"甘廣\",\"四破\",\"巴攏\",\"金鼓\",\"吧弄\",\"巴弄/孔仔(澎湖)\"]', '魚貝類', '自動生成: 藍圓鰺 (僅台灣資料庫)', NULL, '藍圓鰺');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1494', '[\"藍寶石洋香瓜\",\"甜瓜\",\"甘瓜\",\"果瓜\",\"香瓜\",\"梨仔瓜\",\"澎湖瓜\",\"洋香瓜\",\"網仔瓜\",\"哈蜜瓜\"]', '水果類', '自動生成: 藍寶石洋香瓜 (僅台灣資料庫)', NULL, '藍寶石洋香瓜');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1496', '[\"藍莓(台灣)\",\"藍莓\"]', '水果類', '自動生成: 藍莓(台灣) (僅台灣資料庫)', NULL, '藍莓(台灣)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1499', '[\"藤三七\",\"洋落葵\",\"蔓安迪\",\"落葵安迪\",\"藤子三七\",\"雲南白藥\",\"小年藥\",\"馬德拉藤\",\"金錢珠\",\"中枝蓮(習以川七誤稱)\"]', '蔬菜類', '自動生成: 藤三七 (僅台灣資料庫)', NULL, '藤三七');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1500', '[\"蘆筍花\"]', '蔬菜類', '自動生成: 蘆筍花 (僅台灣資料庫)', NULL, '蘆筍花');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1501', '[\"蘆薈\",\"盧會\"]', '蔬菜類', '自動生成: 蘆薈 (僅台灣資料庫)', NULL, '蘆薈');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1502', '[\"蘆薈露飲料\"]', '飲料類', '自動生成: 蘆薈露飲料 (僅台灣資料庫)', NULL, '蘆薈露飲料');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1503', '[\"蘇打餅乾(蔬菜)\",\"蘇打餅乾\"]', '糕餅點心類', '自動生成: 蘇打餅乾(蔬菜) (僅台灣資料庫)', NULL, '蘇打餅乾(蔬菜)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1508', '[\"蘑菇醬\"]', '調味料及香辛料類', '自動生成: 蘑菇醬 (僅台灣資料庫)', NULL, '蘑菇醬');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1509', '[\"蘿美萵苣\",\"葉萵苣\",\"葉萵\",\"萵仔菜\",\"刈葉萵苣\",\"生菜\",\"妹(媚)仔菜\",\"鵝仔菜(草)\",\"春不老\",\"印度萵苣(大陸妹)\"]', '蔬菜類', '自動生成: 蘿美萵苣 (僅台灣資料庫)', NULL, '蘿美萵苣');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1514', '[\"虎皮蛙\",\"虎斑蛙\",\"虎紋蛙\",\"水雞\",\"田雞\",\"台灣青蛙\"]', '肉類', '自動生成: 虎皮蛙 (僅台灣資料庫)', NULL, '虎皮蛙');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1526', '[\"蛇肉\"]', '肉類', '自動生成: 蛇肉 (僅台灣資料庫)', NULL, '蛇肉');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1535', '[\"蛙形蟹\",\"旭蟹\",\"蝦姑頭\",\"候貝切\",\"紅面猴\",\"海臭蟲\",\"西姑麻\"]', '魚貝類', '自動生成: 蛙形蟹 (僅台灣資料庫)', NULL, '蛙形蟹');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1536', '[\"蜂蜜(冬蜜)\",\"蜂蜜\"]', '糖類', '自動生成: 蜂蜜(冬蜜) (僅台灣資料庫)', NULL, '蜂蜜(冬蜜)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1537', '[\"蜂蜜(春蜜)\",\"蜂蜜\"]', '糖類', '自動生成: 蜂蜜(春蜜) (僅台灣資料庫)', NULL, '蜂蜜(春蜜)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1541', '[\"蜜世界洋香瓜\",\"甜瓜\",\"甘瓜\",\"果瓜\",\"香瓜\",\"梨仔瓜\",\"澎湖瓜\",\"洋香瓜\"]', '水果類', '自動生成: 蜜世界洋香瓜 (僅台灣資料庫)', NULL, '蜜世界洋香瓜');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1542', '[\"蜜棗(圓形)\",\"蜜棗\",\"棗子\",\"棗仔(蜜絲棗)\"]', '水果類', '自動生成: 蜜棗(圓形) (僅台灣資料庫)', NULL, '蜜棗(圓形)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1543', '[\"蜜棗(長形)\",\"蜜棗\",\"棗子\",\"棗仔\"]', '水果類', '自動生成: 蜜棗(長形) (僅台灣資料庫)', NULL, '蜜棗(長形)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1544', '[\"蜜棗平均值(大)\",\"蜜棗平均值\",\"棗子\",\"棗仔\"]', '水果類', '自動生成: 蜜棗平均值(大) (僅台灣資料庫)', NULL, '蜜棗平均值(大)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1545', '[\"蜜棗李(進口)\",\"蜜棗李\",\"李子\"]', '水果類', '自動生成: 蜜棗李(進口) (僅台灣資料庫)', NULL, '蜜棗李(進口)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1556', '[\"蟠桃\",\"餅桃\"]', '水果類', '自動生成: 蟠桃 (僅台灣資料庫)', NULL, '蟠桃');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1557', '[\"蟹腳肉\"]', '魚貝類', '自動生成: 蟹腳肉 (僅台灣資料庫)', NULL, '蟹腳肉');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1558', '[\"蠑螺(加工)\",\"蠑螺\"]', '加工調理食品及其他類', '自動生成: 蠑螺(加工) (僅台灣資料庫)', NULL, '蠑螺(加工)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1559', '[\"蠔油\"]', '調味料及香辛料類', '自動生成: 蠔油 (僅台灣資料庫)', NULL, '蠔油');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1560', '[\"蠔菇\",\"平菇\",\"日本蠔菇\",\"糙皮側耳\",\"黑牡丹菇\",\"黑美人菇\",\"人工口蘑(囊狀側耳)\"]', '菇類', '自動生成: 蠔菇 (僅台灣資料庫)', NULL, '蠔菇');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1561', '[\"血斑異大眼鯛\",\"紅目鰱\",\"嚴公仔\"]', '魚貝類', '自動生成: 血斑異大眼鯛 (僅台灣資料庫)', NULL, '血斑異大眼鯛');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1562', '[\"衛生油麵\"]', '加工調理食品及其他類', '自動生成: 衛生油麵 (僅台灣資料庫)', NULL, '衛生油麵');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1563', '[\"裙帶菜\",\"海帶芽\",\"嫩海帶\"]', '藻類', '自動生成: 裙帶菜 (僅台灣資料庫)', NULL, '裙帶菜');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1565', '[\"西施舌\",\"紫貝\",\"西肚舌\",\"西刀舌(蚶)\",\"紫晃肉\",\"雙線血蚶\",\"獅刀舌\",\"西施貝\"]', '魚貝類', '自動生成: 西施舌 (僅台灣資料庫)', NULL, '西施舌');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1566', '[\"西施蜜柚\",\"柚子\",\"內紫\",\"朱欒\",\"香欒\",\"座凡\",\"拋\",\"欒(西施柚)\"]', '水果類', '自動生成: 西施蜜柚 (僅台灣資料庫)', NULL, '西施蜜柚');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1567', '[\"西洋梨(紅皮)\",\"西洋梨\",\"梨子\",\"水梨\",\"山褵\",\"快果\",\"果宗\"]', '水果類', '自動生成: 西洋梨(紅皮) (僅台灣資料庫)', NULL, '西洋梨(紅皮)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1568', '[\"西洋梨(青皮)\",\"西洋梨\",\"梨子\",\"水梨\",\"山褵\",\"快果\",\"果宗\"]', '水果類', '自動生成: 西洋梨(青皮) (僅台灣資料庫)', NULL, '西洋梨(青皮)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1569', '[\"西洋梨(黃皮)\",\"西洋梨\",\"梨子\",\"水梨\",\"山褵\",\"快果\",\"果宗\"]', '水果類', '自動生成: 西洋梨(黃皮) (僅台灣資料庫)', NULL, '西洋梨(黃皮)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1570', '[\"西洋梨平均值\",\"梨子\",\"水梨\",\"山褵\",\"快果\",\"果宗\"]', '水果類', '自動生成: 西洋梨平均值 (僅台灣資料庫)', NULL, '西洋梨平均值');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1577', '[\"角椒\",\"辣椒\",\"番椒\",\"番仔薑\",\"臘椒\"]', '蔬菜類', '自動生成: 角椒 (僅台灣資料庫)', NULL, '角椒');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1579', '[\"調合植物油\",\"蔬菜油\"]', '油脂類', '自動生成: 調合植物油 (僅台灣資料庫)', NULL, '調合植物油');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1584', '[\"豆干丁(五香)\",\"豆干丁\"]', '糕餅點心類', '自動生成: 豆干丁(五香) (僅台灣資料庫)', NULL, '豆干丁(五香)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1586', '[\"豆干絲\"]', '加工調理食品及其他類', '自動生成: 豆干絲 (僅台灣資料庫)', NULL, '豆干絲');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1587', '[\"豆棗\"]', '加工調理食品及其他類', '自動生成: 豆棗 (僅台灣資料庫)', NULL, '豆棗');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1592', '[\"豆瓣菜\",\"西洋菜\",\"水芥(田/應/蕹)菜\",\"無心芥(菜)\",\"廣東芥菜\",\"微子蔊菜\",\"風花菜\",\"水生山葵菜\",\"麥藍菜\",\"角菜\"]', '蔬菜類', '自動生成: 豆瓣菜 (僅台灣資料庫)', NULL, '豆瓣菜');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1593', '[\"豆瓣醬\"]', '調味料及香辛料類', '自動生成: 豆瓣醬 (僅台灣資料庫)', NULL, '豆瓣醬');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1596', '[\"豆薯\",\"刈薯\",\"涼薯\",\"葛薯\",\"沙葛\",\"地瓜\",\"三角薯\"]', '澱粉類', '自動生成: 豆薯 (僅台灣資料庫)', NULL, '豆薯');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1597', '[\"豆豉\",\"蔭豉\"]', '加工調理食品及其他類', '自動生成: 豆豉 (僅台灣資料庫)', NULL, '豆豉');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1598', '[\"豆酥\"]', '調味料及香辛料類', '自動生成: 豆酥 (僅台灣資料庫)', NULL, '豆酥');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1599', '[\"豆酥醬\"]', '調味料及香辛料類', '自動生成: 豆酥醬 (僅台灣資料庫)', NULL, '豆酥醬');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1600', '[\"豇豆(莢)\",\"豇豆\",\"長豇豆\",\"長莢豇豆\",\"豆角\",\"菜(筷/江/長/角)豆\"]', '豆類', '自動生成: 豇豆(莢) (僅台灣資料庫)', NULL, '豇豆(莢)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1606', '[\"豐水梨\",\"梨子\",\"水梨\",\"山褵\",\"快果\",\"果宗\"]', '水果類', '自動生成: 豐水梨 (僅台灣資料庫)', NULL, '豐水梨');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1607', '[\"象牙鳳螺\",\"鳳(花/風/皇)螺\",\"象牙螺\"]', '魚貝類', '自動生成: 象牙鳳螺 (僅台灣資料庫)', NULL, '象牙鳳螺');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1608', '[\"豬上肩肉\",\"梅花肉\"]', '肉類', '自動生成: 豬上肩肉 (僅台灣資料庫)', NULL, '豬上肩肉');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1609', '[\"豬下肩瘦肉\",\"前腿瘦肉\"]', '肉類', '自動生成: 豬下肩瘦肉 (僅台灣資料庫)', NULL, '豬下肩瘦肉');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1610', '[\"豬下肩肉\",\"前腿肉\"]', '肉類', '自動生成: 豬下肩肉 (僅台灣資料庫)', NULL, '豬下肩肉');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1611', '[\"豬前腳\",\"豬腳\",\"豬蹄\",\"短腳\"]', '肉類', '自動生成: 豬前腳 (僅台灣資料庫)', NULL, '豬前腳');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1612', '[\"豬前腿外腱肉\",\"豬腱\",\"腱子肉\"]', '肉類', '自動生成: 豬前腿外腱肉 (僅台灣資料庫)', NULL, '豬前腿外腱肉');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1613', '[\"豬去皮腹脇肉\",\"去皮五花肉\",\"去皮三層肉\"]', '肉類', '自動生成: 豬去皮腹脇肉 (僅台灣資料庫)', NULL, '豬去皮腹脇肉');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1614', '[\"豬大排\",\"背脊\",\"帶骨里肌\"]', '肉類', '自動生成: 豬大排 (僅台灣資料庫)', NULL, '豬大排');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1615', '[\"豬大腸\"]', '肉類', '自動生成: 豬大腸 (僅台灣資料庫)', NULL, '豬大腸');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1616', '[\"豬大里肌\",\"背脊肉\",\"里肌肉\"]', '肉類', '自動生成: 豬大里肌 (僅台灣資料庫)', NULL, '豬大里肌');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1617', '[\"豬大骨湯\",\"高湯\"]', '肉類', '自動生成: 豬大骨湯 (僅台灣資料庫)', NULL, '豬大骨湯');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1618', '[\"豬小排\",\"里肌小排\",\"肋小排\",\"肋骨排\"]', '肉類', '自動生成: 豬小排 (僅台灣資料庫)', NULL, '豬小排');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1619', '[\"豬小腸\"]', '肉類', '自動生成: 豬小腸 (僅台灣資料庫)', NULL, '豬小腸');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1620', '[\"豬小里肌\",\"腰內肉\"]', '肉類', '自動生成: 豬小里肌 (僅台灣資料庫)', NULL, '豬小里肌');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1621', '[\"豬尾\"]', '肉類', '自動生成: 豬尾 (僅台灣資料庫)', NULL, '豬尾');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1622', '[\"豬帶皮腹脇肉\",\"帶皮五花肉\",\"帶皮三層肉\"]', '肉類', '自動生成: 豬帶皮腹脇肉 (僅台灣資料庫)', NULL, '豬帶皮腹脇肉');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1623', '[\"豬後腳\",\"豬腳\",\"豬蹄\",\"長腳\"]', '肉類', '自動生成: 豬後腳 (僅台灣資料庫)', NULL, '豬後腳');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1624', '[\"豬後腿外腱肉\",\"豬腱\",\"外腱\"]', '肉類', '自動生成: 豬後腿外腱肉 (僅台灣資料庫)', NULL, '豬後腿外腱肉');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1625', '[\"豬後腿瘦肉\"]', '肉類', '自動生成: 豬後腿瘦肉 (僅台灣資料庫)', NULL, '豬後腿瘦肉');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1626', '[\"豬後腿肉\"]', '肉類', '自動生成: 豬後腿肉 (僅台灣資料庫)', NULL, '豬後腿肉');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1627', '[\"豬心\"]', '肉類', '自動生成: 豬心 (僅台灣資料庫)', NULL, '豬心');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1628', '[\"豬油\"]', '油脂類', '自動生成: 豬油 (僅台灣資料庫)', NULL, '豬油');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1629', '[\"豬油(2022年取樣)\",\"豬油\"]', '油脂類', '自動生成: 豬油(2022年取樣) (僅台灣資料庫)', NULL, '豬油(2022年取樣)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1630', '[\"豬油渣\"]', '肉類', '自動生成: 豬油渣 (僅台灣資料庫)', NULL, '豬油渣');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1631', '[\"豬白管\",\"豬管庭(廷)\",\"皇管(豬之胸大動脈)\"]', '肉類', '自動生成: 豬白管 (僅台灣資料庫)', NULL, '豬白管');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1632', '[\"豬皮\"]', '肉類', '自動生成: 豬皮 (僅台灣資料庫)', NULL, '豬皮');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1633', '[\"豬空腸\",\"粉腸\"]', '肉類', '自動生成: 豬空腸 (僅台灣資料庫)', NULL, '豬空腸');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1634', '[\"豬絞肉(70％瘦肉率)\",\"豬絞肉\"]', '肉類', '自動生成: 豬絞肉(70％瘦肉率) (僅台灣資料庫)', NULL, '豬絞肉(70％瘦肉率)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1635', '[\"豬絞肉(90％瘦肉率)\",\"豬絞肉\"]', '肉類', '自動生成: 豬絞肉(90％瘦肉率) (僅台灣資料庫)', NULL, '豬絞肉(90％瘦肉率)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1636', '[\"豬絞肉平均值\"]', '肉類', '自動生成: 豬絞肉平均值 (僅台灣資料庫)', NULL, '豬絞肉平均值');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1637', '[\"豬耳\"]', '肉類', '自動生成: 豬耳 (僅台灣資料庫)', NULL, '豬耳');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1638', '[\"豬肉脯\",\"豬肉絨\"]', '加工調理食品及其他類', '自動生成: 豬肉脯 (僅台灣資料庫)', NULL, '豬肉脯');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1639', '[\"豬肉酥\",\"豬肉鬆\"]', '加工調理食品及其他類', '自動生成: 豬肉酥 (僅台灣資料庫)', NULL, '豬肉酥');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1640', '[\"豬肉鍋貼\"]', '加工調理食品及其他類', '自動生成: 豬肉鍋貼 (僅台灣資料庫)', NULL, '豬肉鍋貼');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1641', '[\"豬肉餡餅\"]', '加工調理食品及其他類', '自動生成: 豬肉餡餅 (僅台灣資料庫)', NULL, '豬肉餡餅');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1642', '[\"豬肋骨湯\",\"高湯\",\"小骨湯\",\"籤仔骨湯\",\"冰仔骨湯\",\"支骨湯\"]', '肉類', '自動生成: 豬肋骨湯 (僅台灣資料庫)', NULL, '豬肋骨湯');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1643', '[\"豬肚\",\"豬胃\"]', '肉類', '自動生成: 豬肚 (僅台灣資料庫)', NULL, '豬肚');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1644', '[\"豬肝\"]', '肉類', '自動生成: 豬肝 (僅台灣資料庫)', NULL, '豬肝');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1645', '[\"豬肝連\",\"肝連\",\"隔胸肉\",\"條仔肉(橫隔肌)\"]', '肉類', '自動生成: 豬肝連 (僅台灣資料庫)', NULL, '豬肝連');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1646', '[\"豬肩胛排\",\"中排\"]', '肉類', '自動生成: 豬肩胛排 (僅台灣資料庫)', NULL, '豬肩胛排');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1647', '[\"豬肩胛排(2021年取樣)\",\"豬肩胛排\"]', '肉類', '自動生成: 豬肩胛排(2021年取樣) (僅台灣資料庫)', NULL, '豬肩胛排(2021年取樣)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1648', '[\"豬肩胛肉\",\"胛心肉\"]', '肉類', '自動生成: 豬肩胛肉 (僅台灣資料庫)', NULL, '豬肩胛肉');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1649', '[\"豬肩骨湯\",\"高湯\"]', '肉類', '自動生成: 豬肩骨湯 (僅台灣資料庫)', NULL, '豬肩骨湯');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1650', '[\"豬脾臟\",\"腰尺\"]', '肉類', '自動生成: 豬脾臟 (僅台灣資料庫)', NULL, '豬脾臟');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1651', '[\"豬腎\",\"腰子\"]', '肉類', '自動生成: 豬腎 (僅台灣資料庫)', NULL, '豬腎');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1652', '[\"豬腦\"]', '肉類', '自動生成: 豬腦 (僅台灣資料庫)', NULL, '豬腦');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1653', '[\"豬腳凍\"]', '加工調理食品及其他類', '自動生成: 豬腳凍 (僅台灣資料庫)', NULL, '豬腳凍');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1654', '[\"豬腳筋\",\"蹄筋\",\"長筋\"]', '肉類', '自動生成: 豬腳筋 (僅台灣資料庫)', NULL, '豬腳筋');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1655', '[\"豬腹脇排\",\"腩排\",\"肉排\",\"小排\"]', '肉類', '自動生成: 豬腹脇排 (僅台灣資料庫)', NULL, '豬腹脇排');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1656', '[\"豬舌\"]', '肉類', '自動生成: 豬舌 (僅台灣資料庫)', NULL, '豬舌');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1657', '[\"豬血\"]', '肉類', '自動生成: 豬血 (僅台灣資料庫)', NULL, '豬血');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1658', '[\"豬血糕\",\"米血糕\"]', '加工調理食品及其他類', '自動生成: 豬血糕 (僅台灣資料庫)', NULL, '豬血糕');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1659', '[\"豬蹄膀\",\"豬腳\",\"蹄膀\",\"圓蹄\"]', '肉類', '自動生成: 豬蹄膀 (僅台灣資料庫)', NULL, '豬蹄膀');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1660', '[\"豬軟骨\"]', '肉類', '自動生成: 豬軟骨 (僅台灣資料庫)', NULL, '豬軟骨');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1661', '[\"豬頰肉\",\"豬舌肉\",\"菊花肉\"]', '肉類', '自動生成: 豬頰肉 (僅台灣資料庫)', NULL, '豬頰肉');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1662', '[\"豬頰肉(2022年取樣)\",\"豬頰肉\",\"豬舌肉\",\"菊花肉\"]', '肉類', '自動生成: 豬頰肉(2022年取樣) (僅台灣資料庫)', NULL, '豬頰肉(2022年取樣)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1663', '[\"豬頸肉\",\"松阪豬肉\"]', '肉類', '自動生成: 豬頸肉 (僅台灣資料庫)', NULL, '豬頸肉');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1664', '[\"豬骨湯平均值\",\"高湯\"]', '肉類', '自動生成: 豬骨湯平均值 (僅台灣資料庫)', NULL, '豬骨湯平均值');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1665', '[\"赤鰭笛鯛\",\"紅雞仔\",\"赤海雞\",\"赤筆仔(臺東)\",\"赤筆\",\"赤海\",\"紅魚\",\"紅鰭赤海/鐵汕婆(澎湖)\"]', '魚貝類', '自動生成: 赤鰭笛鯛 (僅台灣資料庫)', NULL, '赤鰭笛鯛');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1666', '[\"起酥片\"]', '糕餅點心類', '自動生成: 起酥片 (僅台灣資料庫)', NULL, '起酥片');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1669', '[\"越瓜\",\"醃瓜\",\"菴瓜\",\"梢瓜\",\"酥瓜\",\"甜瓜\",\"羊角瓜\",\"稍瓜\",\"生瓜\",\"白瓜\",\"青瓜\",\"百香胡瓜\"]', '蔬菜類', '自動生成: 越瓜 (僅台灣資料庫)', NULL, '越瓜');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1670', '[\"車輪餅(紅豆)\",\"車輪餅\"]', '糕餅點心類', '自動生成: 車輪餅(紅豆) (僅台灣資料庫)', NULL, '車輪餅(紅豆)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1671', '[\"車輪餅(菜脯)\",\"車輪餅\"]', '糕餅點心類', '自動生成: 車輪餅(菜脯) (僅台灣資料庫)', NULL, '車輪餅(菜脯)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1672', '[\"軟翅仔\",\"萊氏擬烏賊\",\"軟翅鎖管\",\"軟翅(薯/絲)\",\"泥障鰂\",\"擬烏賊\",\"柔魚\"]', '魚貝類', '自動生成: 軟翅仔 (僅台灣資料庫)', NULL, '軟翅仔');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1673', '[\"辣椒粉\"]', '調味料及香辛料類', '自動生成: 辣椒粉 (僅台灣資料庫)', NULL, '辣椒粉');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1674', '[\"辣椒醬\"]', '調味料及香辛料類', '自動生成: 辣椒醬 (僅台灣資料庫)', NULL, '辣椒醬');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1675', '[\"辣蒜蓉醬\"]', '調味料及香辛料類', '自動生成: 辣蒜蓉醬 (僅台灣資料庫)', NULL, '辣蒜蓉醬');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1676', '[\"辣豆瓣醬\"]', '調味料及香辛料類', '自動生成: 辣豆瓣醬 (僅台灣資料庫)', NULL, '辣豆瓣醬');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1678', '[\"迷迭香粉\"]', '調味料及香辛料類', '自動生成: 迷迭香粉 (僅台灣資料庫)', NULL, '迷迭香粉');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1679', '[\"通心麵\"]', '加工調理食品及其他類', '自動生成: 通心麵 (僅台灣資料庫)', NULL, '通心麵');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1680', '[\"速食乾麵麻醬包\"]', '調味料及香辛料類', '自動生成: 速食乾麵麻醬包 (僅台灣資料庫)', NULL, '速食乾麵麻醬包');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1681', '[\"運動飲料\"]', '飲料類', '自動生成: 運動飲料 (僅台灣資料庫)', NULL, '運動飲料');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1682', '[\"過溝菜蕨\",\"過貓(溝)\",\"過貓(溝)菜\",\"蕨山貓\",\"食用雙囊蕨\"]', '蔬菜類', '自動生成: 過溝菜蕨 (僅台灣資料庫)', NULL, '過溝菜蕨');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1684', '[\"部份脫脂奶粉\",\"乳粉\"]', '乳品類', '自動生成: 部份脫脂奶粉 (僅台灣資料庫)', NULL, '部份脫脂奶粉');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1685', '[\"部份脫脂奶粉(即溶)\",\"部份脫脂奶粉\",\"乳粉\"]', '乳品類', '自動生成: 部份脫脂奶粉(即溶) (僅台灣資料庫)', NULL, '部份脫脂奶粉(即溶)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1686', '[\"部份脫脂強化奶粉(纖維&DHA強化)\",\"部份脫脂強化奶粉\",\"乳粉\"]', '乳品類', '自動生成: 部份脫脂強化奶粉(纖維&DHA強化) (僅台灣資料庫)', NULL, '部份脫脂強化奶粉(纖維&DHA強化)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1687', '[\"部份脫脂強化奶粉(纖維&鈣強化)\",\"部份脫脂強化奶粉\",\"乳粉\"]', '乳品類', '自動生成: 部份脫脂強化奶粉(纖維&鈣強化) (僅台灣資料庫)', NULL, '部份脫脂強化奶粉(纖維&鈣強化)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1688', '[\"部份脫脂強化奶粉(脂肪酸調整)\",\"部份脫脂強化奶粉\",\"乳粉\"]', '乳品類', '自動生成: 部份脫脂強化奶粉(脂肪酸調整) (僅台灣資料庫)', NULL, '部份脫脂強化奶粉(脂肪酸調整)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1689', '[\"部份脫脂強化奶粉(鈣強化)\",\"部份脫脂強化奶粉\",\"乳粉\"]', '乳品類', '自動生成: 部份脫脂強化奶粉(鈣強化) (僅台灣資料庫)', NULL, '部份脫脂強化奶粉(鈣強化)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1690', '[\"部份脫脂調味奶粉(巧克力)\",\"部份脫脂調味奶粉\",\"乳粉\"]', '乳品類', '自動生成: 部份脫脂調味奶粉(巧克力) (僅台灣資料庫)', NULL, '部份脫脂調味奶粉(巧克力)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1692', '[\"酒杯菇\",\"大杯傘\",\"大杯菇\",\"葉松茸\",\"豬肚菇\"]', '菇類', '自動生成: 酒杯菇 (僅台灣資料庫)', NULL, '酒杯菇');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1693', '[\"酪梨(室溫存放0天)\",\"酪梨\",\"牛油果(梨)\",\"黃油果(梨)\",\"油梨\",\"鰐(鱷)梨\",\"幸福果\",\"樂天果\"]', '水果類', '自動生成: 酪梨(室溫存放0天) (僅台灣資料庫)', NULL, '酪梨(室溫存放0天)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1694', '[\"酪梨(室溫存放3天)\",\"酪梨\",\"牛油果(梨)\",\"黃油果(梨)\",\"油梨\",\"鰐(鱷)梨\",\"幸福果\",\"樂天果\"]', '水果類', '自動生成: 酪梨(室溫存放3天) (僅台灣資料庫)', NULL, '酪梨(室溫存放3天)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1695', '[\"酪梨(室溫存放6天)\",\"酪梨\",\"牛油果(梨)\",\"黃油果(梨)\",\"油梨\",\"鰐(鱷)梨\",\"幸福果\",\"樂天果\"]', '水果類', '自動生成: 酪梨(室溫存放6天) (僅台灣資料庫)', NULL, '酪梨(室溫存放6天)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1696', '[\"酪梨(綠皮)\",\"酪梨\",\"牛油果(梨)\",\"黃油果(梨)\",\"油梨\",\"鰐(鱷)梨\",\"幸福果\",\"樂天果\"]', '水果類', '自動生成: 酪梨(綠皮) (僅台灣資料庫)', NULL, '酪梨(綠皮)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1697', '[\"酵母粉\"]', '調味料及香辛料類', '自動生成: 酵母粉 (僅台灣資料庫)', NULL, '酵母粉');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1698', '[\"酵母菌咀嚼錠\"]', '糕餅點心類', '自動生成: 酵母菌咀嚼錠 (僅台灣資料庫)', NULL, '酵母菌咀嚼錠');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1699', '[\"酸甘藍菜\",\"酸高麗菜\"]', '加工調理食品及其他類', '自動生成: 酸甘藍菜 (僅台灣資料庫)', NULL, '酸甘藍菜');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1700', '[\"酸菜\",\"鹹菜\",\"鹼菜\",\"醃(大/鹹)酸菜\",\"大鹹菜\",\"鹹菜仁\"]', '加工調理食品及其他類', '自動生成: 酸菜 (僅台灣資料庫)', NULL, '酸菜');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1701', '[\"醃漬冬瓜\",\"白瓜\",\"東瓜\",\"枕瓜\",\"水芝\",\"地芝\"]', '加工調理食品及其他類', '自動生成: 醃漬冬瓜 (僅台灣資料庫)', NULL, '醃漬冬瓜');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1703', '[\"醃漬花胡瓜\",\"小黃瓜\",\"花瓜\",\"小胡瓜\",\"小瓜\",\"小刺瓜\",\"水胡瓜\"]', '加工調理食品及其他類', '自動生成: 醃漬花胡瓜 (僅台灣資料庫)', NULL, '醃漬花胡瓜');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1704', '[\"醃漬越瓜\",\"醃瓜\",\"菴瓜\",\"梢瓜\",\"酥瓜\",\"甜瓜\",\"羊角瓜\",\"稍瓜\",\"生瓜\",\"白瓜\",\"青瓜\",\"百香胡瓜\"]', '加工調理食品及其他類', '自動生成: 醃漬越瓜 (僅台灣資料庫)', NULL, '醃漬越瓜');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1705', '[\"醃漬香菇\",\"冬(北/花/厚/毛)菇\",\"椎茸\",\"香蕈(信/椹)\",\"合蕈\"]', '加工調理食品及其他類', '自動生成: 醃漬香菇 (僅台灣資料庫)', NULL, '醃漬香菇');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1707', '[\"醃燻豬肝\"]', '加工調理食品及其他類', '自動生成: 醃燻豬肝 (僅台灣資料庫)', NULL, '醃燻豬肝');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1708', '[\"醃辣椒\",\"剝皮辣椒\"]', '加工調理食品及其他類', '自動生成: 醃辣椒 (僅台灣資料庫)', NULL, '醃辣椒');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1712', '[\"醬肘子\",\"醬肘花\",\"醬汁燒蹄膀\"]', '加工調理食品及其他類', '自動生成: 醬肘子 (僅台灣資料庫)', NULL, '醬肘子');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1713', '[\"釋迦\",\"番荔枝\",\"釋迦果\",\"佛頭果\",\"番梨\"]', '水果類', '自動生成: 釋迦 (僅台灣資料庫)', NULL, '釋迦');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1714', '[\"里肌肉(土雞)\",\"里肌肉\"]', '肉類', '自動生成: 里肌肉(土雞) (僅台灣資料庫)', NULL, '里肌肉(土雞)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1715', '[\"里肌肉(肉雞)\",\"里肌肉\"]', '肉類', '自動生成: 里肌肉(肉雞) (僅台灣資料庫)', NULL, '里肌肉(肉雞)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1716', '[\"里肌肉平均值\"]', '肉類', '自動生成: 里肌肉平均值 (僅台灣資料庫)', NULL, '里肌肉平均值');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1718', '[\"野苦瓜\",\"山苦瓜\",\"青小苦瓜\",\"小苦瓜\",\"野生苦瓜\",\"短苦瓜\",\"野癩瓜\"]', '蔬菜類', '自動生成: 野苦瓜 (僅台灣資料庫)', NULL, '野苦瓜');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1719', '[\"野苦瓜嫩梢\"]', '蔬菜類', '自動生成: 野苦瓜嫩梢 (僅台灣資料庫)', NULL, '野苦瓜嫩梢');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1720', '[\"野莧菜\",\"野莧(杏)\",\"綠莧\",\"豬莧\",\"鳥仔莧(杏)\",\"假莧(杏)菜\",\"山荇(杏\",\"莧)菜\"]', '蔬菜類', '自動生成: 野莧菜 (僅台灣資料庫)', NULL, '野莧菜');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1722', '[\"金喜菇\"]', '菇類', '自動生成: 金喜菇 (僅台灣資料庫)', NULL, '金喜菇');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1724', '[\"金時甘藷\",\"甘薯\",\"番薯\",\"甜薯\",\"地瓜\",\"田薯\",\"土薯\"]', '澱粉類', '自動生成: 金時甘藷 (僅台灣資料庫)', NULL, '金時甘藷');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1725', '[\"金桔醬\"]', '調味料及香辛料類', '自動生成: 金桔醬 (僅台灣資料庫)', NULL, '金桔醬');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1731', '[\"金針菇\",\"金(冬/榎/朴)菇\",\"金絲菇\",\"金菇菜\",\"秋葷\",\"樸蕈構菌\",\"毛柄金線菇\",\"菌子(絨柄金錢菇)\"]', '菇類', '自動生成: 金針菇 (僅台灣資料庫)', NULL, '金針菇');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1732', '[\"金針菇罐頭\",\"金(冬/榎/朴)菇\",\"金絲菇\",\"金菇菜\",\"秋葷\",\"樸蕈構菌\",\"毛柄金線菇\",\"菌子(絨柄金錢菇)\"]', '加工調理食品及其他類', '自動生成: 金針菇罐頭 (僅台灣資料庫)', NULL, '金針菇罐頭');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1733', '[\"金針菜\",\"萱草\",\"金針花\",\"金針\",\"黃花(菜)\",\"萱花\"]', '蔬菜類', '自動生成: 金針菜 (僅台灣資料庫)', NULL, '金針菜');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1734', '[\"金針菜乾\",\"萱草\",\"金針花\",\"金針\",\"黃花(菜)\",\"萱花\"]', '蔬菜類', '自動生成: 金針菜乾 (僅台灣資料庫)', NULL, '金針菜乾');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1735', '[\"金針菜嫩莖\",\"碧玉筍\",\"金針筍\",\"金針菜梗\",\"軟化金針菜\",\"金針嫩菜芽\",\"萱草菜嫩芽\"]', '蔬菜類', '自動生成: 金針菜嫩莖 (僅台灣資料庫)', NULL, '金針菜嫩莖');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1739', '[\"金門黃麵\"]', '加工調理食品及其他類', '自動生成: 金門黃麵 (僅台灣資料庫)', NULL, '金門黃麵');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1743', '[\"銀杏果\",\"白果\",\"銀杏核\",\"公孫樹子\",\"鴨腳樹子\",\"靈眼\"]', '堅果及種子類', '自動生成: 銀杏果 (僅台灣資料庫)', NULL, '銀杏果');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1744', '[\"銀耳\",\"白木耳\",\"雪耳\"]', '菇類', '自動生成: 銀耳 (僅台灣資料庫)', NULL, '銀耳');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1745', '[\"銀耳罐頭\",\"白木耳\",\"雪耳\"]', '加工調理食品及其他類', '自動生成: 銀耳罐頭 (僅台灣資料庫)', NULL, '銀耳罐頭');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1747', '[\"銀鯧(12月)\",\"銀鯧\",\"白鯧\",\"正鯧\",\"支子\"]', '魚貝類', '自動生成: 銀鯧(12月) (僅台灣資料庫)', NULL, '銀鯧(12月)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1748', '[\"銀鯧(2月)\",\"銀鯧\",\"白鯧\",\"正鯧\",\"支子\"]', '魚貝類', '自動生成: 銀鯧(2月) (僅台灣資料庫)', NULL, '銀鯧(2月)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1749', '[\"銀鯧(3月)\",\"銀鯧\",\"白鯧\",\"正鯧\",\"支子\"]', '魚貝類', '自動生成: 銀鯧(3月) (僅台灣資料庫)', NULL, '銀鯧(3月)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1750', '[\"銀鯧(5月)\",\"銀鯧\",\"白鯧\",\"正鯧\",\"支子\"]', '魚貝類', '自動生成: 銀鯧(5月) (僅台灣資料庫)', NULL, '銀鯧(5月)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1751', '[\"銀鯧(8月)\",\"銀鯧\",\"白鯧\",\"正鯧\",\"支子\"]', '魚貝類', '自動生成: 銀鯧(8月) (僅台灣資料庫)', NULL, '銀鯧(8月)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1752', '[\"銀鯧(含皮)\",\"銀鯧\",\"白鯧\",\"正鯧\",\"支子\"]', '魚貝類', '自動生成: 銀鯧(含皮) (僅台灣資料庫)', NULL, '銀鯧(含皮)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1753', '[\"銀鯧平均值(去皮)\",\"銀鯧平均值\",\"白(正/暗)鯧\",\"白鯧魚\",\"鯧仔魚\",\"黑鰭\",\"車片魚\"]', '魚貝類', '自動生成: 銀鯧平均值(去皮) (僅台灣資料庫)', NULL, '銀鯧平均值(去皮)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1754', '[\"銅鑼燒\"]', '糕餅點心類', '自動生成: 銅鑼燒 (僅台灣資料庫)', NULL, '銅鑼燒');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1755', '[\"鋸尾鯛\",\"黑豬哥\",\"黑將軍\",\"打鐵婆\",\"剝皮仔\",\"老娘(澎湖)\"]', '魚貝類', '自動生成: 鋸尾鯛 (僅台灣資料庫)', NULL, '鋸尾鯛');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1756', '[\"鍋燒意麵\"]', '加工調理食品及其他類', '自動生成: 鍋燒意麵 (僅台灣資料庫)', NULL, '鍋燒意麵');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1757', '[\"鍋燒麵\"]', '加工調理食品及其他類', '自動生成: 鍋燒麵 (僅台灣資料庫)', NULL, '鍋燒麵');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1758', '[\"長果金柑\",\"金棗\",\"羅浮柑\"]', '水果類', '自動生成: 長果金柑 (僅台灣資料庫)', NULL, '長果金柑');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1760', '[\"長辣椒(紅皮)\",\"長辣椒\",\"辣椒\",\"番椒\",\"番仔薑\",\"臘椒\"]', '蔬菜類', '自動生成: 長辣椒(紅皮) (僅台灣資料庫)', NULL, '長辣椒(紅皮)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1761', '[\"長辣椒(青皮)\",\"長辣椒\",\"辣椒\",\"番椒\",\"番仔薑\",\"臘椒\"]', '蔬菜類', '自動生成: 長辣椒(青皮) (僅台灣資料庫)', NULL, '長辣椒(青皮)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1764', '[\"長麵線\",\"壽麵線\"]', '加工調理食品及其他類', '自動生成: 長麵線 (僅台灣資料庫)', NULL, '長麵線');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1767', '[\"阿根廷魷\",\"阿根廷滑柔魚\"]', '魚貝類', '自動生成: 阿根廷魷 (僅台灣資料庫)', NULL, '阿根廷魷');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1768', '[\"阿部牙鯛\",\"赤鯮\",\"阿部赤鯮\"]', '魚貝類', '自動生成: 阿部牙鯛 (僅台灣資料庫)', NULL, '阿部牙鯛');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1769', '[\"陳年紹興酒\"]', '加工調理食品及其他類', '自動生成: 陳年紹興酒 (僅台灣資料庫)', NULL, '陳年紹興酒');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1770', '[\"陳皮\"]', '調味料及香辛料類', '自動生成: 陳皮 (僅台灣資料庫)', NULL, '陳皮');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1772', '[\"隼人瓜\",\"梨瓜\",\"壽瓜\",\"合掌瓜\",\"安南瓜\",\"香瓜仔\",\"拳頭瓜\",\"佛掌瓜、香圓瓜\",\"香櫞瓜\",\"佛手瓜\",\"瓦瓜\"]', '蔬菜類', '自動生成: 隼人瓜 (僅台灣資料庫)', NULL, '隼人瓜');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1773', '[\"隼人瓜(2023年取樣)\",\"隼人瓜\",\"梨瓜\",\"壽瓜\",\"合掌瓜\",\"安南瓜\",\"香瓜仔\",\"拳頭瓜\",\"佛掌瓜、香圓瓜\",\"香櫞瓜\",\"佛手瓜\",\"瓦瓜\"]', '蔬菜類', '自動生成: 隼人瓜(2023年取樣) (僅台灣資料庫)', NULL, '隼人瓜(2023年取樣)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1774', '[\"隼人瓜苗\",\"隼人瓜鬚\",\"佛手瓜苗(鬚)\",\"香櫞瓜苗(鬚)\",\"梨瓜苗(鬚)\",\"番瓜鬚(龍鬚菜是誤用)\"]', '蔬菜類', '自動生成: 隼人瓜苗 (僅台灣資料庫)', NULL, '隼人瓜苗');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1775', '[\"雙帶鰺\",\"海草\",\"拉侖\",\"拉崙/柴魚/青甘(澎湖)\"]', '魚貝類', '自動生成: 雙帶鰺 (僅台灣資料庫)', NULL, '雙帶鰺');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1776', '[\"雙線鬚鰨\",\"牛舌\",\"龍舌\",\"扁魚\",\"皇帝魚\",\"比目魚\"]', '魚貝類', '自動生成: 雙線鬚鰨 (僅台灣資料庫)', NULL, '雙線鬚鰨');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1779', '[\"雙髻鯊\",\"丫髻鯊(鮫)\",\"犛頭沙\",\"雙過仔\"]', '魚貝類', '自動生成: 雙髻鯊 (僅台灣資料庫)', NULL, '雙髻鯊');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1780', '[\"雙髻鯊腹肉\",\"丫髻鯊(鮫)\",\"犛頭沙\",\"雙髻鯊\",\"雙過仔\"]', '魚貝類', '自動生成: 雙髻鯊腹肉 (僅台灣資料庫)', NULL, '雙髻鯊腹肉');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1781', '[\"雜糧中筋麵粉\"]', '穀物類', '自動生成: 雜糧中筋麵粉 (僅台灣資料庫)', NULL, '雜糧中筋麵粉');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1782', '[\"雜糧高筋麵粉\"]', '穀物類', '自動生成: 雜糧高筋麵粉 (僅台灣資料庫)', NULL, '雜糧高筋麵粉');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1783', '[\"雞尾椎\",\"雞屁股\"]', '肉類', '自動生成: 雞尾椎 (僅台灣資料庫)', NULL, '雞尾椎');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1784', '[\"雞心(肉雞)\",\"雞心\"]', '肉類', '自動生成: 雞心(肉雞) (僅台灣資料庫)', NULL, '雞心(肉雞)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1785', '[\"雞心(肉雞)(2021年取樣)\",\"雞心\"]', '肉類', '自動生成: 雞心(肉雞)(2021年取樣) (僅台灣資料庫)', NULL, '雞心(肉雞)(2021年取樣)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1786', '[\"雞排(土雞)\",\"雞排\"]', '肉類', '自動生成: 雞排(土雞) (僅台灣資料庫)', NULL, '雞排(土雞)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1787', '[\"雞排(肉雞)\",\"雞排\"]', '肉類', '自動生成: 雞排(肉雞) (僅台灣資料庫)', NULL, '雞排(肉雞)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1788', '[\"雞排(肉雞)(2021年取樣)\",\"雞排\"]', '肉類', '自動生成: 雞排(肉雞)(2021年取樣) (僅台灣資料庫)', NULL, '雞排(肉雞)(2021年取樣)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1789', '[\"雞排平均值\"]', '肉類', '自動生成: 雞排平均值 (僅台灣資料庫)', NULL, '雞排平均值');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1794', '[\"雞油\"]', '油脂類', '自動生成: 雞油 (僅台灣資料庫)', NULL, '雞油');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1802', '[\"雞皮(肉雞)\",\"雞皮\"]', '肉類', '自動生成: 雞皮(肉雞) (僅台灣資料庫)', NULL, '雞皮(肉雞)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1805', '[\"雞睪丸\",\"雞子\",\"雞弗\"]', '肉類', '自動生成: 雞睪丸 (僅台灣資料庫)', NULL, '雞睪丸');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1806', '[\"雞精\"]', '加工調理食品及其他類', '自動生成: 雞精 (僅台灣資料庫)', NULL, '雞精');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1807', '[\"雞絞肉\"]', '肉類', '自動生成: 雞絞肉 (僅台灣資料庫)', NULL, '雞絞肉');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1808', '[\"雞絲麵\"]', '加工調理食品及其他類', '自動生成: 雞絲麵 (僅台灣資料庫)', NULL, '雞絲麵');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1812', '[\"雞肝(肉雞)\",\"雞肝\"]', '肉類', '自動生成: 雞肝(肉雞) (僅台灣資料庫)', NULL, '雞肝(肉雞)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1813', '[\"雞胗(肉雞)\",\"雞胗\",\"雞肫\"]', '肉類', '自動生成: 雞胗(肉雞) (僅台灣資料庫)', NULL, '雞胗(肉雞)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1814', '[\"雞胸骨湯\",\"雞高湯\"]', '肉類', '自動生成: 雞胸骨湯 (僅台灣資料庫)', NULL, '雞胸骨湯');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1815', '[\"雞腳(肉雞)\",\"雞腳\",\"雞爪\",\"鳳爪\"]', '肉類', '自動生成: 雞腳(肉雞) (僅台灣資料庫)', NULL, '雞腳(肉雞)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1816', '[\"雞腿菇\",\"雞腿(蘑)菇\",\"雞髀菇\",\"墨水菇\",\"一夜菇(毛頭鬼傘)\"]', '菇類', '自動生成: 雞腿菇 (僅台灣資料庫)', NULL, '雞腿菇');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1817', '[\"雞腿菇(乾)\",\"雞腿菇\",\"雞腿(蘑)菇\",\"雞髀菇\",\"墨水菇\",\"一夜菇(毛頭鬼傘)\"]', '菇類', '自動生成: 雞腿菇(乾) (僅台灣資料庫)', NULL, '雞腿菇(乾)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1818', '[\"雞膝軟骨(肉雞)\",\"雞膝軟骨\",\"雞軟骨\"]', '肉類', '自動生成: 雞膝軟骨(肉雞) (僅台灣資料庫)', NULL, '雞膝軟骨(肉雞)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1838', '[\"雪白菇\",\"美白菇\",\"白玉菇\"]', '菇類', '自動生成: 雪白菇 (僅台灣資料庫)', NULL, '雪白菇');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1839', '[\"雪白菇(長)\",\"雪白菇\",\"美白菇\",\"白精靈菇\"]', '菇類', '自動生成: 雪白菇(長) (僅台灣資料庫)', NULL, '雪白菇(長)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1840', '[\"雪螺\"]', '魚貝類', '自動生成: 雪螺 (僅台灣資料庫)', NULL, '雪螺');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1841', '[\"雪裡蕻\",\"雪裡(裏)紅\",\"雪菜\",\"多葉藺蕓苔\",\"千筋葉菜\",\"春不老\"]', '蔬菜類', '自動生成: 雪裡蕻 (僅台灣資料庫)', NULL, '雪裡蕻');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1842', '[\"雪餅\"]', '糕餅點心類', '自動生成: 雪餅 (僅台灣資料庫)', NULL, '雪餅');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1843', '[\"零食泡麵\"]', '糕餅點心類', '自動生成: 零食泡麵 (僅台灣資料庫)', NULL, '零食泡麵');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1844', '[\"青仁黑豆\",\"烏豆\",\"枝仔豆\",\"黑大豆\"]', '豆類', '自動生成: 青仁黑豆 (僅台灣資料庫)', NULL, '青仁黑豆');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1846', '[\"青星九刺鮨\",\"紅鱠\",\"紅格仔\",\"過魚\",\"石斑\",\"條舅\",\"紅條\",\"鱠仔(臺東)\"]', '魚貝類', '自動生成: 青星九刺鮨 (僅台灣資料庫)', NULL, '青星九刺鮨');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1847', '[\"青星九刺鮨平均值\",\"紅鱠(條/格)\",\"七星斑\",\"紅格仔\",\"過(鯌/髻/郭)魚\",\"石斑\",\"條舅\",\"青星九棘鱸\",\"仔石斑\",\"夕鱠\"]', '魚貝類', '自動生成: 青星九刺鮨平均值 (僅台灣資料庫)', NULL, '青星九刺鮨平均值');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1850', '[\"青梅(胭脂梅)\",\"青梅\",\"梅子\"]', '水果類', '自動生成: 青梅(胭脂梅) (僅台灣資料庫)', NULL, '青梅(胭脂梅)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1851', '[\"青江菜(土植)(10月取樣)\",\"青江菜\",\"江門白菜\",\"湯匙菜\",\"青梗白菜\"]', '蔬菜類', '自動生成: 青江菜(土植)(10月取樣) (僅台灣資料庫)', NULL, '青江菜(土植)(10月取樣)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1852', '[\"青江菜(土植)(1月取樣)\",\"青江菜\",\"江門白菜\",\"湯匙菜\",\"青梗白菜\"]', '蔬菜類', '自動生成: 青江菜(土植)(1月取樣) (僅台灣資料庫)', NULL, '青江菜(土植)(1月取樣)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1853', '[\"青江菜(土植)(3月取樣)\",\"青江菜\",\"江門白菜\",\"湯匙菜\",\"青梗白菜\"]', '蔬菜類', '自動生成: 青江菜(土植)(3月取樣) (僅台灣資料庫)', NULL, '青江菜(土植)(3月取樣)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1854', '[\"青江菜(土植)(4月取樣)\",\"青江菜\",\"江門白菜\",\"湯匙菜\",\"青梗白菜\"]', '蔬菜類', '自動生成: 青江菜(土植)(4月取樣) (僅台灣資料庫)', NULL, '青江菜(土植)(4月取樣)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1855', '[\"青江菜(土植)(7月取樣)\",\"青江菜\",\"江門白菜\",\"湯匙菜\",\"青梗白菜\"]', '蔬菜類', '自動生成: 青江菜(土植)(7月取樣) (僅台灣資料庫)', NULL, '青江菜(土植)(7月取樣)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1856', '[\"青江菜(有機)(10月取樣)\",\"青江菜\",\"江門白菜\",\"湯匙菜\",\"青梗白菜\"]', '蔬菜類', '自動生成: 青江菜(有機)(10月取樣) (僅台灣資料庫)', NULL, '青江菜(有機)(10月取樣)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1857', '[\"青江菜(有機)(1月取樣)\",\"青江菜\",\"江門白菜\",\"湯匙菜\",\"青梗白菜\"]', '蔬菜類', '自動生成: 青江菜(有機)(1月取樣) (僅台灣資料庫)', NULL, '青江菜(有機)(1月取樣)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1858', '[\"青江菜(有機)(4月取樣)\",\"青江菜\",\"江門白菜\",\"湯匙菜\",\"青梗白菜\"]', '蔬菜類', '自動生成: 青江菜(有機)(4月取樣) (僅台灣資料庫)', NULL, '青江菜(有機)(4月取樣)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1859', '[\"青江菜(有機)(7月取樣)\",\"青江菜\",\"江門白菜\",\"湯匙菜\",\"青梗白菜\"]', '蔬菜類', '自動生成: 青江菜(有機)(7月取樣) (僅台灣資料庫)', NULL, '青江菜(有機)(7月取樣)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1860', '[\"青江菜(水耕)(10月取樣)\",\"青江菜\",\"江門白菜\",\"湯匙菜\",\"青梗白菜\"]', '蔬菜類', '自動生成: 青江菜(水耕)(10月取樣) (僅台灣資料庫)', NULL, '青江菜(水耕)(10月取樣)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1861', '[\"青江菜(水耕)(1月取樣)\",\"青江菜\",\"江門白菜\",\"湯匙菜\",\"青梗白菜\"]', '蔬菜類', '自動生成: 青江菜(水耕)(1月取樣) (僅台灣資料庫)', NULL, '青江菜(水耕)(1月取樣)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1862', '[\"青江菜(水耕)(4月取樣)\",\"青江菜\",\"江門白菜\",\"湯匙菜\",\"青梗白菜\"]', '蔬菜類', '自動生成: 青江菜(水耕)(4月取樣) (僅台灣資料庫)', NULL, '青江菜(水耕)(4月取樣)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1863', '[\"青江菜(水耕)(7月取樣)\",\"青江菜\",\"江門白菜\",\"湯匙菜\",\"青梗白菜\"]', '蔬菜類', '自動生成: 青江菜(水耕)(7月取樣) (僅台灣資料庫)', NULL, '青江菜(水耕)(7月取樣)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1869', '[\"青葙\",\"野雞冠\",\"雞冠莧\",\"筆雞冠\",\"草決明\"]', '蔬菜類', '自動生成: 青葙 (僅台灣資料庫)', NULL, '青葙');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1870', '[\"青蒜\",\"蒜仔\",\"葫\",\"胡蒜\",\"洋蒜\",\"韭蔥\"]', '蔬菜類', '自動生成: 青蒜 (僅台灣資料庫)', NULL, '青蒜');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1871', '[\"青蔥(有機)\",\"青蔥\",\"蔥\",\"葉蔥\",\"蔥仔\"]', '蔬菜類', '自動生成: 青蔥(有機) (僅台灣資料庫)', NULL, '青蔥(有機)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1872', '[\"青蔥平均值\"]', '蔬菜類', '自動生成: 青蔥平均值 (僅台灣資料庫)', NULL, '青蔥平均值');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1874', '[\"青辣椒平均值\",\"辣椒\",\"番椒\",\"番仔薑\",\"臘椒(牛角辣椒\",\"羊角辣椒\",\"長辣(番)椒\",\"青辣椒)\"]', '蔬菜類', '自動生成: 青辣椒平均值 (僅台灣資料庫)', NULL, '青辣椒平均值');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1875', '[\"青醬\"]', '調味料及香辛料類', '自動生成: 青醬 (僅台灣資料庫)', NULL, '青醬');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1878', '[\"韓式泡菜\"]', '加工調理食品及其他類', '自動生成: 韓式泡菜 (僅台灣資料庫)', NULL, '韓式泡菜');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1879', '[\"韭花醬\"]', '調味料及香辛料類', '自動生成: 韭花醬 (僅台灣資料庫)', NULL, '韭花醬');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1881', '[\"韮菜\",\"韮\",\"塊莖蒜\",\"起陽草(韮/韭通用)\"]', '蔬菜類', '自動生成: 韮菜 (僅台灣資料庫)', NULL, '韮菜');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1882', '[\"韮菜花\",\"花韮菜\",\"韮花\",\"韭菜苔(韮/韭通用)\"]', '蔬菜類', '自動生成: 韮菜花 (僅台灣資料庫)', NULL, '韮菜花');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1883', '[\"韮黃\",\"黃韮菜\",\"白韮菜\",\"軟化韮菜(韮/韭通用)\"]', '蔬菜類', '自動生成: 韮黃 (僅台灣資料庫)', NULL, '韮黃');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1884', '[\"食茱萸\",\"刺楤\",\"紅刺楤\",\"刺江某\",\"越椒\",\"艾子\",\"茱萸\",\"刺公牡\"]', '蔬菜類', '自動生成: 食茱萸 (僅台灣資料庫)', NULL, '食茱萸');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1885', '[\"餐包\"]', '糕餅點心類', '自動生成: 餐包 (僅台灣資料庫)', NULL, '餐包');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1886', '[\"餘甘子\",\"油柑\",\"油甘\"]', '水果類', '自動生成: 餘甘子 (僅台灣資料庫)', NULL, '餘甘子');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1887', '[\"餛飩皮\"]', '加工調理食品及其他類', '自動生成: 餛飩皮 (僅台灣資料庫)', NULL, '餛飩皮');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1888', '[\"香吉士(進口)\",\"香吉士\",\"甜橙\",\"柳橙\",\"柳丁\",\"印子柑\",\"廣柑\"]', '水果類', '自動生成: 香吉士(進口) (僅台灣資料庫)', NULL, '香吉士(進口)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1889', '[\"香椿醬\"]', '調味料及香辛料類', '自動生成: 香椿醬 (僅台灣資料庫)', NULL, '香椿醬');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1890', '[\"香樁\",\"椿\",\"紅椿(樹)\",\"椿樹\",\"杶\",\"春芽(陽)樹\",\"椿樗\",\"櫄\",\"虎目樹\",\"大眼桐\",\"栲\",\"大紅椿樹\"]', '蔬菜類', '自動生成: 香樁 (僅台灣資料庫)', NULL, '香樁');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1891', '[\"香水李\",\"李子\"]', '水果類', '自動生成: 香水李 (僅台灣資料庫)', NULL, '香水李');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1893', '[\"香油\"]', '調味料及香辛料類', '自動生成: 香油 (僅台灣資料庫)', NULL, '香油');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1894', '[\"香瓜茄\",\"香瓜梨\",\"南美香瓜梨\"]', '蔬菜類', '自動生成: 香瓜茄 (僅台灣資料庫)', NULL, '香瓜茄');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1898', '[\"香芋冬瓜\",\"白瓜\",\"東瓜\",\"枕瓜\",\"水芝\",\"地芝\"]', '蔬菜類', '自動生成: 香芋冬瓜 (僅台灣資料庫)', NULL, '香芋冬瓜');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1899', '[\"香芫荽\"]', '蔬菜類', '自動生成: 香芫荽 (僅台灣資料庫)', NULL, '香芫荽');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1900', '[\"香草冰淇淋\"]', '糕餅點心類', '自動生成: 香草冰淇淋 (僅台灣資料庫)', NULL, '香草冰淇淋');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1901', '[\"香菇(大)\",\"香菇\",\"冬(北/花/厚/毛)菇\",\"椎茸\",\"香蕈(信/椹)\",\"合蕈\"]', '菇類', '自動生成: 香菇(大) (僅台灣資料庫)', NULL, '香菇(大)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1902', '[\"香菇(小)\",\"香菇\",\"冬(北/花/厚/毛)菇\",\"椎茸\",\"香蕈(信/椹)\",\"合蕈\"]', '菇類', '自動生成: 香菇(小) (僅台灣資料庫)', NULL, '香菇(小)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1903', '[\"香菇平均值\",\"冬(北/花/厚/毛)菇\",\"椎茸\",\"香蕈(信/椹)\",\"合蕈\"]', '菇類', '自動生成: 香菇平均值 (僅台灣資料庫)', NULL, '香菇平均值');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1904', '[\"香菇麵筋罐頭\"]', '加工調理食品及其他類', '自動生成: 香菇麵筋罐頭 (僅台灣資料庫)', NULL, '香菇麵筋罐頭');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1905', '[\"香華洋香瓜\",\"甜瓜\",\"甘瓜\",\"果瓜\",\"香瓜\",\"梨仔瓜\",\"澎湖瓜\",\"洋香瓜\",\"網仔瓜\",\"哈蜜瓜\"]', '水果類', '自動生成: 香華洋香瓜 (僅台灣資料庫)', NULL, '香華洋香瓜');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1906', '[\"香螺 \",\"香螺\",\"小天狗剌螺\",\"雪螺\"]', '魚貝類', '自動生成: 香螺  (僅台灣資料庫)', NULL, '香螺 ');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1910', '[\"馬拉巴笛鯛\",\"赤海\",\"赤筆仔\"]', '魚貝類', '自動生成: 馬拉巴笛鯛 (僅台灣資料庫)', NULL, '馬拉巴笛鯛');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1914', '[\"馬齒莧\",\"豬母乳(菜/草)\",\"寶釧菜\",\"長命菜\",\"荷蘭菜\",\"馬尺莧\",\"瓜子菜\",\"五行(才)草\",\"馬子菜\",\"地馬菜\",\"醬瓣頭草\"]', '蔬菜類', '自動生成: 馬齒莧 (僅台灣資料庫)', NULL, '馬齒莧');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1915', '[\"駝背鱸\",\"老鼠斑\",\"鰵魚\",\"烏丸稅\",\"尖嘴鱠仔\",\"觀音鱠\",\"斟鰻鱠(澎湖)\"]', '魚貝類', '自動生成: 駝背鱸 (僅台灣資料庫)', NULL, '駝背鱸');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1916', '[\"骨腿(土雞)\",\"骨腿\",\"雞腿\"]', '肉類', '自動生成: 骨腿(土雞) (僅台灣資料庫)', NULL, '骨腿(土雞)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1917', '[\"骨腿(肉雞)\",\"骨腿\",\"雞腿\"]', '肉類', '自動生成: 骨腿(肉雞) (僅台灣資料庫)', NULL, '骨腿(肉雞)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1918', '[\"骨腿平均值\"]', '肉類', '自動生成: 骨腿平均值 (僅台灣資料庫)', NULL, '骨腿平均值');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1920', '[\"高山甜椒(青皮)\",\"高山甜椒\",\"甜椒\",\"甜番椒\",\"大同仔\",\"番羌仔\",\"燈籠椒\",\"生番薑\",\"獅子椒\",\"甘椒\",\"生椒(青椒\",\"青辣椒)\"]', '蔬菜類', '自動生成: 高山甜椒(青皮) (僅台灣資料庫)', NULL, '高山甜椒(青皮)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1921', '[\"高梁\"]', '穀物類', '自動生成: 高梁 (僅台灣資料庫)', NULL, '高梁');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1923', '[\"高油酸棕櫚油\"]', '油脂類', '自動生成: 高油酸棕櫚油 (僅台灣資料庫)', NULL, '高油酸棕櫚油');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1924', '[\"高油酸紅花籽油\"]', '油脂類', '自動生成: 高油酸紅花籽油 (僅台灣資料庫)', NULL, '高油酸紅花籽油');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1925', '[\"高油酸葵花籽油\"]', '油脂類', '自動生成: 高油酸葵花籽油 (僅台灣資料庫)', NULL, '高油酸葵花籽油');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1926', '[\"高油酸豬油\"]', '油脂類', '自動生成: 高油酸豬油 (僅台灣資料庫)', NULL, '高油酸豬油');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1927', '[\"高湯(豬大骨)\",\"高湯\"]', '調味料及香辛料類', '自動生成: 高湯(豬大骨) (僅台灣資料庫)', NULL, '高湯(豬大骨)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1928', '[\"高湯塊(排骨)\",\"高湯塊\"]', '調味料及香辛料類', '自動生成: 高湯塊(排骨) (僅台灣資料庫)', NULL, '高湯塊(排骨)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1930', '[\"高牆桶柑\",\"年柑\",\"草山柑\",\"焦柑\",\"蜜桶\",\"漳柑\",\"草山桔(桶柑)\"]', '水果類', '自動生成: 高牆桶柑 (僅台灣資料庫)', NULL, '高牆桶柑');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1931', '[\"高筋麵粉\"]', '穀物類', '自動生成: 高筋麵粉 (僅台灣資料庫)', NULL, '高筋麵粉');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1932', '[\"高筋麵粉(2021年取樣)\",\"高筋麵粉\",\"強力粉\"]', '穀物類', '自動生成: 高筋麵粉(2021年取樣) (僅台灣資料庫)', NULL, '高筋麵粉(2021年取樣)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1934', '[\"高纖胚芽冬粉\",\"粉絲\"]', '加工調理食品及其他類', '自動生成: 高纖胚芽冬粉 (僅台灣資料庫)', NULL, '高纖胚芽冬粉');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1935', '[\"高脂保久乳\",\"牛乳\",\"牛奶\"]', '乳品類', '自動生成: 高脂保久乳 (僅台灣資料庫)', NULL, '高脂保久乳');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1936', '[\"高脂凝態發酵乳(纖維強化)\",\"高脂凝態發酵乳\",\"優格\"]', '乳品類', '自動生成: 高脂凝態發酵乳(纖維強化) (僅台灣資料庫)', NULL, '高脂凝態發酵乳(纖維強化)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1937', '[\"高脂強化鮮乳(寡醣強化)\",\"高脂強化鮮乳\",\"牛乳\",\"牛奶\"]', '乳品類', '自動生成: 高脂強化鮮乳(寡醣強化) (僅台灣資料庫)', NULL, '高脂強化鮮乳(寡醣強化)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1938', '[\"高脂強化鮮乳(鈣強化)\",\"高脂強化鮮乳\",\"牛乳\",\"牛奶\"]', '乳品類', '自動生成: 高脂強化鮮乳(鈣強化) (僅台灣資料庫)', NULL, '高脂強化鮮乳(鈣強化)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1939', '[\"高脂鮮乳\",\"牛乳\",\"牛奶\"]', '乳品類', '自動生成: 高脂鮮乳 (僅台灣資料庫)', NULL, '高脂鮮乳');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1940', '[\"高脂鮮羊乳\",\"羊奶\"]', '乳品類', '自動生成: 高脂鮮羊乳 (僅台灣資料庫)', NULL, '高脂鮮羊乳');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1941', '[\"高鮮味精\"]', '調味料及香辛料類', '自動生成: 高鮮味精 (僅台灣資料庫)', NULL, '高鮮味精');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1942', '[\"高麗馬加鰆\",\"破北\",\"闊北\",\"闊腹仔\",\"高麗鰆\",\"破腹\"]', '魚貝類', '自動生成: 高麗馬加鰆 (僅台灣資料庫)', NULL, '高麗馬加鰆');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1943', '[\"髮菜\",\"頭髮菜\",\"紅毛菜\",\"發菜\"]', '藻類', '自動生成: 髮菜 (僅台灣資料庫)', NULL, '髮菜');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1944', '[\"鬆餅\"]', '糕餅點心類', '自動生成: 鬆餅 (僅台灣資料庫)', NULL, '鬆餅');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1945', '[\"鬍鯰\",\"鬍子鯰\",\"土殺\",\"本土土虱\",\"塘虱魚\"]', '魚貝類', '自動生成: 鬍鯰 (僅台灣資料庫)', NULL, '鬍鯰');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1948', '[\"鬼頭刀\",\"鱰魚\",\"萬魚\",\"飛烏虎\",\"鬼頭刀(臺東)\",\"鱰\",\"萬引\",\"扁頭刀(澎湖)\",\"九萬仔(澎湖)\"]', '魚貝類', '自動生成: 鬼頭刀 (僅台灣資料庫)', NULL, '鬼頭刀');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1965', '[\"鮟鱇\"]', '魚貝類', '自動生成: 鮟鱇 (僅台灣資料庫)', NULL, '鮟鱇');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1970', '[\"鮮味露\"]', '調味料及香辛料類', '自動生成: 鮮味露 (僅台灣資料庫)', NULL, '鮮味露');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1971', '[\"鮮奶可可\",\"巧克力牛奶\",\"阿華田拿鐵\"]', '乳品類', '自動生成: 鮮奶可可 (僅台灣資料庫)', NULL, '鮮奶可可');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1972', '[\"鮮奶布丁\",\"白布丁\"]', '糕餅點心類', '自動生成: 鮮奶布丁 (僅台灣資料庫)', NULL, '鮮奶布丁');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1974', '[\"鮮雞精\"]', '調味料及香辛料類', '自動生成: 鮮雞精 (僅台灣資料庫)', NULL, '鮮雞精');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1975', '[\"鮸\",\"鮸仔\",\"敏魚\",\"米魚\",\"水鮸仔\"]', '魚貝類', '自動生成: 鮸 (僅台灣資料庫)', NULL, '鮸');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1977', '[\"鯉\",\"鮘仔\",\"在來鯉\",\"財神魚\"]', '魚貝類', '自動生成: 鯉 (僅台灣資料庫)', NULL, '鯉');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1986', '[\"鯔(2月)\",\"鯔\",\"青頭仔(幼魚)\",\"奇目仔(成魚)\",\"信魚\",\"正烏\",\"烏魚\",\"正頭烏\",\"回頭烏\",\"大烏(澎湖)\"]', '魚貝類', '自動生成: 鯔(2月) (僅台灣資料庫)', NULL, '鯔(2月)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1987', '[\"鯔(4月)\",\"鯔\",\"青頭仔(幼魚)\",\"奇目仔(成魚)\",\"信魚\",\"正烏\",\"烏魚\",\"正頭烏\",\"回頭烏\",\"大烏(澎湖)\"]', '魚貝類', '自動生成: 鯔(4月) (僅台灣資料庫)', NULL, '鯔(4月)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1988', '[\"鯔(8月)\",\"鯔\",\"青頭仔(幼魚)\",\"奇目仔(成魚)\",\"信魚\",\"正烏\",\"烏魚\",\"正頭烏\",\"回頭烏\",\"大烏(澎湖)\"]', '魚貝類', '自動生成: 鯔(8月) (僅台灣資料庫)', NULL, '鯔(8月)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1989', '[\"鯔(含皮)\",\"鯔\",\"青頭仔(幼魚)\",\"奇目仔(成魚)\",\"信魚\",\"正烏\",\"烏魚\",\"正頭烏\",\"回頭烏\",\"大烏(澎湖)\"]', '魚貝類', '自動生成: 鯔(含皮) (僅台灣資料庫)', NULL, '鯔(含皮)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1990', '[\"鯔切片\",\"青頭仔(幼魚)\",\"奇目仔(成魚)\",\"信魚\",\"正烏\",\"烏魚\",\"正頭烏\",\"回頭烏\",\"大烏(澎湖)\"]', '魚貝類', '自動生成: 鯔切片 (僅台灣資料庫)', NULL, '鯔切片');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1991', '[\"鯔平均值(去皮)\",\"鯔平均值\",\"烏(鯔/信/聖)魚\",\"青頭仔(幼魚)\",\"奇目仔(成魚)\",\"正(大)烏\",\"正(回)頭烏\",\"日本鯔\"]', '魚貝類', '自動生成: 鯔平均值(去皮) (僅台灣資料庫)', NULL, '鯔平均值(去皮)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2015', '[\"鱅\",\"黑鰱\",\"大頭鰱(魚)\",\"花鰱\",\"胖頭鰱\"]', '魚貝類', '自動生成: 鱅 (僅台灣資料庫)', NULL, '鱅');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2016', '[\"鱖\"]', '魚貝類', '自動生成: 鱖 (僅台灣資料庫)', NULL, '鱖');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2017', '[\"鱗網帶鰆(含皮)\",\"鱗網帶鰆\",\"油魚\",\"細鱗仔\",\"玉梭魚\",\"白玉豚\"]', '魚貝類', '自動生成: 鱗網帶鰆(含皮) (僅台灣資料庫)', NULL, '鱗網帶鰆(含皮)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2018', '[\"鱗網帶鰆切片\",\"油魚\",\"細鱗仔\",\"玉梭魚\",\"白玉豚\"]', '魚貝類', '自動生成: 鱗網帶鰆切片 (僅台灣資料庫)', NULL, '鱗網帶鰆切片');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2022', '[\"鱷形叉尾鶴鱵\",\"青旗\",\"學仔\",\"白天青旗\",\"圓學(澎湖)\"]', '魚貝類', '自動生成: 鱷形叉尾鶴鱵 (僅台灣資料庫)', NULL, '鱷形叉尾鶴鱵');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2024', '[\"鳳尾藻\",\"紫晶藻\"]', '藻類', '自動生成: 鳳尾藻 (僅台灣資料庫)', NULL, '鳳尾藻');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2031', '[\"鳳眼糕\"]', '糕餅點心類', '自動生成: 鳳眼糕 (僅台灣資料庫)', NULL, '鳳眼糕');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2032', '[\"鴕腩肉\"]', '肉類', '自動生成: 鴕腩肉 (僅台灣資料庫)', NULL, '鴕腩肉');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2033', '[\"鴕腱肉\",\"屈肌\",\"伸肌\"]', '肉類', '自動生成: 鴕腱肉 (僅台灣資料庫)', NULL, '鴕腱肉');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2034', '[\"鴕鳥沙朗肉排\"]', '肉類', '自動生成: 鴕鳥沙朗肉排 (僅台灣資料庫)', NULL, '鴕鳥沙朗肉排');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2035', '[\"鴕鳥菲力肉排\",\"鴕鳥腓力\",\"鴕鳥里肌肉\"]', '肉類', '自動生成: 鴕鳥菲力肉排 (僅台灣資料庫)', NULL, '鴕鳥菲力肉排');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2040', '[\"鴨翅\"]', '肉類', '自動生成: 鴨翅 (僅台灣資料庫)', NULL, '鴨翅');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2041', '[\"鴨胗\",\"鴨肫\"]', '肉類', '自動生成: 鴨胗 (僅台灣資料庫)', NULL, '鴨胗');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2042', '[\"鴨腸\"]', '肉類', '自動生成: 鴨腸 (僅台灣資料庫)', NULL, '鴨腸');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2043', '[\"鴨腿\"]', '肉類', '自動生成: 鴨腿 (僅台灣資料庫)', NULL, '鴨腿');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2044', '[\"鴨舌\"]', '肉類', '自動生成: 鴨舌 (僅台灣資料庫)', NULL, '鴨舌');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2048', '[\"鴨血\"]', '肉類', '自動生成: 鴨血 (僅台灣資料庫)', NULL, '鴨血');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2049', '[\"鴨血糕\",\"米血糕\"]', '加工調理食品及其他類', '自動生成: 鴨血糕 (僅台灣資料庫)', NULL, '鴨血糕');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2050', '[\"鴨賞\"]', '加工調理食品及其他類', '自動生成: 鴨賞 (僅台灣資料庫)', NULL, '鴨賞');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2051', '[\"鴨頭\"]', '肉類', '自動生成: 鴨頭 (僅台灣資料庫)', NULL, '鴨頭');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2054', '[\"鴻喜菇\",\"紅喜菇\",\"真姬菇\",\"斑玉蕈\",\"玉蕈\",\"膠玉蘑\",\"蟹味菇\",\"海鮮菇\",\"假松茸\",\"松茸菇\",\"榆菇\",\"靈芝菇\",\"黑真珠\"]', '菇類', '自動生成: 鴻喜菇 (僅台灣資料庫)', NULL, '鴻喜菇');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2056', '[\"鵝心\"]', '肉類', '自動生成: 鵝心 (僅台灣資料庫)', NULL, '鵝心');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2057', '[\"鵝肉\"]', '肉類', '自動生成: 鵝肉 (僅台灣資料庫)', NULL, '鵝肉');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2058', '[\"鵝肝\"]', '肉類', '自動生成: 鵝肝 (僅台灣資料庫)', NULL, '鵝肝');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2059', '[\"鵝胗\",\"鵝肫\"]', '肉類', '自動生成: 鵝胗 (僅台灣資料庫)', NULL, '鵝胗');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2060', '[\"鵝胸肉\"]', '肉類', '自動生成: 鵝胸肉 (僅台灣資料庫)', NULL, '鵝胸肉');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2061', '[\"鵝腸\"]', '肉類', '自動生成: 鵝腸 (僅台灣資料庫)', NULL, '鵝腸');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2062', '[\"鵝腿肉\"]', '肉類', '自動生成: 鵝腿肉 (僅台灣資料庫)', NULL, '鵝腿肉');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2070', '[\"鵲豆莢\",\"肉(扁/藊)豆\",\"峨(蛾/花)眉豆\",\"沿(延)籬豆\",\"隱元豆\",\"膨皮豆\"]', '豆類', '自動生成: 鵲豆莢 (僅台灣資料庫)', NULL, '鵲豆莢');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2071', '[\"鶯哥桃\",\"桃子\",\"脆桃\",\"甜桃\"]', '水果類', '自動生成: 鶯哥桃 (僅台灣資料庫)', NULL, '鶯哥桃');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2072', '[\"鷹嘴豆\",\"雪蓮子\",\"埃及豆\",\"馬豆\",\"桃爾豆\",\"雞心豆\",\"雞豆\",\"雞屁股豆\"]', '豆類', '自動生成: 鷹嘴豆 (僅台灣資料庫)', NULL, '鷹嘴豆');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2073', '[\"鹹小卷\",\"鹹鎖管\",\"鹽漬小卷\"]', '加工調理食品及其他類', '自動生成: 鹹小卷 (僅台灣資料庫)', NULL, '鹹小卷');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2075', '[\"鹹麻糬\"]', '糕餅點心類', '自動生成: 鹹麻糬 (僅台灣資料庫)', NULL, '鹹麻糬');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2076', '[\"鹼粽\"]', '加工調理食品及其他類', '自動生成: 鹼粽 (僅台灣資料庫)', NULL, '鹼粽');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2083', '[\"麒麟菜\",\"麒麟草\",\"海麒麟草\",\"海珊湖\",\"珊湖藻(草)\",\"鹹(鹽/神/福)草\"]', '藻類', '自動生成: 麒麟菜 (僅台灣資料庫)', NULL, '麒麟菜');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2084', '[\"麥奇鈎吻鮭(去皮)\",\"麥奇鈎吻鮭\",\"鱒魚\",\"虹鱒\",\"麥奇鉤吻鱒\"]', '魚貝類', '自動生成: 麥奇鈎吻鮭(去皮) (僅台灣資料庫)', NULL, '麥奇鈎吻鮭(去皮)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2085', '[\"麥奇鈎吻鮭(含皮)\",\"麥奇鈎吻鮭\",\"鱒魚\",\"虹鱒\",\"麥奇鉤吻鱒\"]', '魚貝類', '自動生成: 麥奇鈎吻鮭(含皮) (僅台灣資料庫)', NULL, '麥奇鈎吻鮭(含皮)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2086', '[\"麥片沖泡包(三合一)\",\"麥片沖泡包\"]', '加工調理食品及其他類', '自動生成: 麥片沖泡包(三合一) (僅台灣資料庫)', NULL, '麥片沖泡包(三合一)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2091', '[\"麵筋(未調味)\",\"麵筋\"]', '加工調理食品及其他類', '自動生成: 麵筋(未調味) (僅台灣資料庫)', NULL, '麵筋(未調味)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2092', '[\"麵線\"]', '加工調理食品及其他類', '自動生成: 麵線 (僅台灣資料庫)', NULL, '麵線');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2093', '[\"麵腸(未調味)\",\"麵腸\"]', '加工調理食品及其他類', '自動生成: 麵腸(未調味) (僅台灣資料庫)', NULL, '麵腸(未調味)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2095', '[\"麻婆醬\"]', '調味料及香辛料類', '自動生成: 麻婆醬 (僅台灣資料庫)', NULL, '麻婆醬');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2099', '[\"麻醬\",\"芝麻醬\"]', '調味料及香辛料類', '自動生成: 麻醬 (僅台灣資料庫)', NULL, '麻醬');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2100', '[\"黃仁黑豆\",\"烏豆\",\"枝仔豆\",\"黑大豆\"]', '豆類', '自動生成: 黃仁黑豆 (僅台灣資料庫)', NULL, '黃仁黑豆');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2102', '[\"黃布丁\",\"雞蛋布丁\"]', '糕餅點心類', '自動生成: 黃布丁 (僅台灣資料庫)', NULL, '黃布丁');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2103', '[\"黃擬烏尾鮗\",\"黃雞仔\",\"包公雞\",\"貢仔\",\"黃腳佳仔\",\"黃加甲(臺東)\",\"烏尾冬/青雞仔(澎湖)\"]', '魚貝類', '自動生成: 黃擬烏尾鮗 (僅台灣資料庫)', NULL, '黃擬烏尾鮗');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2104', '[\"黃櫛瓜\"]', '蔬菜類', '自動生成: 黃櫛瓜 (僅台灣資料庫)', NULL, '黃櫛瓜');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2109', '[\"黃秋葵\",\"秋葵\",\"羊角豆\",\"黃蜀葵\",\"食香槿\",\"假三念\",\"黃葵\"]', '蔬菜類', '自動生成: 黃秋葵 (僅台灣資料庫)', NULL, '黃秋葵');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2110', '[\"黃耆水\"]', '調味料及香辛料類', '自動生成: 黃耆水 (僅台灣資料庫)', NULL, '黃耆水');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2111', '[\"黃耆片\"]', '調味料及香辛料類', '自動生成: 黃耆片 (僅台灣資料庫)', NULL, '黃耆片');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2112', '[\"黃肉李\",\"李子\"]', '水果類', '自動生成: 黃肉李 (僅台灣資料庫)', NULL, '黃肉李');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2113', '[\"黃肉甘藷\",\"甘薯\",\"番薯\",\"甜薯\",\"地瓜\",\"田薯\",\"土薯\"]', '澱粉類', '自動生成: 黃肉甘藷 (僅台灣資料庫)', NULL, '黃肉甘藷');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2115', '[\"黃芥茉醬\"]', '調味料及香辛料類', '自動生成: 黃芥茉醬 (僅台灣資料庫)', NULL, '黃芥茉醬');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2122', '[\"黃金小蕃茄\",\"柑(甘)仔蜜\",\"草(番\",\"西紅\",\"六月)柿\",\"臭柿仔\",\"小金瓜\",\"洋柿(茄)子\",\"紅茄\",\"毛臘果\"]', '蔬菜類', '自動生成: 黃金小蕃茄 (僅台灣資料庫)', NULL, '黃金小蕃茄');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2123', '[\"黃金果\",\"黃晶果\"]', '水果類', '自動生成: 黃金果 (僅台灣資料庫)', NULL, '黃金果');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2124', '[\"黃金泡菜\"]', '加工調理食品及其他類', '自動生成: 黃金泡菜 (僅台灣資料庫)', NULL, '黃金泡菜');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2126', '[\"黃金菾菜\",\"黃金火焰菜\",\"君達菜\",\"甜菜\"]', '蔬菜類', '自動生成: 黃金菾菜 (僅台灣資料庫)', NULL, '黃金菾菜');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2127', '[\"黃香瓜\",\"甜瓜\",\"甘瓜\",\"果瓜\",\"香瓜\",\"梨仔瓜\",\"澎湖瓜\"]', '水果類', '自動生成: 黃香瓜 (僅台灣資料庫)', NULL, '黃香瓜');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2128', '[\"黃鰭棘鯛\",\"黃鰭鯛\",\"黃鰭\",\"赤翅仔\",\"赤翅\",\"花身\",\"鏡鯛\"]', '魚貝類', '自動生成: 黃鰭棘鯛 (僅台灣資料庫)', NULL, '黃鰭棘鯛');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2129', '[\"黃鱔\",\"鱔魚\",\"田鱔\",\"田鰻\",\"長魚\",\"血魚\",\"羅魚\",\"無鱗公子\"]', '魚貝類', '自動生成: 黃鱔 (僅台灣資料庫)', NULL, '黃鱔');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2130', '[\"黑巧克力(85%)\",\"黑巧克力\"]', '糕餅點心類', '自動生成: 黑巧克力(85%) (僅台灣資料庫)', NULL, '黑巧克力(85%)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2131', '[\"黑斑海緋鯉\",\"秋姑\",\"鬚哥\",\"黑點秋哥/外海秋哥(澎湖)\"]', '魚貝類', '自動生成: 黑斑海緋鯉 (僅台灣資料庫)', NULL, '黑斑海緋鯉');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2132', '[\"黑李\",\"李子\"]', '水果類', '自動生成: 黑李 (僅台灣資料庫)', NULL, '黑李');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2134', '[\"黑棗(乾)\",\"黑棗\",\"大棗\",\"棗仔\"]', '水果類', '自動生成: 黑棗(乾) (僅台灣資料庫)', NULL, '黑棗(乾)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2136', '[\"黑棘鯛(去皮)\",\"黑棘鯛\",\"黑鯛\",\"烏格\",\"黑格\",\"厚唇\",\"烏毛\",\"烏鱠\",\"黑頰(澎湖)\"]', '魚貝類', '自動生成: 黑棘鯛(去皮) (僅台灣資料庫)', NULL, '黑棘鯛(去皮)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2137', '[\"黑棘鯛(含皮)\",\"黑棘鯛\",\"黑鯛\",\"烏格\",\"黑格\",\"厚唇\",\"烏毛\",\"烏鱠\",\"黑頰(澎湖)\"]', '魚貝類', '自動生成: 黑棘鯛(含皮) (僅台灣資料庫)', NULL, '黑棘鯛(含皮)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2139', '[\"黑烏參\"]', '魚貝類', '自動生成: 黑烏參 (僅台灣資料庫)', NULL, '黑烏參');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2157', '[\"黑葉仔荔枝\",\"丹荔\",\"荔錦\",\"麗枝\",\"離枝\"]', '水果類', '自動生成: 黑葉仔荔枝 (僅台灣資料庫)', NULL, '黑葉仔荔枝');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2158', '[\"黑葉白菜(短梗)\",\"黑葉白菜\",\"白菜\",\"青菜\",\"散葉白菜\",\"無心菜\",\"菘\",\"不結球白菜\"]', '蔬菜類', '自動生成: 黑葉白菜(短梗) (僅台灣資料庫)', NULL, '黑葉白菜(短梗)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2159', '[\"黑豆干\"]', '加工調理食品及其他類', '自動生成: 黑豆干 (僅台灣資料庫)', NULL, '黑豆干');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2160', '[\"黑豆油膏\",\"蔭油膏\"]', '調味料及香辛料類', '自動生成: 黑豆油膏 (僅台灣資料庫)', NULL, '黑豆油膏');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2161', '[\"黑豆粉\",\"烏豆\",\"枝仔豆\",\"黑大豆\"]', '豆類', '自動生成: 黑豆粉 (僅台灣資料庫)', NULL, '黑豆粉');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2162', '[\"黑豆胚芽\"]', '豆類', '自動生成: 黑豆胚芽 (僅台灣資料庫)', NULL, '黑豆胚芽');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2163', '[\"黑豆芽\"]', '蔬菜類', '自動生成: 黑豆芽 (僅台灣資料庫)', NULL, '黑豆芽');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2168', '[\"黑麥汁\"]', '飲料類', '自動生成: 黑麥汁 (僅台灣資料庫)', NULL, '黑麥汁');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2169', '[\"黑麥片\"]', '穀物類', '自動生成: 黑麥片 (僅台灣資料庫)', NULL, '黑麥片');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2171', '[\"黑䱛 \",\"黑䱛\",\"黑口\",\"烏喉\",\"黑喉(臺東)\",\"加正\",\"烏加網\",\"黑喉\",\"臭魚\"]', '魚貝類', '自動生成: 黑䱛  (僅台灣資料庫)', NULL, '黑䱛 ');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2172', '[\"龍延草\"]', '蔬菜類', '自動生成: 龍延草 (僅台灣資料庫)', NULL, '龍延草');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2175', '[\"龍葵\",\"黑甜菜\",\"烏甜(田)菜\",\"烏甜仔\",\"烏子(克)菜\",\"烏子茄\",\"苦葵(菜)\",\"天茄子\",\"天泡草\",\"老鴉酸漿草\"]', '蔬菜類', '自動生成: 龍葵 (僅台灣資料庫)', NULL, '龍葵');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2178', '[\"龍骨瓣莕菜\",\"水蓮菜\",\"野蓮\",\"銀蓮花\",\"水皮蓮\",\"刺種莕菜\",\"捲瓣莕菜\"]', '蔬菜類', '自動生成: 龍骨瓣莕菜 (僅台灣資料庫)', NULL, '龍骨瓣莕菜');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2180', '[\"Abiyuch\",\"abiyuch\",\"Crateva religiosa\"]', 'Fruits', '自動生成: Abiyuch (僅 FooDB)', 'Abiyuch', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2181', '[\"Acerola\",\"acerola\",\"Malpighia emarginata\"]', 'Fruits', '自動生成: Acerola (僅 FooDB)', 'Acerola', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2182', '[\"Acorn squash\",\"acorn squash\",\"Cucurbita pepo var. turbinata\"]', 'Gourds', '自動生成: Acorn squash (僅 FooDB)', 'Acorn squash', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2183', '[\"Adobo\",\"adobo\"]', 'Baking goods', '自動生成: Adobo (僅 FooDB)', 'Adobo', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2184', '[\"Adzuki bean\",\"adzuki bean\",\"Vigna angularis\"]', 'Pulses', '自動生成: Adzuki bean (僅 FooDB)', 'Adzuki bean', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2185', '[\"Agar\",\"agar\",\"Eucheuma\"]', 'Aquatic foods', '自動生成: Agar (僅 FooDB)', 'Agar', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2186', '[\"Agave\",\"agave\"]', 'Vegetables', '自動生成: Agave (僅 FooDB)', 'Agave', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2187', '[\"Akutaq\",\"akutaq\"]', 'Confectioneries', '自動生成: Akutaq (僅 FooDB)', 'Akutaq', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2188', '[\"Alaska blueberry\",\"alaska blueberry\",\"Vaccinium alaskaense\"]', 'Fruits', '自動生成: Alaska blueberry (僅 FooDB)', 'Alaska blueberry', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2189', '[\"Alaska pollock\",\"alaska pollock\",\"Theragra chalcogramma\"]', 'Aquatic foods', '自動生成: Alaska pollock (僅 FooDB)', 'Alaska pollock', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2190', '[\"Alaska wild rhubarb\",\"alaska wild rhubarb\",\"Polygonum alpinum\"]', 'Vegetables', '自動生成: Alaska wild rhubarb (僅 FooDB)', 'Alaska wild rhubarb', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2191', '[\"Albizia gummifera\",\"albizia gummifera\"]', 'Vegetables', '自動生成: Albizia gummifera (僅 FooDB)', 'Albizia gummifera', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2192', '[\"Alcoholic beverages\",\"alcoholic beverages\"]', 'Beverages', '自動生成: Alcoholic beverages (僅 FooDB)', 'Alcoholic beverages', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2193', '[\"Alfalfa\",\"alfalfa\",\"Medicago sativa\"]', 'Herbs and Spices', '自動生成: Alfalfa (僅 FooDB)', 'Alfalfa', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2194', '[\"Allium\",\"allium\"]', 'Vegetables', '自動生成: Allium (僅 FooDB)', 'Allium', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2195', '[\"Allspice\",\"allspice\",\"Pimenta dioica\"]', 'Herbs and Spices', '自動生成: Allspice (僅 FooDB)', 'Allspice', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2196', '[\"Alpine sweetvetch\",\"alpine sweetvetch\",\"Hedysarum alpinum\"]', 'Vegetables', '自動生成: Alpine sweetvetch (僅 FooDB)', 'Alpine sweetvetch', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2197', '[\"Amaranth\",\"amaranth\",\"Amaranthus\"]', 'Herbs and Spices', '自動生成: Amaranth (僅 FooDB)', 'Amaranth', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2198', '[\"American cranberry\",\"american cranberry\",\"Vaccinium macrocarpon\"]', 'Fruits', '自動生成: American cranberry (僅 FooDB)', 'American cranberry', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2199', '[\"American lobster\",\"american lobster\",\"Homarus americanus\"]', 'Aquatic foods', '自動生成: American lobster (僅 FooDB)', 'American lobster', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2200', '[\"American pokeweed\",\"american pokeweed\",\"Phytolacca americana\"]', 'Vegetables', '自動生成: American pokeweed (僅 FooDB)', 'American pokeweed', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2201', '[\"American shad\",\"american shad\",\"Alosa sapidissima\"]', 'Aquatic foods', '自動生成: American shad (僅 FooDB)', 'American shad', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2202', '[\"Anatidae\",\"anatidae\"]', 'Animal foods', '自動生成: Anatidae (僅 FooDB)', 'Anatidae', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2203', '[\"Anchovy\",\"anchovy\",\"Engraulidae\"]', 'Aquatic foods', '自動生成: Anchovy (僅 FooDB)', 'Anchovy', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2204', '[\"Andean blackberry\",\"andean blackberry\",\"Rubus glaucus\"]', 'Fruits', '自動生成: Andean blackberry (僅 FooDB)', 'Andean blackberry', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2205', '[\"Angelica\",\"angelica\",\"Angelica keiskei\"]', 'Herbs and Spices', '自動生成: Angelica (僅 FooDB)', 'Angelica', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2206', '[\"Anguilliformes\",\"anguilliformes\"]', 'Aquatic foods', '自動生成: Anguilliformes (僅 FooDB)', 'Anguilliformes', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2207', '[\"Anise\",\"anise\",\"Pimpinella anisum\"]', 'Herbs and Spices', '自動生成: Anise (僅 FooDB)', 'Anise', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2208', '[\"Apple cider\",\"apple cider\"]', 'Beverages', '自動生成: Apple cider (僅 FooDB)', 'Apple cider', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2209', '[\"Apricot\",\"apricot\",\"Prunus armeniaca\"]', 'Fruits', '自動生成: Apricot (僅 FooDB)', 'Apricot', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2210', '[\"Arctic blackberry\",\"arctic blackberry\",\"Rubus arcticus\"]', 'Fruits', '自動生成: Arctic blackberry (僅 FooDB)', 'Arctic blackberry', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2211', '[\"Arepa\",\"arepa\"]', 'Dishes', '自動生成: Arepa (僅 FooDB)', 'Arepa', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2212', '[\"Arrowhead\",\"arrowhead\",\"Sagittaria latifolia\"]', 'Vegetables', '自動生成: Arrowhead (僅 FooDB)', 'Arrowhead', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2213', '[\"Arrowroot\",\"arrowroot\",\"Maranta arundinacea\"]', 'Vegetables', '自動生成: Arrowroot (僅 FooDB)', 'Arrowroot', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2214', '[\"Ascidians\",\"ascidians\",\"Ascidiacea\"]', 'Aquatic foods', '自動生成: Ascidians (僅 FooDB)', 'Ascidians', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2215', '[\"Asparagus\",\"asparagus\",\"Asparagus officinalis\"]', 'Vegetables', '自動生成: Asparagus (僅 FooDB)', 'Asparagus', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2216', '[\"Asparagus fern\",\"asparagus fern\",\"Asparagus setaceus\"]', 'Herbs and Spices', '自動生成: Asparagus fern (僅 FooDB)', 'Asparagus fern', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2217', '[\"Asparagus racemosus\",\"asparagus racemosus\"]', 'Vegetables', '自動生成: Asparagus racemosus (僅 FooDB)', 'Asparagus racemosus', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2218', '[\"Atlantic croaker\",\"atlantic croaker\",\"Micropogonias undulatus\"]', 'Aquatic foods', '自動生成: Atlantic croaker (僅 FooDB)', 'Atlantic croaker', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2219', '[\"Atlantic halibut\",\"atlantic halibut\",\"Hippoglossus hippoglossus\"]', 'Aquatic foods', '自動生成: Atlantic halibut (僅 FooDB)', 'Atlantic halibut', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2220', '[\"Atlantic herring\",\"atlantic herring\",\"Clupea harengus harengus\"]', 'Aquatic foods', '自動生成: Atlantic herring (僅 FooDB)', 'Atlantic herring', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2221', '[\"Atlantic menhaden\",\"atlantic menhaden\",\"Brevoortia tyrannus\"]', 'Aquatic foods', '自動生成: Atlantic menhaden (僅 FooDB)', 'Atlantic menhaden', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2222', '[\"Atlantic pollock\",\"atlantic pollock\",\"Pollachius pollachius\"]', 'Aquatic foods', '自動生成: Atlantic pollock (僅 FooDB)', 'Atlantic pollock', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2223', '[\"Atlantic wolffish\",\"atlantic wolffish\",\"Anarhichas lupus\"]', 'Aquatic foods', '自動生成: Atlantic wolffish (僅 FooDB)', 'Atlantic wolffish', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2224', '[\"Avocado\",\"avocado\",\"Persea americana\"]', 'Vegetables', '自動生成: Avocado (僅 FooDB)', 'Avocado', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2225', '[\"Avocado oil\",\"avocado oil\"]', 'Herbs and Spices', '自動生成: Avocado oil (僅 FooDB)', 'Avocado oil', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2226', '[\"Babassu palm\",\"babassu palm\",\"Attalea speciosa\"]', 'Herbs and Spices', '自動生成: Babassu palm (僅 FooDB)', 'Babassu palm', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2227', '[\"Baby food\",\"baby food\"]', 'Baby foods', '自動生成: Baby food (僅 FooDB)', 'Baby food', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2228', '[\"Bagel\",\"bagel\"]', 'Cereals and cereal products', '自動生成: Bagel (僅 FooDB)', 'Bagel', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2229', '[\"Baked beans\",\"baked beans\"]', 'Dishes', '自動生成: Baked beans (僅 FooDB)', 'Baked beans', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2230', '[\"Banana\",\"banana\",\"Musa acuminata\"]', 'Fruits', '自動生成: Banana (僅 FooDB)', 'Banana', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2231', '[\"Barley\",\"barley\",\"Hordeum vulgare\"]', 'Cereals and cereal products', '自動生成: Barley (僅 FooDB)', 'Barley', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2232', '[\"Bayberry\",\"bayberry\",\"Myrica\"]', 'Fruits', '自動生成: Bayberry (僅 FooDB)', 'Bayberry', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2233', '[\"Bean\",\"bean\"]', 'Pulses', '自動生成: Bean (僅 FooDB)', 'Bean', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2234', '[\"Bearded seal\",\"bearded seal\",\"Erignathus barbatus\"]', 'Aquatic foods', '自動生成: Bearded seal (僅 FooDB)', 'Bearded seal', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2235', '[\"Beech nut\",\"beech nut\",\"Fagus\"]', 'Nuts', '自動生成: Beech nut (僅 FooDB)', 'Beech nut', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2236', '[\"Beluga whale\",\"beluga whale\",\"Delphinapterus leucas\"]', 'Aquatic foods', '自動生成: Beluga whale (僅 FooDB)', 'Beluga whale', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2237', '[\"Berry wine\",\"berry wine\"]', 'Beverages', '自動生成: Berry wine (僅 FooDB)', 'Berry wine', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2238', '[\"Beverages\",\"beverages\"]', 'Beverages', '自動生成: Beverages (僅 FooDB)', 'Beverages', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2239', '[\"Bilberry\",\"bilberry\",\"Vaccinium myrtillus\"]', 'Fruits', '自動生成: Bilberry (僅 FooDB)', 'Bilberry', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2240', '[\"Biscuit\",\"biscuit\"]', 'Cereals and cereal products', '自動生成: Biscuit (僅 FooDB)', 'Biscuit', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2241', '[\"Bison\",\"bison\",\"Bison bison\"]', 'Animal foods', '自動生成: Bison (僅 FooDB)', 'Bison', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2242', '[\"Bitter gourd\",\"bitter gourd\",\"Momordica charantia\"]', 'Gourds', '自動生成: Bitter gourd (僅 FooDB)', 'Bitter gourd', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2243', '[\"Black chokeberry\",\"black chokeberry\",\"Photinia melanocarpa\"]', 'Fruits', '自動生成: Black chokeberry (僅 FooDB)', 'Black chokeberry', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2244', '[\"Black crowberry\",\"black crowberry\",\"Empetrum nigrum\"]', 'Fruits', '自動生成: Black crowberry (僅 FooDB)', 'Black crowberry', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2245', '[\"Black elderberry\",\"black elderberry\",\"Sambucus nigra\"]', 'Fruits', '自動生成: Black elderberry (僅 FooDB)', 'Black elderberry', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2246', '[\"Black huckleberry\",\"black huckleberry\",\"Gaylussacia baccata\"]', 'Fruits', '自動生成: Black huckleberry (僅 FooDB)', 'Black huckleberry', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2247', '[\"Black mulberry\",\"black mulberry\",\"Morus nigra\"]', 'Fruits', '自動生成: Black mulberry (僅 FooDB)', 'Black mulberry', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2248', '[\"Black plum\",\"black plum\",\"Syzygium cumini\"]', 'Fruits', '自動生成: Black plum (僅 FooDB)', 'Black plum', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2249', '[\"Black raisin\",\"black raisin\"]', 'Fruits', '自動生成: Black raisin (僅 FooDB)', 'Black raisin', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2250', '[\"Black raspberry\",\"black raspberry\",\"Rubus occidentalis\"]', 'Fruits', '自動生成: Black raspberry (僅 FooDB)', 'Black raspberry', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2251', '[\"Black salsify\",\"black salsify\",\"Scorzonera hispanica\"]', 'Vegetables', '自動生成: Black salsify (僅 FooDB)', 'Black salsify', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2252', '[\"Black-eyed pea\",\"black-eyed pea\",\"Vigna unguiculata ssp. unguiculata\"]', 'Pulses', '自動生成: Black-eyed pea (僅 FooDB)', 'Black-eyed pea', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2253', '[\"Blackberry\",\"blackberry\",\"Rubus\"]', 'Fruits', '自動生成: Blackberry (僅 FooDB)', 'Blackberry', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2254', '[\"Blackcurrant\",\"blackcurrant\",\"Ribes nigrum\"]', 'Fruits', '自動生成: Blackcurrant (僅 FooDB)', 'Blackcurrant', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2255', '[\"Blue crab\",\"blue crab\",\"Callinectes sapidus\"]', 'Aquatic foods', '自動生成: Blue crab (僅 FooDB)', 'Blue crab', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2256', '[\"Blue mussel\",\"blue mussel\",\"Mytilus edulis\"]', 'Aquatic foods', '自動生成: Blue mussel (僅 FooDB)', 'Blue mussel', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2257', '[\"Blue whiting\",\"blue whiting\",\"Micromesistius poutassou\"]', 'Aquatic foods', '自動生成: Blue whiting (僅 FooDB)', 'Blue whiting', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2258', '[\"Bluefish\",\"bluefish\",\"Pomatomus saltatrix\"]', 'Aquatic foods', '自動生成: Bluefish (僅 FooDB)', 'Bluefish', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2259', '[\"Bog bilberry\",\"bog bilberry\",\"Vaccinium uliginosum\"]', 'Fruits', '自動生成: Bog bilberry (僅 FooDB)', 'Bog bilberry', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2260', '[\"Borage\",\"borage\",\"Borago officinalis\"]', 'Herbs and Spices', '自動生成: Borage (僅 FooDB)', 'Borage', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2261', '[\"Bowhead whale\",\"bowhead whale\",\"Balaena mysticetus\"]', 'Aquatic foods', '自動生成: Bowhead whale (僅 FooDB)', 'Bowhead whale', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2262', '[\"Boysenberry\",\"boysenberry\",\"Rubus ursinus X idaeus\"]', 'Fruits', '自動生成: Boysenberry (僅 FooDB)', 'Boysenberry', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2263', '[\"Brassicas\",\"brassicas\"]', 'Vegetables', '自動生成: Brassicas (僅 FooDB)', 'Brassicas', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2264', '[\"Brazil nut\",\"brazil nut\",\"Bertholletia excelsa\"]', 'Nuts', '自動生成: Brazil nut (僅 FooDB)', 'Brazil nut', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2265', '[\"Breadnut tree seed\",\"breadnut tree seed\",\"Brosimum alicastrum\"]', 'Herbs and Spices', '自動生成: Breadnut tree seed (僅 FooDB)', 'Breadnut tree seed', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2266', '[\"Breakfast cereal\",\"breakfast cereal\"]', 'Cereals and cereal products', '自動生成: Breakfast cereal (僅 FooDB)', 'Breakfast cereal', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2267', '[\"Breakfast sandwich\",\"breakfast sandwich\"]', 'Dishes', '自動生成: Breakfast sandwich (僅 FooDB)', 'Breakfast sandwich', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2268', '[\"Broad bean\",\"broad bean\",\"Vicia faba\"]', 'Pulses', '自動生成: Broad bean (僅 FooDB)', 'Broad bean', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2269', '[\"Broad whitefish\",\"broad whitefish\",\"Coregonus nasus\"]', 'Aquatic foods', '自動生成: Broad whitefish (僅 FooDB)', 'Broad whitefish', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2270', '[\"Brussel sprouts\",\"brussel sprouts\",\"Brassica oleracea var. gemmifera\"]', 'Vegetables', '自動生成: Brussel sprouts (僅 FooDB)', 'Brussel sprouts', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2271', '[\"Buffalo\",\"buffalo\",\"Bubalus bubalis\"]', 'Animal foods', '自動生成: Buffalo (僅 FooDB)', 'Buffalo', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2272', '[\"Buffalo currant\",\"buffalo currant\",\"Ribes aureum var. villosum\"]', 'Fruits', '自動生成: Buffalo currant (僅 FooDB)', 'Buffalo currant', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2273', '[\"Bulgur\",\"bulgur\"]', 'Cereals and cereal products', '自動生成: Bulgur (僅 FooDB)', 'Bulgur', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2274', '[\"Burbot\",\"burbot\",\"Lota lota\"]', 'Aquatic foods', '自動生成: Burbot (僅 FooDB)', 'Burbot', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2275', '[\"Burdock\",\"burdock\",\"Arctium lappa\"]', 'Vegetables', '自動生成: Burdock (僅 FooDB)', 'Burdock', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2276', '[\"Burrito\",\"burrito\"]', 'Dishes', '自動生成: Burrito (僅 FooDB)', 'Burrito', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2277', '[\"Butter\",\"butter\"]', 'Milk and milk products', '自動生成: Butter (僅 FooDB)', 'Butter', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2278', '[\"Butter substitute\",\"butter substitute\"]', 'Baking goods', '自動生成: Butter substitute (僅 FooDB)', 'Butter substitute', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2279', '[\"Butterfat\",\"butterfat\"]', 'Milk and milk products', '自動生成: Butterfat (僅 FooDB)', 'Butterfat', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2280', '[\"Buttermilk\",\"buttermilk\"]', 'Milk and milk products', '自動生成: Buttermilk (僅 FooDB)', 'Buttermilk', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2281', '[\"Butternut\",\"butternut\",\"Juglans cinerea\"]', 'Nuts', '自動生成: Butternut (僅 FooDB)', 'Butternut', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2282', '[\"Butternut squash\",\"butternut squash\",\"Cucurbita moschata\"]', 'Gourds', '自動生成: Butternut squash (僅 FooDB)', 'Butternut squash', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2283', '[\"Cabbage\",\"cabbage\",\"Brassica oleracea var. capitata\"]', 'Vegetables', '自動生成: Cabbage (僅 FooDB)', 'Cabbage', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2284', '[\"Cake\",\"cake\"]', 'Confectioneries', '自動生成: Cake (僅 FooDB)', 'Cake', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2285', '[\"Calabash\",\"calabash\",\"Lagenaria siceraria\"]', 'Gourds', '自動生成: Calabash (僅 FooDB)', 'Calabash', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2286', '[\"Canada blueberry\",\"canada blueberry\",\"Vaccinium myrtilloides\"]', 'Fruits', '自動生成: Canada blueberry (僅 FooDB)', 'Canada blueberry', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2287', '[\"Candy bar\",\"candy bar\"]', 'Confectioneries', '自動生成: Candy bar (僅 FooDB)', 'Candy bar', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2288', '[\"Cannellini bean\",\"cannellini bean\"]', 'Pulses', '自動生成: Cannellini bean (僅 FooDB)', 'Cannellini bean', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2289', '[\"Canola\",\"canola\"]', 'Herbs and spices', '自動生成: Canola (僅 FooDB)', 'Canola', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2290', '[\"Canola oil\",\"canola oil\"]', 'Herbs and Spices', '自動生成: Canola oil (僅 FooDB)', 'Canola oil', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2291', '[\"Cantaloupe melon\",\"cantaloupe melon\",\"Cucumis melo var. cantalupensis\"]', 'Gourds', '自動生成: Cantaloupe melon (僅 FooDB)', 'Cantaloupe melon', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2292', '[\"Cape gooseberry\",\"cape gooseberry\",\"Physalis peruviana\"]', 'Fruits', '自動生成: Cape gooseberry (僅 FooDB)', 'Cape gooseberry', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2293', '[\"Capers\",\"capers\",\"Capparis spinosa\"]', 'Herbs and Spices', '自動生成: Capers (僅 FooDB)', 'Capers', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2294', '[\"Caraway\",\"caraway\",\"Carum carvi\"]', 'Herbs and Spices', '自動生成: Caraway (僅 FooDB)', 'Caraway', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2295', '[\"Cardamom\",\"cardamom\",\"Elettaria cardamomum\"]', 'Herbs and Spices', '自動生成: Cardamom (僅 FooDB)', 'Cardamom', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2296', '[\"Cardoon\",\"cardoon\",\"Cynara cardunculus\"]', 'Vegetables', '自動生成: Cardoon (僅 FooDB)', 'Cardoon', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2297', '[\"Carob\",\"carob\",\"Ceratonia siliqua\"]', 'Vegetables', '自動生成: Carob (僅 FooDB)', 'Carob', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2298', '[\"Carp bream\",\"carp bream\",\"Abramis brama\"]', 'Aquatic foods', '自動生成: Carp bream (僅 FooDB)', 'Carp bream', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2299', '[\"Cascade huckleberry\",\"cascade huckleberry\",\"Vaccinium deliciosum\"]', 'Fruits', '自動生成: Cascade huckleberry (僅 FooDB)', 'Cascade huckleberry', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2300', '[\"Casein\",\"casein\"]', 'Milk and milk products', '自動生成: Casein (僅 FooDB)', 'Casein', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2301', '[\"Cassava\",\"cassava\",\"Manihot esculenta\"]', 'Vegetables', '自動生成: Cassava (僅 FooDB)', 'Cassava', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2302', '[\"Castanospermum australe\",\"castanospermum australe\"]', 'Vegetables', '自動生成: Castanospermum australe (僅 FooDB)', 'Castanospermum australe', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2303', '[\"Catfish\",\"catfish\",\"Siluriformes\"]', 'Aquatic foods', '自動生成: Catfish (僅 FooDB)', 'Catfish', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2304', '[\"Catjang pea\",\"catjang pea\",\"Vigna unguiculata ssp. cylindrica\"]', 'Pulses', '自動生成: Catjang pea (僅 FooDB)', 'Catjang pea', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2305', '[\"Cattle (Beef, Veal)\",\"cattle (beef, veal)\",\"Bos taurus\"]', 'Animal foods', '自動生成: Cattle (Beef, Veal) (僅 FooDB)', 'Cattle (Beef, Veal)', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2306', '[\"Cauliflower\",\"cauliflower\",\"Brassica oleracea var. botrytis\"]', 'Vegetables', '自動生成: Cauliflower (僅 FooDB)', 'Cauliflower', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2307', '[\"Celeriac\",\"celeriac\",\"Apium graveolens var. rapaceum\"]', 'Vegetables', '自動生成: Celeriac (僅 FooDB)', 'Celeriac', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2308', '[\"Celery stalks\",\"celery stalks\",\"Apium graveolens var. dulce\"]', 'Vegetables', '自動生成: Celery stalks (僅 FooDB)', 'Celery stalks', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2309', '[\"Cereals and cereal products\",\"cereals and cereal products\"]', 'Cereals and cereal products', '自動生成: Cereals and cereal products (僅 FooDB)', 'Cereals and cereal products', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2310', '[\"Cetacea (Dolphin, Porpoise, Whale)\",\"cetacea (dolphin, porpoise, whale)\",\"Cetacea\"]', 'Aquatic foods', '自動生成: Cetacea (Dolphin, Porpoise, Whale) (僅 FooDB)', 'Cetacea (Dolphin, Porpoise, Whale)', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2311', '[\"Ceylon cinnamon\",\"ceylon cinnamon\",\"Cinnamomum verum\"]', 'Herbs and Spices', '自動生成: Ceylon cinnamon (僅 FooDB)', 'Ceylon cinnamon', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2312', '[\"Channel catfish\",\"channel catfish\",\"Ictalurus punctatus\"]', 'Aquatic foods', '自動生成: Channel catfish (僅 FooDB)', 'Channel catfish', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2313', '[\"Chanterelle\",\"chanterelle\",\"Cantharellus cibarius\"]', 'Vegetables', '自動生成: Chanterelle (僅 FooDB)', 'Chanterelle', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2314', '[\"Charr\",\"charr\",\"Salvelinus\"]', 'Aquatic foods', '自動生成: Charr (僅 FooDB)', 'Charr', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2315', '[\"Chayote\",\"chayote\",\"Sechium edule\"]', 'Gourds', '自動生成: Chayote (僅 FooDB)', 'Chayote', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2316', '[\"Cheddar Cheese\",\"cheddar cheese\"]', 'Milk and milk products', '自動生成: Cheddar Cheese (僅 FooDB)', 'Cheddar Cheese', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2317', '[\"Cheese\",\"cheese\"]', 'Milk and milk products', '自動生成: Cheese (僅 FooDB)', 'Cheese', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2318', '[\"Cherimoya\",\"cherimoya\",\"Annona cherimola\"]', 'Fruits', '自動生成: Cherimoya (僅 FooDB)', 'Cherimoya', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2319', '[\"Chervil\",\"chervil\",\"Anthriscus cerefolium\"]', 'Herbs and Spices', '自動生成: Chervil (僅 FooDB)', 'Chervil', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2320', '[\"Chewing gum\",\"chewing gum\"]', 'Confectioneries', '自動生成: Chewing gum (僅 FooDB)', 'Chewing gum', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2321', '[\"Chia\",\"chia\",\"Salvia hispanica\"]', 'Herbs and Spices', '自動生成: Chia (僅 FooDB)', 'Chia', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2322', '[\"Chickpea\",\"chickpea\",\"Cicer arietinum\"]', 'Pulses', '自動生成: Chickpea (僅 FooDB)', 'Chickpea', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2323', '[\"Chicory\",\"chicory\",\"Cichorium intybus\"]', 'Vegetables', '自動生成: Chicory (僅 FooDB)', 'Chicory', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2324', '[\"Chicory leaves\",\"chicory leaves\",\"Cichorium intybus var. foliosum\"]', 'Vegetables', '自動生成: Chicory leaves (僅 FooDB)', 'Chicory leaves', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2325', '[\"Chicory roots\",\"chicory roots\",\"Cichorium intybus var. sativum\"]', 'Vegetables', '自動生成: Chicory roots (僅 FooDB)', 'Chicory roots', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2326', '[\"Chili\",\"chili\"]', 'Dishes', '自動生成: Chili (僅 FooDB)', 'Chili', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2327', '[\"Chimichanga\",\"chimichanga\"]', 'Dishes', '自動生成: Chimichanga (僅 FooDB)', 'Chimichanga', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2328', '[\"Chineese plum\",\"chineese plum\"]', 'Fruits', '自動生成: Chineese plum (僅 FooDB)', 'Chineese plum', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2329', '[\"Chinese bayberry\",\"chinese bayberry\",\"Myrica rubra\"]', 'Fruits', '自動生成: Chinese bayberry (僅 FooDB)', 'Chinese bayberry', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2330', '[\"Chinese broccoli\",\"chinese broccoli\",\"Brassica alboglabra\"]', 'Vegetables', '自動生成: Chinese broccoli (僅 FooDB)', 'Chinese broccoli', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2331', '[\"Chinese cabbage\",\"chinese cabbage\",\"Brassica rapa\"]', 'Vegetables', '自動生成: Chinese cabbage (僅 FooDB)', 'Chinese cabbage', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2332', '[\"Chinese chestnut\",\"chinese chestnut\",\"Castanea mollissima\"]', 'Nuts', '自動生成: Chinese chestnut (僅 FooDB)', 'Chinese chestnut', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2333', '[\"Chinese cinnamon\",\"chinese cinnamon\",\"Cinnamomum aromaticum\"]', 'Herbs and Spices', '自動生成: Chinese cinnamon (僅 FooDB)', 'Chinese cinnamon', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2334', '[\"Chinese mustard\",\"chinese mustard\",\"Brassica juncea\"]', 'Vegetables', '自動生成: Chinese mustard (僅 FooDB)', 'Chinese mustard', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2335', '[\"Chinese water chestnut\",\"chinese water chestnut\",\"Eleocharis dulcis\"]', 'Vegetables', '自動生成: Chinese water chestnut (僅 FooDB)', 'Chinese water chestnut', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2336', '[\"Chinook salmon\",\"chinook salmon\",\"Oncorhynchus tshawytscha\"]', 'Aquatic foods', '自動生成: Chinook salmon (僅 FooDB)', 'Chinook salmon', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2337', '[\"Chives\",\"chives\",\"Allium schoenoprasum\"]', 'Herbs and Spices', '自動生成: Chives (僅 FooDB)', 'Chives', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2338', '[\"Chocolate mousse\",\"chocolate mousse\"]', 'Confectioneries', '自動生成: Chocolate mousse (僅 FooDB)', 'Chocolate mousse', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2339', '[\"Chocolate spread\",\"chocolate spread\"]', 'Confectioneries', '自動生成: Chocolate spread (僅 FooDB)', 'Chocolate spread', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2340', '[\"Chum salmon\",\"chum salmon\",\"Oncorhynchus keta\"]', 'Aquatic foods', '自動生成: Chum salmon (僅 FooDB)', 'Chum salmon', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2341', '[\"Cichlidae (Tilapia)\",\"cichlidae (tilapia)\",\"Cichlidae\"]', 'Aquatic foods', '自動生成: Cichlidae (Tilapia) (僅 FooDB)', 'Cichlidae (Tilapia)', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2342', '[\"Cinnamon\",\"cinnamon\",\"Cinnamomum\"]', 'Herbs and Spices', '自動生成: Cinnamon (僅 FooDB)', 'Cinnamon', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2343', '[\"Cisco\",\"cisco\",\"Coregonus artedi\"]', 'Aquatic foods', '自動生成: Cisco (僅 FooDB)', 'Cisco', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2344', '[\"Citrus\",\"citrus\"]', 'Fruits', '自動生成: Citrus (僅 FooDB)', 'Citrus', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2345', '[\"Clam\",\"clam\"]', 'Aquatic foods', '自動生成: Clam (僅 FooDB)', 'Clam', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2346', '[\"Clawed lobster\",\"clawed lobster\",\"Nephropidae\"]', 'Aquatic foods', '自動生成: Clawed lobster (僅 FooDB)', 'Clawed lobster', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2347', '[\"Clementine\",\"clementine\",\"Citrus × clementina\"]', 'Fruits', '自動生成: Clementine (僅 FooDB)', 'Clementine', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2348', '[\"Climbing bean\",\"climbing bean\",\"Vigna umbellata\"]', 'Pulses', '自動生成: Climbing bean (僅 FooDB)', 'Climbing bean', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2349', '[\"Cloud ear fungus\",\"cloud ear fungus\",\"Auricularia polytricha\"]', 'Vegetables', '自動生成: Cloud ear fungus (僅 FooDB)', 'Cloud ear fungus', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2350', '[\"Cloudberry\",\"cloudberry\",\"Rubus chamaemorus\"]', 'Fruits', '自動生成: Cloudberry (僅 FooDB)', 'Cloudberry', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2351', '[\"Cloves\",\"cloves\",\"Syzygium aromaticum\"]', 'Herbs and Spices', '自動生成: Cloves (僅 FooDB)', 'Cloves', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2352', '[\"Clupeinae (Herring, Sardine, Sprat)\",\"clupeinae (herring, sardine, sprat)\",\"Clupeinae\"]', 'Aquatic foods', '自動生成: Clupeinae (Herring, Sardine, Sprat) (僅 FooDB)', 'Clupeinae (Herring, Sardine, Sprat)', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2353', '[\"Coalfish pollock\",\"coalfish pollock\",\"Pollachius virens\"]', 'Aquatic foods', '自動生成: Coalfish pollock (僅 FooDB)', 'Coalfish pollock', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2354', '[\"Cocktail\",\"cocktail\"]', 'Beverages', '自動生成: Cocktail (僅 FooDB)', 'Cocktail', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2355', '[\"Cocoa and cocoa products\",\"cocoa and cocoa products\"]', 'Cocoa and cocoa products', '自動生成: Cocoa and cocoa products (僅 FooDB)', 'Cocoa and cocoa products', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2356', '[\"Cocoa bean\",\"cocoa bean\",\"Theobroma cacao\"]', 'Cocoa and cocoa products', '自動生成: Cocoa bean (僅 FooDB)', 'Cocoa bean', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2357', '[\"Cocoa butter\",\"cocoa butter\"]', 'Cocoa and cocoa products', '自動生成: Cocoa butter (僅 FooDB)', 'Cocoa butter', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2358', '[\"Cocoa liquor\",\"cocoa liquor\"]', 'Cocoa and cocoa products', '自動生成: Cocoa liquor (僅 FooDB)', 'Cocoa liquor', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2359', '[\"Cocoa powder\",\"cocoa powder\"]', 'Cocoa and cocoa products', '自動生成: Cocoa powder (僅 FooDB)', 'Cocoa powder', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2360', '[\"Coconut\",\"coconut\",\"Cocos nucifera\"]', 'Fruits', '自動生成: Coconut (僅 FooDB)', 'Coconut', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2361', '[\"Coconut milk\",\"coconut milk\"]', 'Milk and milk products', '自動生成: Coconut milk (僅 FooDB)', 'Coconut milk', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2362', '[\"Coffee\",\"coffee\",\"Coffea\"]', 'Coffee and coffee products', '自動生成: Coffee (僅 FooDB)', 'Coffee', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2363', '[\"Coffee and coffee products\",\"coffee and coffee products\"]', 'Coffee and coffee products', '自動生成: Coffee and coffee products (僅 FooDB)', 'Coffee and coffee products', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2364', '[\"Coffee mocha\",\"coffee mocha\"]', 'Coffee and coffee products', '自動生成: Coffee mocha (僅 FooDB)', 'Coffee mocha', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2365', '[\"Coffee substitute\",\"coffee substitute\"]', 'Baking goods', '自動生成: Coffee substitute (僅 FooDB)', 'Coffee substitute', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2366', '[\"Coho salmon\",\"coho salmon\",\"Oncorhynchus kisutch\"]', 'Aquatic foods', '自動生成: Coho salmon (僅 FooDB)', 'Coho salmon', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2367', '[\"Cold cut\",\"cold cut\"]', 'Dishes', '自動生成: Cold cut (僅 FooDB)', 'Cold cut', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2368', '[\"Colorado pinyon\",\"colorado pinyon\",\"Pinus edulis\"]', 'Nuts', '自動生成: Colorado pinyon (僅 FooDB)', 'Colorado pinyon', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2369', '[\"Columbidae (Dove, Pigeon)\",\"columbidae (dove, pigeon)\",\"Columbidae\"]', 'Animal foods', '自動生成: Columbidae (Dove, Pigeon) (僅 FooDB)', 'Columbidae (Dove, Pigeon)', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2370', '[\"Common bean\",\"common bean\",\"Phaseolus vulgaris\"]', 'Pulses', '自動生成: Common bean (僅 FooDB)', 'Common bean', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2371', '[\"Common beet\",\"common beet\",\"Beta vulgaris\"]', 'Vegetables', '自動生成: Common beet (僅 FooDB)', 'Common beet', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2372', '[\"Common buckwheat\",\"common buckwheat\",\"Fagopyrum esculentum\"]', 'Cereals and cereal products', '自動生成: Common buckwheat (僅 FooDB)', 'Common buckwheat', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2373', '[\"Common cabbage\",\"common cabbage\",\"Brassica oleracea\"]', 'Vegetables', '自動生成: Common cabbage (僅 FooDB)', 'Common cabbage', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2374', '[\"Common carp\",\"common carp\",\"Cyprinus carpio\"]', 'Aquatic foods', '自動生成: Common carp (僅 FooDB)', 'Common carp', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2375', '[\"Common chokecherry\",\"common chokecherry\",\"Prunus virginiana\"]', 'Fruits', '自動生成: Common chokecherry (僅 FooDB)', 'Common chokecherry', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2376', '[\"Common dab\",\"common dab\",\"Limanda limanda\"]', 'Aquatic foods', '自動生成: Common dab (僅 FooDB)', 'Common dab', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2377', '[\"Common hazelnut\",\"common hazelnut\",\"Corylus avellana\"]', 'Nuts', '自動生成: Common hazelnut (僅 FooDB)', 'Common hazelnut', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2378', '[\"Common ling\",\"common ling\",\"Molva molva\"]', 'Aquatic foods', '自動生成: Common ling (僅 FooDB)', 'Common ling', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2379', '[\"Common mushroom\",\"common mushroom\",\"Agaricus bisporus\"]', 'Vegetables', '自動生成: Common mushroom (僅 FooDB)', 'Common mushroom', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2380', '[\"Common oregano\",\"common oregano\",\"Origanum vulgare\"]', 'Herbs and Spices', '自動生成: Common oregano (僅 FooDB)', 'Common oregano', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2381', '[\"Common pea\",\"common pea\",\"Pisum sativum\"]', 'Pulses', '自動生成: Common pea (僅 FooDB)', 'Common pea', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2382', '[\"Common persimmon\",\"common persimmon\",\"Diospyros virginiana\"]', 'Fruits', '自動生成: Common persimmon (僅 FooDB)', 'Common persimmon', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2383', '[\"Common sage\",\"common sage\",\"Salvia officinalis\"]', 'Herbs and Spices', '自動生成: Common sage (僅 FooDB)', 'Common sage', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2384', '[\"Common salsify\",\"common salsify\",\"Tragopogon porrifolius\"]', 'Vegetables', '自動生成: Common salsify (僅 FooDB)', 'Common salsify', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2385', '[\"Common thyme\",\"common thyme\",\"Thymus vulgaris\"]', 'Herbs and Spices', '自動生成: Common thyme (僅 FooDB)', 'Common thyme', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2386', '[\"Common verbena\",\"common verbena\",\"Verbena officinalis\"]', 'Herbs and Spices', '自動生成: Common verbena (僅 FooDB)', 'Common verbena', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2387', '[\"Common walnut\",\"common walnut\",\"Juglans regia\"]', 'Nuts', '自動生成: Common walnut (僅 FooDB)', 'Common walnut', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2388', '[\"Common wheat\",\"common wheat\",\"Triticum aestivum\"]', 'Cereals and cereal products', '自動生成: Common wheat (僅 FooDB)', 'Common wheat', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2389', '[\"Conch\",\"conch\",\"Strombidae\"]', 'Aquatic foods', '自動生成: Conch (僅 FooDB)', 'Conch', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2390', '[\"Condensed milk\",\"condensed milk\"]', 'Milk and milk products', '自動生成: Condensed milk (僅 FooDB)', 'Condensed milk', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2391', '[\"Cooking oil\",\"cooking oil\"]', 'Baking goods', '自動生成: Cooking oil (僅 FooDB)', 'Cooking oil', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2392', '[\"Coriander\",\"coriander\",\"Coriandrum sativum\"]', 'Herbs and Spices', '自動生成: Coriander (僅 FooDB)', 'Coriander', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2393', '[\"Corn\",\"corn\",\"Zea mays\"]', 'Cereals and cereal products', '自動生成: Corn (僅 FooDB)', 'Corn', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2394', '[\"Corn chip\",\"corn chip\"]', 'Snack foods', '自動生成: Corn chip (僅 FooDB)', 'Corn chip', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2395', '[\"Corn grits\",\"corn grits\"]', 'Cereals and cereal products', '自動生成: Corn grits (僅 FooDB)', 'Corn grits', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2396', '[\"Corn oil\",\"corn oil\"]', 'Herbs and Spices', '自動生成: Corn oil (僅 FooDB)', 'Corn oil', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2397', '[\"Corn salad\",\"corn salad\",\"Valerianella locusta\"]', 'Vegetables', '自動生成: Corn salad (僅 FooDB)', 'Corn salad', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2398', '[\"Cornbread\",\"cornbread\"]', 'Cereals and cereal products', '自動生成: Cornbread (僅 FooDB)', 'Cornbread', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2399', '[\"Cornmint\",\"cornmint\",\"Mentha arvensis\"]', 'Herbs and Spices', '自動生成: Cornmint (僅 FooDB)', 'Cornmint', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2400', '[\"Cottage cheese\",\"cottage cheese\"]', 'Milk and milk products', '自動生成: Cottage cheese (僅 FooDB)', 'Cottage cheese', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2401', '[\"Cottonseed\",\"cottonseed\",\"Gossypium\"]', 'Herbs and Spices', '自動生成: Cottonseed (僅 FooDB)', 'Cottonseed', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2402', '[\"Cottonseed oil\",\"cottonseed oil\"]', 'Herbs and Spices', '自動生成: Cottonseed oil (僅 FooDB)', 'Cottonseed oil', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2403', '[\"Couscous\",\"couscous\"]', 'Dishes', '自動生成: Couscous (僅 FooDB)', 'Couscous', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2404', '[\"Cow milk, pasteurized, vitamin A + D added, 0% fat\",\"cow milk, pasteurized, vitamin a + d added, 0% fat\"]', 'Milk and milk products', '自動生成: Cow milk, pasteurized, vitamin A + D added, 0% fat (僅 FooDB)', 'Cow milk, pasteurized, vitamin A + D added, 0% fat', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2405', '[\"Cow milk, pasteurized, vitamin A + D added, 1% fat\",\"cow milk, pasteurized, vitamin a + d added, 1% fat\"]', 'Milk and milk products', '自動生成: Cow milk, pasteurized, vitamin A + D added, 1% fat (僅 FooDB)', 'Cow milk, pasteurized, vitamin A + D added, 1% fat', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2406', '[\"Cow milk, pasteurized, vitamin A + D added, 2% fat\",\"cow milk, pasteurized, vitamin a + d added, 2% fat\"]', 'Milk and milk products', '自動生成: Cow milk, pasteurized, vitamin A + D added, 2% fat (僅 FooDB)', 'Cow milk, pasteurized, vitamin A + D added, 2% fat', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2407', '[\"Cow milk, pasteurized, vitamin D added, 3.25% fat\",\"cow milk, pasteurized, vitamin d added, 3.25% fat\"]', 'Milk and milk products', '自動生成: Cow milk, pasteurized, vitamin D added, 3.25% fat (僅 FooDB)', 'Cow milk, pasteurized, vitamin D added, 3.25% fat', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2408', '[\"Cowpea\",\"cowpea\",\"Vigna unguiculata\"]', 'Pulses', '自動生成: Cowpea (僅 FooDB)', 'Cowpea', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2409', '[\"Crab\",\"crab\",\"Brachyura\"]', 'Aquatic foods', '自動生成: Crab (僅 FooDB)', 'Crab', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2410', '[\"Cracker\",\"cracker\"]', 'Snack foods', '自動生成: Cracker (僅 FooDB)', 'Cracker', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2411', '[\"Crayfish\",\"crayfish\",\"Astacidea\"]', 'Aquatic foods', '自動生成: Crayfish (僅 FooDB)', 'Crayfish', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2412', '[\"Cream\",\"cream\"]', 'Milk and milk products', '自動生成: Cream (僅 FooDB)', 'Cream', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2413', '[\"Cream substitute\",\"cream substitute\"]', 'Baking goods', '自動生成: Cream substitute (僅 FooDB)', 'Cream substitute', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2414', '[\"Crisp bread\",\"crisp bread\"]', 'Cereals and cereal products', '自動生成: Crisp bread (僅 FooDB)', 'Crisp bread', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2415', '[\"Crosne\",\"crosne\",\"Stachys affinis\"]', 'Vegetables', '自動生成: Crosne (僅 FooDB)', 'Crosne', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2416', '[\"Crustaceans\",\"crustaceans\"]', 'Aquatic foods', '自動生成: Crustaceans (僅 FooDB)', 'Crustaceans', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2417', '[\"Cucumber\",\"cucumber\",\"Cucumis sativus\"]', 'Gourds', '自動生成: Cucumber (僅 FooDB)', 'Cucumber', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2418', '[\"Cucurbita\",\"cucurbita\"]', 'Gourds', '自動生成: Cucurbita (僅 FooDB)', 'Cucurbita', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2419', '[\"Cumin\",\"cumin\",\"Cuminum cyminum\"]', 'Herbs and Spices', '自動生成: Cumin (僅 FooDB)', 'Cumin', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2420', '[\"Cupuaçu\",\"cupuaçu\",\"Theobroma grandiflorum\"]', 'Herbs and Spices', '自動生成: Cupuaçu (僅 FooDB)', 'Cupuaçu', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2421', '[\"Curry powder\",\"curry powder\"]', 'Herbs and Spices', '自動生成: Curry powder (僅 FooDB)', 'Curry powder', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2422', '[\"Cusk\",\"cusk\",\"Brosme brosme\"]', 'Aquatic foods', '自動生成: Cusk (僅 FooDB)', 'Cusk', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2423', '[\"Custard apple\",\"custard apple\",\"Annona reticulata\"]', 'Fruits', '自動生成: Custard apple (僅 FooDB)', 'Custard apple', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2424', '[\"Daikon radish\",\"daikon radish\",\"Raphanus sativus var. longipinnatus\"]', 'Vegetables', '自動生成: Daikon radish (僅 FooDB)', 'Daikon radish', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2425', '[\"Dandelion\",\"dandelion\",\"Taraxacum officinale\"]', 'Herbs and Spices', '自動生成: Dandelion (僅 FooDB)', 'Dandelion', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2426', '[\"Date\",\"date\",\"Phoenix dactylifera\"]', 'Fruits', '自動生成: Date (僅 FooDB)', 'Date', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2427', '[\"Deer\",\"deer\",\"Cervidae\"]', 'Animal foods', '自動生成: Deer (僅 FooDB)', 'Deer', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2428', '[\"Deerberry\",\"deerberry\",\"Vaccinium stamineum\"]', 'Fruits', '自動生成: Deerberry (僅 FooDB)', 'Deerberry', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2429', '[\"Dessert wine\",\"dessert wine\"]', 'Beverages', '自動生成: Dessert wine (僅 FooDB)', 'Dessert wine', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2430', '[\"Devilfish\",\"devilfish\",\"Myoxocephalus\"]', 'Aquatic foods', '自動生成: Devilfish (僅 FooDB)', 'Devilfish', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2431', '[\"Dill\",\"dill\",\"Anethum graveolens\"]', 'Herbs and Spices', '自動生成: Dill (僅 FooDB)', 'Dill', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2432', '[\"Dock\",\"dock\",\"Rumex\"]', 'Herbs and Spices', '自動生成: Dock (僅 FooDB)', 'Dock', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2433', '[\"Dolphin fish\",\"dolphin fish\",\"Coryphaena hippurus\"]', 'Aquatic foods', '自動生成: Dolphin fish (僅 FooDB)', 'Dolphin fish', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2434', '[\"Domestic goat\",\"domestic goat\",\"Capra aegagrus hircus\"]', 'Animal foods', '自動生成: Domestic goat (僅 FooDB)', 'Domestic goat', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2435', '[\"Domestic pig\",\"domestic pig\",\"Sus scrofa domestica\"]', 'Animal foods', '自動生成: Domestic pig (僅 FooDB)', 'Domestic pig', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2436', '[\"Dough\",\"dough\"]', 'Cereals and cereal products', '自動生成: Dough (僅 FooDB)', 'Dough', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2437', '[\"Dragée\",\"dragée\"]', 'Confectioneries', '自動生成: Dragée (僅 FooDB)', 'Dragée', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2438', '[\"Dried milk\",\"dried milk\"]', 'Milk and milk products', '自動生成: Dried milk (僅 FooDB)', 'Dried milk', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2439', '[\"Dripping\",\"dripping\"]', 'Fats and oils', '自動生成: Dripping (僅 FooDB)', 'Dripping', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2440', '[\"Dulce de leche\",\"dulce de leche\"]', 'Confectioneries', '自動生成: Dulce de leche (僅 FooDB)', 'Dulce de leche', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2441', '[\"Dumpling\",\"dumpling\"]', 'Dishes', '自動生成: Dumpling (僅 FooDB)', 'Dumpling', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2442', '[\"Dungeness crab\",\"dungeness crab\",\"Cancer magister\"]', 'Aquatic foods', '自動生成: Dungeness crab (僅 FooDB)', 'Dungeness crab', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2443', '[\"Durian\",\"durian\",\"Durio zibethinus\"]', 'Fruits', '自動生成: Durian (僅 FooDB)', 'Durian', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2444', '[\"Eastern oyster\",\"eastern oyster\",\"Crassostrea virginica\"]', 'Aquatic foods', '自動生成: Eastern oyster (僅 FooDB)', 'Eastern oyster', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2445', '[\"Eddoe\",\"eddoe\",\"Colocasia antiquorum\"]', 'Vegetables', '自動生成: Eddoe (僅 FooDB)', 'Eddoe', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2446', '[\"Edible shell\",\"edible shell\"]', 'Baking goods', '自動生成: Edible shell (僅 FooDB)', 'Edible shell', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2447', '[\"Egg substitute\",\"egg substitute\"]', 'Baking goods', '自動生成: Egg substitute (僅 FooDB)', 'Egg substitute', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2448', '[\"Eggs\",\"eggs\"]', 'Eggs', '自動生成: Eggs (僅 FooDB)', 'Eggs', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2449', '[\"Elderberry\",\"elderberry\",\"Sambucus\"]', 'Fruits', '自動生成: Elderberry (僅 FooDB)', 'Elderberry', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2450', '[\"Elk\",\"elk\",\"Cervus canadensis\"]', 'Animal foods', '自動生成: Elk (僅 FooDB)', 'Elk', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2451', '[\"Empanada\",\"empanada\"]', 'Dishes', '自動生成: Empanada (僅 FooDB)', 'Empanada', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2452', '[\"Emu\",\"emu\",\"Dromaius novaehollandiae\"]', 'Animal foods', '自動生成: Emu (僅 FooDB)', 'Emu', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2453', '[\"Enchilada\",\"enchilada\"]', 'Dishes', '自動生成: Enchilada (僅 FooDB)', 'Enchilada', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2454', '[\"Endive\",\"endive\",\"Cichorium endivia\"]', 'Vegetables', '自動生成: Endive (僅 FooDB)', 'Endive', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2455', '[\"Energy drink\",\"energy drink\"]', 'Beverages', '自動生成: Energy drink (僅 FooDB)', 'Energy drink', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2456', '[\"Enokitake\",\"enokitake\",\"Flammulina velutipes\"]', 'Vegetables', '自動生成: Enokitake (僅 FooDB)', 'Enokitake', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2457', '[\"Epazote\",\"epazote\",\"Dysphania ambrosioides\"]', 'Herbs and Spices', '自動生成: Epazote (僅 FooDB)', 'Epazote', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2458', '[\"European anchovy\",\"european anchovy\",\"Engraulis encrasicolus\"]', 'Aquatic foods', '自動生成: European anchovy (僅 FooDB)', 'European anchovy', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2459', '[\"European chestnut\",\"european chestnut\",\"Castanea sativa\"]', 'Nuts', '自動生成: European chestnut (僅 FooDB)', 'European chestnut', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2460', '[\"European cranberry\",\"european cranberry\",\"Vaccinium oxycoccos\"]', 'Fruits', '自動生成: European cranberry (僅 FooDB)', 'European cranberry', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2461', '[\"European plum\",\"european plum\",\"Prunus domestica\"]', 'Fruits', '自動生成: European plum (僅 FooDB)', 'European plum', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2462', '[\"European rabbit\",\"european rabbit\",\"Oryctolagus\"]', 'Animal foods', '自動生成: European rabbit (僅 FooDB)', 'European rabbit', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2463', '[\"Evaporated milk\",\"evaporated milk\"]', 'Milk and milk products', '自動生成: Evaporated milk (僅 FooDB)', 'Evaporated milk', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2464', '[\"Evening primrose\",\"evening primrose\",\"Oenothera biennis\"]', 'Herbs and Spices', '自動生成: Evening primrose (僅 FooDB)', 'Evening primrose', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2465', '[\"Evergreen blackberry\",\"evergreen blackberry\",\"Rubus laciniatus\"]', 'Fruits', '自動生成: Evergreen blackberry (僅 FooDB)', 'Evergreen blackberry', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2466', '[\"Evergreen huckleberry\",\"evergreen huckleberry\",\"Vaccinium ovatum\"]', 'Fruits', '自動生成: Evergreen huckleberry (僅 FooDB)', 'Evergreen huckleberry', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2467', '[\"Falafel\",\"falafel\"]', 'Dishes', '自動生成: Falafel (僅 FooDB)', 'Falafel', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2468', '[\"Fats and oils\",\"fats and oils\"]', 'Fats and oils', '自動生成: Fats and oils (僅 FooDB)', 'Fats and oils', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2469', '[\"Feijoa\",\"feijoa\",\"Feijoa sellowiana\"]', 'Fruits', '自動生成: Feijoa (僅 FooDB)', 'Feijoa', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2470', '[\"Fennel\",\"fennel\",\"Foeniculum vulgare\"]', 'Herbs and Spices', '自動生成: Fennel (僅 FooDB)', 'Fennel', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2471', '[\"Fenugreek\",\"fenugreek\",\"Trigonella foenum-graecum\"]', 'Herbs and Spices', '自動生成: Fenugreek (僅 FooDB)', 'Fenugreek', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2472', '[\"Fig\",\"fig\",\"Ficus carica\"]', 'Fruits', '自動生成: Fig (僅 FooDB)', 'Fig', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2473', '[\"Fireweed\",\"fireweed\",\"Chamerion angustifolium\"]', 'Herbs and Spices', '自動生成: Fireweed (僅 FooDB)', 'Fireweed', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2474', '[\"Fish burger\",\"fish burger\"]', 'Dishes', '自動生成: Fish burger (僅 FooDB)', 'Fish burger', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2475', '[\"Fish oil\",\"fish oil\"]', '其他', '自動生成: Fish oil (僅 FooDB)', 'Fish oil', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2476', '[\"Fishes\",\"fishes\"]', 'Aquatic foods', '自動生成: Fishes (僅 FooDB)', 'Fishes', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2477', '[\"Flatfish\",\"flatfish\",\"Pleuronectiformes\"]', 'Aquatic foods', '自動生成: Flatfish (僅 FooDB)', 'Flatfish', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2478', '[\"Flaxseed\",\"flaxseed\",\"Linum usitatissimum\"]', 'Herbs and Spices', '自動生成: Flaxseed (僅 FooDB)', 'Flaxseed', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2479', '[\"Florida pompano\",\"florida pompano\",\"Trachinotus carolinus\"]', 'Aquatic foods', '自動生成: Florida pompano (僅 FooDB)', 'Florida pompano', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2480', '[\"Flour\",\"flour\"]', 'Cereals and cereal products', '自動生成: Flour (僅 FooDB)', 'Flour', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2481', '[\"Focaccia\",\"focaccia\"]', 'Cereals and cereal products', '自動生成: Focaccia (僅 FooDB)', 'Focaccia', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2482', '[\"Fortified wine\",\"fortified wine\"]', 'Beverages', '自動生成: Fortified wine (僅 FooDB)', 'Fortified wine', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2483', '[\"Fox grape\",\"fox grape\",\"Vitis labrusca\"]', 'Fruits', '自動生成: Fox grape (僅 FooDB)', 'Fox grape', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2484', '[\"French plantain\",\"french plantain\",\"Musa X paradisiaca\"]', 'Fruits', '自動生成: French plantain (僅 FooDB)', 'French plantain', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2485', '[\"French toast\",\"french toast\"]', 'Cereals and cereal products', '自動生成: French toast (僅 FooDB)', 'French toast', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2486', '[\"Freshwater drum\",\"freshwater drum\",\"Aplodinotus grunniens\"]', 'Aquatic foods', '自動生成: Freshwater drum (僅 FooDB)', 'Freshwater drum', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2487', '[\"Freshwater eel\",\"freshwater eel\",\"Anguilla\"]', 'Aquatic foods', '自動生成: Freshwater eel (僅 FooDB)', 'Freshwater eel', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2488', '[\"Fruit gum\",\"fruit gum\"]', 'Confectioneries', '自動生成: Fruit gum (僅 FooDB)', 'Fruit gum', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2489', '[\"Fruit preserve\",\"fruit preserve\"]', 'Fruits', '自動生成: Fruit preserve (僅 FooDB)', 'Fruit preserve', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2490', '[\"Fruit salad\",\"fruit salad\"]', 'Fruits', '自動生成: Fruit salad (僅 FooDB)', 'Fruit salad', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2491', '[\"Fruit-flavor drink\",\"fruit-flavor drink\"]', 'Beverages', '自動生成: Fruit-flavor drink (僅 FooDB)', 'Fruit-flavor drink', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2492', '[\"Fruits\",\"fruits\"]', 'Fruits', '自動生成: Fruits (僅 FooDB)', 'Fruits', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2493', '[\"Frybread\",\"frybread\"]', 'Dishes', '自動生成: Frybread (僅 FooDB)', 'Frybread', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2494', '[\"Fudge\",\"fudge\"]', 'Confectioneries', '自動生成: Fudge (僅 FooDB)', 'Fudge', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2495', '[\"Gadiformes\",\"gadiformes\"]', 'Aquatic foods', '自動生成: Gadiformes (僅 FooDB)', 'Gadiformes', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2496', '[\"Gadus (Common cod)\",\"gadus (common cod)\",\"Gadus\"]', 'Aquatic foods', '自動生成: Gadus (Common cod) (僅 FooDB)', 'Gadus (Common cod)', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2497', '[\"Garden cress\",\"garden cress\",\"Lepidium sativum\"]', 'Vegetables', '自動生成: Garden cress (僅 FooDB)', 'Garden cress', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2498', '[\"Garden onion (var.)\",\"garden onion (var.)\",\"Allium cepa var. cepa\"]', 'Vegetables', '自動生成: Garden onion (var.) (僅 FooDB)', 'Garden onion (var.)', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2499', '[\"Garden rhubarb\",\"garden rhubarb\",\"Rheum rhabarbarum\"]', 'Vegetables', '自動生成: Garden rhubarb (僅 FooDB)', 'Garden rhubarb', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2500', '[\"Garden tomato\",\"garden tomato\",\"Solanum lycopersicum\"]', 'Vegetables', '自動生成: Garden tomato (僅 FooDB)', 'Garden tomato', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2501', '[\"Garden tomato (var.)\",\"garden tomato (var.)\",\"Solanum lycopersicum var. lycopersicum\"]', 'Vegetables', '自動生成: Garden tomato (var.) (僅 FooDB)', 'Garden tomato (var.)', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2502', '[\"Garfish\",\"garfish\",\"Belone belone\"]', 'Aquatic foods', '自動生成: Garfish (僅 FooDB)', 'Garfish', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2503', '[\"Garland chrysanthemum\",\"garland chrysanthemum\",\"Chrysanthemum coronarium\"]', 'Vegetables', '自動生成: Garland chrysanthemum (僅 FooDB)', 'Garland chrysanthemum', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2504', '[\"Gefilte fish\",\"gefilte fish\"]', 'Dishes', '自動生成: Gefilte fish (僅 FooDB)', 'Gefilte fish', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2505', '[\"Gelatin\",\"gelatin\"]', 'Baking goods', '自動生成: Gelatin (僅 FooDB)', 'Gelatin', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2506', '[\"Gelatin dessert\",\"gelatin dessert\"]', 'Confectioneries', '自動生成: Gelatin dessert (僅 FooDB)', 'Gelatin dessert', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2507', '[\"Gentiana lutea\",\"gentiana lutea\"]', 'Vegetables', '自動生成: Gentiana lutea (僅 FooDB)', 'Gentiana lutea', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2508', '[\"German camomile\",\"german camomile\",\"Matricaria recutita\"]', 'Herbs and Spices', '自動生成: German camomile (僅 FooDB)', 'German camomile', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2509', '[\"Giant butterbur\",\"giant butterbur\",\"Petasites japonicus\"]', 'Vegetables', '自動生成: Giant butterbur (僅 FooDB)', 'Giant butterbur', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2510', '[\"Gin\",\"gin\"]', 'Beverages', '自動生成: Gin (僅 FooDB)', 'Gin', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2511', '[\"Ginkgo nuts\",\"ginkgo nuts\",\"Ginkgo biloba\"]', 'Herbs and Spices', '自動生成: Ginkgo nuts (僅 FooDB)', 'Ginkgo nuts', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2512', '[\"Ginseng\",\"ginseng\",\"Panax\"]', 'Herbs and Spices', '自動生成: Ginseng (僅 FooDB)', 'Ginseng', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2513', '[\"Globe artichoke\",\"globe artichoke\",\"Cynara scolymus\"]', 'Vegetables', '自動生成: Globe artichoke (僅 FooDB)', 'Globe artichoke', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2514', '[\"Goji\",\"goji\"]', 'Fruits', '自動生成: Goji (僅 FooDB)', 'Goji', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2515', '[\"Gooseberry\",\"gooseberry\",\"Ribes uva-crispa\"]', 'Fruits', '自動生成: Gooseberry (僅 FooDB)', 'Gooseberry', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2516', '[\"Gram bean\",\"gram bean\",\"Vigna mungo\"]', 'Pulses', '自動生成: Gram bean (僅 FooDB)', 'Gram bean', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2517', '[\"Grape\",\"grape\",\"Vitis\"]', 'Fruits', '自動生成: Grape (僅 FooDB)', 'Grape', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2518', '[\"Grape wine\",\"grape wine\"]', 'Beverages', '自動生成: Grape wine (僅 FooDB)', 'Grape wine', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2519', '[\"Grapefruit\",\"grapefruit\",\"Citrus X paradisi\"]', 'Fruits', '自動生成: Grapefruit (僅 FooDB)', 'Grapefruit', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2520', '[\"Grapefruit/Pummelo hybrid\",\"grapefruit/pummelo hybrid\",\"Citrus paradisi X Citrus maxima\"]', 'Fruits', '自動生成: Grapefruit/Pummelo hybrid (僅 FooDB)', 'Grapefruit/Pummelo hybrid', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2521', '[\"Grapeseed oil\",\"grapeseed oil\"]', 'Herbs and Spices', '自動生成: Grapeseed oil (僅 FooDB)', 'Grapeseed oil', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2522', '[\"Grass pea\",\"grass pea\",\"Lathyrus sativus\"]', 'Pulses', '自動生成: Grass pea (僅 FooDB)', 'Grass pea', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2523', '[\"Greater sturgeon\",\"greater sturgeon\",\"Acipenser\"]', 'Aquatic foods', '自動生成: Greater sturgeon (僅 FooDB)', 'Greater sturgeon', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2524', '[\"Greek feta cheese\",\"greek feta cheese\"]', 'Milk and milk products', '自動生成: Greek feta cheese (僅 FooDB)', 'Greek feta cheese', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2525', '[\"Green apple\",\"green apple\"]', 'Fruits', '自動生成: Green apple (僅 FooDB)', 'Green apple', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2526', '[\"Green bean\",\"green bean\",\"Phaseolus vulgaris\"]', 'Pulses', '自動生成: Green bean (僅 FooDB)', 'Green bean', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2527', '[\"Green bell pepper\",\"green bell pepper\",\"Capsicum annuum\"]', 'Vegetables', '自動生成: Green bell pepper (僅 FooDB)', 'Green bell pepper', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2528', '[\"Green cabbage\",\"green cabbage\",\"Brassica oleracea var. sabauda L.\"]', 'Vegetables', '自動生成: Green cabbage (僅 FooDB)', 'Green cabbage', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2529', '[\"Green grape\",\"green grape\"]', 'Fruits', '自動生成: Green grape (僅 FooDB)', 'Green grape', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2530', '[\"Green lentil\",\"green lentil\",\"Lens culinaris\"]', 'Pulses', '自動生成: Green lentil (僅 FooDB)', 'Green lentil', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2531', '[\"Green onion\",\"green onion\"]', 'Vegetables', '自動生成: Green onion (僅 FooDB)', 'Green onion', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2532', '[\"Green plum\",\"green plum\"]', 'Fruits', '自動生成: Green plum (僅 FooDB)', 'Green plum', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2533', '[\"Green turtle\",\"green turtle\",\"Chelonia mydas\"]', 'Aquatic foods', '自動生成: Green turtle (僅 FooDB)', 'Green turtle', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2534', '[\"Green vegetables\",\"green vegetables\"]', 'Vegetables', '自動生成: Green vegetables (僅 FooDB)', 'Green vegetables', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2535', '[\"Green zucchini\",\"green zucchini\",\"Cucurbita pepo var. cylindrica\"]', 'Gourds', '自動生成: Green zucchini (僅 FooDB)', 'Green zucchini', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2536', '[\"Greenland halibut/turbot\",\"greenland halibut/turbot\",\"Reinhardtius hippoglossoides\"]', 'Aquatic foods', '自動生成: Greenland halibut/turbot (僅 FooDB)', 'Greenland halibut/turbot', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2537', '[\"Greenthread tea\",\"greenthread tea\",\"Thelesperma\"]', 'Teas', '自動生成: Greenthread tea (僅 FooDB)', 'Greenthread tea', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2538', '[\"Greylag goose\",\"greylag goose\",\"Anser anser\"]', 'Animal foods', '自動生成: Greylag goose (僅 FooDB)', 'Greylag goose', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2539', '[\"Groundcherry\",\"groundcherry\",\"Physalis\"]', 'Vegetables', '自動生成: Groundcherry (僅 FooDB)', 'Groundcherry', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2540', '[\"Grouper\",\"grouper\",\"Epinephelus\"]', 'Aquatic foods', '自動生成: Grouper (僅 FooDB)', 'Grouper', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2541', '[\"Guarana\",\"guarana\",\"Paullinia cupana\"]', 'Herbs and Spices', '自動生成: Guarana (僅 FooDB)', 'Guarana', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2542', '[\"Guava\",\"guava\",\"Psidium guajava\"]', 'Fruits', '自動生成: Guava (僅 FooDB)', 'Guava', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2543', '[\"Guinea hen\",\"guinea hen\",\"Numida meleagris\"]', 'Animal foods', '自動生成: Guinea hen (僅 FooDB)', 'Guinea hen', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2544', '[\"Haddock\",\"haddock\",\"Melanogrammus aeglefinus\"]', 'Aquatic foods', '自動生成: Haddock (僅 FooDB)', 'Haddock', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2545', '[\"Half-highbush blueberry\",\"half-highbush blueberry\",\"Vaccinium angustifolium X Vaccinium corymbosum\"]', 'Fruits', '自動生成: Half-highbush blueberry (僅 FooDB)', 'Half-highbush blueberry', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2546', '[\"Hard wheat\",\"hard wheat\",\"Triticum durum\"]', 'Cereals and cereal products', '自動生成: Hard wheat (僅 FooDB)', 'Hard wheat', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2547', '[\"Hawthorn\",\"hawthorn\",\"Crataegus\"]', 'Fruits', '自動生成: Hawthorn (僅 FooDB)', 'Hawthorn', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2548', '[\"Hazelnut\",\"hazelnut\",\"Corylus\"]', 'Nuts', '自動生成: Hazelnut (僅 FooDB)', 'Hazelnut', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2549', '[\"Heart of palm\",\"heart of palm\"]', 'Vegetables', '自動生成: Heart of palm (僅 FooDB)', 'Heart of palm', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2550', '[\"Hedge mustard\",\"hedge mustard\",\"Sisymbrium\"]', 'Herbs and Spices', '自動生成: Hedge mustard (僅 FooDB)', 'Hedge mustard', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2551', '[\"Herbal tea\",\"herbal tea\"]', 'Teas', '自動生成: Herbal tea (僅 FooDB)', 'Herbal tea', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2552', '[\"Herbs and Spices\",\"herbs and spices\"]', 'Herbs and Spices', '自動生成: Herbs and Spices (僅 FooDB)', 'Herbs and Spices', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2553', '[\"Hibiscus tea\",\"hibiscus tea\",\"Hibiscus sabbariffa\"]', 'Teas', '自動生成: Hibiscus tea (僅 FooDB)', 'Hibiscus tea', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2554', '[\"Hickory nut\",\"hickory nut\",\"Carya\"]', 'Nuts', '自動生成: Hickory nut (僅 FooDB)', 'Hickory nut', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2555', '[\"Highbush blueberry\",\"highbush blueberry\",\"Vaccinium corymbosum\"]', 'Fruits', '自動生成: Highbush blueberry (僅 FooDB)', 'Highbush blueberry', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2556', '[\"Hippoglossus (Common halibut)\",\"hippoglossus (common halibut)\",\"Hippoglossus\"]', 'Aquatic foods', '自動生成: Hippoglossus (Common halibut) (僅 FooDB)', 'Hippoglossus (Common halibut)', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2557', '[\"Honey\",\"honey\"]', 'Confectioneries', '自動生成: Honey (僅 FooDB)', 'Honey', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2558', '[\"Horchata\",\"horchata\"]', 'Beverages', '自動生成: Horchata (僅 FooDB)', 'Horchata', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2559', '[\"Horned melon\",\"horned melon\",\"Cucumis metuliferus\"]', 'Gourds', '自動生成: Horned melon (僅 FooDB)', 'Horned melon', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2560', '[\"Horse\",\"horse\",\"Equus caballus\"]', 'Animal foods', '自動生成: Horse (僅 FooDB)', 'Horse', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2561', '[\"Horseradish\",\"horseradish\",\"Armoracia rusticana\"]', 'Herbs and Spices', '自動生成: Horseradish (僅 FooDB)', 'Horseradish', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2562', '[\"Horseradish tree\",\"horseradish tree\",\"Moringa oleifera\"]', 'Vegetables', '自動生成: Horseradish tree (僅 FooDB)', 'Horseradish tree', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2563', '[\"Hot chocolate\",\"hot chocolate\"]', 'Cocoa and cocoa products', '自動生成: Hot chocolate (僅 FooDB)', 'Hot chocolate', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2564', '[\"Hot dog\",\"hot dog\"]', 'Dishes', '自動生成: Hot dog (僅 FooDB)', 'Hot dog', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2565', '[\"Hummus\",\"hummus\"]', 'Dishes', '自動生成: Hummus (僅 FooDB)', 'Hummus', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2566', '[\"Hushpuppy\",\"hushpuppy\"]', 'Dishes', '自動生成: Hushpuppy (僅 FooDB)', 'Hushpuppy', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2567', '[\"Hyacinth bean\",\"hyacinth bean\",\"Lablab purpureus\"]', 'Pulses', '自動生成: Hyacinth bean (僅 FooDB)', 'Hyacinth bean', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2568', '[\"Hyssop\",\"hyssop\",\"Hyssopus officinalis\"]', 'Herbs and Spices', '自動生成: Hyssop (僅 FooDB)', 'Hyssop', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2569', '[\"Ice cream\",\"ice cream\"]', 'Confectioneries', '自動生成: Ice cream (僅 FooDB)', 'Ice cream', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2570', '[\"Ice cream cone\",\"ice cream cone\"]', 'Baking goods', '自動生成: Ice cream cone (僅 FooDB)', 'Ice cream cone', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2571', '[\"Iceberg lettuce\",\"iceberg lettuce\"]', 'Vegetables', '自動生成: Iceberg lettuce (僅 FooDB)', 'Iceberg lettuce', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2572', '[\"Icing\",\"icing\"]', 'Confectioneries', '自動生成: Icing (僅 FooDB)', 'Icing', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2573', '[\"Irish moss\",\"irish moss\",\"Chondrus crispus\"]', 'Aquatic foods', '自動生成: Irish moss (僅 FooDB)', 'Irish moss', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2574', '[\"Italian oregano\",\"italian oregano\",\"Origanum X majoricum\"]', 'Herbs and Spices', '自動生成: Italian oregano (僅 FooDB)', 'Italian oregano', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2575', '[\"Italian sweet red pepper\",\"italian sweet red pepper\",\"Capsicum annuum\"]', 'Vegetables', '自動生成: Italian sweet red pepper (僅 FooDB)', 'Italian sweet red pepper', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2576', '[\"Jackfruit\",\"jackfruit\",\"Artocarpus heterophyllus\"]', 'Fruits', '自動生成: Jackfruit (僅 FooDB)', 'Jackfruit', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2577', '[\"Jalapeno pepper\",\"jalapeno pepper\",\"Capsicum annuum \'Jalapeño\'\"]', 'Vegetables', '自動生成: Jalapeno pepper (僅 FooDB)', 'Jalapeno pepper', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2578', '[\"Japanese chestnut\",\"japanese chestnut\",\"Castanea crenata\"]', 'Nuts', '自動生成: Japanese chestnut (僅 FooDB)', 'Japanese chestnut', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2579', '[\"Japanese persimmon\",\"japanese persimmon\",\"Diospyros kaki\"]', 'Fruits', '自動生成: Japanese persimmon (僅 FooDB)', 'Japanese persimmon', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2580', '[\"Japanese sea bass\",\"japanese sea bass\",\"Lateolabrax japonicus\"]', 'Aquatic foods', '自動生成: Japanese sea bass (僅 FooDB)', 'Japanese sea bass', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2581', '[\"Japanese walnut\",\"japanese walnut\",\"Juglans ailanthifolia\"]', 'Nuts', '自動生成: Japanese walnut (僅 FooDB)', 'Japanese walnut', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2582', '[\"Java plum\",\"java plum\",\"Syzygium cumini\"]', 'Fruits', '自動生成: Java plum (僅 FooDB)', 'Java plum', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2583', '[\"Jellyfish\",\"jellyfish\",\"Scyphozoa\"]', 'Aquatic foods', '自動生成: Jellyfish (僅 FooDB)', 'Jellyfish', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2584', '[\"Jerusalem artichoke\",\"jerusalem artichoke\",\"Helianthus tuberosus\"]', 'Vegetables', '自動生成: Jerusalem artichoke (僅 FooDB)', 'Jerusalem artichoke', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2585', '[\"Jicama\",\"jicama\",\"Pachyrhizus erosus\"]', 'Vegetables', '自動生成: Jicama (僅 FooDB)', 'Jicama', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2586', '[\"Jostaberry\",\"jostaberry\",\"Ribes × nidigrolaria\"]', 'Fruits', '自動生成: Jostaberry (僅 FooDB)', 'Jostaberry', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2587', '[\"Jujube\",\"jujube\",\"Ziziphus zizyphus\"]', 'Fruits', '自動生成: Jujube (僅 FooDB)', 'Jujube', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2588', '[\"Juniperus communis\",\"juniperus communis\"]', 'Vegetables', '自動生成: Juniperus communis (僅 FooDB)', 'Juniperus communis', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2589', '[\"Junket\",\"junket\"]', 'Confectioneries', '自動生成: Junket (僅 FooDB)', 'Junket', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2590', '[\"Jute\",\"jute\",\"Corchorus olitorius\"]', 'Vegetables', '自動生成: Jute (僅 FooDB)', 'Jute', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2591', '[\"Kai-lan\",\"kai-lan\",\"Brassica oleracea var. alboglabra\"]', 'Vegetables', '自動生成: Kai-lan (僅 FooDB)', 'Kai-lan', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2592', '[\"Kale\",\"kale\",\"Brassica napus var. pabularia\"]', 'Vegetables', '自動生成: Kale (僅 FooDB)', 'Kale', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2593', '[\"Kefir\",\"kefir\"]', 'Milk and milk products', '自動生成: Kefir (僅 FooDB)', 'Kefir', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2594', '[\"Kelp\",\"kelp\",\"Laminaria\"]', 'Aquatic foods', '自動生成: Kelp (僅 FooDB)', 'Kelp', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2595', '[\"Ketchup\",\"ketchup\"]', 'Baking goods', '自動生成: Ketchup (僅 FooDB)', 'Ketchup', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2596', '[\"King mackerel\",\"king mackerel\",\"Scomberomorus cavalla\"]', 'Aquatic foods', '自動生成: King mackerel (僅 FooDB)', 'King mackerel', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2597', '[\"Kohlrabi\",\"kohlrabi\",\"Brassica oleracea var. gongylodes\"]', 'Vegetables', '自動生成: Kohlrabi (僅 FooDB)', 'Kohlrabi', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2598', '[\"Komatsuna\",\"komatsuna\",\"Brassica rapa var. perviridis\"]', 'Vegetables', '自動生成: Komatsuna (僅 FooDB)', 'Komatsuna', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2599', '[\"Kombu\",\"kombu\",\"Saccharina japonica\"]', 'Aquatic foods', '自動生成: Kombu (僅 FooDB)', 'Kombu', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2600', '[\"Kumquat\",\"kumquat\",\"Fortunella\"]', 'Fruits', '自動生成: Kumquat (僅 FooDB)', 'Kumquat', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2601', '[\"Lake trout\",\"lake trout\",\"Salvelinus namaycush\"]', 'Aquatic foods', '自動生成: Lake trout (僅 FooDB)', 'Lake trout', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2602', '[\"Lantern fruit\",\"lantern fruit\",\"Physalis alkekengi\"]', 'Fruits', '自動生成: Lantern fruit (僅 FooDB)', 'Lantern fruit', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2603', '[\"Lard\",\"lard\"]', 'Fats and oils', '自動生成: Lard (僅 FooDB)', 'Lard', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2604', '[\"Lasagna\",\"lasagna\"]', 'Dishes', '自動生成: Lasagna (僅 FooDB)', 'Lasagna', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2605', '[\"Leather chiton\",\"leather chiton\",\"Katharina tunicata\"]', 'Aquatic foods', '自動生成: Leather chiton (僅 FooDB)', 'Leather chiton', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2606', '[\"Leavening agent\",\"leavening agent\"]', 'Baking goods', '自動生成: Leavening agent (僅 FooDB)', 'Leavening agent', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2607', '[\"Leek\",\"leek\",\"Allium porrum\"]', 'Vegetables', '自動生成: Leek (僅 FooDB)', 'Leek', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2608', '[\"Lemon balm\",\"lemon balm\",\"Melissa officinalis\"]', 'Herbs and Spices', '自動生成: Lemon balm (僅 FooDB)', 'Lemon balm', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2609', '[\"Lemon grass\",\"lemon grass\",\"Cymbopogon citratus\"]', 'Herbs and Spices', '自動生成: Lemon grass (僅 FooDB)', 'Lemon grass', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2610', '[\"Lemon sole\",\"lemon sole\",\"Microstomus kitt\"]', 'Aquatic foods', '自動生成: Lemon sole (僅 FooDB)', 'Lemon sole', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2611', '[\"Lemon thyme\",\"lemon thyme\",\"Thymus pulegioides\"]', 'Herbs and Spices', '自動生成: Lemon thyme (僅 FooDB)', 'Lemon thyme', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2612', '[\"Lemon verbena\",\"lemon verbena\",\"Aloysia triphylla\"]', 'Herbs and Spices', '自動生成: Lemon verbena (僅 FooDB)', 'Lemon verbena', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2613', '[\"Lentils\",\"lentils\",\"Lens culinaris\"]', 'Pulses', '自動生成: Lentils (僅 FooDB)', 'Lentils', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2614', '[\"Lettuce\",\"lettuce\",\"Lactuca sativa\"]', 'Vegetables', '自動生成: Lettuce (僅 FooDB)', 'Lettuce', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2615', '[\"Lichee\",\"lichee\",\"Litchi chinensis\"]', 'Fruits', '自動生成: Lichee (僅 FooDB)', 'Lichee', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2616', '[\"Lima bean\",\"lima bean\",\"Phaseolus lunatus\"]', 'Pulses', '自動生成: Lima bean (僅 FooDB)', 'Lima bean', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2617', '[\"Linden\",\"linden\",\"Tilia\"]', 'Herbs and Spices', '自動生成: Linden (僅 FooDB)', 'Linden', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2618', '[\"Lingcod\",\"lingcod\",\"Ophiodon elongatus\"]', 'Aquatic foods', '自動生成: Lingcod (僅 FooDB)', 'Lingcod', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2619', '[\"Lingonberry\",\"lingonberry\",\"Vaccinium vitis-idaea\"]', 'Fruits', '自動生成: Lingonberry (僅 FooDB)', 'Lingonberry', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2620', '[\"linseed oil\"]', 'Herbs and Spices', '自動生成: linseed oil (僅 FooDB)', 'linseed oil', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2621', '[\"Liquor\",\"liquor\"]', 'Beverages', '自動生成: Liquor (僅 FooDB)', 'Liquor', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2622', '[\"Liquorice\",\"liquorice\"]', 'Confectioneries', '自動生成: Liquorice (僅 FooDB)', 'Liquorice', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2623', '[\"Loganberry\",\"loganberry\",\"Rubus loganobaccus\"]', 'Fruits', '自動生成: Loganberry (僅 FooDB)', 'Loganberry', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2624', '[\"Loquat\",\"loquat\",\"Eriobotrya japonica\"]', 'Fruits', '自動生成: Loquat (僅 FooDB)', 'Loquat', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2625', '[\"Lotus\",\"lotus\",\"Nelumbo\"]', 'Herbs and Spices', '自動生成: Lotus (僅 FooDB)', 'Lotus', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2626', '[\"Lovage\",\"lovage\",\"Levisticum officinale\"]', 'Herbs and Spices', '自動生成: Lovage (僅 FooDB)', 'Lovage', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2627', '[\"Lowbush blueberry\",\"lowbush blueberry\",\"Vaccinium angustifolium\"]', 'Fruits', '自動生成: Lowbush blueberry (僅 FooDB)', 'Lowbush blueberry', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2628', '[\"Lumpsucker\",\"lumpsucker\",\"Cyclopteridae\"]', 'Aquatic foods', '自動生成: Lumpsucker (僅 FooDB)', 'Lumpsucker', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2629', '[\"Lupine\",\"lupine\",\"Lupinus\"]', 'Pulses', '自動生成: Lupine (僅 FooDB)', 'Lupine', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2630', '[\"Macadamia nut\",\"macadamia nut\",\"Macadamia\"]', 'Nuts', '自動生成: Macadamia nut (僅 FooDB)', 'Macadamia nut', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2631', '[\"Macadamia nut (M. tetraphylla)\",\"macadamia nut (m. tetraphylla)\",\"Macadamia tetraphylla\"]', 'Nuts', '自動生成: Macadamia nut (M. tetraphylla) (僅 FooDB)', 'Macadamia nut (M. tetraphylla)', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2632', '[\"Macaroni and cheese\",\"macaroni and cheese\"]', 'Dishes', '自動生成: Macaroni and cheese (僅 FooDB)', 'Macaroni and cheese', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2633', '[\"Macroalgae\",\"macroalgae\"]', 'Aquatic foods', '自動生成: Macroalgae (僅 FooDB)', 'Macroalgae', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2634', '[\"Madeira wine\",\"madeira wine\"]', 'Beverages', '自動生成: Madeira wine (僅 FooDB)', 'Madeira wine', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2635', '[\"Maitake\",\"maitake\",\"Grifola frondosa\"]', 'Vegetables', '自動生成: Maitake (僅 FooDB)', 'Maitake', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2636', '[\"Malabar plum\",\"malabar plum\",\"Syzygium jambos\"]', 'Fruits', '自動生成: Malabar plum (僅 FooDB)', 'Malabar plum', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2637', '[\"Mallard duck\",\"mallard duck\",\"Anas platyrhynchos\"]', 'Animal foods', '自動生成: Mallard duck (僅 FooDB)', 'Mallard duck', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2638', '[\"Malus (Crab apple)\",\"malus (crab apple)\",\"Malus\"]', 'Fruits', '自動生成: Malus (Crab apple) (僅 FooDB)', 'Malus (Crab apple)', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2639', '[\"Mamey sapote\",\"mamey sapote\",\"Pouteria sapota\"]', 'Fruits', '自動生成: Mamey sapote (僅 FooDB)', 'Mamey sapote', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2640', '[\"Mammee apple\",\"mammee apple\",\"Mammea americana\"]', 'Fruits', '自動生成: Mammee apple (僅 FooDB)', 'Mammee apple', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2641', '[\"Margarine\",\"margarine\"]', 'Fats and oils', '自動生成: Margarine (僅 FooDB)', 'Margarine', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2642', '[\"Margarine-like spread\",\"margarine-like spread\"]', 'Fats and oils', '自動生成: Margarine-like spread (僅 FooDB)', 'Margarine-like spread', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2643', '[\"Marine mussel\",\"marine mussel\",\"Mytilidae\"]', 'Aquatic foods', '自動生成: Marine mussel (僅 FooDB)', 'Marine mussel', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2644', '[\"Marshmallow\",\"marshmallow\"]', 'Confectioneries', '自動生成: Marshmallow (僅 FooDB)', 'Marshmallow', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2645', '[\"Marzipan\",\"marzipan\"]', 'Confectioneries', '自動生成: Marzipan (僅 FooDB)', 'Marzipan', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2646', '[\"Mate\",\"mate\",\"Ilex paraguariensis\"]', 'Herbs and Spices', '自動生成: Mate (僅 FooDB)', 'Mate', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2647', '[\"Meat bouillon\",\"meat bouillon\"]', 'Baking goods', '自動生成: Meat bouillon (僅 FooDB)', 'Meat bouillon', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2648', '[\"Meatball\",\"meatball\"]', 'Dishes', '自動生成: Meatball (僅 FooDB)', 'Meatball', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2649', '[\"Meatloaf\",\"meatloaf\"]', 'Dishes', '自動生成: Meatloaf (僅 FooDB)', 'Meatloaf', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2650', '[\"Medlar\",\"medlar\",\"Mespilus germanica\"]', 'Fruits', '自動生成: Medlar (僅 FooDB)', 'Medlar', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2651', '[\"Mentha\",\"mentha\"]', 'Herbs and Spices', '自動生成: Mentha (僅 FooDB)', 'Mentha', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2652', '[\"Meringue\",\"meringue\"]', 'Confectioneries', '自動生成: Meringue (僅 FooDB)', 'Meringue', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2653', '[\"Mexican groundcherry\",\"mexican groundcherry\",\"Physalis philadelphica var. immaculata\"]', 'Vegetables', '自動生成: Mexican groundcherry (僅 FooDB)', 'Mexican groundcherry', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2654', '[\"Mexican oregano\",\"mexican oregano\",\"Lippia graveolens\"]', 'Herbs and Spices', '自動生成: Mexican oregano (僅 FooDB)', 'Mexican oregano', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2655', '[\"Mikan\",\"mikan\",\"Citrus unshiu\"]', 'Fruits', '自動生成: Mikan (僅 FooDB)', 'Mikan', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2656', '[\"Milk (Cow)\",\"milk (cow)\"]', 'Milk and milk products', '自動生成: Milk (Cow) (僅 FooDB)', 'Milk (Cow)', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2657', '[\"Milk (Human)\",\"milk (human)\"]', 'Milk and milk products', '自動生成: Milk (Human) (僅 FooDB)', 'Milk (Human)', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2658', '[\"Milk (Other mammals)\",\"milk (other mammals)\"]', 'Milk and milk products', '自動生成: Milk (Other mammals) (僅 FooDB)', 'Milk (Other mammals)', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2659', '[\"Milk and milk products\",\"milk and milk products\"]', 'Milk and milk products', '自動生成: Milk and milk products (僅 FooDB)', 'Milk and milk products', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2660', '[\"Milk substitute\",\"milk substitute\"]', 'Baking goods', '自動生成: Milk substitute (僅 FooDB)', 'Milk substitute', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2661', '[\"Milkfish\",\"milkfish\",\"Chanos chanos\"]', 'Aquatic foods', '自動生成: Milkfish (僅 FooDB)', 'Milkfish', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2662', '[\"Milkshake\",\"milkshake\"]', 'Confectioneries', '自動生成: Milkshake (僅 FooDB)', 'Milkshake', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2663', '[\"Millet\",\"millet\",\"Panicum miliaceum\"]', 'Cereals and cereal products', '自動生成: Millet (僅 FooDB)', 'Millet', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2664', '[\"Miso\",\"miso\"]', 'Soy', '自動生成: Miso (僅 FooDB)', 'Miso', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2665', '[\"Mixed nuts\",\"mixed nuts\"]', 'Nuts', '自動生成: Mixed nuts (僅 FooDB)', 'Mixed nuts', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2666', '[\"Molasses\",\"molasses\"]', 'Baking goods', '自動生成: Molasses (僅 FooDB)', 'Molasses', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2667', '[\"Mollusks\",\"mollusks\"]', 'Aquatic foods', '自動生成: Mollusks (僅 FooDB)', 'Mollusks', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2668', '[\"Monk fruit\",\"monk fruit\",\"Siraitia grosvenorii\"]', 'Fruits', '自動生成: Monk fruit (僅 FooDB)', 'Monk fruit', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2669', '[\"Monkfish\",\"monkfish\",\"Lophius piscatorius\"]', 'Aquatic foods', '自動生成: Monkfish (僅 FooDB)', 'Monkfish', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2670', '[\"Monterey Jack cheese\",\"monterey jack cheese\"]', 'Milk and milk products', '自動生成: Monterey Jack cheese (僅 FooDB)', 'Monterey Jack cheese', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2671', '[\"Morchella (Morel)\",\"morchella (morel)\",\"Morchellaceae\"]', 'Vegetables', '自動生成: Morchella (Morel) (僅 FooDB)', 'Morchella (Morel)', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2672', '[\"Moth bean\",\"moth bean\",\"Vigna aconitifolia\"]', 'Pulses', '自動生成: Moth bean (僅 FooDB)', 'Moth bean', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2673', '[\"Mountain hare\",\"mountain hare\",\"Lepus timidus\"]', 'Animal foods', '自動生成: Mountain hare (僅 FooDB)', 'Mountain hare', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2674', '[\"Mountain yam\",\"mountain yam\",\"Dioscorea pentaphylla\"]', 'Vegetables', '自動生成: Mountain yam (僅 FooDB)', 'Mountain yam', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2675', '[\"Mozzarella cheese\",\"mozzarella cheese\"]', 'Milk and milk products', '自動生成: Mozzarella cheese (僅 FooDB)', 'Mozzarella cheese', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2676', '[\"Mugwort\",\"mugwort\",\"Artemisia vulgaris\"]', 'Herbs and Spices', '自動生成: Mugwort (僅 FooDB)', 'Mugwort', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2677', '[\"Mulberry\",\"mulberry\",\"Morus\"]', 'Fruits', '自動生成: Mulberry (僅 FooDB)', 'Mulberry', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2678', '[\"Mule deer\",\"mule deer\",\"Odocoileus\"]', 'Animal foods', '自動生成: Mule deer (僅 FooDB)', 'Mule deer', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2679', '[\"Multigrain bread\",\"multigrain bread\"]', 'Cereals and cereal products', '自動生成: Multigrain bread (僅 FooDB)', 'Multigrain bread', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2680', '[\"Mundu\",\"mundu\",\"Garcinia dulcis\"]', 'Fruits', '自動生成: Mundu (僅 FooDB)', 'Mundu', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2681', '[\"Muscadine grape\",\"muscadine grape\",\"Vitis rotundifolia\"]', 'Fruits', '自動生成: Muscadine grape (僅 FooDB)', 'Muscadine grape', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2682', '[\"Mushrooms\",\"mushrooms\"]', 'Vegetables', '自動生成: Mushrooms (僅 FooDB)', 'Mushrooms', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2683', '[\"Muskmelon\",\"muskmelon\",\"Cucumis melo\"]', 'Gourds', '自動生成: Muskmelon (僅 FooDB)', 'Muskmelon', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2684', '[\"Mustard\",\"mustard\"]', 'Baking goods', '自動生成: Mustard (僅 FooDB)', 'Mustard', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2685', '[\"Mustard spinach\",\"mustard spinach\",\"Brassica perviridis\"]', 'Vegetables', '自動生成: Mustard spinach (僅 FooDB)', 'Mustard spinach', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2686', '[\"Nachos\",\"nachos\"]', 'Dishes', '自動生成: Nachos (僅 FooDB)', 'Nachos', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2687', '[\"Nance\",\"nance\",\"Byrsonima crassifolia\"]', 'Fruits', '自動生成: Nance (僅 FooDB)', 'Nance', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2688', '[\"Nanking cherry\",\"nanking cherry\",\"Prunus tomentosa\"]', 'Fruits', '自動生成: Nanking cherry (僅 FooDB)', 'Nanking cherry', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2689', '[\"Napa cabbage\",\"napa cabbage\",\"Brassica rapa var. pekinensis\"]', 'Vegetables', '自動生成: Napa cabbage (僅 FooDB)', 'Napa cabbage', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2690', '[\"Naranjilla\",\"naranjilla\",\"Solanum quitoense\"]', 'Fruits', '自動生成: Naranjilla (僅 FooDB)', 'Naranjilla', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2691', '[\"Narrowleaf cattail\",\"narrowleaf cattail\",\"Typha angustifolia\"]', 'Vegetables', '自動生成: Narrowleaf cattail (僅 FooDB)', 'Narrowleaf cattail', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2692', '[\"Natal plum\",\"natal plum\",\"Carissa macrocarpa\"]', 'Fruits', '自動生成: Natal plum (僅 FooDB)', 'Natal plum', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2693', '[\"Natto\",\"natto\"]', 'Soy', '自動生成: Natto (僅 FooDB)', 'Natto', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2694', '[\"Nectarine\",\"nectarine\",\"Prunus persica var. nucipersica\"]', 'Fruits', '自動生成: Nectarine (僅 FooDB)', 'Nectarine', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2695', '[\"New Zealand spinach\",\"new zealand spinach\",\"Tetragonia tetragonioides\"]', 'Vegetables', '自動生成: New Zealand spinach (僅 FooDB)', 'New Zealand spinach', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2696', '[\"Nopal\",\"nopal\",\"Opuntia cochenillifera\"]', 'Vegetables', '自動生成: Nopal (僅 FooDB)', 'Nopal', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2697', '[\"North Pacific giant octopus\",\"north pacific giant octopus\",\"Enteroctopus dofleini\"]', 'Aquatic foods', '自動生成: North Pacific giant octopus (僅 FooDB)', 'North Pacific giant octopus', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2698', '[\"Northern bluefin tuna\",\"northern bluefin tuna\",\"Thunnus thynnus\"]', 'Aquatic foods', '自動生成: Northern bluefin tuna (僅 FooDB)', 'Northern bluefin tuna', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2699', '[\"Northern pike\",\"northern pike\",\"Esox lucius\"]', 'Aquatic foods', '自動生成: Northern pike (僅 FooDB)', 'Northern pike', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2700', '[\"Norway haddock\",\"norway haddock\",\"Sebastes viviparus\"]', 'Aquatic foods', '自動生成: Norway haddock (僅 FooDB)', 'Norway haddock', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2701', '[\"Norway lobster\",\"norway lobster\",\"Nephrops norvegicus\"]', 'Aquatic foods', '自動生成: Norway lobster (僅 FooDB)', 'Norway lobster', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2702', '[\"Norway pout\",\"norway pout\",\"Trisopterus esmarkii\"]', 'Aquatic foods', '自動生成: Norway pout (僅 FooDB)', 'Norway pout', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2703', '[\"Nougat\",\"nougat\"]', 'Confectioneries', '自動生成: Nougat (僅 FooDB)', 'Nougat', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2704', '[\"Nutmeg\",\"nutmeg\",\"Myristica fragrans\"]', 'Herbs and Spices', '自動生成: Nutmeg (僅 FooDB)', 'Nutmeg', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2705', '[\"Nutritional drink\",\"nutritional drink\"]', 'Beverages', '自動生成: Nutritional drink (僅 FooDB)', 'Nutritional drink', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2706', '[\"Nuts\",\"nuts\"]', 'Nuts', '自動生成: Nuts (僅 FooDB)', 'Nuts', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2707', '[\"Nuttall cockle\",\"nuttall cockle\",\"Clinocardium nuttallii\"]', 'Aquatic foods', '自動生成: Nuttall cockle (僅 FooDB)', 'Nuttall cockle', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2708', '[\"Oat\",\"oat\",\"Avena sativa\"]', 'Cereals and cereal products', '自動生成: Oat (僅 FooDB)', 'Oat', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2709', '[\"Oat bread\",\"oat bread\"]', 'Cereals and cereal products', '自動生成: Oat bread (僅 FooDB)', 'Oat bread', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2710', '[\"Ocean pout\",\"ocean pout\",\"Zoarces americanus\"]', 'Aquatic foods', '自動生成: Ocean pout (僅 FooDB)', 'Ocean pout', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2711', '[\"Ohelo berry\",\"ohelo berry\",\"Vaccinium reticulatum\"]', 'Fruits', '自動生成: Ohelo berry (僅 FooDB)', 'Ohelo berry', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2712', '[\"Oil palm\",\"oil palm\",\"Elaeis\"]', 'Herbs and Spices', '自動生成: Oil palm (僅 FooDB)', 'Oil palm', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2713', '[\"Oil-seed Camellia\",\"oil-seed camellia\",\"Camellia oleifera\"]', 'Herbs and Spices', '自動生成: Oil-seed Camellia (僅 FooDB)', 'Oil-seed Camellia', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2714', '[\"Okra\",\"okra\",\"Abelmoschus esculentus\"]', 'Vegetables', '自動生成: Okra (僅 FooDB)', 'Okra', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2715', '[\"Olive\",\"olive\",\"Olea europaea\"]', 'Vegetables', '自動生成: Olive (僅 FooDB)', 'Olive', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2716', '[\"Onion-family vegetables\",\"onion-family vegetables\"]', 'Vegetables', '自動生成: Onion-family vegetables (僅 FooDB)', 'Onion-family vegetables', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2717', '[\"Opium poppy\",\"opium poppy\",\"Papaver somniferum\"]', 'Herbs and Spices', '自動生成: Opium poppy (僅 FooDB)', 'Opium poppy', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2718', '[\"Orange bell pepper\",\"orange bell pepper\",\"Capsicum annuum\"]', 'Vegetables', '自動生成: Orange bell pepper (僅 FooDB)', 'Orange bell pepper', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2719', '[\"Orange mint\",\"orange mint\",\"Mentha aquatica\"]', 'Herbs and Spices', '自動生成: Orange mint (僅 FooDB)', 'Orange mint', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2720', '[\"Orange roughy\",\"orange roughy\",\"Hoplostethus atlanticus\"]', 'Aquatic foods', '自動生成: Orange roughy (僅 FooDB)', 'Orange roughy', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2721', '[\"Oregon yampah\",\"oregon yampah\",\"Perideridia oregana\"]', 'Vegetables', '自動生成: Oregon yampah (僅 FooDB)', 'Oregon yampah', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2722', '[\"Oriental wheat\",\"oriental wheat\",\"Triticum turanicum\"]', 'Cereals and cereal products', '自動生成: Oriental wheat (僅 FooDB)', 'Oriental wheat', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2723', '[\"Ostrich\",\"ostrich\",\"Struthio camelus\"]', 'Animal foods', '自動生成: Ostrich (僅 FooDB)', 'Ostrich', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2724', '[\"Ostrich fern\",\"ostrich fern\",\"Matteuccia struthiopteris\"]', 'Vegetables', '自動生成: Ostrich fern (僅 FooDB)', 'Ostrich fern', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2725', '[\"Other alcoholic beverage\",\"other alcoholic beverage\"]', 'Beverages', '自動生成: Other alcoholic beverage (僅 FooDB)', 'Other alcoholic beverage', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2726', '[\"Other animal fat\",\"other animal fat\"]', 'Fats and oils', '自動生成: Other animal fat (僅 FooDB)', 'Other animal fat', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2727', '[\"Other beverage\",\"other beverage\"]', 'Beverages', '自動生成: Other beverage (僅 FooDB)', 'Other beverage', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2728', '[\"Other bread\",\"other bread\"]', 'Cereals and cereal products', '自動生成: Other bread (僅 FooDB)', 'Other bread', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2729', '[\"Other bread product\",\"other bread product\"]', 'Cereals and cereal products', '自動生成: Other bread product (僅 FooDB)', 'Other bread product', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2730', '[\"Other candy\",\"other candy\"]', 'Confectioneries', '自動生成: Other candy (僅 FooDB)', 'Other candy', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2731', '[\"Other cereal product\",\"other cereal product\"]', 'Cereals and cereal products', '自動生成: Other cereal product (僅 FooDB)', 'Other cereal product', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2732', '[\"Other cocoa product\",\"other cocoa product\"]', 'Cocoa and cocoa products', '自動生成: Other cocoa product (僅 FooDB)', 'Other cocoa product', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2733', '[\"Other dish\",\"other dish\"]', 'Dishes', '自動生成: Other dish (僅 FooDB)', 'Other dish', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2734', '[\"Other fermented milk\",\"other fermented milk\"]', 'Milk and milk products', '自動生成: Other fermented milk (僅 FooDB)', 'Other fermented milk', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2735', '[\"Other fish product\",\"other fish product\"]', 'Aquatic foods', '自動生成: Other fish product (僅 FooDB)', 'Other fish product', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2736', '[\"Other frozen dessert\",\"other frozen dessert\"]', 'Confectioneries', '自動生成: Other frozen dessert (僅 FooDB)', 'Other frozen dessert', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2737', '[\"Other fruit product\",\"other fruit product\"]', 'Fruits', '自動生成: Other fruit product (僅 FooDB)', 'Other fruit product', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2738', '[\"Other sandwich\",\"other sandwich\"]', 'Dishes', '自動生成: Other sandwich (僅 FooDB)', 'Other sandwich', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2739', '[\"Other snack food\",\"other snack food\"]', 'Snack foods', '自動生成: Other snack food (僅 FooDB)', 'Other snack food', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2740', '[\"Other soy product\",\"other soy product\"]', 'Soy', '自動生成: Other soy product (僅 FooDB)', 'Other soy product', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2741', '[\"Other vegetable product\",\"other vegetable product\"]', 'Vegetables', '自動生成: Other vegetable product (僅 FooDB)', 'Other vegetable product', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2742', '[\"Other wine\",\"other wine\"]', 'Beverages', '自動生成: Other wine (僅 FooDB)', 'Other wine', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2743', '[\"Oval-leaf huckleberry\",\"oval-leaf huckleberry\",\"Vaccinium ovalifolium\"]', 'Fruits', '自動生成: Oval-leaf huckleberry (僅 FooDB)', 'Oval-leaf huckleberry', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2744', '[\"Oxheart cabbage\",\"oxheart cabbage\",\"Brassica oleracea var. conica\"]', 'Vegetables', '自動生成: Oxheart cabbage (僅 FooDB)', 'Oxheart cabbage', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2745', '[\"Oyster mushroom\",\"oyster mushroom\",\"Pleurotus ostreatus\"]', 'Vegetables', '自動生成: Oyster mushroom (僅 FooDB)', 'Oyster mushroom', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2746', '[\"Pacific cod\",\"pacific cod\",\"Gadus macrocephalus\"]', 'Aquatic foods', '自動生成: Pacific cod (僅 FooDB)', 'Pacific cod', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2747', '[\"Pacific halibut\",\"pacific halibut\",\"Hippoglossus stenolepis\"]', 'Aquatic foods', '自動生成: Pacific halibut (僅 FooDB)', 'Pacific halibut', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2748', '[\"Pacific herring\",\"pacific herring\",\"Clupea pallasii\"]', 'Aquatic foods', '自動生成: Pacific herring (僅 FooDB)', 'Pacific herring', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2749', '[\"Pacific jack mackerel\",\"pacific jack mackerel\",\"Trachurus symmetricus\"]', 'Aquatic foods', '自動生成: Pacific jack mackerel (僅 FooDB)', 'Pacific jack mackerel', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2750', '[\"Pacific ocean perch\",\"pacific ocean perch\",\"Sebastes alutus\"]', 'Aquatic foods', '自動生成: Pacific ocean perch (僅 FooDB)', 'Pacific ocean perch', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2751', '[\"Pacific oyster\",\"pacific oyster\",\"Crassostrea gigas\"]', 'Aquatic foods', '自動生成: Pacific oyster (僅 FooDB)', 'Pacific oyster', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2752', '[\"Pacific rockfish\",\"pacific rockfish\",\"Sebastes\"]', 'Aquatic foods', '自動生成: Pacific rockfish (僅 FooDB)', 'Pacific rockfish', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2753', '[\"Pacific salmon\",\"pacific salmon\",\"Oncorhynchus\"]', 'Aquatic foods', '自動生成: Pacific salmon (僅 FooDB)', 'Pacific salmon', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2754', '[\"Pacific sardine\",\"pacific sardine\",\"Sardinops sagax\"]', 'Aquatic foods', '自動生成: Pacific sardine (僅 FooDB)', 'Pacific sardine', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2755', '[\"Painted comber\",\"painted comber\",\"Serranus scriba\"]', 'Aquatic foods', '自動生成: Painted comber (僅 FooDB)', 'Painted comber', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2756', '[\"Pak choy\",\"pak choy\",\"Brassica rapa var. chinensis\"]', 'Vegetables', '自動生成: Pak choy (僅 FooDB)', 'Pak choy', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2757', '[\"Pan dulce\",\"pan dulce\"]', 'Cereals and cereal products', '自動生成: Pan dulce (僅 FooDB)', 'Pan dulce', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2758', '[\"Pancake\",\"pancake\"]', 'Dishes', '自動生成: Pancake (僅 FooDB)', 'Pancake', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2759', '[\"Parmesan cheese\",\"parmesan cheese\"]', 'Milk and milk products', '自動生成: Parmesan cheese (僅 FooDB)', 'Parmesan cheese', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2760', '[\"Parsley\",\"parsley\",\"Petroselinum crispum\"]', 'Herbs and Spices', '自動生成: Parsley (僅 FooDB)', 'Parsley', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2761', '[\"Parsnip\",\"parsnip\",\"Pastinaca sativa\"]', 'Vegetables', '自動生成: Parsnip (僅 FooDB)', 'Parsnip', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2762', '[\"Partridge berry\",\"partridge berry\",\"Mitchella repens\"]', 'Fruits', '自動生成: Partridge berry (僅 FooDB)', 'Partridge berry', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2763', '[\"Passion fruit\",\"passion fruit\",\"Passiflora edulis\"]', 'Fruits', '自動生成: Passion fruit (僅 FooDB)', 'Passion fruit', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2764', '[\"Pasta\",\"pasta\"]', 'Cereals and cereal products', '自動生成: Pasta (僅 FooDB)', 'Pasta', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2765', '[\"Pastry\",\"pastry\"]', 'Confectioneries', '自動生成: Pastry (僅 FooDB)', 'Pastry', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2766', '[\"Pate\",\"pate\"]', 'Dishes', '自動生成: Pate (僅 FooDB)', 'Pate', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2767', '[\"Pea shoots\",\"pea shoots\"]', 'Vegetables', '自動生成: Pea shoots (僅 FooDB)', 'Pea shoots', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2768', '[\"Peach\",\"peach\",\"Prunus persica\"]', 'Fruits', '自動生成: Peach (僅 FooDB)', 'Peach', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2769', '[\"Peach (var.)\",\"peach (var.)\",\"Prunus persica var. persica\"]', 'Fruits', '自動生成: Peach (var.) (僅 FooDB)', 'Peach (var.)', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2770', '[\"Pear\",\"pear\",\"Pyrus communis\"]', 'Fruits', '自動生成: Pear (僅 FooDB)', 'Pear', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2771', '[\"Pecan nut\",\"pecan nut\",\"Carya illinoinensis\"]', 'Nuts', '自動生成: Pecan nut (僅 FooDB)', 'Pecan nut', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2772', '[\"Pectin\",\"pectin\"]', 'Baking goods', '自動生成: Pectin (僅 FooDB)', 'Pectin', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2773', '[\"Pepper\",\"pepper\",\"Capsicum annuum\"]', 'Vegetables', '自動生成: Pepper (僅 FooDB)', 'Pepper', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2774', '[\"Pepper (C. baccatum)\",\"pepper (c. baccatum)\",\"Capsicum baccatum var. baccatum\"]', 'Vegetables', '自動生成: Pepper (C. baccatum) (僅 FooDB)', 'Pepper (C. baccatum)', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2775', '[\"Pepper (C. chinense)\",\"pepper (c. chinense)\",\"Capsicum chinense\"]', 'Vegetables', '自動生成: Pepper (C. chinense) (僅 FooDB)', 'Pepper (C. chinense)', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2776', '[\"Pepper (C. frutescens)\",\"pepper (c. frutescens)\",\"Capsicum annuum var. annuum\"]', 'Vegetables', '自動生成: Pepper (C. frutescens) (僅 FooDB)', 'Pepper (C. frutescens)', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2777', '[\"Pepper (C. pubescens)\",\"pepper (c. pubescens)\",\"Capsicum pubescens\"]', 'Vegetables', '自動生成: Pepper (C. pubescens) (僅 FooDB)', 'Pepper (C. pubescens)', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2778', '[\"Pepper (Capsicum)\",\"pepper (capsicum)\",\"Capsicum\"]', 'Vegetables', '自動生成: Pepper (Capsicum) (僅 FooDB)', 'Pepper (Capsicum)', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2779', '[\"Pepper (Spice)\",\"pepper (spice)\",\"Piper nigrum\"]', 'Herbs and Spices', '自動生成: Pepper (Spice) (僅 FooDB)', 'Pepper (Spice)', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2780', '[\"Peppermint\",\"peppermint\",\"Mentha X piperita\"]', 'Herbs and Spices', '自動生成: Peppermint (僅 FooDB)', 'Peppermint', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2781', '[\"Perciformes\",\"perciformes\"]', 'Aquatic foods', '自動生成: Perciformes (僅 FooDB)', 'Perciformes', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2782', '[\"Percoidei (Bass and others)\",\"percoidei (bass and others)\",\"Percoidei\"]', 'Aquatic foods', '自動生成: Percoidei (Bass and others) (僅 FooDB)', 'Percoidei (Bass and others)', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2783', '[\"Persian lime\",\"persian lime\",\"Citrus latifolia\"]', 'Fruits', '自動生成: Persian lime (僅 FooDB)', 'Persian lime', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2784', '[\"Persimmon\",\"persimmon\",\"Diospyros\"]', 'Fruits', '自動生成: Persimmon (僅 FooDB)', 'Persimmon', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2785', '[\"Pheasant\",\"pheasant\",\"Phasianus colchicus\"]', 'Animal foods', '自動生成: Pheasant (僅 FooDB)', 'Pheasant', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2786', '[\"Phyllo dough\",\"phyllo dough\"]', 'Baking goods', '自動生成: Phyllo dough (僅 FooDB)', 'Phyllo dough', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2787', '[\"Pie\",\"pie\"]', 'Confectioneries', '自動生成: Pie (僅 FooDB)', 'Pie', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2788', '[\"Pie crust\",\"pie crust\"]', 'Baking goods', '自動生成: Pie crust (僅 FooDB)', 'Pie crust', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2789', '[\"Pie filling\",\"pie filling\"]', 'Baking goods', '自動生成: Pie filling (僅 FooDB)', 'Pie filling', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2790', '[\"Pigeon pea\",\"pigeon pea\",\"Cajanus cajan\"]', 'Pulses', '自動生成: Pigeon pea (僅 FooDB)', 'Pigeon pea', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2791', '[\"Pikeperch\",\"pikeperch\",\"Sander lucioperca\"]', 'Aquatic foods', '自動生成: Pikeperch (僅 FooDB)', 'Pikeperch', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2792', '[\"Piki bread\",\"piki bread\"]', 'Cereals and cereal products', '自動生成: Piki bread (僅 FooDB)', 'Piki bread', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2793', '[\"Pili nut\",\"pili nut\",\"Canarium ovatum\"]', 'Nuts', '自動生成: Pili nut (僅 FooDB)', 'Pili nut', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2794', '[\"Pineappple sage\",\"pineappple sage\",\"Salvia elegans\"]', 'Herbs and Spices', '自動生成: Pineappple sage (僅 FooDB)', 'Pineappple sage', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2795', '[\"Pink salmon\",\"pink salmon\",\"Oncorhynchus gorbuscha\"]', 'Aquatic foods', '自動生成: Pink salmon (僅 FooDB)', 'Pink salmon', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2796', '[\"Pita bread\",\"pita bread\"]', 'Cereals and cereal products', '自動生成: Pita bread (僅 FooDB)', 'Pita bread', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2797', '[\"Pitanga\",\"pitanga\",\"Eugenia uniflora\"]', 'Fruits', '自動生成: Pitanga (僅 FooDB)', 'Pitanga', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2798', '[\"Pitaya\",\"pitaya\",\"Hylocereus undatus\"]', 'Fruits', '自動生成: Pitaya (僅 FooDB)', 'Pitaya', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2799', '[\"Pizza\",\"pizza\"]', 'Dishes', '自動生成: Pizza (僅 FooDB)', 'Pizza', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2800', '[\"Plain cream cheese\",\"plain cream cheese\"]', 'Milk and milk products', '自動生成: Plain cream cheese (僅 FooDB)', 'Plain cream cheese', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2801', '[\"Plains prickly pear\",\"plains prickly pear\",\"Opuntia macrorhiza\"]', 'Fruits', '自動生成: Plains prickly pear (僅 FooDB)', 'Plains prickly pear', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2802', '[\"Plantain\",\"plantain\",\"Musa × paradisiaca\"]', 'Fruits', '自動生成: Plantain (僅 FooDB)', 'Plantain', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2803', '[\"Pleuronectidae (Dab, Halibut, Plaice)\",\"pleuronectidae (dab, halibut, plaice)\",\"Pleuronectidae\"]', 'Aquatic foods', '自動生成: Pleuronectidae (Dab, Halibut, Plaice) (僅 FooDB)', 'Pleuronectidae (Dab, Halibut, Plaice)', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2804', '[\"Pollock\",\"pollock\",\"Pollachius\"]', 'Aquatic foods', '自動生成: Pollock (僅 FooDB)', 'Pollock', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2805', '[\"Pomegranate\",\"pomegranate\",\"Punica granatum\"]', 'Fruits', '自動生成: Pomegranate (僅 FooDB)', 'Pomegranate', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2806', '[\"Pomes\",\"pomes\"]', 'Fruits', '自動生成: Pomes (僅 FooDB)', 'Pomes', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2807', '[\"Popcorn\",\"popcorn\"]', 'Snack foods', '自動生成: Popcorn (僅 FooDB)', 'Popcorn', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2808', '[\"Poppy\",\"poppy\",\"Papaver\"]', 'Herbs and Spices', '自動生成: Poppy (僅 FooDB)', 'Poppy', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2809', '[\"Port wine\",\"port wine\"]', 'Beverages', '自動生成: Port wine (僅 FooDB)', 'Port wine', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2810', '[\"Pot marjoram\",\"pot marjoram\",\"Origanum onites\"]', 'Herbs and Spices', '自動生成: Pot marjoram (僅 FooDB)', 'Pot marjoram', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2811', '[\"Pot pie\",\"pot pie\"]', 'Dishes', '自動生成: Pot pie (僅 FooDB)', 'Pot pie', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2812', '[\"Potato\",\"potato\",\"Solanum tuberosum\"]', 'Vegetables', '自動生成: Potato (僅 FooDB)', 'Potato', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2813', '[\"Potato bread\",\"potato bread\"]', 'Cereals and cereal products', '自動生成: Potato bread (僅 FooDB)', 'Potato bread', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2814', '[\"Potato chip\",\"potato chip\"]', 'Snack foods', '自動生成: Potato chip (僅 FooDB)', 'Potato chip', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2815', '[\"Potato gratin\",\"potato gratin\"]', 'Dishes', '自動生成: Potato gratin (僅 FooDB)', 'Potato gratin', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2816', '[\"Potato puffs\",\"potato puffs\"]', 'Dishes', '自動生成: Potato puffs (僅 FooDB)', 'Potato puffs', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2817', '[\"Prairie turnip\",\"prairie turnip\",\"Pediomelum esculentum\"]', 'Vegetables', '自動生成: Prairie turnip (僅 FooDB)', 'Prairie turnip', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2818', '[\"Prickly pear\",\"prickly pear\",\"Opuntia\"]', 'Fruits', '自動生成: Prickly pear (僅 FooDB)', 'Prickly pear', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2819', '[\"Processed cheese\",\"processed cheese\"]', 'Milk and milk products', '自動生成: Processed cheese (僅 FooDB)', 'Processed cheese', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2820', '[\"Prunus (Cherry, Plum)\",\"prunus (cherry, plum)\",\"Prunus\"]', 'Fruits', '自動生成: Prunus (Cherry, Plum) (僅 FooDB)', 'Prunus (Cherry, Plum)', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2821', '[\"Pudding\",\"pudding\"]', 'Confectioneries', '自動生成: Pudding (僅 FooDB)', 'Pudding', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2822', '[\"Pulses\",\"pulses\"]', 'Pulses', '自動生成: Pulses (僅 FooDB)', 'Pulses', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2823', '[\"Pummelo\",\"pummelo\",\"Citrus maxima\"]', 'Fruits', '自動生成: Pummelo (僅 FooDB)', 'Pummelo', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2824', '[\"Pumpkinseed sunfish\",\"pumpkinseed sunfish\",\"Lepomis gibbosus\"]', 'Aquatic foods', '自動生成: Pumpkinseed sunfish (僅 FooDB)', 'Pumpkinseed sunfish', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2825', '[\"Pupusa\",\"pupusa\"]', 'Dishes', '自動生成: Pupusa (僅 FooDB)', 'Pupusa', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2826', '[\"Purple laver\",\"purple laver\",\"Porphyra laciniata\"]', 'Aquatic foods', '自動生成: Purple laver (僅 FooDB)', 'Purple laver', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2827', '[\"Purple mangosteen\",\"purple mangosteen\",\"Garcinia mangostana\"]', 'Fruits', '自動生成: Purple mangosteen (僅 FooDB)', 'Purple mangosteen', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2828', '[\"Purslane\",\"purslane\",\"Portulaca oleracea\"]', 'Herbs and Spices', '自動生成: Purslane (僅 FooDB)', 'Purslane', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2829', '[\"Quail\",\"quail\",\"Phasianidae\"]', 'Animal foods', '自動生成: Quail (僅 FooDB)', 'Quail', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2830', '[\"Quesadilla\",\"quesadilla\"]', 'Dishes', '自動生成: Quesadilla (僅 FooDB)', 'Quesadilla', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2831', '[\"Quince\",\"quince\",\"Cydonia oblonga\"]', 'Fruits', '自動生成: Quince (僅 FooDB)', 'Quince', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2832', '[\"Quinoa\",\"quinoa\",\"Chenopodium quinoa\"]', 'Herbs and Spices', '自動生成: Quinoa (僅 FooDB)', 'Quinoa', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2833', '[\"Rabbit\",\"rabbit\",\"Leporidae\"]', 'Animal foods', '自動生成: Rabbit (僅 FooDB)', 'Rabbit', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2834', '[\"Rabbiteye blueberry\",\"rabbiteye blueberry\",\"Vaccinium virgatum\"]', 'Fruits', '自動生成: Rabbiteye blueberry (僅 FooDB)', 'Rabbiteye blueberry', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2835', '[\"Radish\",\"radish\",\"Raphanus sativus\"]', 'Vegetables', '自動生成: Radish (僅 FooDB)', 'Radish', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2836', '[\"Radish (var.)\",\"radish (var.)\",\"Raphanus sativus var. sativus\"]', 'Vegetables', '自動生成: Radish (var.) (僅 FooDB)', 'Radish (var.)', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2837', '[\"Rainbow smelt\",\"rainbow smelt\",\"Osmerus mordax\"]', 'Aquatic foods', '自動生成: Rainbow smelt (僅 FooDB)', 'Rainbow smelt', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2838', '[\"Rainbow trout\",\"rainbow trout\",\"Oncorhynchus mykiss\"]', 'Aquatic foods', '自動生成: Rainbow trout (僅 FooDB)', 'Rainbow trout', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2839', '[\"Raisin bread\",\"raisin bread\"]', 'Cereals and cereal products', '自動生成: Raisin bread (僅 FooDB)', 'Raisin bread', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2840', '[\"Rambutan\",\"rambutan\",\"Nephelium lappaceum\"]', 'Fruits', '自動生成: Rambutan (僅 FooDB)', 'Rambutan', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2841', '[\"Rape\",\"rape\",\"Brassica napus var. napus\"]', 'Vegetables', '自動生成: Rape (僅 FooDB)', 'Rape', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2842', '[\"Rapeseed oil\",\"rapeseed oil\"]', 'Herbs and Spices', '自動生成: Rapeseed oil (僅 FooDB)', 'Rapeseed oil', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2843', '[\"Rapini\",\"rapini\",\"Brassica ruvo\"]', 'Vegetables', '自動生成: Rapini (僅 FooDB)', 'Rapini', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2844', '[\"Ravioli\",\"ravioli\"]', 'Dishes', '自動生成: Ravioli (僅 FooDB)', 'Ravioli', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2845', '[\"Red algae\",\"red algae\",\"Rhodophyta\"]', 'Aquatic foods', '自動生成: Red algae (僅 FooDB)', 'Red algae', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2846', '[\"Red beetroot\",\"red beetroot\",\"Beta vulgaris var. rubra\"]', 'Vegetables', '自動生成: Red beetroot (僅 FooDB)', 'Red beetroot', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2847', '[\"Red bell pepper\",\"red bell pepper\",\"Capsicum annuum\"]', 'Vegetables', '自動生成: Red bell pepper (僅 FooDB)', 'Red bell pepper', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2848', '[\"Red champagne\",\"red champagne\"]', 'Beverages', '自動生成: Red champagne (僅 FooDB)', 'Red champagne', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2849', '[\"Red clover\",\"red clover\",\"Trifolium pratense\"]', 'Herbs and Spices', '自動生成: Red clover (僅 FooDB)', 'Red clover', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2850', '[\"Red grape\",\"red grape\"]', 'Fruits', '自動生成: Red grape (僅 FooDB)', 'Red grape', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2851', '[\"Red grape juice\",\"red grape juice\"]', 'Beverages', '自動生成: Red grape juice (僅 FooDB)', 'Red grape juice', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2852', '[\"Red huckleberry\",\"red huckleberry\",\"Vaccinium parvifolium\"]', 'Fruits', '自動生成: Red huckleberry (僅 FooDB)', 'Red huckleberry', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2853', '[\"Red king crab\",\"red king crab\",\"Paralithodes camtschaticus\"]', 'Aquatic foods', '自動生成: Red king crab (僅 FooDB)', 'Red king crab', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2854', '[\"Red onion\",\"red onion\"]', 'Vegetables', '自動生成: Red onion (僅 FooDB)', 'Red onion', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2855', '[\"Red raspberry\",\"red raspberry\",\"Rubus idaeus\"]', 'Fruits', '自動生成: Red raspberry (僅 FooDB)', 'Red raspberry', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2856', '[\"Red rice\",\"red rice\",\"Oryza rufipogon\"]', 'Cereals and cereal products', '自動生成: Red rice (僅 FooDB)', 'Red rice', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2857', '[\"Red tea\",\"red tea\"]', 'Teas', '自動生成: Red tea (僅 FooDB)', 'Red tea', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2858', '[\"Red wine\",\"red wine\"]', 'Beverages', '自動生成: Red wine (僅 FooDB)', 'Red wine', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2859', '[\"Redcurrant\",\"redcurrant\",\"Ribes rubrum\"]', 'Fruits', '自動生成: Redcurrant (僅 FooDB)', 'Redcurrant', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2860', '[\"Relish\",\"relish\"]', 'Baking goods', '自動生成: Relish (僅 FooDB)', 'Relish', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2861', '[\"Remoulade\",\"remoulade\"]', 'Baking goods', '自動生成: Remoulade (僅 FooDB)', 'Remoulade', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2862', '[\"Rice\",\"rice\",\"Oryza sativa\"]', 'Cereals and cereal products', '自動生成: Rice (僅 FooDB)', 'Rice', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2863', '[\"Rice bread\",\"rice bread\"]', 'Cereals and cereal products', '自動生成: Rice bread (僅 FooDB)', 'Rice bread', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2864', '[\"Rice cake\",\"rice cake\"]', 'Dishes', '自動生成: Rice cake (僅 FooDB)', 'Rice cake', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2865', '[\"Ringed seal\",\"ringed seal\",\"Pusa hispida\"]', 'Aquatic foods', '自動生成: Ringed seal (僅 FooDB)', 'Ringed seal', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2866', '[\"Robusta coffee\",\"robusta coffee\",\"Coffea canephora\"]', 'Coffee and coffee products', '自動生成: Robusta coffee (僅 FooDB)', 'Robusta coffee', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2867', '[\"Rock ptarmigan\",\"rock ptarmigan\",\"Lagopus muta\"]', 'Animal foods', '自動生成: Rock ptarmigan (僅 FooDB)', 'Rock ptarmigan', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2868', '[\"Rocket salad\",\"rocket salad\",\"Eruca vesicaria\"]', 'Vegetables', '自動生成: Rocket salad (僅 FooDB)', 'Rocket salad', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2869', '[\"Rocket salad (ssp.)\",\"rocket salad (ssp.)\",\"Eruca vesicaria ssp. sativa\"]', 'Vegetables', '自動生成: Rocket salad (ssp.) (僅 FooDB)', 'Rocket salad (ssp.)', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2870', '[\"Roe\",\"roe\"]', 'Aquatic foods', '自動生成: Roe (僅 FooDB)', 'Roe', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2871', '[\"Romaine lettuce\",\"romaine lettuce\",\"Lactuca sativa L. var. longifolia\"]', 'Vegetables', '自動生成: Romaine lettuce (僅 FooDB)', 'Romaine lettuce', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2872', '[\"Roman camomile\",\"roman camomile\",\"Chamaemelum nobile\"]', 'Herbs and Spices', '自動生成: Roman camomile (僅 FooDB)', 'Roman camomile', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2873', '[\"Root vegetables\",\"root vegetables\"]', 'Vegetables', '自動生成: Root vegetables (僅 FooDB)', 'Root vegetables', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2874', '[\"Rose hip\",\"rose hip\",\"Rosa\"]', 'Herbs and Spices', '自動生成: Rose hip (僅 FooDB)', 'Rose hip', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2875', '[\"Rosé wine\",\"rosé wine\"]', 'Beverages', '自動生成: Rosé wine (僅 FooDB)', 'Rosé wine', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2876', '[\"Roselle\",\"roselle\",\"Hibiscus sabdariffa\"]', 'Herbs and Spices', '自動生成: Roselle (僅 FooDB)', 'Roselle', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2877', '[\"Rosemary\",\"rosemary\",\"Rosmarinus officinalis\"]', 'Herbs and Spices', '自動生成: Rosemary (僅 FooDB)', 'Rosemary', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2878', '[\"Rowal\",\"rowal\",\"Pangium edule\"]', 'Herbs and Spices', '自動生成: Rowal (僅 FooDB)', 'Rowal', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2879', '[\"Rowanberry\",\"rowanberry\",\"Sorbus aucuparia\"]', 'Fruits', '自動生成: Rowanberry (僅 FooDB)', 'Rowanberry', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2880', '[\"Rubus (Blackberry, Raspberry)\",\"rubus (blackberry, raspberry)\",\"Rubus\"]', 'Fruits', '自動生成: Rubus (Blackberry, Raspberry) (僅 FooDB)', 'Rubus (Blackberry, Raspberry)', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2881', '[\"Rum\",\"rum\"]', 'Beverages', '自動生成: Rum (僅 FooDB)', 'Rum', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2882', '[\"Rye\",\"rye\",\"Secale cereale\"]', 'Cereals and cereal products', '自動生成: Rye (僅 FooDB)', 'Rye', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2883', '[\"Rye bread\",\"rye bread\"]', 'Cereals and cereal products', '自動生成: Rye bread (僅 FooDB)', 'Rye bread', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2884', '[\"Sablefish\",\"sablefish\",\"Anoplopoma fimbria\"]', 'Aquatic foods', '自動生成: Sablefish (僅 FooDB)', 'Sablefish', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2885', '[\"Sacred lotus\",\"sacred lotus\",\"Nelumbo nucifera\"]', 'Vegetables', '自動生成: Sacred lotus (僅 FooDB)', 'Sacred lotus', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2886', '[\"Safflower\",\"safflower\",\"Carthamus tinctorius\"]', 'Herbs and Spices', '自動生成: Safflower (僅 FooDB)', 'Safflower', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2887', '[\"Saffron\",\"saffron\",\"Crocus sativus\"]', 'Herbs and Spices', '自動生成: Saffron (僅 FooDB)', 'Saffron', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2888', '[\"Sago palm\",\"sago palm\",\"Metroxylon sagu\"]', 'Herbs and Spices', '自動生成: Sago palm (僅 FooDB)', 'Sago palm', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2889', '[\"Sake\",\"sake\"]', 'Beverages', '自動生成: Sake (僅 FooDB)', 'Sake', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2890', '[\"Salad\",\"salad\"]', 'Dishes', '自動生成: Salad (僅 FooDB)', 'Salad', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2891', '[\"Salad dressing\",\"salad dressing\"]', 'Baking goods', '自動生成: Salad dressing (僅 FooDB)', 'Salad dressing', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2892', '[\"Salmonberry\",\"salmonberry\",\"Rubus spectabilis\"]', 'Fruits', '自動生成: Salmonberry (僅 FooDB)', 'Salmonberry', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2893', '[\"Salmonidae (Salmon, Trout)\",\"salmonidae (salmon, trout)\",\"Salmonidae\"]', 'Aquatic foods', '自動生成: Salmonidae (Salmon, Trout) (僅 FooDB)', 'Salmonidae (Salmon, Trout)', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2894', '[\"Salted butter\",\"salted butter\"]', 'Milk and milk products', '自動生成: Salted butter (僅 FooDB)', 'Salted butter', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2895', '[\"Sapodilla\",\"sapodilla\",\"Manilkara zapota\"]', 'Fruits', '自動生成: Sapodilla (僅 FooDB)', 'Sapodilla', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2896', '[\"Saskatoon berry\",\"saskatoon berry\",\"Amelanchier alnifolia\"]', 'Fruits', '自動生成: Saskatoon berry (僅 FooDB)', 'Saskatoon berry', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2897', '[\"Sauce\",\"sauce\"]', 'Baking goods', '自動生成: Sauce (僅 FooDB)', 'Sauce', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2898', '[\"Savoy cabbage\",\"savoy cabbage\",\"Brassica oleracea var. sabauda\"]', 'Vegetables', '自動生成: Savoy cabbage (僅 FooDB)', 'Savoy cabbage', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2899', '[\"Scallop\",\"scallop\",\"Pectinidae\"]', 'Aquatic foods', '自動生成: Scallop (僅 FooDB)', 'Scallop', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2900', '[\"Scarlet bean\",\"scarlet bean\",\"Phaseolus coccineus\"]', 'Pulses', '自動生成: Scarlet bean (僅 FooDB)', 'Scarlet bean', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2901', '[\"Scombridae (Bonito, Mackerel, Tuna)\",\"scombridae (bonito, mackerel, tuna)\",\"Scombridae\"]', 'Aquatic foods', '自動生成: Scombridae (Bonito, Mackerel, Tuna) (僅 FooDB)', 'Scombridae (Bonito, Mackerel, Tuna)', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2902', '[\"Scrapple\",\"scrapple\"]', 'Dishes', '自動生成: Scrapple (僅 FooDB)', 'Scrapple', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2903', '[\"Scup\",\"scup\",\"Stenotomus chrysops\"]', 'Aquatic foods', '自動生成: Scup (僅 FooDB)', 'Scup', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2904', '[\"Sea cucumber\",\"sea cucumber\",\"Parastichopus californicus\"]', 'Aquatic foods', '自動生成: Sea cucumber (僅 FooDB)', 'Sea cucumber', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2905', '[\"Sea trout\",\"sea trout\",\"Salmo trutta forma trutta\"]', 'Aquatic foods', '自動生成: Sea trout (僅 FooDB)', 'Sea trout', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2906', '[\"Sea-buckthornberry\",\"sea-buckthornberry\",\"Hippophae rhamnoides\"]', 'Fruits', '自動生成: Sea-buckthornberry (僅 FooDB)', 'Sea-buckthornberry', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2907', '[\"Semolina\",\"semolina\"]', 'Cereals and cereal products', '自動生成: Semolina (僅 FooDB)', 'Semolina', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2908', '[\"Sesbania flower\",\"sesbania flower\",\"Sesbania bispinosa\"]', 'Vegetables', '自動生成: Sesbania flower (僅 FooDB)', 'Sesbania flower', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2909', '[\"Shallot\",\"shallot\",\"Allium ascalonicum\"]', 'Vegetables', '自動生成: Shallot (僅 FooDB)', 'Shallot', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2910', '[\"Shark\",\"shark\",\"Squaliformes\"]', 'Aquatic foods', '自動生成: Shark (僅 FooDB)', 'Shark', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2911', '[\"Shea tree\",\"shea tree\",\"Vitellaria paradoxa\"]', 'Herbs and Spices', '自動生成: Shea tree (僅 FooDB)', 'Shea tree', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2912', '[\"Sheefish\",\"sheefish\",\"Stenodus leucichthys\"]', 'Aquatic foods', '自動生成: Sheefish (僅 FooDB)', 'Sheefish', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2913', '[\"Sheep (Mutton, Lamb)\",\"sheep (mutton, lamb)\",\"Ovis aries\"]', 'Animal foods', '自動生成: Sheep (Mutton, Lamb) (僅 FooDB)', 'Sheep (Mutton, Lamb)', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2914', '[\"Sheepshead\",\"sheepshead\",\"Archosargus probatocephalus\"]', 'Aquatic foods', '自動生成: Sheepshead (僅 FooDB)', 'Sheepshead', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2915', '[\"Sherry\",\"sherry\"]', 'Beverages', '自動生成: Sherry (僅 FooDB)', 'Sherry', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2916', '[\"Shiitake\",\"shiitake\",\"Lentinus edodes\"]', 'Vegetables', '自動生成: Shiitake (僅 FooDB)', 'Shiitake', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2917', '[\"Shortening\",\"shortening\"]', 'Fats and oils', '自動生成: Shortening (僅 FooDB)', 'Shortening', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2918', '[\"Silver linden\",\"silver linden\",\"Tilia argentea\"]', 'Herbs and Spices', '自動生成: Silver linden (僅 FooDB)', 'Silver linden', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2919', '[\"Skipjack tuna\",\"skipjack tuna\",\"Katsuwonus pelamis\"]', 'Aquatic foods', '自動生成: Skipjack tuna (僅 FooDB)', 'Skipjack tuna', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2920', '[\"Skunk currant\",\"skunk currant\",\"Ribes glandulosum\"]', 'Fruits', '自動生成: Skunk currant (僅 FooDB)', 'Skunk currant', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2921', '[\"Small-leaf linden\",\"small-leaf linden\",\"Tilia cordata\"]', 'Herbs and Spices', '自動生成: Small-leaf linden (僅 FooDB)', 'Small-leaf linden', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2922', '[\"Smelt\",\"smelt\",\"Osmeridae\"]', 'Aquatic foods', '自動生成: Smelt (僅 FooDB)', 'Smelt', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2923', '[\"Snack bar\",\"snack bar\"]', 'Snack foods', '自動生成: Snack bar (僅 FooDB)', 'Snack bar', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2924', '[\"Snail\",\"snail\",\"Gastropoda\"]', 'Aquatic foods', '自動生成: Snail (僅 FooDB)', 'Snail', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2925', '[\"Snapper\",\"snapper\",\"Lutjanidae\"]', 'Aquatic foods', '自動生成: Snapper (僅 FooDB)', 'Snapper', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2926', '[\"Snow crab\",\"snow crab\",\"Chionoecetes opilio\"]', 'Aquatic foods', '自動生成: Snow crab (僅 FooDB)', 'Snow crab', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2927', '[\"Sockeye salmon\",\"sockeye salmon\",\"Oncorhynchus nerka\"]', 'Aquatic foods', '自動生成: Sockeye salmon (僅 FooDB)', 'Sockeye salmon', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2928', '[\"Soft drink\",\"soft drink\"]', 'Beverages', '自動生成: Soft drink (僅 FooDB)', 'Soft drink', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2929', '[\"Soft-necked garlic\",\"soft-necked garlic\",\"Allium sativum L. var. sativum\"]', 'Herbs and Spices', '自動生成: Soft-necked garlic (僅 FooDB)', 'Soft-necked garlic', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2930', '[\"Sorghum\",\"sorghum\",\"Sorghum bicolor\"]', 'Cereals and cereal products', '自動生成: Sorghum (僅 FooDB)', 'Sorghum', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2931', '[\"Sorrel\",\"sorrel\",\"Rumex acetosa\"]', 'Herbs and Spices', '自動生成: Sorrel (僅 FooDB)', 'Sorrel', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2932', '[\"Soup\",\"soup\"]', 'Dishes', '自動生成: Soup (僅 FooDB)', 'Soup', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2933', '[\"Sour cherry\",\"sour cherry\",\"Prunus cerasus\"]', 'Fruits', '自動生成: Sour cherry (僅 FooDB)', 'Sour cherry', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2934', '[\"Sour cream\",\"sour cream\"]', 'Milk and milk products', '自動生成: Sour cream (僅 FooDB)', 'Sour cream', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2935', '[\"Sour orange\",\"sour orange\",\"Citrus × aurantium\"]', 'Fruits', '自動生成: Sour orange (僅 FooDB)', 'Sour orange', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2936', '[\"Sourdock\",\"sourdock\",\"Rumex articus\"]', 'Herbs and Spices', '自動生成: Sourdock (僅 FooDB)', 'Sourdock', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2937', '[\"Sourdough\",\"sourdough\"]', 'Cereals and cereal products', '自動生成: Sourdough (僅 FooDB)', 'Sourdough', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2938', '[\"Soursop\",\"soursop\",\"Annona muricata\"]', 'Fruits', '自動生成: Soursop (僅 FooDB)', 'Soursop', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2939', '[\"Soy bean\",\"soy bean\",\"Glycine max\"]', 'Soy', '自動生成: Soy bean (僅 FooDB)', 'Soy bean', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2940', '[\"Soy cream\",\"soy cream\"]', 'Soy', '自動生成: Soy cream (僅 FooDB)', 'Soy cream', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2941', '[\"Soy yogurt\",\"soy yogurt\"]', 'Soy', '自動生成: Soy yogurt (僅 FooDB)', 'Soy yogurt', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2942', '[\"Spanish mackerel\",\"spanish mackerel\",\"Scomberomorus maculatus\"]', 'Aquatic foods', '自動生成: Spanish mackerel (僅 FooDB)', 'Spanish mackerel', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2943', '[\"Sparkleberry\",\"sparkleberry\",\"Vaccinium arboreum\"]', 'Fruits', '自動生成: Sparkleberry (僅 FooDB)', 'Sparkleberry', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2944', '[\"Spearmint\",\"spearmint\",\"Mentha spicata\"]', 'Herbs and Spices', '自動生成: Spearmint (僅 FooDB)', 'Spearmint', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2945', '[\"Spelt\",\"spelt\",\"Triticum spelta\"]', 'Cereals and cereal products', '自動生成: Spelt (僅 FooDB)', 'Spelt', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2946', '[\"Spinach\",\"spinach\",\"Spinacia oleracea\"]', 'Vegetables', '自動生成: Spinach (僅 FooDB)', 'Spinach', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2947', '[\"Spiny dogfish\",\"spiny dogfish\",\"Squalus acanthias\"]', 'Aquatic foods', '自動生成: Spiny dogfish (僅 FooDB)', 'Spiny dogfish', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2948', '[\"Spiny lobster\",\"spiny lobster\",\"Palinuridae\"]', 'Aquatic foods', '自動生成: Spiny lobster (僅 FooDB)', 'Spiny lobster', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2949', '[\"Spirit\",\"spirit\"]', 'Beverages', '自動生成: Spirit (僅 FooDB)', 'Spirit', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2950', '[\"Spirulina\",\"spirulina\"]', 'Aquatic foods', '自動生成: Spirulina (僅 FooDB)', 'Spirulina', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2951', '[\"Spot croaker\",\"spot croaker\",\"Leiostomus xanthurus\"]', 'Aquatic foods', '自動生成: Spot croaker (僅 FooDB)', 'Spot croaker', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2952', '[\"Spotted seal\",\"spotted seal\",\"Phoca largha\"]', 'Aquatic foods', '自動生成: Spotted seal (僅 FooDB)', 'Spotted seal', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2953', '[\"Spread\",\"spread\"]', 'Baking goods', '自動生成: Spread (僅 FooDB)', 'Spread', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2954', '[\"Squab\",\"squab\",\"Columba\"]', 'Animal foods', '自動生成: Squab (僅 FooDB)', 'Squab', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2955', '[\"Squashberry\",\"squashberry\",\"Viburnum edule\"]', 'Fruits', '自動生成: Squashberry (僅 FooDB)', 'Squashberry', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2956', '[\"Star anise\",\"star anise\",\"Illicium verum\"]', 'Herbs and Spices', '自動生成: Star anise (僅 FooDB)', 'Star anise', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2957', '[\"Star fruit\",\"star fruit\",\"Averrhoa carambola\"]', 'Fruits', '自動生成: Star fruit (僅 FooDB)', 'Star fruit', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2958', '[\"Steller sea lion\",\"steller sea lion\",\"Eumetopias jubatus\"]', 'Aquatic foods', '自動生成: Steller sea lion (僅 FooDB)', 'Steller sea lion', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2959', '[\"Stew\",\"stew\"]', 'Dishes', '自動生成: Stew (僅 FooDB)', 'Stew', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2960', '[\"Strawberry guava\",\"strawberry guava\",\"Psidium cattleianum\"]', 'Fruits', '自動生成: Strawberry guava (僅 FooDB)', 'Strawberry guava', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2961', '[\"Striped bass\",\"striped bass\",\"Morone saxatilis\"]', 'Aquatic foods', '自動生成: Striped bass (僅 FooDB)', 'Striped bass', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2962', '[\"Striped mullet\",\"striped mullet\",\"Mugil cephalus\"]', 'Aquatic foods', '自動生成: Striped mullet (僅 FooDB)', 'Striped mullet', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2963', '[\"Stuffing\",\"stuffing\"]', 'Baking goods', '自動生成: Stuffing (僅 FooDB)', 'Stuffing', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2964', '[\"Sturgeon\",\"sturgeon\",\"Acipenseridae\"]', 'Aquatic foods', '自動生成: Sturgeon (僅 FooDB)', 'Sturgeon', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2965', '[\"Succotash\",\"succotash\"]', 'Dishes', '自動生成: Succotash (僅 FooDB)', 'Succotash', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2966', '[\"Sugar apple\",\"sugar apple\",\"Annona squamosa\"]', 'Fruits', '自動生成: Sugar apple (僅 FooDB)', 'Sugar apple', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2967', '[\"Sugar substitute\",\"sugar substitute\"]', 'Baking goods', '自動生成: Sugar substitute (僅 FooDB)', 'Sugar substitute', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2968', '[\"Summer grape\",\"summer grape\",\"Vitis aestivalis\"]', 'Fruits', '自動生成: Summer grape (僅 FooDB)', 'Summer grape', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2969', '[\"Summer savory\",\"summer savory\",\"Satureja hortensis\"]', 'Herbs and Spices', '自動生成: Summer savory (僅 FooDB)', 'Summer savory', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2970', '[\"Sunburst squash (pattypan squash)\",\"sunburst squash (pattypan squash)\",\"Cucurbita pepo var. clypeata\"]', 'Gourds', '自動生成: Sunburst squash (pattypan squash) (僅 FooDB)', 'Sunburst squash (pattypan squash)', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2971', '[\"Sunflower\",\"sunflower\",\"Helianthus annuus\"]', 'Herbs and Spices', '自動生成: Sunflower (僅 FooDB)', 'Sunflower', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2972', '[\"Sunflower oil\",\"sunflower oil\"]', 'Herbs and Spices', '自動生成: Sunflower oil (僅 FooDB)', 'Sunflower oil', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2973', '[\"Swamp cabbage\",\"swamp cabbage\",\"Ipomoea aquatica\"]', 'Vegetables', '自動生成: Swamp cabbage (僅 FooDB)', 'Swamp cabbage', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2974', '[\"Swede\",\"swede\",\"Brassica napus\"]', 'Vegetables', '自動生成: Swede (僅 FooDB)', 'Swede', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2975', '[\"Sweet basil\",\"sweet basil\",\"Ocimum basilicum\"]', 'Herbs and Spices', '自動生成: Sweet basil (僅 FooDB)', 'Sweet basil', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2976', '[\"Sweet bay\",\"sweet bay\",\"Laurus nobilis\"]', 'Herbs and Spices', '自動生成: Sweet bay (僅 FooDB)', 'Sweet bay', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2977', '[\"Sweet cherry\",\"sweet cherry\",\"Prunus avium\"]', 'Fruits', '自動生成: Sweet cherry (僅 FooDB)', 'Sweet cherry', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2978', '[\"Sweet custard\",\"sweet custard\"]', 'Confectioneries', '自動生成: Sweet custard (僅 FooDB)', 'Sweet custard', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2979', '[\"Sweet marjoram\",\"sweet marjoram\",\"Origanum majorana\"]', 'Herbs and Spices', '自動生成: Sweet marjoram (僅 FooDB)', 'Sweet marjoram', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2980', '[\"Sweet orange\",\"sweet orange\",\"Citrus sinensis\"]', 'Fruits', '自動生成: Sweet orange (僅 FooDB)', 'Sweet orange', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2981', '[\"Sweet potato\",\"sweet potato\",\"Ipomoea batatas\"]', 'Vegetables', '自動生成: Sweet potato (僅 FooDB)', 'Sweet potato', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2982', '[\"Sweet rowanberry\",\"sweet rowanberry\",\"Grataegosorbus mitschurinii\"]', 'Fruits', '自動生成: Sweet rowanberry (僅 FooDB)', 'Sweet rowanberry', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2983', '[\"Swiss chard\",\"swiss chard\",\"Beta vulgaris ssp. cicla\"]', 'Vegetables', '自動生成: Swiss chard (僅 FooDB)', 'Swiss chard', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2984', '[\"Swiss cheese\",\"swiss cheese\"]', 'Milk and milk products', '自動生成: Swiss cheese (僅 FooDB)', 'Swiss cheese', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2985', '[\"Swordfish\",\"swordfish\",\"Xiphias gladius\"]', 'Aquatic foods', '自動生成: Swordfish (僅 FooDB)', 'Swordfish', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2986', '[\"Syrup\",\"syrup\"]', 'Baking goods', '自動生成: Syrup (僅 FooDB)', 'Syrup', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2987', '[\"Taco\",\"taco\"]', 'Dishes', '自動生成: Taco (僅 FooDB)', 'Taco', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2988', '[\"Taco shell\",\"taco shell\"]', '其他', '自動生成: Taco shell (僅 FooDB)', 'Taco shell', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2989', '[\"Tallow\",\"tallow\"]', 'Fats and oils', '自動生成: Tallow (僅 FooDB)', 'Tallow', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2990', '[\"Tamale\",\"tamale\"]', 'Dishes', '自動生成: Tamale (僅 FooDB)', 'Tamale', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2991', '[\"Tamarind\",\"tamarind\",\"Tamarindus indica\"]', 'Fruits', '自動生成: Tamarind (僅 FooDB)', 'Tamarind', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2992', '[\"Tapioca pearl\",\"tapioca pearl\"]', 'Baking goods', '自動生成: Tapioca pearl (僅 FooDB)', 'Tapioca pearl', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2993', '[\"Taro\",\"taro\",\"Colocasia esculenta\"]', 'Vegetables', '自動生成: Taro (僅 FooDB)', 'Taro', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2994', '[\"Tarragon\",\"tarragon\",\"Artemisia dracunculus\"]', 'Herbs and Spices', '自動生成: Tarragon (僅 FooDB)', 'Tarragon', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2995', '[\"Tartary buckwheat\",\"tartary buckwheat\",\"Fagopyrum tataricum\"]', 'Cereals and cereal products', '自動生成: Tartary buckwheat (僅 FooDB)', 'Tartary buckwheat', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2996', '[\"Tea\",\"tea\",\"Camellia sinensis\"]', 'Teas', '自動生成: Tea (僅 FooDB)', 'Tea', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2997', '[\"Tea leaf willow\",\"tea leaf willow\",\"Salix pulchra\"]', 'Herbs and Spices', '自動生成: Tea leaf willow (僅 FooDB)', 'Tea leaf willow', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2998', '[\"Teff\",\"teff\",\"Eragrostis tef\"]', 'Herbs and Spices', '自動生成: Teff (僅 FooDB)', 'Teff', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2999', '[\"Thistle\",\"thistle\",\"Cirsium\"]', 'Vegetables', '自動生成: Thistle (僅 FooDB)', 'Thistle', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_3000', '[\"Thornless blackberry\",\"thornless blackberry\",\"Rubus ulmifolius\"]', 'Fruits', '自動生成: Thornless blackberry (僅 FooDB)', 'Thornless blackberry', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_3001', '[\"Thunnus\",\"thunnus\"]', 'Aquatic foods', '自動生成: Thunnus (僅 FooDB)', 'Thunnus', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_3002', '[\"Tilefish\",\"tilefish\",\"Lopholatilus chamaeleonticeps\"]', 'Aquatic foods', '自動生成: Tilefish (僅 FooDB)', 'Tilefish', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_3003', '[\"Tinda\",\"tinda\",\"Citrullus lanatus var. fistulosus\"]', 'Gourds', '自動生成: Tinda (僅 FooDB)', 'Tinda', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_3004', '[\"Toffee\",\"toffee\"]', 'Confectioneries', '自動生成: Toffee (僅 FooDB)', 'Toffee', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_3005', '[\"Topping\",\"topping\"]', 'Baking goods', '自動生成: Topping (僅 FooDB)', 'Topping', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_3006', '[\"Tortilla\",\"tortilla\"]', 'Cereals and cereal products', '自動生成: Tortilla (僅 FooDB)', 'Tortilla', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_3007', '[\"Tortilla chip\",\"tortilla chip\"]', 'Snack foods', '自動生成: Tortilla chip (僅 FooDB)', 'Tortilla chip', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_3008', '[\"Tostada\",\"tostada\"]', 'Dishes', '自動生成: Tostada (僅 FooDB)', 'Tostada', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_3009', '[\"Tostada shell\",\"tostada shell\"]', '其他', '自動生成: Tostada shell (僅 FooDB)', 'Tostada shell', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_3010', '[\"Towel gourd\",\"towel gourd\",\"Luffa aegyptiaca\"]', 'Gourds', '自動生成: Towel gourd (僅 FooDB)', 'Towel gourd', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_3011', '[\"Trail mix\",\"trail mix\"]', 'Snack foods', '自動生成: Trail mix (僅 FooDB)', 'Trail mix', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_3012', '[\"Tree fern\",\"tree fern\",\"Cyathea\"]', 'Vegetables', '自動生成: Tree fern (僅 FooDB)', 'Tree fern', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_3013', '[\"Triticale\",\"triticale\",\"X Triticosecale rimpaui\"]', 'Cereals and cereal products', '自動生成: Triticale (僅 FooDB)', 'Triticale', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_3014', '[\"Tronchuda cabbage\",\"tronchuda cabbage\",\"Brassica oleracea var. costata\"]', 'Vegetables', '自動生成: Tronchuda cabbage (僅 FooDB)', 'Tronchuda cabbage', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_3015', '[\"Tropical highland blackberry\",\"tropical highland blackberry\",\"Rubus adenotrichos\"]', 'Fruits', '自動生成: Tropical highland blackberry (僅 FooDB)', 'Tropical highland blackberry', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_3016', '[\"True frog\",\"true frog\",\"Ranidae\"]', 'Aquatic foods', '自動生成: True frog (僅 FooDB)', 'True frog', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_3017', '[\"True oyster\",\"true oyster\",\"Ostreidae\"]', 'Aquatic foods', '自動生成: True oyster (僅 FooDB)', 'True oyster', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_3018', '[\"True seal\",\"true seal\",\"Phocidae\"]', 'Aquatic foods', '自動生成: True seal (僅 FooDB)', 'True seal', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_3019', '[\"True sole\",\"true sole\",\"Soleidae\"]', 'Aquatic foods', '自動生成: True sole (僅 FooDB)', 'True sole', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_3020', '[\"Tunicate\",\"tunicate\",\"Tunicata\"]', 'Aquatic foods', '自動生成: Tunicate (僅 FooDB)', 'Tunicate', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_3021', '[\"Turbot\",\"turbot\",\"Scophthalmus maximus\"]', 'Aquatic foods', '自動生成: Turbot (僅 FooDB)', 'Turbot', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_3022', '[\"Turmeric\",\"turmeric\",\"Curcuma longa\"]', 'Herbs and Spices', '自動生成: Turmeric (僅 FooDB)', 'Turmeric', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_3023', '[\"Turnip\",\"turnip\",\"Brassica rapa var. rapa\"]', 'Herbs and Spices', '自動生成: Turnip (僅 FooDB)', 'Turnip', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_3024', '[\"Ucuhuba\",\"ucuhuba\",\"Virola surinamensis\"]', 'Herbs and Spices', '自動生成: Ucuhuba (僅 FooDB)', 'Ucuhuba', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_3025', '[\"Unclassified food or beverage\",\"unclassified food or beverage\"]', 'Unclassified', '自動生成: Unclassified food or beverage (僅 FooDB)', 'Unclassified food or beverage', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_3026', '[\"Vaccinium (Blueberry, Cranberry, Huckleberry)\",\"vaccinium (blueberry, cranberry, huckleberry)\",\"Vaccinium\"]', 'Fruits', '自動生成: Vaccinium (Blueberry, Cranberry, Huckleberry) (僅 FooDB)', 'Vaccinium (Blueberry, Cranberry, Huckleberry)', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_3027', '[\"Vanilla\",\"vanilla\"]', 'Herbs and Spices', '自動生成: Vanilla (僅 FooDB)', 'Vanilla', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_3028', '[\"Vegetable juice\",\"vegetable juice\"]', 'Beverages', '自動生成: Vegetable juice (僅 FooDB)', 'Vegetable juice', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_3029', '[\"Vegetarian food\",\"vegetarian food\"]', 'Dishes', '自動生成: Vegetarian food (僅 FooDB)', 'Vegetarian food', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_3030', '[\"Veggie burger\",\"veggie burger\"]', 'Dishes', '自動生成: Veggie burger (僅 FooDB)', 'Veggie burger', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_3031', '[\"Velvet duck\",\"velvet duck\",\"Melanitta fusca\"]', 'Animal foods', '自動生成: Velvet duck (僅 FooDB)', 'Velvet duck', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_3032', '[\"Vermouth\",\"vermouth\"]', 'Beverages', '自動生成: Vermouth (僅 FooDB)', 'Vermouth', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_3033', '[\"Vodka\",\"vodka\"]', 'Beverages', '自動生成: Vodka (僅 FooDB)', 'Vodka', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_3034', '[\"Waffle\",\"waffle\"]', 'Dishes', '自動生成: Waffle (僅 FooDB)', 'Waffle', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_3035', '[\"Wakame\",\"wakame\",\"Undaria pinnatifida\"]', 'Aquatic foods', '自動生成: Wakame (僅 FooDB)', 'Wakame', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_3036', '[\"Walleye\",\"walleye\",\"Sander vitreus\"]', 'Aquatic foods', '自動生成: Walleye (僅 FooDB)', 'Walleye', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_3037', '[\"Walnut\",\"walnut\",\"Juglans\"]', 'Nuts', '自動生成: Walnut (僅 FooDB)', 'Walnut', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_3038', '[\"Walrus\",\"walrus\",\"Odobenus rosmarus\"]', 'Aquatic foods', '自動生成: Walrus (僅 FooDB)', 'Walrus', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_3039', '[\"Wampee\",\"wampee\",\"Clausena lansium\"]', 'Fruits', '自動生成: Wampee (僅 FooDB)', 'Wampee', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_3040', '[\"Wasabi\",\"wasabi\",\"Wasabia japonica\"]', 'Herbs and Spices', '自動生成: Wasabi (僅 FooDB)', 'Wasabi', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_3041', '[\"Water\",\"water\"]', 'Beverages', '自動生成: Water (僅 FooDB)', 'Water', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_3042', '[\"Water spinach\",\"water spinach\",\"Ipomoea aquatica\"]', 'Vegetables', '自動生成: Water spinach (僅 FooDB)', 'Water spinach', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_3043', '[\"Watercress\",\"watercress\",\"Rorippa nasturtium-aquaticum\"]', 'Herbs and Spices', '自動生成: Watercress (僅 FooDB)', 'Watercress', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_3044', '[\"Wax apple\",\"wax apple\",\"Eugenia javanica\"]', 'Fruits', '自動生成: Wax apple (僅 FooDB)', 'Wax apple', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_3045', '[\"Wax gourd\",\"wax gourd\",\"Benincasa hispida\"]', 'Gourds', '自動生成: Wax gourd (僅 FooDB)', 'Wax gourd', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_3046', '[\"Welsh onion\",\"welsh onion\",\"Allium fistulosum\"]', 'Herbs and Spices', '自動生成: Welsh onion (僅 FooDB)', 'Welsh onion', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_3047', '[\"Wheat\",\"wheat\",\"Triticum\"]', 'Cereals and cereal products', '自動生成: Wheat (僅 FooDB)', 'Wheat', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_3048', '[\"Wheat bread\",\"wheat bread\"]', 'Cereals and cereal products', '自動生成: Wheat bread (僅 FooDB)', 'Wheat bread', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_3049', '[\"Whelk\",\"whelk\",\"Buccinidae\"]', 'Aquatic foods', '自動生成: Whelk (僅 FooDB)', 'Whelk', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_3050', '[\"Whey\",\"whey\"]', 'Milk and milk products', '自動生成: Whey (僅 FooDB)', 'Whey', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_3051', '[\"Whisky\",\"whisky\"]', 'Beverages', '自動生成: Whisky (僅 FooDB)', 'Whisky', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_3052', '[\"White bread\",\"white bread\"]', 'Cereals and cereal products', '自動生成: White bread (僅 FooDB)', 'White bread', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_3053', '[\"White cabbage\",\"white cabbage\",\"Brassica oleracea L. var. capitata L. f. alba DC.\"]', 'Vegetables', '自動生成: White cabbage (僅 FooDB)', 'White cabbage', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_3054', '[\"White champagne\",\"white champagne\"]', 'Beverages', '自動生成: White champagne (僅 FooDB)', 'White champagne', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_3055', '[\"White grape juice\",\"white grape juice\"]', 'Beverages', '自動生成: White grape juice (僅 FooDB)', 'White grape juice', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_3056', '[\"White lupine\",\"white lupine\",\"Lupinus albus\"]', 'Pulses', '自動生成: White lupine (僅 FooDB)', 'White lupine', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_3057', '[\"White mulberry\",\"white mulberry\",\"Morus alba\"]', 'Herbs and Spices', '自動生成: White mulberry (僅 FooDB)', 'White mulberry', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_3058', '[\"White mustard\",\"white mustard\",\"Sinapis alba\"]', 'Herbs and Spices', '自動生成: White mustard (僅 FooDB)', 'White mustard', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_3059', '[\"White onion\",\"white onion\"]', 'Vegetables', '自動生成: White onion (僅 FooDB)', 'White onion', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_3060', '[\"White sucker\",\"white sucker\",\"Catostomus commersonii\"]', 'Aquatic foods', '自動生成: White sucker (僅 FooDB)', 'White sucker', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_3061', '[\"White wine\",\"white wine\"]', 'Beverages', '自動生成: White wine (僅 FooDB)', 'White wine', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_3062', '[\"Whitefish\",\"whitefish\",\"Coregonus\"]', 'Aquatic foods', '自動生成: Whitefish (僅 FooDB)', 'Whitefish', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_3063', '[\"Whiting\",\"whiting\",\"Merlangius merlangus\"]', 'Aquatic foods', '自動生成: Whiting (僅 FooDB)', 'Whiting', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_3064', '[\"Whole wheat bread\",\"whole wheat bread\"]', 'Cereals and cereal products', '自動生成: Whole wheat bread (僅 FooDB)', 'Whole wheat bread', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_3065', '[\"Wild boar\",\"wild boar\",\"Sus scrofa\"]', 'Animal foods', '自動生成: Wild boar (僅 FooDB)', 'Wild boar', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_3066', '[\"Wild carrot\",\"wild carrot\",\"Daucus carota\"]', 'Vegetables', '自動生成: Wild carrot (僅 FooDB)', 'Wild carrot', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_3067', '[\"Wild celery\",\"wild celery\",\"Apium graveolens\"]', 'Herbs and Spices', '自動生成: Wild celery (僅 FooDB)', 'Wild celery', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_3068', '[\"Wild leek\",\"wild leek\",\"Allium ampeloprasum\"]', 'Vegetables', '自動生成: Wild leek (僅 FooDB)', 'Wild leek', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_3069', '[\"Wild rice\",\"wild rice\",\"Zizania\"]', 'Cereals and cereal products', '自動生成: Wild rice (僅 FooDB)', 'Wild rice', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_3070', '[\"Winged bean\",\"winged bean\",\"Psophocarpus tetragonolobus\"]', 'Pulses', '自動生成: Winged bean (僅 FooDB)', 'Winged bean', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_3071', '[\"Winter savory\",\"winter savory\",\"Satureja montana\"]', 'Herbs and Spices', '自動生成: Winter savory (僅 FooDB)', 'Winter savory', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_3072', '[\"Winter squash\",\"winter squash\",\"Cucurbita maxima\"]', 'Gourds', '自動生成: Winter squash (僅 FooDB)', 'Winter squash', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_3073', '[\"Wonton wrapper\",\"wonton wrapper\"]', 'Baking goods', '自動生成: Wonton wrapper (僅 FooDB)', 'Wonton wrapper', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_3074', '[\"Yali pear\",\"yali pear\",\"Pyrus × bretschneideri\"]', 'Fruits', '自動生成: Yali pear (僅 FooDB)', 'Yali pear', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_3075', '[\"Yam\",\"yam\",\"Dioscorea\"]', 'Vegetables', '自動生成: Yam (僅 FooDB)', 'Yam', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_3076', '[\"Yardlong bean\",\"yardlong bean\",\"Vigna unguiculata ssp. sesquipedalis\"]', 'Pulses', '自動生成: Yardlong bean (僅 FooDB)', 'Yardlong bean', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_3077', '[\"Yau choy\",\"yau choy\"]', 'Vegetables', '自動生成: Yau choy (僅 FooDB)', 'Yau choy', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_3078', '[\"Yautia\",\"yautia\",\"Xanthosoma sagittifolium\"]', 'Vegetables', '自動生成: Yautia (僅 FooDB)', 'Yautia', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_3079', '[\"Yellow bell pepper\",\"yellow bell pepper\",\"Capsicum annuum\"]', 'Vegetables', '自動生成: Yellow bell pepper (僅 FooDB)', 'Yellow bell pepper', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_3080', '[\"Yellow pond-lily\",\"yellow pond-lily\",\"Nuphar lutea\"]', 'Herbs and Spices', '自動生成: Yellow pond-lily (僅 FooDB)', 'Yellow pond-lily', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_3081', '[\"Yellow wax bean\",\"yellow wax bean\",\"Phaseolus vulgaris\"]', 'Pulses', '自動生成: Yellow wax bean (僅 FooDB)', 'Yellow wax bean', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_3082', '[\"Yellow zucchini\",\"yellow zucchini\",\"Cucurbita pepo var. cylindrica\"]', 'Gourds', '自動生成: Yellow zucchini (僅 FooDB)', 'Yellow zucchini', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_3083', '[\"Yellowfin tuna\",\"yellowfin tuna\",\"Thunnus albacares\"]', 'Aquatic foods', '自動生成: Yellowfin tuna (僅 FooDB)', 'Yellowfin tuna', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_3084', '[\"Yellowtail amberjack\",\"yellowtail amberjack\",\"Seriola lalandi\"]', 'Aquatic foods', '自動生成: Yellowtail amberjack (僅 FooDB)', 'Yellowtail amberjack', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_3085', '[\"Ymer\",\"ymer\"]', 'Milk and milk products', '自動生成: Ymer (僅 FooDB)', 'Ymer', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_3086', '[\"Yogurt\",\"yogurt\"]', 'Milk and milk products', '自動生成: Yogurt (僅 FooDB)', 'Yogurt', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_3087', '[\"Zwieback\",\"zwieback\"]', 'Cereals and cereal products', '自動生成: Zwieback (僅 FooDB)', 'Zwieback', NULL);

-- ==================== 生成統計 ====================
-- 成功生成: 3087 筆別名記錄
-- 跳過: 0 筆（缺少資料）
-- 總處理: 3087 筆映射
-- 
-- 覆蓋率: 100.00%
