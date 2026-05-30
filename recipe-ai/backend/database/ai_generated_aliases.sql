-- AI生成的食物別名表
-- 生成時間: 2026-01-28T04:41:37.748Z
-- 總筆數: 3087

USE userdb;

-- 清空現有別名
DELETE FROM food_aliases WHERE family_key LIKE 'map_%';

-- 插入AI生成的別名
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1', '["七味辣椒粉","辛香粉","seven-flavor chili powder","Sichuan pepper and chili blend","七味唐辛子"]', '調味料及香辛料類', 'AI生成', NULL, '七味唐辛子');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2', '["七股香洋香瓜","Seven Fragrance Musk Melon","Qiguxiang Yangxiangguagua"]', '水果類', 'AI生成', NULL, '七股香洋香瓜');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_3', '["野菜蘑菇三合一麥片","蔬菜菌菇三合一麥片","Vegetable Mushroom Three-in-One Oatmeal","Veggie and Mushroom Triple Mix Cereal","三合一麥片(野菜蘑菇)"]', '加工調理食品及其他類', 'AI生成', NULL, '三合一麥片(野菜蘑菇)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_4', '["三節翅","雞翅膀","three-section wing","chicken wings","三節翅(土雞)"]', '肉類', 'AI生成', NULL, '三節翅(土雞)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_5', '["三節翅","肉雞翅膀","three-section wing","meat chicken wings","三節翅(肉雞)"]', '肉類', 'AI生成', NULL, '三節翅(肉雞)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_6', '["三節翅","san jie chi","truss chicken wings","三節翅平均值"]', '肉類', 'AI生成', NULL, '三節翅平均值');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_7', '["三線鱸","磯鱸","三線磯鱸"]', '魚貝類', 'AI生成', NULL, '三線磯鱸');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_8', '["三角飯團","肉鬆三角飯糰","便當飯糰","口袋飯","triangle rice ball with peanut candy floss","triangular rice cake with red bean paste","portable lunch rice bun","三角飯糰(肉鬆)"]', '加工調理食品及其他類', 'AI生成', NULL, '三角飯糰(肉鬆)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_9', '["生菜","長江蘿蔔","lettuce","cos lettuce","romaine lettuce","不結球萵苣平均值"]', '蔬菜類', 'AI生成', NULL, '不結球萵苣平均值');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_10', '["世紀番石榴","超級芭樂","Century Papaya","Ponytail Palm Fruit","Wonder Guava","世紀芭樂"]', '水果類', 'AI生成', NULL, '世紀芭樂');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_11', '["大蝦","明蝦","長尾蝦","花蝦","Chinese white shrimp","Pandalus spp.","Freshwater prawn (in some contexts, but not accurate for this species)","River shrimp (in some contexts, but not accurate for this species)","中國對蝦","Shrimp"]', '魚貝類', 'AI生成', 'Shrimp', '中國對蝦');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_12', '["中筋面粉","半筋半麺","medium gluten flour","all-purpose flour","中筋麵粉"]', '穀物類', 'AI生成', NULL, '中筋麵粉');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_13', '["人造奶油","植物奶油","vegetable shortening","imitation butter","buttery spread","中脂人造奶油","American butterfish"]', '油脂類', 'AI生成', 'American butterfish', '中脂人造奶油');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_14', '["中脂保久乳","medium-fat long-lasting milk","preserved medium-fat milk"]', '乳品類', 'AI生成', NULL, '中脂保久乳');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_15', '["草莓發酵乳","草莓凝態乳","草莓奶酪","莓果發酵乳","strawberry fermented milk","strawberry yogurt-like dessert","strawberry cream cheese","中脂凝態發酵乳(草莓)","Strawberry"]', '乳品類', 'AI生成', 'Strawberry', '中脂凝態發酵乳(草莓)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_16', '["中脂凝態發酵乳","蘆薈發酵乳","Mid-fat gel fermented milk with aloe vera","Aloe Vera Fermented Milk","中脂凝態發酵乳(蘆薈)"]', '乳品類', 'AI生成', NULL, '中脂凝態發酵乳(蘆薈)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_17', '["中脂鮮乳","調整脂肪酸鮮奶","medium-fat enriched milk","fat-adjusted fresh milk","中脂強化鮮乳(脂肪酸調整)"]', '乳品類', 'AI生成', NULL, '中脂強化鮮乳(脂肪酸調整)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_18', '["濃稠發酵乳","中脂發酵乳","thick fermented dairy","medium-fat fermented milk","中脂濃稠發酵乳"]', '乳品類', 'AI生成', NULL, '中脂濃稠發酵乳');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_19', '["發酵乳","濃稠酸奶","無糖發酵乳","纖維強化乳","低脂發酵乳","thick fermented milk","sugar-free yogurt","fiber-enriched dairy product","low-fat fermented milk","中脂濃稠發酵乳(無糖&纖維強化)","Sugar"]', '乳品類', 'AI生成', 'Sugar', '中脂濃稠發酵乳(無糖&纖維強化)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_20', '["草莓發酵乳","濃稠草莓乳","草莓酸奶油","strawberry fermented milk","thick strawberry dairy","strawberry creamed milk","中脂濃稠發酵乳(草莓)","Strawberry"]', '乳品類', 'AI生成', 'Strawberry', '中脂濃稠發酵乳(草莓)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_21', '["中脂調味乳","多穀調味乳","medium-fat flavored milk with grains","grain-infused medium-fat milk","中脂調味乳(多穀類)"]', '乳品類', 'AI生成', NULL, '中脂調味乳(多穀類)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_22', '["巧克力牛奶","調味乳（巧克力味）","Chocolate flavored milk","Chocolate milk","中脂調味乳(巧克力)"]', '乳品類', 'AI生成', NULL, '中脂調味乳(巧克力)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_23', '["果汁調味乳","水果奶","果肉奶","juice flavored milk","fruit milk drink","milk with juice","中脂調味乳(果汁)","Fruit juice"]', '乳品類', 'AI生成', 'Fruit juice', '中脂調味乳(果汁)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_24', '["中脂調味乳","營養強化乳","維他命調味奶","Medium-fat flavored milk (vitamin fortified)","Fortified vitamin milk drink","中脂調味乳(維生素強化)"]', '乳品類', 'AI生成', NULL, '中脂調味乳(維生素強化)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_25', '["中脂調味乳","纖維強化乳","維生素E強化乳","營養調味乳","medium-fat flavored milk","vitamin E enriched milk","fiber-enriched flavored milk","中脂調味乳(纖維&維生素E強化)"]', '乳品類', 'AI生成', NULL, '中脂調味乳(纖維&維生素E強化)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_26', '["中脂調味乳","鈣強化牛奶","加鈣調味奶","營養奶","calcium-enriched flavored milk","fortified milk with calcium","enriched flavored dairy drink","中脂調味乳(鈣強化)"]', '乳品類', 'AI生成', NULL, '中脂調味乳(鈣強化)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_27', '["巧克力牛奶","調味牛奶","保久牛奶","巧克力乳飲料","Chocolate flavored long-lasting milk","Chocolate milk","Chocolate-flavored dairy drink","中脂調味保久乳(巧克力)"]', '乳品類', 'AI生成', NULL, '中脂調味保久乳(巧克力)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_28', '["調味布丁","牛奶布丁","乳製品布丁","flavored cream pudding","dairy pudding","milk jelly","中脂調味保久乳(布丁)"]', '乳品類', 'AI生成', NULL, '中脂調味保久乳(布丁)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_29', '["中脂調味保久羊乳(巧克力)","巧克力羊奶","調味羊奶","Chocolate Flavored Sheep Milk Drink","Preserved Chocolate Sheep's Milk","Sheep Dairy with Chocolate Flavoring"]', '乳品類', 'AI生成', NULL, '中脂調味保久羊乳(巧克力)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_30', '["果汁羊乳","調味羊奶飲料","低脂羊奶果汁","fruit juice flavored sheep milk drink","sheep's milk beverage with fruit flavoring","lite fat sheep milk juice","中脂調味保久羊乳(果汁)","Fruit juice"]', '乳品類', 'AI生成', 'Fruit juice', '中脂調味保久羊乳(果汁)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_31', '["鮮奶","牛奶","冷藏乳","fresh milk","dairy milk","cow's milk","中脂鮮乳"]', '乳品類', 'AI生成', NULL, '中脂鮮乳');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_32', '["中脂鮮羊乳","mid-fat fresh sheep milk","fresh sheep's milk","sheep yogurt (if fermented)"]', '乳品類', 'AI生成', NULL, '中脂鮮羊乳');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_33', '["中鏈脂肪酸油","medium-chain triglyceride oil","MCT oil"]', '油脂類', 'AI生成', NULL, '中鏈脂肪酸油');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_34', '["九孔蜆","馬蹄螺","錢螺","nine-hole clam","money clam","九孔螺"]', '魚貝類', 'AI生成', NULL, '九孔螺');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_35', '["九層塔","香草九層塔","金不換","Nine Herb Plant","Bacang","Culantro"]', '蔬菜類', 'AI生成', NULL, '九層塔');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_36', '["藍紋奶酪蛋糕","霉菌乾酪蛋糕","blue cheese cake","penicillium cheese cake","乳酪蛋糕","Blue cheese"]', '糕餅點心類', 'AI生成', 'Blue cheese', '乳酪蛋糕');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_37', '["乳酸球","sour milk ball","lactic acid ball"]', '糕餅點心類', 'AI生成', NULL, '乳酸球');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_38', '["乳酸飲料","優酪乳飲料","yogurt drink","lactic acid beverage"]', '飲料類', 'AI生成', NULL, '乳酸飲料');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_39', '["乾松茸","姬松茸乾","hibernal mushroom","shiitake relative mushroom","乾姬松茸"]', '菇類', 'AI生成', NULL, '乾姬松茸');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_40', '["乾黑木耳","乾耳","川耳","dried wood ear mushroom","ear fungus","aureobasidium polystigma","tree ear","乾川耳"]', '菇類', 'AI生成', NULL, '乾川耳');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_41', '["乾黑木耳","紅耳仔","dried wood ear (red variety)","乾木耳(紅耳仔)"]', '菇類', 'AI生成', NULL, '乾木耳(紅耳仔)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_42', '["乾黑木耳","黑耳","干木耳","黑木耳乾","dried black wood ear mushroom","cloud ear fungus","black cloud ear","乾木耳(黑耳仔)"]', '菇類', 'AI生成', NULL, '乾木耳(黑耳仔)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_43', '["乾黑木耳","dried black wood ear mushroom","tree ear","cloud ear","aerial vegetable","乾木耳平均值"]', '菇類', 'AI生成', NULL, '乾木耳平均值');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_44', '["乾柳松菇","preserved oak mushroom","dried oak mushroom","oak ear fungus"]', '菇類', 'AI生成', NULL, '乾柳松菇');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_45', '["乾海藻","乾昆布","海苔干","dried kelp","kombu flakes","sea mustard sheets","乾海帶"]', '藻類', 'AI生成', NULL, '乾海帶');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_46', '["乾海蘿蔔心","干海松","dried sea pine cores","dry sea lettuce hearts","乾海茸芯"]', '藻類', 'AI生成', NULL, '乾海茸芯');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_47', '["乾猴頭","乾靈芝菇","dried lion's mane mushroom","hericium erinaceus (dried)","乾猴頭菇"]', '菇類', 'AI生成', NULL, '乾猴頭菇');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_48', '["玉米粒","乾玉米","dried corn kernels","corn grits (when ground)","hominy (if treated with lye)","乾玉米粒","Acorn"]', '穀物類', 'AI生成', 'Acorn', '乾玉米粒');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_49', '["乾白蘑菇","干白花菇","dried white mushroom","white fungus","乾白花菇"]', '菇類', 'AI生成', NULL, '乾白花菇');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_50', '["乾百合同","乾百合鱗片"]', '蔬菜類', 'AI生成', NULL, '乾百合鱗片');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_51', '["乾竹蓀","乾冬筍","dried bamboo笙","dried winter bamboo shoot","乾竹笙"]', '菇類', 'AI生成', NULL, '乾竹笙');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_52', '["乾香菇","花菇干","dried flower mushroom","sun-dried mushroom","乾花菇"]', '菇類', 'AI生成', NULL, '乾花菇');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_53', '["乾昆布","乾海帶","dried kelp","dried sea vegetable","乾裙帶菜"]', '藻類', 'AI生成', NULL, '乾裙帶菜');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_54', '["乾昆布根","乾海帶根","kelp root, dried","bladderwrack root, dried","乾裙帶菜根"]', '藻類', 'AI生成', NULL, '乾裙帶菜根');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_55', '["乾酪粉","奶酪粉","乳酪粉","cheese powder","processed cheese powder","instant cheese powder"]', '乳品類', 'AI生成', NULL, '乾酪粉');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_56', '["乾香菇","乾花菇","dried button mushroom","shiitake cap","乾鈕釦菇"]', '菇類', 'AI生成', NULL, '乾鈕釦菇');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_57', '["乾銀耳","白木耳","silver ear (dried)","white wood ear"]', '菇類', 'AI生成', NULL, '乾銀耳');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_58', '["乾紅辣椒","幹長紅椒","dried red chili pepper","dry long red pepper","乾長辣椒(紅皮)"]', '蔬菜類', 'AI生成', NULL, '乾長辣椒(紅皮)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_59', '["乾香菌","乾香菇乾","dried shiitake mushroom","dry shiitake","shiokara","kikurage (日本語)","乾香菇"]', '菇類', 'AI生成', NULL, '乾香菇');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_60', '["乾香菇","乾香茹","dried mushroom","shiitake mushroom (dry)","乾香菇平均值"]', '菇類', 'AI生成', NULL, '乾香菇平均值');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_61', '["麒麟菜","江白菜","羊栖菜","stone flower","guso","nori (partial match, not exact)","乾麒麟菜"]', '藻類', 'AI生成', NULL, '乾麒麟菜');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_62', '["乾麺","乾粉條","乾河粉","dried noodles","instant noodles","ramen","乾麵條"]', '加工調理食品及其他類', 'AI生成', NULL, '乾麵條');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_63', '["二節翅","雞翅中","middle chicken wings","middle section of chicken wing","二節翅(土雞)"]', '肉類', 'AI生成', NULL, '二節翅(土雞)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_64', '["二節翅","drumette","chicken wing section","chicken wing tip","wingette","二節翅(肉雞)"]', '肉類', 'AI生成', NULL, '二節翅(肉雞)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_65', '["二節翅","average value wing section","wing segment","二節翅平均值"]', '肉類', 'AI生成', NULL, '二節翅平均值');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_66', '["五味汁","調味醬","five-flavor sauce","seasoning paste","五味醬"]', '調味料及香辛料類', 'AI生成', NULL, '五味醬');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_67', '["野米","加拿大米","印度米","Canada rice","Indian rice","water oats","五穀米","Annual wild rice"]', '穀物類', 'AI生成', 'Annual wild rice', '五穀米');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_68', '["五香粉","五香料","five-spice powder","Chinese five spice","oriental five spice"]', '調味料及香辛料類', 'AI生成', NULL, '五香粉');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_69', '["五香豆腐乾","五香豆皮","南翔小籠五香干","five-spice tofu skin","preserved bean curd sheet","soybean cake with five spices","五香豆干"]', '加工調理食品及其他類', 'AI生成', NULL, '五香豆干');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_70', '["亞麻仁油","亞麻籽油","flaxseed oil","linseed oil"]', '油脂類', 'AI生成', NULL, '亞麻仁油');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_71', '["亞麻籽","胡桃仁","linseed","flax seed","亞麻仁籽"]', '堅果及種子類', 'AI生成', NULL, '亞麻仁籽');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_72', '["亞麻籽粉","亞麻仁粉","flaxseed meal","linseed flour","亞麻仁籽粉"]', '堅果及種子類', 'AI生成', NULL, '亞麻仁籽粉');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_73', '["冷金果","佛手瓜梨","西番莲果","apple of Sodom","soursop pear","custard apple","人心果"]', '水果類', 'AI生成', NULL, '人心果');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_74', '["人造黃油","植物奶油","vegetable shortening","spread","buttery spread","人造奶油(2021年取樣)","American butterfish"]', '油脂類', 'AI生成', 'American butterfish', '人造奶油(2021年取樣)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_75', '["人造黃油","植物奶油","vegetable shortening","dairy-free spread","人造奶油(低熱量)","American butterfish"]', '油脂類', 'AI生成', 'American butterfish', '人造奶油(低熱量)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_76', '["人造黃油","奶油替代品","vegetable shortening","butter spread","spreadable butter","人造奶油(維生素強化)","American butterfish"]', '油脂類', 'AI生成', 'American butterfish', '人造奶油(維生素強化)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_77', '["仙草凍","涼粉","綠豆凍","仙人草凍","冰草凍","Agar Grass Jelly","Ice Leaf Jelly","Grass Jelly Pudding"]', '糕餅點心類', 'AI生成', NULL, '仙草凍');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_78', '["仙草凍","凉粉草冻","仙人草冻","琼草冻","Agar jelly with grass jelly","Grass jelly pudding","Adele jelly dessert","Jellygrass dessert","仙草凍(2020取樣)"]', '糕餅點心類', 'AI生成', NULL, '仙草凍(2020取樣)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_79', '["仙草汁","冰涼仙草蜜","黑糖仙草蜜","黑糖仙草","Agar jelly syrup","Aiyu jelly honey","Black sugar agar jelly drink","仙草蜜"]', '飲料類', 'AI生成', NULL, '仙草蜜');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_80', '["仿刺參","Simulated Thorn Sea Cucumber","Artificial Thorny Sea Cucumber"]', '魚貝類', 'AI生成', NULL, '仿刺參');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_81', '["佃煮黑豆","醃製黑豆","fermented black soybeans","braised black beans"]', '加工調理食品及其他類', 'AI生成', NULL, '佃煮黑豆');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_82', '["低眼無齒芒魚片","芒加魚邊","Alaska blackfish","Dallia pectoralis","低眼無齒芒魚片(芒加魚邊)"]', '魚貝類', 'AI生成', 'Alaska blackfish', '低眼無齒芒魚片(芒加魚邊)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_83', '["低筋粉","低筋麵粉"]', '穀物類', 'AI生成', NULL, '低筋麵粉');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_84', '["低脂強化乳","寡糖保久乳","Low-fat fortified long-lasting milk","Oligosaccharide-enriched milk","低脂強化保久乳(寡糖強化)","Sugar"]', '乳品類', 'AI生成', 'Sugar', '低脂強化保久乳(寡糖強化)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_85', '["低脂強化鮮奶","低脂營養乳","寡醣低脂牛奶","reduced-fat enriched fresh milk","low-fat enhanced milk","oligosaccharide-enriched low-fat milk","低脂強化鮮乳(寡醣強化)"]', '乳品類', 'AI生成', NULL, '低脂強化鮮乳(寡醣強化)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_86', '["低脂維他命E強化鮮奶","維生素E強化的低脂牛奶","低脂鮮乳（含維生素E）","Low-fat vitamin E fortified milk","Fortified low-fat fresh milk with Vitamin E","低脂強化鮮乳(維生素E強化)"]', '乳品類', 'AI生成', NULL, '低脂強化鮮乳(維生素E強化)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_87', '["低脂濃稠酸奶","濃醇發酵乳","低脂發酵飲品","low-fat thickened yogurt","concentrated fermented milk","reduced-fat cultured dairy drink","低脂濃稠發酵乳"]', '乳品類', 'AI生成', NULL, '低脂濃稠發酵乳');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_88', '["木瓜調味乳","低脂木瓜奶","papaya-flavored low-fat milk","low-fat dairy with papaya","低脂調味乳(木瓜)","Papaya"]', '乳品類', 'AI生成', 'Papaya', '低脂調味乳(木瓜)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_89', '["低脂濃縮高湯","健康高湯","low-fat stock","lean broth","低脂高湯"]', '調味料及香辛料類', 'AI生成', NULL, '低脂高湯');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_90', '["低脂牛奶","無脂鮮奶","脫脂牛奶","skim milk","fat-free milk","reduced fat milk","低脂鮮乳"]', '乳品類', 'AI生成', NULL, '低脂鮮乳');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_91', '["低鈉鹽","減鈉鹽","low sodium salt","reduced sodium salt","Salt"]', '調味料及香辛料類', 'AI生成', 'Salt', '低鈉鹽');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_92', '["保久米","野生米","wild rice","Canada rice","Indian rice","water oats","保久米漿","Annual wild rice"]', '加工調理食品及其他類', 'AI生成', 'Annual wild rice', '保久米漿');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_93', '["保久羊奶","長壽乳","羊奶奶","preserved sheep milk","long-lasting sheep's milk","shelf-stable sheep milk","保久羊乳"]', '乳品類', 'AI生成', NULL, '保久羊乳');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_94', '["假人蔘","參薯","false ginseng","pseudoginseng root"]', '蔬菜類', 'AI生成', NULL, '假人蔘');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_95', '["豆腐腦","豆花","豆腐皮","千張","腐竹","bean curd","soybean curd","tofuba","tubu","傳統豆腐","Tofu"]', '加工調理食品及其他類', 'AI生成', 'Tofu', '傳統豆腐');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_96', '["豆腐","豆花","腐乳","素肉","千張","tofu","bean curd","soybean curd","傳統豆腐(2022年取樣)","Tofu"]', '加工調理食品及其他類', 'AI生成', 'Tofu', '傳統豆腐(2022年取樣)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_97', '["豆腐花","豆花","甜品豆花","tofu pudding","bean curd dessert","soft tofu with syrup","傳統豆花(未加糖)","Sugar"]', '糕餅點心類', 'AI生成', 'Sugar', '傳統豆花(未加糖)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_98', '["僧帽肌","sēng mào jī"]', '肉類', 'AI生成', NULL, '僧帽肌');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_99', '["克氏兔頭魨","Kuei's rabbit head sole"]', '魚貝類', 'AI生成', NULL, '克氏兔頭魨');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_100', '["免煮飯","速食飯","即食飯","ready-to-eat rice","instant precooked rice"]', '加工調理食品及其他類', 'AI生成', NULL, '免煮飯');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_101', '["全脂牛奶","保久奶","長效牛奶","whole milk","long-lasting milk","全脂保久乳"]', '乳品類', 'AI生成', NULL, '全脂保久乳');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_102', '["全脂凝態發酵乳","常溫酸奶","活菌飲料","凝固型酸奶","full-fat set yogurt","set yogurt","cultured milk drink","thick yogurt"]', '乳品類', 'AI生成', NULL, '全脂凝態發酵乳');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_103', '["全脂奶粉","牛奶粉","whole milk powder","full cream milk powder"]', '乳品類', 'AI生成', NULL, '全脂奶粉');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_104', '["全脂強化奶粉","纖維增強奶粉","高纖奶粉","full-fat fortified milk powder","fiber-enriched milk formula","全脂強化奶粉(纖維強化)"]', '乳品類', 'AI生成', NULL, '全脂強化奶粉(纖維強化)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_105', '["全脂發酵乳","濃稠發酵乳","厚乳","full-fat thick yogurt","thick fermented milk","rich yogurt","全脂濃稠發酵乳"]', '乳品類', 'AI生成', NULL, '全脂濃稠發酵乳');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_106', '["全脂羊奶粉","羊奶粉","whole milk sheep powder","sheep's whole milk formula","full-fat sheep milk powder"]', '乳品類', 'AI生成', NULL, '全脂羊奶粉');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_107', '["全脂羊奶粉","即溶羊奶粉","whole milk sheep powder","dissolvable sheep milk formula","全脂羊奶粉(即溶)"]', '乳品類', 'AI生成', NULL, '全脂羊奶粉(即溶)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_108', '["全脂牛奶","鮮奶","純奶","白開水（俗稱）","乳汁","whole milk","fresh milk","full cream milk","white water (colloquial)","全脂鮮乳(10月取樣)"]', '乳品類', 'AI生成', NULL, '全脂鮮乳(10月取樣)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_109', '["全脂牛奶","鮮奶","全脂鮮奶","whole milk","fresh milk","full cream milk","全脂鮮乳(11月取樣)"]', '乳品類', 'AI生成', NULL, '全脂鮮乳(11月取樣)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_110', '["全脂牛奶","鮮奶","牛奶","whole milk","fresh milk","cow's milk","全脂鮮乳(12月取樣)"]', '乳品類', 'AI生成', NULL, '全脂鮮乳(12月取樣)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_111', '["全脂牛奶","新鮮牛奶","生牛奶","whole milk","fresh milk","raw milk","全脂鮮乳(1月取樣)"]', '乳品類', 'AI生成', NULL, '全脂鮮乳(1月取樣)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_112', '["全脂牛奶","新鮮牛奶","純奶","濃縮牛奶","whole milk","fresh milk","full cream milk","cow's milk","全脂鮮乳(4月取樣)"]', '乳品類', 'AI生成', NULL, '全脂鮮乳(4月取樣)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_113', '["全脂牛奶","純奶","新鮮牛奶","whole milk","fresh whole milk","全脂鮮乳(6月取樣)"]', '乳品類', 'AI生成', NULL, '全脂鮮乳(6月取樣)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_114', '["全脂牛奶","鮮奶","新鮮牛奶","純牛奶","whole milk","fresh milk","全脂鮮乳(7月取樣)"]', '乳品類', 'AI生成', NULL, '全脂鮮乳(7月取樣)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_115', '["全脂牛奶","鮮奶","新鮮牛奶","純牛奶","鮮乳","whole milk","fresh milk","full cream milk","dairy milk","cow's milk","全脂鮮乳(9月取樣)"]', '乳品類', 'AI生成', NULL, '全脂鮮乳(9月取樣)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_116', '["全脂牛奶","鮮奶","純牛奶","生牛乳","whole milk","fresh milk","full cream milk","raw milk","全脂鮮乳平均值"]', '乳品類', 'AI生成', NULL, '全脂鮮乳平均值');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_117', '["全麥粉","粗麥粉","whole wheat flour","entire grain flour","全麥麵粉"]', '穀物類', 'AI生成', NULL, '全麥麵粉');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_118', '["大料","八角香","茴香豆寇","胡椒果","star anise","ba jeek","八角"]', '調味料及香辛料類', 'AI生成', NULL, '八角');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_119', '["白冬瓜","青皮冬瓜","水冬瓜","西瓜冬瓜","winter melon","ash gourd","white gourd","冬瓜"]', '蔬菜類', 'AI生成', NULL, '冬瓜');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_120', '["白冬瓜","水冬瓜","青皮冬瓜","雪冬瓜","冬瓜(2022年取樣)"]', '蔬菜類', 'AI生成', NULL, '冬瓜(2022年取樣)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_121', '["冬瓜","白冬瓜","winter melon","ash gourd","冬瓜平均值"]', '蔬菜類', 'AI生成', NULL, '冬瓜平均值');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_122', '["冬瓜糖","冰片糖","wintermelon candy brick","cooling sugar slab","冬瓜糖磚","Sugar"]', '糖類', 'AI生成', 'Sugar', '冬瓜糖磚');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_123', '["冬瓜茶","冬菜茶","冰凍冬瓜茶","Winter Melon Tea","Fung Wong Cha","Black tea"]', '飲料類', 'AI生成', 'Black tea', '冬瓜茶');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_124', '["米線","粉絲","細粉","rice vermicelli","rice noodles","冬粉"]', '加工調理食品及其他類', 'AI生成', NULL, '冬粉');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_125', '["冰淇淋粉","香草味冰淇淋粉","vanilla ice cream powder","ice cream mix powder","冰淇淋粉(香草)"]', '糕餅點心類', 'AI生成', NULL, '冰淇淋粉(香草)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_126', '["冰糖","白砂糖","冰片糖","rock sugar","ice sugar","candied sugar","Sugar"]', '糖類', 'AI生成', 'Sugar', '冰糖');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_127', '["冰花菜","雪花菜","fairy apricot","snow flower","cotton rose","冰花"]', '蔬菜類', 'AI生成', NULL, '冰花');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_128', '["冷凍餃子","水晶餃子","冰皮餃子","frozen crystal dumplings","ice skin dumplings","冷凍,水晶餃"]', '加工調理食品及其他類', 'AI生成', NULL, '冷凍,水晶餃');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_129', '["冬菜蝦餛飩","凍蝦仁冬菜饅頭","冷凍蝦肉餛飩","Frozen Winter Vegetable Shrimp Dumplings","Shrimp and Winter Vegetable Dumplings","Cold Storage Shrimp and Chinese Cabbage Wrappers","冷凍冬菜蝦仁餛飩","Shrimp"]', '加工調理食品及其他類', 'AI生成', 'Shrimp', '冷凍冬菜蝦仁餛飩');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_130', '["凍叉燒包","冷凍包子","frozen char siu bao","char siu bun (frozen)","冷凍叉燒包"]', '加工調理食品及其他類', 'AI生成', NULL, '冷凍叉燒包');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_131', '["凍叉燒包","冰鎮叉燒包","冷凍包子","frozen char siu bun","iced char siu bun","frozen pork bun","冷凍叉燒包子"]', '加工調理食品及其他類', 'AI生成', NULL, '冷凍叉燒包子');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_132', '["可樂餅","奶汁可樂餅","冷凍可樂餅","croquette","ice cream croquette","frozen croquette","冷凍可樂餅(奶汁)","Chocolate"]', '加工調理食品及其他類', 'AI生成', 'Chocolate', '冷凍可樂餅(奶汁)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_133', '["凍咕咾肉","冰鎮咕嚕肉","frozen sweet and sour pork","chilled sweet and sour pork","冷凍咕咾肉"]', '加工調理食品及其他類', 'AI生成', NULL, '冷凍咕咾肉');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_134', '["冷凍小香腸","迷你香腸","速凍小腸","冰香腸","frozen mini sausage","small frozen sausage","bite-sized sausage","Sausage"]', '加工調理食品及其他類', 'AI生成', 'Sausage', '冷凍小香腸');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_135', '["花生米","生果仁","熟花生","peanut","goober","groundnut","冷凍帶殼花生(熟)","Peanut"]', '堅果及種子類', 'AI生成', 'Peanut', '冷凍帶殼花生(熟)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_136', '["冷凍干貝酥","乾貝酥","dried abalone cracker","frozen abalone cracker"]', '加工調理食品及其他類', 'AI生成', NULL, '冷凍干貝酥');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_137', '["冷凍比薩","黑胡椒火腿披薩","速凍披薩","frozen pepperoni pizza","pepperoni and ham pizza","quick freeze pizza","冷凍披薩(黑胡椒火腿)","Hamburger"]', '加工調理食品及其他類', 'AI生成', 'Hamburger', '冷凍披薩(黑胡椒火腿)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_138', '["文蛤丸","凍文蛤餃子","冰鎮文蛤球","frozen scallop balls","iced scallops dumplings","冷凍文蛤丸","Bivalvia (Clam, Mussel, Oyster)"]', '加工調理食品及其他類', 'AI生成', 'Bivalvia (Clam, Mussel, Oyster)', '冷凍文蛤丸');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_139', '["冷凍旗魚丸","冰凍旗魚丸","frozen pollock balls","iced cod balls","Alaska blackfish"]', '加工調理食品及其他類', 'AI生成', 'Alaska blackfish', '冷凍旗魚丸');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_140', '["冷凍旗魚塊","frozen Alaska blackfish","Alaska blackfish fillet","Alaska blackfish"]', '加工調理食品及其他類', 'AI生成', 'Alaska blackfish', '冷凍旗魚塊');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_141', '["冷凍春捲","冰鎮春捲","速冻春卷","frozen spring roll","ice-cold spring roll","quick-frozen spring roll"]', '加工調理食品及其他類', 'AI生成', NULL, '冷凍春捲');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_142', '["凍乾木耳","冰鮮木耳","dried frozen mushrooms","frozen ear fungus","冷凍木耳"]', '菇類', 'AI生成', NULL, '冷凍木耳');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_143', '["冷凍青毛豆","冰鎮毛豆仁","冷凍毛豆粒","frozen edamame","frozen young soybeans","iced edamame","冷凍毛豆仁"]', '豆類', 'AI生成', NULL, '冷凍毛豆仁');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_144', '["凍晶包","冷凍水晶餃子","frozen crystal bun","icy skin buns","冷凍水晶包"]', '加工調理食品及其他類', 'AI生成', NULL, '冷凍水晶包');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_145', '["冷凍洋菇","frozen mushroom","mushroom, frozen"]', '菇類', 'AI生成', NULL, '冷凍洋菇');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_146', '["洋蔥圈","炸洋蔥圈","frozen onion rings","onion hoops","deep-fried onion rings","冷凍洋蔥圈","Garden onion"]', '加工調理食品及其他類', 'AI生成', 'Garden onion', '冷凍洋蔥圈');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_147', '["冷凍火腿炒飯","frozen ham fried rice","Hamburger"]', '加工調理食品及其他類', 'AI生成', 'Hamburger', '冷凍火腿炒飯');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_148', '["凍烏龍麵","冰鎮烏龍麵","frozen udon noodles","iced udon","冷凍烏龍麵"]', '加工調理食品及其他類', 'AI生成', NULL, '冷凍烏龍麵');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_149', '["冷凍雞翅","速凍烤雞翅","冰鎮烤雞翅","frozen grilled chicken wings","frozen baked chicken wings","frozen BBQ chicken wings","冷凍烤雞翅"]', '加工調理食品及其他類', 'AI生成', NULL, '冷凍烤雞翅');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_150', '["凍燒賣","冰凍燒賣","frozen shumai","ice shumai","冷凍燒賣"]', '加工調理食品及其他類', 'AI生成', NULL, '冷凍燒賣');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_151', '["凍餃","冰餃","凍燕餃","frozen shumai","iced dumplings","chilled dim sum","冷凍燕餃"]', '加工調理食品及其他類', 'AI生成', NULL, '冷凍燕餃');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_152', '["冷凍牛肉包","速凍牛肉包子","frozen beef buns","quick-frozen beef dumplings","冷凍牛肉包子","Beefalo"]', '加工調理食品及其他類', 'AI生成', 'Beefalo', '冷凍牛肉包子');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_153', '["冷凍牛肉餃子","冰鎮牛肉水餃","frozen beef dumplings","ice-chilled beef potstickers","冷凍牛肉水餃","Beefalo"]', '加工調理食品及其他類', 'AI生成', 'Beefalo', '冷凍牛肉水餃');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_154', '["冷凍牛肉漢堡肉","frozen beef patty","beef burger meat","frozen hamburger meat","Beefalo"]', '加工調理食品及其他類', 'AI生成', 'Beefalo', '冷凍牛肉漢堡肉');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_155', '["玉米粒","甜玉米粒","sweet corn kernels","corn niblets","冷凍玉米粒","Acorn"]', '穀物類', 'AI生成', 'Acorn', '冷凍玉米粒');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_156', '["凍結珍珠丸","冷凍丸子","冰鎮珍珠丸","frozen pearl meatballs","iced pearl dumplings","冷凍珍珠丸"]', '加工調理食品及其他類', 'AI生成', NULL, '冷凍珍珠丸');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_157', '["冷凍地瓜條","冰鎮甘薯絲","凍薯條","凍地瓜棒","frozen sweet potato strips","sweet tater sticks","iced sweet potatoes","冷凍甘薯條"]', '加工調理食品及其他類', 'AI生成', NULL, '冷凍甘薯條');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_158', '["冷凍西蘭花","冷凍綠甘藍","frozen broccoli","frozen green cabbage","冷凍甘藍"]', '蔬菜類', 'AI生成', NULL, '冷凍甘藍');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_159', '["冰凍白饅頭","冷饃頭","凍饅頭","frozen white bun","freezer white steamed bun","冷凍白饅頭"]', '加工調理食品及其他類', 'AI生成', NULL, '冷凍白饅頭');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_160', '["冷凍米糕","冰凍筒仔米糕","筒仔冰","frozen glutinous rice cake roll","sticky rice cake on a stick","glutinous rice ice roll","冷凍筒仔米糕","Annual wild rice"]', '加工調理食品及其他類', 'AI生成', 'Annual wild rice', '冷凍筒仔米糕');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_161', '["素菜包","凍包子","vegetarian bun","freezer vegetable bun","冷凍素菜包子"]', '加工調理食品及其他類', 'AI生成', NULL, '冷凍素菜包子');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_162', '["素雞排","凍素雞塊","仿雞肉塊","vegetarian chicken nuggets","mock chicken pieces","vegan chicken chunks","冷凍素雞塊"]', '加工調理食品及其他類', 'AI生成', NULL, '冷凍素雞塊');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_163', '["冷凍水餃","素水餠","速凍蔬菜餃子","凍素餛飩","frozen vegetable dumplings","freezer-friendly vegan jiaozi","vegetarian frozen potstickers","冷凍素食水餃"]', '加工調理食品及其他類', 'AI生成', NULL, '冷凍素食水餃');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_164', '["凍素水餃","冷凍熟食水餃","frozen vegetarian dumplings","veggie potstickers","冷凍素食熟水餃"]', '加工調理食品及其他類', 'AI生成', NULL, '冷凍素食熟水餃');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_165', '["紅蘿蔔","樺捲心菜","樺菸草","樺菜","冷凍胡蘿蔔","Carrot"]', '蔬菜類', 'AI生成', 'Carrot', '冷凍胡蘿蔔');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_166', '["冷凍芋頭包","冷凍芋泥餡餅","冰鎮芋泥包","凍芋泥饅頭","frozen taro paste bun","iced taro pudding pastry","cold taro filling bao","冷凍芋泥包"]', '加工調理食品及其他類', 'AI生成', NULL, '冷凍芋泥包');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_167', '["凍芋頭","凍芋仔","凍芋泥塊","tapioca pearls","boba","pearls","tapioca balls","冷凍芋頭塊"]', '澱粉類', 'AI生成', NULL, '冷凍芋頭塊');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_168', '["芝麻包","冰皮芝麻包","冷凍包子","frozen sesame bun","ice skin sesame bun","冷凍芝麻包","Sesame"]', '加工調理食品及其他類', 'AI生成', 'Sesame', '冷凍芝麻包');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_169', '["芝麻湯圓","凍餃子","frozen sesame dumplings","served sesame balls","冷凍芝麻湯圓","Sesame"]', '加工調理食品及其他類', 'AI生成', 'Sesame', '冷凍芝麻湯圓');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_170', '["花枝丸","墨魚丸","cuttlefish balls","squid balls","冷凍花枝丸","Cuttlefish"]', '加工調理食品及其他類', 'AI生成', 'Cuttlefish', '冷凍花枝丸');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_171', '["花枝","墨魚仔","cuttlefish","sepia","mottle fish","冷凍花枝塊","Cuttlefish"]', '加工調理食品及其他類', 'AI生成', 'Cuttlefish', '冷凍花枝塊');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_172', '["花枝排","墨魚排","cuttlefish steak","sepia slice","冷凍花枝排","Cuttlefish"]', '加工調理食品及其他類', 'AI生成', 'Cuttlefish', '冷凍花枝排');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_173', '["花枝漿","墨魚漿","cuttlefish paste","sepia pate","冷凍花枝漿","Cuttlefish"]', '加工調理食品及其他類', 'AI生成', 'Cuttlefish', '冷凍花枝漿');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_174', '["花枝羹","墨魚羹","烏賊羹","cuttlefish soup","squid porridge","sepia stew","冷凍花枝羹","Cuttlefish"]', '加工調理食品及其他類', 'AI生成', 'Cuttlefish', '冷凍花枝羹');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_175', '["花枝餃","墨魚餃","cuttlefish dumplings","squid dumplings","冷凍花枝餃","Cuttlefish"]', '加工調理食品及其他類', 'AI生成', 'Cuttlefish', '冷凍花枝餃');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_176', '["花椰菜","青花菜","broccoli","calabrese","冷凍花椰菜","Broccoli"]', '蔬菜類', 'AI生成', 'Broccoli', '冷凍花椰菜');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_177', '["花生湯圓","凍花生圓仔","frozen peanut soup dumplings","peanut ice ball","冷凍花生湯圓","Peanut"]', '加工調理食品及其他類', 'AI生成', 'Peanut', '冷凍花生湯圓');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_178', '["冷冻荔枝","冰荔","frozen lychee","冷凍荔枝"]', '水果類', 'AI生成', NULL, '冷凍荔枝');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_179', '["冷凍菜肉餛飩","速凍餛飩","冰凍餃子","速凍水餃","frozen vegetable and meat dumplings","quick-frozen dumplings","ice-dumplings"]', '加工調理食品及其他類', 'AI生成', NULL, '冷凍菜肉餛飩');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_180', '["凍豆","冰菜豆","frozen snap beans","frozen green beans","冷凍菜豆(莢)"]', '豆類', 'AI生成', NULL, '冷凍菜豆(莢)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_181', '["夏葵菜","夏布草","碧瑤菜","Malabar spinach","Basella alba","Red vine spinach","Creeping spinach","Climbing spinach","Indian spinach","Philippine Spinach","Asian Spinach","冷凍菠菜"]', '蔬菜類', 'AI生成', 'Malabar spinach', '冷凍菠菜');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_182', '["凍蓮蓉包","冰蓮蓉包","frozen lotus seed paste bun","lotus paste roll (frozen)","冷凍蓮蓉包"]', '加工調理食品及其他類', 'AI生成', NULL, '冷凍蓮蓉包');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_183', '["冷蔥油餅","凍蔥油餅","frozen scallion pancake","iced scallion pancake","冷凍蔥油餅"]', '加工調理食品及其他類', 'AI生成', NULL, '冷凍蔥油餅');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_184', '["虱目魚丸","凍虱目魚丸","Alaska blackfish balls","Frozen Alaska pollock balls","冷凍虱目魚丸","Alaska blackfish"]', '加工調理食品及其他類', 'AI生成', 'Alaska blackfish', '冷凍虱目魚丸');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_185', '["蚵仔捲","海鮮捲","冷凍牡蠣捲","oyster roll","frozen oyster roll","冷凍蚵捲","Bivalvia (Clam, Mussel, Oyster)"]', '加工調理食品及其他類', 'AI生成', 'Bivalvia (Clam, Mussel, Oyster)', '冷凍蚵捲');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_186', '["冷凍春捲","冰蛋餃","速凍蛋餃","frozen egg roll","icebox egg roll","冷凍蛋餃","Egg roll"]', '加工調理食品及其他類', 'AI生成', 'Egg roll', '冷凍蛋餃');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_187', '["春捲皮","餃子皮","煎餅皮","蛋卷皮","spring roll wrapper","egg roll skin","crêpe for egg rolls","冷凍蛋餅皮","Egg roll"]', '加工調理食品及其他類', 'AI生成', 'Egg roll', '冷凍蛋餅皮');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_188', '["蝦丸","冷凍蝦球","frozen shrimp balls","shrimp dumplings","冷凍蝦丸","Shrimp"]', '加工調理食品及其他類', 'AI生成', 'Shrimp', '冷凍蝦丸');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_189', '["凍蝦仁炒飯","冷凍蝦炒飯","冰鎮蝦仁炒飯","frozen shrimp fried rice","shrimp and rice dish","iced shrimp fried rice","冷凍蝦仁炒飯","Shrimp"]', '加工調理食品及其他類', 'AI生成', 'Shrimp', '冷凍蝦仁炒飯');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_190', '["蝦捲","凍蝦卷","冷蝦捲","frozen shrimp roll","shrimp spring roll","crab stick","冷凍蝦捲","Shrimp"]', '加工調理食品及其他類', 'AI生成', 'Shrimp', '冷凍蝦捲');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_191', '["蝦餃","凍蝦餃","冰蝦餃","frozen shrimp dumplings","ice shrimp dumplings","冷凍蝦餃","Shrimp"]', '加工調理食品及其他類', 'AI生成', 'Shrimp', '冷凍蝦餃');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_192', '["蝦餅","凍蝦球","冷凍蝦球","shrimp patty","frozen shrimp cake","shrimp meatball","冷凍蝦餅","Shrimp"]', '加工調理食品及其他類', 'AI生成', 'Shrimp', '冷凍蝦餅');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_193', '["蟹味棒","魚鱉棒","魚製棒","海味棒","crab stick","fish roe imitation","seafood stick","冷凍蟹味棒"]', '加工調理食品及其他類', 'AI生成', NULL, '冷凍蟹味棒');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_194', '["冷凍豆沙包","冰鎮豆餡包","frozen red bean bun","iced red bean pastry"]', '加工調理食品及其他類', 'AI生成', NULL, '冷凍豆沙包');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_195', '["凍豆腐","冰豆腐","frozen tofu","iced tofu","冷凍豆腐","Tofu"]', '加工調理食品及其他類', 'AI生成', 'Tofu', '冷凍豆腐');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_196', '["豌豆粒","凍豌豆","frozen peas","sweet peas","冷凍豌豆仁","Asian pear"]', '豆類', 'AI生成', 'Asian pear', '冷凍豌豆仁');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_197', '["凍豬肉包","冷凍包子","frozen pork bun","pork dumpling (frozen)","冷凍豬肉包子"]', '加工調理食品及其他類', 'AI生成', NULL, '冷凍豬肉包子');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_198', '["凍餃","冰水餃","冷凍水餃","frozen pork dumplings","ice water dumplings","cold storage meat dumplings","冷凍豬肉水餃"]', '加工調理食品及其他類', 'AI生成', NULL, '冷凍豬肉水餃');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_199', '["凍肉湯包","冷凍豬肉餡餅","frozen pork soup bun","pork broth dumpling","冷凍豬肉湯包"]', '加工調理食品及其他類', 'AI生成', NULL, '冷凍豬肉湯包');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_200', '["冷凍湯圓","速凍豬肉餡湯圓","frozen pork-filled tangyuan","pork dumpling balls","冷凍豬肉湯圓"]', '加工調理食品及其他類', 'AI生成', NULL, '冷凍豬肉湯圓');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_201', '["凍餃","冷凍水餃","速凍熟餛飩","frozen pork meat dumplings","ready-to-cook pork dumplings","frozen cooked pork wontons","冷凍豬肉熟水餃"]', '加工調理食品及其他類', 'AI生成', NULL, '冷凍豬肉熟水餃');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_202', '["凍豬肉蟹黃水餃","冷凍蟹黃猪肉水餠","frozen pork and crab roe dumplings","冷凍豬肉蟹黃水餃"]', '加工調理食品及其他類', 'AI生成', NULL, '冷凍豬肉蟹黃水餃');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_203', '["豬肉韭黃水餃","凍餃","韭菜猪肉水饺","frozen pork and garlic chives dumplings","garlic chive pork dumplings","冷凍豬肉韭菜水餃","Chinese chives"]', '加工調理食品及其他類', 'AI生成', 'Chinese chives', '冷凍豬肉韭菜水餃');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_204', '["冷凍餛飩","速凍水餃","冰鎮餛飩","frozen pork dumplings","dumplings with frozen pork filling","cold storage pork dumplings","冷凍豬肉餛飩"]', '加工調理食品及其他類', 'AI生成', NULL, '冷凍豬肉餛飩');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_205', '["貢丸","凍貢丸","冰凍貢丸","Gong Dumplings","Frozen Meatballs","冷凍貢丸"]', '加工調理食品及其他類', 'AI生成', NULL, '冷凍貢丸');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_206', '["冷凍酸菜紅燒肉包子","冰鎮酸菜燜肉包","frozen pickled cabbage braised pork buns","iced sour cabbage meat baozi","冷凍酸菜焢肉包子"]', '加工調理食品及其他類', 'AI生成', NULL, '冷凍酸菜焢肉包子');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_207', '["冷凍奶黃銀絲卷","冰凍奶黃捲","奶黃銀絲冰卷","frozen custard roll with egg yolk filling","egg custard frozen roll","冷凍銀絲卷(奶黃)"]', '加工調理食品及其他類', 'AI生成', NULL, '冷凍銀絲卷(奶黃)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_208', '["冷凍雞排","速凍雞塊","即食雞塊","frozen chicken nuggets","frozen chicken pieces","chicken bites","冷凍雞塊"]', '加工調理食品及其他類', 'AI生成', NULL, '冷凍雞塊');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_209', '["凍雞丸","速凍雞肉丸","frozen chicken meatballs","chicken dumplings","冷凍雞肉丸","Chicken"]', '加工調理食品及其他類', 'AI生成', 'Chicken', '冷凍雞肉丸');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_210', '["冷凍雪螺餃","frozen snow crab dumplings"]', '加工調理食品及其他類', 'AI生成', NULL, '冷凍雪螺餃');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_211', '["青花菜","西蘭花","綠花椰菜","broccoli","calabrese broccoli","Italian broccoli","冷凍青花菜","Broccoli"]', '蔬菜類', 'AI生成', 'Broccoli', '冷凍青花菜');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_212', '["凍餃","冰凍水餃","雞肉水餃","速凍水餃","frozen mushroom and chicken dumplings","mushroom and chicken potstickers (frozen)","frozen chicken and mushroom jiaozi","冷凍香菇雞肉水餃","Chicken"]', '加工調理食品及其他類', 'AI生成', 'Chicken', '冷凍香菇雞肉水餃');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_213', '["冷凍香菇水餃","冷凍鮮菇餃子","frozen mushroom dumplings","frozen shiitake dumplings","冷凍香菇餃"]', '加工調理食品及其他類', 'AI生成', NULL, '冷凍香菇餃');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_214', '["凍馬拉糕","冰糖馬拉糕","freezing marble cake","frozen marlakao","冷凍馬拉糕"]', '糕餅點心類', 'AI生成', NULL, '冷凍馬拉糕');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_215', '["凍馬蹄糕","冷凍馬蹄","馬蹄凍","tapioca pearl dessert roll","boba stick","pearl tapioca slice","冷凍馬蹄條"]', '糕餅點心類', 'AI生成', NULL, '冷凍馬蹄條');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_216', '["土豆","洋芋","馬鈴薯","薯仔","地瓜","土瓜","山藥蛋","potato","spud","tater","murphy","Irish apple","冷凍馬鈴薯條","Baked potato"]', '加工調理食品及其他類', 'AI生成', 'Baked potato', '冷凍馬鈴薯條');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_217', '["冷凍魚籽卷","冰魚卵捲","frozen fish roe roll","iced fish egg roll","冷凍魚卵卷","Alaska blackfish"]', '加工調理食品及其他類', 'AI生成', 'Alaska blackfish', '冷凍魚卵卷');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_218', '["冷凍黑鱔魚捲","冰凍鱔魚捲","frozen Alaska blackfish roll","iced Alaska pectoralis roll","冷凍魚捲","Alaska blackfish"]', '加工調理食品及其他類', 'AI生成', 'Alaska blackfish', '冷凍魚捲');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_219', '["冷凍魚餃","frozen fish dumplings","Alaska blackfish frozen treats","Alaska blackfish"]', '加工調理食品及其他類', 'AI生成', 'Alaska blackfish', '冷凍魚餃');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_220', '["魚環","炸魷魚圈","凍魷魚圈","fried calamari rings","calamari bites","frozen squid loops","冷凍魷魚圈","Squid"]', '加工調理食品及其他類', 'AI生成', 'Squid', '冷凍魷魚圈');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_221', '["凍鮪排","冷冻金枪鱼排","frozen tuna steak","tuna fillet","冷凍鮪排"]', '加工調理食品及其他類', 'AI生成', NULL, '冷凍鮪排');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_222', '["冷凍金鰹水餃","凍鮪魚水餃","frozen albacore fish dumplings","albacore tuna dumplings","冷凍鮪魚水餃","Albacore tuna"]', '加工調理食品及其他類', 'AI生成', 'Albacore tuna', '冷凍鮪魚水餃');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_223', '["鱈魚丸","凍鱈魚丸","cod meatball","frozen cod ball","冷凍鱈魚丸","Atlantic cod"]', '加工調理食品及其他類', 'AI生成', 'Atlantic cod', '冷凍鱈魚丸');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_224', '["凍麻竹筍","冷凍竹筍","冰鎮麻竹筍","frozen bamboo shoots","canned bamboo shoots","pickled bamboo shoots","冷凍麻竹筍","Bamboo shoots"]', '蔬菜類', 'AI生成', 'Bamboo shoots', '冷凍麻竹筍');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_225', '["冷藏堅果饅頭","冰鎮堅果饅頭","Chilled Nut Bun","Frosty Nut Roll"]', '加工調理食品及其他類', 'AI生成', NULL, '冷藏堅果饅頭');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_226', '["冷藏年糕","冰鎮寧波年糕","凍年糕","Chilled Ningbo Rice Cake","Frozen Ningbo New Year Cake","冷藏寧波年糕"]', '糕餅點心類', 'AI生成', NULL, '冷藏寧波年糕');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_227', '["冷藏廣式芋頭粿","冰鎮芋頭糕","冷凍芋頭粿","Cantonese Frozen Taro Pudding","Taro Cake Chilled Version","Frozen Taro Rice Cake"]', '糕餅點心類', 'AI生成', NULL, '冷藏廣式芋頭粿');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_228', '["蘿蔔糕","白蘿蔔糕","radish cake","Chinese radish cake","冷藏廣式蘿蔔糕","Black radish"]', '糕餅點心類', 'AI生成', 'Black radish', '冷藏廣式蘿蔔糕');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_229', '["冷藏甜年糕","冰鎮甜年糕","冷凍甜年糕","cold sweet rice cake","frozen sweet glutinous rice cake"]', '糕餅點心類', 'AI生成', NULL, '冷藏甜年糕');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_230', '["凱撒沙拉酱","Caesar salad dressing","Caesar dressing","凱撒沙拉醬"]', '調味料及香辛料類', 'AI生成', NULL, '凱撒沙拉醬');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_231', '["凱特芒果","馬克特芒果","Keitt mango","Markett mango","Mango"]', '水果類', 'AI生成', 'Mango', '凱特芒果');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_232', '["刀剮面","河陽燴面","山西削面","hand-cut noodles","Daoxiao Noodles","刀削麵"]', '加工調理食品及其他類', 'AI生成', NULL, '刀削麵');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_233', '["切片乾酪","片狀乾酪","芝士片","sliced cheese","cheese slices","cheese sheet"]', '乳品類', 'AI生成', NULL, '切片乾酪');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_234', '["低脂切片乾酪","減脂奶酪片","低脂乳酪片","low-fat cheese slices","reduced fat cheese","light cheese","切片乾酪(低脂)"]', '乳品類', 'AI生成', NULL, '切片乾酪(低脂)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_235', '["牛肉片","熟食牛肉片","sliced beef ham","processed beef slices","切片火腿(牛肉)","Beefalo"]', '加工調理食品及其他類', 'AI生成', 'Beefalo', '切片火腿(牛肉)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_236', '["火腿片","肉火腿","ham slice","slice of ham","切片火腿(豬肉)","Hamburger"]', '加工調理食品及其他類', 'AI生成', 'Hamburger', '切片火腿(豬肉)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_237', '["雞肉火腿","加工雞肉片","processed chicken slice","chicken ham","切片火腿(雞肉)","Chicken"]', '加工調理食品及其他類', 'AI生成', 'Chicken', '切片火腿(雞肉)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_238', '["春捲","炸春捲","spring roll","fried spring roll","初卵雞蛋","Egg roll"]', '蛋類', 'AI生成', 'Egg roll', '初卵雞蛋');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_239', '["刨絲乾酪","乳酪絲","shredded cheese","cheese threads"]', '乳品類', 'AI生成', NULL, '刨絲乾酪');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_240', '["刺龍脷","馬加鯧","spiny lobster","rock lobster","刺鯧(去皮)"]', '魚貝類', 'AI生成', NULL, '刺鯧(去皮)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_241', '["刺鯧","皮皮魚","貓仔狗","spiny lobster","rock lobster","crayfish","刺鯧(含皮)"]', '魚貝類', 'AI生成', NULL, '刺鯧(含皮)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_242', '["前鱗笛鯛","紅線笛鯛","Redline snapper","Pristipomoides multidens"]', '魚貝類', 'AI生成', NULL, '前鱗笛鯛');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_243', '["加州紅李","加州李","California Red Plum","Red Plum","California Plum","加州紅李(台灣)"]', '水果類', 'AI生成', NULL, '加州紅李(台灣)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_244', '["加州紅李","進口紅李","California Red Plum","Red Plum","加州紅李(進口)"]', '水果類', 'AI生成', NULL, '加州紅李(進口)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_245', '["加州李","蜜李","California plum","Plumcot","Flavorcot","加州蜜李(進口)"]', '水果類', 'AI生成', NULL, '加州蜜李(進口)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_246', '["加州青梅","California Green Plum","Green Mirabelle","加州青李"]', '水果類', 'AI生成', NULL, '加州青李');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_247', '["加拉蘋果","新疆蘋果","Gala Apple","Gala","Apple"]', '水果類', 'AI生成', 'Apple', '加拉蘋果');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_248', '["加糖部分脫脂煉奶","甜煉乳","sweetened partially skimmed condensed milk","partially skimmed sweetened condensed milk","加糖部份脫脂煉乳","Sugar"]', '乳品類', 'AI生成', 'Sugar', '加糖部份脫脂煉乳');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_249', '["野米","加拿大米","印度米","水燕麥","Canada rice","Indian rice","water oats","加鈣米","Annual wild rice"]', '穀物類', 'AI生成', 'Annual wild rice', '加鈣米');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_250', '["鹽汽水","加鹽汽水","salted soda","salty soda","加鹽沙士","Salt"]', '飲料類', 'AI生成', 'Salt', '加鹽沙士');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_251', '["包心白菜","捲心菜","大頭菜","cabbage","head cabbage","white cabbage"]', '蔬菜類', 'AI生成', NULL, '包心白菜');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_252', '["包心芥菜","缽心芥藍","大青菜","捲心芥","bok choi with curled leaves","wrapped heart mustard","curled pak choi"]', '蔬菜類', 'AI生成', NULL, '包心芥菜');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_253', '["紅豆麻糬","甜麻糬","紅豆餡麻糬","sweet red bean mochi","red bean stuffed mochi","包餡甜麻糬(紅豆)"]', '糕餅點心類', 'AI生成', NULL, '包餡甜麻糬(紅豆)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_254', '["蝦米","蝦仁","大蝦","長額蝦","shrimp","prawn","bay shrimp","北方長額蝦(加工)","Shrimp"]', '魚貝類', 'AI生成', 'Shrimp', '北方長額蝦(加工)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_255', '["北蕉","綠皮香蕉","green banana","plantain","immature banana","北蕉(0天,綠皮)"]', '水果類', 'AI生成', NULL, '北蕉(0天,綠皮)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_256', '["北蕉","北方香蕉","northern banana","plantain","北蕉(11月取樣)"]', '水果類', 'AI生成', NULL, '北蕉(11月取樣)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_257', '["北蕉","Northern banana","Banana","北蕉(1天)"]', '水果類', 'AI生成', NULL, '北蕉(1天)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_258', '["北蕉","北方香蕉","northern banana","bunchbanana","北蕉(2月取樣)"]', '水果類', 'AI生成', NULL, '北蕉(2月取樣)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_259', '["北蕉","北方香蕉","Northern banana","Baby banana","北蕉(3天)"]', '水果類', 'AI生成', NULL, '北蕉(3天)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_260', '["北蕉","Northern banana","Banana variety","北蕉(5月取樣)"]', '水果類', 'AI生成', NULL, '北蕉(5月取樣)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_261', '["北蕉","北方香蕉","northern banana","banana variety (7 days)","北蕉(7天)"]', '水果類', 'AI生成', NULL, '北蕉(7天)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_262', '["北蕉","北方香蕉","northern banana","September sampling banana","北蕉(9月取樣)"]', '水果類', 'AI生成', NULL, '北蕉(9月取樣)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_263', '["北蕉","北方香蕉","北部香蕉","northern banana","banana cultivar","北蕉平均值"]', '水果類', 'AI生成', NULL, '北蕉平均值');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_264', '["千寶菜","thousand treasure vegetable"]', '蔬菜類', 'AI生成', NULL, '千寶菜');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_265', '["千島醬","thousand island dressing","t-i sauce","千島沙拉醬"]', '調味料及香辛料類', 'AI生成', NULL, '千島沙拉醬');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_266', '["南瓜","南臘","冬南瓜","丹aho巴克","番薯瓜","紅南瓜","kabocha squash","Japanese pumpkin","winter squash","Danhobak","Fak Thong","Asian winter squash","南瓜平均值"]', '蔬菜類', 'AI生成', 'Japanese pumpkin', '南瓜平均值');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_267', '["南瓜籽油","winter squash seed oil","kabocha seed oil","Japanese pumpkin"]', '油脂類', 'AI生成', 'Japanese pumpkin', '南瓜籽油');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_268', '["南美刺參","South American Thorny Sea Cucumber"]', '魚貝類', 'AI生成', NULL, '南美刺參');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_269', '["南華蕉","Nan Hua Banana","Southern China Banana"]', '水果類', 'AI生成', NULL, '南華蕉');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_270', '["印度鐮齒魚","Alaska blackfish","Dallia pectoralis"]', '魚貝類', 'AI生成', 'Alaska blackfish', '印度鐮齒魚');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_271', '["速溶咖啡粉","即溶咖啡"," soluble coffee powder","速溶咖啡粒","instant coffee powder","dissolved coffee granules","coffee crystals","即溶咖啡粉","Arabica coffee"]', '飲料類', 'AI生成', 'Arabica coffee', '即溶咖啡粉');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_272', '["即食燕麥","快煮燕麥片","速溶燕麥","instant oats","ready-to-eat oatmeal","quick cooking oats","即食燕麥片"]', '穀物類', 'AI生成', NULL, '即食燕麥片');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_273', '["夏威夷豆","夏威夷果仁","Hawaii bean","Hawaiian pea nut","Pili nut","Ohia nut","原味夏威夷豆"]', '堅果及種子類', 'AI生成', NULL, '原味夏威夷豆');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_274', '["愛玉凍","阿玉","玉露冰","Agar Jelly","Aiyu Jelly","原味愛玉凍"]', '糕餅點心類', 'AI生成', NULL, '原味愛玉凍');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_275', '["松子仁","松籽","pine nuts","piñones","原味松子仁","Pine nut"]', '堅果及種子類', 'AI生成', 'Pine nut', '原味松子仁');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_276', '["榛子","扁擔果","hazelnut","cobnut","原味榛果"]', '堅果及種子類', 'AI生成', NULL, '原味榛果');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_277', '["腰果仁","檨子果","洋子果","腰果米","caju","caga juice nut","cashew apple nut","原味腰果","Cashew nut"]', '堅果及種子類', 'AI生成', 'Cashew nut', '原味腰果');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_278', '["葵花籽","向日葵籽","sunflower seeds","plain sunflower kernels","原味葵瓜子(去殼)"]', '堅果及種子類', 'AI生成', NULL, '原味葵瓜子(去殼)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_279', '["厥子"]', '蔬菜類', 'AI生成', NULL, '厥子');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_280', '["去骨雞腿肉","無骨雞腿肉","淨肉雞腿","boneless chicken thigh","skinless boneless chicken thigh","dewinged chicken thigh meat","去皮去骨雞腿(肉雞)"]', '肉類', 'AI生成', NULL, '去皮去骨雞腿(肉雞)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_281', '["去皮清肉","土雞肉","家雞肉","skinless chicken meat","free-range chicken meat","native chicken meat","去皮清肉(土雞)"]', '肉類', 'AI生成', NULL, '去皮清肉(土雞)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_282', '["去皮雞肉","清骨雞肉","淨肉雞","skinless chicken meat","boneless chicken meat","cleaned chicken meat","去皮清肉(肉雞)"]', '肉類', 'AI生成', NULL, '去皮清肉(肉雞)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_283', '["去皮清肉","clean meat","skinless meat","去皮清肉平均值"]', '肉類', 'AI生成', NULL, '去皮清肉平均值');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_284', '["去筋面粉","无筋面粉","sifted flour","gluten-free flour (note: this is not an alias for '去筋面粉', but might be confused due to similar function)","去筋麵粉"]', '穀物類', 'AI生成', NULL, '去筋麵粉');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_285', '["花生米","去皮花生","生花生仁","peanuts","monkey nuts","groundnuts","去膜花生仁(生)","Peanut"]', '堅果及種子類', 'AI生成', 'Peanut', '去膜花生仁(生)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_286', '["牛小排","去骨牛肋排","boneless short ribs","beef shortribs","short rib steak","去骨牛小排"]', '肉類', 'AI生成', NULL, '去骨牛小排');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_287', '["去骨紐約客牛排","紐約牛排","肋眼牛排（誤稱，實際上是不同部位的肉）","boneless New York strip steak","New York strip steak without bone","striploin steak (without bone)","N.Y. strip steak","去骨紐約克牛排"]', '肉類', 'AI生成', NULL, '去骨紐約克牛排');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_288', '["去骨肩頸眼羊肉","boneless shoulder neck eye mutton","Lambsquarters"]', '肉類', 'AI生成', 'Lambsquarters', '去骨肩頸眼羊肉');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_289', '["脫骨鴨掌","風爪","boneless duck feet","duck claws","去骨鴨掌"]', '肉類', 'AI生成', NULL, '去骨鴨掌');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_290', '["叉燒","燒肉","叉燒肉","叉燒猪肉","char siu pork","barbecued pork","Chinese barbecued meat"]', '加工調理食品及其他類', 'AI生成', NULL, '叉燒肉');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_291', '["可可椰子汁","可可椰子飲料","Coconut Cocoa Juice","Cocoa Coconut Drink","可可椰子汁(屏東)"]', '水果類', 'AI生成', NULL, '可可椰子汁(屏東)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_292', '["可可椰子汁","巧克力椰子水","coconut cocoa juice","coco coconut water","可可椰子汁(進口)"]', '水果類', 'AI生成', NULL, '可可椰子汁(進口)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_293', '["可可椰子汁","coco coconut juice","可可椰子汁平均值"]', '水果類', 'AI生成', NULL, '可可椰子汁平均值');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_294', '["可可粉","cocoa powder"]', '飲料類', 'AI生成', NULL, '可可粉');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_295', '["可樂","汽水","碳酸飲料","Coca-Cola","Pop","Soda","Soft drink","Cola","Chocolate"]', '飲料類', 'AI生成', 'Chocolate', '可樂');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_296', '["低熱量可樂","零卡路里可樂","diet cola","zero calorie cola","可樂(低熱量)","Chocolate"]', '飲料類', 'AI生成', 'Chocolate', '可樂(低熱量)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_297', '["可頌","凱薩克","croissant","kaiser roll"]', '糕餅點心類', 'AI生成', NULL, '可頌');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_298', '["台式泡菜","台灣泡菜","Taiwanese kimchi","Taiwan pickle"]', '加工調理食品及其他類', 'AI生成', NULL, '台式泡菜');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_299', '["台灣南瓜","丹波白","紅洋梨瓜","日本南瓜","冬南瓜","kabocha","Japanese pumpkin","winter squash","danhobak","fak thong"]', '蔬菜類', 'AI生成', 'Japanese pumpkin', '台灣南瓜');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_300', '["台灣藜","紅藜","帶殼紅藜","red quinoa from Taiwan","Taiwanese red quinoa","hulled red quinoa","台灣藜(紅)(帶殼)"]', '穀物類', 'AI生成', NULL, '台灣藜(紅)(帶殼)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_301', '["台灣蜆","海虹","Clam","Taiwan Clam"]', '魚貝類', 'AI生成', NULL, '台灣蜆');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_302', '["台灣鎖管","大鎖管","火腿筒","筆仔螺","Taiwan octopus arm","octopus tentacle","cuttlefish arm"]', '魚貝類', 'AI生成', NULL, '台灣鎖管');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_303', '["鯛魚湯","水煮鯛","Alaska blackfish soup","Dallia pectoralis broth","台灣鯛魚湯(水煮)","Alaska blackfish"]', '魚貝類', 'AI生成', 'Alaska blackfish', '台灣鯛魚湯(水煮)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_304', '["臺灣鯛魚片","黑線鯛魚片","Alaska blackfish fillet","Dallia pectoralis fillet","台灣鯛魚片(微波)","Alaska blackfish"]', '魚貝類', 'AI生成', 'Alaska blackfish', '台灣鯛魚片(微波)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_305', '["鯛魚片","黑線鱂","Alaska blackfish","Dallia pectoralis","台灣鯛魚片(水煮)"]', '魚貝類', 'AI生成', 'Alaska blackfish', '台灣鯛魚片(水煮)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_306', '["鯛魚片","黑𩾃𩾃","Alaska blackfish","Dallia pectoralis","台灣鯛魚片(油煎)"]', '魚貝類', 'AI生成', 'Alaska blackfish', '台灣鯛魚片(油煎)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_307', '["台灣鯛","黑鯛","Alaska blackfish","Dallia pectoralis","台灣鯛魚片(清蒸)"]', '魚貝類', 'AI生成', 'Alaska blackfish', '台灣鯛魚片(清蒸)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_308', '["鯛魚片","黑線鱂片","阿拉斯加黑鱼片","Alaska blackfish slices","Dallia pectoralis fillets","Black midshipman slices","台灣鯛魚片(烤,190℃,10分鐘)","Alaska blackfish"]', '魚貝類', 'AI生成', 'Alaska blackfish', '台灣鯛魚片(烤,190℃,10分鐘)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_309', '["台灣鯛魚片","黑鱈魚片","Alaska blackfish slices","Dallia pectoralis fillets","台灣鯛魚片(烤,190℃,20分鐘)","Alaska blackfish"]', '魚貝類', 'AI生成', 'Alaska blackfish', '台灣鯛魚片(烤,190℃,20分鐘)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_310', '["鯛魚片","黑鰭鯛","台灣鯛","Alaska blackfish","Dallia pectoralis","台灣鯛魚片(烤,230℃,10分鐘)"]', '魚貝類', 'AI生成', 'Alaska blackfish', '台灣鯛魚片(烤,230℃,10分鐘)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_311', '["台灣鯛魚片","Taiwan croaker fillet","Alaska blackfish fillet","Dallia pectoralis fillet","台灣鯛魚片(烤,230℃,20分鐘)","Alaska blackfish"]', '魚貝類', 'AI生成', 'Alaska blackfish', '台灣鯛魚片(烤,230℃,20分鐘)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_312', '["台灣鯛魚片","黑鮭魚片","Alaska blackfish fillet","Dallia pectoralis fillet","台灣鯛魚片(生)","Alaska blackfish"]', '魚貝類', 'AI生成', 'Alaska blackfish', '台灣鯛魚片(生)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_313', '["台灣鯛片","黑鱒魚片","Alaska blackfish slices","Dallia pectoralis fillets","台灣鯛魚片(生)(2021年)","Alaska blackfish"]', '魚貝類', 'AI生成', 'Alaska blackfish', '台灣鯛魚片(生)(2021年)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_314', '["史氏紅諧魚","Alaska blackfish","Dallia pectoralis"]', '魚貝類', 'AI生成', 'Alaska blackfish', '史氏紅諧魚');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_315', '["向陽二號","紅蘿蔔","胡萝卜","紅根菜","carrot","garden carrot","root vegetable","向陽二號胡蘿蔔","Carrot"]', '蔬菜類', 'AI生成', 'Carrot', '向陽二號胡蘿蔔');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_316', '["味增","豆酱","miso","味噌"]', '調味料及香辛料類', 'AI生成', NULL, '味噌');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_317', '["味精","味素","MSG","monosodium glutamate"]', '調味料及香辛料類', 'AI生成', NULL, '味精');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_318', '["味露","甜漿","mirin","sweet cooking rice wine","味醂"]', '調味料及香辛料類', 'AI生成', NULL, '味醂');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_319', '["和風沙拉醬","日式沙拉醬","Japanese salad dressing","Washoku salad dressing"]', '調味料及香辛料類', 'AI生成', NULL, '和風沙拉醬');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_320', '["咖哩塊","咖喱塊","curry block","curry cube"]', '調味料及香辛料類', 'AI生成', NULL, '咖哩塊');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_321', '["咖哩粉","薑黃粉","curry powder","turmeric powder"]', '調味料及香辛料類', 'AI生成', NULL, '咖哩粉');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_322', '["三合一咖啡","即溶咖啡","instant coffee","ready-made coffee","咖啡(三合一)","Arabica coffee"]', '飲料類', 'AI生成', 'Arabica coffee', '咖啡(三合一)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_323', '["咖啡凍","咖啡 Jelly","冰鎮咖啡凍","Coffee Jello","Iced Coffee Gelatin","Frozen Coffee Jelly","Arabica coffee"]', '糕餅點心類', 'AI生成', 'Arabica coffee', '咖啡凍');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_324', '["咖啡粉包","速溶咖啡包","即溶咖啡三合一","coffee mix packet","instant coffee with creamer and sugar","three-in-one coffee","咖啡沖泡包(三合一)","Arabica coffee"]', '飲料類', 'AI生成', 'Arabica coffee', '咖啡沖泡包(三合一)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_325', '["咖啡粉包","速溶咖啡包","二合一咖啡","instant coffee packet","ready-to-brew coffee bag","coffee sachet","咖啡沖泡包(二合一)","Arabica coffee"]', '飲料類', 'AI生成', 'Arabica coffee', '咖啡沖泡包(二合一)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_326', '["曼特寧咖啡豆","阿拉比卡咖啡豆","Arabica coffee bean","Mountain coffee bean","Coffee shrub of Arabia","咖啡豆(曼特寧)","Arabica coffee"]', '堅果及種子類', 'AI生成', 'Arabica coffee', '咖啡豆(曼特寧)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_327', '["仿對蝦","海蝦","shrimp","prawn","哈氏彷對蝦","Shrimp"]', '魚貝類', 'AI生成', 'Shrimp', '哈氏彷對蝦');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_328', '["啤酒","冰鎮啤酒","黑啤","白啤","麥酒","拉格","IPA","beer","lager","ale","pilsner","stout","porter","craft beer","Beer"]', '加工調理食品及其他類', 'AI生成', 'Beer', '啤酒');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_329', '["喜來菇","Hilikoi mushroom","Ganoderma applanatum variety"]', '菇類', 'AI生成', NULL, '喜來菇');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_330', '["單斑笛鯛","single-spot rock trout","rock bream"]', '魚貝類', 'AI生成', NULL, '單斑笛鯛');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_331', '["單角革單棘魨","single horn leather single spine boxfish","boxfish","單角革單棘魨(去皮)"]', '魚貝類', 'AI生成', NULL, '單角革單棘魨(去皮)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_332', '["單角革單棘魨","Single Horn Leather Spined Puffer","單角革單棘魨(含皮)"]', '魚貝類', 'AI生成', NULL, '單角革單棘魨(含皮)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_333', '["嘉寶果","Jobo fruit","Mamey sapote"]', '水果類', 'AI生成', NULL, '嘉寶果');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_334', '["嘉寶瓜","Job's Tears","Coix seed","Moses' tears"]', '水果類', 'AI生成', NULL, '嘉寶瓜');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_335', '["嘉玉甜瓜","Jiayu Sweet Melon","Sweet Crenshaw"]', '水果類', 'AI生成', NULL, '嘉玉甜瓜');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_336', '["柿子","persimmon","四周柿"]', '水果類', 'AI生成', NULL, '四周柿');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_337', '["芒果","四月熟黃","mango","mangifera indica","四季芒果","Mango"]', '水果類', 'AI生成', 'Mango', '四季芒果');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_338', '["甜柿","硬柿","Japanese Persimmon","Flat-Tasting Persimmon","Native Sweet Persimmon","國產甜柿"]', '水果類', 'AI生成', NULL, '國產甜柿');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_339', '["紅棗","大枣","乾紅棗","桂圓肉","red date","date seed","Chinese date","國產紅棗"]', '水果類', 'AI生成', NULL, '國產紅棗');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_340', '["金橘","圓金柑","round kumquat","meiwa kumquat","圓果金柑"]', '水果類', 'AI生成', NULL, '圓果金柑');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_341', '["綠皮金柑汁","圓果金柑","green peel calamondin juice","round fruit calamondin juice","圓果金柑汁(綠皮)"]', '水果類', 'AI生成', NULL, '圓果金柑汁(綠皮)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_342', '["長茄","矮瓜","秋葵","eggplant","aubergine","brinjal","guinea squash","mad apple","圓茄子","Eggplant"]', '蔬菜類', 'AI生成', 'Eggplant', '圓茄子');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_343', '["圓鱈魚卵","鮋魚卵","cod roe","haberdine roe","圓鱈魚卵(加工)","Atlantic cod"]', '加工調理食品及其他類', 'AI生成', 'Atlantic cod', '圓鱈魚卵(加工)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_344', '["圓鱈魚鰓肉","鳕鱼鳃肉","cod","codling","haberdine","Atlantic cod"]', '魚貝類', 'AI生成', 'Atlantic cod', '圓鱈魚鰓肉');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_345', '["土司","烤麵包","toast","grilled bread"]', '糕餅點心類', 'AI生成', NULL, '土司');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_346', '["土司","全穀土司","健康土司","toast with whole grain flour","whole grain bread toast","土司(含全穀粉)"]', '糕餅點心類', 'AI生成', NULL, '土司(含全穀粉)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_347', '["土番鴨","泥鰍雞","Wu Ring duck","Mud eel chicken"]', '肉類', 'AI生成', NULL, '土番鴨');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_348', '["土芒果","mango","mangifera indica","Mango"]', '水果類', 'AI生成', 'Mango', '土芒果');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_349', '["土芭樂","地瓜果","番荔枝","釋迦","sour sop","custard apple","gulfruit","prickly custard apple"]', '水果類', 'AI生成', NULL, '土芭樂');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_350', '["土雞","草雞","散養雞","野雞","free-range chicken","native chicken","village chicken"]', '肉類', 'AI生成', NULL, '土雞');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_351', '["土雞腌蛋","松花皮蛋","preserved duck egg","century egg","土雞皮蛋","Egg roll"]', '蛋類', 'AI生成', 'Egg roll', '土雞皮蛋');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_352', '["土撥鼠蛋","鄉下雞蛋","土雞蛋","Egg roll"]', '蛋類', 'AI生成', 'Egg roll', '土雞蛋');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_353', '["土種蛋","家養雞蛋","草雞蛋","free-range egg","cage-free egg","土雞蛋(2022年取樣)","Egg roll"]', '蛋類', 'AI生成', 'Egg roll', '土雞蛋(2022年取樣)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_354', '["埔里米","野生稻米","wild rice","Canada rice","Indian rice","water oats","埔里米粉","Annual wild rice"]', '加工調理食品及其他類', 'AI生成', 'Annual wild rice', '埔里米粉');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_355', '["培根肉","煙燻肉","bacon","side meat","streaky bacon","pancetta (注意：pancetta與培根類似但不完全相同，僅供參考)","培根"]', '加工調理食品及其他類', 'AI生成', NULL, '培根');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_356', '["塔菇菜","Tara Mushroom Vegetable","Organic Tara Mushroom","Mushroom Leaf","塔菇菜(有機)"]', '蔬菜類', 'AI生成', NULL, '塔菇菜(有機)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_357', '["豆皮壽司","豆腐皮壽司","tofu skin sushi","bean curd pouch sushi","壽司(豆皮壽司)"]', '加工調理食品及其他類', 'AI生成', NULL, '壽司(豆皮壽司)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_358', '["壽司海苔","紫菜片","nori sheet for sushi","seaweed sheet","壽司海苔片"]', '藻類', 'AI生成', NULL, '壽司海苔片');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_359', '["壽司醋"," sushi vinegar","米醋","日本醋","sushi vinegar","rice vinegar","Japanese vinegar","Vinegar"]', '調味料及香辛料類', 'AI生成', 'Vinegar', '壽司醋');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_360', '["紅茶","黑茶","red tea","多多綠茶(全糖)","Black tea"]', '飲料類', 'AI生成', 'Black tea', '多多綠茶(全糖)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_361', '["多鱗四指馬鮁","many-scaled four-finger threadfin","four-fingered snake mackerel"]', '魚貝類', 'AI生成', NULL, '多鱗四指馬鮁');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_362', '["多鱗沙鮻","白花魚","striped knifejaw","white croaker"]', '魚貝類', 'AI生成', NULL, '多鱗沙鮻');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_363', '["大口鯖","Bigmouth trevally","Giant kingfish","大口逆鈎鰺"]', '魚貝類', 'AI生成', NULL, '大口逆鈎鰺');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_364', '["大口鰜","馬加䲠","Great Amberjack","Greater Amberjack","大口鰜切片(含皮)"]', '魚貝類', 'AI生成', NULL, '大口鰜切片(含皮)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_365', '["大口黑鱸","black sea bass","large-mouth black seabass"]', '魚貝類', 'AI生成', NULL, '大口黑鱸');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_366', '["大心芥菜","large hearted mustard greens","bigheart mustard","bok choi with large heart (misinterpretation)"]', '蔬菜類', 'AI生成', NULL, '大心芥菜');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_367', '["大文蛤","大海螺","great ark shell","ark clam","Bivalvia (Clam, Mussel, Oyster)"]', '魚貝類', 'AI生成', 'Bivalvia (Clam, Mussel, Oyster)', '大文蛤');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_368', '["大甲鰺","馬頭鳁","Dama Whiting"]', '魚貝類', 'AI生成', NULL, '大甲鰺');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_369', '["小番茄","櫻桃番茄","洋番果","cherry tomato","tomato berry","grape tomato","大番茄平均值(紅色系)","Cherry tomato"]', '蔬菜類', 'AI生成', 'Cherry tomato', '大番茄平均值(紅色系)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_370', '["小番茄","櫻桃番茄","cherry tomato","tomato berry","grape tomato (特別指長形的)","大番茄平均值(綠色系)","Cherry tomato"]', '蔬菜類', 'AI生成', 'Cherry tomato', '大番茄平均值(綠色系)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_371', '["大目鮪","太平洋蓝鳍金枪鱼","长鳍金枪鱼","Pacific bluefin tuna","longtail tuna","northern bluefin tuna"]', '魚貝類', 'AI生成', NULL, '大目鮪');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_372', '["大眼金梭魚","Alaska blackfish","Dallia pectoralis"]', '魚貝類', 'AI生成', 'Alaska blackfish', '大眼金梭魚');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_373', '["大管鞭蝦","長尾蝦","蝦蛄","shrimp","prawn","dendrobranchiate shrimp","Shrimp"]', '魚貝類', 'AI生成', 'Shrimp', '大管鞭蝦');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_374', '["大葉芥菜","大白菜心","kaito mustard","large leaf mustard","大芥菜"]', '蔬菜類', 'AI生成', NULL, '大芥菜');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_375', '["大蒜頭","蒜頭","蒜瓣","大蔥子","葫蒜","garlic clove","clove of garlic","softneck garlic","hardneck garlic","black garlic","大蒜","Garlic"]', '蔬菜類', 'AI生成', 'Garlic', '大蒜');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_376', '["養殖鮭魚","大西洋鲑鱼","三文魚","bay salmon","black salmon","caplin-scull salmon","fiddler","grilse","grilt","kelt","landlocked salmon","ouananiche","outside salmon","parr","Sebago salmon","silver salmon","slink","smolt","spring salmon","winnish","大西洋鮭魚(台灣養殖)","Atlantic salmon"]', '魚貝類', 'AI生成', 'Atlantic salmon', '大西洋鮭魚(台灣養殖)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_377', '["三文魚（中段）","大西洋三文魚","bay salmon","black salmon","caplin-scull salmon","fiddler","grilse","grilt","kelt","landlocked salmon","ouananiche","outside salmon","parr","Sebago salmon","silver salmon","slink","smolt","spring salmon","winnish","大西洋鮭魚切片(中段)","Atlantic salmon"]', '魚貝類', 'AI生成', 'Atlantic salmon', '大西洋鮭魚切片(中段)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_378', '["大西洋三文魚尾段","北大西洋鮭尾肉","三文魚尾部","bay salmon tail slices","black salmon tail pieces","caplin-scull salmon tail cuts","grilse tail portions","kelt tail sections","outside salmon tail segments","spring salmon tail slices","大西洋鮭魚切片(尾段)","Atlantic salmon"]', '魚貝類', 'AI生成', 'Atlantic salmon', '大西洋鮭魚切片(尾段)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_379', '["大西洋三文魚","北大西洋鮭","bay salmon","black salmon","caplin-scull salmon","fiddler","grilse","grilt","kelt","landlocked salmon","ouananiche","outside salmon","parr","Sebago salmon","silver salmon","slink","smolt","spring salmon","winnish","大西洋鮭魚平均值(去皮)","Atlantic salmon"]', '魚貝類', 'AI生成', 'Atlantic salmon', '大西洋鮭魚平均值(去皮)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_380', '["大西洋三文魚","紅點鱒","bay salmon","black salmon","caplin-scull salmon","fiddler","grilse","grilt","kelt","landlocked salmon","ouananiche","outside salmon","parr","Sebago salmon","silver salmon","slink","smolt","spring salmon","winnish","大西洋鮭魚生魚片","Atlantic salmon"]', '魚貝類', 'AI生成', 'Atlantic salmon', '大西洋鮭魚生魚片');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_381', '["大西洋三文魚腹肉","紅鮭魚肚肉","鮭魚腩","bay salmon","black salmon","caplin-scull salmon","fiddler","grilse","grilt","kelt","landlocked salmon","ouananiche","outside salmon","parr","Sebago salmon","silver salmon","slink","smolt","spring salmon","winnish","大西洋鮭魚腹肉","Atlantic salmon"]', '魚貝類', 'AI生成', 'Atlantic salmon', '大西洋鮭魚腹肉');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_382', '["豆油","黃豆油","soybean oil","大豆油"]', '油脂類', 'AI生成', NULL, '大豆油');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_383', '["大豆油","強化卵磷脂大豆油","soybean oil with lecithin enrichment","fortified soybean oil","大豆油(卵磷脂強化)"]', '油脂類', 'AI生成', NULL, '大豆油(卵磷脂強化)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_384', '["強化維生素大豆油","營養增補豆油","vitamin-enriched soybean oil","fortified soy oil","大豆油(多種維生素強化)"]', '油脂類', 'AI生成', NULL, '大豆油(多種維生素強化)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_385', '["雪梨","pear","Asian pear","crisp pear","大雪梨"]', '水果類', 'AI生成', NULL, '大雪梨');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_386', '["大頭蝦","大蝦仁","肥蝦仁","jumbo shrimp","giant prawn","king prawn","大頭蝦仁","Shrimp"]', '魚貝類', 'AI生成', 'Shrimp', '大頭蝦仁');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_387', '["大餅包小餅","紅豆大包","Red Bean Pastry in a Wrapper","Bean Paste Bun Sandwich","大餅包小餅(紅豆)"]', '加工調理食品及其他類', 'AI生成', NULL, '大餅包小餅(紅豆)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_388', '["大麥粒","青稞","大麥仁"]', '穀物類', 'AI生成', NULL, '大麥仁');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_389', '["大麥粉","麥仁粉","hulled barley flour","barley grits","大麥仁粉"]', '穀物類', 'AI生成', NULL, '大麥仁粉');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_390', '["大麥","麥片","oatmeal","porridge","cereal","大麥片"]', '穀物類', 'AI生成', NULL, '大麥片');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_391', '["大黃魚","Alaska blackfish","Dallia pectoralis"]', '魚貝類', 'AI生成', 'Alaska blackfish', '大黃魚');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_392', '["天喜菇","Skyjoy Mushroom","Heaven's Delight Fungus"]', '菇類', 'AI生成', NULL, '天喜菇');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_393', '["天婦羅","炸蝦天婦羅","tempura","shrimp tempura"]', '加工調理食品及其他類', 'AI生成', NULL, '天婦羅');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_394', '["黃豆","大豆","soybean","天貝(黃豆)","Soybean oil"]', '豆類', 'AI生成', 'Soybean oil', '天貝(黃豆)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_395', '["天香洋香瓜","甜香瓜","Tianxiang Melon","Sweet Fragrant Musk Melon"]', '水果類', 'AI生成', NULL, '天香洋香瓜');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_396', '["太妃糖","奶油糖","Taffy","Toffy","Butter Toffee","Sugar"]', '糕餅點心類', 'AI生成', 'Sugar', '太妃糖');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_397', '["太空鴨","space duck","duck in space"]', '肉類', 'AI生成', NULL, '太空鴨');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_398', '["太空鴨","space duck","duck in space","太空鴨(去皮)"]', '肉類', 'AI生成', NULL, '太空鴨(去皮)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_399', '["太陽洋香瓜","tropical muskmelon","cantaloupe","winter melon (note: this is different from the winter melon in Chinese cuisine)"]', '水果類', 'AI生成', NULL, '太陽洋香瓜');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_400', '["太陽餅","Taiyang Pie"]', '糕餅點心類', 'AI生成', NULL, '太陽餅');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_401', '["夾心草莓餅乾","草莓千層餅","夾心果醬餅乾","strawberry sandwich cookie","strawberry cream biscuit","fruit-filled cookie","夾心餅乾(草莓)","Strawberry"]', '糕餅點心類', 'AI生成', 'Strawberry', '夾心餅乾(草莓)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_402', '["奇亞籽","chia seed","salvia hispanica seed","奇亞子"]', '堅果及種子類', 'AI生成', NULL, '奇亞子');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_403', '["奇异果","猕猴桃","中华猕猴桃","毛桃","狐狸桃","kiwi fruit","kiwifruit","Chinese gooseberry","melon vine fruit","奇異果","Kiwi"]', '水果類', 'AI生成', 'Kiwi', '奇異果');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_404', '["奶油","牛油","butter","cream cheese (note: this is not a correct alias for solid butter, but some might confuse it due to similar names)","奶油(固態,不加鹽)","American butterfish"]', '油脂類', 'AI生成', 'American butterfish', '奶油(固態,不加鹽)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_405', '["黃油","奶油","butter","salted butter","奶油(固態,加鹽)","American butterfish"]', '油脂類', 'AI生成', 'American butterfish', '奶油(固態,加鹽)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_406', '["黃油","butter","dairy fat","奶油(液態)","American butterfish"]', '油脂類', 'AI生成', 'American butterfish', '奶油(液態)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_407', '["奶油萵苣","Butter Lettuce","Boston Lettuce","Bibb Lettuce","奶油萵苣(日本種)","American butterfish"]', '蔬菜類', 'AI生成', 'American butterfish', '奶油萵苣(日本種)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_408', '["奶精","乳粉","milk powder","dairy whitener","non-dairy creamer","奶精粉"]', '調味料及香辛料類', 'AI生成', NULL, '奶精粉');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_409', '["奶精粉","牛奶粉","milk powder","dairy creamer powder","奶精粉(2021年)"]', '調味料及香辛料類', 'AI生成', NULL, '奶精粉(2021年)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_410', '["奶精粉","低脂奶精","milk powder substitute (low fat)","dairy whitener (reduced fat)","奶精粉(低脂)"]', '調味料及香辛料類', 'AI生成', NULL, '奶精粉(低脂)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_411', '["三合一奶茶","茶凍奶茶","珍珠奶茶","波霸奶茶","milk tea with three ingredients","bubble milk tea","pearl milk tea","boba milk tea","奶茶(三合一)","Black tea"]', '飲料類', 'AI生成', 'Black tea', '奶茶(三合一)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_412', '["奶茶包","三合一茶包","即溶奶茶包","ready-to-mix tea packet","instant milk tea mix","three-in-one tea sachet","奶茶沖泡包(三合一)","Black tea"]', '飲料類', 'AI生成', 'Black tea', '奶茶沖泡包(三合一)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_413', '["樹薯","大果樹","breadfruit","cheese fruit","奶酥麵包","Breadfruit"]', '糕餅點心類', 'AI生成', 'Breadfruit', '奶酥麵包');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_414', '["姬松茸","珊瑚松茸","edible mushroom","pine mushroom","matsutake-like mushroom"]', '菇類', 'AI生成', NULL, '姬松茸');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_415', '["姬魚","Alaska blackfish","Dallia"]', '魚貝類', 'AI生成', 'Alaska blackfish', '姬魚');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_416', '["生菜心","小萵苣","Butter lettuce","Bibb lettuce","Boston lettuce","嫩莖萵苣"]', '蔬菜類', 'AI生成', NULL, '嫩莖萵苣');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_417', '["嫩薑","小薑","童子薑","ginger","root ginger","zingiber","Ginger"]', '蔬菜類', 'AI生成', 'Ginger', '嫩薑');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_418', '["嫩豆腐","水豆腐","滑豆腐","tofu","bean curd","Tofu"]', '加工調理食品及其他類', 'AI生成', 'Tofu', '嫩豆腐');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_419', '["笛鯛","孟加拉笛鰺","bengali ribbonfish","ribbon sea bass","孟加拉笛鯛"]', '魚貝類', 'AI生成', NULL, '孟加拉笛鯛');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_420', '["孟宗筍","冬筍","春筍","bamboo shoots","bamboo sprouts","孟宗竹筍","Bamboo shoots"]', '蔬菜類', 'AI生成', 'Bamboo shoots', '孟宗竹筍');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_421', '["安石榴","臘子","pomegranate"]', '水果類', 'AI生成', NULL, '安石榴');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_422', '["宜蘭粉蔥","Yilan Powdered Onion","Taiwanese Shallot"]', '蔬菜類', 'AI生成', NULL, '宜蘭粉蔥');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_423', '["密點少棘胡椒鯛","Cubanelle","Cuban pepper","Italian frying pepper","Cubanelle pepper"]', '魚貝類', 'AI生成', 'Cubanelle pepper', '密點少棘胡椒鯛');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_424', '["富士蘋果","富士果","Fuji apple","Apple"]', '水果類', 'AI生成', 'Apple', '富士蘋果');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_425', '["富士蘋果","紅富士","富士","Fuji apple","Japanese apple","富士蘋果(帶皮)","Apple"]', '水果類', 'AI生成', 'Apple', '富士蘋果(帶皮)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_426', '["富有甜柿","大雪山甜柿","Fuyu Persimmon","Da雪山 Persimmon","富有甜柿(大雪山)"]', '水果類', 'AI生成', NULL, '富有甜柿(大雪山)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_427', '["富珍茸","Fujinzong","Rare Mushroom"]', '菇類', 'AI生成', NULL, '富珍茸');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_428', '["寒天脆藻","Kanten Seaweed Snack","Agar Jelly Crisps"]', '加工調理食品及其他類', 'AI生成', NULL, '寒天脆藻');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_429', '["寬粉條","寬粉絲","大粉條","wide bean thread","broad bean noodle","寬粉"]', '加工調理食品及其他類', 'AI生成', NULL, '寬粉');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_430', '["將軍梨","蜜將軍梨","General Honey Pear","Honey Willow-Leaf Pear","將軍蜜梨"]', '水果類', 'AI生成', NULL, '將軍蜜梨');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_431', '["油炸豆腐角","油豆腐三角","小油豆腐","fried tofu triangles","tofu puffs","deep-fried tofu","小三角油豆腐","Tofu"]', '加工調理食品及其他類', 'AI生成', 'Tofu', '小三角油豆腐');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_432', '["小卷乾","彈涂魚干","跳跳魚干","mudskipper jerky","walking fish dried","小卷干"]', '魚貝類', 'AI生成', NULL, '小卷干');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_433', '["迷你腸","小香腸","便携香肠","迷你腊肠","mini sausage","small sausage","tiny sausage","pocket sausage","小巧香腸","Sausage"]', '加工調理食品及其他類', 'AI生成', 'Sausage', '小巧香腸');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_434', '["方豆腐","小豆腐干","豆腐塊","dried tofu squares","tofu sheets","bean curd slices","小方豆干"]', '加工調理食品及其他類', 'AI生成', NULL, '小方豆干');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_435', '["小玉西瓜","特小玉西瓜","Watermelon","Seedless watermelon","Icebox watermelon"]', '水果類', 'AI生成', 'Watermelon', '小玉西瓜');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_436', '["小甜椒","青皮甜椒","bell pepper","sweet pepper","pepper","capsicum","小甜椒(青皮)"]', '蔬菜類', 'AI生成', NULL, '小甜椒(青皮)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_437', '["小番茄","櫻桃小番茄","洋蔥頭","cherry tomato","tomato berry","grape tomato (形狀較長的)","baby plum tomato","小番茄平均值(橙色系)","Cherry tomato"]', '蔬菜類', 'AI生成', 'Cherry tomato', '小番茄平均值(橙色系)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_438', '["小番茄","洋蔥果","櫻桃番茄","珍珠番茄","迷你番茄","cherry tomato","baby tomato","tomato berry","grape tomato","cocktail tomato","小番茄平均值(紅色系)","Cherry tomato"]', '蔬菜類', 'AI生成', 'Cherry tomato', '小番茄平均值(紅色系)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_439', '["小青菜","小白苗","young mustard greens","baby bok choy","tender Chinese cabbage","小白菜(土植)(10月取樣)"]', '蔬菜類', 'AI生成', NULL, '小白菜(土植)(10月取樣)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_440', '["小白菜","青江菜","Chinese cabbage","bok choy","小白菜(土植)(1月取樣)"]', '蔬菜類', 'AI生成', NULL, '小白菜(土植)(1月取樣)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_441', '["青江菜","白菜心","baby bok choy","Chinese celery","小白菜(土植)(3月取樣)"]', '蔬菜類', 'AI生成', NULL, '小白菜(土植)(3月取樣)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_442', '["小油菜","青江菜","baby bok choy","Chinese mustard spinach","小白菜(土植)(4月取樣)"]', '蔬菜類', 'AI生成', NULL, '小白菜(土植)(4月取樣)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_443', '["小青菜","小白叶","baby bok choy","young Chinese cabbage","tatsoi (though it's different, sometimes confused)","小白菜(土植)(7月取樣)"]', '蔬菜類', 'AI生成', NULL, '小白菜(土植)(7月取樣)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_444', '["青江菜","小青菜","baby bok choy","young mustard greens","小白菜(有機)(10月取樣)"]', '蔬菜類', 'AI生成', NULL, '小白菜(有機)(10月取樣)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_445', '["小青菜","油白菜","baby bok choy","Chinese celery","pe-tsai","小白菜(有機)(1月取樣)"]', '蔬菜類', 'AI生成', NULL, '小白菜(有機)(1月取樣)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_446', '["小青菜","油白菜","baby bok choy","pea pea cabbage","小白菜(有機)(4月取樣)"]', '蔬菜類', 'AI生成', NULL, '小白菜(有機)(4月取樣)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_447', '["小青菜","天津白","油白菜","baby bok choy","Chinese celery","Chinese mustard","小白菜(有機)(7月取樣)"]', '蔬菜類', 'AI生成', NULL, '小白菜(有機)(7月取樣)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_448', '["小青菜","嫩白菜","young mustard greens","Chinese flowering cabbage","小白菜(水耕)(10月取樣)"]', '蔬菜類', 'AI生成', NULL, '小白菜(水耕)(10月取樣)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_449', '["小青菜","青江菜","mustard spinach","Chinese celery","小白菜(水耕)(1月取樣)"]', '蔬菜類', 'AI生成', NULL, '小白菜(水耕)(1月取樣)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_450', '["小青菜","油白菜","baby bok choy","Chinese cabbage sprouts","小白菜(水耕)(4月取樣)"]', '蔬菜類', 'AI生成', NULL, '小白菜(水耕)(4月取樣)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_451', '["小青菜","嫩白菜","baby bok choy","young mustard greens","小白菜(水耕)(7月取樣)"]', '蔬菜類', 'AI生成', NULL, '小白菜(水耕)(7月取樣)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_452', '["小籠湯包","南翔小籠包","上海小籠包","Xiaolongbao","小籠包"]', '加工調理食品及其他類', 'AI生成', NULL, '小籠包');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_453', '["小米","粟米","稷","禾穀","millet","broomcorn millet","foxtail millet","proso millet","sorghum","Annual wild rice"]', '穀物類', 'AI生成', 'Annual wild rice', '小米');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_454', '["羊脊肉","羊腰肉","lamb loin","lamb backstrap","小羊腰脊肉"]', '肉類', 'AI生成', NULL, '小羊腰脊肉');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_455', '["小芋頭","山芋","地瓜","番薯","香薯","紅薯","potato","spud","tater","Irish potato","white potato","小芋頭(山芋)"]', '澱粉類', 'AI生成', NULL, '小芋頭(山芋)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_456', '["小茴香粉","香藺","ground fennel","fennel powder"]', '調味料及香辛料類', 'AI生成', NULL, '小茴香粉');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_457', '["小馬鈴薯","珍珠馬鈴薯","洋山芋","洋芋","土豆","馬鈴薯","薯仔","芋頭","potato","spud","tater","murphy","baked potato","jacket potato","russet potato","pearl potato","baby potato","小馬鈴薯(珍珠馬鈴薯)","Baked potato"]', '澱粉類', 'AI生成', 'Baked potato', '小馬鈴薯(珍珠馬鈴薯)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_458', '["小魚乾","鹹魚仔","小魚干","Alaska blackfish"]', '魚貝類', 'AI生成', 'Alaska blackfish', '小魚干');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_459', '["麥子","麥","麵粉的原料","wheat","corn","grain","小麥"]', '穀物類', 'AI生成', NULL, '小麥');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_460', '["小麥芽","麥芽","wheat germ","germ of wheat","小麥胚芽"]', '穀物類', 'AI生成', NULL, '小麥胚芽');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_461', '["小麥草","小麥芽","小麥苗"]', '蔬菜類', 'AI生成', NULL, '小麥苗');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_462', '["麥草粉","小麥芽粉","wheatgrass powder","young wheat grass powder","小麥草粉"]', '飲料類', 'AI生成', NULL, '小麥草粉');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_463', '["小黃魚","Alaska blackfish","Dallia pectoralis","小黃魚(去皮)"]', '魚貝類', 'AI生成', 'Alaska blackfish', '小黃魚(去皮)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_464', '["小黃魚","黃花魚","Alaska blackfish","Dallia pectoralis","blackfish","小黃魚(含皮)"]', '魚貝類', 'AI生成', 'Alaska blackfish', '小黃魚(含皮)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_465', '["尖嘴鱸","sharp-mouthed perch","尖嘴鱸(去皮)"]', '魚貝類', 'AI生成', NULL, '尖嘴鱸(去皮)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_466', '["尖嘴鱸","皮鱸","sharp-mouthed perch","scaled perch","尖嘴鱸(含皮)"]', '魚貝類', 'AI生成', NULL, '尖嘴鱸(含皮)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_467', '["尖鎖管","needlelock tube","spiny pipefish","尖鎖管 "]', '魚貝類', 'AI生成', NULL, '尖鎖管 ');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_468', '["尼羅口孵非鯽","Nile Mouth Incubated Fish","尼羅口孵非鯽(去皮)"]', '魚貝類', 'AI生成', NULL, '尼羅口孵非鯽(去皮)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_469', '["尼羅口孵非鯽","Nile Mouth Incubated Non-Carp","尼羅口孵非鯽(含皮)"]', '魚貝類', 'AI生成', NULL, '尼羅口孵非鯽(含皮)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_470', '["尼羅口孵非鯽","羅口魚","Nile Mouth Incubated Fish","Rohu Fish","尼羅口孵非鯽(含皮)(2022年取樣)"]', '魚貝類', 'AI生成', NULL, '尼羅口孵非鯽(含皮)(2022年取樣)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_471', '["大蔥","蔥","山東蔥","Shandong scallion","Scallion","Green onion","Spring onion","山東大蔥"]', '蔬菜類', 'AI生成', NULL, '山東大蔥');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_472', '["山梅","朹子","茅樅子","酸楂","Chinese Hawthorn","Hawberry","Crataegus","山楂"]', '調味料及香辛料類', 'AI生成', NULL, '山楂');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_473', '["山竹","菩提果","佛手果","gaultheria","mountain bamboo","mangosteen"]', '水果類', 'AI生成', NULL, '山竹');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_474', '["山粉圓","山粉"]', '堅果及種子類', 'AI生成', NULL, '山粉圓');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_475', '["山羊腿肉","羊肉片","前腿肉","goat front leg slices","goat leg meat","goat shoulder meat slices","山羊前腿肉片"]', '肉類', 'AI生成', NULL, '山羊前腿肉片');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_476', '["山羊肉","帶皮羊排","goat meat chunks","peeled goat meat","山羊帶皮羊肉塊","Lambsquarters"]', '肉類', 'AI生成', 'Lambsquarters', '山羊帶皮羊肉塊');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_477', '["山羊坐板肉","山羊肉片","mountain goat hindquarter slices for hotpot","goat leg meat slices for boiling","山羊後腿肉火鍋片"]', '肉類', 'AI生成', NULL, '山羊後腿肉火鍋片');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_478', '["山芹","野芹菜","Chinese celery","Asian celery","山芹菜","Celery leaves"]', '蔬菜類', 'AI生成', 'Celery leaves', '山芹菜');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_479', '["山葵粉","芥末粉","wasabi powder","Japanese horseradish powder"]', '調味料及香辛料類', 'AI生成', NULL, '山葵粉');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_480', '["山葵","山辣根","wasabi sauce","Japanese horseradish sauce","山葵醬"]', '調味料及香辛料類', 'AI生成', NULL, '山葵醬');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_481', '["淮山","土茯苓","藷薯","芋頭梗（注意這不是正確的，僅供示範，山藥和芋頭梗是不同食物）","potato","spud","tater","murphy","山藥(中國長品)"]', '澱粉類', 'AI生成', NULL, '山藥(中國長品)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_482', '["二刺","山藥豆","涼粉果","土瓜","potato tuber","Chinese yam bean","yam bean","山藥(二刺)"]', '澱粉類', 'AI生成', NULL, '山藥(二刺)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_483', '["山藥","淮山","土薯","山藥(台農1號)"]', '澱粉類', 'AI生成', NULL, '山藥(台農1號)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_484', '["山藥","台農2號","芋薯","potato","spud","tater","山藥(台農2號)"]', '澱粉類', 'AI生成', NULL, '山藥(台農2號)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_485', '["山藥","大刺","potato","spud","tater","murphy","山藥(大刺)"]', '澱粉類', 'AI生成', NULL, '山藥(大刺)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_486', '["山藥","淮山","土薯","大薯","yam","Chinese yam","cinnamon vine yam","山藥(大汕1號)"]', '澱粉類', 'AI生成', NULL, '山藥(大汕1號)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_487', '["山藥","大汕3號","地栗","土薯","potato","spud","tater","Irish potato","山藥(大汕3號)"]', '澱粉類', 'AI生成', NULL, '山藥(大汕3號)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_488', '["山藥","藺薯","芋尾","potato","spud","tater","山藥(宜蘭原生種)"]', '澱粉類', 'AI生成', NULL, '山藥(宜蘭原生種)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_489', '["山藥","地栗","土茯苓","Chinese Yam","Mountain Yam","山藥(尖石原生種)"]', '澱粉類', 'AI生成', NULL, '山藥(尖石原生種)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_490', '["淮山","涼薯","山薯","yam","山藥(白皮削)"]', '澱粉類', 'AI生成', NULL, '山藥(白皮削)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_491', '["山藥","地栗","淮山","涼薯","Chinese yam","Cordyceps polypore mycelium","山藥(白肉)"]', '澱粉類', 'AI生成', NULL, '山藥(白肉)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_492', '["花蓮山藥","山薯","涼粉草","mountain yam","Chinese yam","cinnamon vine","山藥(花蓮3號)"]', '澱粉類', 'AI生成', NULL, '山藥(花蓮3號)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_493', '["山藥","淮山","涼薯","Chinese yam","Mountain yam","Elephant yam","山藥(青森)"]', '澱粉類', 'AI生成', NULL, '山藥(青森)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_494', '["山藥","高田薯","薯蔘","淮山","yam","Chinese yam","mountain potato","山藥(高田)"]', '澱粉類', 'AI生成', NULL, '山藥(高田)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_495', '["山藥","地栗","yam","Chinese potato","山藥平均值"]', '澱粉類', 'AI生成', NULL, '山藥平均值');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_496', '["山蘇菜","劍花菜","鐵線蓮","Bracken Fern","Fiddlehead Fern","Woodwardia japonica (學名)"]', '蔬菜類', 'AI生成', NULL, '山蘇菜');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_497', '["山豬肉片","野豬肉片","mountain boar meat slice","wild boar meat slice"]', '肉類', 'AI生成', NULL, '山豬肉片');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_498', '["岩鹽","礦鹽","石鹽","rock salt","crystal salt","Salt"]', '調味料及香辛料類', 'AI生成', 'Salt', '岩鹽');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_499', '["巧克力雪糕","巧克力凍","Chocolate ice cream","Choco ice cream","Fudgy chocolate ice cream","巧克力冰淇淋"]', '糕餅點心類', 'AI生成', NULL, '巧克力冰淇淋');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_500', '["巧克力心糖","夾心巧克力糖","Chocolate sandwich candy","Choco filling sweet","Chocolate cookie with cream","巧克力夾心糖","Sugar"]', '糕餅點心類', 'AI生成', 'Sugar', '巧克力夾心糖');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_501', '["巧克力牛奶糖果","牛奶軟糖","巧克力軟糖","milk chocolate jelly candies","almond milk chocolate candy","chocolate milk soft sweets","巧克力牛奶軟糖","Almond milk"]', '糕餅點心類', 'AI生成', 'Almond milk', '巧克力牛奶軟糖');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_502', '["巧克力糖醬","巧克力調味醬","巧克力淋醬","chocolate sauce","hot fudge sauce","cocoa syrup","巧克力醬(液體)"]', '調味料及香辛料類', 'AI生成', NULL, '巧克力醬(液體)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_503', '["巨峰葡萄","紫葡萄","Jubilee grape","Kyoho grape","Common grape"]', '水果類', 'AI生成', 'Common grape', '巨峰葡萄');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_504', '["布丁粉","pudding mix","instant pudding powder"]', '糕餅點心類', 'AI生成', NULL, '布丁粉');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_505', '["布氏鯧鰺去皮","Brackish catfish skinless","Bujie Conger Skinned","布氏鯧鰺(去皮)"]', '魚貝類', 'AI生成', NULL, '布氏鯧鰺(去皮)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_506', '["布氏鯧鰺","Barracudina","Barred Lancefish","Pearleye","布氏鯧鰺(含皮)"]', '魚貝類', 'AI生成', NULL, '布氏鯧鰺(含皮)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_507', '["希氏鯛","Hispid Shanny","Shanny","希氏姬鯛"]', '魚貝類', 'AI生成', NULL, '希氏姬鯛');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_508', '["綠竹筍","熟綠竹筍","帶殼綠竹筍","bamboo shoots","green bamboo shoots","帶殼熟綠竹筍","Bamboo shoots"]', '蔬菜類', 'AI生成', 'Bamboo shoots', '帶殼熟綠竹筍');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_509', '["生蠔","蠔肉","牡蠣","海牛奶","蚵仔","oyster","rock oyster","milk of the sea","Pacific oyster","European flat oyster","帶殼真牡蠣(生蠔)","Bivalvia (Clam, Mussel, Oyster)"]', '魚貝類', 'AI生成', 'Bivalvia (Clam, Mussel, Oyster)', '帶殼真牡蠣(生蠔)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_510', '["花生米","長生果","落花生","分心豆","peanut","groundnut","goober","earthnut","帶殼花生(生)","Peanut"]', '堅果及種子類', 'AI生成', 'Peanut', '帶殼花生(生)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_511', '["龙眼干","桂圆肉","冰糖枣","dried longan","longyan fruit (dried)","dragon eye (dried)","帶殼龍眼乾","Longan"]', '水果類', 'AI生成', 'Longan', '帶殼龍眼乾');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_512', '["花生米","帶殼花生","生花生","落花生","peanut","groundnut","goober","monkey's fist","帶膜花生仁(生)(1995年之前取樣)","Peanut"]', '堅果及種子類', 'AI生成', 'Peanut', '帶膜花生仁(生)(1995年之前取樣)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_513', '["花生米","生花生","落花生","長生果","peanut","groundnut","goober","帶膜花生仁(生)(2004年取樣)","Peanut"]', '堅果及種子類', 'AI生成', 'Peanut', '帶膜花生仁(生)(2004年取樣)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_514', '["去皮帶骨胸肉","對切雞胸肉（連骨）","bone-in skinless chicken breast half","split bone-in skinless chicken breast","帶骨去皮對切胸(肉雞)"]', '肉類', 'AI生成', NULL, '帶骨去皮對切胸(肉雞)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_515', '["雞胸肉","帶骨雞胸","對切雞胸","bone-in chicken breast","split chicken breast with bone","帶骨帶皮對切胸(肉雞)"]', '肉類', 'AI生成', NULL, '帶骨帶皮對切胸(肉雞)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_516', '["牛小排","帶骨牛小排","牛肋排","beef short ribs","short ribs"]', '肉類', 'AI生成', NULL, '帶骨牛小排');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_517', '["乾貝","海扇貝","淡菜","sea scallop","dried scallop","干貝(乾)"]', '魚貝類', 'AI生成', NULL, '干貝(乾)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_518', '["干貝","乾貝","淡菜","abalone","sea ear","干貝(乾)平均值"]', '魚貝類', 'AI生成', NULL, '干貝(乾)平均值');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_519', '["干貝","淡菜","鳩巣貝","abalone","concha de abulón (Spanish)","dried scallop","干貝(冷凍)"]', '魚貝類', 'AI生成', NULL, '干貝(冷凍)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_520', '["干貝醬","乾貝醬","abalone sauce"]', '調味料及香辛料類', 'AI生成', NULL, '干貝醬');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_521', '["扁魚","薄肚","白鯛","石鯛","threadfin bream","white croaker","plinthobrama","平鯛"]', '魚貝類', 'AI生成', NULL, '平鯛');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_522', '["幸水梨","Shinshu pear","Japanese pear"]', '水果類', 'AI生成', NULL, '幸水梨');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_523', '["康氏馬加鰆","Kang's Magah Fish Slices (Skinless)","康氏馬加鰆切片(去皮)"]', '魚貝類', 'AI生成', NULL, '康氏馬加鰆切片(去皮)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_524', '["康氏馬加鰆","Kang's Mackerel Prawn Grouper Slices","Mackerel Prawn Grouper Fillets with Skin","康氏馬加鰆切片(含皮)"]', '魚貝類', 'AI生成', NULL, '康氏馬加鰆切片(含皮)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_525', '["廣島蔬菜","廣島葉菜","Hiroshima Vegetable","Hiroshima Greens","廣島野菜"]', '蔬菜類', 'AI生成', NULL, '廣島野菜');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_526', '["廣東粥","白粥","米粥","糖水粥","Guangdong Congee","Cantonese Rice Porridge","Chinese Congee","Rice Gruel"]', '加工調理食品及其他類', 'AI生成', NULL, '廣東粥');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_527', '["萵菜","生菜","大白菜心","白蒿","Chinese lettuce","celtuce","廣東萵苣"]', '蔬菜類', 'AI生成', NULL, '廣東萵苣');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_528', '["後刺尾鯛","black triggerfish","triggerfish"]', '魚貝類', 'AI生成', NULL, '後刺尾鯛');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_529', '["德國腸","德國熱狗腸","香腸","德式香腸","German sausage","Bratwurst","Würstchen","Frankfurter","德國香腸","Sausage"]', '加工調理食品及其他類', 'AI生成', 'Sausage', '德國香腸');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_530', '["葡萄","歐洲葡萄","grape","wine grape","意大利葡萄","Common grape"]', '水果類', 'AI生成', 'Common grape', '意大利葡萄');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_531', '["意大利面","意式面条","意大利面条","spaghetti","pasta","Italian noodles","意麵"]', '加工調理食品及其他類', 'AI生成', NULL, '意麵');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_532', '["愛文芒","愛文芒果","Avin mango","Evan mango","Mango"]', '水果類', 'AI生成', 'Mango', '愛文芒果');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_533', '["愛玉","益母草果","Aiyu jelly seed","Pseudostellaria root bean","愛玉子"]', '堅果及種子類', 'AI生成', NULL, '愛玉子');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_534', '["扁魚","乾扁魚","Alaska blackfish","Dallia pectoralis","扁魚干"]', '魚貝類', 'AI生成', 'Alaska blackfish', '扁魚干');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_535', '["夏威夷披薩","熱帶風味披薩","Hawaiian pizza","Ham and pineapple pizza","披薩(夏威夷)"]', '加工調理食品及其他類', 'AI生成', NULL, '披薩(夏威夷)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_536', '["抱子芥菜","小芥菜","嫩白芥菜","bok choy sprouts","baby bok choy","pea shoot mustard"]', '蔬菜類', 'AI生成', NULL, '抱子芥菜');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_537', '["抹茶粉","matcha powder","Black tea"]', '飲料類', 'AI生成', 'Black tea', '抹茶粉');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_538', '["拉面","來碗湯麵","拉麺","ramen","noodles","wonton noodles with ramen style broth","拉麵"]', '加工調理食品及其他類', 'AI生成', NULL, '拉麵');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_539', '["拿鐵咖啡無糖","無糖拿鐵","sugar-free latte","latte without sugar","拿鐵咖啡(無糖)","Arabica coffee"]', '飲料類', 'AI生成', 'Arabica coffee', '拿鐵咖啡(無糖)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_540', '["捲心酥","Juexin Su","Rolled Heart Pastry"]', '糕餅點心類', 'AI生成', NULL, '捲心酥');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_541', '["排骨醬","Pork Rib Sauce"]', '調味料及香辛料類', 'AI生成', NULL, '排骨醬');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_542', '["提拉米蘇","Tiramisu","提拉米蘇(圓形)","Annual wild rice"]', '糕餅點心類', 'AI生成', 'Annual wild rice', '提拉米蘇(圓形)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_543', '["擔仔麵","鹹圓粉","台式擔仔麵","Dan Dan Noodles","Taiwanese Dan Dan Noodles"]', '加工調理食品及其他類', 'AI生成', NULL, '擔仔麵');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_544', '["敏豆莢","sensitive soy pod","bean pod"]', '豆類', 'AI生成', NULL, '敏豆莢');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_545', '["文旦柚","柚子","胡柚","pomelo","Chinese grapefruit","shaddock","文旦"]', '水果類', 'AI生成', NULL, '文旦');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_546', '["文旦","柚子","葡萄柚","pomelo","Chinese grapefruit","shaddock","文旦(2023年取樣)"]', '水果類', 'AI生成', NULL, '文旦(2023年取樣)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_547', '["花蛤","文魧","wenshells","various venus clams","文蛤","Bivalvia (Clam, Mussel, Oyster)"]', '魚貝類', 'AI生成', 'Bivalvia (Clam, Mussel, Oyster)', '文蛤');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_548', '["斑帶石斑魚","Alaska blackfish","Dallia pectoralis"]', '魚貝類', 'AI生成', 'Alaska blackfish', '斑帶石斑魚');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_549', '["黑海參","花點斑鯰","大頭魚","spotted snakehead","snakehead fish","mugil","斑海鯰"]', '魚貝類', 'AI生成', NULL, '斑海鯰');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_550', '["斑鰭飛魚","Alaska blackfish","Dallia pectoralis"]', '魚貝類', 'AI生成', 'Alaska blackfish', '斑鰭飛魚');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_551', '["斑馬魚","花點鱧","spotted snakehead","snakehead fish","channa striata","斑鱧"]', '魚貝類', 'AI生成', NULL, '斑鱧');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_552', '["斑魚","花鱵","spotted snake mackerel","striped mackerel","斑鱵"]', '魚貝類', 'AI生成', NULL, '斑鱵');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_553', '["斑點九刺鯖","點點鱸","Spotted Needlefish Mackerel","Nine-spine Pomfret","斑點九刺鮨(去皮)"]', '魚貝類', 'AI生成', NULL, '斑點九刺鮨(去皮)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_554', '["九刺鮨","斑點鮨","nine-spine pufferfish with skin","speckled pufferfish with skin","斑點九刺鮨(含皮)"]', '魚貝類', 'AI生成', NULL, '斑點九刺鮨(含皮)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_555', '["雞籠石","雞籠鯛","Spotted seabream","Chicken coop snapper","斑點雞籠鯧"]', '魚貝類', 'AI生成', NULL, '斑點雞籠鯧');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_556', '["斯氏長鰭烏魴","Stevens' longfin black cod"]', '魚貝類', 'AI生成', NULL, '斯氏長鰭烏魴');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_557', '["新世紀梨","新世纪梨","Xin Shi Ji Pear","New Millennium Pear"]', '水果類', 'AI生成', NULL, '新世紀梨');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_558', '["哈密瓜","新疆甜瓜","Hami Melon","Xinjiang Melon","新疆哈密瓜"]', '水果類', 'AI生成', NULL, '新疆哈密瓜');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_559', '["新興梨","Xinxing Pear","New Development Pear"]', '水果類', 'AI生成', NULL, '新興梨');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_560', '["方塊酥","小四方酥","四角酥","Square Pastry","Cube Cake","Four Corners Pastry"]', '糕餅點心類', 'AI生成', NULL, '方塊酥');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_561', '["方糖","塊糖","冰糖片","sugar cube","lump sugar","Sugar"]', '糖類', 'AI生成', 'Sugar', '方糖');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_562', '["旗魚片","Alaska blackfish","Dallia pectoralis","旗魚切片"]', '魚貝類', 'AI生成', 'Alaska blackfish', '旗魚切片');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_563', '["旗魚肚","Alaska blackfish","Dallia pectoralis"]', '魚貝類', 'AI生成', 'Alaska blackfish', '旗魚肚');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_564', '["旗魚腹肉","Alaska blackfish","Dallia pectoralis"]', '魚貝類', 'AI生成', 'Alaska blackfish', '旗魚腹肉');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_565', '["旗魚鬆","Alaska blackfish","Dallia pectoralis"]', '加工調理食品及其他類', 'AI生成', 'Alaska blackfish', '旗魚鬆');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_566', '["炸豆腐皮","炸腐竹皮","油炸豆皮","fried bean curd sheets","tempura bean curd","yuba rolls","日式炸豆皮"]', '加工調理食品及其他類', 'AI生成', NULL, '日式炸豆皮');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_567', '["照燒醬","日式照燒調味汁","Japanese teriyaki sauce","Teriyaki glaze","日式照燒醬"]', '調味料及香辛料類', 'AI生成', NULL, '日式照燒醬');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_568', '["日本南瓜","日瓜","冬南瓜","Japanese pumpkin","kabocha squash","winter melon (note: this is not the true winter melon, but a similar-sounding term)"]', '蔬菜類', 'AI生成', 'Japanese pumpkin', '日本南瓜');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_569', '["對蝦","大蝦","明蝦","海蝦","jumbo shrimp","prawn","king prawn","giant shrimp","日本對蝦(大)","Shrimp"]', '魚貝類', 'AI生成', 'Shrimp', '日本對蝦(大)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_570', '["小對蝦","日本蝦","Japanese small shrimp","small shrimp","young shrimp","日本對蝦(小)","Shrimp"]', '魚貝類', 'AI生成', 'Shrimp', '日本對蝦(小)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_571', '["日本對蝦","日本海蝦","Japanese shrimp","Pacific white shrimp","日本對蝦平均值","Shrimp"]', '魚貝類', 'AI生成', 'Shrimp', '日本對蝦平均值');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_572', '["日本白菜","油菜心","Japanese rapeseed","Rapeseed","日本油菜(有機)"]', '蔬菜類', 'AI生成', NULL, '日本油菜(有機)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_573', '["日本玻璃蝦","Japanese glass shrimp","glass shrimp","Shrimp"]', '魚貝類', 'AI生成', 'Shrimp', '日本玻璃蝦');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_574', '["日本甜蔥","Japanese sweet onion","Kagayaki"]', '蔬菜類', 'AI生成', NULL, '日本甜蔥');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_575', '["竹筴魚","Alaska blackfish","Dallia pectoralis","日本竹筴魚"]', '魚貝類', 'AI生成', 'Alaska blackfish', '日本竹筴魚');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_576', '["紅目鯛","紅眼鯛","Red-eye snapper","Japanese red snapper","日本紅目大眼鯛"]', '魚貝類', 'AI生成', NULL, '日本紅目大眼鯛');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_577', '["花鱸","日本花鱈","Japanese sea bass","kasugo (幼魚)","sea bream","日本花鱸((11月)"]', '魚貝類', 'AI生成', NULL, '日本花鱸((11月)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_578', '["花鱸","日本花鱈","Japanese flower snapper","Red porgy","Tai snapper","日本花鱸((12月)"]', '魚貝類', 'AI生成', NULL, '日本花鱸((12月)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_579', '["花鱸","三月鰭","March goby","Flower Seabream","日本花鱸((3月)"]', '魚貝類', 'AI生成', NULL, '日本花鱸((3月)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_580', '["日本花鱸","花鰭","Japanese rockfish (August)","Rock seabream","Okozukuri","日本花鱸((8月)"]', '魚貝類', 'AI生成', NULL, '日本花鱸((8月)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_581', '["日本花鰺","二月鯛","Japanese Sea Bream","Red Sea Bream","Hiramata","日本花鱸(2月)"]', '魚貝類', 'AI生成', NULL, '日本花鱸(2月)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_582', '["日本花鰭","Japanese Flower Snapper","Tetsugofuri (tet-su-go-fu-ri)","日本花鱸(含皮)"]', '魚貝類', 'AI生成', NULL, '日本花鱸(含皮)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_583', '["花鱸","日光花鰭","Japanese flower snapper","Sunlight snapper","日本花鱸平均值"]', '魚貝類', 'AI生成', NULL, '日本花鱸平均值');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_584', '["日本蓬蒿","日本菊","洋茼蒿","Japanese parsley","Shungiku","日本茼蒿(有機)"]', '蔬菜類', 'AI生成', NULL, '日本茼蒿(有機)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_585', '["日本帶䲠","白帶䲠","Japanese Spanish Mackerel","Seriola quinqueradiata","日本銀帶鯡(加工)"]', '魚貝類', 'AI生成', NULL, '日本銀帶鯡(加工)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_586', '["丁香魚脯","銀帶鯡魚干","Alaska blackfish","Dallia pectoralis","日本銀帶鯡魚干(丁香魚脯)"]', '魚貝類', 'AI生成', 'Alaska blackfish', '日本銀帶鯡魚干(丁香魚脯)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_587', '["日本馬頭魚","Alaska blackfish","Dallia pectoralis"]', '魚貝類', 'AI生成', 'Alaska blackfish', '日本馬頭魚');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_588', '["日本鰻鱺魚片","黑藻魚","Alaska blackfish","Dallia pectoralis","日本鰻鱺魚片(生)"]', '魚貝類', 'AI生成', 'Alaska blackfish', '日本鰻鱺魚片(生)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_589', '["日本鰻鱺魚片","蒲燒鰻鱺","Alaska blackfish","Dallia pectoralis","日本鰻鱺魚片(蒲燒)"]', '加工調理食品及其他類', 'AI生成', 'Alaska blackfish', '日本鰻鱺魚片(蒲燒)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_590', '["日本龍蝦","海彎","Japanese spiny lobster","Japanese rock lobster","Dragon lobster","Shrimp"]', '魚貝類', 'AI生成', 'Shrimp', '日本龍蝦');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_591', '["明日菜","明天草","Tomorrow leaf","Gacca","明日葉"]', '蔬菜類', 'AI生成', NULL, '明日葉');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_592', '["明蝦仁","海蝦仁","大蝦仁","shrimp","prawn","sea shrimp","Shrimp"]', '魚貝類', 'AI生成', 'Shrimp', '明蝦仁');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_593', '["星斑","真鯧","red spotted grouper","ruby seabass","星斑真鯧"]', '魚貝類', 'AI生成', NULL, '星斑真鯧');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_594', '["星雞魚","Alaska blackfish","Dallia pectoralis"]', '魚貝類', 'AI生成', 'Alaska blackfish', '星雞魚');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_595', '["春捲皮","薄餅皮","餃子皮","spring roll wrapper","dumpling skin","Chinese pastry wrapper"]', '加工調理食品及其他類', 'AI生成', NULL, '春捲皮');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_596', '["昭和草","Showa Grass"]', '蔬菜類', 'AI生成', NULL, '昭和草');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_597', '["棗泥月餅","紅豆月餅（注意這裏通常指另一種不同內餡的月餅）","jujube paste mooncake","red bean mooncake (note that this usually refers to a different type of filling)","月餅(棗泥)"]', '糕餅點心類', 'AI生成', NULL, '月餅(棗泥)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_598', '["朝天椒","圓椒","朝天椒子","朝天紅椒","Chili pepper","Bird's eye chili","Round chili pepper","Pepperoncini (for dried varieties)","朝天椒(圓果)"]', '蔬菜類', 'AI生成', NULL, '朝天椒(圓果)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_599', '["朝天椒","朝天辣椒","指天椒","朝天紅椒","Bird's Eye Chili","Chili Pepper","Red Hot Chili","Thai Chili","朝天椒(長果)"]', '蔬菜類', 'AI生成', NULL, '朝天椒(長果)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_600', '["韓國辣椒醬","辣白菜醬","辣椒醬","Korean chili paste","Gochujang","Red pepper paste","朝鮮醬"]', '調味料及香辛料類', 'AI生成', NULL, '朝鮮醬');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_601', '["木瓜","番木瓜","番柿果","papaya","pawpaw","papaw","木瓜(11月取樣)","Papaya"]', '水果類', 'AI生成', 'Papaya', '木瓜(11月取樣)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_602', '["番木瓜","乳瓜","萵菜瓜","papaw","pawpaw","パパイヤ (Papāiya)","木瓜(2月取樣)","Papaya"]', '水果類', 'AI生成', 'Papaya', '木瓜(2月取樣)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_603', '["番木瓜","牛奶果","胖瓜","pawpaw","papaya","papaw","木瓜(5月取樣)","Papaya"]', '水果類', 'AI生成', 'Papaya', '木瓜(5月取樣)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_604', '["番木瓜","山パパイア","papaya","pawpaw","papaw","木瓜(8月取樣)","Papaya"]', '水果類', 'AI生成', 'Papaya', '木瓜(8月取樣)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_605', '["番木瓜","木瓜","papaya","pawpaw","papaw","木瓜平均值","Papaya"]', '水果類', 'AI生成', 'Papaya', '木瓜平均值');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_606', '["木瓜牛奶","番木瓜奶","papaya milk","pawpaw milkshake","papaya smoothie","Papaya"]', '乳品類', 'AI生成', 'Papaya', '木瓜牛奶');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_607', '["木茸","黑木耳","樹耳","ear mushroom","tree ear","black wood ear","木耳"]', '菇類', 'AI生成', NULL, '木耳');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_608', '["木薯粉","樹薯粉","西米","tapioca starch","cassava flour","manioc starch"]', '澱粉類', 'AI生成', NULL, '木薯粉');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_609', '["本島萵苣","土生萵苣","bok choy lettuce island variety","local grown lettuce","本島萵苣(土植)(10月取樣)"]', '蔬菜類', 'AI生成', NULL, '本島萵苣(土植)(10月取樣)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_610', '["本島萵苣","土生萵苣","bok choi lettuce","local grown lettuce","本島萵苣(土植)(1月取樣)"]', '蔬菜類', 'AI生成', NULL, '本島萵苣(土植)(1月取樣)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_611', '["本島萵苣","土生萵苣","island lettuce","locally grown lettuce","本島萵苣(土植)(3月取樣)"]', '蔬菜類', 'AI生成', NULL, '本島萵苣(土植)(3月取樣)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_612', '["本島萵苣","土植萵苣","island lettuce","本土生菜","本島萵苣(土植)(4月取樣)"]', '蔬菜類', 'AI生成', NULL, '本島萵苣(土植)(4月取樣)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_613', '["本島萵苣","土生萵苣","Island Lettuce","Native Lettuce","本島萵苣(土植)(7月取樣)"]', '蔬菜類', 'AI生成', NULL, '本島萵苣(土植)(7月取樣)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_614', '["本島萵苣","有机本岛莴苣","Island Lettuce","Organic Island Lettuce","本島萵苣(有機)(10月取樣)"]', '蔬菜類', 'AI生成', NULL, '本島萵苣(有機)(10月取樣)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_615', '["本島萵苣","綠葉萵苣","organic romaine lettuce","romaine","cos lettuce","本島萵苣(有機)(1月取樣)"]', '蔬菜類', 'AI生成', NULL, '本島萵苣(有機)(1月取樣)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_616', '["本島萵苣","綠萵苣","Island Lettuce","Organic Lettuce","本島萵苣(有機)(4月取樣)"]', '蔬菜類', 'AI生成', NULL, '本島萵苣(有機)(4月取樣)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_617', '["本島萵苣","有機生菜","小包心萵苣","Island Lettuce","Organic Lettuce","Butterhead Lettuce","本島萵苣(有機)(7月取樣)"]', '蔬菜類', 'AI生成', NULL, '本島萵苣(有機)(7月取樣)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_618', '["本島萵苣","水耕萵苣","cos lettuce","romaine lettuce","summercrisp lettuce","本島萵苣(水耕)(10月取樣)"]', '蔬菜類', 'AI生成', NULL, '本島萵苣(水耕)(10月取樣)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_619', '["本島萵苣","水耕萵苣","wombok lettuce","hothouse lettuce","hydroponic lettuce","本島萵苣(水耕)(1月取樣)"]', '蔬菜類', 'AI生成', NULL, '本島萵苣(水耕)(1月取樣)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_620', '["本島萵苣","水耕萵苣","Island Lettuce","Hydroponic Lettuce","本島萵苣(水耕)(4月取樣)"]', '蔬菜類', 'AI生成', NULL, '本島萵苣(水耕)(4月取樣)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_621', '["本島萵苣","水耕萵苣","Cultivated lettuce","Hydroponic lettuce","本島萵苣(水耕)(7月取樣)"]', '蔬菜類', 'AI生成', NULL, '本島萵苣(水耕)(7月取樣)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_622', '["李子","紅肉李","plum","red plum","purple plum","李子平均值(紅皮紅肉)"]', '水果類', 'AI生成', NULL, '李子平均值(紅皮紅肉)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_623', '["李子","紅皮李","plum","red plum","李子平均值(紅皮黃肉)"]', '水果類', 'AI生成', NULL, '李子平均值(紅皮黃肉)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_624', '["李子","青皮李","plum","green plum","李子平均值(青皮黃肉)"]', '水果類', 'AI生成', NULL, '李子平均值(青皮黃肉)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_625', '["李林蕉","Li Lin Banana","Lili Banana","李林蕉(2007年取樣)"]', '水果類', 'AI生成', NULL, '李林蕉(2007年取樣)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_626', '["李林蕉","Li Lin Banana","LL Banana","李林蕉(2012年取樣)"]', '水果類', 'AI生成', NULL, '李林蕉(2012年取樣)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_627', '["杏仁粉包","杏仁沖泡茶","almond drink mix","almond tea powder","杏仁茶沖泡包","Almond"]', '加工調理食品及其他類', 'AI生成', 'Almond', '杏仁茶沖泡包');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_628', '["杏仁膏","杏泥","almond cream","sweet almond paste","杏仁霜","Almond"]', '加工調理食品及其他類', 'AI生成', 'Almond', '杏仁霜');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_629', '["杏香菌","ginger mushroom","apricot mushroom","杏香菇"]', '菇類', 'AI生成', NULL, '杏香菇');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_630', '["平菇","雪茸菇","winter mushroom","snow puff mushroom","杏鮑菇(中)"]', '菇類', 'AI生成', NULL, '杏鮑菇(中)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_631', '["杏鮑菇","大杏鮑菇","doenjang mushroom","wangfungo mushroom","杏鮑菇(大)"]', '菇類', 'AI生成', NULL, '杏鮑菇(大)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_632', '["小杏鮑菇","迷你杏鮑菇","little tremella mushroom","baby eryngii mushroom","杏鮑菇(小)"]', '菇類', 'AI生成', NULL, '杏鮑菇(小)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_633', '["杏鮑菇","白玉菇","docheti mushroom","Pleurotus cornucopiae","winter mushroom","杏鮑菇平均值"]', '菇類', 'AI生成', NULL, '杏鮑菇平均值');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_634', '["刺尾鯛","杜氏海𬶭","Dusky triggerfish","Sargassum triggerfish","杜氏刺尾鯛"]', '魚貝類', 'AI生成', NULL, '杜氏刺尾鯛');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_635', '["杜氏鰤","黃肉鰤","Takasago Amberjack","Yellowfin Amberjack"]', '魚貝類', 'AI生成', NULL, '杜氏鰤');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_636', '["東方異腕蝦","異腕蝦","shrimp","prawn","Shrimp"]', '魚貝類', 'AI生成', 'Shrimp', '東方異腕蝦');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_637', '["松子","鬆子仁","pine seeds","pine nuts","piñones","pignoli","pistaccio","松子仁(生)","Pine nut"]', '堅果及種子類', 'AI生成', 'Pine nut', '松子仁(生)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_638', '["松茸菇","松乳菇","douglas-fir mushroom","pine mushroom","松茸"]', '菇類', 'AI生成', NULL, '松茸');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_639', '["松茸白菇","matsutake white mushroom","white matsutake"]', '菇類', 'AI生成', NULL, '松茸白菇');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_640', '["松魚","石鯛","rockfish","mussel snapper","松鯛"]', '魚貝類', 'AI生成', NULL, '松鯛');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_641', '["板腱肉","牛腱子","beef tendon meat","shin plate","板腱 "]', '肉類', 'AI生成', NULL, '板腱 ');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_642', '["枇杷果","鴉巴梨","鳶兒梨","黃金丸","loquat","Japanese plum","Japanese medlar","枇杷"]', '水果類', 'AI生成', NULL, '枇杷');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_643', '["枇杷膏","枇杷蜜","Loquat Candy","Loquat Sweets","枇杷糖","Sugar"]', '糕餅點心類', 'AI生成', 'Sugar', '枇杷糖');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_644', '["果凍"," jelly 蜂蜜柚子茶中的主要成分之一","洋菜糕","jelly","gelatin dessert","pudding (部分地區使用此詞泛指凝固狀甜點)"]', '糕餅點心類', 'AI生成', NULL, '果凍');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_645', '["果寡糖","fruit oligosaccharide","fructooligosaccharide","FOS","Sugar"]', '糖類', 'AI生成', 'Sugar', '果寡糖');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_646', '["果汁醋","果醋飲料","水果醋飲品","fruit vinegar drink","juice and vinegar beverage","fruit sour drink","果汁醋飲料(綜合)","Fruit juice"]', '飲料類', 'AI生成', 'Fruit juice', '果汁醋飲料(綜合)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_647', '["果糖","fruit sugar","levulose","Sugar"]', '糖類', 'AI生成', 'Sugar', '果糖');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_648', '["枸杞子","紅棗","goji berry","wolfberry","枸杞乾"]', '蔬菜類', 'AI生成', NULL, '枸杞乾');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_649', '["柚果醬","柚子膏","grapefruit jam","citrus marmalade","柚子果醬"]', '調味料及香辛料類', 'AI生成', NULL, '柚子果醬');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_650', '["柳松菇","松茸","oak mushroom","ramari"]', '菇類', 'AI生成', NULL, '柳松菇');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_651', '["柑橘","甜橙","臘月柑","桔子","蜜柑","tangerine","mandarin orange","clementine","柳橙","Mandarin orange (Clementine, Tangerine)"]', '水果類', 'AI生成', 'Mandarin orange (Clementine, Tangerine)', '柳橙');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_652', '["柑橘汁","橙汁","甜橙汁","蜜柑汁","tangerine juice","mandarin orange juice","Chinese orange juice","柳橙汁(100%)","Mandarin orange (Clementine, Tangerine)"]', '飲料類', 'AI生成', 'Mandarin orange (Clementine, Tangerine)', '柳橙汁(100%)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_653', '["柳橙汁飲料","柑橘汁","小橘子汁","蜜桔汁","陳皮果汁","mandarin orange juice drink","tangerine juice mix","orange soda (imitation)","sweet orange juice (reconstituted)","柳橙汁(非原汁)","Mandarin orange (Clementine, Tangerine)"]', '飲料類', 'AI生成', 'Mandarin orange (Clementine, Tangerine)', '柳橙汁(非原汁)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_654', '["柴魚片","dried bonito flakes","katsuobushi","fish flakes","Alaska blackfish"]', '魚貝類', 'AI生成', 'Alaska blackfish', '柴魚片');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_655', '["柿餅","柿乾","脆柿","persimmon cake","dried persimmon"]', '水果類', 'AI生成', NULL, '柿餅');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_656', '["栗子","板栗","毛栗","chestnut","Spanish chestnut","Chinese chestnut","Japanese chestnut","栗子(生)","Chestnut"]', '堅果及種子類', 'AI生成', 'Chestnut', '栗子(生)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_657', '["栗子肉","板栗仁","栗仁","毛栗子","chestnut seed","marron","栗子仁(生)","Chestnut"]', '堅果及種子類', 'AI生成', 'Chestnut', '栗子仁(生)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_658', '["栗子南瓜","小南瓜","日本南瓜","kabocha squash","Japanese pumpkin","winter squash","buttercup squash"]', '蔬菜類', 'AI生成', 'Japanese pumpkin', '栗子南瓜');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_659', '["胡桃油","核桃仁油","black walnut oil","walnut kernel oil","核桃油","Black walnut"]', '油脂類', 'AI生成', 'Black walnut', '核桃油');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_660', '["核棗糕","棗子糕","red date cake","jujube cake"]', '糕餅點心類', 'AI生成', NULL, '核棗糕');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_661', '["根菾菜","根菾","根菾菜根"]', '蔬菜類', 'AI生成', NULL, '根菾菜根');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_662', '["根菾菜根","potato","spud","tater","根菾菜根(2023年取樣)"]', '蔬菜類', 'AI生成', NULL, '根菾菜根(2023年取樣)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_663', '["桂竹筍","鮮筍片","筍乾片","bamboo shoots","fresh bamboo sprouts","dried bamboo slices","桂竹筍片","Bamboo shoots"]', '加工調理食品及其他類', 'AI生成', 'Bamboo shoots', '桂竹筍片');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_664', '["櫻桃小番茄","洋番茄","西洋小番茄","cherry tomato","tomato berry","grape tomato","dwarf tomato","桃太郎番茄","Cherry tomato"]', '蔬菜類', 'AI生成', 'Cherry tomato', '桃太郎番茄');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_665', '["桃接李","大桃接李","peach plum","large peach plum","桃接李(大)"]', '水果類', 'AI生成', NULL, '桃接李(大)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_666', '["桃接李","小桃接李","peach plumette (small)","little peach-plum hybrid","桃接李(小)"]', '水果類', 'AI生成', NULL, '桃接李(小)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_667', '["桑棗","桑果","黑桑葚","紅桑葚","長生果","mulberry fruit","morus berry","black mulberry","red mulberry","longevity fruit","桑葚"]', '水果類', 'AI生成', NULL, '桑葚');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_668', '["桑椹果醬","桑葚果凍","mulberry jam","mulberry jelly","桑葚果醬"]', '調味料及香辛料類', 'AI生成', NULL, '桑葚果醬');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_669', '["桑果","桑樺子","桑實","桑樺","mulberry juice","black mulberry juice","morinda juice","桑葚汁"]', '水果類', 'AI生成', NULL, '桑葚汁');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_670', '["梅乾菜","梅乾","鹹菜心","咸梅菜","梅菜","preserved plum leaves","dried preserved mustard greens","salted vegetable"]', '加工調理食品及其他類', 'AI生成', NULL, '梅乾菜');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_671', '["梅麴粉","梅粉","plum powder","ume powder","梅子粉"]', '調味料及香辛料類', 'AI生成', NULL, '梅子粉');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_672', '["條狀牛肉火腿","黑胡椒火腿牛肉","beef pepper leg ham","peppered beef ham slice","條狀火腿(牛肉,黑胡椒)","Beefalo"]', '加工調理食品及其他類', 'AI生成', 'Beefalo', '條狀火腿(牛肉,黑胡椒)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_673', '["漢堡肉排","漢堡牛肉","牛肉餅","hamburger patty","beef patty","burger meat","條狀火腿(豬肉)","Hamburger"]', '加工調理食品及其他類', 'AI生成', 'Hamburger', '條狀火腿(豬肉)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_674', '["肉乾","豬肉乾","條肉乾","風乾肉","dried meat strips","pork jerky","meat stick","preserved pork","條狀肉乾(豬肉)"]', '加工調理食品及其他類', 'AI生成', NULL, '條狀肉乾(豬肉)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_675', '["條紋狼鱸","striped wolf snapper","redmouth guapote","blackbar soldier"]', '魚貝類', 'AI生成', NULL, '條紋狼鱸');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_676', '["梨山甘藍","尖頭甘藍","梨山白菜","pear mountain cabbage","pointed head cabbage","梨山甘藍(尖球形)"]', '蔬菜類', 'AI生成', NULL, '梨山甘藍(尖球形)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_677', '["梨山梨","蜜梨","Pear from Lishan","Lishan Honey Pear","梨山蜜梨"]', '水果類', 'AI生成', NULL, '梨山蜜梨');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_678', '["雲朵糖","棉花菓子","candy cotton","floss candy","sugar cotton","cloud candy","marshmallow fluff","棉花糖","Sugar"]', '糕餅點心類', 'AI生成', 'Sugar', '棉花糖');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_679', '["棒棒腿","土雞大腿骨","雞大樁","home-style chicken leg","country chicken drumstick","farmyard chicken thigh bone","棒棒腿(土雞)"]', '肉類', 'AI生成', NULL, '棒棒腿(土雞)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_680', '["棒棒腿","雞大腿","drumstick","chicken leg","棒棒腿(肉雞)"]', '肉類', 'AI生成', NULL, '棒棒腿(肉雞)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_681', '["棒棒腿","雞小腿","drumstick","chicken leg","棒棒腿平均值"]', '肉類', 'AI生成', NULL, '棒棒腿平均值');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_682', '["棕點石斑魚","Alaska blackfish","Dallia pectoralis"]', '魚貝類', 'AI生成', 'Alaska blackfish', '棕點石斑魚');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_683', '["棺材板","死人板","coffin board"]', '加工調理食品及其他類', 'AI生成', NULL, '棺材板');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_684', '["燕麥營養奶粉","強化燕麥奶","fortified oat milk powder","nutritious oat milk formula","植物燕麥奶粉(營養強化)"]', '加工調理食品及其他類', 'AI生成', NULL, '植物燕麥奶粉(營養強化)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_685', '["椪柑","本地柑","pomelo tangerine","tangerine"]', '水果類', 'AI生成', NULL, '椪柑');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_686', '["椰子奶","椰子汁","冰椰汁","coconut milk","coconut cream","tapioca coconut juice","椰奶"]', '飲料類', 'AI生成', NULL, '椰奶');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_687', '["椰子奶油","椰油","coconut butter","tropical oil (in some contexts)","椰子油","Coconut oil"]', '油脂類', 'AI生成', 'Coconut oil', '椰子油');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_688', '["椰子粉"," coconut powder","coconut powder","coco powder","coconut dust"]', '調味料及香辛料類', 'AI生成', NULL, '椰子粉');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_689', '["椰奶","檰漿","椰子漿","coconut milk","coconut cream","coconut juice","椰漿"]', '調味料及香辛料類', 'AI生成', NULL, '椰漿');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_690', '["五角瓜","鳳梨瓜","洋蒲桃","carambola","star fruit","korangeti","belimbing buloh","楊桃(11月取樣)"]', '水果類', 'AI生成', NULL, '楊桃(11月取樣)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_691', '["五角星果","樹梅","洋桃","芒gart","草udent","三棱果","陽桃","carambola","star fruit","five corners","wax jambu","楊桃(2月取樣)"]', '水果類', 'AI生成', NULL, '楊桃(2月取樣)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_692', '["五角星果","鳳梨仔","洋桃","carambola","star fruit","five corners","楊桃(4月取樣)"]', '水果類', 'AI生成', NULL, '楊桃(4月取樣)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_693', '["五角瓜","鳳梨仔","山菍","陽桃","carambola","star fruit","wax jambu","楊桃(5月取樣)"]', '水果類', 'AI生成', NULL, '楊桃(5月取樣)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_694', '["五角星果","鳳梨仔","王字果","陽桃","carambola","star fruit","wax jambu","balimbing","楊桃(9月取樣)"]', '水果類', 'AI生成', NULL, '楊桃(9月取樣)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_695', '["五角瓜","洋桃","木瓜籐果實","鳳梨仔","carambola","star fruit","five finger fruit","楊桃平均值"]', '水果類', 'AI生成', NULL, '楊桃平均值');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_696', '["五角蔔","鳳梨果","三棱果","陽桃汁","carambola juice","star fruit drink","楊桃汁(非原汁)"]', '飲料類', 'AI生成', NULL, '楊桃汁(非原汁)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_697', '["楓樹糖","楓葉糖","maple sugar","maple candy","楓糖","Sugar"]', '糖類', 'AI生成', 'Sugar', '楓糖');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_698', '["榛果奶巧克力","杏仁奶巧克力","almond milk chocolate","almond and milk chocolate","榛果牛奶巧克力","Almond milk"]', '糕餅點心類', 'AI生成', 'Almond milk', '榛果牛奶巧克力');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_699', '["涪陵榨菜","四川榨菜","梅干菜","pickled mustard stems and leaves","preserved mustard tuber","Sichuan preserved vegetables","榨菜"]', '加工調理食品及其他類', 'AI生成', NULL, '榨菜');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_700', '["貓山王","麝香果","臭榔榆","刺球果","durian","crown fruit","king of fruits","榴槤"]', '水果類', 'AI生成', NULL, '榴槤');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_701', '["榴槤蜜","臭頭","durian honey","stink fruit syrup"]', '水果類', 'AI生成', NULL, '榴槤蜜');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_702', '["樹豆","白樹豆","象耳朵","winged bean","four-angled bean","樹豆(白)"]', '豆類', 'AI生成', NULL, '樹豆(白)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_703', '["橄欖汁","油橄榄","olive juice","oil of olives","橄欖油","Olive oil"]', '油脂類', 'AI生成', 'Olive oil', '橄欖油');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_704', '["橙番茄","紅番茄","orange tomato","tomato","橙蕃茄"]', '蔬菜類', 'AI生成', NULL, '橙蕃茄');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_705', '["橫山梨","Hengshan pear","Pear variety from Hengshan"]', '水果類', 'AI生成', NULL, '橫山梨');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_706', '["橫紋九刺鮨","striped scorpionfish","tiger stonefish"]', '魚貝類', 'AI生成', NULL, '橫紋九刺鮨');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_707', '["橫紋鸚哥魚","Alaska blackfish","Dallia pectoralis","橫紋鸚哥魚(含皮)"]', '魚貝類', 'AI生成', 'Alaska blackfish', '橫紋鸚哥魚(含皮)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_708', '["檳榔心","檳榔嫩心","檳榔菜","betel palm petiole","areca stem","palm cabbage (note: this is more commonly associated with other types of palms, but may be used in certain contexts for areca palm as well)","檳榔嫩莖"]', '蔬菜類', 'AI生成', NULL, '檳榔嫩莖');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_709', '["馬蹄芋","水蕉芋","馬鈴薯芋","檳榔心芋"]', '澱粉類', 'AI生成', NULL, '檳榔心芋');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_710', '["槟榔心芋","粉葛","Taro Stem","Water Chestnut Tuber","檳榔心芋(2021年取樣)"]', '澱粉類', 'AI生成', NULL, '檳榔心芋(2021年取樣)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_711', '["檸果","酸柑","檸檬子","limey","citron","cooling fruit","檸檬","Lemon"]', '水果類', 'AI生成', 'Lemon', '檸檬');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_712', '["檸檬愛玉","愛玉凍","lemon agar jelly","love grass with lemon","檸檬愛玉凍","Lemon"]', '糕餅點心類', 'AI生成', 'Lemon', '檸檬愛玉凍');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_713', '["檸檬乾","檸檬條","dried lemon slices","lemon fruit leather","檸檬果乾","Lemon"]', '糕餅點心類', 'AI生成', 'Lemon', '檸檬果乾');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_714', '["檸檬果","酸柑","limequat","citrange","檸檬柑","Lemon"]', '水果類', 'AI生成', 'Lemon', '檸檬柑');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_715', '["檸檬汁","青皮柠檬汁","lemon juice","green lemon juice","檸檬汁(綠皮)","Lemon"]', '水果類', 'AI生成', 'Lemon', '檸檬汁(綠皮)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_716', '["檸檬水","酸柑汁","萊姆汁","黃皮果汁","lemonade","citrus drink","sour juice","檸檬汁(非原汁)","Lemon"]', '飲料類', 'AI生成', 'Lemon', '檸檬汁(非原汁)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_717', '["檸檬水","黃皮水","lemonade","citron juice","檸檬汁(黃皮)","Lemon"]', '水果類', 'AI生成', 'Lemon', '檸檬汁(黃皮)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_718', '["檸檬水","酸水","柑橘汁","citron juice","acid juice","sour juice","檸檬汁平均值","Lemon"]', '水果類', 'AI生成', 'Lemon', '檸檬汁平均值');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_719', '["櫻桃番茄","洋番紅豆","小番茄","cherry tomato","tomato berry","grape tomato","櫻桃","Cherry tomato"]', '水果類', 'AI生成', 'Cherry tomato', '櫻桃');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_720', '["小櫻桃番茄","迷你番茄","珍珠番茄","手指番茄","cherry tomato","tomato berry","grape tomato","dwarf tomato","櫻桃小番茄","Cherry tomato"]', '蔬菜類', 'AI生成', 'Cherry tomato', '櫻桃小番茄');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_721', '["櫻桃小番茄","迷你番茄","baby tomato","dwarf tomato","櫻桃蘿蔔","Cherry tomato"]', '蔬菜類', 'AI生成', 'Cherry tomato', '櫻桃蘿蔔');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_722', '["櫻桃鴨胸肉片","Cherry Duck Breast Slices","Cherry tomato"]', '肉類', 'AI生成', 'Cherry tomato', '櫻桃鴨胸肉片');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_723', '["櫻蝦","熟櫻蝦","pink shrimp","atlantic pink shrimp","northern pink shrimp","正櫻蝦(熟)","Shrimp"]', '魚貝類', 'AI生成', 'Shrimp', '正櫻蝦(熟)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_724', '["櫻花蝦","正櫻蝦","sakura shrimp","flower shrimp","正櫻蝦(生)","Shrimp"]', '魚貝類', 'AI生成', 'Shrimp', '正櫻蝦(生)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_725', '["櫻花蝦","正櫻蝦","sakura shrimp","正櫻蝦乾","Shrimp"]', '魚貝類', 'AI生成', 'Shrimp', '正櫻蝦乾');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_726', '["鰹魚","鮇魚","bonito","skipjack tuna","正鰹"]', '魚貝類', 'AI生成', NULL, '正鰹');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_727', '["綠豆","青小豆","草脺","mung bean","moong bean","green gram","golden gram","毛綠豆","Mung bean"]', '豆類', 'AI生成', 'Mung bean', '毛綠豆');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_728', '["毛豆","青毛豆","edamame beans","green soybeans","毛豆仁"]', '豆類', 'AI生成', NULL, '毛豆仁');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_729', '["高雄13號","毛豆莢","Gaoxiong No.13 soybean pod","Green soybeans in the pod","毛豆莢(高雄13號)"]', '豆類', 'AI生成', NULL, '毛豆莢(高雄13號)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_730', '["毛鱗魚","Alaska blackfish","Dallia pectoralis"]', '魚貝類', 'AI生成', 'Alaska blackfish', '毛鱗魚');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_731', '["柳葉魚","毛鱗魚","Alaska blackfish","Dallia pectoralis","毛鱗魚(柳葉魚)(裹粉未炸)"]', '加工調理食品及其他類', 'AI生成', 'Alaska blackfish', '毛鱗魚(柳葉魚)(裹粉未炸)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_732', '["水果QQ軟糖","果味QQ軟糖","QQ果凍","Fruit QQ Jelly Candy","Gummy Fruit Candy","QQ Jelly Snack","Sugar"]', '糕餅點心類', 'AI生成', 'Sugar', '水果QQ軟糖');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_733', '["水果糖","果丹皮軟糖","果汁軟糖","fruit jelly candies","gummy fruit sweets","fruity gummies","水果軟糖","Sugar"]', '糕餅點心類', 'AI生成', 'Sugar', '水果軟糖');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_734', '["鍋貼包子","煎包","pan-fried baozi","potstickers (note: this usually refers to a similar dish but not exactly the same as shui jian bao)","水煎包"]', '加工調理食品及其他類', 'AI生成', NULL, '水煎包');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_735', '["水耕萵苣","波士頓萵生菜","Boston lettuce","Butterhead lettuce","水耕波士頓萵苣"]', '蔬菜類', 'AI生成', NULL, '水耕波士頓萵苣');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_736', '["水菜","日本水菜","Japanese water spinach","Okinawa spinach","水菜(日本種)"]', '蔬菜類', 'AI生成', NULL, '水菜(日本種)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_737', '["水蕹菜","空心菜","water morning glory","Chinese spinach","onion weed"]', '蔬菜類', 'AI生成', NULL, '水蕹菜');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_738', '["水蜜桃","仙桃","甜桃","peach","nectarine peach"]', '水果類', 'AI生成', NULL, '水蜜桃');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_739', '["水蜜桃","仙桃","peach","nectarine","水蜜桃平均值"]', '水果類', 'AI生成', NULL, '水蜜桃平均值');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_740', '["餃子皮","搟皮","水餃皮"]', '加工調理食品及其他類', 'AI生成', NULL, '水餃皮');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_741', '["汽水","可樂汽水","七喜汽水","雪碧汽水","果汁汽水","碳酸飲料","soda","soft drink","carbonated beverage","pop","tonic","汽水(綜合口味)"]', '飲料類', 'AI生成', NULL, '汽水(綜合口味)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_742', '["維他命汽水","營養汽水","礦泉水汽水","加味汽水","vitamin soda","enhanced soda","fortified soda","nutrition soda","汽水(維生素強化)"]', '飲料類', 'AI生成', NULL, '汽水(維生素強化)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_743', '["沖泡濃湯","即溶海鮮湯料","速食海鮮湯","instant seafood soup","seafood flavoring powder","ready-to-drink seafood broth","沖泡濃湯(海鮮)"]', '加工調理食品及其他類', 'AI生成', NULL, '沖泡濃湯(海鮮)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_744', '["沙琪馬","糖幹馬","shaqima","Chinese honey cake","沙其馬"]', '糕餅點心類', 'AI生成', NULL, '沙其馬');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_745', '["沙士","soda","sarsaparilla"]', '飲料類', 'AI生成', NULL, '沙士');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_746', '["低糖沙士","無糖沙士","diet soda","sugar-free soda","light soda","沙士(低糖)","Sugar"]', '飲料類', 'AI生成', 'Sugar', '沙士(低糖)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_747', '["筍塊","沙拉笋块","salad bamboo shoots","bamboo shoot chunks","沙拉筍塊"]', '蔬菜類', 'AI生成', NULL, '沙拉筍塊');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_748', '["沙拉醬","色拉醬","salad dressing","dressing","mayonnaise based salad dressing"]', '調味料及香辛料類', 'AI生成', NULL, '沙拉醬');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_749', '["沙拉醬","莎拉醬","salad dressing","dressing","沙拉醬(2021年取樣)"]', '調味料及香辛料類', 'AI生成', NULL, '沙拉醬(2021年取樣)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_750', '["沙朗牛排","西冷牛排","Sirloin Steak","sirloin steak","rump steak","round steak"]', '肉類', 'AI生成', NULL, '沙朗牛排');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_751', '["沙茶粉","sate powder","satay seasoning","Black tea"]', '調味料及香辛料類', 'AI生成', 'Black tea', '沙茶粉');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_752', '["沙茶醬","sate sauce","satay sauce","Black tea"]', '調味料及香辛料類', 'AI生成', 'Black tea', '沙茶醬');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_753', '["油炸鬼","大腸","過街老鼠","油炸条","youtiao","Chinese cruller","fried dough stick","油條"]', '加工調理食品及其他類', 'AI生成', NULL, '油條');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_754', '["土豆","洋芋","馬鈴薯","薯仔","地瓜","番薯","紅薯","potato","spud","tater","murphy","Irish potato","white potato","油炸脫水甘藷"]', '澱粉類', 'AI生成', NULL, '油炸脫水甘藷');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_755', '["炸花生米","油炸果仁","脆花生","fried peanuts","peanut brittle","roasted peanuts","油炸花生仁","Peanut"]', '加工調理食品及其他類', 'AI生成', 'Peanut', '油炸花生仁');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_756', '["紅茶","黑茶","red tea","crimson tea","black brick tea","油茶油","Black tea"]', '油脂類', 'AI生成', 'Black tea', '油茶油');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_757', '["青江菜","小油菜","mustard greens","Chinese broccoli","油菜(有機)"]', '蔬菜類', 'AI生成', NULL, '油菜(有機)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_758', '["小油菜","青江菜","Chinese flowering cabbage","Baby bok choy","油菜心"]', '蔬菜類', 'AI生成', NULL, '油菜心');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_759', '["菜籽油","青菜籽油","rapeseed oil","canola oil","油菜籽油"]', '油脂類', 'AI生成', NULL, '油菜籽油');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_760', '["油酥蔥","炸蔥片","蔥油餅碎","脆蔥酥","fried shallot crumble","shallot brittle","crispy fried onion flakes","onion crunch","油蔥酥"]', '調味料及香辛料類', 'AI生成', NULL, '油蔥酥');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_761', '["油炸豆腐","油泡豆腐","炸豆腐","豆腐泡","阿給","fried tofu puffs","tofu pockets","oily tofu with vermicelli","油豆腐粉絲(阿給)","Tofu"]', '加工調理食品及其他類', 'AI生成', 'Tofu', '油豆腐粉絲(阿給)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_762', '["油魚卵","Alaska blackfish","Dallia pectoralis","油魚卵(加工)"]', '加工調理食品及其他類', 'AI生成', 'Alaska blackfish', '油魚卵(加工)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_763', '["油麵","炸麩皮","炒麵條","oil noodles","deep-fried rice noodle rolls","油麵條"]', '加工調理食品及其他類', 'AI生成', NULL, '油麵條');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_764', '["法式奶酥醬","French cream sauce","creme patissiere sauce"]', '調味料及香辛料類', 'AI生成', NULL, '法式奶酥醬');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_765', '["法式羊排","羊排","French rack of lamb","rack of lamb","lamb chops"]', '肉類', 'AI生成', NULL, '法式羊排');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_766', '["法式蒜蓉醬","蒜香奶油醬","garlic butter sauce","French garlic sauce","法式香蒜醬"]', '調味料及香辛料類', 'AI生成', NULL, '法式香蒜醬');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_767', '["巧克力泡芙","奶油泡芙","Chocolate Éclair (mini)","Cream Pastry","泡芙(巧克力)"]', '糕餅點心類', 'AI生成', NULL, '泡芙(巧克力)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_768', '["泡乾 squid","墨魚絲","calamari","squid strip","dried squid","泡魷魚","Squid"]', '魚貝類', 'AI生成', 'Squid', '泡魷魚');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_769', '["方便面","速食麵","即溶麵條","快熟麵","instant noodles","ramen","cup noodles","泡麵(牛肉口味)","Beefalo"]', '加工調理食品及其他類', 'AI生成', 'Beefalo', '泡麵(牛肉口味)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_770', '["鮮蝦方便面","蝦味泡麵","蝦條面","即食鮮蝦面","instant shrimp noodles","shrimp-flavored instant ramen","quick shrimp soup noodle","ready-to-eat shrimp pasta","泡麵(鮮蝦口味)","Shrimp"]', '加工調理食品及其他類', 'AI生成', 'Shrimp', '泡麵(鮮蝦口味)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_771', '["波紋橫簾蛤","Ruffled file clam","波紋橫簾蛤 "]', '魚貝類', 'AI生成', NULL, '波紋橫簾蛤 ');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_772', '["泥螺","海螺肉","螺頭","sea snail","mud snail","whelk"]', '魚貝類', 'AI生成', NULL, '泥螺');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_773', '["泰勃圓鰺","圆鲹","黄stripe金线鱼","round scad","cigar mackerel","striped scad"]', '魚貝類', 'AI生成', NULL, '泰勃圓鰺');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_774', '["洋芭樂","紅芭樂","Java apple","Rose apple","Water apple","泰國芭樂"]', '水果類', 'AI生成', NULL, '泰國芭樂');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_775', '["土豆片","洋芋片","馬鈴薯片","薯仔片","potato chip","spud chip","tater chip","Murphy chip"]', '糕餅點心類', 'AI生成', NULL, '洋芋片');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_776', '["洋菇","杏鮑菇","秀珍菇","shiitake mushroom","oyster mushroom","pleurotus ostreatus"]', '菇類', 'AI生成', NULL, '洋菇');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_777', '["洋菇","洋蔥菇","罐頭蘑菇","canned mushroom","mushroom in can","jarred mushroom","洋菇罐頭"]', '加工調理食品及其他類', 'AI生成', NULL, '洋菇罐頭');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_778', '["洋葱粉","蔥粉","onion powder","洋蔥粉","Garden onion"]', '調味料及香辛料類', 'AI生成', 'Garden onion', '洋蔥粉');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_779', '["紅蔥頭醬","洋葱酱","onion jam","bulb onion sauce","洋蔥麵包醬","Garden onion"]', '調味料及香辛料類', 'AI生成', 'Garden onion', '洋蔥麵包醬');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_780', '["卡蜜拉","Camilla","Cantaloupe Camilla","洋香瓜(卡蜜拉)"]', '水果類', 'AI生成', NULL, '洋香瓜(卡蜜拉)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_781', '["新世紀洋香瓜","洋西瓜","New Century Melon","Winter Cantaloupe","洋香瓜(新世紀)"]', '水果類', 'AI生成', NULL, '洋香瓜(新世紀)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_782', '["洋香菜","European celery flakes","Celery leaf bits","洋香菜片"]', '調味料及香辛料類', 'AI生成', NULL, '洋香菜片');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_783', '["洛神乾","山菍花","山菍果","crimson rose mallow dried","roselle calyx dried","洛神花乾"]', '蔬菜類', 'AI生成', NULL, '洛神花乾');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_784', '["津輕蘋果","蜜蘋果","Aomori Sweet Apple","Japanese Sweet Apple","津輕蜜蘋果","Apple"]', '水果類', 'AI生成', 'Apple', '津輕蜜蘋果');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_785', '["海帶卷","昆布捲","海藻捲","seaweed roll","kombu roll","sea vegetable roll"]', '藻類', 'AI生成', NULL, '海帶卷');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_786', '["海苔","laver","sea mustard","海帶平均值"]', '藻類', 'AI生成', NULL, '海帶平均值');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_787', '["海帶根","海白菜梗","kelp stem","sea tangle stalk","海帶梗"]', '藻類', 'AI生成', NULL, '海帶梗');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_788', '["海帶結","帶結","海帶圈","konbu knot","kombu knot","wakame knot"]', '藻類', 'AI生成', NULL, '海帶結');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_789', '["海菜絲","海苔絲","昆布絲","kelp strips","sea belt threads","konbu strands","海帶絲"]', '藻類', 'AI生成', NULL, '海帶絲');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_790', '["海帶末","昆布茸","碎海帶","seaweed flake","kombu fluff","dried kelp shred","海帶茸"]', '藻類', 'AI生成', NULL, '海帶茸');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_791', '["海梨桶柑","seaside pear tangerine","sea pear mandarin"]', '水果類', 'AI生成', NULL, '海梨桶柑');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_792', '["海綿蛋糕","布丁蛋糕","sponge cake","pound cake","海綿蛋糕(圓形)","Egg roll"]', '糕餅點心類', 'AI生成', 'Egg roll', '海綿蛋糕(圓形)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_793', '["海苔調味醬","紫菜醬","seaweed sauce","nori paste","海苔醬"]', '調味料及香辛料類', 'AI生成', NULL, '海苔醬');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_794', '["海蜇皮","水母皮","白皮子","jellyfish skin","white jellyfish"]', '魚貝類', 'AI生成', NULL, '海蜇皮');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_795', '["芒果","望果","mango","mangos","apple of the tropics","海頓芒果","Mango"]', '水果類', 'AI生成', 'Mango', '海頓芒果');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_796', '["海鮮調味醬","海產醬","seafood sauce","fish sauce (注意：魚露常與海鮮醬混淆，但兩者不同)","海鮮醬"]', '調味料及香辛料類', 'AI生成', NULL, '海鮮醬');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_797', '["海蝦仁","鱸蝦仁","sea perch shrimp","marine bass shrimp","海鱸蝦仁","Shrimp"]', '魚貝類', 'AI生成', 'Shrimp', '海鱸蝦仁');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_798', '["海鳁鱼","鳁鰭","鳁鱼","sea mackerel","mackerel scad","海鱺"]', '魚貝類', 'AI生成', NULL, '海鱺');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_799', '["海鱺魚片","Alaska blackfish","Dallia pectoralis"]', '魚貝類', 'AI生成', 'Alaska blackfish', '海鱺魚片');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_800', '["奶精","奶粉水","non-dairy creamer","powdered milk liquid","液體奶精"]', '調味料及香辛料類', 'AI生成', NULL, '液體奶精');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_801', '["奶精","植脂末","人造奶精","non-dairy creamer","powdered cream substitute","artificial milk powder","液體奶精(2021年)"]', '調味料及香辛料類', 'AI生成', NULL, '液體奶精(2021年)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_802', '["淡奶","脫脂煉乳","skim milk powder","evaporated skim milk","淡煉乳"]', '乳品類', 'AI生成', NULL, '淡煉乳');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_803', '["生抽","淡色酱油","light soy sauce","thin soy sauce","淡色醬油","Soy sauce"]', '調味料及香辛料類', 'AI生成', 'Soy sauce', '淡色醬油');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_804', '["淮山","山藥","地栗","土薯","Chinese yam","Mountain yam","Nagaimo (Japanese)","Huaishan"]', '澱粉類', 'AI生成', NULL, '淮山');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_805', '["深海鱗角魚","Alaska blackfish","Dallia pectoralis"]', '魚貝類', 'AI生成', 'Alaska blackfish', '深海鱗角魚');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_806', '["清腿","土雞肉","家養雞","native chicken thigh","village chicken leg","清腿(土雞)"]', '肉類', 'AI生成', NULL, '清腿(土雞)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_807', '["雞腿肉","雞腿","chicken thigh meat","thigh meat","清腿(肉雞)"]', '肉類', 'AI生成', NULL, '清腿(肉雞)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_808', '["清腿","lean pork","skinless pork leg","清腿平均值"]', '肉類', 'AI生成', NULL, '清腿平均值');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_809', '["蝦仁肉丸","蝦餃","shrimp meatball","shrimmy dumpling","清蒸蝦仁肉圓","Shrimp"]', '加工調理食品及其他類', 'AI生成', 'Shrimp', '清蒸蝦仁肉圓');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_810', '["溫州餛飩","温州汤圆","温州馄饨","Wenzhou Wontons","Chinese Dumplings"]', '加工調理食品及其他類', 'AI生成', NULL, '溫州餛飩');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_811', '["溫泉蛋","boiled egg","soft-boiled egg","poached egg","Egg roll"]', '蛋類', 'AI生成', 'Egg roll', '溫泉蛋');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_812', '["滑菇","光皮菇","slippery mushroom","smooth cap mushroom"]', '菇類', 'AI生成', NULL, '滑菇');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_813', '["滷牛筋","牛蹄筋","牛腳筋","beef tendons in sauce","braised beef tendons","boiled beef tendons"]', '加工調理食品及其他類', 'AI生成', NULL, '滷牛筋');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_814', '["春捲","煎卷","spring roll","Chinese finger roll","滷蛋平均值","Egg roll"]', '蛋類', 'AI生成', 'Egg roll', '滷蛋平均值');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_815', '["春捲","煎餃","spring roll","Chinese spring roll","fried roll","滷蛋白平均值","Egg roll"]', '蛋類', 'AI生成', 'Egg roll', '滷蛋白平均值');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_816', '["煎蛋卷","炸蛋捲","spring roll variant","fried egg roll","滷蛋黃平均值","Egg roll"]', '蛋類', 'AI生成', 'Egg roll', '滷蛋黃平均值');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_817', '["滷豬腳","滷豬肘","豬腳滷","豬蹄","豬手","braised pig's feet","pork trotters","pig's trotters","pigs' feet"]', '加工調理食品及其他類', 'AI生成', NULL, '滷豬腳');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_818', '["漢堡","漢堡排","hamburger","burger","漢堡包"]', '糕餅點心類', 'AI生成', NULL, '漢堡包');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_819', '["澳洲甜橙","進口甜橙","Australian sweet orange","Sweet navel orange (imported)","澳洲甜橙(進口)"]', '水果類', 'AI生成', NULL, '澳洲甜橙(進口)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_820', '["澳洲綠筍","澳洲蘆筍","Australian green asparagus","Green asparagus","澳洲綠蘆筍(粗短型)"]', '蔬菜類', 'AI生成', NULL, '澳洲綠蘆筍(粗短型)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_821', '["澳洲 carrots","長型 carrots","Australian carrots","long carrots","澳洲胡蘿蔔(細長型)","Carrot"]', '蔬菜類', 'AI生成', 'Carrot', '澳洲胡蘿蔔(細長型)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_822', '["加拿大米","印度米","水燕麥","Canada rice","Indian rice","water oats","濁水米粉","Annual wild rice"]', '加工調理食品及其他類', 'AI生成', 'Annual wild rice', '濁水米粉');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_823', '["火炭母","火炭仔","地菍","火炭母草"]', '蔬菜類', 'AI生成', NULL, '火炭母草');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_824', '["火腿蛋三明治","漢堡","hamburger","burger","cheeseburger with ham and egg","Hamburger"]', '加工調理食品及其他類', 'AI生成', 'Hamburger', '火腿蛋三明治');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_825', '["火雞肉","鵜鶘肉","turkey meat","holiday turkey","Christmas turkey","Chicken"]', '肉類', 'AI生成', 'Chicken', '火雞肉');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_826', '["黃泥螺","黑海鰻","mud eel","gray moray","灰海鰻"]', '魚貝類', 'AI生成', NULL, '灰海鰻');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_827', '["炒板條","炒寬粉","stir-fried flat noodles","stir-fried rice stick noodles"]', '加工調理食品及其他類', 'AI生成', NULL, '炒板條');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_828', '["炒蛋","煎蛋卷","omelette","fried egg roll","炒蛋(加油3大匙)","Egg roll"]', '蛋類', 'AI生成', 'Egg roll', '炒蛋(加油3大匙)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_829', '["炸排粉","fried fermented rice powder","rice cake flour"]', '調味料及香辛料類', 'AI生成', NULL, '炸排粉');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_830', '["炸醬"]', '調味料及香辛料類', 'AI生成', NULL, '炸醬');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_831', '["炸雞粉","Chicken Powder","Fried Chicken Seasoning"]', '調味料及香辛料類', 'AI生成', NULL, '炸雞粉');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_832', '["黑梅汁","烏梅飲料","陳皮梅汁","酸梅汁","black plum juice","ume syrup","prunus juice","plum concentrate","烏梅汁"]', '飲料類', 'AI生成', NULL, '烏梅汁');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_833', '["烏殼綠竹筍","烏殼筍","綠皮竹筍","bamboo shoots","green bamboo sprouts","fresh bamboo shoots","Bamboo shoots"]', '蔬菜類', 'AI生成', 'Bamboo shoots', '烏殼綠竹筍');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_834', '["烏賊精囊","墨魚精囊","cuttlefish ink sac","squid ink gland"]', '魚貝類', 'AI生成', NULL, '烏賊精囊');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_835', '["烏醋","黑醋","老醋","black vinegar","dark vinegar","aged vinegar","Vinegar"]', '調味料及香辛料類', 'AI生成', 'Vinegar', '烏醋');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_836', '["烏雞","黑羽雞","藥雞","medicated chicken","black-boned chicken","烏骨雞"]', '肉類', 'AI生成', NULL, '烏骨雞');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_837', '["烏雞蛋","黑骨雞蛋","black-boned chicken egg","烏骨雞蛋","Egg roll"]', '蛋類', 'AI生成', 'Egg roll', '烏骨雞蛋');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_838', '["烏雞蛋白","egg roll protein","烏骨雞蛋白","Egg roll"]', '蛋類', 'AI生成', 'Egg roll', '烏骨雞蛋白');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_839', '["烏雞蛋黃","black-boned chicken yolk","烏骨雞蛋黃","Egg roll"]', '蛋類', 'AI生成', 'Egg roll', '烏骨雞蛋黃');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_840', '["烏𩾃","油魾","黑鯧","墨鱂","black pomfret","oil pomfret","烏鯧"]', '魚貝類', 'AI生成', NULL, '烏鯧');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_841', '["烏龍奶茶","烏龍茶加奶","oolong milk tea","black milk tea (with oolong)","烏龍奶茶(去冰,全糖)","Black tea"]', '飲料類', 'AI生成', 'Black tea', '烏龍奶茶(去冰,全糖)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_842', '["烏龍奶茶","冰紅茶","半糖烏龍奶茶","oolong milk tea","black oolong milk tea with less ice and half sugar","half-sweetened iced oolong milk tea","烏龍奶茶(去冰,半糖)","Black tea"]', '飲料類', 'AI生成', 'Black tea', '烏龍奶茶(去冰,半糖)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_843', '["烏龍奶茶","珍珠奶茶","波霸奶茶","茶凍奶茶","Oolong Milk Tea","Pearl Milk Tea","Bubble Milk Tea","Taiwan Milk Tea","烏龍奶茶(去冰,微糖)","Black tea"]', '飲料類', 'AI生成', 'Black tea', '烏龍奶茶(去冰,微糖)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_844', '["紅茶","黑茶（注意：在某些地區這可能指普洱茶）","red tea (in China)","black brick tea","烏龍茶","Black tea"]', '飲料類', 'AI生成', 'Black tea', '烏龍茶');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_845', '["烏龍茶","去冰全糖烏龍茶","oolong tea","black oolong tea","iced oolong with full sugar","烏龍茶(去冰,全糖)","Black tea"]', '飲料類', 'AI生成', 'Black tea', '烏龍茶(去冰,全糖)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_846', '["烏龍茶","半糖烏龍茶","去冰烏龍茶","oolong tea with less ice and half sugar","half sweet oolong tea without much ice","烏龍茶(去冰,半糖)","Black tea"]', '飲料類', 'AI生成', 'Black tea', '烏龍茶(去冰,半糖)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_847', '["烏龍茶","凍頂烏龍","去冰微糖烏龍茶","oolong tea","black oolong tea","iced oolong with less sugar","烏龍茶(去冰,微糖)","Black tea"]', '飲料類', 'AI生成', 'Black tea', '烏龍茶(去冰,微糖)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_848', '["烏龍茶湯","紅茶","black tea","烏龍茶茶湯","Black tea"]', '飲料類', 'AI生成', 'Black tea', '烏龍茶茶湯');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_849', '["烘乾黑豆","焙烤黑豆","roasted black beans","baked black soybeans","烘烤黑豆"]', '豆類', 'AI生成', NULL, '烘烤黑豆');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_850', '["烤布丁","baked pudding","grilled pudding"]', '糕餅點心類', 'AI生成', NULL, '烤布丁');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_851', '["烤肉汁","燒肉醬","barbecue sauce","BBQ sauce","烤肉醬"]', '調味料及香辛料類', 'AI生成', NULL, '烤肉醬');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_852', '["酥油烤","烤酥","roasted butter oil","baked ghee","烤酥油"]', '油脂類', 'AI生成', NULL, '烤酥油');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_853', '["燒雞","炭烤雞","焗雞","roast chicken","grilled chicken","barbecued chicken","烤雞"]', '加工調理食品及其他類', 'AI生成', NULL, '烤雞');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_854', '["無籽葡萄","紅葡萄","皮葡萄","seedless grape","red seedless grape","無子紅葡萄(含皮)","Common grape"]', '水果類', 'AI生成', 'Common grape', '無子紅葡萄(含皮)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_855', '["無子蓮霧","無籽蓮霧","seedless loquat","loquat","無子芭樂"]', '水果類', 'AI生成', NULL, '無子芭樂');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_856', '["無斑圓鰺","白肚鯖","Blackstripe fusilier","Whitespot fusilier"]', '魚貝類', 'AI生成', NULL, '無斑圓鰺');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_857', '["無子西瓜","冰糖心瓜","seedless watermelon","icebox melon (smaller varieties)","personal melon","無籽西瓜","Watermelon"]', '水果類', 'AI生成', 'Watermelon', '無籽西瓜');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_858', '["無糖咖啡","黑咖啡飲料","零糖咖啡飲品","sugar-free coffee drink","caffeinated coffee beverage","no sugar added coffee liquid","無糖咖啡飲料","Arabica coffee"]', '飲料類', 'AI生成', 'Arabica coffee', '無糖咖啡飲料');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_859', '["黑芝麻醬","無糖芝麻醬","sugar-free black sesame paste","black sesame spread","無糖黑芝麻醬","Sesame"]', '調味料及香辛料類', 'AI生成', 'Sesame', '無糖黑芝麻醬');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_860', '["代無花果","天生果","癡呆果","文冠果","蘆薈果","Fig","Edible Fig","Common Fig","無花果"]', '水果類', 'AI生成', NULL, '無花果');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_861', '["無花果乾","無花果條","dried fig","fig strip"]', '水果類', 'AI生成', NULL, '無花果乾');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_862', '["無蛋沙拉醬","mayonnaise without eggs","vegan mayonnaise","Egg roll"]', '調味料及香辛料類', 'AI生成', 'Egg roll', '無蛋沙拉醬');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_863', '["春捲餡料","炸捲餡料","蛋卷餡料","spring roll filling","egg roll filling","無蛋沙拉醬(2021年取樣)","Egg roll"]', '調味料及香辛料類', 'AI生成', 'Egg roll', '無蛋沙拉醬(2021年取樣)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_864', '["美牛小排","去骨牛小排","無骨牛肋排","boneless beef short ribs","short rib steak","sliced beef short ribs","無骨牛小排(美牛)"]', '肉類', 'AI生成', NULL, '無骨牛小排(美牛)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_865', '["生煎蛋","炒蛋（不加油）","fried egg without oil","scrambled egg dry style","煎蛋(不加油)","Egg roll"]', '蛋類', 'AI生成', 'Egg roll', '煎蛋(不加油)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_866', '["煎餅","薄脆","鍋盔","大餅","pancake","crepe","flatbread"]', '糕餅點心類', 'AI生成', NULL, '煎餅');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_867', '["煙臺白菜","Yantai Cabbage","Chinese Cabbage","Bok Choy (Note: This is a close variant, Yantai cabbage might not be specifically named in English)","煙台白菜"]', '蔬菜類', 'AI生成', NULL, '煙台白菜');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_868', '["熟桂竹筍","桂花竹筍","冬筍","冬筍干","bamboo shoots","fresh bamboo shoots","canned bamboo shoots","dried bamboo shoots","Bamboo shoots"]', '蔬菜類', 'AI生成', 'Bamboo shoots', '熟桂竹筍');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_869', '["高麗菜水餃","白菜水餃","Chinese cabbage dumplings","熟水餃(高麗菜水餃)","Black cabbage"]', '加工調理食品及其他類', 'AI生成', 'Black cabbage', '熟水餃(高麗菜水餃)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_870', '["茶油","熟茶油","black tea oil","brewed tea oil","熟油茶油","Black tea"]', '油脂類', 'AI生成', 'Black tea', '熟油茶油');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_871', '["熟竹筍","煮熟的箭竹筍","cooked bamboo shoots","bamboo sprouts","熟箭竹筍","Bamboo shoots"]', '蔬菜類', 'AI生成', 'Bamboo shoots', '熟箭竹筍');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_872', '["乾紫菜","熟干紫菜","seaweed sheets","nori sheets","熟紫菜"]', '藻類', 'AI生成', NULL, '熟紫菜');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_873', '["熟蓮藕","蓮藕煮","cooked lotus root","boiled lotus root"]', '澱粉類', 'AI生成', NULL, '熟蓮藕');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_874', '["蓮藕片","熟蓮藕","水煮蓮藕","boiled lotus root slices","cooked lotus root","lotus stem slices","熟蓮藕切片(水煮)"]', '澱粉類', 'AI生成', NULL, '熟蓮藕切片(水煮)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_875', '["熟豬腸","熟肚","豬肚","stewed pig's tripe","beef tripe (誤, 常用於英文菜單區分)","pig's stomach","熟豬肚"]', '肉類', 'AI生成', NULL, '熟豬肚');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_876', '["熟鵝腿","烤鵝腿肉","燉鵝腿","roasted goose leg meat","braised goose leg","smoked goose thigh","熟鵝腿肉"]', '加工調理食品及其他類', 'AI生成', NULL, '熟鵝腿肉');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_877', '["熱狗","德國香腸卷","hot dog","dachshund sausage","frankfurter","wiener","tube steak"]', '加工調理食品及其他類', 'AI生成', NULL, '熱狗');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_878', '["熱狗粉","Hot Dog Powder","Hotdog Seasoning"]', '調味料及香辛料類', 'AI生成', NULL, '熱狗粉');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_879', '["燒餅","鍋盔","饢","炕頭粑","burnt pancake","pancake on the stove"]', '加工調理食品及其他類', 'AI生成', NULL, '燒餅');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_880', '["燕麥片","莜麥","鷹麥","oatmeal","oats","燕麥"]', '穀物類', 'AI生成', NULL, '燕麥');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_881', '["燕麥奶","麥仁奶","燕麥飲","oat milk","oat beverage"]', '加工調理食品及其他類', 'AI生成', NULL, '燕麥奶');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_882', '["燕麥碎","燕麥粒","oat flakes","rolled oats","jumbo oats","quick cooking oats","燕麥片"]', '穀物類', 'AI生成', NULL, '燕麥片');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_883', '["營養口糧","nutrition ration"]', '糕餅點心類', 'AI生成', NULL, '營養口糧');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_884', '["牛肉乾","辣牛肉乾","片狀牛肉乾","dried beef slices","spicy beef jerky","片狀肉乾(牛肉,辣味)","Beefalo"]', '加工調理食品及其他類', 'AI生成', 'Beefalo', '片狀肉乾(牛肉,辣味)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_885', '["牛肉乾","肉乾","dried beef strips","beef jerky","片狀肉乾(牛肉)","Beefalo"]', '加工調理食品及其他類', 'AI生成', 'Beefalo', '片狀肉乾(牛肉)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_886', '["肉乾片","豬肉乾片","肉脯","肉鬆餅","豬肉脯","dried meat slice","pork jerky slice","pork meat strip","meat sheet","片狀肉乾(豬肉)"]', '加工調理食品及其他類', 'AI生成', NULL, '片狀肉乾(豬肉)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_887', '["牛五花肉片","雪花牛肉火鍋片","beef ribeye slices for hot pot","hot pot beef rib meat","牛五花肉火鍋片"]', '肉類', 'AI生成', NULL, '牛五花肉火鍋片');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_888', '["前胸肉","牛修清","calf's neck meat","clear beef brisket","front chest meat","牛修清前胸肉"]', '肉類', 'AI生成', NULL, '牛修清前胸肉');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_889', '["牛前胸肉","胸口肉","beef plate","forequarter brisket","cow's breast meat"]', '肉類', 'AI生成', NULL, '牛前胸肉');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_890', '["去骨肩胛排","牛小排","牛肩肉","牛肉塊","boneless shoulder blade strip steak","beef riblets","shoulder top blade roast","English cut","牛去骨肩胛小排"]', '肉類', 'AI生成', NULL, '牛去骨肩胛小排');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_891', '["牛奶巧力","milk chocolate almond milk","chocolate flavored almond milk","牛奶巧克力","Almond milk"]', '糕餅點心類', 'AI生成', 'Almond milk', '牛奶巧克力');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_892', '["牛奶果","almond milk","tree milk","bottle almond drink","Almond milk"]', '水果類', 'AI生成', 'Almond milk', '牛奶果');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_893', '["牛奶果凍","奶糖","奶油軟糖","牛奶橡皮糖","milk jelly","dairy candy","creamy soft chew","milk gum drop","牛奶軟糖","Almond milk"]', '糕餅點心類', 'AI生成', 'Almond milk', '牛奶軟糖');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_894', '["牛奶菠蘿","菠蘿","pineapple","牛奶鳳梨","Pineapple"]', '水果類', 'AI生成', 'Pineapple', '牛奶鳳梨');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_895', '["牛肩肉","嫩肩肉","里肌肉","Beef Top Sirloin","Top Sirloin Beef","Sirloin Tip Roast","牛嫩肩里肌火鍋片"]', '肉類', 'AI生成', NULL, '牛嫩肩里肌火鍋片');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_896', '["牛小排","牛仔骨","肉排","short ribs","beef short ribs","meat riblets","牛小排平均值"]', '肉類', 'AI生成', NULL, '牛小排平均值');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_897', '["牛後腿肉","臀肉","腰板","rump beef","sirloin tip","round steak"]', '肉類', 'AI生成', NULL, '牛後腿肉');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_898', '["牛後腿肉","牛腿肉","hindquarter beef","round steak","sirloin tip","牛後腿股肉"]', '肉類', 'AI生成', NULL, '牛後腿股肉');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_899', '["牛後腿腱子心","牛腱肉","牛腱子","heel of beef","beef tendon meat","round tendon"]', '肉類', 'AI生成', NULL, '牛後腿腱子心');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_900', '["牛後腿腱子心","hindquarter heart muscle","round tip center","rump heart cut","牛後腿腱子心(2022年取樣)"]', '肉類', 'AI生成', NULL, '牛後腿腱子心(2022年取樣)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_901', '["牛心柿","牛心李","bullheart persimmon","ox heart persimmon"]', '水果類', 'AI生成', NULL, '牛心柿');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_902', '["牛排調料","牛排蘸醬","牛排汁","beef steak sauce","steak seasoning","ranch dressing (if served with steak)","牛排醬"]', '調味料及香辛料類', 'AI生成', NULL, '牛排醬');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_903', '["牛梅花肉片","嫩肩肉火鍋片","beef tenderloin slices for hotpot","filet mignon strips for hotpot","牛梅花肉火鍋片"]', '肉類', 'AI生成', NULL, '牛梅花肉火鍋片');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_904', '["牛油","生牛油","粗製牛油","butter","raw butter","unrefined butter","牛油(未精煉)"]', '油脂類', 'AI生成', NULL, '牛油(未精煉)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_905', '["牛油","黃油","奶油","酥油","butter","margarine","spread","牛油(精煉)"]', '油脂類', 'AI生成', NULL, '牛油(精煉)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_906', '["牛番茄","櫻桃小番茄","洋柿子","cherry tomato","tomato berry","grape tomato (for the oblong variety)","Cherry tomato"]', '蔬菜類', 'AI生成', 'Cherry tomato', '牛番茄');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_907', '["牛腱","牛腳筋","牛腱子","ox tendons","beef tendons","牛筋"]', '肉類', 'AI生成', NULL, '牛筋');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_908', '["牛紐約客片","紐約客牛肉片","New York Strip for Hot Pot","Strip Steak Slices for Hot Pot","牛紐約客火鍋片"]', '肉類', 'AI生成', NULL, '牛紐約客火鍋片');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_909', '["牛肉片","火鍋肉片","雪花牛肉","beef slices for hot pot","hot pot beef slices","sliced beef for hot pot","牛肉火鍋片平均值","Beefalo"]', '肉類', 'AI生成', 'Beefalo', '牛肉火鍋片平均值');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_910', '["牛肉辣醬","牛肉甜醬","牛腩醬","beef sauce","bovine relish","cattle condiment","牛肉醬","Beefalo"]', '調味料及香辛料類', 'AI生成', 'Beefalo', '牛肉醬');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_911', '["牛肉包子","牛肉煎餅","牛肉捲餅","beef pie","meat pie","beef pastry","牛肉餡餅","Beefalo"]', '加工調理食品及其他類', 'AI生成', 'Beefalo', '牛肉餡餅');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_912', '["牛肉腸","牛香腸","beef sausage","cow sausage","牛肉香腸","Beefalo"]', '加工調理食品及其他類', 'AI生成', 'Beefalo', '牛肉香腸');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_913', '["牛肋肉","牛腩條","beef short ribs","rib meat","牛肋條"]', '肉類', 'AI生成', NULL, '牛肋條');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_914', '["牛小排","牛肋肉","牛腩排","short ribs","beef short rib","rib steak","牛肋條(2021年取樣)"]', '肉類', 'AI生成', NULL, '牛肋條(2021年取樣)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_915', '["牛百葉","牛肚","瘤胃","beef tripe","ox stomach","牛肚(瘤胃)"]', '肉類', 'AI生成', NULL, '牛肚(瘤胃)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_916', '["牛百葉","蜂巢胃","牛肚脷","beef tripe","honeycomb tripe","牛肚(蜂巢胃)"]', '肉類', 'AI生成', NULL, '牛肚(蜂巢胃)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_917', '["牛肚","牛百葉","牛胃","beef tripe slices","cow's stomach slices","tripe strips","牛肚切片(瘤胃)"]', '肉類', 'AI生成', NULL, '牛肚切片(瘤胃)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_918', '["牛肚","beef tripe","牛肚平均值"]', '肉類', 'AI生成', NULL, '牛肚平均值');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_919', '["牛舌餅","牛舌酥","牛舌夾","Beef Tongue Pie","Cow Tongue Pastry","Ox Tongue Cookie"]', '糕餅點心類', 'AI生成', NULL, '牛舌餅');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_920', '["大力士菜","牛蒡根","東洋蘿蔔","Burdock root","Gobo","牛蒡"]', '蔬菜類', 'AI生成', NULL, '牛蒡');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_921', '["牛軋糖","牛奶糖","牛舌糖","Nougat candy","Milk candy","Sugar"]', '糕餅點心類', 'AI生成', 'Sugar', '牛軋糖');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_922', '["蠔干","蚝干","淡菜","oyster shells","dried oysters","oyster slices","牡蠣干","Bivalvia (Clam, Mussel, Oyster)"]', '魚貝類', 'AI生成', 'Bivalvia (Clam, Mussel, Oyster)', '牡蠣干');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_923', '["犬牙南極魚","黑鱗南極魚","Alaska blackfish","Dallia pectoralis","犬牙南極魚切片"]', '魚貝類', 'AI生成', 'Alaska blackfish', '犬牙南極魚切片');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_924', '["狀元瓜","金絲瓜","Golden Cucumber","Gourd of Success"]', '水果類', 'AI生成', NULL, '狀元瓜');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_925', '["狗母魚","蛇鯔","Alaska blackfish","Dallia pectoralis","狗母魚(蛇鯔)"]', '魚貝類', 'AI生成', 'Alaska blackfish', '狗母魚(蛇鯔)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_926', '["猴頭菌","猴腦菌","monkey head mushroom","猴頭菇"]', '菇類', 'AI生成', NULL, '猴頭菇');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_927', '["猴頭菌罐頭","毛頭菇罐頭","monkey head mushroom in can","fungus flavus in can","猴頭菇罐頭"]', '加工調理食品及其他類', 'AI生成', NULL, '猴頭菇罐頭');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_928', '["文種芒果","玉珍芒","sweet mango","common mango","Indian mango","玉文芒果","Mango"]', '水果類', 'AI生成', 'Mango', '玉文芒果');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_929', '["西瓜籽","桂皮西瓜籽","watermelon seeds","cinnamon-flavored watermelon seeds","玉桂西瓜子","Watermelon"]', '加工調理食品及其他類', 'AI生成', 'Watermelon', '玉桂西瓜子');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_930', '["玉米油","corn oil","Acorn"]', '油脂類', 'AI生成', 'Acorn', '玉米油');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_931', '["玉米湯料包","速食玉米濃湯","即溶玉米濃湯","corn chowder mix","instant corn soup packet","quick-cook corn chowder","玉米濃湯調理包","Acorn"]', '加工調理食品及其他類', 'AI生成', 'Acorn', '玉米濃湯調理包');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_932', '["玉米筍","baby corn","young corn","Acorn"]', '蔬菜類', 'AI生成', 'Acorn', '玉米筍');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_933', '["橡實","樹果","acorn","oak nut","玉米粉","Acorn"]', '穀物類', 'AI生成', 'Acorn', '玉米粉');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_934', '["玉米粒","罐頭玉米","corn kernels in a can","canned corn","玉米粒罐頭","Acorn"]', '加工調理食品及其他類', 'AI生成', 'Acorn', '玉米粒罐頭');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_935', '["胚芽","玉米心","germ","corn germ","玉米胚芽","Acorn"]', '穀物類', 'AI生成', 'Acorn', '玉米胚芽');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_936', '["玉米罐頭","玉米泥罐頭","corn spread in a can","jarred corn puree","canned corn","玉米醬罐頭","Acorn"]', '加工調理食品及其他類', 'AI生成', 'Acorn', '玉米醬罐頭');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_937', '["玉米脆片","玉米餅乾","玉蜀黍餅乾","corn cookie","corn cracker","maize biscuit","玉米餅乾(原味)","Acorn"]', '糕餅點心類', 'AI生成', 'Acorn', '玉米餅乾(原味)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_938', '["玉荷苞荔枝","玉荷花蕾荔","Yuhetbao Lychee","Lotus Bud Lychee"]', '水果類', 'AI生成', NULL, '玉荷苞荔枝');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_939', '["玫瑰桃","rose peach"]', '水果類', 'AI生成', NULL, '玫瑰桃');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_940', '["玫瑰菇","rose mushroom","rosy mushroom"]', '菇類', 'AI生成', NULL, '玫瑰菇');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_941', '["珊瑚靈芝","樹舌","crab claw mushroom","claw fungus","珊瑚菇"]', '菇類', 'AI生成', NULL, '珊瑚菇');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_942', '["珍珠鮮奶茶","波霸奶茶","珍奶","QQ奶茶","珍珠黑糖鮮奶","bubble milk tea","pearl milk tea","boba milk tea","tapioca milk tea","珍珠奶茶(去冰,全糖)","Black tea"]', '飲料類', 'AI生成', 'Black tea', '珍珠奶茶(去冰,全糖)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_943', '["珍珠紅茶","冰奶茶","少冰珍珠奶茶","半糖珍珠紅茶","bubble milk tea","pearl milk tea","boba milk tea","milk black tea with pearls","珍珠奶茶(去冰,半糖)","Black tea"]', '飲料類', 'AI生成', 'Black tea', '珍珠奶茶(去冰,半糖)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_944', '["珍珠奶茶","波霸奶茶","QQ奶茶","黑糖珍珠奶茶","去冰微糖奶茶","bubble milk tea","pearl milk tea","boba milk tea","black sugar pearl milk tea","iced and lightly sweetened milk tea","珍珠奶茶(去冰,微糖)","Black tea"]', '飲料類', 'AI生成', 'Black tea', '珍珠奶茶(去冰,微糖)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_945', '["珍珠小白菜","珍珠除蟲草","jade snow pea greens","pearl bok choy"]', '蔬菜類', 'AI生成', NULL, '珍珠小白菜');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_946', '["珍珠芭樂","洋梨子","Java Apple","Water Apple","Rose Apple"]', '水果類', 'AI生成', NULL, '珍珠芭樂');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_947', '["珍珠苦瓜","珍珠辣椒","pearl bitter gourd","bitter melon"]', '蔬菜類', 'AI生成', NULL, '珍珠苦瓜');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_948', '["珍珠棗","蜜棗","jewel honey date","pearl honey jujube","珍珠蜜棗"]', '水果類', 'AI生成', NULL, '珍珠蜜棗');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_949', '["珠貝","乾貝","dried scallop","concha de vieira seca","珠貝(乾)"]', '魚貝類', 'AI生成', NULL, '珠貝(乾)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_950', '["球莢甘藍","迷你甘藍","miniature cabbages","baby cabbage","borecole","kale","球莖甘藍"]', '蔬菜類', 'AI生成', NULL, '球莖甘藍');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_951', '["文蛤","cockle","clam","環文蛤","Bivalvia (Clam, Mussel, Oyster)"]', '魚貝類', 'AI生成', 'Bivalvia (Clam, Mussel, Oyster)', '環文蛤');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_952', '["石鯃","虎斑魚","ringed conger","spotted moray eel","環紋簑鮋"]', '魚貝類', 'AI生成', NULL, '環紋簑鮋');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_953', '["熟扁桃仁","烤扁桃仁","甜扁桃仁","roasted almond","sweet almond","glazed almond","甘扁桃仁(熟)"]', '堅果及種子類', 'AI生成', NULL, '甘扁桃仁(熟)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_954', '["熟扁桃仁片","甘杏仁片","roasted almond slice","sweet almond flake","甘扁桃仁片(熟)"]', '堅果及種子類', 'AI生成', NULL, '甘扁桃仁片(熟)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_955', '["生扁桃仁片","生杏仁片","raw almond slice","bitter almond flake","甘扁桃仁片(生)"]', '堅果及種子類', 'AI生成', NULL, '甘扁桃仁片(生)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_956', '["甘納豆","ganada bean","glycinin"]', '加工調理食品及其他類', 'AI生成', NULL, '甘納豆');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_957', '["甘草末","草薙","licorice powder","sweet root powder","甘草粉"]', '調味料及香辛料類', 'AI生成', NULL, '甘草粉');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_958', '["甘草瓜子","葵花籽（帶殼）","葵瓜子","licorice sunflower seeds","sunflower seeds with shells","salted and roasted sunflower seeds","甘草葵瓜子(帶殼)"]', '加工調理食品及其他類', 'AI生成', NULL, '甘草葵瓜子(帶殼)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_959', '["鳳梨","菠蘿","洋鳳梨","pineapple","ananas","甘蔗鳳梨","Pineapple"]', '水果類', 'AI生成', 'Pineapple', '甘蔗鳳梨');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_960', '["地瓜蜜餞","紅薯蜜餡","sweet potato candy","tapioca jelly sweet","甘薯蜜餞"]', '糕餅點心類', 'AI生成', NULL, '甘薯蜜餞');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_961', '["洋白菜","包心菜","大頭菜","cabbage","green cabbage","round cabbage","甘藍(圓球形)"]', '蔬菜類', 'AI生成', NULL, '甘藍(圓球形)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_962', '["洋白菜","包心菜","大頭菜","雞蛋菜","cabbage","green cabbage","heading cabbage","甘藍(圓球形)(2021年取樣)"]', '蔬菜類', 'AI生成', NULL, '甘藍(圓球形)(2021年取樣)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_963', '["洋白菜","包心菜","大頭菜","疙瘩白","cabbage","cole","heading cabbage","green cabbage","甘藍(扁圓形)"]', '蔬菜類', 'AI生成', NULL, '甘藍(扁圓形)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_964', '["甘藍乾","捲心菜乾","大頭菜乾","kale chips","dried cabbage","kale strips"]', '加工調理食品及其他類', 'AI生成', NULL, '甘藍乾');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_965', '["甘藍","卷心菜","抱子甘藍","cabbage","kale","curly kale","borecole","甘藍平均值"]', '蔬菜類', 'AI生成', NULL, '甘藍平均值');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_966', '["甘藍芽","抱子甘藍","kohlrabi sprouts","kohl rose buds","coleslaw seeds"]', '蔬菜類', 'AI生成', NULL, '甘藍芽');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_967', '["甘藷","地瓜","紅薯","番薯","山藥","芋仔","馬鈴薯（誤稱）","洋芋（誤稱）","potato (incorrect)","spud","tater","murphy","甘藷粉"]', '澱粉類', 'AI生成', NULL, '甘藷粉');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_968', '["甘藷葉","甜菜葉","地瓜葉","紅薯葉","sweet potato leaves","camote tops","kamote tops"]', '蔬菜類', 'AI生成', NULL, '甘藷葉');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_969', '["甜柿","進口甜柿","sweet persimmon","imported sweet persimmon","甜柿(進口)"]', '水果類', 'AI生成', NULL, '甜柿(進口)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_970', '["甜柿","sweet persimmon","hachiya (variety)","fuyu (variety)","甜柿平均值"]', '水果類', 'AI生成', NULL, '甜柿平均值');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_971', '["甜核桃","黑核桃","胡桃","black walnut","eastern black walnut","Juglans nigra","Black walnut"]', '加工調理食品及其他類', 'AI生成', 'Black walnut', '甜核桃');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_972', '["甜柿子","柿子椒","彩椒","五穀椒","洋柿子","bell pepper","capsicum","pepper","sweet pepper","maqaw","甜椒(橙皮)"]', '蔬菜類', 'AI生成', NULL, '甜椒(橙皮)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_973', '["甜椒","紅椒","甜彩椒","鈴鐺椒","bell pepper","sweet pepper","capsicum","甜椒(紅皮)"]', '蔬菜類', 'AI生成', NULL, '甜椒(紅皮)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_974', '["青椒","甜青椒","甜柿椒","green bell pepper","green sweet pepper","green capsicum","甜椒(青皮)"]', '蔬菜類', 'AI生成', NULL, '甜椒(青皮)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_975', '["甜椒","黃甜椒","甜彩椒","bell pepper","sweet pepper","pepper","capsicum","甜椒(黃皮)"]', '蔬菜類', 'AI生成', NULL, '甜椒(黃皮)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_976', '["甜椒","甜柿子","糖醋椒","bell pepper","sweet pepper","capsicum","pepper","甜椒平均值(青皮)"]', '蔬菜類', 'AI生成', NULL, '甜椒平均值(青皮)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_977', '["甜橙","溫州柑","福桔","mandarin orange","tangerine","cheng","甜橙平均值(普遍系)"]', '水果類', 'AI生成', NULL, '甜橙平均值(普遍系)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_978', '["甜玉米","奶油玉米","牛奶玉米","sweet corn","sugar corn","white corn","baby corn (嫩玉米)","Acorn"]', '穀物類', 'AI生成', 'Acorn', '甜玉米');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_979', '["甜瓜","香瓜","洋香瓜","cantaloupe","rockmelon","sweet melon","甜瓜平均值(光皮洋香瓜)"]', '水果類', 'AI生成', NULL, '甜瓜平均值(光皮洋香瓜)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_980', '["東洋甜瓜","脆皮甜瓜","Asian honeydew melon","Crunchy Asian melon","甜瓜平均值(東洋系脆瓜)"]', '水果類', 'AI生成', NULL, '甜瓜平均值(東洋系脆瓜)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_981', '["網紋洋香瓜","網紋瓜","甜瓜","netted muskmelon","cantaloupe","muskmelon","甜瓜平均值(網紋洋香瓜)"]', '水果類', 'AI生成', NULL, '甜瓜平均值(網紋洋香瓜)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_982', '["甜蜜桃","蜜桃","peach","nectar peach"]', '水果類', 'AI生成', NULL, '甜蜜桃');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_983', '["菠蘿","黃梨","香芒","鳳梨","pineapple","anana","anas","haytian apple","cayenne pineapple","甜蜜蜜鳳梨","Pineapple"]', '水果類', 'AI生成', 'Pineapple', '甜蜜蜜鳳梨');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_984', '["甜豆莢","糖豌豆","sugar snap peas","snow pea pods with sugar","甜豌豆莢","Asian pear"]', '豆類', 'AI生成', 'Asian pear', '甜豌豆莢');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_985', '["甜辣醬","糖醋辣椒醬","sweet and sour chili sauce","sugar vinegar pepper sauce"]', '調味料及香辛料類', 'AI生成', NULL, '甜辣醬');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_986', '["甜酒娘","酒釀","醪糟","酒糟","糯米酒","sweet rice wine","rice fermentation drink","fermented sweet rice","甜酒釀"]', '加工調理食品及其他類', 'AI生成', NULL, '甜酒釀');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_987', '["甜面酱","白糖酱油","sweet soy sauce","sweet bean paste sauce","甜麵醬"]', '調味料及香辛料類', 'AI生成', NULL, '甜麵醬');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_988', '["生啤酒","冰鎮啤酒","draft beer","cold beer","fresh beer","Beer"]', '加工調理食品及其他類', 'AI生成', 'Beer', '生啤酒');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_989', '["黑核桃","東部黑核桃","eastern black walnut","black walnut","生核桃","Black walnut"]', '堅果及種子類', 'AI生成', 'Black walnut', '生核桃');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_990', '["番石榴","珍珠拔","芭樂","pitaya","papaya fruit","passionfruit","番石榴(珍珠拔)(有機)"]', '水果類', 'AI生成', NULL, '番石榴(珍珠拔)(有機)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_991', '["番鴨","紅毛鴨","印度鴨","muscovy duck","barbary duck","Indian runner duck"]', '肉類', 'AI生成', NULL, '番鴨');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_992', '["發芽糙米","稻谷","稉稻","sprouted rice","mung bean sprouts (誤導性別名，僅供參考)","發芽稉米(台稉71號)","Annual wild rice"]', '穀物類', 'AI生成', 'Annual wild rice', '發芽稉米(台稉71號)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_993', '["發芽粳米","台稉9號大米","稉稻","台灣本地稻","germinated japonica rice","Taichung Native Rice #9","Taiwanese native rice","發芽稉米(台稉9號）","Annual wild rice"]', '穀物類', 'AI生成', 'Annual wild rice', '發芽稉米(台稉9號）');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_994', '["野生稻","加拿大米","印度米","水燕麥","wild rice","Canada rice","Indian rice","water oats","發芽稉米平均值","Annual wild rice"]', '穀物類', 'AI生成', 'Annual wild rice', '發芽稉米平均值');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_995', '["白姑魚","Alaska blackfish","Dallia pectoralis"]', '魚貝類', 'AI生成', 'Alaska blackfish', '白姑魚');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_996', '["大對蝦","琵琶蝦","明蝦","jumbo shrimp","prawn","king prawn","giant freshwater shrimp","白對蝦(大)","Shrimp"]', '魚貝類', 'AI生成', 'Shrimp', '白對蝦(大)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_997', '["小白蝦","細蝦","little shrimp","small prawn","baby shrimp","白對蝦(小)","Shrimp"]', '魚貝類', 'AI生成', 'Shrimp', '白對蝦(小)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_998', '["小白虾","小对虾","海中虾","young shrimp","small shrimp","baby shrimp","白對蝦(小)(2022年取樣)","Shrimp"]', '魚貝類', 'AI生成', 'Shrimp', '白對蝦(小)(2022年取樣)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_999', '["海蝦","白蝦","white shrimp","common shrimp","白對蝦平均值","Shrimp"]', '魚貝類', 'AI生成', 'Shrimp', '白對蝦平均值');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1000', '["白巧糖","牛奶巧克力風味糖","雪白朱古力糖","white chocolate flavored candy","milk chocolate white flavor candy","snowy white chocolate sugar","白巧克力風味糖","Sugar"]', '糕餅點心類', 'AI生成', 'Sugar', '白巧克力風味糖');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1001', '["白帶魚","Alaska blackfish","Dallia pectoralis"]', '魚貝類', 'AI生成', 'Alaska blackfish', '白帶魚');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1002', '["白柚","白肉柚","white pumelo","white grapefruit"]', '水果類', 'AI生成', NULL, '白柚');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1003', '["櫻桃番茄","迷你番茄","小番茄","cherry tomato","tomato berry","grape tomato (for the more oblong ones)","白櫻桃","Cherry tomato"]', '水果類', 'AI生成', 'Cherry tomato', '白櫻桃');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1004', '["白木耳","雪耳","白毛木耳"]', '菇類', 'AI生成', NULL, '白毛木耳');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1005', '["白油桃","white peach","baidu peitao"]', '水果類', 'AI生成', NULL, '白油桃');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1006', '["白蔥","大蔥","洋蔥頭","紅蔥","bulb onion","common onion","brown onion","red onion (though not the same species, often confused)","白洋蔥","Garden onion"]', '蔬菜類', 'AI生成', 'Garden onion', '白洋蔥');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1007', '["白海參","White Sea Cucumber"]', '魚貝類', 'AI生成', NULL, '白海參');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1008', '["白玉蜀黍","白玉米棒","white corn","flint corn (when dried)","白玉米","Acorn"]', '穀物類', 'AI生成', 'Acorn', '白玉米');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1009', '["白皮甘藷","土豆","洋芋","馬鈴薯","薯仔","山藥","地瓜","potato","spud","tater","murphy","Irish potato"]', '澱粉類', 'AI生成', NULL, '白皮甘藷');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1010', '["白皮蛇","蛇瓜","White Snake Melon","Snake Gourd","白皮蛇瓜"]', '蔬菜類', 'AI生成', NULL, '白皮蛇瓜');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1011', '["白糯米","白糯米粉","Annual wild rice"]', '穀物類', 'AI生成', 'Annual wild rice', '白糯米粉');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1012', '["白緣星鱠","white-edge star sashimi","star ribbonfish sashimi"]', '魚貝類', 'AI生成', NULL, '白緣星鱠');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1013', '["鮭魚片","三文魚切片","bay salmon","black salmon","caplin-scull salmon","fiddler","grilse","grilt","kelt","landlocked salmon","ouananiche","outside salmon","parr","Sebago salmon","silver salmon","slink","smolt","spring salmon","winnish","白肉鮭魚切片","Atlantic salmon"]', '魚貝類', 'AI生成', 'Atlantic salmon', '白肉鮭魚切片');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1014', '["白胡椒","white pepper powder","ground white pepper","白胡椒粉","Cubanelle pepper"]', '調味料及香辛料類', 'AI生成', 'Cubanelle pepper', '白胡椒粉');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1015', '["白芝麻","熟芝麻","sesame seeds","white sesame seeds","benne (in the southern United States)","白芝麻(熟)","Sesame"]', '堅果及種子類', 'AI生成', 'Sesame', '白芝麻(熟)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1016', '["白芝麻","熟芝麻","sesame seeds","benne seed","gingergrass seeds","白芝麻(熟)2022年取樣)","Sesame"]', '堅果及種子類', 'AI生成', 'Sesame', '白芝麻(熟)2022年取樣)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1017', '["生芝麻","白生芝麻","raw sesame seed","white sesame (unhulled)","白芝麻(生)","Sesame"]', '堅果及種子類', 'AI生成', 'Sesame', '白芝麻(生)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1018', '["白芝麻香油","白麻油","白芝麻調和油","sesame oil","toasted sesame oil","brown sesame oil","白芝麻油","Sesame oil"]', '油脂類', 'AI生成', 'Sesame oil', '白芝麻油');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1019', '["芝麻糖","白芝麻製品","sesame sugar candy","white sesame confectionery","白芝麻糖","Sesame"]', '糕餅點心類', 'AI生成', 'Sesame', '白芝麻糖');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1020', '["樹薯","面包果","breadfruit","pekea","poee","pua","白芝麻麵包醬","Breadfruit"]', '調味料及香辛料類', 'AI生成', 'Breadfruit', '白芝麻麵包醬');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1021', '["茯苓","白靈芝","Poria cocos","China root","白茯苓"]', '菇類', 'AI生成', NULL, '白茯苓');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1022', '["酸模","酸菜","bitter grass","chickenweed","白莧菜"]', '蔬菜類', 'AI生成', NULL, '白莧菜');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1023', '["菜苗","白菜心","白蘿蔔芽","mizuna (though not exactly the same, it's a close relative in some contexts)","Chinese celery sprouts","白菜芽"]', '蔬菜類', 'AI生成', NULL, '白菜芽');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1024', '["白汁酒","白酒","white wine","blanc","dry white","白葡萄酒","Common grape"]', '加工調理食品及其他類', 'AI生成', 'Common grape', '白葡萄酒');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1025', '["白筍","白皮筍","white asparagus","白蘆筍"]', '蔬菜類', 'AI生成', NULL, '白蘆筍');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1026', '["大根","蘿蔔","菜頭","white radish","oriental radish","daikon (note: daikon is usually associated with the Japanese variety, but can also refer to Chinese white radish)","白蘿蔔","Black radish"]', '蔬菜類', 'AI生成', 'Black radish', '白蘿蔔');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1027', '["白蘿蔔","菜頭","black radish","Black Spanish radish","Gros Noir d'Hiver","白蘿蔔(長形)","Black radish"]', '蔬菜類', 'AI生成', 'Black radish', '白蘿蔔(長形)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1028', '["黑皮白蘿蔔","黑蘿蔔","black radish","Black Spanish round radish","Gros Noir d'Hiver","白蘿蔔平均值","Black radish"]', '蔬菜類', 'AI生成', 'Black radish', '白蘿蔔平均值');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1029', '["白玉菇","雪耳菇","white oyster mushroom","winter mushroom","oyster mushroom","白蠔菇"]', '菇類', 'AI生成', NULL, '白蠔菇');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1030', '["白醬","mayonnaise","mayo"]', '調味料及香辛料類', 'AI生成', NULL, '白醬');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1031', '["白飯","大米饭","炒飯","white rice","steamed rice"]', '穀物類', 'AI生成', NULL, '白飯');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1032', '["白馒头","純白饅頭","素饅頭","奶白色饅頭","plain steamed bun","white steamed bun","白饅頭"]', '加工調理食品及其他類', 'AI生成', NULL, '白饅頭');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1033', '["白馬頭魚","Alaska blackfish","Dallia pectoralis"]', '魚貝類', 'AI生成', 'Alaska blackfish', '白馬頭魚');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1034', '["石鰱","白鰈","white bass","白鱸"]', '魚貝類', 'AI生成', NULL, '白鱸');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1035', '["白鳳心","白鳳菜"]', '蔬菜類', 'AI生成', NULL, '白鳳菜');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1036', '["白鳳豆","白花豆","white flower bean","白鳳豆(台灣)"]', '豆類', 'AI生成', NULL, '白鳳豆(台灣)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1037', '["白鳳豆","white flower bean","进口白凤豆","白鳳豆(進口)"]', '豆類', 'AI生成', NULL, '白鳳豆(進口)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1038', '["白鳳豆","花腰豆","white phoenix bean","flower waist bean","白鳳豆平均值"]', '豆類', 'AI生成', NULL, '白鳳豆平均值');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1039', '["百合片","山鱗","百合鱗片"]', '蔬菜類', 'AI生成', NULL, '百合鱗片');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1040', '["百頁豆腐","內脂豆腐","cotton tofu","soft tofu","bean curd sheet rolls","Tofu"]', '加工調理食品及其他類', 'AI生成', 'Tofu', '百頁豆腐');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1041', '["百香果","釋迦果","番石榴","passion fruit","passionfruit","pasionaria","百香果(台農一號)"]', '水果類', 'AI生成', NULL, '百香果(台農一號)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1042', '["百香果飲","西番蓮果汁","grapefruit juice","passion fruit nectar","百香果汁","Fruit juice"]', '水果類', 'AI生成', 'Fruit juice', '百香果汁');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1043', '["宮廷菜","皇室菜","皇宮菜"]', '蔬菜類', 'AI生成', NULL, '皇宮菜');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1044', '["宮廷西瓜","皇家甜瓜","king's melon","palace watermelon","皇宮西瓜","Watermelon"]', '水果類', 'AI生成', 'Watermelon', '皇宮西瓜');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1045', '["後海螯蝦","相模蝦","sagami shrimp","crangon shrimp","相模後海螯蝦","Shrimp"]', '魚貝類', 'AI生成', 'Shrimp', '相模後海螯蝦');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1046', '["大烏賊","大海兔","giant cuttlefish","sepia apama","真烏賊(大)"]', '魚貝類', 'AI生成', NULL, '真烏賊(大)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1047', '["小烏賊","小墨魚","baby squid","little squid","真烏賊(小)"]', '魚貝類', 'AI生成', NULL, '真烏賊(小)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1048', '["真烏賊","true squid","giant squid","真烏賊平均值"]', '魚貝類', 'AI生成', NULL, '真烏賊平均值');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1049', '["牡蠣","海舌","蚵仔","oyster","rock oyster","mollusc","真牡蠣","Bivalvia (Clam, Mussel, Oyster)"]', '魚貝類', 'AI生成', 'Bivalvia (Clam, Mussel, Oyster)', '真牡蠣');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1050', '["牡蠣","海鷄冠","oyster","rock oyster","mollusk","bivalve mollusc","真牡蠣平均值","Bivalvia (Clam, Mussel, Oyster)"]', '魚貝類', 'AI生成', 'Bivalvia (Clam, Mussel, Oyster)', '真牡蠣平均值');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1051', '["真鯛","黃花魚","yellow croaker","gilthead sea bream","真鯛(11月)"]', '魚貝類', 'AI生成', NULL, '真鯛(11月)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1052', '["真鯛","𩾃魚","Red Snapper","真鯛(1月)"]', '魚貝類', 'AI生成', NULL, '真鯛(1月)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1053', '["三月鯛","鯛魚","March snapper","Red porgy","真鯛(3月)"]', '魚貝類', 'AI生成', NULL, '真鯛(3月)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1054', '["真鯛","五月鯛","黃鯛","Yellow snapper","May snapper","真鯛(5月)"]', '魚貝類', 'AI生成', NULL, '真鯛(5月)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1055', '["八月鯛","月鯛","August snapper","Red sea bream","真鯛(8月)"]', '魚貝類', 'AI生成', NULL, '真鯛(8月)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1056', '["九月鯛","紅鯛","Red snapper (September)","September porgy","真鯛(9月)"]', '魚貝類', 'AI生成', NULL, '真鯛(9月)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1057', '["真鯛","𩾃魚","黃斑𩾃","Red Porgy","Tai Snapper","Yellowmouth Snapper","真鯛平均值(去皮)"]', '魚貝類', 'AI生成', NULL, '真鯛平均值(去皮)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1058', '["眼斑擬石首魚","Alaska blackfish","Dallia pectoralis"]', '魚貝類', 'AI生成', 'Alaska blackfish', '眼斑擬石首魚');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1059', '["眼眶魚","Alaska blackfish","Dallia pectoralis"]', '魚貝類', 'AI生成', 'Alaska blackfish', '眼眶魚');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1060', '["石狗公"]', '魚貝類', 'AI生成', NULL, '石狗公');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1061', '["石蓮花","石韋","Stonecrop","Sedum morganianum (學名)"]', '蔬菜類', 'AI生成', NULL, '石蓮花');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1062', '["橘子","柑橘","桔子","橙子","tangerine","mandarin orange","cheng","Chinese orange","砂糖橘","Sugar"]', '水果類', 'AI生成', 'Sugar', '砂糖橘');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1063', '["礁膜","reef film","reef skin"]', '藻類', 'AI生成', NULL, '礁膜');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1064', '["福壽桃","Fukudo Peach","Blessing and Longevity Peach"]', '水果類', 'AI生成', NULL, '福壽桃');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1065', '["福氏鸚哥魚","Alaska blackfish","Dallia pectoralis","福氏鸚哥魚(去皮)"]', '魚貝類', 'AI生成', 'Alaska blackfish', '福氏鸚哥魚(去皮)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1066', '["秀珍菇","袖珍菇","Abalone Mushroom","Button Mushroom variety"]', '菇類', 'AI生成', NULL, '秀珍菇');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1067', '["秀珍菇","袖珍菇","Crimini mushroom in can","Baby portobello mushrooms in can","秀珍菇罐頭"]', '加工調理食品及其他類', 'AI生成', NULL, '秀珍菇罐頭');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1068', '["野生稻","水禾","Canada rice","Indian rice","water oats","秈型糯米(台中糯70號)","Annual wild rice"]', '穀物類', 'AI生成', 'Annual wild rice', '秈型糯米(台中糯70號)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1069', '["台中在來2號","野生米","wild rice","Canada rice","Indian rice","water oats","秈米(台中在來2號)","Annual wild rice"]', '穀物類', 'AI生成', 'Annual wild rice', '秈米(台中在來2號)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1070', '["秈米","台中秈10號","wild rice","Canada rice","Indian rice","water oats","秈米(台中秈10號)","Annual wild rice"]', '穀物類', 'AI生成', 'Annual wild rice', '秈米(台中秈10號)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1071', '["秈米","台中秈10號","wild rice","Canada rice","Indian rice","water oats","秈米(台中秈10號)(2024年取樣)","Annual wild rice"]', '穀物類', 'AI生成', 'Annual wild rice', '秈米(台中秈10號)(2024年取樣)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1072', '["野米","加拿大米","印度米","水燕麥","Canada rice","Indian rice","water oats","秈米平均值","Annual wild rice"]', '穀物類', 'AI生成', 'Annual wild rice', '秈米平均值');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1073', '["野稻米","水稻米","Canada rice","Indian rice","water oats","秈米粉","Annual wild rice"]', '穀物類', 'AI生成', 'Annual wild rice', '秈米粉');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1074', '["秋刀魚","鯖鰭魚","sanma","Pacific saury","Alaska blackfish"]', '魚貝類', 'AI生成', 'Alaska blackfish', '秋刀魚');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1075', '["秋香洋香瓜","Asian melon","Autumn fragrant muskmelon"]', '水果類', 'AI生成', NULL, '秋香洋香瓜');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1076', '["秋香蘋果","香妃果","Autumn Fragrance Apple","Fall Aroma Apple","Apple"]', '水果類', 'AI生成', 'Apple', '秋香蘋果');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1077', '["野生稻","米穀","Canada rice","Indian rice","water oats","稉型糯米","Annual wild rice"]', '穀物類', 'AI生成', 'Annual wild rice', '稉型糯米');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1078', '["台稉糯1號","野生稻","水穀","wild rice","Canada rice","Indian rice","water oats","稉型糯米(台稉糯1號)","Annual wild rice"]', '穀物類', 'AI生成', 'Annual wild rice', '稉型糯米(台稉糯1號)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1079', '["野米","加拿大米","印度米","水燕麥","Canada rice","Indian rice","water oats","稉型糯米平均值","Annual wild rice"]', '穀物類', 'AI生成', 'Annual wild rice', '稉型糯米平均值');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1080', '["野生稻","水稻","Canada rice","Indian rice","water oats","稉米(台中189號)","Annual wild rice"]', '穀物類', 'AI生成', 'Annual wild rice', '稉米(台中189號)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1081', '["台南11號","莙荙米","wild rice","Canada rice","Indian rice","water oats","稉米(台南11號)","Annual wild rice"]', '穀物類', 'AI生成', 'Annual wild rice', '稉米(台南11號)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1082', '["野生稻","加拿大米","印度米","水穀","Canada rice","Indian rice","water oats","稉米(台稉2號)","Annual wild rice"]', '穀物類', 'AI生成', 'Annual wild rice', '稉米(台稉2號)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1083', '["台稉8號","野生稻","wild rice","Canada rice","Indian rice","water oats","稉米(台稉8號)","Annual wild rice"]', '穀物類', 'AI生成', 'Annual wild rice', '稉米(台稉8號)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1084', '["台稉9號","野生稻","wild rice","Canada rice","Indian rice","water oats","稉米(台稉9號)","Annual wild rice"]', '穀物類', 'AI生成', 'Annual wild rice', '稉米(台稉9號)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1085', '["台農71號","野生米","wild rice","Canada rice","Indian rice","water oats","稉米(台農71號)","Annual wild rice"]', '穀物類', 'AI生成', 'Annual wild rice', '稉米(台農71號)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1086', '["高雄139號","野生稻","wild rice","Canada rice","Indian rice","water oats","稉米(高雄139號)","Annual wild rice"]', '穀物類', 'AI生成', 'Annual wild rice', '稉米(高雄139號)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1087', '["高雄139號","野生稻","wild rice","Canada rice","Indian rice","water oats","稉米(高雄139號)(2021年取樣)","Annual wild rice"]', '穀物類', 'AI生成', 'Annual wild rice', '稉米(高雄139號)(2021年取樣)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1088', '["高雄142號","野稻米","水稲","wild rice","Canada rice","Indian rice","water oats","稉米(高雄142號)","Annual wild rice"]', '穀物類', 'AI生成', 'Annual wild rice', '稉米(高雄142號)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1089', '["野稻","高雄145號","wild rice","Canada rice","Indian rice","water oats","稉米(高雄145號)","Annual wild rice"]', '穀物類', 'AI生成', 'Annual wild rice', '稉米(高雄145號)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1090', '["野米","加拿大米","印度米","水鷗","wild rice","Canada rice","Indian rice","water oats","稉米平均值","Annual wild rice"]', '穀物類', 'AI生成', 'Annual wild rice', '稉米平均值');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1091', '["稜角絲瓜","尖嘴絲瓜","ribbed luffa","striped loofah"]', '蔬菜類', 'AI生成', NULL, '稜角絲瓜');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1092', '["八爪魚","墨斗魚","墨魚","octopus","devilfish","common octopus","章魚","Common octopus"]', '魚貝類', 'AI生成', 'Common octopus', '章魚');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1093', '["竹筍包子","竹筍餡餅","竹笋包","bamboo shoot bun","bamboo sprout dumpling","竹筍包","Bamboo shoots"]', '加工調理食品及其他類', 'AI生成', 'Bamboo shoots', '竹筍包');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1094', '["竹節蝦","竹筍蝦","竹管蝦","竹籤蝦","bamboo prawn","bamboo clam","mud crablet","竹蟶(冷凍)"]', '魚貝類', 'AI生成', NULL, '竹蟶(冷凍)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1095', '["筆柿","毛柿","pencil persimmon","hairy persimmon"]', '水果類', 'AI生成', NULL, '筆柿');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1096', '["筒仔飯","發酵米糕","bamboo tube glutinous rice cake","tube steamed sticky rice cake","筒仔米糕","Annual wild rice"]', '加工調理食品及其他類', 'AI生成', 'Annual wild rice', '筒仔米糕');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1097', '["秈米油","糙米油","wild rice oil","Canadian rice oil","米油(秈米)","Annual wild rice"]', '油脂類', 'AI生成', 'Annual wild rice', '米油(秈米)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1098', '["粳米","glutinous rice","sticky rice","米油(粳米)","Annual wild rice"]', '油脂類', 'AI生成', 'Annual wild rice', '米油(粳米)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1099', '["米湯","米粥水","米汁","rice milk","rice juice","米漿(散裝)","Annual wild rice"]', '加工調理食品及其他類', 'AI生成', 'Annual wild rice', '米漿(散裝)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1100', '["米粉","米糊","rice porridge flour","rice milk powder","米漿粉","Annual wild rice"]', '加工調理食品及其他類', 'AI生成', 'Annual wild rice', '米漿粉');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1101', '["米線","米凍","rice vermicelli","sticky rice noodle","米粄條","Annual wild rice"]', '加工調理食品及其他類', 'AI生成', 'Annual wild rice', '米粄條');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1102', '["米糰","米餈","水磨糕","wild rice cake","rice fritter","米粩","Annual wild rice"]', '糕餅點心類', 'AI生成', 'Annual wild rice', '米粩');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1103', '["米芽","胚芽米","米胚芽","Annual wild rice"]', '穀物類', 'AI生成', 'Annual wild rice', '米胚芽');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1104', '["野米","加拿大米","印度米","水蘗","Canada rice","Indian rice","water oats","米苔目","Annual wild rice"]', '加工調理食品及其他類', 'AI生成', 'Annual wild rice', '米苔目');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1105', '["野米","加拿大米","印度米","水燕麥","wild rice","Canada rice","Indian rice","water oats","米豆","Annual wild rice"]', '豆類', 'AI生成', 'Annual wild rice', '米豆');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1106', '["野米","加拿大米","印度米","水燕麥","wild rice","Canada rice","Indian rice","water oats","米豆醬","Annual wild rice"]', '調味料及香辛料類', 'AI生成', 'Annual wild rice', '米豆醬');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1107', '["米醋","rice vinegar","Annual wild rice"]', '調味料及香辛料類', 'AI生成', 'Annual wild rice', '米醋');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1108', '["米醋水","米醋汁","rice vinegar drink","vinegar rice beverage","米醋飲料","Annual wild rice"]', '飲料類', 'AI生成', 'Annual wild rice', '米醋飲料');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1109', '["粉圓","珍珠","大珍珠","粉果","QQ球","tapioca pearls","boba","pearls","bubble tea balls","pudding pearls"]', '加工調理食品及其他類', 'AI生成', NULL, '粉圓');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1110', '["粉柿","櫻桃番茄","小番茄","cherry tomato","tomato berry","grape tomato","粉柿番茄","Cherry tomato"]', '蔬菜類', 'AI生成', 'Cherry tomato', '粉柿番茄');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1111', '["粉果","粿仔","粉粿"]', '糕餅點心類', 'AI生成', NULL, '粉粿');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1112', '["薑仔","生薑","乾薑","ginger root","zingiber","root ginger","粉薑","Ginger"]', '蔬菜類', 'AI生成', 'Ginger', '粉薑');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1113', '["粉豆","綠豆莢","green bean pod","string bean pod","粉豆莢"]', '豆類', 'AI生成', NULL, '粉豆莢');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1114', '["粿仔條","粿條","粿汁","kway teow noodle","rice vermicelli noodle"]', '加工調理食品及其他類', 'AI生成', NULL, '粿仔條');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1115', '["糖衣花生","甜花生仁","冰糖花生","candied peanuts","sugar-coated peanuts","糖漬花生仁","Peanut"]', '加工調理食品及其他類', 'AI生成', 'Peanut', '糖漬花生仁');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1116', '["糖水蓮子","甜蓮子","蓮子糖漬","sugar-soaked lotus seeds","sweetened lotus seeds","preserved lotus seeds","糖漬蓮子","Sugar"]', '加工調理食品及其他類', 'AI生成', 'Sugar', '糖漬蓮子');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1117', '["炒栗子","糖炒板栗","熟栗子","甜炒栗","roasted chestnuts","candied chestnuts","glazed chestnuts","糖炒栗子","Chestnut"]', '加工調理食品及其他類', 'AI生成', 'Chestnut', '糖炒栗子');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1118', '["糖霜","白糖粉","冰糖粉","powdered sugar","confectioner's sugar","icing sugar","糖粉","Sugar"]', '調味料及香辛料類', 'AI生成', 'Sugar', '糖粉');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1119', '["糖粒甜甜圈","糖包甜甜圈","炸甜甜圈","sugar-coated donut","fried sweet doughnut","glazed donut","糖粒甜甜圈(油炸)","Sugar"]', '糕餅點心類', 'AI生成', 'Sugar', '糖粒甜甜圈(油炸)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1120', '["糖衣牛奶巧","包心牛奶巧克力","代乳牛奶巧克力","almond milk chocolate","non-dairy milk chocolate","plant-based milk chocolate","糖衣牛奶巧克力","Almond milk"]', '糕餅點心類', 'AI生成', 'Almond milk', '糖衣牛奶巧克力');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1121', '["糖醋汁","甜酸醬","糖醋調料","sweet and sour sauce","caramelized vinegar syrup","sugar-vinegar sauce","糖醋醬","Sugar"]', '調味料及香辛料類', 'AI生成', 'Sugar', '糖醋醬');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1122', '["糙米","野米","Canada rice","Indian rice","water oats","糙秈米","Annual wild rice"]', '穀物類', 'AI生成', 'Annual wild rice', '糙秈米');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1123', '["糙秈米漿","野稻米漿","wild rice","Canada rice","Indian rice","water oats","Annual wild rice"]', '穀物類', 'AI生成', 'Annual wild rice', '糙秈米漿');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1124', '["糙米","糙稉","台稉71號","wild rice","Canada rice","Indian rice","water oats","糙稉米(台稉71號)","Annual wild rice"]', '穀物類', 'AI生成', 'Annual wild rice', '糙稉米(台稉71號)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1125', '["糙米","台稉9號米","wild rice","Canada rice","Indian rice","water oats","糙稉米(台稉9號)","Annual wild rice"]', '穀物類', 'AI生成', 'Annual wild rice', '糙稉米(台稉9號)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1126', '["野米","加拿大米","印度米","水燕麥","Canada rice","Indian rice","water oats","糙稉米平均值","Annual wild rice"]', '穀物類', 'AI生成', 'Annual wild rice', '糙稉米平均值');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1127', '["糙米漿","粗米漿","rough rice gruel","unpolished rice porridge","Annual wild rice"]', '加工調理食品及其他類', 'AI生成', 'Annual wild rice', '糙米漿');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1128', '["糙米","粗米粉","wild rice","Canada rice","Indian rice","water oats","糙米粉","Annual wild rice"]', '穀物類', 'AI生成', 'Annual wild rice', '糙米粉');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1129', '["糙米","雜糧麩","whole grain rice bran","wild rice (注意: 此處的'Wild Rice'並非正確的英文別名, 糙米麩與野生稻無關)","糙米麩","Annual wild rice"]', '加工調理食品及其他類', 'AI生成', 'Annual wild rice', '糙米麩');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1130', '["糙薏仁","草薏米","紅薏仁","hulled Job's tears","millet with hulls"]', '穀物類', 'AI生成', NULL, '糙薏仁');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1131', '["糯小米","小糯米","wild rice","Canada rice","Indian rice","water oats","Annual wild rice"]', '穀物類', 'AI生成', 'Annual wild rice', '糯小米');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1132', '["糯玉米","sticky corn","glutinous corn","Acorn"]', '穀物類', 'AI生成', 'Acorn', '糯玉米');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1133', '["糯稻","野米","wild rice","Canada rice","Indian rice","water oats","糯米椒","Annual wild rice"]', '蔬菜類', 'AI生成', 'Annual wild rice', '糯米椒');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1134', '["糯漿","米漿","sticky rice paste","glutinous rice slurry","糯米漿","Annual wild rice"]', '加工調理食品及其他類', 'AI生成', 'Annual wild rice', '糯米漿');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1135', '["糯米醋","Glutinous Rice Vinegar","Annual wild rice"]', '調味料及香辛料類', 'AI生成', 'Annual wild rice', '糯米醋');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1136', '["糯米飯球","糯飯團","湯圓（非甜品類）","sticky rice dumpling","glutinous rice ball","rice cake (doughy)","糯米飯糰","Annual wild rice"]', '加工調理食品及其他類', 'AI生成', 'Annual wild rice', '糯米飯糰');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1137', '["糯高粱","粘高粱","酒高粱","Glutinous Sorghum","Chinese Sorghum","Tangora Sorghum","糯高梁"]', '穀物類', 'AI生成', NULL, '糯高梁');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1138', '["紅土花生","帶殼熟花生","落花生","長生果","去皮花生","peanut","groundnut","goober","monkey nut","mandelona","紅土帶殼花生(熟)","Peanut"]', '堅果及種子類', 'AI生成', 'Peanut', '紅土帶殼花生(熟)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1139', '["紅寶石洋香瓜","紅洋香瓜","Ruby Melon","Crenshaw Melon"]', '水果類', 'AI生成', NULL, '紅寶石洋香瓜');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1140', '["紅葡萄柚","古坑葡萄柚","Ruby Grapefruit","Redblush Grapefruit","紅寶石葡萄柚(古坑)","Common grape"]', '水果類', 'AI生成', 'Common grape', '紅寶石葡萄柚(古坑)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1141', '["紅心芭樂","紅芭樂","山菍果","Red Heart Guava","Ruby Red Guava"]', '水果類', 'AI生成', NULL, '紅心芭樂');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1142', '["紅小豆","紅赤豆","紅扁大豆","red lentil","red kidney bean (注意：這不是正確的對應，僅供參考，實際上紅扁豆仁和紅芸豆或紅小豆更接近)","紅扁豆仁"]', '豆類', 'AI生成', NULL, '紅扁豆仁');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1143', '["紅橘","朱柑","mandarin orange","tangerine","紅柑"]', '水果類', 'AI生成', NULL, '紅柑');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1144', '["紅梗珍珠草","紅莖珍珠菜","紅梗珍珠菜"]', '蔬菜類', 'AI生成', NULL, '紅梗珍珠菜');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1145', '["大棗","乾棗","dried jujube","date seed","red date","紅棗(乾)"]', '水果類', 'AI生成', NULL, '紅棗(乾)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1146', '["紅毛檨","番荔枝","山竹果","rambutan","Chinese lychee","hairy lychee","紅毛丹"]', '水果類', 'AI生成', NULL, '紅毛丹');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1147', '["紅毛苔","海蘿菜","紫皮藻","nori vine","red algae","Ochtappan"]', '藻類', 'AI生成', NULL, '紅毛苔');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1148', '["紅參","火海參","red sea cucumber","fireless sea cucumber","紅海參"]', '魚貝類', 'AI生成', NULL, '紅海參');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1149', '["紅甘蔗水","紅糖甘蔗汁","red sugar cane juice","hong tang gansui zhi (Chinese name)","紅甘蔗汁"]', '水果類', 'AI生成', NULL, '紅甘蔗汁');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1150', '["紅甘蔗汁","紅糖甘蔗水","甜甘蔗汁","organic red sugarcane juice","red cane juice","sugarcane juice (organic)","紅甘蔗汁(有機,2023年取樣)"]', '水果類', 'AI生成', NULL, '紅甘蔗汁(有機,2023年取樣)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1151', '["小番茄","櫻桃番茄","洋柿子","cherry tomato","tomato berry","grape tomato","紅番茄","Cherry tomato"]', '蔬菜類', 'AI生成', 'Cherry tomato', '紅番茄');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1152', '["紅香蕉","紅皮香蕉","red skin banana","red peel banana","紅皮蕉(2004年取樣)"]', '水果類', 'AI生成', NULL, '紅皮蕉(2004年取樣)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1153', '["紅皮香蕉","紅肉蕉","Red Skin Banana","Red Banana","紅皮蕉(2012年取樣)"]', '水果類', 'AI生成', NULL, '紅皮蕉(2012年取樣)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1154', '["紅糖","砂糖","黑糖","黃砂糖","土糖","赤砂糖","brown sugar","red sugar","raw sugar","demerara sugar","turbinado sugar","紅砂糖","Sugar"]', '糖類', 'AI生成', 'Sugar', '紅砂糖');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1155', '["紅米","糯米糙米","wild rice","Canada rice","Indian rice","water oats","紅糯糙米","Annual wild rice"]', '穀物類', 'AI生成', 'Annual wild rice', '紅糯糙米');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1156', '["大紅肉李","紅肉李子","紅肉李(大)"]', '水果類', 'AI生成', NULL, '紅肉李(大)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1157', '["紅肉李","小紅肉李","red flesh plum","small red flesh plum","紅肉李(小)"]', '水果類', 'AI生成', NULL, '紅肉李(小)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1158', '["紅肉甘藷","甜薯","紫心地瓜","紅心番薯","sweet potato with red flesh","yam","red-fleshed sweet potato"]', '澱粉類', 'AI生成', NULL, '紅肉甘藷');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1159', '["紅肉鮭","大西洋鮭魚","三文魚","bay salmon","black salmon","caplin-scull salmon","fiddler","grilse","grilt","kelt","landlocked salmon","ouananiche","outside salmon","parr","Sebago salmon","silver salmon","slink","smolt","spring salmon","winnish","紅肉鮭魚切片","Atlantic salmon"]', '魚貝類', 'AI生成', 'Atlantic salmon', '紅肉鮭魚切片');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1160', '["紅椒粒","甜柿子椒粒","Cubanelle pepper","Italian frying pepper","Cuban pepper","紅胡椒粒"]', '調味料及香辛料類', 'AI生成', 'Cubanelle pepper', '紅胡椒粒');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1161', '["紅色吳郭魚","Alaska blackfish","Dallia pectoralis"]', '魚貝類', 'AI生成', 'Alaska blackfish', '紅色吳郭魚');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1162', '["紅花籽油","红花油","Safflower Oil"]', '油脂類', 'AI生成', NULL, '紅花籽油');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1163', '["紅茶(大麥)","黑茶(大麥)","紅糖茶","black tea (barley)","red tea (China)","Black tea"]', '飲料類', 'AI生成', 'Black tea', '紅茶(大麥)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1164', '["蘋果汁","紅茶蘋果味","apple tea","red tea with apple flavor","紅茶(蘋果)","Apple"]', '飲料類', 'AI生成', 'Apple', '紅茶(蘋果)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1165', '["檸檬紅茶包","紅茶檸檬包","檸檬紅茶沖泡包","lemon tea bag","tea bag with lemon flavor","紅茶沖泡包(檸檬)","Lemon"]', '飲料類', 'AI生成', 'Lemon', '紅茶沖泡包(檸檬)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1166', '["紅茶湯","黑茶水","black tea","crimson tea","紅茶茶湯","Black tea"]', '飲料類', 'AI生成', 'Black tea', '紅茶茶湯');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1167', '["酸莧菜","野莧菜","紅莧菜"]', '蔬菜類', 'AI生成', NULL, '紅莧菜');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1168', '["紅葉生菜","紫葉生菜","red leaf lettuce","russet-leaf lettuce","紅葉萵苣(荷蘭種）"]', '蔬菜類', 'AI生成', NULL, '紅葉萵苣(荷蘭種）');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1169', '["紅酒","葡萄酒","红酒","red wine","claret","burgundy","紅葡萄酒","Common grape"]', '加工調理食品及其他類', 'AI生成', 'Common grape', '紅葡萄酒');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1170', '["紅蔥頭","紅皮蔥","red onion","Spanish onion"]', '蔬菜類', 'AI生成', NULL, '紅蔥頭');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1171', '["紅色藜麥","彩色藜麥","red quinoa","colored quinoa","紅藜麥"]', '穀物類', 'AI生成', NULL, '紅藜麥');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1172', '["紅蘿蔔乾","紅絲絨面","橙絲麵","carrot noodles","carrot strips","紅蘿蔔麵","Carrot"]', '加工調理食品及其他類', 'AI生成', 'Carrot', '紅蘿蔔麵');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1173', '["紅蝦","海蝦仁","大蝦仁","red shrimp","cooked shrimp","pink shrimp","紅蝦仁","Shrimp"]', '魚貝類', 'AI生成', 'Shrimp', '紅蝦仁');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1174', '["紅蟳","花蟹","海蟶","red swimming crab","floral crab","flower crab"]', '魚貝類', 'AI生成', NULL, '紅蟳');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1175', '["赤豆","小豆","眉豆","豇豆","adzuki bean","red mung bean","crimson red bean","紅豆"]', '豆類', 'AI生成', NULL, '紅豆');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1176', '["紅豆吐司","红豆面包","red bean toast","red bean sandwich","紅豆土司"]', '糕餅點心類', 'AI生成', NULL, '紅豆土司');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1177', '["紅豆牛奶棒冰","紅豆奶冰","紅豆雪糕","red bean milk popsicle","red bean milk ice pop","紅豆牛奶冰棒","Almond milk"]', '糕餅點心類', 'AI生成', 'Almond milk', '紅豆牛奶冰棒');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1178', '["紅豆餅","紅豆圓","红豆丸子","red bean ball","red bean dumpling","紅豆球"]', '糕餅點心類', 'AI生成', NULL, '紅豆球');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1179', '["糖漬紅豆","罐頭紅豆","sweetened red bean in a can","canned sweet red beans","紅豆罐頭(糖漬)","Sugar"]', '加工調理食品及其他類', 'AI生成', 'Sugar', '紅豆罐頭(糖漬)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1180', '["紅椒","辣椒","朝天椒","番椒","red pepper","chili pepper","bell pepper","capsicum","紅辣椒平均值"]', '蔬菜類', 'AI生成', NULL, '紅辣椒平均值');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1181', '["辣椒油","紅辣油","辣椒膏","red chili oil","hot pepper oil","紅辣椒油"]', '調味料及香辛料類', 'AI生成', NULL, '紅辣椒油');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1182', '["紅醋","red vinegar","vinegar","Vinegar"]', '調味料及香辛料類', 'AI生成', 'Vinegar', '紅醋');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1183', '["紅西瓜","西瓜","watermelon","紅鈴西瓜","Watermelon"]', '水果類', 'AI生成', 'Watermelon', '紅鈴西瓜');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1184', '["紅雲豆","大紅豆","紅小豆","赤小豆","Adzuki bean","Red mung bean","Ruby red bean","紅雲豆(大紅豆)"]', '豆類', 'AI生成', NULL, '紅雲豆(大紅豆)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1185', '["紅面番鴨蛋","red-faced mandarin duck egg","Egg roll"]', '蛋類', 'AI生成', 'Egg roll', '紅面番鴨蛋');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1186', '["紅馬鈴薯","粉紅珍珠馬鈴薯","土豆","洋芋","地瓜","番薯","土番薯","山藥蛋","香芋","potato","spud","tater","murphy","Irish apple","紅馬鈴薯(粉紅珍珠馬鈴薯)","Baked potato"]', '澱粉類', 'AI生成', 'Baked potato', '紅馬鈴薯(粉紅珍珠馬鈴薯)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1187', '["紅鳳菜","紫背草","Amaranth","Chinese spinach"]', '蔬菜類', 'AI生成', NULL, '紅鳳菜');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1188', '["紅麴醃","紅曲醬","red rice yeast sauce","紅麴醬"]', '調味料及香辛料類', 'AI生成', NULL, '紅麴醬');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1189', '["紅麴麵線","紅曲麵線","紅麵線"]', '加工調理食品及其他類', 'AI生成', NULL, '紅麵線');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1190', '["紅肉火龍果","白心火龍果","白肉火龍果","紅龍果（白肉）","dragon fruit (white flesh)","pitahaya (white)","red pitahaya (white)","紅龍果(白肉)"]', '水果類', 'AI生成', NULL, '紅龍果(白肉)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1191', '["火龍果","紅心火龍果","紅肉火龍果","dragon fruit","red dragon fruit","pitaya","pitahaya","紅龍果(紅肉)"]', '水果類', 'AI生成', NULL, '紅龍果(紅肉)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1192', '["素沙茶醬","素食沙茶醬","vegetarian satay sauce","vegan satay sauce","Black tea"]', '調味料及香辛料類', 'AI生成', 'Black tea', '素沙茶醬');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1193', '["植物肉","人造肉","仿肉制品","素雞排","豆乾絲","素火腿","meat alternative","plant-based meat","veggie meat","fake meat","synthetic meat","素肉"]', '加工調理食品及其他類', 'AI生成', NULL, '素肉');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1194', '["素肉燥","素食肉燥","vegetarian meat sauce","meatless meat sauce"]', '調味料及香辛料類', 'AI生成', NULL, '素肉燥');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1195', '["素食炸醬","Vegetarian Zhajiang Sauce","Vegan Zhajiang Sauce"]', '調味料及香辛料類', 'AI生成', NULL, '素食炸醬');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1196', '["素烏醋","素食醋","vegetarian black vinegar","vegan balsamic vinegar","素食烏醋","Vinegar"]', '調味料及香辛料類', 'AI生成', 'Vinegar', '素食烏醋');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1197', '["素高湯","素食清湯","vegetarian broth","vegan stock","素食高湯"]', '調味料及香辛料類', 'AI生成', NULL, '素食高湯');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1198', '["紫薯","紫色山藥","紫山藥","purple yam","ube","dioscorea alata (variety)"]', '澱粉類', 'AI生成', NULL, '紫山藥');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1199', '["紫皮蔥","紅皮蔥","紫色大蔥","紅色大蔥","紫洋蔥","Garden onion"]', '蔬菜類', 'AI生成', 'Garden onion', '紫洋蔥');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1200', '["紫玉米","purple corn","blue maize","Acorn"]', '穀物類', 'AI生成', 'Acorn', '紫玉米');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1201', '["紫甘藍芽","紫色萵苣芽","red cabbage sprout","purple cabbage sprout"]', '蔬菜類', 'AI生成', NULL, '紫甘藍芽');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1202', '["紫米酒酿","紫糯米酒","purple glutinous rice wine","sticky purple rice ferment","紫米酒釀","Annual wild rice"]', '加工調理食品及其他類', 'AI生成', 'Annual wild rice', '紫米酒釀');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1203', '["紫色甘藍","紫甘藍","purple cabbage","red cabbage","purple kraut"]', '蔬菜類', 'AI生成', NULL, '紫色甘藍');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1204', '["紫色西蘭花","紫菜花","purple cauliflower","Italian broccoli","紫色花椰菜","Broccoli"]', '蔬菜類', 'AI生成', 'Broccoli', '紫色花椰菜');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1205', '["紫菜","海白菜","紫色海苔","nori","purple laver"]', '藻類', 'AI生成', NULL, '紫菜');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1206', '["紫蘇","香蘇","蘇葉","赤苏叶","perilla","purple perilla","green perilla","beotkkochi (Korean name)"]', '蔬菜類', 'AI生成', NULL, '紫蘇');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1207', '["細米","野生稻","wild rice","Canada rice","Indian rice","water oats","細米粉","Annual wild rice"]', '加工調理食品及其他類', 'AI生成', 'Annual wild rice', '細米粉');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1208', '["結球白菜","捲心菜","包心菜","cabbage","head cabbage","white cabbage","結球白菜平均值"]', '蔬菜類', 'AI生成', NULL, '結球白菜平均值');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1209', '["結球萵苣","包心萵苣","捲心萵苣","洋白菜","cabbage","head cabbage","white cabbage","green cabbage"]', '蔬菜類', 'AI生成', NULL, '結球萵苣');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1210', '["絲瓜","天羅長瓜","菜瓜","青籐果","ridge gourd","luffa","Chinese okra","sponge gourd"]', '蔬菜類', 'AI生成', NULL, '絲瓜');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1211', '["絲瓜花","絲瓜iflower","luffa flower","silk gourd blossom"]', '蔬菜類', 'AI生成', NULL, '絲瓜花');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1212', '["堅果穀物沖泡包","綜合谷物堅果包","mixed nuts and grains packet","nut and grain drink mix","breakfast cereal packet with nuts","綜合堅果穀物沖泡包"]', '加工調理食品及其他類', 'AI生成', NULL, '綜合堅果穀物沖泡包');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1213', '["綠絲瓜","青絲瓜","green loofah","vegetable loofah","sponge gourd","綠櫛瓜"]', '蔬菜類', 'AI生成', NULL, '綠櫛瓜');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1214', '["綠殼菜蛤","green shell clams"]', '魚貝類', 'AI生成', NULL, '綠殼菜蛤');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1215', '["綠殼菜蛤","乾菜蛤","green shell clams dried","dried green clam shells","綠殼菜蛤干"]', '魚貝類', 'AI生成', NULL, '綠殼菜蛤干');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1216', '["小番茄","櫻桃番茄","洋柿子","cherry tomato","tomato berry","grape tomato","綠番茄","Cherry tomato"]', '蔬菜類', 'AI生成', 'Cherry tomato', '綠番茄');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1217', '["蛇瓜","綠皮蛇","snake gourd","green snake cucumber","綠皮蛇瓜"]', '蔬菜類', 'AI生成', NULL, '綠皮蛇瓜');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1218', '["綠竹筍","鮮筍","嫩筍","冬筍","麻筍","bamboo shoots","bamboo sprouts","fresh bamboo shoots","young bamboo shoots","Bamboo shoots"]', '蔬菜類', 'AI生成', 'Bamboo shoots', '綠竹筍');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1219', '["綠辣椒粒","青胡椒粒","Cubanelle pepper","Italian frying pepper","Cuban pepper","綠胡椒粒"]', '調味料及香辛料類', 'AI生成', 'Cubanelle pepper', '綠胡椒粒');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1220', '["紅茶","黑茶","普洱","red tea","crimson tea","綠茶","Black tea"]', '飲料類', 'AI生成', 'Black tea', '綠茶');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1221', '["紅茶","普洱茶湯","黑茶","red tea","brick tea","smoked tea","綠茶茶湯","Black tea"]', '飲料類', 'AI生成', 'Black tea', '綠茶茶湯');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1222', '["葡萄","綠葡萄","grape","wine grape","綠葡萄平均值","Common grape"]', '水果類', 'AI生成', 'Common grape', '綠葡萄平均值');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1223', '["綠筍","青蘆筍","green asparagus","asparagus shoots","綠蘆筍"]', '蔬菜類', 'AI生成', NULL, '綠蘆筍');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1224', '["綠筍","嫩筍","green asparagus","asparagus tips","綠蘆筍(短型)"]', '蔬菜類', 'AI生成', NULL, '綠蘆筍(短型)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1225', '["綠色蘆筍","青蘆筍","green asparagus","young asparagus","綠蘆筍(細短型)"]', '蔬菜類', 'AI生成', NULL, '綠蘆筍(細短型)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1226', '["綠筍","青筍","green asparagus","asparagus greens","綠蘆筍平均值"]', '蔬菜類', 'AI生成', NULL, '綠蘆筍平均值');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1227', '["綠豆","青小豆","草豆","麻仁","碧玉豆","mung bean","moong bean","green gram","golden gram","Mung bean"]', '豆類', 'AI生成', 'Mung bean', '綠豆');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1228', '["綠豆","青小豆","緑豆粒","绿豆粒","mung bean","moong bean","green gram","golden gram","綠豆仁","Mung bean"]', '豆類', 'AI生成', 'Mung bean', '綠豆仁');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1229', '["綠豆糕","綠豆餅","綠豆椪","綠豆凸","Mung bean"]', '糕餅點心類', 'AI生成', 'Mung bean', '綠豆凸');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1230', '["綠豆餡球","綠豆丸子","綠豆圓子","豆沙球","綠豆糕（球狀）","mung bean ball","green gram dumpling","bean paste ball","綠豆球","Mung bean"]', '糕餅點心類', 'AI生成', 'Mung bean', '綠豆球');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1231', '["綠豆漿","綠豆蓉","綠豆沙","绿豆粉条","mung bean paste","moong bean flour","green gram powder","綠豆粉","Mung bean"]', '豆類', 'AI生成', 'Mung bean', '綠豆粉');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1232', '["豆芽菜","黃豆芽","青豆芽","mung bean sprouts","moong bean sprouts","綠豆芽","Mung bean"]', '蔬菜類', 'AI生成', 'Mung bean', '綠豆芽');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1233', '["維他命C口嚼錠","檸檬維生素C含片","lemon vitamin C tablet","citrus C lozenge","維生素C口含錠(檸檬)","Lemon"]', '糕餅點心類', 'AI生成', 'Lemon', '維生素C口含錠(檸檬)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1234', '["維他命飲料","營養強化飲料","保健飲料","vitamin-enriched drink","nutrient-enhanced beverage","health drink","維生素強化飲料(綜合)"]', '飲料類', 'AI生成', NULL, '維生素強化飲料(綜合)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1235', '["維生素C飲料","VC飲料","vitamin C drink","VC drink","維生素強化飲料(維生素C)"]', '飲料類', 'AI生成', NULL, '維生素強化飲料(維生素C)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1236', '["胡蘿蔔飲料","紅萝卜汁","胡萝卜营养饮料","carrot juice drink","vitamin-enriched carrot beverage","維生素強化飲料(胡蘿蔔素)","Carrot"]', '飲料類', 'AI生成', 'Carrot', '維生素強化飲料(胡蘿蔔素)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1237', '["網紋龍占魚","Alaska blackfish","Dallia"]', '魚貝類', 'AI生成', 'Alaska blackfish', '網紋龍占魚');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1238', '["綿羊肉片","柔羊片","mutton slices","lamb slices","綿羊肉切片","Lambsquarters"]', '肉類', 'AI生成', 'Lambsquarters', '綿羊肉切片');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1239', '["綿羊腹脅肉火鍋片","綿羊內臟片","羊腹肉片","mutton flap for hotpot","lamb flank slice for hot pot"]', '肉類', 'AI生成', NULL, '綿羊腹脅肉火鍋片');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1240', '["九層塔","香草","紫蘇","basil leaves","sweet basil","culinary herb","羅勒片"]', '調味料及香辛料類', 'AI生成', NULL, '羅勒片');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1241', '["羅氏沼蝦","淡水大蝦","沼澤蝦","robson's marsh shrimp","freshwater prawn","marsh shrimp","Shrimp"]', '魚貝類', 'AI生成', 'Shrimp', '羅氏沼蝦');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1242', '["羊奶片","羊奶奶酪片","sheep milk slice","ewe's milk cheese slice","羊乳片"]', '糕餅點心類', 'AI生成', NULL, '羊乳片');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1243', '["羊羹","羊餡糕","羊菓","Sheep Jelly","Yak Gan","Chinese Sweet Jelly Cake"]', '糕餅點心類', 'AI生成', NULL, '羊羹');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1244', '["羊湯爐醬","羊肉爐","lamb stew sauce","mutton hotpot sauce","羊肉爐醬","Lambsquarters"]', '調味料及香辛料類', 'AI生成', 'Lambsquarters', '羊肉爐醬');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1245', '["五爪蘋果","美國蘋果","American apple","Five-fingered apple","美國五爪蘋果","Apple"]', '水果類', 'AI生成', 'Apple', '美國五爪蘋果');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1246', '["美國葡萄","紅葡萄","American grape","Red grape","美國紅葡萄","Common grape"]', '水果類', 'AI生成', 'Common grape', '美國紅葡萄');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1247', '["美國紅葡萄","紅葡萄","American Red Grape","Red Grape","美國紅葡萄(含皮)","Common grape"]', '水果類', 'AI生成', 'Common grape', '美國紅葡萄(含皮)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1248', '["紫葡萄","紅葡萄","洋葡萄","美國葡萄","purple grape","red grape","american grape","table grape","美國紫葡萄(含皮)","Common grape"]', '水果類', 'AI生成', 'Common grape', '美國紫葡萄(含皮)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1249', '["美國青葡萄","綠葡萄","green grape","American green grape","美國綠葡萄","Common grape"]', '水果類', 'AI生成', 'Common grape', '美國綠葡萄');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1250', '["綠葡萄","美國綠葡萄","American green grape","Green table grape","美國綠葡萄(含皮)","Common grape"]', '水果類', 'AI生成', 'Common grape', '美國綠葡萄(含皮)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1251', '["美國黑葡萄","黑提","American black grape","Black seedless grape","美國黑葡萄(含皮)","Common grape"]', '水果類', 'AI生成', 'Common grape', '美國黑葡萄(含皮)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1252', '["美式咖啡","無糖咖啡","純黑咖啡","Americano","Black Coffee","Plain Coffee","美式咖啡(無糖)","Arabica coffee"]', '飲料類', 'AI生成', 'Arabica coffee', '美式咖啡(無糖)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1253', '["美濃瓜","白玉香瓜","Meinung Melon","White Perfumed Cucumber"]', '水果類', 'AI生成', NULL, '美濃瓜');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1254', '["義大利菊莖","義大利芹","Italian chicory","Cichorium endivia var. latifolia","Succory","義大利茼蒿"]', '蔬菜類', 'AI生成', NULL, '義大利茼蒿');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1255', '["藍紋乳酪","藍霉奶酪","青霉乳酪","blue cheese","gorgonzola","roquefort","stilton","義式乳酪醬","Blue cheese"]', '調味料及香辛料類', 'AI生成', 'Blue cheese', '義式乳酪醬');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1256', '["羽衣甘藍","葉甜菜","kale","curly kale","borecole","dinosaur kale","ornamental kale","羽衣甘藍(有機)"]', '蔬菜類', 'AI生成', NULL, '羽衣甘藍(有機)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1257', '["雞翅根","雞翅膀","雞翼","drumstick","wing joint","chicken wing","翅腿(肉雞)"]', '肉類', 'AI生成', NULL, '翅腿(肉雞)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1258', '["翠玉白菜","翡翠白蘿蔔","jade snow cabbage","crystal white cabbage"]', '蔬菜類', 'AI生成', NULL, '翠玉白菜');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1259', '["青蘋果","綠蘋果","翠玉蘋果","green apple","crispin","spitzenburg","翠玉青蘋果","Apple"]', '水果類', 'AI生成', 'Apple', '翠玉青蘋果');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1260', '["青蘋果","綠色蘋果","帶皮蘋果","green apple","unpeeled apple","翠玉青蘋果(帶皮)","Apple"]', '水果類', 'AI生成', 'Apple', '翠玉青蘋果(帶皮)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1261', '["翡翠李","Emerald Plum","Green Mirabelle"]', '水果類', 'AI生成', NULL, '翡翠李');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1262', '["翻車魚腹肉","翻車魨肚肉","sunfish belly meat","Mola mola belly meat","翻車魨腹肉"]', '魚貝類', 'AI生成', NULL, '翻車魨腹肉');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1263', '["翻車魨魚皮","Alaska blackfish","Dallia pectoralis"]', '魚貝類', 'AI生成', 'Alaska blackfish', '翻車魨魚皮');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1264', '["豬豆","雞豆","Cluster bean","Guadeloupe bean","翼豆"]', '豆類', 'AI生成', NULL, '翼豆');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1265', '["老薑","生薑","乾薑","姜母","山藥","山辣","ginger root","root ginger","zingiber","ginger bud","young ginger","Ginger"]', '蔬菜類', 'AI生成', 'Ginger', '老薑');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1266', '["小櫻桃番茄","拇指番茄","迷你番茄","甜聖女果","葡萄番茄","cherry tomato","tomato berry","grape tomato","vine tomato","baby plum tomato","聖女小番茄","Cherry tomato"]', '蔬菜類', 'AI生成', 'Cherry tomato', '聖女小番茄');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1267', '["聖心芒果","聖芒果","Saint Heart Mango","Holy Heart Mango","Mango"]', '水果類', 'AI生成', 'Mango', '聖心芒果');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1268', '["肉丸","肉包","糯米肉圓","湯圓","meatball","pork ball","rice meat roll","soup dumpling","肉圓"]', '加工調理食品及其他類', 'AI生成', NULL, '肉圓');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1269', '["肉桂粉","桂皮粉","cinnamon powder","cassia powder"]', '調味料及香辛料類', 'AI生成', NULL, '肉桂粉');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1270', '["肉燥","豬肉燥","五香肉燥","braised pork floss","minced meat topping","pork cracklings"]', '調味料及香辛料類', 'AI生成', NULL, '肉燥');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1271', '["肉粽","肉 Vermicelli Roll","肉包","meat rice dumpling","sticky rice with meat stuffing","rice cake with pork"]', '加工調理食品及其他類', 'AI生成', NULL, '肉粽');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1272', '["肉羹","肉丸湯","肉圓","meat jelly","meatball soup","minced meat porridge"]', '加工調理食品及其他類', 'AI生成', NULL, '肉羹');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1273', '["肉雞","大雞","肥雞","meat chicken","broiler chicken","fattened chicken"]', '肉類', 'AI生成', NULL, '肉雞');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1274', '["面包肉松","肉鬆包","meat floss bread","肉鬆麵包","Breadfruit"]', '糕餅點心類', 'AI生成', 'Breadfruit', '肉鬆麵包');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1275', '["肯特芒果","山竹芒果","Kent mango","Super mango","Queen mango","Mango"]', '水果類', 'AI生成', 'Mango', '肯特芒果');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1276', '["胚芽秈米","台中秈10號","wild rice","Canada rice","Indian rice","water oats","胚芽秈米(台中秈10號)","Annual wild rice"]', '穀物類', 'AI生成', 'Annual wild rice', '胚芽秈米(台中秈10號)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1277', '["胚芽稉米","台稉10號","wild rice","Canada rice","Indian rice","water oats","胚芽稉米(台稉10號）","Annual wild rice"]', '穀物類', 'AI生成', 'Annual wild rice', '胚芽稉米(台稉10號）');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1278', '["胚芽稉米","台稉9號","wild rice","Canada rice","Indian rice","water oats","胚芽稉米(台稉9號)","Annual wild rice"]', '穀物類', 'AI生成', 'Annual wild rice', '胚芽稉米(台稉9號)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1279', '["野米","加拿大米","印度米","水蘆穄","wild rice","Canada rice","Indian rice","water oats","胚芽稉米平均值","Annual wild rice"]', '穀物類', 'AI生成', 'Annual wild rice', '胚芽稉米平均值');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1280', '["胡瓜","露茄子","洋絲瓜","佛手瓜","luffa","smooth luffa","sponge gourd"]', '蔬菜類', 'AI生成', NULL, '胡瓜');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1281', '["紅蘿蔔","葫蘆菔","牛舌果","紅菜頭","garden carrot","European carrot","table carrot","胡蘿蔔","Carrot"]', '蔬菜類', 'AI生成', 'Carrot', '胡蘿蔔');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1282', '["紅蘿蔔","葫蘆菔","萊菔","根薺","崐山薯","gajar (Hindi)","carott (French)","mori (Japanese)","胡蘿蔔平均值","Carrot"]', '蔬菜類', 'AI生成', 'Carrot', '胡蘿蔔平均值');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1283', '["胭脂蝦","紅蝦","小龍蝦","shrimp","red shrimp","lobsterette","Shrimp"]', '魚貝類', 'AI生成', 'Shrimp', '胭脂蝦');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1284', '["脆桃","水蜜桃","油桃","candy apple","crisp peach","juicy peaches","frozen peach","stone fruit","脆桃平均值"]', '水果類', 'AI生成', NULL, '脆桃平均值');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1285', '["脫水甘藍","dehydrated kale","kale chips"]', '蔬菜類', 'AI生成', NULL, '脫水甘藍');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1286', '["草莓蘋果發酵乳","草莓蘋果汁發酵乳","脫脂濃稠發酵乳（草莓蘋果）","strawberry and apple fat-free preserved thickened fermented milk","fat-free strawberry & apple thickened fermented dairy drink","脫脂保久濃稠發酵乳(草莓&蘋果)","Apple"]', '乳品類', 'AI生成', 'Apple', '脫脂保久濃稠發酵乳(草莓&蘋果)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1287', '["低脂發酵乳","脫脂發酵乳","skimmed fermented milk","low-fat preserved fermented dairy product","脫脂保久稀釋發酵乳"]', '乳品類', 'AI生成', NULL, '脫脂保久稀釋發酵乳');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1288', '["脫脂發酵乳","低脂凝態乳","纖維強化發酵乳","fat-free cultured yogurt with fiber","low-fat set-style fermented milk with added fiber","fiber-enriched skimmed milk product","脫脂凝態發酵乳(纖維強化)"]', '乳品類', 'AI生成', NULL, '脫脂凝態發酵乳(纖維強化)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1289', '["全脂奶粉","低脂奶粉","脫脂奶粉","無脂奶粉","skim milk powder","fat-free milk powder","dried skimmed milk"]', '乳品類', 'AI生成', NULL, '脫脂奶粉');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1290', '["全脂奶粉","速溶奶粉","低脂奶粉","無脂奶粉","即沖奶粉","skim milk powder","instant milk powder","fat-free milk powder","dried skimmed milk","脫脂奶粉(即溶)"]', '乳品類', 'AI生成', NULL, '脫脂奶粉(即溶)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1291', '["脫脂強化奶粉","低脂強化奶粉","抗氧化奶粉","defatted fortified milk powder (antioxidant)","low-fat fortified milk powder","milk powder with antioxidant","脫脂強化奶粉(抗氧化)"]', '乳品類', 'AI生成', NULL, '脫脂強化奶粉(抗氧化)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1292', '["脫脂強化奶粉","低脂強化奶粉","skimmed fortified milk powder","de-fat fortified milk powder","脫脂強化奶粉(鈣&維生素A強化)"]', '乳品類', 'AI生成', NULL, '脫脂強化奶粉(鈣&維生素A強化)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1293', '["脫脂強化奶粉","低脂營養奶粉","鈣維生素強化奶粉","fat-free fortified milk powder","calcium and vitamin C&E fortified milk powder","low-fat nutrient-enriched milk powder","脫脂強化奶粉(鈣&維生素C,E強化)"]', '乳品類', 'AI生成', NULL, '脫脂強化奶粉(鈣&維生素C,E強化)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1294', '["脫脂強化奶粉","低脂強化奶粉(鈣鐵)","特種營養奶粉","defatted fortified milk powder (calcium & iron enriched)","fortified low-fat milk powder with calcium and iron","脫脂強化奶粉(鈣&鐵強化)"]', '乳品類', 'AI生成', NULL, '脫脂強化奶粉(鈣&鐵強化)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1295', '["寡醣強化鮮乳","低脂強化乳","脫脂牛奶(寡醣)","寡糖強化鮮奶","fat-free enriched milk with oligosaccharides","oligosaccharide-enriched skimmed milk","脫脂強化鮮乳(寡醣強化)"]', '乳品類', 'AI生成', NULL, '脫脂強化鮮乳(寡醣強化)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1296', '["脫脂強化鮮乳","低脂強化牛奶","補鈣牛奶","skimmed fortified milk with calcium","calcium-fortified skim milk","low-fat enriched milk with added calcium","脫脂強化鮮乳(鈣強化)"]', '乳品類', 'AI生成', NULL, '脫脂強化鮮乳(鈣強化)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1297', '["脫脂強化鮮乳","鐵強化鮮奶","defatted fortified milk with iron","iron-fortified fresh milk","脫脂強化鮮乳(鐵強化)"]', '乳品類', 'AI生成', NULL, '脫脂強化鮮乳(鐵強化)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1298', '["脫脂濃稠發酵乳","低脂濃縮酸奶","脫脂優格","fat-free thick fermented milk","low-fat concentrated yogurt","skimmed thickened yogurt"]', '乳品類', 'AI生成', NULL, '脫脂濃稠發酵乳');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1299', '["低脂濃稠發酵乳","減肥癡乳飲","脫脂酸乳","低熱量發酵乳","fat-free thickened fermented milk","low calorie yogurt","reduced fat acidified milk","lean sour cream","脫脂濃稠發酵乳(低熱量)"]', '乳品類', 'AI生成', NULL, '脫脂濃稠發酵乳(低熱量)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1300', '["發酵乳","濃稠乳","啤酒酵母乳","fermented milk","thickened milk","brewer's yeast milk","脫脂濃稠發酵乳(啤酒酵母)","Beer"]', '乳品類', 'AI生成', 'Beer', '脫脂濃稠發酵乳(啤酒酵母)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1301', '["草莓發酵乳","低脂草莓優格","濃稠草莓乳飲","Strawberry Yogurt Drink","Fat-Free Strawberry Yoghurt","Thickened Strawberry Milk Beverage","脫脂濃稠發酵乳(草莓)","Strawberry"]', '乳品類', 'AI生成', 'Strawberry', '脫脂濃稠發酵乳(草莓)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1302', '["脫脂稀釋發酵乳","低脂發酵乳","稀釋發酵牛奶","fat-free diluted fermented milk","low-fat fermented milk","diluted yogurt","thin yogurt"]', '乳品類', 'AI生成', NULL, '脫脂稀釋發酵乳');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1303', '["脫脂發酵乳","低脂發酵乳","鈣補充乳製品","skimmed diluted fermented milk","low-fat fermented milk","calcium fortified dairy product","脫脂稀釋發酵乳(鈣強化)"]', '乳品類', 'AI生成', NULL, '脫脂稀釋發酵乳(鈣強化)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1304', '["西冷牛排","沙珞克牛排","sirloin steak","sirloin","腓力牛排"]', '肉類', 'AI生成', NULL, '腓力牛排');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1305', '["腰果仁","果巴","樹生果","caju","cashew nut","groundnut","腰果(生)","Cashew nut"]', '堅果及種子類', 'AI生成', 'Cashew nut', '腰果(生)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1306', '["豬肝","豬膽肝","pig liver with gallbladder","liver and gallbladder","膽肝"]', '加工調理食品及其他類', 'AI生成', NULL, '膽肝');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1307', '["五花肉","臘豬肉","臘肉条","熏肉","preserved pork belly","smoked meat","salted pork","臘肉(五花肉)"]', '加工調理食品及其他類', 'AI生成', NULL, '臘肉(五花肉)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1308', '["臘肉","咸腿","腌腿","腊肠（注意這是指腸類而非腿部，但可能與其混淆）","煙肉","salted pork","smoked ham","preserved meat","cured leg meat","jinhua ham (if referring to a specific variety)","臘肉(腿肉)"]', '加工調理食品及其他類', 'AI生成', NULL, '臘肉(腿肉)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1309', '["馬騮鰆","馬加丁","馬甲鯻","mackerel scad","scale croaker","round scad","臺灣馬加鰆"]', '魚貝類', 'AI生成', NULL, '臺灣馬加鰆');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1310', '["舞菇","dancing mushroom","Dance Mushroom"]', '菇類', 'AI生成', NULL, '舞菇');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1311', '["芋頭餅","芋圓餅","芋泥餅","taro pie","taro cake","yam pie","yam cake","芋仔餅"]', '糕餅點心類', 'AI生成', NULL, '芋仔餅');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1312', '["芋仔圓","紫地瓜圓","黑糖芋圓","芋圓"]', '加工調理食品及其他類', 'AI生成', NULL, '芋圓');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1313', '["芋心甘藷","芋頭薯","芋仔","potato with taro heart","taro-heart potato","sweet potato with taro center"]', '澱粉類', 'AI生成', NULL, '芋心甘藷');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1314', '["大頭菜","芋頭莖","蔥姜薯","扁食莖","芋莖"]', '蔬菜類', 'AI生成', NULL, '芋莖');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1315', '["芋頭","芋仔","香芋","芭蕉芋","糯米芋","大薯","番芋","potato","spud","tater","Irish potato","Idaho potato"]', '澱粉類', 'AI生成', NULL, '芋頭');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1316', '["芋頭粉","芋泥粉","taro flour"]', '澱粉類', 'AI生成', NULL, '芋頭粉');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1317', '["芋頭包","芋饅頭","芋頭包子","芋頭饅頭"]', '加工調理食品及其他類', 'AI生成', NULL, '芋頭饅頭');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1318', '["芒果乾","芒果捲","干芒果","風乾芒果","dried mango","sun-dried mango","mango chips","Mango"]', '水果類', 'AI生成', 'Mango', '芒果乾');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1319', '["芒果","黃金果","mango","mango fruit","apple of the tropics","芒果平均值(新興種)","Mango"]', '水果類', 'AI生成', 'Mango', '芒果平均值(新興種)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1320', '["芒果","馬果","金煌芒","mango","apple of paradise","mangotin","芒果平均值(西洋種)","Mango"]', '水果類', 'AI生成', 'Mango', '芒果平均值(西洋種)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1321', '["芒果青","mango","mango fruit","Indian mango","common mango","Mango"]', '糕餅點心類', 'AI生成', 'Mango', '芒果青');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1322', '["芝麻糊","芝麻沖泡粉","芝麻調和包","sesame paste powder","sesame pudding mix","instant sesame porridge packet","芝麻糊沖泡包","Sesame"]', '加工調理食品及其他類', 'AI生成', 'Sesame', '芝麻糊沖泡包');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1323', '["雞頭米","蔲子","蔘薊實","蔳","蔿子","Euryale ferox seed","Chinese water chestnut seed","芡實"]', '堅果及種子類', 'AI生成', NULL, '芡實');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1324', '["芥花油","甘藍菜籽油","加拿大芥花籽油","canola oil","rapeseed oil"]', '油脂類', 'AI生成', NULL, '芥花油');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1325', '["蕎菜","油白菜","芥蘭菜","小葉芥菜","mustard greens","Chinese mustard","mustard vegetable","芥菜"]', '蔬菜類', 'AI生成', NULL, '芥菜');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1326', '["大頭菜","雪里紅","mustard greens","Chinese mustard","芥菜平均值"]', '蔬菜類', 'AI生成', NULL, '芥菜平均值');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1327', '["芥藍苗","小棠菜","Chinese broccoli sprouts","Kai-lan sprouts","芥藍芽"]', '蔬菜類', 'AI生成', NULL, '芥藍芽');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1328', '["芥蘭","雞花菜","Chinese broccoli","Gai lan","芥藍菜"]', '蔬菜類', 'AI生成', NULL, '芥藍菜');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1329', '["香菜","韃靼菜","癢菜","coriander","Chinese parsley","cilantro","芫荽"]', '蔬菜類', 'AI生成', NULL, '芫荽');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1330', '["芭樂平均值","白肉蘋果","Star Apple White Flesh","Apple Star with White Meat","芭樂平均值(白肉)"]', '水果類', 'AI生成', NULL, '芭樂平均值(白肉)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1331', '["芭樂乾","番石榴果乾","papaya fruit roll","pawpaw jerky","papaya slice","芭樂果乾"]', '糕餅點心類', 'AI生成', NULL, '芭樂果乾');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1332', '["百浪果汁","番石榴汁","芭樂飲","guava juice","gooseberry punch","java plum drink","芭樂汁(非原汁)"]', '飲料類', 'AI生成', NULL, '芭樂汁(非原汁)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1333', '["花尾唇指翁","翁加魚邊","Alaska blackfish","Dallia pectoralis","花尾唇指翁(翁加魚邊) "]', '魚貝類', 'AI生成', 'Alaska blackfish', '花尾唇指翁(翁加魚邊) ');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1334', '["花捲","花卷","flower roll"]', '加工調理食品及其他類', 'AI生成', NULL, '花捲');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1335', '["花椒面","紅花椒粉","麻椒粉","Sichuan pepper powder","Hua jiao powder","Flower pepper powder","花椒粉"]', '調味料及香辛料類', 'AI生成', NULL, '花椒粉');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1336', '["花椒籽","大椒粒","山椒粒","Sichuan pepper grain","Hua jiao zi","花椒粒"]', '調味料及香辛料類', 'AI生成', NULL, '花椒粒');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1337', '["花菜","椰菜花","青花菜","Broccolini","calabrese","sprouting broccoli","花椰菜","Broccoli"]', '蔬菜類', 'AI生成', 'Broccoli', '花椰菜');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1338', '["西蘭花","青花菜","broccoli","calabrese","花椰菜乾","Broccoli"]', '蔬菜類', 'AI生成', 'Broccoli', '花椰菜乾');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1339', '["花瓜","洋絲瓜","squash in syrup","canned loofah squash","sugar-coated luffa","sweetened gourd","花瓜罐頭"]', '加工調理食品及其他類', 'AI生成', NULL, '花瓜罐頭');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1340', '["花生湯圓","花生糖水","花生糊","紅豆花生湯","花生仁湯","Peanut"]', '糕餅點心類', 'AI生成', 'Peanut', '花生仁湯');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1341', '["花生油","落花生油","生果油","peanut oil","groundnut oil","arachis oil","Peanut oil"]', '油脂類', 'AI生成', 'Peanut oil', '花生油');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1342', '["花生奶巧克力","花生牛奶糖","peanut milk chocolate","nutty almond milk chocolate","花生牛奶巧克力","Almond milk"]', '糕餅點心類', 'AI生成', 'Almond milk', '花生牛奶巧克力');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1343', '["花生泥","花生醬粉","落花生粉","peanut butter powder","ground peanuts","goobers flour","花生粉","Peanut"]', '堅果及種子類', 'AI生成', 'Peanut', '花生粉');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1344', '["花生酥","花生甜","落花生糖","地豆糖","peanut candy","groundnut sugar","花生糖","Peanut"]', '糕餅點心類', 'AI生成', 'Peanut', '花生糖');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1345', '["花生糖","花生酥","麻荖","薄蝦仁","peanut candy","peanut sweet","tangerine peel peanut sugar cake","bushukan","花生貢糖","Peanut"]', '糕餅點心類', 'AI生成', 'Peanut', '花生貢糖');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1346', '["花生泥","花生脂","花生搗碎","peanut butter","goober paste","groundnut spread","花生醬","Peanut"]', '調味料及香辛料類', 'AI生成', 'Peanut', '花生醬');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1347', '["花生泥筍","炸花生麵筋","罐頭花生麩","花生麩絲","peanut glutinous rice in can","canned peanut gluten","glutinous peanut jelly","花生麵筋罐頭","Peanut"]', '加工調理食品及其他類', 'AI生成', 'Peanut', '花生麵筋罐頭');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1348', '["花胡瓜","黃瓜","sliced cucumber","cucumber slices","花胡瓜(有機)"]', '蔬菜類', 'AI生成', NULL, '花胡瓜(有機)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1349', '["花腹鯖","Red Mackerel","Crimson Bream"]', '魚貝類', 'AI生成', NULL, '花腹鯖');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1350', '["花菇","金緣香菇","Flower Mushroom","Golden-edge Mushroom"]', '菇類', 'AI生成', NULL, '花菇');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1351', '["蒲瓜","花蒲瓜","loofah","luffa gourd","vegetable gourd","花蒲瓜(圓形)"]', '蔬菜類', 'AI生成', NULL, '花蒲瓜(圓形)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1352', '["花豆","落花生","花生","peanut","groundnut"]', '豆類', 'AI生成', NULL, '花豆');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1353', '["糖水花豆","蜜漬花豆","sugar-preserved flower beans","sweetened waxed beans in a can","花豆罐頭(糖漬)","Sugar"]', '加工調理食品及其他類', 'AI生成', 'Sugar', '花豆罐頭(糖漬)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1354', '["花身副麗魚","Alaska blackfish","Dallia pectoralis"]', '魚貝類', 'AI生成', 'Alaska blackfish', '花身副麗魚');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1355', '["花身鯻","striped red snapper","red striped snapper"]', '魚貝類', 'AI生成', NULL, '花身鯻');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1356', '["旱芹","藥芹","Chinese celery","Asian celery","芹菜","Celery leaves"]', '蔬菜類', 'AI生成', 'Celery leaves', '芹菜');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1357', '["旱芹","水芹","Chinese celery","cutting celery","芹菜(青梗)","Celery leaves"]', '蔬菜類', 'AI生成', 'Celery leaves', '芹菜(青梗)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1358', '["西芹","香芹","Chinese celery","Asian celery","芹菜平均值","Celery leaves"]', '蔬菜類', 'AI生成', 'Celery leaves', '芹菜平均值');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1359', '["苜蓿苗","草仔","sprouted alfalfa","alfalfa sprouts","苜蓿芽"]', '蔬菜類', 'AI生成', NULL, '苜蓿芽');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1360', '["苦味瓜","清熱菜","涼瓜","訶子","癞葡萄","亞郎瓜","bitter gourd","balsam pear","goya","karela","苦瓜(白皮)"]', '蔬菜類', 'AI生成', NULL, '苦瓜(白皮)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1361', '["苦味瓜","亞士瓜","青角瓜","結瓜","bitter gourd","balsam pear","goya","melon of sorrow","苦瓜(青皮)"]', '蔬菜類', 'AI生成', NULL, '苦瓜(青皮)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1362', '["苦茶糖","黑茶糖果","Black tea candy","Dark tea sweet","Black tea"]', '糕餅點心類', 'AI生成', 'Black tea', '苦茶糖');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1363', '["茂汶柑","華隆柑","茂谷柑"]', '水果類', 'AI生成', NULL, '茂谷柑');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1364', '["副葉鰺","paratrange mullet","范氏副葉鰺"]', '魚貝類', 'AI生成', NULL, '范氏副葉鰺');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1365', '["鯖魚罐頭","茄汁鯖","mackerel in tomato sauce","Atlantic mackerel in can","茄汁鯖魚罐頭","Atlantic mackerel"]', '加工調理食品及其他類', 'AI生成', 'Atlantic mackerel', '茄汁鯖魚罐頭');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1366', '["茉莉花茶","香片","Jasmine tea","Black tea"]', '飲料類', 'AI生成', 'Black tea', '茉莉花茶');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1367', '["茉莉花茶飲","茉莉紅茶湯","jasmine black tea drink","jasmine red tea beverage","茉莉花茶湯","Black tea"]', '飲料類', 'AI生成', 'Black tea', '茉莉花茶湯');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1368', '["茭白","菰白","高瓜","高笋","Chinese Water Bamboo Shoots","White Canna Shoots","Water Banana","茭白筍"]', '蔬菜類', 'AI生成', NULL, '茭白筍');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1369', '["蘿蔥","小茴香","Chinese celery","Fennel (注意: 諾香味的茴香與本題蔬菜類的茴香不同)","茴香"]', '蔬菜類', 'AI生成', NULL, '茴香');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1370', '["茶葉蛋","鹹蛋","tea leaf egg","preserved egg","茶葉蛋(市售)","Egg roll"]', '蛋類', 'AI生成', 'Egg roll', '茶葉蛋(市售)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1371', '["隔夜蛋","茶熏蛋","茶葉蛋(浸泡隔夜)","Egg roll"]', '蛋類', 'AI生成', 'Egg roll', '茶葉蛋(浸泡隔夜)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1372', '["茶葉蛋","Tea Egg","茶葉蛋平均值","Egg roll"]', '蛋類', 'AI生成', 'Egg roll', '茶葉蛋平均值');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1373', '["茶葉蛋白","tea leaf protein","茶葉蛋白(浸泡隔夜)","Egg roll"]', '蛋類', 'AI生成', 'Egg roll', '茶葉蛋白(浸泡隔夜)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1374', '["茶葉蛋","tea egg","茶葉蛋黃(浸泡隔夜)","Egg roll"]', '蛋類', 'AI生成', 'Egg roll', '茶葉蛋黃(浸泡隔夜)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1375', '["茶熏鵝","黑茶鵝","black tea duck","smoked tea goose","茶鵝","Black tea"]', '加工調理食品及其他類', 'AI生成', 'Black tea', '茶鵝');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1376', '["蓬蒿","桐蒿","苦菜","鳳蓍","野艾","marsh mallow","cranesbill","mallow","茼蒿"]', '蔬菜類', 'AI生成', NULL, '茼蒿');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1377', '["草蝦","野蝦","grass shrimp","prawnlet","草對蝦","Shrimp"]', '魚貝類', 'AI生成', 'Shrimp', '草對蝦');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1378', '["草石蠶","grass stone worm"]', '蔬菜類', 'AI生成', NULL, '草石蠶');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1379', '["草脭","紅莓","草莓","Strawberry"]', '水果類', 'AI生成', 'Strawberry', '草莓');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1380', '["草莓醬","草莓果凍","strawberry jam","strawberry jelly","草莓果醬","Strawberry"]', '調味料及香辛料類', 'AI生成', 'Strawberry', '草莓果醬');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1381', '["草菌","草菰","草原菇","straw mushroom","volvariella","rice straw mushroom","草菇"]', '菇類', 'AI生成', NULL, '草菇');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1382', '["草菇罐頭","herb mushroom in can","packed herb mushrooms"]', '加工調理食品及其他類', 'AI生成', NULL, '草菇罐頭');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1383', '["蝦仁","海蝦仁","草蝦","shrimp","sea shrimp","prawn","草蝦仁","Shrimp"]', '魚貝類', 'AI生成', 'Shrimp', '草蝦仁');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1384', '["草魚","鯝魚","Alaska blackfish","Dallia pectoralis","草魚(含皮)"]', '魚貝類', 'AI生成', 'Alaska blackfish', '草魚(含皮)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1385', '["草魚","Alaska blackfish","Dallia pectoralis","草魚切片"]', '魚貝類', 'AI生成', 'Alaska blackfish', '草魚切片');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1386', '["荔枝","lychee","荔枝平均值"]', '水果類', 'AI生成', NULL, '荔枝平均值');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1387', '["豆蔻粉","荳鉤 Powder","Cardamom Powder","Indian Cardamom Powder","荳蔻粉"]', '調味料及香辛料類', 'AI生成', NULL, '荳蔻粉');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1388', '["水煮蛋","白煮蛋","boiled egg","soft-boiled egg","荷包蛋(不加油)","Egg roll"]', '蛋類', 'AI生成', 'Egg roll', '荷包蛋(不加油)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1389', '["荷包蛋","煎蛋卷","egg roll","fried egg roll","荷包蛋(加油1小匙)","Egg roll"]', '蛋類', 'AI生成', 'Egg roll', '荷包蛋(加油1小匙)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1390', '["荷葉包心白菜","荷葉小包菜","荷葉白菜"]', '蔬菜類', 'AI生成', NULL, '荷葉白菜');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1391', '["菜心","豌豆苗","snow pea shoots","Chinese snow peas","荷蘭豆菜心"]', '蔬菜類', 'AI生成', NULL, '荷蘭豆菜心');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1392', '["水芋頭","水馬鈴薯","蕎薺","蕎菜","water chestnut","Chinese water chestnut","荸薺"]', '澱粉類', 'AI生成', NULL, '荸薺');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1393', '["荸薺粉","馬蹄粉","tapioca starch","cassava starch","boba powder"]', '澱粉類', 'AI生成', NULL, '荸薺粉');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1394', '["莫三比克口孵非鯽","Mozambique Mouth-Breeding Mudfish","Boulenger's mouthbreeder","Spotted mud eel"]', '魚貝類', 'AI生成', NULL, '莫三比克口孵非鯽');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1395', '["菊花南瓜","菊芋南瓜","日本南瓜","Japanese pumpkin","kabocha squash","winter melon squash"]', '蔬菜類', 'AI生成', 'Japanese pumpkin', '菊花南瓜');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1396', '["菊花凈","黃花茶","Chrysanthemum tea","Ju Hua Tea","菊花茶","Black tea"]', '飲料類', 'AI生成', 'Black tea', '菊花茶');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1397', '["菠薐菜","赤根菜","Malabar spinach","Climbing spinach","Red vine spinach","Indian spinach","Asian Spinach","菠菜"]', '蔬菜類', 'AI生成', 'Malabar spinach', '菠菜');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1398', '["木耳菜","碧瑤菜","Malabar spinach","Red vine spinach","Creeping spinach","Climbing spinach","Indian spinach","Philippine Spinach","Asian Spinach","菠菜(葉)(有機)"]', '蔬菜類', 'AI生成', 'Malabar spinach', '菠菜(葉)(有機)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1399', '["夏荔菜","紅秋葵","紫背天葵","爬蔓菠菜","Malabar spinach","Creeping spinach","Climbing spinach","Indian spinach","Philippine Spinach","Asian Spinach","Phooi leaf","Red vine spinach","菠菜麵"]', '加工調理食品及其他類', 'AI生成', 'Malabar spinach', '菠菜麵');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1400', '["鳳梨蜜","木菠蘿","番荔枝","棲皮","pineapple fruit","cotton candy fruit","custard apple","rambutan","菠蘿蜜"]', '水果類', 'AI生成', NULL, '菠蘿蜜');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1401', '["大確かにんぐ","菠蘿包","pineapple bun","pineapple roll","菠蘿麵包","Breadfruit"]', '糕餅點心類', 'AI生成', 'Breadfruit', '菠蘿麵包');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1402', '["花蓮西瓜","華寶西瓜","大西瓜","watermelon","seedless watermelon","citrullus lanatus","華寶大西瓜(花蓮)","Watermelon"]', '水果類', 'AI生成', 'Watermelon', '華寶大西瓜(花蓮)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1403', '["華翠菇","綠色蘑菇","Huacui Mushroom","Green Oyster Mushroom"]', '菇類', 'AI生成', NULL, '華翠菇');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1404', '["菱角","水菱角","秋菱","water caltrop","giant salvinia","European water chestnut","菱角(熟)"]', '澱粉類', 'AI生成', NULL, '菱角(熟)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1405', '["菱角","芰實","水栗","雞頭米","water caltrop","giant salvinia (note: this is a similar plant, not the same as water caltrops)","fragrant lotus seed","菱角(生)"]', '澱粉類', 'AI生成', NULL, '菱角(生)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1406', '["菱角","芰實","water caltrop seed","garden loofah seed","trapa seed","菱角仁(生)"]', '澱粉類', 'AI生成', NULL, '菱角仁(生)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1407', '["菱角牛奶甘藷","Almond milk sweet potato","Almond milk taro","Almond milk"]', '澱粉類', 'AI生成', 'Almond milk', '菱角牛奶甘藷');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1408', '["菲律賓簾蛤","Philippine curtain clam","Curved Philippine ark shell"]', '魚貝類', 'AI生成', NULL, '菲律賓簾蛤');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1409', '["莙荙菜","甜菜","葉甜菜","beet leaf","spinach beet","Swiss chard","菾菜"]', '蔬菜類', 'AI生成', NULL, '菾菜');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1410', '["金桔","西印度酸橙","Key lime","West Indian lime","bartender's lime","Omani lime","Mexican lime","萊姆","Lime"]', '水果類', 'AI生成', 'Lime', '萊姆');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1411', '["西印度檸檬","關鍵檸檬","Key lime","West Indian lime","bartender's lime","Omani lime","Mexican lime","萊姆汁","Lime"]', '水果類', 'AI生成', 'Lime', '萊姆汁');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1412', '["去膜萊豆仁","脫皮萊豆","skinless broad bean","broad beans without skin","萊豆仁(去膜)"]', '豆類', 'AI生成', NULL, '萊豆仁(去膜)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1413', '["綠豆仁","帶膜萊豆仁","萊豆仁(帶膜)"]', '豆類', 'AI生成', NULL, '萊豆仁(帶膜)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1414', '["藤菜","藤葵","紫莢","紅舌子","胭脂菜","Jew's mallow","Red spinach","Goosefoot","Winter purslane","落葵"]', '蔬菜類', 'AI生成', NULL, '落葵');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1415', '["葉唇笛鯛","leaflip pipefish","shepherd's needle fish"]', '魚貝類', 'AI生成', NULL, '葉唇笛鯛');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1416', '["葛根米","仙草米","葛仙米藻","Annual wild rice"]', '藻類', 'AI生成', 'Annual wild rice', '葛仙米藻');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1417', '["葡萄乾","西梅子","raisin","dried grape","Common grape"]', '水果類', 'AI生成', 'Common grape', '葡萄乾');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1418', '["葡萄乾奶酥包","葡萄乾奶酪面包","Raisin and Cream Cheese Bread","Dried Grape and Cheese Roll","葡萄乾奶酥麵包","Common grape"]', '糕餅點心類', 'AI生成', 'Common grape', '葡萄乾奶酥麵包');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1419', '["葡萄醬","葡萄蜜餞","grape jelly","grape jam","葡萄果醬","Common grape"]', '調味料及香辛料類', 'AI生成', 'Common grape', '葡萄果醬');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1420', '["葡萄柚汁","西柚汁","grapefruit juice","pomelo-grape juice","shaddock-grape juice","葡萄柚汁(非原汁)","Common grape"]', '飲料類', 'AI生成', 'Common grape', '葡萄柚汁(非原汁)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1421', '["葡萄籽植物油","葡萄酒種子油","grape seed oil","wine seed oil","葡萄籽油","Common grape"]', '油脂類', 'AI生成', 'Common grape', '葡萄籽油');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1422', '["瓠瓜","蒲瓜","甜瓜","瓠子","luffa gourd","Chinese okra","sponge gourd","smooth luffa","葫蘆瓜"]', '蔬菜類', 'AI生成', NULL, '葫蘆瓜');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1423', '["葵扇白菜","sunflower leaf mustard","bitter cress"]', '蔬菜類', 'AI生成', NULL, '葵扇白菜');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1424', '["葵花籽油","向日葵籽油","sunflower seed oil"]', '油脂類', 'AI生成', NULL, '葵花籽油');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1425', '["葵花籽植物油","強化維生素葵花籽油","vitamin-enriched sunflower oil","葵花籽油(多種維生素強化)"]', '油脂類', 'AI生成', NULL, '葵花籽油(多種維生素強化)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1426', '["葵花苗","向日葵芽","sunflower sprout","baby sunflower shoots","葵花芽"]', '蔬菜類', 'AI生成', NULL, '葵花芽');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1427', '["蒜香扁桃仁","大蒜味扁桃仁","Garlic Almond","Flavored Almonds with Garlic","蒜味甘扁桃仁"]', '加工調理食品及其他類', 'AI生成', NULL, '蒜味甘扁桃仁');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1428', '["蒜蓉豆豉醬","蒜泥豆豉酱","garlic and fermented black bean sauce","蒜味豆豉醬"]', '調味料及香辛料類', 'AI生成', NULL, '蒜味豆豉醬');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1429', '["蒜末","大蒜粉","garlic powder","ground garlic","蒜粉"]', '調味料及香辛料類', 'AI生成', NULL, '蒜粉');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1430', '["蒜仔","蒜草","青蒜","大蒜苗","garlic sprout","green garlic","spring onion (closer to the truth but not exactly, as it's often confused with scallion)","蒜苗"]', '蔬菜類', 'AI生成', NULL, '蒜苗');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1431', '["蒜蓉醬","蒜泥醬","garlic paste","minced garlic sauce"]', '調味料及香辛料類', 'AI生成', NULL, '蒜蓉醬');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1432', '["蒜酥","炸蒜","crispy garlic","fried garlic chips","蒜頭酥"]', '調味料及香辛料類', 'AI生成', NULL, '蒜頭酥');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1433', '["寒天粉","涼粉","Konnyaku jelly powder","Devil's tongue starch powder","蒟蒻粉"]', '澱粉類', 'AI生成', NULL, '蒟蒻粉');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1434', '["蒟蒻香腸","蒟蒻灌腸","魔芋香腸","konjac sausage","garlic konjac sausage","蒟蒻香腸(蒜味)","Sausage"]', '加工調理食品及其他類', 'AI生成', 'Sausage', '蒟蒻香腸(蒜味)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1435', '["蒲瓜","圓蒲瓜","round loofah","gourd","蒲瓜(圓形)"]', '蔬菜類', 'AI生成', NULL, '蒲瓜(圓形)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1436', '["蒲瓜","蛇瓜","涼瓜","cucumber gourd","snake gourd","luffa","蒲瓜(長形)"]', '蔬菜類', 'AI生成', NULL, '蒲瓜(長形)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1437', '["蒲瓜","luffa","vegetable gourd","Chinese okra","蒲瓜平均值"]', '蔬菜類', 'AI生成', NULL, '蒲瓜平均值');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1438', '["五香蒸肉粉","調味蒸肉粉","Five-spice meat powder","Seasoned pork powder","蒸肉粉(五香)"]', '調味料及香辛料類', 'AI生成', NULL, '蒸肉粉(五香)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1439', '["蒸蛋","水蒸蛋","滑蛋","steamed egg","egg custard","蒸蛋(市售)","Egg roll"]', '蛋類', 'AI生成', 'Egg roll', '蒸蛋(市售)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1440', '["蒸蛋","水波蛋","滑蛋","Steamed Egg","Water Ripple Eggs","Silky Egg Custard","蒸蛋(微波爐)","Egg roll"]', '蛋類', 'AI生成', 'Egg roll', '蒸蛋(微波爐)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1441', '["蒸蛋","水蒸蛋","電鍋蛋","Steamed Egg","Egg Pudding","Chinese Steamed Egg","蒸蛋(電鍋)","Egg roll"]', '蛋類', 'AI生成', 'Egg roll', '蒸蛋(電鍋)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1442', '["蒸餃","煎蛋卷","炸春捲","spring roll","Chinese spring roll","fried roll","蒸蛋平均值","Egg roll"]', '蛋類', 'AI生成', 'Egg roll', '蒸蛋平均值');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1443', '["蓮肉","蓮心","水紅豆","lotus seed","蓮子"]', '堅果及種子類', 'AI生成', NULL, '蓮子');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1444', '["蓮肉","蓮子心","蓮米","lotus seed","sunset yellow seeds","heavenly fruit seeds","蓮子(乾)"]', '堅果及種子類', 'AI生成', NULL, '蓮子(乾)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1445', '["蓮霧芒果","紅 mango","Lotus Mango","Lychee Mango","蓮花芒果","Mango"]', '水果類', 'AI生成', 'Mango', '蓮花芒果');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1446', '["蓮根","藕節","水芋","六月霜","lotus root","stem lotus","konjak stem","oriental potato","蓮藕"]', '澱粉類', 'AI生成', NULL, '蓮藕');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1447', '["蓮藕粉","蓮根粉","藕粉","Lotus Root Powder","Elioval Lotus Starch"]', '澱粉類', 'AI生成', NULL, '蓮藕粉');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1448', '["蓮藕糖","蓮根糖","Lotus Root Candy","Sweet Lotus Root Cake","Sugar"]', '糕餅點心類', 'AI生成', 'Sugar', '蓮藕糖');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1449', '["紅寶石","蓮霧果","鳳花梨","火球果","Dragonfruit","Pitahaya","Red Pitahaya","Phoenix fruit","蓮霧(紅寶石)"]', '水果類', 'AI生成', NULL, '蓮霧(紅寶石)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1450', '["黑珍珠","蓮霧果","black pearl lychee","lychee","蓮霧(黑珍珠)"]', '水果類', 'AI生成', NULL, '蓮霧(黑珍珠)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1451', '["黑金剛","蓮霧","lianwu","black diamond luanwu","蓮霧(黑金剛)"]', '水果類', 'AI生成', NULL, '蓮霧(黑金剛)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1452', '["桑葚荔枝","胭脂果","水蜜桃","Java apple","Love's egg","Watermelon pear","蓮霧平均值(粉紅色種)"]', '水果類', 'AI生成', NULL, '蓮霧平均值(粉紅色種)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1453', '["蔓越莓飲料","蔓越莓果汁","蔓越莓調味汁","cranberry drink","cranberry flavored juice","cranberry beverage","蔓越莓汁(非原汁)"]', '飲料類', 'AI生成', NULL, '蔓越莓汁(非原汁)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1454', '["藺鬚","藲草","蔘鬚"]', '蔬菜類', 'AI生成', NULL, '蔘鬚');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1455', '["蔥油薄餅","蔥油餅仔","Scallion oil pancake","蔥油餅"]', '加工調理食品及其他類', 'AI生成', NULL, '蔥油餅');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1456', '["蔥蓉","蔥泥","scallion sauce","green onion paste","蔥醬"]', '調味料及香辛料類', 'AI生成', NULL, '蔥醬');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1457', '["番茄汁","西红柿汁","番茄飲料","西红柿飲料","tomato juice","blended tomato juice","mixed tomato juice","蕃茄汁(非原汁)"]', '飲料類', 'AI生成', NULL, '蕃茄汁(非原汁)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1458', '["番茄意面醬","義大利麵蕃茄醬","番茄肉醬","tomato pasta sauce","spaghetti sauce","bolognese sauce (without meat)","蕃茄義大利麵醬","Other pasta dish"]', '調味料及香辛料類', 'AI生成', 'Other pasta dish', '蕃茄義大利麵醬');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1459', '["番茄醬","紅色醬料","茄醬","ketchup","red sauce","tomato sauce","蕃茄醬"]', '調味料及香辛料類', 'AI生成', NULL, '蕃茄醬');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1460', '["蕃薯餅","地瓜餅","紅薯餅","芋頭餅","山藥糕","sweet potato cake","yam pie","candied sweet potato snack"]', '糕餅點心類', 'AI生成', NULL, '蕃薯餅');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1461', '["苦蕎","荍麥","燕麦（注意：這里需要注意的是，雖然在某些方言中「蕎麥」可能會被誤稱為「燕麦」，但實際上這是兩個不同的作物）","buckwheat","kasha","蕎麥(甜蕎)"]', '穀物類', 'AI生成', NULL, '蕎麥(甜蕎)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1462', '["蕎麥芽","buckwheat sprout"]', '蔬菜類', 'AI生成', NULL, '蕎麥芽');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1463', '["蕎麥乾麵","薺麦面","野麦干面","buckwheat noodles (dry)","soba noodles (dried)","蕎麥麵(乾)"]', '加工調理食品及其他類', 'AI生成', NULL, '蕎麥麵(乾)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1464', '["蕎麥 noodles","苦蕎麵","蕎麥冷麵","buckwheat noodles","soba","蕎麥麵(濕)"]', '加工調理食品及其他類', 'AI生成', NULL, '蕎麥麵(濕)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1465', '["蕹菜","空心菜","ong choy","water spinach","蕹菜(土植)(10月取樣)"]', '蔬菜類', 'AI生成', NULL, '蕹菜(土植)(10月取樣)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1466', '["蕹菜","空心菜","ong choy","water spinach","蕹菜(土植)(1月取樣)"]', '蔬菜類', 'AI生成', NULL, '蕹菜(土植)(1月取樣)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1467', '["蕹菜","空心菜","water morning glory","Chinese spinach","kongxincai","蕹菜(土植)(4月取樣)"]', '蔬菜類', 'AI生成', NULL, '蕹菜(土植)(4月取樣)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1468', '["蕹菜","空心菜","ong choy","water amaranth","蕹菜(土植)(7月取樣)"]', '蔬菜類', 'AI生成', NULL, '蕹菜(土植)(7月取樣)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1469', '["苦竹","水芹菜","紅根莧","water celery","water ostrich fern","ditch vegetable","蕹菜(有機)(10月取樣)"]', '蔬菜類', 'AI生成', NULL, '蕹菜(有機)(10月取樣)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1470', '["通菜","空心菜","ong choy","kong xin cai","Chinese spinach","蕹菜(有機)(4月取樣)"]', '蔬菜類', 'AI生成', NULL, '蕹菜(有機)(4月取樣)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1471', '["蕹菜","空心菜","water morning glory","swamp cabbage","蕹菜(水耕)(10月取樣)"]', '蔬菜類', 'AI生成', NULL, '蕹菜(水耕)(10月取樣)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1472', '["蕹菜","空心菜","ong choy","kong kin chai","water morning glory","swamp cabbage","蕹菜(水耕)(1月取樣)"]', '蔬菜類', 'AI生成', NULL, '蕹菜(水耕)(1月取樣)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1473', '["蕹菜","空心菜","water spinach","onion weed","蕹菜(水耕)(4月取樣)"]', '蔬菜類', 'AI生成', NULL, '蕹菜(水耕)(4月取樣)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1474', '["通菜","空心菜","water morning glory","Chinese spinach","蕹菜(水耕)(7月取樣)"]', '蔬菜類', 'AI生成', NULL, '蕹菜(水耕)(7月取樣)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1475', '["菓子菜","馬齒菜","馬齒莧","purslane","little hogweed","green petzel","蕺菜"]', '蔬菜類', 'AI生成', NULL, '蕺菜');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1476', '["薄荷菜","留息","mint","spearmint","peppermint","薄荷"]', '蔬菜類', 'AI生成', NULL, '薄荷');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1477', '["低鈉醬油","減鹽醬油","少鹽醬油","low-sodium soy sauce","reduced sodium soy sauce","light salt soy sauce","薄鹽醬油(低鈉)","Salt"]', '調味料及香辛料類', 'AI生成', 'Salt', '薄鹽醬油(低鈉)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1478', '["低鈉醬油","減鹽醬油","健康醬油","高鉀低鈉醬油","reduced sodium soy sauce","low-sodium soy sauce","potassium-enriched soy sauce","light salt soy sauce","薄鹽醬油(低鈉高鉀)","Salt"]', '調味料及香辛料類', 'AI生成', 'Salt', '薄鹽醬油(低鈉高鉀)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1479', '["黑豆醬油膏","薄鹽醬油膏","thin salt black bean soy paste","black bean thick sauce","薄鹽黑豆醬油膏","Salt"]', '調味料及香辛料類', 'AI生成', 'Salt', '薄鹽黑豆醬油膏');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1480', '["薏米","苡仁","西米","六谷","益米","coix seed","milk vetch seed","foxtail millet (incorrect, but sometimes confused)","薏仁"]', '穀物類', 'AI生成', NULL, '薏仁');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1481', '["薏仁粉","苡仁粉","燕麥粉誤稱（注意：這是錯誤的俗稱）","西米露材料之一","coix seed flour","Job's tears powder"]', '穀物類', 'AI生成', NULL, '薏仁粉');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1482', '["薏仁醋","薏米醋","Job's tears vinegar","Coix seed vinegar","Vinegar"]', '調味料及香辛料類', 'AI生成', 'Vinegar', '薏仁醋');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1483', '["薏仁醬油","soy sauce with coix seed","coix soy sauce","Soy sauce"]', '調味料及香辛料類', 'AI生成', 'Soy sauce', '薏仁醬油');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1484', '["薑母茶","生薑茶","紅糖薑茶","ginger tea","hot ginger tea","Ginger"]', '飲料類', 'AI生成', 'Ginger', '薑母茶');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1485', '["薑末","薑蓉","薑泥","ground ginger","powdered ginger","薑粉","Ginger"]', '調味料及香辛料類', 'AI生成', 'Ginger', '薑粉');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1486', '["薑絲糖","薑片糖","薑蓉糖","姜糖","ginger candy","ginger sweets","gingered sugar","ginger confectionery","薑糖","Ginger"]', '糕餅點心類', 'AI生成', 'Ginger', '薑糖');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1487', '["薑湯包","薑汁茶包","薑根茶包","ginger tea packet","ginger root tea bag","ginger infusion packet","薑茶沖泡包","Ginger"]', '飲料類', 'AI生成', 'Ginger', '薑茶沖泡包');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1488', '["薑泥","薑蓉","薑醬","ginger paste","minced ginger","ground ginger","薑蓉醬","Ginger"]', '調味料及香辛料類', 'AI生成', 'Ginger', '薑蓉醬');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1489', '["薑黃","薑黃粉","turmeric powder","yellow ginger","Indian saffron","Ginger"]', '調味料及香辛料類', 'AI生成', 'Ginger', '薑黃粉');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1490', '["阿拉斯加黑魚","黑鱔魚","Alaska blackfish","Dallia pectoralis","薔薇項鰭魚(去皮)"]', '魚貝類', 'AI生成', 'Alaska blackfish', '薔薇項鰭魚(去皮)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1491', '["蟲魚","黑鱂","Alaska blackfish","Dallia pectoralis","薔薇項鰭魚(含皮)"]', '魚貝類', 'AI生成', 'Alaska blackfish', '薔薇項鰭魚(含皮)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1492', '["薤白","小根蒜","薤"]', '加工調理食品及其他類', 'AI生成', NULL, '薤');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1493', '["藍圓鰺","小鳁鲸","鳁仔鱼","blue round mackerel","sardinella"]', '魚貝類', 'AI生成', NULL, '藍圓鰺');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1494', '["藍寶石洋香瓜","藍色洋香瓜","blue sapphire muskmelon","sapphire musk melon"]', '水果類', 'AI生成', NULL, '藍寶石洋香瓜');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1495', '["藍對蝦","blue shrimp","striped shrimp","Shrimp"]', '魚貝類', 'AI生成', 'Shrimp', '藍對蝦');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1496', '["藍莓果","地果","荳荳莓","blueberry","wonderberry","half-high blueberry","藍莓(台灣)"]', '水果類', 'AI生成', NULL, '藍莓(台灣)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1497', '["藍豬齒魚","Alaska blackfish","Dallia pectoralis"]', '魚貝類', 'AI生成', 'Alaska blackfish', '藍豬齒魚');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1498', '["藍點鸚哥魚","Alaska blackfish","Dallia pectoralis"]', '魚貝類', 'AI生成', 'Alaska blackfish', '藍點鸚哥魚');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1499', '["小三七","山苦菜","Trident maple leaf","Gynostemma pentaphyllum var. hirsutum","藤三七"]', '蔬菜類', 'AI生成', NULL, '藤三七');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1500', '["石刁柏","龍鬚菜","asparagus","sparrowgrass","蘆筍花"]', '蔬菜類', 'AI生成', NULL, '蘆筍花');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1501', '["盧薈","天灸草","箘蒼术","齒牙菜","龍舌藍","青木香","aloe vera","aloe","medicinal aloe","蘆薈"]', '蔬菜類', 'AI生成', NULL, '蘆薈');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1502', '["蘆薦露","蘆荟汁","aloe vera drink","aloe juice","蘆薈露飲料"]', '飲料類', 'AI生成', NULL, '蘆薈露飲料');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1503', '["蘇打蔬菜餅乾","蔬菜蘇打餅乾","vegetable soda biscuit","soda cracker with vegetables","蘇打餅乾(蔬菜)"]', '糕餅點心類', 'AI生成', NULL, '蘇打餅乾(蔬菜)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1504', '["蘋果","富士蘋果","紅蘋果","黃蘋果","青蘋果","apple","red apple","green apple","yellow apple","granny smith","macintosh","蘋果平均值(混色)","Apple"]', '水果類', 'AI生成', 'Apple', '蘋果平均值(混色)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1505', '["青蘋果","綠皮蘋果","酸甜果","green apple","crisp apple","sharpsin","spree","蘋果平均值(青皮)","Apple"]', '水果類', 'AI生成', 'Apple', '蘋果平均值(青皮)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1506', '["蘋果汁","蘋果汁飲料","apple juice","Cider (when made from fermented apples)","蘋果汁(100%)","Apple"]', '飲料類', 'AI生成', 'Apple', '蘋果汁(100%)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1507', '["蘋果汁飲料","蘋果飲料","水蘋果汁","apple juice drink","juice cocktail","apple-flavored drink","蘋果汁(非原汁)","Apple"]', '飲料類', 'AI生成', 'Apple', '蘋果汁(非原汁)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1508', '["蘑菇醬","香菇醬","菌菇醬","mushroom sauce","fungus sauce"]', '調味料及香辛料類', 'AI生成', NULL, '蘑菇醬');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1509', '["生菜","羅馬萵苣","romaine lettuce","cos lettuce","蘿美萵苣"]', '蔬菜類', 'AI生成', NULL, '蘿美萵苣');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1510', '["蘿蔔乾","菜脯","薑絲萝卜干","black radish","Black Spanish radish","Gros Noir d'Hiver","Black radish"]', '蔬菜類', 'AI生成', 'Black radish', '蘿蔔乾');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1511', '["黑蘿蔔","西班牙黑蘿蔔","black radish","Black Spanish radish","Gros Noir d'Hiver","蘿蔔芽","Black radish"]', '蔬菜類', 'AI生成', 'Black radish', '蘿蔔芽');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1512', '["菜頭葉","白蘿蔔葉","青江菜","mustard spinach","Chinese mustard greens","Southern giant cowpea leaves","Oriental mustards","蘿蔔葉","Black radish"]', '蔬菜類', 'AI生成', 'Black radish', '蘿蔔葉');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1513', '["黑皮蘿蔔","西班牙黑蘿蔔","black radish","Black Spanish round","Gros Noir d'Hiver","蘿蔔酥","Black radish"]', '糕餅點心類', 'AI生成', 'Black radish', '蘿蔔酥');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1514', '["虎皮蛙","tiger skin frog"]', '肉類', 'AI生成', NULL, '虎皮蛙');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1515', '["虱目魚","Alaska blackfish","Dallia pectoralis","虱目魚(12月)"]', '魚貝類', 'AI生成', 'Alaska blackfish', '虱目魚(12月)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1516', '["虱目魚","Alaska blackfish","Dallia pectoralis","虱目魚(2022年取樣)"]', '魚貝類', 'AI生成', 'Alaska blackfish', '虱目魚(2022年取樣)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1517', '["虱目魚","Alaska blackfish","Dallia pectoralis","虱目魚(2月)"]', '魚貝類', 'AI生成', 'Alaska blackfish', '虱目魚(2月)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1518', '["虱目魚","Alaska blackfish","Dallia pectoralis","虱目魚(5月)"]', '魚貝類', 'AI生成', 'Alaska blackfish', '虱目魚(5月)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1519', '["虱目魚","Alaska blackfish","Dallia pectoralis","虱目魚(8月)"]', '魚貝類', 'AI生成', 'Alaska blackfish', '虱目魚(8月)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1520', '["虱目魚","Alaska blackfish","Dallia pectoralis","虱目魚(9月)"]', '魚貝類', 'AI生成', 'Alaska blackfish', '虱目魚(9月)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1521', '["虱目魚","Alaska blackfish","Dallia pectoralis","虱目魚(含皮)"]', '魚貝類', 'AI生成', 'Alaska blackfish', '虱目魚(含皮)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1522', '["虱目魚","Alaska blackfish","Dallia pectoralis","虱目魚平均值(去皮)"]', '魚貝類', 'AI生成', 'Alaska blackfish', '虱目魚平均值(去皮)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1523', '["虱目魚肚","蝦仔魚肚","Alaska blackfish","Dallia pectoralis","虱目魚腹肉(虱目魚肚)"]', '魚貝類', 'AI生成', 'Alaska blackfish', '虱目魚腹肉(虱目魚肚)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1524', '["蠔仔煎","蚵仔蛋餅","海鮮煎餅","oyster omelet","Taiwanese street food pancake","stuffed oyster pancake","蚵仔煎","Bivalvia (Clam, Mussel, Oyster)"]', '加工調理食品及其他類', 'AI生成', 'Bivalvia (Clam, Mussel, Oyster)', '蚵仔煎');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1525', '["牡蠔白菜","蚵仔菜","蚵仔白菜(2022年取樣)","Bivalvia (Clam, Mussel, Oyster)"]', '蔬菜類', 'AI生成', 'Bivalvia (Clam, Mussel, Oyster)', '蚵仔白菜(2022年取樣)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1526', '["蛇脯","蛇絲","蛇塊","snake meat","pit viper flesh","viper meat","蛇肉"]', '肉類', 'AI生成', NULL, '蛇肉');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1527', '["蛋撻","奶油蛋塔","Egg tart","Cream egg tart","蛋塔","Egg roll"]', '糕餅點心類', 'AI生成', 'Egg roll', '蛋塔');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1528', '["葡式蛋塔","葡萄牙蛋塔","Portuguese egg tart","Macau egg tart","蛋塔(葡式)","Egg roll"]', '糕餅點心類', 'AI生成', 'Egg roll', '蛋塔(葡式)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1529', '["芝麻蛋捲","炸芝麻卷","egg roll with sesame","sesame egg roll","蛋捲(芝麻)","Egg roll"]', '糕餅點心類', 'AI生成', 'Egg roll', '蛋捲(芝麻)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1530', '["蛋蕉","雞蛋蕉","egg banana","蛋蕉(2023年取樣)","Egg roll"]', '水果類', 'AI生成', 'Egg roll', '蛋蕉(2023年取樣)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1531', '["蛋酥花生","炸花生米","peanut brittle with egg wash","fried peanut candy","蛋酥花生仁","Egg roll"]', '加工調理食品及其他類', 'AI生成', 'Egg roll', '蛋酥花生仁');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1532', '["蛋黃果","Eggfruit","Yellow Egg Fruit","Egg roll"]', '水果類', 'AI生成', 'Egg roll', '蛋黃果');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1533', '["蛋黃芋頭酥","蛋黃芋餅","蛋黃芋頭餅","Yolk Taro Pastry","Taro and Egg Yolk Cake","Egg Yolk Taro Pie","Egg roll"]', '糕餅點心類', 'AI生成', 'Egg roll', '蛋黃芋頭酥');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1534', '["蛋黃派","鹹蛋黃酥","Egg Yolk Pastry","蛋黃酥","Egg roll"]', '糕餅點心類', 'AI生成', 'Egg roll', '蛋黃酥');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1535', '["蛙形蟹","frog-shaped crab"]', '魚貝類', 'AI生成', NULL, '蛙形蟹');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1536', '["冬蜜","蜜蜂糖","蜂巢蜜","winter honey","bee bread","蜂蜜(冬蜜)"]', '糖類', 'AI生成', NULL, '蜂蜜(冬蜜)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1537', '["春蜜","花蜜","spring honey","flower honey","蜂蜜(春蜜)"]', '糖類', 'AI生成', NULL, '蜂蜜(春蜜)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1538', '["蜂蜜小蛋糕","蜂巢蛋糕","honey cake","original honey cake","蜂蜜蛋糕(原味)","Egg roll"]', '糕餅點心類', 'AI生成', 'Egg roll', '蜂蜜蛋糕(原味)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1539', '["巧克力蜂蜜蛋糕","蜂巢巧克力蛋糕","Honey Cake (Chocolate)","Chocolate Honey Roll","蜂蜜蛋糕(巧克力)","Egg roll"]', '糕餅點心類', 'AI生成', 'Egg roll', '蜂蜜蛋糕(巧克力)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1540', '["藍紋乳酪蛋糕","藍威捷蛋糕","藍霉起司蛋糕","blue cheese cake","roquefort cake","gorgonzola cake","蜂蜜蛋糕(起司)","Blue cheese"]', '糕餅點心類', 'AI生成', 'Blue cheese', '蜂蜜蛋糕(起司)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1541', '["蜜世界洋香瓜","甜瓜","網紋瓜","Honeydew Muskmelon","Netted Melon","Crenshaw Melon (related but different variety)"]', '水果類', 'AI生成', NULL, '蜜世界洋香瓜');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1542', '["蜜餞棗","糖棗","honey jujube","sweetened red date","蜜棗(圓形)"]', '水果類', 'AI生成', NULL, '蜜棗(圓形)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1543', '["蜜棗","長棗","honey jujube","long jujube","蜜棗(長形)"]', '水果類', 'AI生成', NULL, '蜜棗(長形)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1544', '["蜜棗","honey jujube","sweet date","蜜棗平均值(大)"]', '水果類', 'AI生成', NULL, '蜜棗平均值(大)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1545', '["蜜棗李","進口蜜棗李","imported honey jujube plum","honey date plum","蜜棗李(進口)"]', '水果類', 'AI生成', NULL, '蜜棗李(進口)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1546', '["松子仁","糖漿松子","pine nut sweet","glazed pine nuts","蜜汁松子仁","Pine nut"]', '加工調理食品及其他類', 'AI生成', 'Pine nut', '蜜汁松子仁');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1547', '["蜜糖腰果","甜汁腰果","糖衣腰果","焦糖腰果","candied cashew","sugar-coated cashew","glazed cashew","honey-roasted cashew","蜜汁腰果","Cashew nut"]', '加工調理食品及其他類', 'AI生成', 'Cashew nut', '蜜汁腰果');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1548', '["甜甜圈","蜜糖圈","糖心甜甜圈","donut","doughnut","glazed donut","ring doughnut","蜜糖甜甜圈(波/摩堤)","Sugar"]', '糕餅點心類', 'AI生成', 'Sugar', '蜜糖甜甜圈(波/摩堤)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1549', '["海扇蛤","蝦夷扇貝","Hokkaido scallop","sea fan clam","蝦夷海扇蛤","Shrimp"]', '魚貝類', 'AI生成', 'Shrimp', '蝦夷海扇蛤');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1550', '["蝦油","蝦子油","shrimp oil","Shrimp"]', '調味料及香辛料類', 'AI生成', 'Shrimp', '蝦油');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1551', '["蝦米","海米","蠔油蝦皮","shrimp bits","crab Roe (misnomer)","tiny shrimp","蝦皮","Shrimp"]', '魚貝類', 'AI生成', 'Shrimp', '蝦皮');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1552', '["蝦米","海米","乾蝦仁","shrimp","prawn","dried shrimp","sea shrimp","Shrimp"]', '魚貝類', 'AI生成', 'Shrimp', '蝦米');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1553', '["蝦子醬","海鮮醬","shrimp paste","fish sauce with shrimp content","蝦醬","Shrimp"]', '調味料及香辛料類', 'AI生成', 'Shrimp', '蝦醬');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1554', '["牛蝦肉","蝸牛魚","Escargot beef","Snail cow meat","蝸牛肉","Beefalo"]', '魚貝類', 'AI生成', 'Beefalo', '蝸牛肉');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1555', '["螳螂蝦","海螳螂","長臂蝦","mantis shrimp","sea locust","prawn mantis","Shrimp"]', '魚貝類', 'AI生成', 'Shrimp', '螳螂蝦');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1556', '["蟠桃","peach","persic peach"]', '水果類', 'AI生成', NULL, '蟠桃');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1557', '["蟹腳肉","蟹肉絲","crab leg meat","crab meat strips"]', '魚貝類', 'AI生成', NULL, '蟹腳肉');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1558', '["蠑螺加工品","海螺加工食品","processed whelk","whelk products","蠑螺(加工)"]', '加工調理食品及其他類', 'AI生成', NULL, '蠑螺(加工)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1559', '["蠔油","蚝油","oyster sauce"]', '調味料及香辛料類', 'AI生成', NULL, '蠔油');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1560', '["蠔菇","蚝菇","蚝菰","abalone mushroom","sea ear mushroom"]', '菇類', 'AI生成', NULL, '蠔菇');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1561', '["血斑異大眼鯛","bloodspot largescale trevally","bloody trevally"]', '魚貝類', 'AI生成', NULL, '血斑異大眼鯛');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1562', '["衛生油麵","Health Oil Noodles"]', '加工調理食品及其他類', 'AI生成', NULL, '衛生油麵');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1563', '["天草","神仙草","海帶芽","sea mustard","ribbons of the sea","oarweed","裙帶菜"]', '藻類', 'AI生成', NULL, '裙帶菜');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1564', '["褐臭肚魚","Alaska blackfish","Dallia pectoralis"]', '魚貝類', 'AI生成', 'Alaska blackfish', '褐臭肚魚');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1565', '["西施舌","雞翅膀螺","Abalone Snail","Dishpan Hand"]', '魚貝類', 'AI生成', NULL, '西施舌');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1566', '["西施蜜柚","蜜柚","Xi Shi Honey Pomelo","Honey Pomelo","Pomelo"]', '水果類', 'AI生成', NULL, '西施蜜柚');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1567', '["西洋梨","紅皮梨","European pear","red-skinned pear","西洋梨(紅皮)"]', '水果類', 'AI生成', NULL, '西洋梨(紅皮)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1568', '["西洋梨","青皮梨","pear","green pear","butter pear","西洋梨(青皮)"]', '水果類', 'AI生成', NULL, '西洋梨(青皮)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1569', '["洋梨","西洋棗","European pear","Pear","西洋梨(黃皮)"]', '水果類', 'AI生成', NULL, '西洋梨(黃皮)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1570', '["西洋梨","pear","butter pear","beurre bosc","西洋梨平均值"]', '水果類', 'AI生成', NULL, '西洋梨平均值');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1571', '["西芹","香芹","菜芹","Chinese celery","East Asian celery","西洋芹菜","Celery leaves"]', '蔬菜類', 'AI生成', 'Celery leaves', '西洋芹菜');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1572', '["西芹菜","洋芹菜","西洋芹","Chinese celery","Asian celery","Large-ribbed celery","西洋芹菜片","Celery leaves"]', '調味料及香辛料類', 'AI生成', 'Celery leaves', '西洋芹菜片');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1573', '["西瓜","紅肉西瓜","watermelon","seedless watermelon","citrullus lanatus","西瓜平均值(紅肉小瓜)","Watermelon"]', '水果類', 'AI生成', 'Watermelon', '西瓜平均值(紅肉小瓜)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1574', '["黃肉小瓜","甜瓜","watermelon","citrullus lanatus","西瓜平均值(黃肉小瓜)","Watermelon"]', '水果類', 'AI生成', 'Watermelon', '西瓜平均值(黃肉小瓜)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1575', '["西瓜水","冰鎮西瓜汁","甜瓜汁","watermelon juice","cold watermelon drink","sweet melon juice","西瓜汁(非原汁)","Watermelon"]', '飲料類', 'AI生成', 'Watermelon', '西瓜汁(非原汁)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1576', '["西米","西谷粉","wild rice","Canada rice","Indian rice","water oats","西谷米","Annual wild rice"]', '加工調理食品及其他類', 'AI生成', 'Annual wild rice', '西谷米');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1577', '["角椒","牛角椒","甜椒","bell pepper","capsicum","pepper"]', '蔬菜類', 'AI生成', NULL, '角椒');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1578', '["小櫻桃番茄","迷你番茄","小番茄","甜櫻桃番茄","cherry tomato","baby tomato","tomato berry","grape tomato (類似形狀)","cerasiforme tomato","試交二號小番茄","Cherry tomato"]', '蔬菜類', 'AI生成', 'Cherry tomato', '試交二號小番茄');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1579', '["調和油","植物混合油","blended oil","vegetable blend oil","調合植物油"]', '油脂類', 'AI生成', NULL, '調合植物油');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1580', '["芝麻香油","熟芝麻油","生芝麻油","sesame seed oil","toasted sesame oil","調合芝麻油","Sesame oil"]', '油脂類', 'AI生成', 'Sesame oil', '調合芝麻油');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1581', '["花生油","炒貨油","開心果油","peanut oil","groundnut oil","arachis oil","roasted peanut oil","調合花生油","Peanut oil"]', '油脂類', 'AI生成', 'Peanut oil', '調合花生油');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1582', '["南瓜籽","去殼南瓜籽","炒南瓜籽","pumpkin seed","pepita","squash seed","調味南瓜子(去殼)","Japanese pumpkin"]', '加工調理食品及其他類', 'AI生成', 'Japanese pumpkin', '調味南瓜子(去殼)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1583', '["南瓜籽","帶殼南瓜籽","冬瓜籽","pumpkin seeds","squash seeds","調味南瓜子(帶殼)","Japanese pumpkin"]', '加工調理食品及其他類', 'AI生成', 'Japanese pumpkin', '調味南瓜子(帶殼)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1584', '["五香豆干丁","五香豆腐乾","Five-spice tofu cubes","Fermented bean curd bits","豆干丁(五香)"]', '糕餅點心類', 'AI生成', NULL, '豆干丁(五香)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1585', '["豆乾片","豆腐乾絲","tofu skin strips","bean curd sheet slices","豆干片(沙茶)","Black tea"]', '糕餅點心類', 'AI生成', 'Black tea', '豆干片(沙茶)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1586', '["豆乾絲","豆腐乾絲","tofu skin threads","bean curd stick strips","豆干絲"]', '加工調理食品及其他類', 'AI生成', NULL, '豆干絲');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1587', '["豆棗","黃豆棗","soybean date","yellow soybean date"]', '加工調理食品及其他類', 'AI生成', NULL, '豆棗');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1588', '["豆奶","黃豆奶","豆腐漿","味噌汁（日式）","soya milk","bean curd juice","miso juice (Japanese)","豆漿","Soy milk"]', '加工調理食品及其他類', 'AI生成', 'Soy milk', '豆漿');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1589', '["豆奶","植物奶","素牛奶","soy milk","bean milk","buddha's juice","豆漿(無糖)","Soy milk"]', '豆類', 'AI生成', 'Soy milk', '豆漿(無糖)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1590', '["豆奶优酪乳","豆浆酸奶","soy milk yogurt","tofu milk with yogurt","豆漿優酪乳","Soy milk"]', '加工調理食品及其他類', 'AI生成', 'Soy milk', '豆漿優酪乳');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1591', '["豆奶","豆腐花粉","soy milk powder","豆漿粉","Soy milk"]', '加工調理食品及其他類', 'AI生成', 'Soy milk', '豆漿粉');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1592', '["豆瓣菜","冬寒菜","towelhead cabbage","winter celery"]', '蔬菜類', 'AI生成', NULL, '豆瓣菜');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1593', '["辣豆瓣醬","豆豉醬","四川豆瓣醬","fermented black bean sauce","Sichuan fermented broad bean and chili paste","豆瓣醬"]', '調味料及香辛料類', 'AI生成', NULL, '豆瓣醬');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1594', '["豆皮","豆腐衣","千張","tofu skin","bean curd sheets","yuba","豆腐皮","Tofu"]', '加工調理食品及其他類', 'AI生成', 'Tofu', '豆腐皮');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1595', '["花生豆腐","花仁豆花","豆花(花生)","Peanut"]', '糕餅點心類', 'AI生成', 'Peanut', '豆花(花生)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1596', '["豆薯","洋番薯","紅豆薯","地瓜蕉","山芋","potato","spud","tater","Irish potato","murphy"]', '澱粉類', 'AI生成', NULL, '豆薯');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1597', '["豆豉","豆鼓","臭豆腐乾","dou chi","fermented soybean paste"]', '加工調理食品及其他類', 'AI生成', NULL, '豆豉');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1598', '["豆酥"]', '調味料及香辛料類', 'AI生成', NULL, '豆酥');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1599', '["豆醬酥","豆腐醬","豆酥醬"]', '調味料及香辛料類', 'AI生成', NULL, '豆酥醬');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1600', '["長豇豆","細繩子","綠繩豆","雲豆","架豆角","yardlong bean","asparagus bean","bush snake bean","dolichos bean","豇豆(莢)"]', '豆類', 'AI生成', NULL, '豇豆(莢)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1601', '["豌豆粒","青小豆","green pea","pea nut","豌豆仁","Asian pear"]', '豆類', 'AI生成', 'Asian pear', '豌豆仁');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1602', '["豌豆仁","豆仁","pea kernels in a can","canned pea hearts","豌豆仁罐頭","Asian pear"]', '加工調理食品及其他類', 'AI生成', 'Asian pear', '豌豆仁罐頭');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1603', '["豆芽菜","黃豆芽","bean sprouts","mung bean sprout","豌豆芽","Asian pear"]', '蔬菜類', 'AI生成', 'Asian pear', '豌豆芽');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1604', '["豌豆尖","豆苗","青豌豆","snow pea shoots","pea sprouts","baby snow peas","豌豆苗","Asian pear"]', '蔬菜類', 'AI生成', 'Asian pear', '豌豆苗');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1605', '["豌豆角","豌豆筒","snow pea pod","sugar snap pod","豌豆莢","Asian pear"]', '豆類', 'AI生成', 'Asian pear', '豌豆莢');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1606', '["豐水梨","雪花梨","Fengshui Pear","Snow Pear"]', '水果類', 'AI生成', NULL, '豐水梨');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1607', '["象牙鳳螺","白鳳螺","Ivory Conch","White Conch"]', '魚貝類', 'AI生成', NULL, '象牙鳳螺');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1608', '["上肩肉","豬肩肉","猪颈肉","shoulder meat","top blade roast","English cut","Chuck roll","豬上肩肉"]', '肉類', 'AI生成', NULL, '豬上肩肉');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1609', '["豬肩肉","猪肩肉","前肩瘦肉","肩胛肉","pork shoulder meat","shoulder blade pork","sirloin tip roast","豬下肩瘦肉"]', '肉類', 'AI生成', NULL, '豬下肩瘦肉');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1610', '["豬前肩肉","猪肋条肉","豬上肩肉","shoulder pork","pork blade","neck shoulder meat","豬下肩肉"]', '肉類', 'AI生成', NULL, '豬下肩肉');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1611', '["豬蹄膀","前腳肉","豬手肘","pig's trotter","pork knuckle","front foot of pig","豬前腳"]', '肉類', 'AI生成', NULL, '豬前腳');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1612', '["豬前腿肉","豬腳蹄肉","front pork shank meat","pork leg tendon meat","豬前腿外腱肉"]', '肉類', 'AI生成', NULL, '豬前腿外腱肉');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1613', '["去皮五花肉","凈肉","腹脇淨肉","skinless belly pork","five-spice roast pork (without skin)","loin and belly meat (no skin)","豬去皮腹脇肉"]', '肉類', 'AI生成', NULL, '豬去皮腹脇肉');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1614', '["大排","豬排","pork rib","spare ribs","豬大排"]', '肉類', 'AI生成', NULL, '豬大排');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1615', '["豬腸","大腸","豬大腸頭","pig intestine","hog tripe","large pig's bowel","豬大腸"]', '肉類', 'AI生成', NULL, '豬大腸');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1616', '["大里肌","豬裡肌肉","豬裏脊肉","loin pork","pork loin chop","sirloin pork","豬大里肌"]', '肉類', 'AI生成', NULL, '豬大里肌');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1617', '["豬骨湯","大骨湯","排骨湯","pork rib soup","pig bone soup","skeleton broth","豬大骨湯"]', '肉類', 'AI生成', NULL, '豬大骨湯');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1618', '["豬肋排","小排骨","仔排","pork spare ribs","ribs","baby back ribs","豬小排"]', '肉類', 'AI生成', NULL, '豬小排');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1619', '["豬腸","小腸","豬小腸"]', '肉類', 'AI生成', NULL, '豬小腸');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1620', '["豬裡肌肉","豬菲力","pork tenderloin","tenderloin","豬小里肌"]', '肉類', 'AI生成', NULL, '豬小里肌');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1621', '["豬尾巴","猪尾巴","豬屁股","猪屁股","pig's tail","pigtails","豬尾"]', '肉類', 'AI生成', NULL, '豬尾');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1622', '["五花肉","肋條肉","腹脇肉","five-spice meat","ribs with skin","belly pork","豬帶皮腹脇肉"]', '肉類', 'AI生成', NULL, '豬帶皮腹脇肉');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1623', '["豬後腿","猪后脚","豬蹄膀","猪臀部","猪屁股","pig's hind leg","ham hock","pork knuckle","豬後腳"]', '肉類', 'AI生成', NULL, '豬後腳');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1624', '["豬後腿肉","豬腱子肉","豬外脢","ham hock meat","pig's hind leg outer tendon meat","豬後腿外腱肉"]', '肉類', 'AI生成', NULL, '豬後腿外腱肉');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1625', '["豬後腿瘦肉","後腿肉","裏肌肉","ham meat","pork hind leg meat","lean pork from the rear"]', '肉類', 'AI生成', NULL, '豬後腿瘦肉');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1626', '["後腿肉","豬大排","豬裏肌肉","pork leg meat","ham cutlet","leg roast","豬後腿肉"]', '肉類', 'AI生成', NULL, '豬後腿肉');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1627', '["豬心","pig's heart","heart of pork"]', '肉類', 'AI生成', NULL, '豬心');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1628', '["豬油","豬板油","猪油","lard"]', '油脂類', 'AI生成', NULL, '豬油');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1629', '["豬油","lard","猪油","pig fat","pork lard","豬油(2022年取樣)"]', '油脂類', 'AI生成', NULL, '豬油(2022年取樣)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1630', '["豬油皮","炸油渣","油炸碎肉","鍋巴","cracklings","fried pork rind","pork skin crackle","豬油渣"]', '肉類', 'AI生成', NULL, '豬油渣');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1631', '["豬白管","大腸頭","pig's large intestine part","white gut of pig"]', '肉類', 'AI生成', NULL, '豬白管');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1632', '["豬皮","猪耳朵","豬耳朵","肉皮","豬膚","pork rind","pig skin","cracklings"]', '肉類', 'AI生成', NULL, '豬皮');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1633', '["豬小腸","豬腸","pig small intestine","hog tripe","豬空腸"]', '肉類', 'AI生成', NULL, '豬空腸');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1634', '["絞肉","豬肉末","豬肉泥","ground pork","minced pork","pork meat末","豬絞肉(70％瘦肉率)"]', '肉類', 'AI生成', NULL, '豬絞肉(70％瘦肉率)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1635', '["絞瘦肉","碎瘦肉","豬柳","lean ground pork","minced lean pork","pork mince (high lean content)","豬絞肉(90％瘦肉率)"]', '肉類', 'AI生成', NULL, '豬絞肉(90％瘦肉率)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1636', '["絞肉","豬肉餡","ground pork","minced pork","豬絞肉平均值"]', '肉類', 'AI生成', NULL, '豬絞肉平均值');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1637', '["豬耳朵","猪耳朵","耳仔","pig's ear","pigs' ears","豬耳"]', '肉類', 'AI生成', NULL, '豬耳');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1638', '["豬肉脯","豬脹肺","豬舌頭乾","豬耳乾","五香肉鬆","pork floss","five-spice pork jerky","pork ham slice"]', '加工調理食品及其他類', 'AI生成', NULL, '豬肉脯');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1639', '["豬肉鬆","豬肉乾","pork floss cake","pork jerky pie","豬肉酥"]', '加工調理食品及其他類', 'AI生成', NULL, '豬肉酥');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1640', '["豬肉捲餃","鍋貼捲餃","煎餛飩","餡餅","pork gyoza","pot sticker","jiaozi","dumpling","豬肉鍋貼"]', '加工調理食品及其他類', 'AI生成', NULL, '豬肉鍋貼');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1641', '["豬肉煎餅","豬肉捲餅","肉餡餅","燒肉餅","pork pie","barbecue pork puff","roast pork bun","豬肉餡餅"]', '加工調理食品及其他類', 'AI生成', NULL, '豬肉餡餅');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1642', '["豬肋排湯","排骨湯","豬骨湯","pork rib soup","pork spare ribs soup","rib soup","豬肋骨湯"]', '肉類', 'AI生成', NULL, '豬肋骨湯');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1643', '["豬脹腸","豬腎腸","pigs' tripe","swine's tripe","豬肚"]', '肉類', 'AI生成', NULL, '豬肚');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1644', '["豬肝","猪肝","pork liver"]', '肉類', 'AI生成', NULL, '豬肝');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1645', '["豬肝","豬肝連","pig liver","liver with lung tissue"]', '肉類', 'AI生成', NULL, '豬肝連');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1646', '["豬肩肉","大排","肉排","pork shoulder blade roast","shoulder chop","blade roast","豬肩胛排"]', '肉類', 'AI生成', NULL, '豬肩胛排');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1647', '["豬肩肉","豬排","pork shoulder blade roast","shoulder roast","blade roast","豬肩胛排(2021年取樣)"]', '肉類', 'AI生成', NULL, '豬肩胛排(2021年取樣)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1648', '["豬腳肉","肩胛肉","猪脚肉","shoulder meat","pork shoulder","brisket (misleading, not accurate but sometimes used)","豬肩胛肉"]', '肉類', 'AI生成', NULL, '豬肩胛肉');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1649', '["豬肘骨湯","豬前腿骨湯","pork shoulder blade soup","ham hock bone broth","豬肩骨湯"]', '肉類', 'AI生成', NULL, '豬肩骨湯');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1650', '["脾","猪心肺","豬雜碎","pig spleen","spleen","tripe","豬脾臟"]', '肉類', 'AI生成', NULL, '豬脾臟');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1651', '["豬腰","猪腰","pork kidney","pig kidneys","豬腎"]', '肉類', 'AI生成', NULL, '豬腎');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1652', '["豬腦","pig's brain"]', '肉類', 'AI生成', NULL, '豬腦');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1653', '["豬腳凍","豬肘冻","猪爪冻","蹄膀冻","豬四點","pork foot jelly","pig's trotter aspic","pork knuckle jelly"]', '加工調理食品及其他類', 'AI生成', NULL, '豬腳凍');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1654', '["豬蹄筋","猪脚筋","猪肘皮","pig's foot tendon","pork knuckle skin","豬腳筋"]', '肉類', 'AI生成', NULL, '豬腳筋');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1655', '["腹排","脇肉","豬肋排骨","pork rib meat","spareribs without bones","rib pork belly","豬腹脇排"]', '肉類', 'AI生成', NULL, '豬腹脇排');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1656', '["豬脷","舌頭","pig's tongue","豬舌"]', '肉類', 'AI生成', NULL, '豬舌');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1657', '["豬血糕","豬血湯","豬血雜碎","pig's blood","豬血"]', '肉類', 'AI生成', NULL, '豬血');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1658', '["豬血糕","豬血格仔","血糯米糕","pig's blood cake","blood cake"]', '加工調理食品及其他類', 'AI生成', NULL, '豬血糕');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1659', '["蹄膀","豬肘","豬膝蓋","肘子","pork knuckle","ham hock","pig's trotter","arm joint","豬蹄膀"]', '肉類', 'AI生成', NULL, '豬蹄膀');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1660', '["豬軟骨","猪软骨","猪骨头","pork cartilage","soft bone","pig gristle"]', '肉類', 'AI生成', NULL, '豬軟骨');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1661', '["豬臉頰肉","豬咬脹","pig jowl","cheek meat","豬頰肉"]', '肉類', 'AI生成', NULL, '豬頰肉');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1662', '["豬臉肉","頰肉","pig's cheek meat","cheek meat","豬頰肉(2022年取樣)"]', '肉類', 'AI生成', NULL, '豬頰肉(2022年取樣)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1663', '["豬下巴肉","豬喉頭肉","鎖骨肉","豬下頜肉","neck meat","pig's neck","jowl meat","豬頸肉"]', '肉類', 'AI生成', NULL, '豬頸肉');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1664', '["豬骨湯","pork bone soup","豬骨湯平均值"]', '肉類', 'AI生成', NULL, '豬骨湯平均值');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1665', '["赤鰭石首魚","火鯖","紅尾$","石鯛","Japanese sea bream","Red seabream","Sparid","赤鰭笛鯛"]', '魚貝類', 'AI生成', NULL, '赤鰭笛鯛');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1666', '["起酥餅","千層酥","pastry slice","shortcrust pastry layer cake","起酥片"]', '糕餅點心類', 'AI生成', NULL, '起酥片');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1667', '["越光米","Yokome rice","Yukinohikari rice","Annual wild rice"]', '穀物類', 'AI生成', 'Annual wild rice', '越光米');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1668', '["台南16號","Nantou 16","Taiwan 16 Rice","越光米(台南16號)(2024年取樣)","Annual wild rice"]', '穀物類', 'AI生成', 'Annual wild rice', '越光米(台南16號)(2024年取樣)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1669', '["蛇瓜","涼瓜","snake gourd","cooling gourd","越瓜"]', '蔬菜類', 'AI生成', NULL, '越瓜');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1670', '["車輪餅","紅豆餅","小車餅","Red bean pancake wheel","Sweet red bean pastry","車輪餅(紅豆)"]', '糕餅點心類', 'AI生成', NULL, '車輪餅(紅豆)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1671', '["車輪餅","菜脯煎餅","蘿蔔糕片","萝卜丝饼","Turnip Cake Wheel","Radish Floss Pancake","車輪餅(菜脯)"]', '糕餅點心類', 'AI生成', NULL, '車輪餅(菜脯)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1672', '["軟翅仔","soft finlet fish","finlet ray"]', '魚貝類', 'AI生成', NULL, '軟翅仔');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1673', '["辣椒粉","紅椒粉","辣粉","朝天椒粉","red pepper flakes","chili powder","hot pepper powder","cayenne pepper"]', '調味料及香辛料類', 'AI生成', NULL, '辣椒粉');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1674', '["辣椒醬","辣醬","辣椒醃菜","紅油","辣油","辣椒膏","hot sauce","chili sauce","pepper paste","sriracha","chili paste","red pepper sauce"]', '調味料及香辛料類', 'AI生成', NULL, '辣椒醬');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1675', '["辣蒜蓉醬","辣椒蒜蓉醬","Hot Garlic Sauce","Spicy Garlic Paste"]', '調味料及香辛料類', 'AI生成', NULL, '辣蒜蓉醬');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1676', '["辣豆醬","豆瓣醬","辣椒豆瓣醬","紅豆瓣醬","hot bean paste","spicy doubanjiang","douban sauce","辣豆瓣醬"]', '調味料及香辛料類', 'AI生成', NULL, '辣豆瓣醬');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1677', '["小竹筍白菜","迷你筍尖","竹筍小白菜","mini bamboo shoots","tiny bamboo sprouts","迷你竹筍白菜","Bamboo shoots"]', '蔬菜類', 'AI生成', 'Bamboo shoots', '迷你竹筍白菜');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1678', '["迷迭香粉","羅勒葉粉","rosemary powder","dried rosemary flakes","ground rosemary"]', '調味料及香辛料類', 'AI生成', NULL, '迷迭香粉');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1679', '["通心粉","意大利面（未煮前）","spaghetti noodles","pasta (uncooked)","macaroni","通心麵"]', '加工調理食品及其他類', 'AI生成', NULL, '通心麵');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1680', '["速食乾麵包","即食麻醬乾拌面","速食麻醬乾麺","instant noodle peanut sauce packet","dry peanut sauce noodles","ready-to-eat peanut sauce ramen","速食乾麵麻醬包"]', '調味料及香辛料類', 'AI生成', NULL, '速食乾麵麻醬包');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1681', '["運動飲料","功能飲料","能量飲料","sports drink","energy drink","rehydration solution"]', '飲料類', 'AI生成', NULL, '運動飲料');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1682', '["過溝菜蕨","overgully fern"]', '蔬菜類', 'AI生成', NULL, '過溝菜蕨');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1683', '["低乳糖奶粉","部分脫脂奶粉","partially skimmed low-lactose milk powder","reduced-fat lactose-reduced milk powder","部份脫脂低乳糖奶粉","Sugar"]', '乳品類', 'AI生成', 'Sugar', '部份脫脂低乳糖奶粉');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1684', '["低脂奶粉","半脫脂奶粉","reduced-fat milk powder","partially skimmed milk powder","部份脫脂奶粉"]', '乳品類', 'AI生成', NULL, '部份脫脂奶粉');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1685', '["即溶奶粉","脫脂奶粉","skimmed milk powder","fat-reduced milk powder","instant milk powder","部份脫脂奶粉(即溶)"]', '乳品類', 'AI生成', NULL, '部份脫脂奶粉(即溶)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1686', '["纖維DHA強化奶粉","低脂營養奶粉","partially skimmed fortified milk powder with fiber & DHA","low-fat fortified milk powder with added fiber and DHA","部份脫脂強化奶粉(纖維&DHA強化)"]', '乳品類', 'AI生成', NULL, '部份脫脂強化奶粉(纖維&DHA強化)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1687', '["部份脫脂強化奶粉","低脂營養奶粉","纖維鈣奶粉","partially skimmed fortified milk powder (fiber & calcium enriched)","reduced fat fortified milk powder with fiber and calcium","dietary enhanced milk powder","部份脫脂強化奶粉(纖維&鈣強化)"]', '乳品類', 'AI生成', NULL, '部份脫脂強化奶粉(纖維&鈣強化)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1688', '["部分脫脂強化奶粉","調整脂肪酸奶粉","partially skimmed fortified milk powder with fat acid adjustment","fortified low-fat milk powder","部份脫脂強化奶粉(脂肪酸調整)"]', '乳品類', 'AI生成', NULL, '部份脫脂強化奶粉(脂肪酸調整)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1689', '["部份脫脂強化奶粉","鈣質奶粉","補充營養奶粉","partially skimmed fortified milk powder with calcium","calcium-fortified milk powder","enriched milk powder","部份脫脂強化奶粉(鈣強化)"]', '乳品類', 'AI生成', NULL, '部份脫脂強化奶粉(鈣強化)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1690', '["巧克力奶粉","調味奶粉(巧克力)","部分脫脂巧克力奶粉","Chocolate flavored partially skimmed milk powder","Chocolate milk mix","Partially skimmed chocolate milk powder","部份脫脂調味奶粉(巧克力)"]', '乳品類', 'AI生成', NULL, '部份脫脂調味奶粉(巧克力)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1691', '["果汁奶粉","調味奶粉（果汁味）","juice-flavored skimmed milk powder","flavored low-fat milk powder","部份脫脂調味奶粉(果汁)","Fruit juice"]', '乳品類', 'AI生成', 'Fruit juice', '部份脫脂調味奶粉(果汁)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1692', '["酒杯菇","jug mushroom","wine cup mushroom"]', '菇類', 'AI生成', NULL, '酒杯菇');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1693', '["牛油果","奶油梨","油梨","avocado","alligator pear","butter fruit","酪梨(室溫存放0天)"]', '水果類', 'AI生成', NULL, '酪梨(室溫存放0天)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1694', '["牛油果","鳄梨","奶油梨","油梨","avocado","alligator pear","butter fruit","酪梨(室溫存放3天)"]', '水果類', 'AI生成', NULL, '酪梨(室溫存放3天)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1695', '["牛油果","奶油果","梨 avocado","avocado pear","alligator pear","butter fruit","酪梨(室溫存放6天)"]', '水果類', 'AI生成', NULL, '酪梨(室溫存放6天)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1696', '["牛油果","奶油梨","油梨","鳩摩哩","avocado pear","alligator pear","butter fruit","酪梨(綠皮)"]', '水果類', 'AI生成', NULL, '酪梨(綠皮)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1697', '["酵母膏","發酵粉","brewer's yeast powder","yeast extract powder","酵母粉"]', '調味料及香辛料類', 'AI生成', NULL, '酵母粉');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1698', '["酵母咀嚼片","發酵錠","yeast chewable tablet","fermentation pill","酵母菌咀嚼錠"]', '糕餅點心類', 'AI生成', NULL, '酵母菌咀嚼錠');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1699', '["酸菜","酸白菜","酸黃芽菜","sauerkraut","pickled cabbage","cabbage relish","酸甘藍菜"]', '加工調理食品及其他類', 'AI生成', NULL, '酸甘藍菜');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1700', '["酸菜","泡菜","腌菜","雪里蕻","雪菜","suan cai","pickled mustard greens","kimchi (類似，但不完全相同)","fermented vegetables"]', '加工調理食品及其他類', 'AI生成', NULL, '酸菜');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1701', '["冬瓜醃菜","冬瓜咸菜","pickled winter melon","preserved winter melon","醃漬冬瓜"]', '加工調理食品及其他類', 'AI生成', NULL, '醃漬冬瓜');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1702', '["醃漬花生","糖醋花生","鹹花生仁","鹽焗花生","salted peanuts","pickled peanuts","sour and sweet peanuts","vinegar peanuts","醃漬花生仁","Peanut"]', '加工調理食品及其他類', 'AI生成', 'Peanut', '醃漬花生仁');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1703', '["醃漬花胡瓜","酸菜花胡瓜","泡菜花胡瓜","pickled flowering loofah cucumber","fermented flowering loofah gourd","sour flowered bitter melon cucumber"]', '加工調理食品及其他類', 'AI生成', NULL, '醃漬花胡瓜');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1704', '["醃漬越瓜","pickled bitter melon","fermented bitter gourd"]', '加工調理食品及其他類', 'AI生成', NULL, '醃漬越瓜');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1705', '["醃漬香菇","泡菜香菇","鹹香菇","salted shiitake mushrooms","pickled shiitake mushrooms"]', '加工調理食品及其他類', 'AI生成', NULL, '醃漬香菇');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1706', '["醃漬鮭魚卵","紅寶石","Cured salmon roe","Red caviar","Salmon eggs","Atlantic salmon"]', '加工調理食品及其他類', 'AI生成', 'Atlantic salmon', '醃漬鮭魚卵');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1707', '["醃燻豬肝","熏肝","鹹肝","smoked and cured pork liver","salted smoked liver"]', '加工調理食品及其他類', 'AI生成', NULL, '醃燻豬肝');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1708', '["酸辣椒","腌辣椒","咸辣椒","pickled chili","preserved chili","salted chili","醃辣椒"]', '加工調理食品及其他類', 'AI生成', NULL, '醃辣椒');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1709', '["豉油","豆醬油","醬汁","調味汁","soya sauce","shoyu","tamari","dark soy sauce","light soy sauce","醬油","Soy sauce"]', '調味料及香辛料類', 'AI生成', 'Soy sauce', '醬油');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1710', '["醬油渣","醬油糟","醬油膏","Soy sauce"]', '調味料及香辛料類', 'AI生成', 'Soy sauce', '醬油膏');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1711', '["醬油瓜籽","醃西瓜子","salted watermelon seeds","soy sauce seasoned melon seeds","醬油西瓜子","Watermelon"]', '加工調理食品及其他類', 'AI生成', 'Watermelon', '醬油西瓜子');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1712', '["醬肘子","醬豬蹄","braised pork knuckle","red braised trotters"]', '加工調理食品及其他類', 'AI生成', NULL, '醬肘子');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1713', '["水玉果","釋迦果","菩提果","心肝寶貝","Sachima fruit","Dragon Fruit (Note: This is actually the name for Pitaya, not to be confused)","Custard Apple","釋迦"]', '水果類', 'AI生成', NULL, '釋迦');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1714', '["里肌肉","雞胸肉","chicken breast","boneless chicken breast","inside-out chicken","pulled chicken","里肌肉(土雞)"]', '肉類', 'AI生成', NULL, '里肌肉(土雞)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1715', '["里肌肉","豬肉片","豬肩肉","豬裡脊","pork loin","sirloin pork","lean pork","chine pork","里肌肉(肉雞)"]', '肉類', 'AI生成', NULL, '里肌肉(肉雞)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1716', '["里肌肉","豬裏肌肉","pork loin","loin pork","里肌肉平均值"]', '肉類', 'AI生成', NULL, '里肌肉平均值');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1717', '["野紅米","加拿大紅米","水稻","Canada rice","Indian rice","water oats","野生紅米","Annual wild rice"]', '穀物類', 'AI生成', 'Annual wild rice', '野生紅米');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1718', '["野苦瓜","山苦瓜","bitter gourd (wild variety)","ampalaya (Philippines)"]', '蔬菜類', 'AI生成', NULL, '野苦瓜');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1719', '["野苦瓜嫩梢","wild bitter gourd sprout","bitter melon shoot"]', '蔬菜類', 'AI生成', NULL, '野苦瓜嫩梢');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1720', '["野莧","野筍菜","莧草","wild amaranth","pigweed","野莧菜"]', '蔬菜類', 'AI生成', NULL, '野莧菜');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1721', '["金冠蘋果","紅富士","golden apple","king apple","Apple"]', '水果類', 'AI生成', 'Apple', '金冠蘋果');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1722', '["金喜菇","jinhixi mushroom","golden joy mushroom"]', '菇類', 'AI生成', NULL, '金喜菇');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1723', '["小櫻桃番茄","迷你番茄","櫻桃小番茄","金女果","珍珠番茄","cherry tomato","baby plum tomato","cocktail tomato","dwarf tomato","金女小番茄","Cherry tomato"]', '蔬菜類', 'AI生成', 'Cherry tomato', '金女小番茄');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1724', '["金時甘藷","金薯","紅薯","sweet potato","yam","kamsa sweet potato"]', '澱粉類', 'AI生成', NULL, '金時甘藷');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1725', '["金桔果醬","小金橘醬","kumquat jam","mandarin orange marmalade (incorrect, but might be confused with)","金桔醬"]', '調味料及香辛料類', 'AI生成', NULL, '金桔醬');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1726', '["金煌芒果","金榜芒果","Kinhuang Mango","Golden Glory Mango","Mango"]', '水果類', 'AI生成', 'Mango', '金煌芒果');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1727', '["金線魚","Alaska blackfish","Dallia pectoralis"]', '魚貝類', 'AI生成', 'Alaska blackfish', '金線魚');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1728', '["芒果","黃金芒果","杧果","mango","common mango","Indian mango","金興芒果","Mango"]', '水果類', 'AI生成', 'Mango', '金興芒果');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1729', '["西瓜","冰果","哈密瓜（注意：這通常指另一種甜瓜）","watermelon","seedless watermelon (if seedless)","cantaloupe (注意：這通常指另一種水果)","金蘭西瓜","Watermelon"]', '水果類', 'AI生成', 'Watermelon', '金蘭西瓜');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1730', '["芒果","黃金芒果","甜芒","mango","golden mango","sweet mango","金蜜芒果","Mango"]', '水果類', 'AI生成', 'Mango', '金蜜芒果');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1731', '["金針","黃花菜","腦筍","golden needle mushroom","edible chrysanthemum mushroom","金針菇"]', '菇類', 'AI生成', NULL, '金針菇');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1732', '["金針菇頭","黃金菇罐頭","golden needle mushroom in a can","edible mushroom in a tin","金針菇罐頭"]', '加工調理食品及其他類', 'AI生成', NULL, '金針菇罐頭');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1733', '["黃花菜","金針花","萱草","忘憂草","daylily flower","golden needle","yellow flower vegetable","金針菜"]', '蔬菜類', 'AI生成', NULL, '金針菜');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1734', '["金針菜","黃花菜","萱草","daylily flower","yellow flower vegetable","golden needle","金針菜乾"]', '蔬菜類', 'AI生成', NULL, '金針菜乾');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1735', '["金針菜嫩莖","黃花菜嫩莖","daylily flower stalks","yellow chrysanthemum sprouts"]', '蔬菜類', 'AI生成', NULL, '金針菜嫩莖');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1736', '["蝦乾","海米","金鉤蝦","dried shrimp","shrimp flakes","golden hook shrimp","金鉤蝦乾","Shrimp"]', '魚貝類', 'AI生成', 'Shrimp', '金鉤蝦乾');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1737', '["金錢魚","Alaska blackfish","Dallia"]', '魚貝類', 'AI生成', 'Alaska blackfish', '金錢魚');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1738', '["鳳梨","菠蘿","pineapple","anana","金鑽鳳梨","Pineapple"]', '水果類', 'AI生成', 'Pineapple', '金鑽鳳梨');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1739', '["金門麵線","黃麴麵線","Kinmen yellow noodles","Kinmen wheat vermicelli","金門黃麵"]', '加工調理食品及其他類', 'AI生成', NULL, '金門黃麵');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1740', '["金香葡萄","紫葡萄","歐洲葡萄","Common Grape","Table Grape","Wine Grape","金香葡萄(含皮)","Common grape"]', '水果類', 'AI生成', 'Common grape', '金香葡萄(含皮)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1741', '["金鱗魚","Alaska blackfish","Dallia pectoralis"]', '魚貝類', 'AI生成', 'Alaska blackfish', '金鱗魚');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1742', '["奇异果","猕猴桃","kiwi fruit","Chinese gooseberry","Yang Tao","金黃奇異果","Kiwi"]', '水果類', 'AI生成', 'Kiwi', '金黃奇異果');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1743', '["白果","公孫樹子","銀杏子","ginkgo nut","gingko seed","blossom nut","銀杏果"]', '堅果及種子類', 'AI生成', NULL, '銀杏果');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1744', '["白木耳","雪耳","silver ear fungus","white wood ear","銀耳"]', '菇類', 'AI生成', NULL, '銀耳');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1745', '["銀耳罐頭","雪耳罐頭","silver ear in can","white fungus canned"]', '加工調理食品及其他類', 'AI生成', NULL, '銀耳罐頭');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1746', '["銀魚","Alaska blackfish","Dallia"]', '魚貝類', 'AI生成', 'Alaska blackfish', '銀魚');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1747', '["銀鯧","白鯧","白棘鰭","white croaker","bald croaker","銀鯧(12月)"]', '魚貝類', 'AI生成', NULL, '銀鯧(12月)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1748', '["二月鯛","黑鯛","White croaker","Silver perch","銀鯧(2月)"]', '魚貝類', 'AI生成', NULL, '銀鯧(2月)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1749', '["三月鯛","白花鯛","Red seabream","Three-line grunt","銀鯧(3月)"]', '魚貝類', 'AI生成', NULL, '銀鯧(3月)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1750', '["銀鯧","白鯛魚","白鯱","white croaker","silver croaker","銀鯧(5月)"]', '魚貝類', 'AI生成', NULL, '銀鯧(5月)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1751', '["八月鯧","中秋鯧","August croaker","Mid-Autumn croaker","銀鯧(8月)"]', '魚貝類', 'AI生成', NULL, '銀鯧(8月)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1752', '["銀鯧","白肚$","石鱂$","銀肚$","石鯛$","silver pomfret","white croaker","pomfret","cicadas of the sea","銀鯧(含皮)"]', '魚貝類', 'AI生成', NULL, '銀鯧(含皮)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1753', '["銀鯧","白鱔鱼","silver pomfret","white pomfret","銀鯧平均值(去皮)"]', '魚貝類', 'AI生成', NULL, '銀鯧平均值(去皮)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1754', '["銅鑼燒","紅豆餅","煎餅","Tong Lao Shao","Red Bean Pancake"]', '糕餅點心類', 'AI生成', NULL, '銅鑼燒');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1755', '["锯口鱼","老虎斑","东星斑","pearlspot","margutta","blackspot snapper","鋸尾鯛"]', '魚貝類', 'AI生成', NULL, '鋸尾鯛');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1756', '["鍋燒義大利麵","炸醬意面","pan fried spaghetti","stir-fried noodles with pork sauce","鍋燒意麵"]', '加工調理食品及其他類', 'AI生成', NULL, '鍋燒意麵');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1757', '["鍋燒意麵","炸醬炒面","pan-fried noodle","stir-fried noodles with sauce","鍋燒麵"]', '加工調理食品及其他類', 'AI生成', NULL, '鍋燒麵');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1758', '["長果金柑","long-fruit kumquat","kumquat fruit"]', '水果類', 'AI生成', NULL, '長果金柑');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1759', '["紫茄","矮茄","秋茄子","赤茄","黑茄","aubergine","eggplant","brinjal","melongene","guinea squash","長茄子","Eggplant"]', '蔬菜類', 'AI生成', 'Eggplant', '長茄子');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1760', '["紅辣椒","長紅椒","red chili pepper","long red pepper","bird's eye chile","長辣椒(紅皮)"]', '蔬菜類', 'AI生成', NULL, '長辣椒(紅皮)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1761', '["長辣椒","青辣椒","尖椒","菜椒","green chili pepper","long green chili","green bird's eye chili","長辣椒(青皮)"]', '蔬菜類', 'AI生成', NULL, '長辣椒(青皮)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1762', '["油胡瓜魚","黑鱈","Alaska blackfish","Dallia pectoralis","長體油胡瓜魚"]', '魚貝類', 'AI生成', 'Alaska blackfish', '長體油胡瓜魚');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1763', '["長鰭鰤魚","Alaska blackfish","Dallia pectoralis"]', '魚貝類', 'AI生成', 'Alaska blackfish', '長鰭鰤魚');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1764', '["長麵線","金針菇的誤稱（有時被誤認為是金針菇）","long vermicelli","cellophane noodles (需要注意的是，雖然名稱相似，但這種食物並不是真正的長條形細面)","rice sticks (在某些情況下可能會誤認爲)","Chinese vermicelli (需要區分於其他類型的米粉或麵線)"]', '加工調理食品及其他類', 'AI生成', NULL, '長麵線');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1765', '["開心果","綠仁果","pistachio","pista","Pistachio"]', '堅果及種子類', 'AI生成', 'Pistachio', '開心果');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1766', '["菠蘿","黃梨","番木瓜","pineapple","ananas","開英種1號鳳梨","Pineapple"]', '水果類', 'AI生成', 'Pineapple', '開英種1號鳳梨');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1767', '["阿根廷墨魚","Argentine squid","Calamari (if prepared and cooked)","阿根廷魷"]', '魚貝類', 'AI生成', NULL, '阿根廷魷');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1768', '["阿部牙鯛","abuya snapper","Japanese pike conger"]', '魚貝類', 'AI生成', NULL, '阿部牙鯛');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1769', '["紹興老酒","紹興黃酒","花雕酒","陳年黃酒","Shaoxing Wine","Huadiao Wine","Aged Shaoxing Rice Wine","陳年紹興酒"]', '加工調理食品及其他類', 'AI生成', NULL, '陳年紹興酒');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1770', '["橘皮","橙皮","陳皮柑","廣陳皮","甘橘皮","化州桔紅皮","dried tangerine peel","tangerine peel","aged orange peel","chen pi","mandarin peel","陳皮"]', '調味料及香辛料類', 'AI生成', NULL, '陳皮');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1771', '["隆脊管鞭蝦","shrimp","prawn","Shrimp"]', '魚貝類', 'AI生成', 'Shrimp', '隆脊管鞭蝦');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1772', '["隼人瓜","suzuran squash","Japanese pie pumpkin"]', '蔬菜類', 'AI生成', NULL, '隼人瓜');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1773', '["隼人瓜","suzuran squash","Japanese pie pumpkin","隼人瓜(2023年取樣)"]', '蔬菜類', 'AI生成', NULL, '隼人瓜(2023年取樣)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1774', '["隼人瓜苗","Suzuran Gua Miao"]', '蔬菜類', 'AI生成', NULL, '隼人瓜苗');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1775', '["雙帶鰺","striped sardinella","tailing scad"]', '魚貝類', 'AI生成', NULL, '雙帶鰺');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1776', '["雙線鬚鰨","雙帶長鬚鯖","double-lined whiskered pomfret"]', '魚貝類', 'AI生成', NULL, '雙線鬚鰨');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1777', '["大果樹","麵包果","breadfruit","cheeni (Hindi)","雙胞胎麵包","Breadfruit"]', '糕餅點心類', 'AI生成', 'Breadfruit', '雙胞胎麵包');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1778', '["雙色水果玉米","bicolor fruit corn","two-color sweet corn","tropical maize with fruits","Acorn"]', '穀物類', 'AI生成', 'Acorn', '雙色水果玉米');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1779', '["雙髻鯊","刀魟","雙頭魚","daggerhead","double-headed shark"]', '魚貝類', 'AI生成', NULL, '雙髻鯊');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1780', '["雙髻鯊肉","雙髻魚腹肉","sawshark belly meat","雙髻鯊腹肉"]', '魚貝類', 'AI生成', NULL, '雙髻鯊腹肉');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1781', '["中筋麵粉","半筋半梗麵粉","medium protein wheat flour","all-purpose flour (depending on local interpretation)","雜糧中筋麵粉"]', '穀物類', 'AI生成', NULL, '雜糧中筋麵粉');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1782', '["高筋雜糧麵粉","強力雜糧麵粉","whole grain strong flour","strong whole wheat flour with grains","雜糧高筋麵粉"]', '穀物類', 'AI生成', NULL, '雜糧高筋麵粉');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1783', '["雞尾椎","Chicken Tail Vertebrae","Chicken Spinal Column"]', '肉類', 'AI生成', NULL, '雞尾椎');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1784', '["雞心肉","雞胸肉按壓痕","chicken heart","heart meat","雞心(肉雞)"]', '肉類', 'AI生成', NULL, '雞心(肉雞)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1785', '["雞心","雞肉圈","雞胸花紋","chicken heart","gizzard meat","雞心(肉雞)(2021年取樣)"]', '肉類', 'AI生成', NULL, '雞心(肉雞)(2021年取樣)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1786', '["土雞排","炸雞排","雞肉排","fried chicken cutlet","chicken cutlet","grilled chicken chop","雞排(土雞)"]', '肉類', 'AI生成', NULL, '雞排(土雞)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1787', '["雞排","炸雞排","雞肉排","雞胸排","chicken cutlet","fried chicken cutlet","pounded chicken","Japanese-style chicken cutlet","雞排(肉雞)"]', '肉類', 'AI生成', NULL, '雞排(肉雞)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1788', '["雞排","炸雞排","煎雞排","fried chicken cutlet","grilled chicken cutlet","chicken cutlet","雞排(肉雞)(2021年取樣)"]', '肉類', 'AI生成', NULL, '雞排(肉雞)(2021年取樣)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1789', '["雞排","Chicken cutlet","Chicken fillet","雞排平均值"]', '肉類', 'AI生成', NULL, '雞排平均值');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1790', '["雞蛋卷","炸雞蛋卷","egg roll","fried egg roll","雞水波蛋","Egg roll"]', '蛋類', 'AI生成', 'Egg roll', '雞水波蛋');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1791', '["雞蛋卷","水煮雞蛋","Egg roll","Spring roll (in some contexts)","雞水煮蛋"]', '蛋類', 'AI生成', 'Egg roll', '雞水煮蛋');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1792', '["雞蛋卷","煎餃","egg roll","fried dumpling wrap","雞水煮蛋白","Egg roll"]', '蛋類', 'AI生成', 'Egg roll', '雞水煮蛋白');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1793', '["雞蛋黃水煮","蛋黃水煮","boiled egg yolk in chicken broth","poached egg yolk with chicken soup","雞水煮蛋黃","Egg roll"]', '蛋類', 'AI生成', 'Egg roll', '雞水煮蛋黃');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1794', '["雞脂","雞油膏","雞油"]', '油脂類', 'AI生成', NULL, '雞油');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1795', '["雞蛋卷","蛋捲","egg roll","spring roll (誤稱, 非正式使用)","雞滷蛋(市售)","Egg roll"]', '蛋類', 'AI生成', 'Egg roll', '雞滷蛋(市售)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1796', '["滷蛋","滷水蛋","浸泡滷蛋","boiled egg in sauce","marinated egg","雞滷蛋(浸泡隔夜)","Egg roll"]', '蛋類', 'AI生成', 'Egg roll', '雞滷蛋(浸泡隔夜)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1797', '["雞蛋卷","炸雞蛋卷","egg roll","fried egg roll","雞滷蛋(現煮)","Egg roll"]', '蛋類', 'AI生成', 'Egg roll', '雞滷蛋(現煮)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1798', '["雞滷蛋","雞滷蛋白(浸泡隔夜)","Egg roll"]', '蛋類', 'AI生成', 'Egg roll', '雞滷蛋白(浸泡隔夜)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1799', '["雞蛋卷","egg roll","spring roll (misused)","Chinese egg roll","雞滷蛋白(現煮)","Egg roll"]', '蛋類', 'AI生成', 'Egg roll', '雞滷蛋白(現煮)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1800', '["滷蛋","hard-boiled egg with chicken broth","preserved egg in chicken stock","雞滷蛋黃(浸泡隔夜)","Egg roll"]', '蛋類', 'AI生成', 'Egg roll', '雞滷蛋黃(浸泡隔夜)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1801', '["雞肉燜蛋黃","滷蛋黃","雞湯蛋黃","poached chicken egg yolk","chicken-flavored marinated egg yolk","egg yolk in chicken broth","雞滷蛋黃(現煮)","Egg roll"]', '蛋類', 'AI生成', 'Egg roll', '雞滷蛋黃(現煮)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1802', '["雞膚","雞皮(肉雞)"]', '肉類', 'AI生成', NULL, '雞皮(肉雞)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1803', '["雞皮蛋","egg roll","spring roll","Egg roll"]', '蛋類', 'AI生成', 'Egg roll', '雞皮蛋');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1804', '["雞蛋卷","春捲的變種","spring roll variant","egg wash roll","雞皮蛋平均值","Egg roll"]', '蛋類', 'AI生成', 'Egg roll', '雞皮蛋平均值');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1805', '["雞蛋蛋","雞蛋子","雞丸","capon seed","cock's nut","rooster balls","雞睪丸"]', '肉類', 'AI生成', NULL, '雞睪丸');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1806', '["雞味精","雞肉精","chicken flavoring","chicken bouillon","雞精"]', '加工調理食品及其他類', 'AI生成', NULL, '雞精');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1807', '["雞肉絞","雞碎肉","雞肉蓉","ground chicken","minced chicken","雞絞肉"]', '肉類', 'AI生成', NULL, '雞絞肉');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1808', '["雞絲面","雞肉細麵","chicken thread noodle","shredded chicken noodles","雞絲麵"]', '加工調理食品及其他類', 'AI生成', NULL, '雞絲麵');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1809', '["雞肉乾","肉酥","雞酥","chicken floss","chicken cracklings","雞肉酥","Chicken"]', '加工調理食品及其他類', 'AI生成', 'Chicken', '雞肉酥');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1810', '["大雞肉腸","長形雞香腸","大隻雞肉腸","large chicken sausage","big chicken frankfurter","long chicken wiener","雞肉香腸(大)","Chicken"]', '加工調理食品及其他類', 'AI生成', 'Chicken', '雞肉香腸(大)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1811', '["小雞肉腸","迷你雞香腸","mini chicken sausage","small chicken sausage","雞肉香腸(小)","Chicken"]', '加工調理食品及其他類', 'AI生成', 'Chicken', '雞肉香腸(小)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1812', '["雞膿","鷄肝","chicken liver","gizzard (注意：雞膿和鷄肝在英文中通常不等同於gizzard，但有時可能會被誤稱為內臟的一部分)","雞肝(肉雞)"]', '肉類', 'AI生成', NULL, '雞肝(肉雞)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1813', '["雞腎","雞肫","gizzard of meat chicken","雞胗(肉雞)"]', '肉類', 'AI生成', NULL, '雞胗(肉雞)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1814', '["雞胸骨湯","雞骨湯","Chicken Rib Soup","Bone Broth"]', '肉類', 'AI生成', NULL, '雞胸骨湯');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1815', '["雞掌","鷄爪","鷹爪","鳳爪","豬手(誤稱)","雞腳筋","chicken feet","paws","claws","fingers","gizzards (誤稱)","雞腳(肉雞)"]', '肉類', 'AI生成', NULL, '雞腳(肉雞)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1816', '["雞腿菇","Chicken Leg Mushroom","Maitake Dusi Toko"]', '菇類', 'AI生成', NULL, '雞腿菇');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1817', '["雞腿菇","Chicken Leg Mushroom","Hypsizygus Ulmarium","雞腿菇(乾)"]', '菇類', 'AI生成', NULL, '雞腿菇(乾)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1818', '["雞軟骨","雞腳軟骨","chicken feet cartilage","chicken knuckle tendons","chicken foot tendon","雞膝軟骨(肉雞)"]', '肉類', 'AI生成', NULL, '雞膝軟骨(肉雞)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1819', '["雞子","鷄卵","雞卵","egg","bird's egg","hen's egg","雞蛋(白殼)","Egg roll"]', '蛋類', 'AI生成', 'Egg roll', '雞蛋(白殼)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1820', '["高DHA雞蛋","腦力雞蛋","High DHA egg","Brainpower Egg","雞蛋(高DHA)","Egg roll"]', '蛋類', 'AI生成', 'Egg roll', '雞蛋(高DHA)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1821', '["雞蛋","egg","bird's egg","雞蛋(高亞麻油酸)","Egg roll"]', '蛋類', 'AI生成', 'Egg roll', '雞蛋(高亞麻油酸)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1822', '["雞蛋卷","蛋餅","egg roll","spring roll","雞蛋(高次亞麻油酸)","Egg roll"]', '蛋類', 'AI生成', 'Egg roll', '雞蛋(高次亞麻油酸)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1823', '["雞蛋","鷄卵","egg","bird's egg","雞蛋(高維生素A&E)","Egg roll"]', '蛋類', 'AI生成', 'Egg roll', '雞蛋(高維生素A&E)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1824', '["雞蛋","維他命E雞蛋","vitamin E egg","雞蛋(高維生素E)","Egg roll"]', '蛋類', 'AI生成', 'Egg roll', '雞蛋(高維生素E)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1825', '["雞卵","雞子","蛋","egg","雞蛋(黃殼)","Egg roll"]', '蛋類', 'AI生成', 'Egg roll', '雞蛋(黃殼)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1826', '["春捲","餃子卷","spring roll","Chinese spring roll","雞蛋平均值","Egg roll"]', '蛋類', 'AI生成', 'Egg roll', '雞蛋平均值');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1827', '["雞蛋白","白殼蛋","egg white","albumen","雞蛋白(白殼)","Egg roll"]', '蛋類', 'AI生成', 'Egg roll', '雞蛋白(白殼)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1828', '["雞蛋黃殼","雞蛋","egg","hen egg","雞蛋白(黃殼)","Egg roll"]', '蛋類', 'AI生成', 'Egg roll', '雞蛋白(黃殼)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1829', '["春捲","蛋捲","spring roll","egg roll","雞蛋白平均值","Egg roll"]', '蛋類', 'AI生成', 'Egg roll', '雞蛋白平均值');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1830', '["豆花水","蛋花湯","豆腐腦汁","soy milk with egg","egg in soy milk","雞蛋豆漿","Soy milk"]', '加工調理食品及其他類', 'AI生成', 'Soy milk', '雞蛋豆漿');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1831', '["蛋豆腐","水豆腐","雞蛋豆腐","Tofu"]', '加工調理食品及其他類', 'AI生成', 'Tofu', '雞蛋豆腐');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1832', '["雞蛋餃","炸雞捲","spring roll","egg roll wrapper noodles","雞蛋麵","Egg roll"]', '加工調理食品及其他類', 'AI生成', 'Egg roll', '雞蛋麵');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1833', '["蛋黃","雞蛋黃","蛋白","egg yolk","yellow of egg","雞蛋黃(白殼)","Egg roll"]', '蛋類', 'AI生成', 'Egg roll', '雞蛋黃(白殼)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1834', '["蛋黃","雞蛋黃","維生素E蛋黃","egg yolk","vitamin E egg yolk","雞蛋黃(高維生素E)","Egg roll"]', '蛋類', 'AI生成', 'Egg roll', '雞蛋黃(高維生素E)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1835', '["蛋黃","雞卵黃","黃殼蛋","egg yolk","yellow of egg","雞蛋黃(黃殼)","Egg roll"]', '蛋類', 'AI生成', 'Egg roll', '雞蛋黃(黃殼)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1836', '["蛋卷","春捲","spring roll","Chinese dumpling roll","雞蛋黃平均值","Egg roll"]', '蛋類', 'AI生成', 'Egg roll', '雞蛋黃平均值');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1837', '["雞蛋卷","雞肉捲","春捲的變種","spring roll variant","vegetable meat roll","deep-fried egg wrap","雞鐵蛋","Egg roll"]', '蛋類', 'AI生成', 'Egg roll', '雞鐵蛋');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1838', '["雪白菇","white snow mushroom","white mushroom"]', '菇類', 'AI生成', NULL, '雪白菇');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1839', '["雪白菇","white snow mushroom","ivory mushroom","雪白菇(長)"]', '菇類', 'AI生成', NULL, '雪白菇(長)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1840', '["雪螺","白螺","snow snail","white snail"]', '魚貝類', 'AI生成', NULL, '雪螺');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1841', '["雪裡紅","雪裡鯖","mustard spinach","Chinese flowering cabbage","雪裡蕻"]', '蔬菜類', 'AI生成', NULL, '雪裡蕻');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1842', '["雪餅","snow cake","iced bun"]', '糕餅點心類', 'AI生成', NULL, '雪餅');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1843', '["零食泡麵","方便食品","snack instant noodles","instant snack noodles"]', '糕餅點心類', 'AI生成', NULL, '零食泡麵');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1844', '["黑豆","青仁豆","black soybean","blue-black soybean","青仁黑豆"]', '豆類', 'AI生成', NULL, '青仁黑豆');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1845', '["青嘴龍占魚","Alaska blackfish","Dallia pectoralis"]', '魚貝類', 'AI生成', 'Alaska blackfish', '青嘴龍占魚');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1846', '["青星九刺鮨","Blue-star Nine-spine Puffer","Ninestarf Blunthead"]', '魚貝類', 'AI生成', NULL, '青星九刺鮨');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1847', '["青星九刺鮨","Blue-spotted Nine-stripe Fugu","Takifugu mertensii","青星九刺鮨平均值"]', '魚貝類', 'AI生成', NULL, '青星九刺鮨平均值');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1848', '["青星九刺鮨","阿拉斯加黑魚","Alaska blackfish","Dallia pectoralis","青星九刺鮨魚片"]', '魚貝類', 'AI生成', 'Alaska blackfish', '青星九刺鮨魚片');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1849', '["青木瓜","生木瓜","papaya","pawpaw","papaia","tree melon","Papaya"]', '水果類', 'AI生成', 'Papaya', '青木瓜');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1850', '["青梅","胭脂梅","酸梅","green plum","red plum","青梅(胭脂梅)"]', '水果類', 'AI生成', NULL, '青梅(胭脂梅)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1851', '["青江菜","水蕹菜","甜莖","Chinese celery","Sesame leaf","Celery mustard","青江菜(土植)(10月取樣)"]', '蔬菜類', 'AI生成', NULL, '青江菜(土植)(10月取樣)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1852', '["青梗白","上海白菜","上海青","Chinese celery","celery mustard","green chard","青江菜(土植)(1月取樣)"]', '蔬菜類', 'AI生成', NULL, '青江菜(土植)(1月取樣)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1853', '["青江菜","小松菜","Chinese celery","Chinese parsley","青江菜(土植)(3月取樣)"]', '蔬菜類', 'AI生成', NULL, '青江菜(土植)(3月取樣)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1854', '["青梗菜","上海青","小棠菜","Chinese celery","Green-stem mustard spinach","Water bamboo","青江菜(土植)(4月取樣)"]', '蔬菜類', 'AI生成', NULL, '青江菜(土植)(4月取樣)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1855', '["青梗白菜","小江芥菜","Chinese celery","Water bamboo","青江菜(土植)(7月取樣)"]', '蔬菜類', 'AI生成', NULL, '青江菜(土植)(7月取樣)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1856', '["青江菜","油菜心","Chinese celery","Celery stalks","青江菜(有機)(10月取樣)"]', '蔬菜類', 'AI生成', NULL, '青江菜(有機)(10月取樣)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1857', '["青梗白","青梗菜","上海青","Chinese celery","Gow choy","青江菜(有機)(1月取樣)"]', '蔬菜類', 'AI生成', NULL, '青江菜(有機)(1月取樣)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1858', '["青梗菜","上海青","Chinese celery","celery stalks","青江菜(有機)(4月取樣)"]', '蔬菜類', 'AI生成', NULL, '青江菜(有機)(4月取樣)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1859', '["青江菜","白梗菜","Chinese celery","Tsai tsai","青江菜(有機)(7月取樣)"]', '蔬菜類', 'AI生成', NULL, '青江菜(有機)(7月取樣)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1860', '["青梗白菜","上海青","Chinese celery","Water spinach (Note: This may be a mistake as it's different from 青江菜)","青江菜(水耕)(10月取樣)"]', '蔬菜類', 'AI生成', NULL, '青江菜(水耕)(10月取樣)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1861', '["青梗菜","小江白菜","Chinese celery","Water spinach","青江菜(水耕)(1月取樣)"]', '蔬菜類', 'AI生成', NULL, '青江菜(水耕)(1月取樣)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1862', '["青江菜","水菜","Chinese celery","Water celery","青江菜(水耕)(4月取樣)"]', '蔬菜類', 'AI生成', NULL, '青江菜(水耕)(4月取樣)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1863', '["青梗菜","水蕹菜","Chinese celery","Water spinach (note: this is a different plant, but may be confused due to cultivation method)","青江菜(水耕)(7月取樣)"]', '蔬菜類', 'AI生成', NULL, '青江菜(水耕)(7月取樣)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1864', '["葡萄柚","西柚","pomelo","Chinese grapefruit","青皮葡萄柚","Common grape"]', '水果類', 'AI生成', 'Common grape', '青皮葡萄柚');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1865', '["西蘭花","綠菜花","Broccoli","Italian cauliflower","青花菜(1999年取樣)"]', '蔬菜類', 'AI生成', 'Broccoli', '青花菜(1999年取樣)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1866', '["青花菜","綠花椰菜","西蘭花","broccoli","calabrese","青花菜(2021年取樣)","Broccoli"]', '蔬菜類', 'AI生成', 'Broccoli', '青花菜(2021年取樣)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1867', '["青花菜","綠花椰菜","broccoli","calabrese","青花菜筍","Broccoli"]', '蔬菜類', 'AI生成', 'Broccoli', '青花菜筍');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1868', '["青花菜","西蘭花","綠菜花","broccoli","青花菜芽","Broccoli"]', '蔬菜類', 'AI生成', 'Broccoli', '青花菜芽');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1869', '["野青菜","草雞冠花","green amaranth","Chinese spinach","青葙"]', '蔬菜類', 'AI生成', NULL, '青葙');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1870', '["青蔥","蒜苗","green garlic","spring onion (immature)","young garlic stalks","青蒜"]', '蔬菜類', 'AI生成', NULL, '青蒜');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1871', '["青蒜","大蔥","green onion","spring onion","scallion","青蔥(有機)"]', '蔬菜類', 'AI生成', NULL, '青蔥(有機)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1872', '["青蒜","韮蔱","green onion","spring onion","scallion","青蔥平均值"]', '蔬菜類', 'AI生成', NULL, '青蔥平均值');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1873', '["青蘿蔔","黑皮白蘿蔔","西班牙黑蘿蔔","black radish","Black Spanish round","Gros Noir d'Hiver","Black radish"]', '蔬菜類', 'AI生成', 'Black radish', '青蘿蔔');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1874', '["青辣椒","綠辣椒","green chili","young pepper","青辣椒平均值"]', '蔬菜類', 'AI生成', NULL, '青辣椒平均值');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1875', '["青醬","green sauce","pesto"]', '調味料及香辛料類', 'AI生成', NULL, '青醬');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1876', '["青龍果","青蘋果","綠蘋果","green apple","crisp apple","sour apple","青龍蘋果","Apple"]', '水果類', 'AI生成', 'Apple', '青龍蘋果');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1877', '["鞍帶石斑魚片","Alaska blackfish","Dallia pectoralis"]', '魚貝類', 'AI生成', 'Alaska blackfish', '鞍帶石斑魚片');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1878', '["韓國泡菜","辣白菜","酸菜","Korean kimchi","Korean pickled cabbage","韓式泡菜"]', '加工調理食品及其他類', 'AI生成', NULL, '韓式泡菜');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1879', '["韭花醬","韭菜花","pickled garlic chives sauce","garlic chive flower sauce"]', '調味料及香辛料類', 'AI生成', NULL, '韭花醬');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1880', '["韭芽盒","韭菜包","garlic chives dumplings","Chinese chive turnover","韭菜盒子","Chinese chives"]', '加工調理食品及其他類', 'AI生成', 'Chinese chives', '韭菜盒子');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1881', '["韮菜","韮蔥","細香蔥","leek","spring onion (bulb)","scallion (green part)"]', '蔬菜類', 'AI生成', NULL, '韮菜');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1882', '["韭黃花","韭菜花","garlic chive flower","Chinese chives flower","韮菜花"]', '蔬菜類', 'AI生成', NULL, '韮菜花');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1883', '["韭黃","黃韭菜","雞腸草","leek sprout","spring leek","韮黃"]', '蔬菜類', 'AI生成', NULL, '韮黃');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1884', '["食茱萸","Japanese spice bush","Evodia fruit"]', '蔬菜類', 'AI生成', NULL, '食茱萸');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1885', '["餐包","餐餅","meal bun","tea cake"]', '糕餅點心類', 'AI生成', NULL, '餐包');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1886', '["餘甘子","喉甘果","金柑","金桔","青梅","sour orange","amarelle","acid orange","berbeari fruit","Indian gooseberry"]', '水果類', 'AI生成', NULL, '餘甘子');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1887', '["餛飩皮","雲吞皮","抄手皮","wonton wrapper","dumpling skin"]', '加工調理食品及其他類', 'AI生成', NULL, '餛飩皮');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1888', '["香吉士","Kiwifruit","Chinese gooseberry","香吉士(進口)"]', '水果類', 'AI生成', NULL, '香吉士(進口)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1889', '["香椿末","香椿調味醬","Chinaberry Leaf Sauce","Chinese Toon Seed Paste","香椿醬"]', '調味料及香辛料類', 'AI生成', NULL, '香椿醬');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1890', '["香椿","香樁"]', '蔬菜類', 'AI生成', NULL, '香樁');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1891', '["香水李","水蜜桃李","Rainwater Plum","Plum Rain","Raintree Plum"]', '水果類', 'AI生成', NULL, '香水李');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1892', '["香水芒","芒果王","mango","kensington pride","clare's delight","香水芒果","Mango"]', '水果類', 'AI生成', 'Mango', '香水芒果');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1893', '["香麻油","芝麻油","sesame oil","香油"]', '調味料及香辛料類', 'AI生成', NULL, '香油');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1894', '["香瓜茄","甜椒茄","蜜瓜茄","sweet pepper eggplant","melon eggplant","sugar eggplant"]', '蔬菜類', 'AI生成', NULL, '香瓜茄');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1895', '["鯖魚罐頭","長尾 tuna 罐頭","albacore fish can","albacore tuna can","tuna in aspic with bamboo shoot can","white meat tuna can","香筍鮪魚罐頭","Albacore tuna"]', '加工調理食品及其他類', 'AI生成', 'Albacore tuna', '香筍鮪魚罐頭');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1896', '["香腸","臘腸","腸","肉腸","豬腸","廣式腸","蘇式腸","sausage","hot dog","banger","snagger","boiled sausage","bratwurst","salami","chorizo","Sausage"]', '加工調理食品及其他類', 'AI生成', 'Sausage', '香腸');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1897', '["蒜香腸","大蒜香腸","蒜味腸","garlic sausage","pork garlic sausage","sausage with garlic flavor","香腸(蒜味)","Sausage"]', '加工調理食品及其他類', 'AI生成', 'Sausage', '香腸(蒜味)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1898', '["香芋","冬瓜","taro winter melon","fragrant taro","香芋冬瓜"]', '蔬菜類', 'AI生成', NULL, '香芋冬瓜');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1899', '["香菜","芫茜","巴西薑","coriander leaves","Chinese parsley","cilantro","香芫荽"]', '蔬菜類', 'AI生成', NULL, '香芫荽');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1900', '["香草雪糕","香草凍","vanilla ice cream","vanilla cream","香草冰淇淋"]', '糕餅點心類', 'AI生成', NULL, '香草冰淇淋');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1901', '["冬菇","厚菇","北菇","shiitake mushroom","black forest mushroom","dried shiitake","香菇(大)"]', '菇類', 'AI生成', NULL, '香菇(大)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1902', '["小香菇","小花菇","baby mushroom","small mushroom","香菇(小)"]', '菇類', 'AI生成', NULL, '香菇(小)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1903', '["冬菇","乾香菇","鮮香菇","shiitake mushroom","dried shiitake","fresh shiitake","香菇平均值"]', '菇類', 'AI生成', NULL, '香菇平均值');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1904', '["香菇面筋罐頭","香菇素肉罐頭","mushroom and gluten canned food","mushroom and wheat gluten in a can","香菇麵筋罐頭"]', '加工調理食品及其他類', 'AI生成', NULL, '香菇麵筋罐頭');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1905', '["香華洋香瓜","Fragrant Oriental Melon","Xianghua Crenshaw"]', '水果類', 'AI生成', NULL, '香華洋香瓜');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1906', '["香螺","鳳尾螺","海螺","fragrant whelk","whelk","sea snail","香螺 "]', '魚貝類', 'AI生成', NULL, '香螺 ');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1907', '["醋","酸水","米醋","香醋","vinegar","acetic acid solution","sour sauce","Vinegar"]', '調味料及香辛料類', 'AI生成', 'Vinegar', '香醋');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1908', '["香魚","Alaska blackfish","Dallia"]', '魚貝類', 'AI生成', 'Alaska blackfish', '香魚');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1909', '["香魚","黑鱂","黑鱂魚","Alaska blackfish","Dallia pectoralis","Northern Alaska blackfish","香魚片"]', '加工調理食品及其他類', 'AI生成', 'Alaska blackfish', '香魚片');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1910', '["馬拉巴笛鯛","笛鯛","Malabar goby","pipefish"]', '魚貝類', 'AI生成', NULL, '馬拉巴笛鯛');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1911', '["土豆","洋芋","土瓜","地蘿蔔","山藥蛋","薯仔","番仔薯","紅薯(注意：這個有時會用來指甜薯)","白薯","potato","spud","tater","murphy","Irish apple","Irish turnip","earth apple","ground apple","馬鈴薯","Baked potato"]', '澱粉類', 'AI生成', 'Baked potato', '馬鈴薯');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1912', '["土豆","洋芋","地蘿蔔","山薯","土瓜","土卵","土果","花生豆","番仔薯","白薯","紅薯（注意：紅薯通常指的是甘藷，請確認是否需要區分）","薯仔","萵頭","potato","spud","tater","murphy","Irish apple","Irish turnip","ground apple","white potato","baked tater","馬鈴薯(2022年取樣)","Baked potato"]', '澱粉類', 'AI生成', 'Baked potato', '馬鈴薯(2022年取樣)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1913', '["土豆","洋芋","馬鈴薯","薯仔","地瓜粉","山藥蛋","potato","spud","tater","murphy","Irish apple","Rumpy Bump","馬鈴薯粉","Baked potato"]', '澱粉類', 'AI生成', 'Baked potato', '馬鈴薯粉');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1914', '["馬齒菜","酸味草","豆腐柴","雞眼草","折耳根","pusley","prostrate pigweed","buck's horn plantain","dew plant","馬齒莧"]', '蔬菜類', 'AI生成', NULL, '馬齒莧');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1915', '["駝背鱸","humpback perch"]', '魚貝類', 'AI生成', NULL, '駝背鱸');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1916', '["土雞腿","鄉村雞腿","散養雞腿","free-range chicken leg","country chicken thigh","native chicken leg","骨腿(土雞)"]', '肉類', 'AI生成', NULL, '骨腿(土雞)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1917', '["雞腿骨","大雞腿","全雞腿","chicken thigh bone","drumstick with bone","whole chicken leg","骨腿(肉雞)"]', '肉類', 'AI生成', NULL, '骨腿(肉雞)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1918', '["骨腿","骨腿平均值"]', '肉類', 'AI生成', NULL, '骨腿平均值');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1919', '["豌豆莢","青豆角","毛豆莢","snap pea pod","snow pea pod","pea pod","高山大豌豆莢","Asian pear"]', '豆類', 'AI生成', 'Asian pear', '高山大豌豆莢');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1920', '["青皮甜椒","綠色甜椒","green bell pepper","sweet green pepper","高山甜椒(青皮)"]', '蔬菜類', 'AI生成', NULL, '高山甜椒(青皮)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1921', '["紅高粱","糜子","蜀黍","millet","sorghum","Chinese millet","Guinea corn","高梁"]', '穀物類', 'AI生成', NULL, '高梁');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1922', '["高粱醋","紅麴醋","red rice vinegar","sorghum vinegar","高梁醋","Vinegar"]', '調味料及香辛料類', 'AI生成', 'Vinegar', '高梁醋');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1923', '["高油酸棕櫚油","High Oleic Palm Oil"]', '油脂類', 'AI生成', NULL, '高油酸棕櫚油');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1924', '["高油酸紅花籽油","高油酸紅花油","high oleic red flower seed oil","high oleic red poppyseed oil"]', '油脂類', 'AI生成', NULL, '高油酸紅花籽油');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1925', '["高油酸葵花籽油","高亞麻酸葵花籽油","High Oleic Sunflower Oil","Sunola Oil"]', '油脂類', 'AI生成', NULL, '高油酸葵花籽油');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1926', '["高油酸豬油","high oleic pork lard"]', '油脂類', 'AI生成', NULL, '高油酸豬油');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1927', '["豬骨高湯","大骨湯","豬大骨熬製的湯","pork bone broth","pork stock","braised pork bones soup","高湯(豬大骨)"]', '調味料及香辛料類', 'AI生成', NULL, '高湯(豬大骨)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1928', '["排骨高湯塊","濃縮排骨高湯","braised pork bone stock cube","pork rib bouillon cube","高湯塊(排骨)"]', '調味料及香辛料類', 'AI生成', NULL, '高湯塊(排骨)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1929', '["雞湯塊","濃縮雞精","雞肉高湯塊","雞骨高湯塊","concentrated chicken bouillon cube","chicken stock cube","chicken broth concentrate","高湯塊(雞肉)","Chicken"]', '調味料及香辛料類', 'AI生成', 'Chicken', '高湯塊(雞肉)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1930', '["高牆桶柑","tall wall tangerine"]', '水果類', 'AI生成', NULL, '高牆桶柑');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1931', '["高筋麵粉","high-gluten flour"]', '穀物類', 'AI生成', NULL, '高筋麵粉');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1932', '["高筋粉","強力麵粉","strong flour","high-gluten flour","高筋麵粉(2021年取樣)"]', '穀物類', 'AI生成', NULL, '高筋麵粉(2021年取樣)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1933', '["野稻","水穀","Canada rice","Indian rice","water oats","高纖米","Annual wild rice"]', '穀物類', 'AI生成', 'Annual wild rice', '高纖米');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1934', '["高纖維胚芽冬粉","高纖維幼芽粉絲","全穀胚芽粉絲","High Fiber Sprout Vermicelli","Whole Grain Sprout Noodles","高纖胚芽冬粉"]', '加工調理食品及其他類', 'AI生成', NULL, '高纖胚芽冬粉');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1935', '["高脂保久乳","長效奶粉","high-fat long-lasting milk","long-life high fat milk"]', '乳品類', 'AI生成', NULL, '高脂保久乳');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1936', '["高脂凝態發酵乳","纖維強化發酵乳","high-fat set yogurt with fiber","fiber-enriched fermented milk","高脂凝態發酵乳(纖維強化)"]', '乳品類', 'AI生成', NULL, '高脂凝態發酵乳(纖維強化)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1937', '["高脂強化鮮乳","寡醣強化牛奶","High-Fat Fortified Milk","Oligosaccharide-Enriched Milk","高脂強化鮮乳(寡醣強化)"]', '乳品類', 'AI生成', NULL, '高脂強化鮮乳(寡醣強化)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1938', '["高脂強化鮮奶","鈣質牛奶","營養增強奶","high-fat fortified milk with calcium","calcium enriched milk","fortified dairy drink","高脂強化鮮乳(鈣強化)"]', '乳品類', 'AI生成', NULL, '高脂強化鮮乳(鈣強化)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1939', '["鮮牛奶","濃乳","rich milk","full-fat fresh milk","高脂鮮乳"]', '乳品類', 'AI生成', NULL, '高脂鮮乳');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1940', '["高脂鮮羊乳","濃郁羊奶","High-fat fresh sheep milk","Rich sheep's milk"]', '乳品類', 'AI生成', NULL, '高脂鮮羊乳');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1941', '["高鮮味精","high umami seasoning","MSG seasoning"]', '調味料及香辛料類', 'AI生成', NULL, '高鮮味精');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1942', '["高麗馬加鰆","Korean mackerel scad","Mackerel scad","Spanish mackerel"]', '魚貝類', 'AI生成', NULL, '高麗馬加鰆');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1943', '["發菜","黑絲草","天節子","神仙菜","hair vegetable","black moss","tze chee","髮菜"]', '藻類', 'AI生成', NULL, '髮菜');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1944', '["松餅","鬆餅","pancake","waffle"]', '糕餅點心類', 'AI生成', NULL, '鬆餅');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1945', '["胡子鯰","鯰魚","河鲶","catfish with beard","bearded catfish","moustache catfish","鬍鯰"]', '魚貝類', 'AI生成', NULL, '鬍鯰');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1946', '["鬚蝦","紅毛蝦","red beard shrimp","bearded shrimp","鬚赤蝦","Shrimp"]', '魚貝類', 'AI生成', 'Shrimp', '鬚赤蝦');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1947', '["鬚赤蝦仁","紅鬍子蝦仁","red whiskered shrimp","firebeard shrimp","Shrimp"]', '魚貝類', 'AI生成', 'Shrimp', '鬚赤蝦仁');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1948', '["鬼頭刀","鯖魚","魩仔魚","threadfin","hairtail"]', '魚貝類', 'AI生成', NULL, '鬼頭刀');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1949', '["鬼頭刀魚片","Alaska blackfish","Dallia pectoralis"]', '魚貝類', 'AI生成', 'Alaska blackfish', '鬼頭刀魚片');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1950', '["魚板","Alaska blackfish","Dallia pectoralis"]', '加工調理食品及其他類', 'AI生成', 'Alaska blackfish', '魚板');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1951', '["旗魚魚漿","Alaska blackfish","Dallia pectoralis","魚漿(旗魚)"]', '魚貝類', 'AI生成', 'Alaska blackfish', '魚漿(旗魚)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1952', '["魚翅唇","Alaska blackfish","Dallia pectoralis"]', '魚貝類', 'AI生成', 'Alaska blackfish', '魚翅唇');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1953', '["魚肉乾","魚肉脯","Alaska blackfish"]', '加工調理食品及其他類', 'AI生成', 'Alaska blackfish', '魚肉脯');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1954', '["魚鬆","魚肉松","fish flake","fish powder","魚肉鬆","Alaska blackfish"]', '加工調理食品及其他類', 'AI生成', 'Alaska blackfish', '魚肉鬆');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1955', '["魚酥","fish floss","dehydrated fish threads","Alaska blackfish"]', '糕餅點心類', 'AI生成', 'Alaska blackfish', '魚酥');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1956', '["魚露","fish sauce","nuoc mam","Alaska blackfish"]', '調味料及香辛料類', 'AI生成', 'Alaska blackfish', '魚露');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1957', '["鱂魚","黑鱂","Alaska blackfish","Dallia pectoralis","魟魚"]', '魚貝類', 'AI生成', 'Alaska blackfish', '魟魚');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1958', '["魦仔魚","Alaska blackfish","Dallia","魩仔魚"]', '魚貝類', 'AI生成', 'Alaska blackfish', '魩仔魚');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1959', '[" Alaska黑魚","阿留申魚","Alaska blackfish","Dallia pectoralis","魩仔魚(加工,大)"]', '魚貝類', 'AI生成', 'Alaska blackfish', '魩仔魚(加工,大)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1960', '[" Alaska黑魚","小黑鱸","Alaska blackfish","Dallia pectoralis","魩仔魚(加工,小)"]', '魚貝類', 'AI生成', 'Alaska blackfish', '魩仔魚(加工,小)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1961', '["魱仔魚","小黑魚","Alaska blackfish","Dallia pectoralis","魩仔魚(加工)"]', '魚貝類', 'AI生成', 'Alaska blackfish', '魩仔魚(加工)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1962', '["黑鱸魚","Alaska blackfish","Dallia pectoralis","魩仔魚平均值(加工)"]', '魚貝類', 'AI生成', 'Alaska blackfish', '魩仔魚平均值(加工)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1963', '["鳬魚","海參魚","sea ear","abalone fish","鮑魚","Alaska blackfish"]', '魚貝類', 'AI生成', 'Alaska blackfish', '鮑魚');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1964', '["鮑魚菇","Alaska blackfish","Dallia pectoralis"]', '菇類', 'AI生成', 'Alaska blackfish', '鮑魚菇');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1965', '["海鯊","海底鳩","鬼頭魚","燈光魚","燈籠魚","anglerfish","monkfish","sea devil","frogfish","lancetfish","鮟鱇"]', '魚貝類', 'AI生成', NULL, '鮟鱇');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1966', '["鮟鱇魚肝","Alaska blackfish liver","Dallia pectoralis liver","Alaska blackfish"]', '魚貝類', 'AI生成', 'Alaska blackfish', '鮟鱇魚肝');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1967', '["吞拿魚","吞拿鱼","鯖魚","金槍魚","albacore fish","albacore tuna","albicore","albie","pigfish","tombo ahi","binnaga","Pacific albacore","German bonito","longfin","longfin tuna","longfin tunny","鮪魚生魚片","Albacore tuna"]', '魚貝類', 'AI生成', 'Albacore tuna', '鮪魚生魚片');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1968', '["鮨魚肚","吞拿魚肚","albacore fish","albacore tuna","albicore","albie","pigfish","tombo ahi","binnaga","Pacific albacore","German bonito","longfin","longfin tuna","longfin tunny","鮪魚肚","Albacore tuna"]', '魚貝類', 'AI生成', 'Albacore tuna', '鮪魚肚');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1969', '["鮭魚鬆","三文魚鬆","Atlantic salmon","bay salmon","black salmon","caplin-scull salmon","fiddler","grilse","grilt","kelt","landlocked salmon","ouananiche","outside salmon","parr","Sebago salmon","silver salmon","slink","smolt","spring salmon","winnish"]', '加工調理食品及其他類', 'AI生成', 'Atlantic salmon', '鮭魚鬆');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1970', '["鮮味露","Fresh Flavor Extract","Seasoning Essence"]', '調味料及香辛料類', 'AI生成', NULL, '鮮味露');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1971', '["鮮奶巧克力","牛奶可可","可可奶","milk cocoa","cocoa milk","milky cocoa","鮮奶可可"]', '乳品類', 'AI生成', NULL, '鮮奶可可');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1972', '["鮮奶布丁","牛奶布丁","milk pudding","fresh milk pudding"]', '糕餅點心類', 'AI生成', NULL, '鮮奶布丁');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1973', '["無糖鮮奶茶","黑茶紅茶飲料","純淨鮮奶茶","unsweetened black tea with milk","plain milk black tea","black tea latte without sugar","鮮奶茶(無糖)","Black tea"]', '飲料類', 'AI生成', 'Black tea', '鮮奶茶(無糖)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1974', '["鮮雞粉","雞味精","雞湯精","Chicken-flavored MSG","Chicken essence","Chicken seasoning","鮮雞精"]', '調味料及香辛料類', 'AI生成', NULL, '鮮雞精');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1975', '["鮸魚","𩾃","mackerel scad","mafish","鮸"]', '魚貝類', 'AI生成', NULL, '鮸');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1976', '["鮰魚卵","鱈魚籽","Alaska blackfish eggs","Dallia pectoralis roe","鮸魚卵(加工)","Alaska blackfish"]', '魚貝類', 'AI生成', 'Alaska blackfish', '鮸魚卵(加工)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1977', '["鯉魚","金鰕","紅鯉","白鯉","花鯉","草鯉","carp","koi","cyprinus carpio","red carp","grass carp","鯉"]', '魚貝類', 'AI生成', NULL, '鯉');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1978', '["鯊魚片","鮫魚切片","shark slice","shark meat slice","鯊魚切片","Alaska blackfish"]', '魚貝類', 'AI生成', 'Alaska blackfish', '鯊魚切片');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1979', '["鯊魚煙","Alaska blackfish","Dallia pectoralis"]', '加工調理食品及其他類', 'AI生成', 'Alaska blackfish', '鯊魚煙');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1980', '["魚皮","鯊魚翅","鯊魚皮","Alaska blackfish"]', '魚貝類', 'AI生成', 'Alaska blackfish', '鯊魚皮');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1981', '["鯊魚翅","魚翅","shark fin","fish wing","Alaska blackfish"]', '魚貝類', 'AI生成', 'Alaska blackfish', '鯊魚翅');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1982', '["鱖魚","黑鱖","Alaska blackfish","Dallia pectoralis","鯔(11月,雄魚)"]', '魚貝類', 'AI生成', 'Alaska blackfish', '鯔(11月,雄魚)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1983', '["黑魚","Alaska blackfish","Dallia pectoralis","鯔(11月,雌魚)"]', '魚貝類', 'AI生成', 'Alaska blackfish', '鯔(11月,雌魚)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1984', '["黑鱔魚","阿拉斯加黑魚","Alaska blackfish","Dallia pectoralis","鯔(12月,雄魚)"]', '魚貝類', 'AI生成', 'Alaska blackfish', '鯔(12月,雄魚)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1985', '["鯔","Alaska blackfish","Dallia pectoralis","鯔(12月,雌魚)"]', '魚貝類', 'AI生成', 'Alaska blackfish', '鯔(12月,雌魚)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1986', '["鯔魚","鰣魚","sand lance","launce","pilchard","鯔(2月)"]', '魚貝類', 'AI生成', NULL, '鯔(2月)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1987', '["𩾃魚","馬頭鳁","mackerel scad","maubee","鯔(4月)"]', '魚貝類', 'AI生成', NULL, '鯔(4月)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1988', '["鯔(8月)","刀魚","白鱸","August pomfret","white croaker"]', '魚貝類', 'AI生成', NULL, '鯔(8月)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1989', '["鯔魚","帶皮鯔","鯔(含皮)"]', '魚貝類', 'AI生成', NULL, '鯔(含皮)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1990', '["鯔魚片","鯃魚切片","spotted knifejaw slice","mottled pikeknife fillet","鯔切片"]', '魚貝類', 'AI生成', NULL, '鯔切片');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1991', '["鯔","刀魚","pike perch","sand bass","鯔平均值(去皮)"]', '魚貝類', 'AI生成', NULL, '鯔平均值(去皮)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1992', '["鯔魚卵","Alaska blackfish","Dallia pectoralis"]', '魚貝類', 'AI生成', 'Alaska blackfish', '鯔魚卵');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1993', '["鯔魚卵","Alaska blackfish eggs","Dallia pectoralis roe","鯔魚卵(加工)","Alaska blackfish"]', '加工調理食品及其他類', 'AI生成', 'Alaska blackfish', '鯔魚卵(加工)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1994', '["鯔魚卵","Alaska blackfish","Dallia pectoralis","鯔魚卵(加工)(2022年取樣)"]', '加工調理食品及其他類', 'AI生成', 'Alaska blackfish', '鯔魚卵(加工)(2022年取樣)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1995', '["鯔魚精囊","Alaska blackfish","Dallia pectoralis"]', '魚貝類', 'AI生成', 'Alaska blackfish', '鯔魚精囊');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1996', '["鯖鳁","鰣魚","鳁鱼","Boston mackerel","Atlantic mackerel","mack","scad","鯖魚(炒)"]', '魚貝類', 'AI生成', 'Atlantic mackerel', '鯖魚(炒)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1997', '["鯖鳁","鯖鱼","马鲛鱼","鳁鲸鱼","Boston mackerel","Atlantic mackerel","mack","scad","鯖魚(炸)"]', '魚貝類', 'AI生成', 'Atlantic mackerel', '鯖魚(炸)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1998', '["鯖鳁","鳁鱼","三文魚（注意：這裡指的不是 salmon, 而是鯖鱼的误称）","Boston mackerel","Atlantic mackerel","mack","鯖魚(烤,150度,10分)"]', '魚貝類', 'AI生成', 'Atlantic mackerel', '鯖魚(烤,150度,10分)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_1999', '["鳁鱼","马鲛鱼","鳁","鰆","鯖","Boston mackerel","mack","scummer","mackrel","鯖魚(烤,150度,20分)","Atlantic mackerel"]', '魚貝類', 'AI生成', 'Atlantic mackerel', '鯖魚(烤,150度,20分)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2000', '["鯖鳁","三文鱼（注意：三文鱼一般指鲑鱼，不是鯖魚）","沙丁鱼（注意：沙丁鱼与鯖魚不同科，但有时因外形相似或大小相近被误称）","Boston mackerel","Atlantic mackerel","鯖魚(烤,150度,30分)"]', '魚貝類', 'AI生成', 'Atlantic mackerel', '鯖魚(烤,150度,30分)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2001', '["鳁鱼","青干鱼","竹荚鱼","油鱼","Boston mackerel","Atlantic mackerel","Scromber scombrus","鯖魚(烤,180度,10分)"]', '魚貝類', 'AI生成', 'Atlantic mackerel', '鯖魚(烤,180度,10分)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2002', '["鯖鳁","沙甸鱼","鲭鱼","Boston mackerel","mack","scad","鯖魚(烤,210度,10分)","Atlantic mackerel"]', '魚貝類', 'AI生成', 'Atlantic mackerel', '鯖魚(烤,210度,10分)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2003', '["鯖鳁","鳁鱼","马鲛鱼","Atlantic mackerel","Boston mackerel","mack","鯖魚(煎)"]', '魚貝類', 'AI生成', 'Atlantic mackerel', '鯖魚(煎)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2004', '["鯖魚","鳁鱼","沙甸鱼","mackerel","Boston mackerel","Atlantic mackerel","鯖魚(煮)"]', '魚貝類', 'AI生成', 'Atlantic mackerel', '鯖魚(煮)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2005', '["鯖魚","青仔鳁","䲠鱼","Atlantic mackerel","Boston mackerel","mackerel","鯖魚(生)"]', '魚貝類', 'AI生成', 'Atlantic mackerel', '鯖魚(生)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2006', '["鯖鳁","鳁鱼","青腰","鲭鱼","Boston mackerel","Atlantic mackerel","鯖魚(蒸)"]', '魚貝類', 'AI生成', 'Atlantic mackerel', '鯖魚(蒸)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2007', '["鯖魚","鳁鱼","油鰭魚","mackerel","Boston mackerel","Atlantic mackerel","鯖魚(醃製)"]', '加工調理食品及其他類', 'AI生成', 'Atlantic mackerel', '鯖魚(醃製)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2008', '["鯖公","鳁鱼","Boston mackerel","Atlantic mackerel","鯖魚(醃製)(2022年取樣)"]', '加工調理食品及其他類', 'AI生成', 'Atlantic mackerel', '鯖魚(醃製)(2022年取樣)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2009', '["鯖魚肉乾","鯖魚條","Boston mackerel","mack","scad","鯖魚肉脯","Atlantic mackerel"]', '加工調理食品及其他類', 'AI生成', 'Atlantic mackerel', '鯖魚肉脯');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2010', '["鯛魚下巴","Alaska blackfish","Dallia pectoralis"]', '魚貝類', 'AI生成', 'Alaska blackfish', '鯛魚下巴');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2011', '["鰆魚卵","Alaska blackfish","Dallia pectoralis"]', '魚貝類', 'AI生成', 'Alaska blackfish', '鰆魚卵');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2012', '[" Alaska黑魚","阿拉斯加黑鱒","Alaska blackfish","Dallia pectoralis","鰈魚切片"]', '魚貝類', 'AI生成', 'Alaska blackfish', '鰈魚切片');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2013', '["鰹魚卵","Alaska blackfish","Dallia pectoralis"]', '魚貝類', 'AI生成', 'Alaska blackfish', '鰹魚卵');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2014', '["鰹魚粉","Alaska blackfish powder","Dallia pectoralis powder","Alaska blackfish"]', '調味料及香辛料類', 'AI生成', 'Alaska blackfish', '鰹魚粉');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2015', '["鯹","鯷魚","anchovy","Japanese anchovy","鱅"]', '魚貝類', 'AI生成', NULL, '鱅');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2016', '["鱱","小白鯡","striped knifejaw","whitebait","sand lance","鱖"]', '魚貝類', 'AI生成', NULL, '鱖');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2017', '["鳞网带鰆","斑马鯃","striped snake mackerel","Spanish mackerel","鱗網帶鰆(含皮)"]', '魚貝類', 'AI生成', NULL, '鱗網帶鰆(含皮)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2018', '["鱗網帶鰆","網帶鰆","mottled ribbonfish slices","鱗網帶鰆切片"]', '魚貝類', 'AI生成', NULL, '鱗網帶鰆切片');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2019', '["鱗馬鞭魚","Alaska blackfish","Dallia pectoralis"]', '魚貝類', 'AI生成', 'Alaska blackfish', '鱗馬鞭魚');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2020', '["叫姑魚","Alaska blackfish","Dallia pectoralis","鱗鰭叫姑魚"]', '魚貝類', 'AI生成', 'Alaska blackfish', '鱗鰭叫姑魚');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2021', '["鱙仔魚","黑鱙","Alaska blackfish","Dallia pectoralis","鱙仔魚(加工)"]', '魚貝類', 'AI生成', 'Alaska blackfish', '鱙仔魚(加工)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2022', '["鶴鱵","叉尾鶴鱵","anglerfish-like threadfins","forktail threadfin bream","鱷形叉尾鶴鱵"]', '魚貝類', 'AI生成', NULL, '鱷形叉尾鶴鱵');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2023', '["鳳光西瓜","紅肉西瓜","watermelon","cantaloupe melon (Note: This is generally incorrect for watermelons, but included as a common misconception)","Watermelon"]', '水果類', 'AI生成', 'Watermelon', '鳳光西瓜');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2024', '["鳳尾菜","鳳尾草","seaweed","green seaweed","鳳尾藻"]', '藻類', 'AI生成', NULL, '鳳尾藻');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2025', '["鳳尾蝦仁","大鳳尾","shrimp with凤尾 (Phoenix tail)","lobster tails shrimp","Shrimp"]', '魚貝類', 'AI生成', 'Shrimp', '鳳尾蝦仁');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2026', '["鳳梨","菠蘿","pineapple","ananas","鳳梨平均值(雜交種)","Pineapple"]', '水果類', 'AI生成', 'Pineapple', '鳳梨平均值(雜交種)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2027', '["鳳梨乾","菠蘿果乾","pineapple fruit leather","dried pineapple slices","鳳梨果乾","Pineapple"]', '糕餅點心類', 'AI生成', 'Pineapple', '鳳梨果乾');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2028', '["菠蘿汁","黃梨汁","pineapple juice","ananas juice","鳳梨汁(非原汁)","Pineapple"]', '飲料類', 'AI生成', 'Pineapple', '鳳梨汁(非原汁)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2029', '["鳳梨餠","菠蘿酥","pineapple tart","ananas pastry","鳳梨酥","Pineapple"]', '糕餅點心類', 'AI生成', 'Pineapple', '鳳梨酥');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2030', '["釋迦果","鳳梨蘒","Santana fruit","Taiwan pineapple guava","Papayaquat","鳳梨釋迦","Pineapple"]', '水果類', 'AI生成', 'Pineapple', '鳳梨釋迦');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2031', '["鳳眼糕","Phoenix Eye Cake","Fengyan Gao"]', '糕餅點心類', 'AI生成', NULL, '鳳眼糕');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2032', '["鴕鳥肉","鸵鸟牛肉","ostrich meat","ostrich beef","鴕腩肉"]', '肉類', 'AI生成', NULL, '鴕腩肉');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2033', '["鴕鳥腱肉","鸵鸟腱子肉","ostrich tendon meat","ostrich tendons","鴕腱肉"]', '肉類', 'AI生成', NULL, '鴕腱肉');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2034', '["鸵鳥沙朗肉排","鴕鳥西冷牛排","ostrich sirloin steak","ostrich strip steak","鴕鳥沙朗肉排"]', '肉類', 'AI生成', NULL, '鴕鳥沙朗肉排');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2035', '["鴕鳥牛排","非洲鸵鸟肉排","鸵鸟菲力","ostrich fillet steak","ostrich tenderloin","ostrich cutlet","鴕鳥菲力肉排"]', '肉類', 'AI生成', NULL, '鴕鳥菲力肉排');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2036', '["鴨蛋鹹蛋","熟鹹鴨蛋","salted duck egg","preserved duck egg","鴨熟鹹蛋","Egg roll"]', '蛋類', 'AI生成', 'Egg roll', '鴨熟鹹蛋');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2037', '["薄鹽鴨蛋","鹹鴨蛋","salted duck egg","duck egg preserved in brine","鴨熟鹹蛋(薄鹽)","Egg roll"]', '蛋類', 'AI生成', 'Egg roll', '鴨熟鹹蛋(薄鹽)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2038', '["鴨蛋生鹹蛋","鴨子生鹹蛋","duckling salted egg","salted duck egg","鴨生鹹蛋","Egg roll"]', '蛋類', 'AI生成', 'Egg roll', '鴨生鹹蛋');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2039', '["鴨巣蛋","鴨皮蛋","Egg roll"]', '蛋類', 'AI生成', 'Egg roll', '鴨皮蛋');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2040', '["鴨腳","鴨掌","duck wing","duck foot","鴨翅"]', '肉類', 'AI生成', NULL, '鴨翅');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2041', '["鴨肝","胗","鴨膓","duck gizzard","gizzard","鴨胗"]', '肉類', 'AI生成', NULL, '鴨胗');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2042', '["鴨腸","duck intestine","duck gut"]', '肉類', 'AI生成', NULL, '鴨腸');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2043', '["鴨樑","鴨腿肉","duck leg","duck thigh","鴨腿"]', '肉類', 'AI生成', NULL, '鴨腿');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2044', '["鴨脷","鴨舌頭","duck tongue","duck's tongue","鴨舌"]', '肉類', 'AI生成', NULL, '鴨舌');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2045', '["鴨子蛋","老母雞蛋","duck egg","鴨蛋","Egg roll"]', '蛋類', 'AI生成', 'Egg roll', '鴨蛋');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2046', '["鴨蛋","野雞蛋","duck egg","wild duck egg","鴨蛋白","Egg roll"]', '蛋類', 'AI生成', 'Egg roll', '鴨蛋白');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2047', '["鴨蛋黃","duck yolk","duck egg yolk","Egg roll"]', '蛋類', 'AI生成', 'Egg roll', '鴨蛋黃');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2048', '["血豆腐","血花","duck blood","blood tofu","鴨血"]', '肉類', 'AI生成', NULL, '鴨血');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2049', '["鴨血糕","duck blood cake"]', '加工調理食品及其他類', 'AI生成', NULL, '鴨血糕');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2050', '["鹽水鴨","熏鴨","燒鴨賞","salted duck","smoked duck","roast duck slice","鴨賞"]', '加工調理食品及其他類', 'AI生成', NULL, '鴨賞');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2051', '["鴨脖子","鴨腦","duck head","duck neck","duck brain","鴨頭"]', '肉類', 'AI生成', NULL, '鴨頭');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2052', '["鹹蛋卷","鹹蛋捲","salted egg roll","eggy roll","鴨鹹蛋平均值","Egg roll"]', '蛋類', 'AI生成', 'Egg roll', '鴨鹹蛋平均值');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2053', '["鴨蛋黃","鹹鴨蛋黃","salted duck yolk","duck egg yolk","鴨鹹蛋黃","Egg roll"]', '蛋類', 'AI生成', 'Egg roll', '鴨鹹蛋黃');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2054', '["鴿蛋菇","珊瑚菇","crispy mushroom","dried sea mustard","matsutake mushroom (注：此學名通常不適用於鴻喜菇，但有時被誤稱)","鴻喜菇"]', '菇類', 'AI生成', NULL, '鴻喜菇');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2055', '["鴛鴦蛋","家養小雞蛋","squab egg","pigeon egg","鴿蛋","Egg roll"]', '蛋類', 'AI生成', 'Egg roll', '鴿蛋');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2056', '["鵝心","goose heart"]', '肉類', 'AI生成', NULL, '鵝心');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2057', '["鵝肉","肥鵝肉","白宰鵝","goose meat","domestic goose flesh"]', '肉類', 'AI生成', NULL, '鵝肉');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2058', '["鵝肝醬","肥肝","鵝油肝","白露肝","foie gras","duck liver pâté","fatty duck liver","鵝肝"]', '肉類', 'AI生成', NULL, '鵝肝');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2059', '["鵝脰","白鵝胗","goose gizzard","gizzards (goose)","鵝胗"]', '肉類', 'AI生成', NULL, '鵝胗');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2060', '["鵝脯肉","鵝胸部","goose breast meat","goose filet","鵝胸肉"]', '肉類', 'AI生成', NULL, '鵝胸肉');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2061', '["鵝腸","雁腸","goose intestine","wild goose bowel"]', '肉類', 'AI生成', NULL, '鵝腸');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2062', '["鵝腿","肥鵝肉","goose leg meat","duck leg (注意：雖然duck和goose是不同的鳥類，但在某些情況下可能會誤稱)","鵝腿肉"]', '肉類', 'AI生成', NULL, '鵝腿肉');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2063', '["鵝蛋","goose egg","Egg roll"]', '蛋類', 'AI生成', 'Egg roll', '鵝蛋');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2064', '["水煮蛋","boiled egg","hard-boiled egg","鵪鶉水煮蛋","Egg roll"]', '蛋類', 'AI生成', 'Egg roll', '鵪鶉水煮蛋');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2065', '["鵪鶉卤蛋","鹌鹑卤蛋","quail egg preserved in soy sauce","quail egg in brine","鵪鶉滷蛋","Egg roll"]', '蛋類', 'AI生成', 'Egg roll', '鵪鶉滷蛋');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2066', '["鵪鶉蛋","雉雞皮蛋","Quail Egg Preserved Egg","Preserved Quail's Egg","鵪鶉皮蛋","Egg roll"]', '蛋類', 'AI生成', 'Egg roll', '鵪鶉皮蛋');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2067', '["鵪鶉蛋","quail egg","Egg roll"]', '蛋類', 'AI生成', 'Egg roll', '鵪鶉蛋');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2068', '["鵪鶉鐵蛋","Egg roll","Spring roll variant"]', '蛋類', 'AI生成', 'Egg roll', '鵪鶉鐵蛋');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2069', '["鵪鶉咸蛋","雉雞鹹蛋","quail salted egg","鵪鶉鹹蛋","Egg roll"]', '蛋類', 'AI生成', 'Egg roll', '鵪鶉鹹蛋');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2070', '["鹊豆荚","鹊豆","sparrow pea pod","鵲豆莢"]', '豆類', 'AI生成', NULL, '鵲豆莢');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2071', '["鶯哥桃","yingge peach","yellow peaches"]', '水果類', 'AI生成', NULL, '鶯哥桃');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2072', '["鷹咀豆","土耳其豆","雞頭豆","garbanzo bean","ceci bean","broad pea","鷹嘴豆"]', '豆類', 'AI生成', NULL, '鷹嘴豆');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2073', '["鹹卷卷","鹹捲捲","海苔小卷","海苔捲","Salted Minced Fish Roll","Pickled Fish Roll","Fish Paste Roll","鹹小卷"]', '加工調理食品及其他類', 'AI生成', NULL, '鹹小卷');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2074', '["鹹漿","豆漿鹹","鹹豆漿","Soy milk"]', '加工調理食品及其他類', 'AI生成', 'Soy milk', '鹹豆漿');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2075', '["鹹麻糬","鹹Q餅","鹹米糕","savory mochi","salted sticky rice cake"]', '糕餅點心類', 'AI生成', NULL, '鹹麻糬');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2076', '["鹼粽","鹼水粽","alkaline rice dumpling","salty glutinous rice cake"]', '加工調理食品及其他類', 'AI生成', NULL, '鹼粽');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2077', '["鹹馧仔","鹽漬小鱗脂眼鯡","salted small pout","pickled sprat","鹽漬小鱗脂眼鯡(鹹馧仔)","Salt"]', '加工調理食品及其他類', 'AI生成', 'Salt', '鹽漬小鱗脂眼鯡(鹹馧仔)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2078', '["鹽酥豆","夏威夷豆","鹹酥豆","Hawaii Peanuts","Salty Hawaii Peanuts","Crispy Hawaii Peanuts","鹽酥夏威夷豆","Salt"]', '加工調理食品及其他類', 'AI生成', 'Salt', '鹽酥夏威夷豆');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2079', '["鹽焗花生","帶殼炸花生","香酥花生","salted roasted peanuts with shells","peanuts in shells fried with salt","鹽酥帶殼花生(熟)","Peanut"]', '加工調理食品及其他類', 'AI生成', 'Peanut', '鹽酥帶殼花生(熟)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2080', '["鹽焗花生","炸花生仁","乾炒花生","salt and pepper peanuts","fried peanuts","鹽酥花生仁","Peanut"]', '加工調理食品及其他類', 'AI生成', 'Peanut', '鹽酥花生仁');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2081', '["鹽焗葵花籽","鹹酥瓜子","帶殼葵花籽","salted sunflower seeds in shells","crispy salted sunflower seeds with shells","鹽酥葵瓜子(帶殼)","Salt"]', '加工調理食品及其他類', 'AI生成', 'Salt', '鹽酥葵瓜子(帶殼)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2082', '["鹹酥豆","鹽炸蠶豆","酥皮豆","fried salted soybeans","crispy salted beans","鹽酥蠶豆","Salt"]', '加工調理食品及其他類', 'AI生成', 'Salt', '鹽酥蠶豆');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2083', '["麒麟菜","海麒麟","石花菜","涼粉草","stone flower","ocean麒麟菜","carrageenan seaweed","gelidium seaweed"]', '藻類', 'AI生成', NULL, '麒麟菜');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2084', '["麥奇鈎吻鮭","去皮麥奇鈴魚","McKoy Cut Rainbow Trout","Rainbow Trout Fillet","麥奇鈎吻鮭(去皮)"]', '魚貝類', 'AI生成', NULL, '麥奇鈎吻鮭(去皮)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2085', '["麥奇鈎吻鮭","馬鈴薯（錯誤示範）","Macquarie perch","Australian perch","麥奇鈎吻鮭(含皮)"]', '魚貝類', 'AI生成', NULL, '麥奇鈎吻鮭(含皮)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2086', '["即溶麥片","快速燕麥包","沖泡式燕麥包","instant oatmeal packet","ready-to-eat oatmeal pouch","quick oats packet","麥片沖泡包(三合一)"]', '加工調理食品及其他類', 'AI生成', NULL, '麥片沖泡包(三合一)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2087', '["麥芽糖","糯米糖","玉蜀黍糖","malt sugar","sprouted grain syrup","Sugar"]', '糖類', 'AI生成', 'Sugar', '麥芽糖');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2088', '["紅茶","黑茶","red tea","crimson tea","麥茶","Black tea"]', '飲料類', 'AI生成', 'Black tea', '麥茶');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2089', '["麵包果","樹面包","面包果","breadfruit","buddha fruit","Breadfruit"]', '蔬菜類', 'AI生成', 'Breadfruit', '麵包果');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2090', '["面包果","樹薯","potato tree","bilo-bilo","kamote","poi","麵包粉","Breadfruit"]', '調味料及香辛料類', 'AI生成', 'Breadfruit', '麵包粉');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2091', '["麵筋","面筋","素鷄","豆腐皮","wheat gluten","gluten","seitan","mock duck","麵筋(未調味)"]', '加工調理食品及其他類', 'AI生成', NULL, '麵筋(未調味)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2092', '["麵線","水面","mein fun","mifen"]', '加工調理食品及其他類', 'AI生成', NULL, '麵線');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2093', '["麵腸","面腸","unflavored noodle sausage","plain noodle intestine","麵腸(未調味)"]', '加工調理食品及其他類', 'AI生成', NULL, '麵腸(未調味)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2094', '["紅茶粉","茶末","black tea powder","red tea powder","麵茶粉","Black tea"]', '加工調理食品及其他類', 'AI生成', 'Black tea', '麵茶粉');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2095', '["麻婆辣醬","豆瓣醬","mapo sauce","doubanjiang paste","麻婆醬"]', '調味料及香辛料類', 'AI生成', NULL, '麻婆醬');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2096', '["麻油豆腐乳","芝麻油辣腐乳","sesame oil flavored spicy fermented tofu","麻油辣腐乳","Sesame oil"]', '加工調理食品及其他類', 'AI生成', 'Sesame oil', '麻油辣腐乳');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2097', '["麻竹筍","毛竹筍","春筍","冬筍","新筍","bamboo shoots","bamboo sprouts","young bamboo shoots","Bamboo shoots"]', '蔬菜類', 'AI生成', 'Bamboo shoots', '麻竹筍');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2098', '["麻竹筍乾","冬筍乾","麻竹冬筍","dried bamboo shoots","preserved bamboo shoots","canned bamboo sprouts","麻竹筍干","Bamboo shoots"]', '加工調理食品及其他類', 'AI生成', 'Bamboo shoots', '麻竹筍干');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2099', '["芝麻醬","蔴將","sesame paste","sesame sauce","麻醬"]', '調味料及香辛料類', 'AI生成', NULL, '麻醬');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2100', '["黃豆仁","黑皮豆","black soybean with yellow coat","yellow-coated black bean","黃仁黑豆"]', '豆類', 'AI生成', NULL, '黃仁黑豆');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2101', '["黃姑魚","Alaska blackfish","Dallia pectoralis"]', '魚貝類', 'AI生成', 'Alaska blackfish', '黃姑魚');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2102', '["黃豆花","黃豆布丁","黃色布丁","yellow bean pudding","yellow soybean pudding","黃布丁"]', '糕餅點心類', 'AI生成', NULL, '黃布丁');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2103', '["黃擬烏尾𩾃","假烏尾鳁","false blacktail pomfret","pseudobarbus melanogrammus (錯誤學名,僅供參考)","黃擬烏尾鮗"]', '魚貝類', 'AI生成', NULL, '黃擬烏尾鮗');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2104', '["黃皮瓜","黃蛇果","黃櫛瓜"]', '蔬菜類', 'AI生成', NULL, '黃櫛瓜');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2105', '["黃皮洋蔥","黃皮紅肉洋蔥","金皮洋蔥","黃洋蔥","Garden onion"]', '蔬菜類', 'AI生成', 'Garden onion', '黃洋蔥');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2106', '["小番茄","櫻桃番茄","cherry tomato","tomato berry","garden cherry","rambutan tomato","黃番茄","Cherry tomato"]', '蔬菜類', 'AI生成', 'Cherry tomato', '黃番茄');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2107', '["葡萄柚","黃皮柑","pomelo","Chinese grapefruit","黃皮葡萄柚","Common grape"]', '水果類', 'AI生成', 'Common grape', '黃皮葡萄柚');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2108', '["黃皮葡萄柚","进口黄皮葡萄柚","黃皮葡萄柚(進口)","Common grape"]', '水果類', 'AI生成', 'Common grape', '黃皮葡萄柚(進口)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2109', '["黃花葵","秋葵花","lady's finger","ochrea","黃秋葵"]', '蔬菜類', 'AI生成', NULL, '黃秋葵');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2110', '["黃耆","黃茋","Astragalus water","Huangqi decoction","黃耆水"]', '調味料及香辛料類', 'AI生成', NULL, '黃耆水');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2111', '["黃耆","黃芪","astragalus root slice","huang qi","黃耆片"]', '調味料及香辛料類', 'AI生成', NULL, '黃耆片');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2112', '["黃梅李","黃肉李子","黃肉李"]', '水果類', 'AI生成', NULL, '黃肉李');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2113', '["黃肉甘藷","黃心苕","黃心甜薯","金心地瓜","potato","spud","tater"]', '澱粉類', 'AI生成', NULL, '黃肉甘藷');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2114', '["黃蘿蔔","黃根","yellow carrot","golden carrot","黃胡蘿蔔","Carrot"]', '蔬菜類', 'AI生成', 'Carrot', '黃胡蘿蔔');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2115', '["黃芥末醬","黃芥末調味料","黃色芥末醬","yellow mustard sauce","yellow mustard condiment","Asian yellow mustard","黃芥茉醬"]', '調味料及香辛料類', 'AI生成', NULL, '黃芥茉醬');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2116', '["黃豆","大豆","黑豆（指未成熟時的綠色種子）","滷水豆","豆腐黃豆","豆漿豆","青仁豆","soybean","edamame (immature soybeans)","miso bean","Soybean oil"]', '豆類', 'AI生成', 'Soybean oil', '黃豆');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2117', '["豆粉","黃豆麩皮粉","soybean flour","brown bean powder","黃豆粉","Soybean oil"]', '豆類', 'AI生成', 'Soybean oil', '黃豆粉');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2118', '["黃豆粉","有機黃豆粉","豆腐渣粉","organic soybean flour","soybean powder","natto flour","黃豆粉(有機)","Soybean oil"]', '豆類', 'AI生成', 'Soybean oil', '黃豆粉(有機)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2119', '["黃豆芽","豆芽菜","大豆胚芽","soybean sprout","bean sprouts","黃豆胚芽","Soybean oil"]', '豆類', 'AI生成', 'Soybean oil', '黃豆胚芽');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2120', '["豆芽菜","豆瓣菜","黃豆苗","mung bean sprouts","soybean sprouts","黃豆芽","Soybean oil"]', '蔬菜類', 'AI生成', 'Soybean oil', '黃豆芽');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2121', '["黃豆芽","豆芽菜","發芽黃豆","小芽白","soybean sprouts","bean sprouts","mung bean sprouts (注意此可能混淆, 黃豆和綠豆在英文中都稱為bean)","黃豆芽(有機,2023年取樣)","Soybean oil"]', '蔬菜類', 'AI生成', 'Soybean oil', '黃豆芽(有機,2023年取樣)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2122', '["小番茄","櫻桃番茄","洋蔥果","cherry tomato","baby tomato","teeny tomato","黃金小蕃茄"]', '蔬菜類', 'AI生成', NULL, '黃金小蕃茄');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2123', '["黃金果","golden fruit"]', '水果類', 'AI生成', NULL, '黃金果');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2124', '["黃金泡菜","golden kimchi","yellow kimchi"]', '加工調理食品及其他類', 'AI生成', NULL, '黃金泡菜');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2125', '["聖女小番茄","迷你小番茄","珍珠小番茄","cherry tomato","tommy tomato","dinner plate cherry tomatoes","黃金聖女小番茄","Cherry tomato"]', '蔬菜類', 'AI生成', 'Cherry tomato', '黃金聖女小番茄');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2126', '["黃金菾菜","golden rape","yellow rape"]', '蔬菜類', 'AI生成', NULL, '黃金菾菜');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2127', '["香瓜","黃瓜","金香瓜","cantaloupe","rockmelon","黃香瓜"]', '水果類', 'AI生成', NULL, '黃香瓜');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2128', '["黃鰭棘鯛","金錢鯛","錢鯛","yellowfin gurnard","money gurnard"]', '魚貝類', 'AI生成', NULL, '黃鰭棘鯛');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2129', '["鱔魚","黃甲魚","田鯉","土鳝鱼","oriental eel","yellow eel","黃鱔"]', '魚貝類', 'AI生成', NULL, '黃鱔');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2130', '["高可可含量巧克力","深焙黑巧克力","dark chocolate","high-cocoa chocolate","bitter chocolate","黑巧克力(85%)"]', '糕餅點心類', 'AI生成', NULL, '黑巧克力(85%)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2131', '["黑鯉","海緋鯉","black-spotted sea perch","red-lined perch","黑斑海緋鯉"]', '魚貝類', 'AI生成', NULL, '黑斑海緋鯉');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2132', '["黑李","烏林","black plum","Chinese black plum"]', '水果類', 'AI生成', NULL, '黑李');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2133', '["小番茄","櫻桃番茄","cherry tomato","tomato berry","黑柿番茄","Cherry tomato"]', '蔬菜類', 'AI生成', 'Cherry tomato', '黑柿番茄');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2134', '["黑果","黑梅","桂圓肉","black dates","Chinese dates","jujube fruits (dried)","黑棗(乾)"]', '水果類', 'AI生成', NULL, '黑棗(乾)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2135', '["紅茶","黑糖棗茶","red tea","black tea with jujube","黑棗茶","Black tea"]', '飲料類', 'AI生成', 'Black tea', '黑棗茶');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2136', '["黑棘鯛","石蜐","石鰾","黑石蜐","black triggerfish","trigger fish","黑棘鯛(去皮)"]', '魚貝類', 'AI生成', NULL, '黑棘鯛(去皮)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2137', '["黑棘鯛","東港𩾃","莿仔鱼","Black-spine Tilapia","Tilapia nilotica (Note: this might not be accurate as 黑棘鯛 doesn't have a direct English name, and the scientific name may differ)","黑棘鯛(含皮)"]', '魚貝類', 'AI生成', NULL, '黑棘鯛(含皮)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2138', '["黑森林蛋糕","Black Forest Cake","Egg roll"]', '糕餅點心類', 'AI生成', 'Egg roll', '黑森林蛋糕');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2139', '["黑烏參","black cuttlefish","common cuttlefish","sepia"]', '魚貝類', 'AI生成', NULL, '黑烏參');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2140', '["黑糖","石糖","焦糖","紅塘","black sugar","molasses sugar","cane sugar","dark brown sugar","黑砂糖","Sugar"]', '糖類', 'AI生成', 'Sugar', '黑砂糖');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2141', '["黑秈糙米","黑糯米","野生稻","wild rice","Canada rice","Indian rice","water oats","Annual wild rice"]', '穀物類', 'AI生成', 'Annual wild rice', '黑秈糙米');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2142', '["黑糯米","秈糯糙米","黑秈米","wild rice","Canada rice","Indian rice","water oats","黑秈糯糙米","Annual wild rice"]', '穀物類', 'AI生成', 'Annual wild rice', '黑秈糯糙米');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2143', '["黑糖漿","土冰糖","蔗糖蜜","甘蔗蜜","black treacle","molasses","treacle syrup","黑糖蜜","Sugar"]', '糖類', 'AI生成', 'Sugar', '黑糖蜜');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2144', '["黑糖包子","黑糖馒头","黑糖包","black sugar steamed bun","dark brown sugar bun","黑糖饅頭","Sugar"]', '加工調理食品及其他類', 'AI生成', 'Sugar', '黑糖饅頭');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2145', '["黑糯米","黑色糯米","black glutinous rice","forbidden rice","黑糯米漿","Annual wild rice"]', '加工調理食品及其他類', 'AI生成', 'Annual wild rice', '黑糯米漿');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2146', '["黑葡萄","紫葡萄","black beauty grape","purple beauty grape","黑美人葡萄(含皮)","Common grape"]', '水果類', 'AI生成', 'Common grape', '黑美人葡萄(含皮)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2147', '["黑皮西瓜","大西瓜","蜜瓜","sugar baby watermelon","personal watermelon","seedless black watermelon","黑美人西瓜","Watermelon"]', '水果類', 'AI生成', 'Watermelon', '黑美人西瓜');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2148', '["黑辣椒粉","黑胡椒粒","black pepper powder","ground black pepper","黑胡椒粉","Cubanelle pepper"]', '調味料及香辛料類', 'AI生成', 'Cubanelle pepper', '黑胡椒粉');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2149', '["黑辣椒醬","黑胡椒調味汁","black pepper sauce","peppercorn sauce","黑胡椒醬","Cubanelle pepper"]', '調味料及香辛料類', 'AI生成', 'Cubanelle pepper', '黑胡椒醬');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2150', '["黑芝蔴","炒芝麻","black sesame seed","toasted sesame","黑芝麻(熟)","Sesame"]', '堅果及種子類', 'AI生成', 'Sesame', '黑芝麻(熟)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2151', '["黑芝麻","熟黑芝麻","black sesame","cooked black sesame","黑芝麻(熟)(2022年取樣)","Sesame"]', '堅果及種子類', 'AI生成', 'Sesame', '黑芝麻(熟)(2022年取樣)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2152', '["胡麻","黑胡麻","黑白芝麻","black sesame","white sesame (for contrast)","黑芝麻(生)","Sesame"]', '堅果及種子類', 'AI生成', 'Sesame', '黑芝麻(生)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2153', '["黑麻油","香芝麻油","sesame oil","toasted sesame oil","黑芝麻油","Sesame oil"]', '油脂類', 'AI生成', 'Sesame oil', '黑芝麻油');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2154', '["黑芝麻末","烏麻粉","黑芝麻糊料","black sesame powder","ground black sesame seeds","黑芝麻粉","Sesame"]', '堅果及種子類', 'AI生成', 'Sesame', '黑芝麻粉');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2155', '["芝麻糖","黑麻糖","black sesame candy","sesame sugar candy","黑芝麻糖","Sesame"]', '糕餅點心類', 'AI生成', 'Sesame', '黑芝麻糖');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2156', '["面包果","大葉桑","布祿果","breadfruit","artocarpus altilis","poori pokki (Cook Islands Maori)","puwak (Hawaiian)","黑芝麻麵包醬","Breadfruit"]', '調味料及香辛料類', 'AI生成', 'Breadfruit', '黑芝麻麵包醬');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2157', '["黑葉荔","黑葉荔枝","Heiyezi Lychee","Black Leaf Lychee","黑葉仔荔枝"]', '水果類', 'AI生成', NULL, '黑葉仔荔枝');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2158', '["黑葉白菜","短梗白菜","Black Leaf Chinese Cabbage","Short Stem Chinese Cabbage","黑葉白菜(短梗)"]', '蔬菜類', 'AI生成', NULL, '黑葉白菜(短梗)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2159', '["黑豆乾","黑豆梗","black soybean sheet","black soybean strip","黑豆干"]', '加工調理食品及其他類', 'AI生成', NULL, '黑豆干');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2160', '["黑豆油餳","黑豆甜膏","black soybean oil paste","black bean sweet spread","黑豆油膏"]', '調味料及香辛料類', 'AI生成', NULL, '黑豆油膏');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2161', '["黑豆粉","black soybean flour"]', '豆類', 'AI生成', NULL, '黑豆粉');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2162', '["黑豆芽","黑豆芽菜","black soybean sprout","dark soybean germ","黑豆胚芽"]', '豆類', 'AI生成', NULL, '黑豆胚芽');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2163', '["黑豆芽","black soybean sprouts"]', '蔬菜類', 'AI生成', NULL, '黑豆芽');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2164', '["紅茶","黑葉茶","red tea","black tea","黑豆茶","Black tea"]', '飲料類', 'AI生成', 'Black tea', '黑豆茶');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2165', '["黑豆醬油","黑豆釀造醬油","black soybean soy sauce","Soy sauce"]', '調味料及香辛料類', 'AI生成', 'Soy sauce', '黑豆醬油');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2166', '["黑金剛花生","生 peanuts","peanuts","goobers","groundnuts","黑金剛花生(生)","Peanut"]', '堅果及種子類', 'AI生成', 'Peanut', '黑金剛花生(生)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2167', '["黑香芒","黑芒果","black aromatic mango","dark-scented mango","黑香芒果","Mango"]', '水果類', 'AI生成', 'Mango', '黑香芒果');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2168', '["黑麥汁","rye juice","black rye drink"]', '飲料類', 'AI生成', NULL, '黑麥汁');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2169', '["黑麥片","rye flakes","cracked rye"]', '穀物類', 'AI生成', NULL, '黑麥片');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2170', '["黑齒牡蠣","墨蠔","black-fanged oyster","dark-toothed oyster","Bivalvia (Clam, Mussel, Oyster)"]', '魚貝類', 'AI生成', 'Bivalvia (Clam, Mussel, Oyster)', '黑齒牡蠣');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2171', '["黑𩾃","黑鯆鳁","烏𩾃","black trevally","moonlight snapper","黑䱛 "]', '魚貝類', 'AI生成', NULL, '黑䱛 ');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2172', '["龍延草","Dragon Stem","Dodonaea viscosa"]', '蔬菜類', 'AI生成', NULL, '龍延草');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2173', '["桂圓","蜜餞","益智子","龍眼乾","dragon's eye fruit","lei-gan","longan fruit","龍眼","Longan"]', '水果類', 'AI生成', 'Longan', '龍眼');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2174', '["龙眼干","桂圆肉","益智仁","蜜枣","longan fruit","dragon eye fruit","eye of the dragon","龍眼乾","Longan"]', '水果類', 'AI生成', 'Longan', '龍眼乾');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2175', '["野番茄","苦葵","狗眼睛草","天泡草","nightshade","black nightshade","garden nightshade","white nightshade","龍葵"]', '蔬菜類', 'AI生成', NULL, '龍葵');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2176', '["龍虎斑","Alaska blackfish","Dallia pectoralis","龍虎石斑魚"]', '魚貝類', 'AI生成', 'Alaska blackfish', '龍虎石斑魚');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2177', '["龍蝦卵","蝦籽","龍蝦子","shrimp roe","prawn caviar","龍蝦卵(調味)","Shrimp"]', '加工調理食品及其他類', 'AI生成', 'Shrimp', '龍蝦卵(調味)');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2178', '["莕菜","龍骨瓣","Hydrilla stem","Hydrilla tuber","龍骨瓣莕菜"]', '蔬菜類', 'AI生成', NULL, '龍骨瓣莕菜');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2179', '["龜苓膏茶","黑涼茶","涼茶","Tortoise Gelatin Tea","Black Cool Drink","龜苓茶","Black tea"]', '飲料類', 'AI生成', 'Black tea', '龜苓茶');
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2180', '["聖薑梨","廟樹果","阿比育克","巴拉","瓦鲁纳","比达西","sacred garlic pear","temple plant","abiyuch","Balai Lamok","varuna","bidasi","spider tree","Abiyuch"]', 'Fruits', 'AI生成', 'Abiyuch', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2181', '["巴西櫻桃","西印度櫻桃","Barbados cherry","West Indian cherry","wild crepemyrtle","Acerola"]', 'Fruits', 'AI生成', 'Acerola', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2182', '["胡桃南瓜","小南瓜","胡桃形南瓜","pepper squash","Des Moines squash","Acorn squash"]', 'Gourds', 'AI生成', 'Acorn squash', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2183', '["阿多波","adobo","Filipino adobo","Adobo"]', 'Baking goods', 'AI生成', 'Adobo', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2184', '["紅小豆","赤小豆","小紅豆","red bean","azuki bean","adzuki bean","aduki bean","Adzuki bean"]', 'Pulses', 'AI生成', 'Adzuki bean', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2185', '[" agar","瓊脂","agar-agar","sea vegetable gel","Agar"]', 'Aquatic foods', 'AI生成', 'Agar', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2186', '["龍舌蘭","百歲草","century plant","American aloe","Agave"]', 'Vegetables', 'AI生成', 'Agave', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2187', '["愛古塔克","Eskimo ice cream","agutak","Akutaq"]', 'Confectioneries', 'AI生成', 'Akutaq', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2188', '["西雅圖越橘","北美越桔","early blueberry","oval-leaf bilberry","oval-leaf huckleberry","Alaska blueberry"]', 'Fruits', 'AI生成', 'Alaska blueberry', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2189', '["格陵蘭 cod","北太平洋 pollock","walleye pollock","Pacific cod","true cod","Alaska pollock"]', 'Aquatic foods', 'AI生成', 'Alaska pollock', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2190', '["阿拉斯加野生薺菜","北國野薺","Alaskan knotweed","Wild rhubarb (note: not actual rhubarb)","Alaska wild rhubarb"]', 'Vegetables', 'AI生成', 'Alaska wild rhubarb', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2191', '["牛角樹","野扁豆","Prickly-cluster Albizia","Indian Silk-cotton Tree","Albizia gummifera"]', 'Vegetables', 'AI生成', 'Albizia gummifera', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2192', '["酒精飲料","酒類","烈性飲料","含酒精飲品","白酒","黃湯","綠豆湯","米酒","果酒","燒酒","蒸餾酒","釀造酒","alcohol","booze","spirits","liquor","hooch","hard drink","piss","rotgut","hair of the dog","suds","beverage alcohol","potables","Alcoholic beverages"]', 'Beverages', 'AI生成', 'Alcoholic beverages', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2193', '["苜蓿","lucerne","Medicago sativa","Alfalfa"]', 'Herbs and Spices', 'AI生成', 'Alfalfa', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2194', '["紅皮野 onion","血點子蒜","redskin onion","wild onion","hematochiton onion","Allium"]', 'Vegetables', 'AI生成', 'Allium', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2195', '["八角香","多香果","Jamaica pepper","pepper","myrtle pepper","pimenta","pimento","English pepper","newspice","Allspice"]', 'Herbs and Spices', 'AI生成', 'Allspice', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2196', '["野馬鈴薯","野生洋芋","北极甜豌豆","wild potato","Alpine vetch","mountain vetch","Alpine sweetvetch"]', 'Vegetables', 'AI生成', 'Alpine sweetvetch', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2197', '["莧菜","鐵刀葉","Chinese spinach","callaloo","tampala","Amaranth"]', 'Herbs and Spices', 'AI生成', 'Amaranth', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2198', '["蔓越莓","美國蔓越莓","cranberry","large cranberry","bearberry","American cranberry"]', 'Fruits', 'AI生成', 'American cranberry', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2199', '["美洲龍蝦","美國龍蝦","北大西洋龍蝦","波士頓龍蝦","Maine lobster","Northern lobster","Boston lobster","American lobster"]', 'Aquatic foods', 'AI生成', 'American lobster', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2200', '["紫地菍","雞母嶺茶","紫金牛","大毒草","野烏藥","紅露莓","山棗子","赤地稔","地老皮","雞屎果","雞血藤","山烏龍","鵲梅果","Virginia poke","American nightshade","cancer jalap","coakum","garget","inkberry","pigeon berry","pocan","pokeroot","pokeberry","redweed","scoke","red ink plant","American pokeweed"]', 'Vegetables', 'AI生成', 'American pokeweed', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2201', '["鯡魚","鱥魚","Alosa sapidissima","Sapid shad","Atlantic shad","American shad"]', 'Aquatic foods', 'AI生成', 'American shad', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2202', '["雁鴨類","野鳥類","waterfowl","duck family","geese and swans","Anatidae"]', 'Animal foods', 'AI生成', 'Anatidae', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2203', '["鰭魚","鳁鱼","鰥魚","anchi","whitebait","Anchovy"]', 'Aquatic foods', 'AI生成', 'Anchovy', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2204', '["安地斯黑莓","莫拉","Andes berry","mora de Castilla","Andean blackberry"]', 'Fruits', 'AI生成', 'Andean blackberry', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2205', '["當歸","靈香草","Archangelica","Wild Celery","Angelica Root","Angelica"]', 'Herbs and Spices', 'AI生成', 'Angelica', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2206', '["鳗鲡","鳗鱼","鳗","eel","moray eel","conger eel","Anguilliformes"]', 'Aquatic foods', 'AI生成', 'Anguilliformes', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2207', '["茴香子","香菜籽","小茴香","aniseed","Chinese anise","Anise"]', 'Herbs and Spices', 'AI生成', 'Anise', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2208', '["蘋果汁","雲南蘋果汁","水果醋飲料（未發酵）","sweet cider","soft cider","apple juice (unfiltered)","crisp apple drink","Apple cider"]', 'Beverages', 'AI生成', 'Apple cider', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2209', '["杏子","杏","apricot","armenian apricot","Apricot"]', 'Fruits', 'AI生成', 'Apricot', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2210', '["北极黑莓","北极越桔","王子果","Arctic raspberry","nagoonberry","knyazhenika","Arctic blackberry"]', 'Fruits', 'AI生成', 'Arctic blackberry', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2211', '["亞雷帕","arepa","corn bread","Arepa"]', 'Dishes', 'AI生成', 'Arepa', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2212', '["水竹芋","箭頭菜","duck potato","broadleaf arrowhead","Indian potato","wapato","Arrowhead"]', 'Vegetables', 'AI生成', 'Arrowhead', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2213', '["山藥粉","馬來箭薑","Maranta arundinacea","West Indian arrowroot","obedience plant","Bermuda arrowroot","araru","ararao","hulankeeriya","Arrowroot"]', 'Vegetables', 'AI生成', 'Arrowroot', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2214', '["海鞘","海葯子","sea squirt","ascidian","Ascidians"]', 'Aquatic foods', 'AI生成', 'Ascidians', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2215', '["芻豆","龍牙草","石刁柏","sparrow grass","grass in flower","Asparagus"]', 'Vegetables', 'AI生成', 'Asparagus', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2216', '["鐵線草","絡葉天門冬","common asparagus fern","lace fern","climbing asparagus","fernlike asparagus","Asparagus fern"]', 'Herbs and Spices', 'AI生成', 'Asparagus fern', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2217', '["莎他瓦里","蔓生蘆筍","Shatavari","Asparagus root","Asparagus racemosus"]', 'Vegetables', 'AI生成', 'Asparagus racemosus', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2218', '["黃金石首魚","搖頭鯖","golden croaker","common drum","Atlantic weakfish","black croaker","Atlantic croaker"]', 'Aquatic foods', 'AI生成', 'Atlantic croaker', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2219', '["大西洋鱈鰈","北大西洋鱈鰈","halibut","flounder","turbot (note: turbot is a different species but similar in appearance)","Atlantic halibut"]', 'Aquatic foods', 'AI生成', 'Atlantic halibut', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2220', '["大西洋鳁鱼","鳁鱼","Atlantic herring","herring","sild","kippers","bloaters"]', 'Aquatic foods', 'AI生成', 'Atlantic herring', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2221', '["鳁鱼","油鳁","pogy","fatback","Atlantic menhaden"]', 'Aquatic foods', 'AI生成', 'Atlantic menhaden', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2222', '["大比目魚","歐洲鯡魚","pollack","lieu jaune","lythe","atlantic pollock","european pollock","Atlantic pollock"]', 'Aquatic foods', 'AI生成', 'Atlantic pollock', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2223', '["海狼","大西洋貓魚","海洋貓魚","魔鬼魚","狼鰻","seawolf","Atlantic catfish","ocean catfish","devil fish","wolf eel","sea cat","Atlantic wolffish"]', 'Aquatic foods', 'AI生成', 'Atlantic wolffish', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2224', '["牛油果","鳄梨","油梨","青莓","alligator pear","butter fruit","avocado pear","palta","Avocado"]', 'Vegetables', 'AI生成', 'Avocado', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2225', '["牛油果油","阿文果油","avocado extract oil","olein avocado","Avocado oil"]', 'Herbs and Spices', 'AI生成', 'Avocado oil', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2226', '["巴拉西棕櫚","巴西榈樹","babaçu palm","cusi palm","Babassu palm"]', 'Herbs and Spices', 'AI生成', 'Babassu palm', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2227', '["嬰兒食品","寶寶輔食","幼兒副食品","baby foods","infant food","weaning food","Baby food"]', 'Baby foods', 'AI生成', 'Baby food', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2228', '["贝果","面包圈","beigel","bagaal","Bagel"]', 'Cereals and cereal products', 'AI生成', 'Bagel', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2229', '["焗豆","焗芸豆","baked beans in tomato sauce","tin of baked beans","tinned beans","Baked beans"]', 'Dishes', 'AI生成', 'Baked beans', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2230', '["香蕉","蕉仔","banana","plantain","Banana"]', 'Fruits', 'AI生成', 'Banana', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2231', '["大麥","六行麥","malt barley","feed barley","Barley"]', 'Cereals and cereal products', 'AI生成', 'Barley', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2232', '["海棗子","檳榔果","Bay-rum tree","Candleberry","Sweet Gale","Wax-myrtle","Bayberry"]', 'Fruits', 'AI生成', 'Bayberry', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2233', '["豆子","黃豆","青豆","紅豆","黑豆","雲豆","pea","lentil","kidney bean","black-eyed pea","soybean","lima bean","Bean"]', 'Pulses', 'AI生成', 'Bean', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2234', '["鬚海豹","方前鳍海豹","square flipper seal","Bearded seal"]', 'Aquatic foods', 'AI生成', 'Bearded seal', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2235', '["山毛櫸果","白橡果","beechnuts","beechmast","Beech nut"]', 'Nuts', 'AI生成', 'Beech nut', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2236', '["白鯨","白鱀豚","melonhead","sea canary","Beluga whale"]', 'Aquatic foods', 'AI生成', 'Beluga whale', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2237', '["莓果酒","蔓越莓酒","黑莓酒","berry juice wine","fruit wine","blackberry wine","cranberry wine","raspberry wine","Berry wine"]', 'Beverages', 'AI生成', 'Berry wine', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2238', '["飲品","飲料","飲物","drinks","beverages","liquid refreshments","Beverages"]', 'Beverages', 'AI生成', 'Beverages', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2239', '["地菍","地果","European blueberry","Whortleberry","Huckleberry (note: Huckleberry is often used colloquially but it actually refers to a different genus of berries)","Bilberry"]', 'Fruits', 'AI生成', 'Bilberry', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2240', '["餅乾","小甜點","茶點","cookie","bake","tea cake","Biscuit"]', 'Cereals and cereal products', 'AI生成', 'Biscuit', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2241', '["北美野牛","美國野牛","美洲野牛","American buffalo","Buffalo","Wisent","European bison","Bison"]', 'Animal foods', 'AI生成', 'Bison', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2242', '["苦瓜","紹興瓜","三生果","bitter melon","balsam pear","goya","karavella","Bitter gourd"]', 'Gourds', 'AI生成', 'Bitter gourd', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2243', '["黑果醋栗","黑醋栗莓","aronia berry","black aronia","chokeberry","Black chokeberry"]', 'Fruits', 'AI生成', 'Black chokeberry', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2244', '["黑越桔","墨果","crowberry","black crowberry","Black crowberry"]', 'Fruits', 'AI生成', 'Black crowberry', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2245', '["黑果腺子","黑棗","elderberry","black elderberry","European elderberry","elder","black elder","European elder","Black elderberry"]', 'Fruits', 'AI生成', 'Black elderberry', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2246', '["黑越橘","北美黑果醋栗","Black Hurtleberry","Dewberry","Teaberry","Ground Holly","Black huckleberry"]', 'Fruits', 'AI生成', 'Black huckleberry', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2247', '["黑桑葚","黑莓桑","blackberry mulberry","Persian blackberry","tut","Black mulberry"]', 'Fruits', 'AI生成', 'Black mulberry', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2248', '["黑棗","烏梅","purple plum","dark plum","Chinese prune","Black plum"]', 'Fruits', 'AI生成', 'Black plum', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2249', '["黑葡萄乾","黑提子乾","black Corinth raisins","black Beauty raisins","Black raisin"]', 'Fruits', 'AI生成', 'Black raisin', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2250', '["黑覆盆子","黑紅樹莓","blackcap","thimbleberry","cane berry","wild black raspberry","Korean black raspberry","Black raspberry"]', 'Fruits', 'AI生成', 'Black raspberry', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2251', '["西班牙蒼耳","黑洋蔥","蛇根","Spanish salsify","Black oyster plant","Serpent root","Viper's herb","Viper's grass","Black salsify"]', 'Vegetables', 'AI生成', 'Black salsify', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2252', '["牛眼豆","黑眼睛豆","black-eyed bean","cowpea","lady pea","Black-eyed pea"]', 'Pulses', 'AI生成', 'Black-eyed pea', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2253', '["黑莓","黑果","blackberry","bramble berry","cane berry","Blackberry"]', 'Fruits', 'AI生成', 'Blackberry', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2254', '["黑醋栗","黑果花樺","currant black","black crandberry","crants","quins","Blackcurrant"]', 'Fruits', 'AI生成', 'Blackcurrant', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2255', '["藍蟹","馬鳴珠","Atlantic blue crab","Chesapeake blue crab","Blue crab"]', 'Aquatic foods', 'AI生成', 'Blue crab', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2256', '["藍 mussel","海青螺","common blue mussel","edible blue mussel","Blue mussel"]', 'Aquatic foods', 'AI生成', 'Blue mussel', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2257', '["藍鯡白魚","小鳕鱼","poutassou hake","white cod","blue herring","Blue whiting"]', 'Aquatic foods', 'AI生成', 'Blue whiting', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2258', '["鯖鯡","青班","tailor","shad","elf","blue","chopper","anchoa","Bluefish"]', 'Aquatic foods', 'AI生成', 'Bluefish', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2259', '["沼澤越橘","濕地越桔","Northern bilberry","Marsh blueberry","Bog bilberry"]', 'Fruits', 'AI生成', 'Bog bilberry', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2260', '["蜀葵","starflower","bee bush","cool-tanker","Borage"]', 'Herbs and Spices', 'AI生成', 'Borage', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2261', '["北極鯨","白鬚鯨","Greenland right whale","Arctic whale","steeple-top","polar whale","Russia or Russian whale","Bowhead whale"]', 'Aquatic foods', 'AI生成', 'Bowhead whale', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2262', '["波仙莓","波森莓","boysenberry","raspberry-blackberry hybrid","Boysenberry"]', 'Fruits', 'AI生成', 'Boysenberry', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2263', '["芥菜類","白菜類","十字花科蔬菜","cruciferous vegetables","cole crops","mustards and cabbages","Brassicas"]', 'Vegetables', 'AI生成', 'Brassicas', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2264', '["巴西果","巴西堅果","Brazil nut","Bertholletia"]', 'Nuts', 'AI生成', 'Brazil nut', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2265', '["麵包果籽","瑪雅果籽","breadnut seed","Maya nut seed","ramon seed","ojite seed","capomo seed","mojo seed","ox seed","iximche seed","masica seed","uje seed","mojote seed","Breadnut tree seed"]', 'Herbs and Spices', 'AI生成', 'Breadnut tree seed', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2266', '["早餐谷物","早餐穀片","燕麥脆片","穀片","breakfast oats","grain flakes","cereal flakes","muesli","Breakfast cereal"]', 'Cereals and cereal products', 'AI生成', 'Breakfast cereal', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2267', '["早餐三明治","早點三文治","breakfast sarnie","bacon sandwich (in the UK)","egg and bacon roll","muffin sandwich","Breakfast sandwich"]', 'Dishes', 'AI生成', 'Breakfast sandwich', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2268', '["蠶豆","廣豆","fava bean","field bean","bell bean","tic bean","Broad bean"]', 'Pulses', 'AI生成', 'Broad bean', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2269', '["白魚","寬頭白魚","broad whitefish","coregonus broad whitefish","Broad whitefish"]', 'Aquatic foods', 'AI生成', 'Broad whitefish', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2270', '["洋芽菜","洋白菜苗","小椰菜","迷你甘藍","Brussels sprouts","Sprout","Miniature cabbage","Baby cabbage","Brussel sprouts"]', 'Vegetables', 'AI生成', 'Brussel sprouts', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2271', '["水牛","河牛","黑牛","water buffalo","carabao","Indian buffalo","Buffalo"]', 'Animal foods', 'AI生成', 'Buffalo', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2272', '["金醋栗","黃醋粟","golden currant","wild yellow currant","buffalo currant","Buffalo currant"]', 'Fruits', 'AI生成', 'Buffalo currant', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2273', '["波格力","粗粒麥","bulghur","burghul","bulgar","cracked wheat","Bulgur"]', 'Cereals and cereal products', 'AI生成', 'Bulgur', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2274', '["水中雞","水狗","burbot","mariah","the lawyer","eelpout","Burbot"]', 'Aquatic foods', 'AI生成', 'Burbot', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2275', '["牛蒡","甘草菜","greater burdock","gob","edible burdock","lappa","beggar's buttons","Burdock"]', 'Vegetables', 'AI生成', 'Burdock', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2276', '["布里托","墨西哥捲","taco de harina","Burrito"]', 'Dishes', 'AI生成', 'Burrito', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2277', '["牛油","奶油","butterfat","creamed butter","sweet cream butter","Butter"]', 'Milk and milk products', 'AI生成', 'Butter', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2278', '["人造奶油","植物奶油","buttery spread","plant-based butter","dairy-free butter","Butter substitute"]', 'Baking goods', 'AI生成', 'Butter substitute', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2279', '["奶脂","乳脂肪","milkfat","cream fat","Butterfat"]', 'Milk and milk products', 'AI生成', 'Butterfat', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2280', '["發酵牛奶","酸牛奶","乳脂液","cultured milk","soured milk","clabbered milk","Buttermilk"]', 'Milk and milk products', 'AI生成', 'Buttermilk', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2281', '["白核桃","薄殼山核桃","White Walnut","Oilnut","Butternut"]', 'Nuts', 'AI生成', 'Butternut', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2282', '["南瓜","甜南瓜","板栗南瓜","butternut pumpkin","winter squash","Butternut squash"]', 'Gourds', 'AI生成', 'Butternut squash', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2283', '["捲心菜","包心菜","白菜花","高麗菜","天津青","cole","kale cabbage","bok choi (誤, 此為另一種蔬菜，但常與捲心菜混淆)","cabbage greens","brussels sprouts leaves (誤, 此為另一種蔬菜，但有時被誤稱)","Cabbage"]', 'Vegetables', 'AI生成', 'Cabbage', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2284', '["蛋糕","芝士蛋糕","磅蛋糕","紅茶蛋糕","cake","cheesecake","sponge cake","red velvet cake","Cake"]', 'Confectioneries', 'AI生成', 'Cake', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2285', '["匏瓜","扁蒲","蒲瓜","壺蘆","瓢瓜","bottle gourd","opo squash","white-flowered gourd","long melon","calabash","Calabash"]', 'Gourds', 'AI生成', 'Calabash', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2286', '["加拿大越桔","加拿大野生藍莓","Common Blueberry","Velvetleaf Huckleberry","Velvetleaf Blueberry","Sourtop Blueberry","Canada blueberry"]', 'Fruits', 'AI生成', 'Canada blueberry', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2287', '["糖磚","糖果棒","巧克力棒","巧格力","chocolate bar","candy stick","sweet bar","confectionery bar","Candy bar"]', 'Confectioneries', 'AI生成', 'Candy bar', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2288', '["白腎豆","雲豆","white kidney bean","white haricot bean","Cannellini bean"]', 'Pulses', 'AI生成', 'Cannellini bean', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2289', '["低芥酸 Rapeseed","菜籽油原料","Rapeseed (low erucic acid)","LEAR","Canola"]', 'Herbs and spices', 'AI生成', 'Canola', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2290', '["低芥酸油菜籽油","菜籽油","Rapeseed oil (low erucic acid)","Canola","Canola oil"]', 'Herbs and Spices', 'AI生成', 'Canola oil', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2291', '["哈密瓜","香瓜","rockmelon","sweet melon","spanspek","Cantaloupe melon"]', 'Gourds', 'AI生成', 'Cantaloupe melon', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2292', '["Physalis","金棗","百香果（注意：此為另一種水果的誤稱，但可能因外形類似而產生混淆）","goldenberry","physalis","Peruvian ground cherry","Inca berry","Cape gooseberry"]', 'Fruits', 'AI生成', 'Cape gooseberry', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2293', '["扁桃葉","花蕾","caper berry","Flinders rose","Capers"]', 'Herbs and Spices', 'AI生成', 'Capers', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2294', '["香子蘭","洋茴香","meridian fennel","Persian cumin","Caraway"]', 'Herbs and Spices', 'AI生成', 'Caraway', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2295', '["豆蔻","肉荳蔻","cardamon","green cardamom","black cardamom","Cardamom"]', 'Herbs and Spices', 'AI生成', 'Cardamom', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2296', '["洋蔥頭","洋薊菜","洋白菜","artichoke thistle","cardone","cardoni","carduni","cardi","Cardoon"]', 'Vegetables', 'AI生成', 'Cardoon', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2297', '["聖約翰麵包樹果實","假巧克力","St. John's bread","Locust bean","Algarrobina pod","Carob"]', 'Vegetables', 'AI生成', 'Carob', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2298', '["鯽魚","鱸鰱","黃骨鯭","common bream","freshwater bream","European bream","silver bream","carp bream","Carp bream"]', 'Aquatic foods', 'AI生成', 'Carp bream', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2299', '["落基藍莓","高山越桔","Cascade bilberry","Blueleaf huckleberry","Delicious Huckleberry","Cascade huckleberry"]', 'Fruits', 'AI生成', 'Cascade huckleberry', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2300', '["酪蛋白","casein","Casein"]', 'Milk and milk products', 'AI生成', 'Casein', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2301', '["木薯","藷藷","番藷","山芋","yuca","mogo","manioc","Cassava"]', 'Vegetables', 'AI生成', 'Cassava', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2302', '["澳洲豆槐","澳洲樹豆","Australian Moreton Bay Chestnut","Moreton Bay Bean","Wild Peanut","Castanospermum australe"]', 'Vegetables', 'AI生成', 'Castanospermum australe', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2303', '["塘利","猫鱼","channel catfish","flathead catfish","bullhead catfish","walking catfish","Catfish"]', 'Aquatic foods', 'AI生成', 'Catfish', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2304', '["非洲刀豆","車vang pea","cowpea","yardlong bean","asparagus bean","snake bean","Catjang pea"]', 'Pulses', 'AI生成', 'Catjang pea', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2305', '["牛","黃金肉","牛肉","牛腩","牛百叶","牛腱子","牛尾","牛筋","牛骨","牛奶","cow","beef cattle","dairy cow","ox","bullock","jersey","holstein","hindquarter beef","round steak","ground beef","Cattle (Beef, Veal)"]', 'Animal foods', 'AI生成', 'Cattle (Beef, Veal)', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2306', '["花椰菜","白椰菜","white cauliflower","Romanesco (specific variety)","Cauliflower"]', 'Vegetables', 'AI生成', 'Cauliflower', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2307', '["芹菜根","西芹根","turnip-rooted celery","knob celery","celery root","Celeriac"]', 'Vegetables', 'AI生成', 'Celeriac', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2308', '["芹菜梗","西芹","西洋芹","celery heart","green celery","stalk celery","Celery stalks"]', 'Vegetables', 'AI生成', 'Celery stalks', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2309', '["穀物","五谷雜糧","米面制品","grains","cereal grains","corn flakes","oatmeal","rice products","Cereals and cereal products"]', 'Cereals and cereal products', 'AI生成', 'Cereals and cereal products', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2310', '["海豚","鯨魚","露脊鯨","虎鲸","白鯨","dolphin","whale","orca","killer whale","beluga","porpoise","Cetacea (Dolphin, Porpoise, Whale)"]', 'Aquatic foods', 'AI生成', 'Cetacea (Dolphin, Porpoise, Whale)', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2311', '["真肉桂","錫蘭肉桂","true cinnamon","Sri Lanka cinnamon","Ceylon cinnamon"]', 'Herbs and Spices', 'AI生成', 'Ceylon cinnamon', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2312', '["溝鯉","渠道鯡","channel cat","spotted catfish","Channel catfish"]', 'Aquatic foods', 'AI生成', 'Channel catfish', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2313', '["黃 chanterelle","金色 chanterelle","golden chanterelle","girolle","Pfifferling","Chanterelle"]', 'Vegetables', 'AI生成', 'Chanterelle', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2314', '["鱒魚","鱈魚","紅點鱒","char","trout char","salmon trout","lake trout","Charr"]', 'Aquatic foods', 'AI生成', 'Charr', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2315', '["佛手瓜","洋絲瓜","christophene","christophine","cho-cho","mirliton","merleton","chuchu","centinarja","pear squash","vegetable pear","chouchoute","pipinola","güisquil","Chayote"]', 'Gourds', 'AI生成', 'Chayote', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2316', '["奇達奶酪","奇達芝士","cheddar","sharp cheddar","mature cheddar","Cheddar Cheese"]', 'Milk and milk products', 'AI生成', 'Cheddar Cheese', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2317', '["芝士","起司","乳酪","乾酪","cheese","cheddar","brie","gouda","parm","parmesan","mozzarella","feta","Cheese"]', 'Milk and milk products', 'AI生成', 'Cheese', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2318', '["奇跡果","珍寶果","custard apple","pineapple guava","ice cream fruit","scrambled eggs","Cherimoya"]', 'Fruits', 'AI生成', 'Cherimoya', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2319', '["法國香芹","小茴香（注意：此中文名稱通常指的是Fennel，非Chervil）","洋芫荽","garden chervil","French parsley","fines herbes (component of)","Chervil"]', 'Herbs and Spices', 'AI生成', 'Chervil', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2320', '["口香糖","嚼勁橡皮糖","gum","chicle gum","rubber gum","Chewing gum"]', 'Confectioneries', 'AI生成', 'Chewing gum', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2321', '["奇亞籽","希亞種子","chia seed","salba","Chia"]', 'Herbs and Spices', 'AI生成', 'Chia', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2322', '["黃豆","雞豆","賒幹盧","香菧豆","沙納庫","garbanzo bean","ceci bean","hummus","Bengal gram","Chickpea"]', 'Pulses', 'AI生成', 'Chickpea', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2323', '["菊苣","苦薺菜","Blue Sailors","Bitter-endine","Coffee Root","Endive","Horse-weed","Radicchio","Witloof","Chicory"]', 'Vegetables', 'AI生成', 'Chicory', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2324', '["菊苣菜","苦薺菜","chicory greens","endive","witloof chicory","Chicory leaves"]', 'Vegetables', 'AI生成', 'Chicory leaves', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2325', '["菊苣根","咖啡根","root chicory","endive root","chicory coffee root","Chicory roots"]', 'Vegetables', 'AI生成', 'Chicory roots', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2326', '["辣椒燉肉","辣肉餡餅內餡（指用於做餃子或餛飩的餡料時）","chili con carne","bean and sausage stew with chili pepper (in the UK)","bowl of red","Texas red","Chili"]', 'Dishes', 'AI生成', 'Chili', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2327', '["奇米查岡","炸卷餅","chivichanga","chimmy chonga","fried burrito","Chimichanga"]', 'Dishes', 'AI生成', 'Chimichanga', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2328', '["鴨屎營","洋李子","秋李","Japanese plum","Prune","Chineese plum"]', 'Fruits', 'AI生成', 'Chineese plum', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2329', '["楊梅","紅楊梅","山菍","樹梅子","愛玉子","yangmei","yamamomo","red bayberry","waxberry","yumberry","strawberry tree","Chinese bayberry"]', 'Fruits', 'AI生成', 'Chinese bayberry', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2330', '["芥藍","菜花芥蘭","大頭菜","白花芥蘭","小芥藍","kai-lan","gai-lan","Chinese kale","Chinese broccoli"]', 'Vegetables', 'AI生成', 'Chinese broccoli', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2331', '["大白菜","捲心菜","洋白菜","雪白菜","包心菜","白菜心","天津白菜","napa cabbage","Peking cabbage","cellophane cabbage","Chinese leaf cabbage","baechu","wong bok","dohwaei chyehnhsai","bok choi","pak choi","white mustard greens","flowering cabbage","Chinese cabbage"]', 'Vegetables', 'AI生成', 'Chinese cabbage', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2332', '["栗子","板栗","糖炒栗子","chestnut","Chinese chestnut tree nut","Chinese chestnut"]', 'Nuts', 'AI生成', 'Chinese chestnut', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2333', '["肉桂","桂皮","廣東肉桂","cassia","Chinese cassia","Chinese cinnamon"]', 'Herbs and Spices', 'AI生成', 'Chinese cinnamon', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2334', '["芥菜","葉 mustard","綠芥菜","mustard 葉","mustard greens","Indian mustard","leaf mustard","green mustard cabbage","Chinese mustard"]', 'Vegetables', 'AI生成', 'Chinese mustard', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2335', '["水蔥","荸薺","荸荠","馬蹄","water chestnut","marsh nut","Chinese water chestnut"]', 'Vegetables', 'AI生成', 'Chinese water chestnut', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2336', '["大馬哈魚","王鮭","king salmon","quinnat salmon","spring salmon","tyee salmon","Chinook salmon"]', 'Aquatic foods', 'AI生成', 'Chinook salmon', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2337', '["韮菜","garlic chives","scallion","green onion","spring onion","Chives"]', 'Herbs and Spices', 'AI生成', 'Chives', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2338', '["巧克力慕斯","朱古力慕絲","chocolate cream mousse","choco mousse","Chocolate mousse"]', 'Confectioneries', 'AI生成', 'Chocolate mousse', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2339', '["巧克力果醬","巧克力軟糖","巧克力餡料","巧克力醬","chocolate paste","choco spread","chocolate jam","spreadable chocolate","Chocolate spread"]', 'Confectioneries', 'AI生成', 'Chocolate spread', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2340', '["秋大馬哈魚","條紋大马哈鱼","dog salmon","Keta salmon","Silverbrite salmon","Chum salmon"]', 'Aquatic foods', 'AI生成', 'Chum salmon', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2341', '["鯉魚","羅非魚","以色列魚","非洲鲫鱼","mossambique tilapia","blue tilapia","nile tilapia","o-reochromis niloticus","Cichlidae (Tilapia)"]', 'Aquatic foods', 'AI生成', 'Cichlidae (Tilapia)', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2342', '["肉桂","桂皮","cassia","Chinese cinnamon","sweet cinnamon","Cinnamon"]', 'Herbs and Spices', 'AI生成', 'Cinnamon', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2343', '["小白魚","鰊魚","淡水鱒魚","lake herring","inland freshwater whitefish","cheater","Cisco"]', 'Aquatic foods', 'AI生成', 'Cisco', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2344', '["柑橘","檸檬果","橙子","oranges","lemons","limes","grapefruits","mandarins","tangerines","clementines","Citrus"]', 'Fruits', 'AI生成', 'Citrus', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2345', '["海螺","青口貝","蛤蜊","花甲","clammy","mussel","oysterette","quahog","Clam"]', 'Aquatic foods', 'AI生成', 'Clam', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2346', '["龍蝦","海龍蝦","大爪龍蝦","lobster","clawed lobster","langou","Clawed lobster"]', 'Aquatic foods', 'AI生成', 'Clawed lobster', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2347', '["雪柑","小橘子","clementine","easy peeler","tangerine orange","mandarin orange hybrid","Clementine"]', 'Fruits', 'AI生成', 'Clementine', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2348', '["爬豆","纍纍豆","牛尾菜","rice bean","ricebean","adzuki-like bean","Climbing bean"]', 'Pulses', 'AI生成', 'Climbing bean', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2349', '["雲耳","木耳","石耳","wood ear","black wood ear","jelly fungus","Cloud ear fungus"]', 'Vegetables', 'AI生成', 'Cloud ear fungus', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2350', '["北國地果","北极莓","bakeapple","knotberry","knoutberry","aqpik","low-bush salmonberry","averin","evron","Cloudberry"]', 'Fruits', 'AI生成', 'Cloudberry', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2351', '["丁香","洋丁香","clove bud","clove flower","Cloves"]', 'Herbs and Spices', 'AI生成', 'Cloves', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2352', '["沙丁魚","鰥魚","鯡魚","鰶魚","青鱂","sardine","herring","sprat","brisling","pilchard","Clupeinae (Herring, Sardine, Sprat)"]', 'Aquatic foods', 'AI生成', 'Clupeinae (Herring, Sardine, Sprat)', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2353', '["煤魚","沙甸魚","saithe","coalfish","coly","Atlantic cod-like fish","Boston blues","Coalfish pollock"]', 'Aquatic foods', 'AI生成', 'Coalfish pollock', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2354', '["雞尾酒","調飲","cocktail","mixed drink","spirit drink","Cocktail"]', 'Beverages', 'AI生成', 'Cocktail', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2355', '["可可豆","巧克力原料","可可粉","可可脂","cacao","chocolate liquor","cocoa butter","cocoa powder","Cocoa and cocoa products"]', 'Cocoa and cocoa products', 'AI生成', 'Cocoa and cocoa products', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2356', '["可可豆","巧克力豆","cacao bean","cacao","Mayan: kakaw","Nahuatl: cacaua","Cocoa bean"]', 'Cocoa and cocoa products', 'AI生成', 'Cocoa bean', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2357', '["可可脂","巧克力黃油","theobroma oil","Cocoa butter"]', 'Cocoa and cocoa products', 'AI生成', 'Cocoa butter', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2358', '["可可液","巧克力液","可可泥","cocoa liquor","chocolate liquor","sweet chocolate","unsweetened chocolate","natural chocolate","Cocoa liquor"]', 'Cocoa and cocoa products', 'AI生成', 'Cocoa liquor', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2359', '["可可粉","巧克力粉"," coco粉","cocoa powder","cocoa","cacao powder","cocoa solids","Cocoa powder"]', 'Cocoa and cocoa products', 'AI生成', 'Cocoa powder', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2360', '["椰子","海棗","coconut palm","cocoanut","Coconut"]', 'Fruits', 'AI生成', 'Coconut', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2361', '[" coconut汁","椰子奶","coconut cream","coco milk","Coconut milk"]', 'Milk and milk products', 'AI生成', 'Coconut milk', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2362', '["咖啡豆","咖啡粉","黑水","苦咖啡","java","joe","cuppa joe","morning mud","daily grind","Coffee"]', 'Coffee and coffee products', 'AI生成', 'Coffee', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2363', '["咖啡","黑水","摩卡","拿鐵","美式","卡布奇諾","濃縮咖啡","冰咖啡","coffee","java","joe","brew","caf","cuppa","espresso","americano","latte","cappuccino","frap","iced coffee","Coffee and coffee products"]', 'Coffee and coffee products', 'AI生成', 'Coffee and coffee products', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2364', '["巧克力摩卡咖啡","可可莫卡咖啡","熱巧咖啡","caffè mocha","mocha latte","hot chocolate coffee","chocolate espresso drink","Coffee mocha"]', 'Coffee and coffee products', 'AI生成', 'Coffee mocha', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2365', '["代用咖啡","咖啡替代品","無咖啡因飲料","coffee alternative","decaf beverage","herbal coffee","Coffee substitute"]', 'Baking goods', 'AI生成', 'Coffee substitute', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2366', '["銀鱒","紅鱒","silver salmon","silvers","blueback","Coho salmon"]', 'Aquatic foods', 'AI生成', 'Coho salmon', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2367', '["熟食切片肉","火腿腸切片","冷盤肉","西式切片肉","即食肉片","lunch meat","sandwich meat","sliced meat","cooked meat","deli meat","meat slices","cured meats","ham and cheese slices","processed meats","Cold cut"]', 'Dishes', 'AI生成', 'Cold cut', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2368', '["科罗拉多松子","两针松子","piñon pine nuts","two-needle pinyon nuts","Colorado pinyon"]', 'Nuts', 'AI生成', 'Colorado pinyon', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2369', '["野鴿","家鴿","咕嚕鳩","dove","rock pigeon","squab","Columbidae (Dove, Pigeon)"]', 'Animal foods', 'AI生成', 'Columbidae (Dove, Pigeon)', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2370', '["蠶豆","刀豆","青豆","菜豆","string bean","field bean","flageolet bean","French bean","garden bean","haricot bean","pop bean","snap bean","Common bean"]', 'Pulses', 'AI生成', 'Common bean', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2371', '["甜菜根","紅蘿蔔","紫米菜","beetroot","table beet","garden beet","blood turnip","Common beet"]', 'Vegetables', 'AI生成', 'Common beet', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2372', '["荞麦","荍麦","烏麥","buckwheat groats","kasha","鞑靼荞麦 (Tartary buckwheat)","Common buckwheat"]', 'Cereals and cereal products', 'AI生成', 'Common buckwheat', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2373', '["洋白菜","捲心菜","包心菜","大頭菜","cabbage","head cabbage","white cabbage","Common cabbage"]', 'Vegetables', 'AI生成', 'Common cabbage', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2374', '["鯉魚","紅鯉","家鯉","carp","European carp","Asian carp","Common carp"]', 'Aquatic foods', 'AI生成', 'Common carp', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2375', '["酸樱桃","苦樱桃","鸟樱桃","bitter-berry","Virginia bird cherry","black chokecherry","Common chokecherry"]', 'Fruits', 'AI生成', 'Common chokecherry', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2376', '["扁魚","泥鰍","dab","common dab","European dab","Common dab"]', 'Aquatic foods', 'AI生成', 'Common dab', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2377', '["胡桃","山核桃","榛子","平榛","cob nut","filbert","hazel nuts","Common hazelnut"]', 'Nuts', 'AI生成', 'Common hazelnut', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2378', '["大舌魚","長舌鰭","lingcod","atlantic ling","tusk","Common ling"]', 'Aquatic foods', 'AI生成', 'Common ling', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2379', '["白蘑菇","香菇","草菇","洋蘑菇","意大利菇","西洋菇","小洋菇","板 Mushroom（此處保留原有 Portobello 翻譯以保持一致性）","button mushroom","white mushroom","champignon","cremini","baby bella","Italian brown","Roman brown","Swiss brown","chestnut mushroom","Portobello","Common mushroom"]', 'Vegetables', 'AI生成', 'Common mushroom', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2380', '["牛至","希臘香草","wild marjoram","pizza herb","Common oregano"]', 'Herbs and Spices', 'AI生成', 'Common oregano', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2381', '["豌豆","青豆","小豆","麥豆","甜豆","garden pea","green pea","snow pea","sugar snap pea","Common pea"]', 'Pulses', 'AI生成', 'Common pea', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2382', '["柿子","扁擔柿","American Persimmon","Eastern Persimmon","'Simmon","Possumwood","Sugar-plum","Common persimmon"]', 'Fruits', 'AI生成', 'Common persimmon', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2383', '["香薄荷","山蘆薈","garden sage","true sage","salvia","Common sage"]', 'Herbs and Spices', 'AI生成', 'Common sage', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2384', '["角蒿","洋蔥草","雞腿蔥","雞腿蒜","purple salsify","oyster plant","vegetable oyster","Jerusalem star","goatsbeard","salsify","Common salsify"]', 'Vegetables', 'AI生成', 'Common salsify', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2385', '["百里香","小叢百里香","garden thyme","common garden thyme","Common thyme"]', 'Herbs and Spices', 'AI生成', 'Common thyme', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2386', '["紫花地丁","馬鞭草科","Vervain","Pennyroyal","Enchanter's Herb","Jupiter's Tears","Holy Wort","Common verbena"]', 'Herbs and Spices', 'AI生成', 'Common verbena', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2387', '["胡桃","核桃","英核桃","Persian walnut","English walnut","Common walnut"]', 'Nuts', 'AI生成', 'Common walnut', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2388', '["冬麥","春麥","麵粉穗","bread wheat","wheat berry","red wheat","Common wheat"]', 'Cereals and cereal products', 'AI生成', 'Common wheat', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2389', '["龍宮螺","海螺","true conch","sacred chank","shankha shell","Conch"]', 'Aquatic foods', 'AI生成', 'Conch', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2390', '["煉乳","甜煉乳","sweetened condensed milk","sweet condensed milk","Condensed milk"]', 'Milk and milk products', 'AI生成', 'Condensed milk', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2391', '["食用油","植物油","動物油","vegetable oil","lard","oil","Cooking oil"]', 'Baking goods', 'AI生成', 'Cooking oil', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2392', '["香菜","胡荽","巴西里","cilantro","Chinese parsley","dhania","Coriander"]', 'Herbs and Spices', 'AI生成', 'Coriander', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2393', '["苞米","包米","苞谷","玉米","玉蜀黍","棒子","珍珠豆","maize","Indian corn","field corn","sweet corn","Corn"]', 'Cereals and cereal products', 'AI生成', 'Corn', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2394', '["玉米片","脆玉米片","corn chip","Fritos","doritos","Corn chip"]', 'Snack foods', 'AI生成', 'Corn chip', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2395', '["玉米碴子","粗玉米粉","玉米碎","sofkee","sofkey","hominy grits","Corn grits"]', 'Cereals and cereal products', 'AI生成', 'Corn grits', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2396', '["玉米油","粟米油","maize oil","corn fat","Corn oil"]', 'Herbs and Spices', 'AI生成', 'Corn oil', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2397', '["苦苣菜","香草地","洋苦菜","lamb's lettuce","mâche","fetticus","feldsalat","nut lettuce","field salad","rapunzel","doucette","raiponce","Corn salad"]', 'Vegetables', 'AI生成', 'Corn salad', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2398', '["玉米面包","玉米薄餅","玉米糕","corn pone","Johnny cake","hoe cake","Cornbread"]', 'Cereals and cereal products', 'AI生成', 'Cornbread', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2399', '["薄荷","野薄荷","field mint","wild mint","cornmint","Cornmint"]', 'Herbs and Spices', 'AI生成', 'Cornmint', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2400', '["白乾酪","小白干酪","乳酪","curd cheese","clabber cheese","farmer's cheese","Cottage cheese"]', 'Milk and milk products', 'AI生成', 'Cottage cheese', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2401', '["棉籽","cottonseed","lint seed","Cottonseed"]', 'Herbs and Spices', 'AI生成', 'Cottonseed', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2402', '["棉籽油","cotton oil","cottonseed vegetable oil","Cottonseed oil"]', 'Herbs and Spices', 'AI生成', 'Cottonseed oil', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2403', '["庫斯庫斯","cous-cous","berbere pasta","Couscous"]', 'Dishes', 'AI生成', 'Couscous', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2404', '["0脂牛奶","加維A維D牛奶","消毒奶","skim milk with added vitamins A and D","vitamin-enriched skimmed milk","pasteurized fat-free milk with vitamin additions","Cow milk, pasteurized, vitamin A + D added, 0% fat"]', 'Milk and milk products', 'AI生成', 'Cow milk, pasteurized, vitamin A + D added, 0% fat', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2405', '["加維生素A和D的1%脂肪牛奶","維他命AD添加全脂牛奶","加營養素牛奶","調製牛奶","vitamin A & D fortified milk","pasteurized milk with added vitamins","enriched milk","fortified milk","Cow milk, pasteurized, vitamin A + D added, 1% fat"]', 'Milk and milk products', 'AI生成', 'Cow milk, pasteurized, vitamin A + D added, 1% fat', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2406', '["牛奶","消毒奶","加維生素AD牛奶","2%脂肪含量牛奶","pasteurized milk","vitamin-enriched milk","whole milk (reduced fat)","fortified milk","Cow milk, pasteurized, vitamin A + D added, 2% fat"]', 'Milk and milk products', 'AI生成', 'Cow milk, pasteurized, vitamin A + D added, 2% fat', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2407', '["牛奶","純牛奶","消毒奶","維他命D牛奶","pasteurized milk","vitamin D milk","whole milk","store-bought milk","Cow milk, pasteurized, vitamin D added, 3.25% fat"]', 'Milk and milk products', 'AI生成', 'Cow milk, pasteurized, vitamin D added, 3.25% fat', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2408', '["黑眼豌豆","刀豆","菜豆","绿豆","阿拉斯安德","洛比亞","布巴鲁","乔拉","black-eyed pea","cowpea","yardlong bean","catjang","lentil bean","crowder pea","cream pea","Cowpea"]', 'Pulses', 'AI生成', 'Cowpea', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2409', '["蟹","螃蟹","海蟹","淡水蟹","紅蟹","青蟹","花蟹","crayfish","rock crab","blue crab","stone crab","snow crab","alaskan king crab","dungeness crab","Crab"]', 'Aquatic foods', 'AI生成', 'Crab', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2410', '["脆餅","蘇打餅乾","薄脆餅","biscuit","cookie","ship biscuit","water cracker","Cracker"]', 'Snack foods', 'AI生成', 'Cracker', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2411', '["小龙虾","红钳虾","青虾","溪虾","山虾","crawfish","crawdad","mudbug","Crayfish"]', 'Aquatic foods', 'AI生成', 'Crayfish', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2412', '["奶油","乳脂","whipped cream","clotted cream","double cream","heavy cream","light cream","sour cream","Cream"]', 'Milk and milk products', 'AI生成', 'Cream', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2413', '["植脂奶油","人造奶油","奶精","plant-based creamer","non-dairy creamer","vegetable cream","Cream substitute"]', 'Baking goods', 'AI生成', 'Cream substitute', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2414', '["脆餅","乾麩皮","瑞典硬餅","北歐脆餅","hard bread","knäckebröd","rusk bread","nackebrod","hardt brot","Crisp bread"]', 'Cereals and cereal products', 'AI生成', 'Crisp bread', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2415', '["Chinese artichoke","Japanese artichoke","節根","knotroot","artichoke betony","Crosne"]', 'Vegetables', 'AI生成', 'Crosne', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2416', '["海鮮","甲殼類","蝦蟹類","蝦兵蟹將","大閘蟹","紅毛蟹","花蟹","青蟹","白蝦","對蝦","龍蝦","明蝦","蠔油蝦仁","seafood","shellfish","decapods","crusties","crabs and shrimps","prawn","bug","mud bug","bugs","cocktail shrimp","giant prawn","Crustaceans"]', 'Aquatic foods', 'AI生成', 'Crustaceans', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2417', '["小黄瓜","黃瓜","洋黄瓜","京黄瓜","cuke","garden cucumber","slicing cucumber","pickling cucumber","burpless cucumber","Cucumber"]', 'Gourds', 'AI生成', 'Cucumber', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2418', '["南瓜","冬瓜","菜瓜","扁蒲","倭瓜","squash","pumpkin","gourd","winter squash","summer squash","Cucurbita"]', 'Gourds', 'AI生成', 'Cucurbita', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2419', '["孜然","蔥癡","cummin seed","zeera","jireh","comino","jeera","cumin seed","Cumin"]', 'Herbs and Spices', 'AI生成', 'Cumin', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2420', '["庫普瓦蘇","庫波阿蘇","Cupuassu","Copoasu","Cupuazú","Cupuaçu"]', 'Herbs and Spices', 'AI生成', 'Cupuaçu', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2421', '["咖喱粉","香料粉","curry mix","curry blend","Curry powder"]', 'Herbs and Spices', 'AI生成', 'Curry powder', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2422', '["月魚","brismak","brosmius","torsk","moonfish","Cusk"]', 'Aquatic foods', 'AI生成', 'Cusk', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2423', '["番荔枝","釋迦果","牛奶果","sweetsop","cherimoya","custard apple","sugar apple","Custard apple"]', 'Fruits', 'AI生成', 'Custard apple', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2424', '["白蘿蔔","大根","長蘿蔔","四季豆（台語）","白菜（粵語）","mooli","white萝卜","Chinese radish","asian radish","Daikon radish"]', 'Vegetables', 'AI生成', 'Daikon radish', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2425', '["蒲公英","婆婆丁","puffball","swine's snout","Dandelion"]', 'Herbs and Spices', 'AI生成', 'Dandelion', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2426', '["棲霞","棲蟄果","椰棧","棗子","date palm fruit","dactyl","Date"]', 'Fruits', 'AI生成', 'Date', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2427', '["鹿肉","梅花鹿","麋鹿","黇鹿","stag","hind","reindeer","elk","moose","hart","buck","Deer"]', 'Animal foods', 'AI生成', 'Deer', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2428', '["鹿莓","白花越桔","squaw huckleberry","gooseberry","Deerberry"]', 'Fruits', 'AI生成', 'Deerberry', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2429', '["甜酒","餐後酒","甜食酒"," dessert wine","點心酒","pudding wine","dessert wine","sweet wine","after-dinner wine","stomach-warming wine","Dessert wine"]', 'Beverages', 'AI生成', 'Dessert wine', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2430', '["魔鬼魚","鱆","devilfish","wolf eel","cowcod","Devilfish"]', 'Aquatic foods', 'AI生成', 'Devilfish', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2431', '["蘿芹","洋茴香","Lao coriander","Dill"]', 'Herbs and Spices', 'AI生成', 'Dill', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2432', '["酸模","大黄菜","dockweed","sorrel dock","yellow dock","Dock"]', 'Herbs and Spices', 'AI生成', 'Dock', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2433', '["鲯鳅","馬頭魚","燈光魚","mahi-mahi","dorado","lampuka","lampuki","llampuga","calitos","pompano dolphinfish","Dolphin fish"]', 'Aquatic foods', 'AI生成', 'Dolphin fish', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2434', '["山羊","奶羊","肉羊","綿羊（注意：此處的","goat","billy goat","doe","nanny goat","kid goat","chevon","mutton (in some areas)","Domestic goat"]', 'Animal foods', 'AI生成', 'Domestic goat', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2435', '["家豬","肉猪","肥猪","母猪","公猪","猪猡","猪婆","猪仔","豚","野猪（指野生状态下的家猪）","小蹄子","hog","swine","bacon pig","lard pig","porker","sow","boar","pink bacon on legs","piggy","Domestic pig"]', 'Animal foods', 'AI生成', 'Domestic pig', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2436', '["面团","生面团","粉浆","dough","paste","batter","Dough"]', 'Cereals and cereal products', 'AI生成', 'Dough', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2437', '["彩糖豆","裝飾糖豆","慶典糖果","硬殼糖","sugar-coated almond","capsule candy","pasted seed","boiled sweet","Dragée"]', 'Confectioneries', 'AI生成', 'Dragée', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2438', '["奶粉","乾奶","powdered milk","dried milk","Dried milk"]', 'Milk and milk products', 'AI生成', 'Dried milk', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2439', '["豬油渣","牛油渣","滴油","beef dripping","pork dripping","cottage drippings","Dripping"]', 'Fats and oils', 'AI生成', 'Dripping', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2440', '["牛奶糖","煉乳糖","牛油糖","milk caramel","manjar","arequipe","compota de leche","Dulce de leche"]', 'Confectioneries', 'AI生成', 'Dulce de leche', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2441', '["餛飩","水餃","湯圓","煎餜","蒸餜","dough ball","meat dumpling","wonton","pot sticker","jiaozi","Dumpling"]', 'Dishes', 'AI生成', 'Dumpling', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2442', '["欽拿蟹","金花蟹","Dungeness rock crab","Pacific littleneck crab","Dungeness crab"]', 'Aquatic foods', 'AI生成', 'Dungeness crab', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2443', '["刺梨","榴莲果","热带果王","king of fruits","crown prince of fruits","Durian"]', 'Fruits', 'AI生成', 'Durian', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2444', '["東海牡蠣","大西洋牡蠣","Atlantic oyster","Virginia oyster","Totten Inlet Virginica","Eastern oyster"]', 'Aquatic foods', 'AI生成', 'Eastern oyster', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2445', '["芋艿","观音莲","红丝洋参","eddo root","eddoe","arrowleaf elephant ear","Eddoe"]', 'Vegetables', 'AI生成', 'Eddoe', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2446', '["洋芋","馬鈴薯","土豆","山藥蛋","地瓜","potato","spud","tater","murphy","Irish apple","Edible shell"]', 'Baking goods', 'AI生成', 'Edible shell', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2447', '["植物性蛋白質替代品","烘焙替代蛋","蛋白替代品","素食蛋","無蛋食品","flaxseed meal","applesauce","tofu","arrowroot starch","bananas","soy lecithin","egg white substitute","Egg substitute"]', 'Baking goods', 'AI生成', 'Egg substitute', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2448', '["雞蛋","蛋白","蛋黃","荷包蛋","炒蛋","水波蛋","蒸蛋","Egg","Chicken Egg","Hen Egg","Fried Egg","Scrambled Egg","Boiled Egg","Poached Egg","Eggs"]', 'Eggs', 'AI生成', 'Eggs', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2449', '["楓果","黑果","elder","hierba ceniza (Spanish)","sureau (French)","Elderberry"]', 'Fruits', 'AI生成', 'Elderberry', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2450', '["麋鹿","長頸鹿（誤稱）","wapiti","red deer (former classification)","Elk"]', 'Animal foods', 'AI生成', 'Elk', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2451', '["'empanada","餡餅","艾曼納達","empanada","empadão","pasty","pastie","bocadito","Empanada"]', 'Dishes', 'AI生成', 'Empanada', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2452', '["鸸鹋","emu","ratite","Emu"]', 'Animal foods', 'AI生成', 'Emu', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2453', '["玉米卷餅","墨西哥捲餅","Mexican roll","Chili-stuffed tortilla","Enchilada"]', 'Dishes', 'AI生成', 'Enchilada', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2454', '["菊苣","洋萵苣","苦菜","苦菊","chicory","frisée","broad-leaved endive","escarole","Endive"]', 'Vegetables', 'AI生成', 'Endive', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2455', '["能量飲料","提神飲料","運動飲料","活力飲品","energy juice","boost drink","caffeine drink","stimulant beverage","Energy drink"]', 'Beverages', 'AI生成', 'Energy drink', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2456', '["金針菇","冬菇","竹筍菌","golden needle mushroom","lily mushroom","winter mushrooms","velvet foot","velvet stem","Enokitake"]', 'Vegetables', 'AI生成', 'Enokitake', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2457', '["蟲草","墨西哥茶","wormseed","Jesuit's tea","Paico","Herba Sancti Mariæ","Epazote"]', 'Herbs and Spices', 'AI生成', 'Epazote', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2458', '["歐洲鯡魚","歐洲鳁鱼","European anchovy","Anchoa","Baltic herring"]', 'Aquatic foods', 'AI生成', 'European anchovy', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2459', '["歐洲栗子","甜栗子","歐亞栗","sweet chestnut","marron","Spanish chestnut","European chestnut"]', 'Nuts', 'AI生成', 'European chestnut', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2460', '["小樺果","沼澤越橘","small cranberry","bog cranberry","swamp cranberry","European cranberry"]', 'Fruits', 'AI生成', 'European cranberry', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2461', '["洋李","歐洲李","prune","greengage","damson","European plum"]', 'Fruits', 'AI生成', 'European plum', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2462', '["歐洲兔","家兔","common rabbit","bunny","coney","European rabbit"]', 'Animal foods', 'AI生成', 'European rabbit', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2463', '["濃縮牛奶","罐頭牛奶","脫水牛奶","condensed milk (note: this is different from sweetened condensed milk)","evaporated milk","dried milk (not to be confused with dry milk)","Evaporated milk"]', 'Milk and milk products', 'AI生成', 'Evaporated milk', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2464', '["夜來香","suncup","sundrop","Evening primrose"]', 'Herbs and Spices', 'AI生成', 'Evening primrose', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2465', '["常綠越桔","裂葉黑莓","cutleaf blackberry","evergreen bramble","Evergreen blackberry"]', 'Fruits', 'AI生成', 'Evergreen blackberry', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2466', '["長青越橘","冬越桔","Winter Huckleberry","California Huckleberry","Evergreen huckleberry"]', 'Fruits', 'AI生成', 'Evergreen huckleberry', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2467', '["法拉費","炸豆丸子","falafel balls","chickpea fritters","Falafel"]', 'Dishes', 'AI生成', 'Falafel', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2468', '["油","脂","油脂","脂肪","植物油","動物油","潤滑油","食用油","fats","oils","lipids","grease","lard","butter","shortening","margarine","Fats and oils"]', 'Fats and oils', 'AI生成', 'Fats and oils', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2469', '["費約果","費耀果","蜜瓜果","pineapple guava","guavasteen","feijoa","Feijoa"]', 'Fruits', 'AI生成', 'Feijoa', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2470', '["茴香","香蔥子","小茴香","甜茴香","sweet fennel","common fennel","Florence fennel","finocchio","aniseed plant","Fennel"]', 'Herbs and Spices', 'AI生成', 'Fennel', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2471', '["香豆草","希臘飼料","Greek hay","Trigonella","Bird's foot","Fenugreek"]', 'Herbs and Spices', 'AI生成', 'Fenugreek', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2472', '["無花果","安哥勒果","common fig","anjeer","dumur","Fig"]', 'Fruits', 'AI生成', 'Fig', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2473', '["柳葉菜","火weed","Great Willow-herb","Rosebay Willowherb","Chamerion angustifolium","Fireweed"]', 'Herbs and Spices', 'AI生成', 'Fireweed', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2474', '["魚肉堡","魚扒包","魚漢堡","fish sandwich","seafood burger","cod burger","tuna burger","Fish burger"]', 'Dishes', 'AI生成', 'Fish burger', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2475', '["魚油","鯡油","fish oil","omega-3 fish oil","Fish oil"]', '未分類', 'AI生成', 'Fish oil', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2476', '["魚","水族","fish","seafood","Fishes"]', 'Aquatic foods', 'AI生成', 'Fishes', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2477', '["比目魚","扁平魚","flounder","sole","turbot","plaice","halibut","Flatfish"]', 'Aquatic foods', 'AI生成', 'Flatfish', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2478', '["亞麻籽","胡蔓子","紫雲英","Linseed","Common flax","Flos linseeds","Flaxseed"]', 'Herbs and Spices', 'AI生成', 'Flaxseed', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2479', '["佛州鱂鰈","鱂鰈","Florida skipjack","carolinus","Florida pompano"]', 'Aquatic foods', 'AI生成', 'Florida pompano', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2480', '["粉","麵粉","面粉","flour","powder","meal","Flour"]', 'Cereals and cereal products', 'AI生成', 'Flour', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2481', '["佛卡夏","foccacia","focacce","Focaccia"]', 'Cereals and cereal products', 'AI生成', 'Focaccia', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2482', '["加烈酒","加強酒","fortified drink","added spirits wine","Fortified wine"]', 'Beverages', 'AI生成', 'Fortified wine', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2483', '["狐狸葡萄","Concord grape","Catawba grape","fox grapes","Fox grape"]', 'Fruits', 'AI生成', 'Fox grape', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2484', '["大蕉","芭蕉","華夫蕉","plantain","cooking banana","big banana","French plantain"]', 'Fruits', 'AI生成', 'French plantain', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2485', '["蛋奶吐司","煎蛋吐司","法式吐司","eggy bread","pain perdu","gypsy toast","French toast"]', 'Cereals and cereal products', 'AI生成', 'French toast', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2486', '["羊魚","鼓魚","咕","perch","silver bass","gray bass","Gasper goo","Gaspergou","goo","grunt","grunter","grinder","wuss fish","croaker","sheephead","sheepshead","Freshwater drum"]', 'Aquatic foods', 'AI生成', 'Freshwater drum', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2487', '["鳗鱼","鳗鲡","白鳝","淡水鳗","freshwater eel","yellow eel","silver eel","glass eel","elver","Freshwater eel"]', 'Aquatic foods', 'AI生成', 'Freshwater eel', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2488', '["水果軟糖","果膠糖","fruit gums","clear gums","wine gums","rowntrees fruit gum","Fruit gum"]', 'Confectioneries', 'AI生成', 'Fruit gum', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2489', '["果醬","罐頭水果","蜜餞","jam","jelly","preserve","marmalade","compote","conserve","Fruit preserve"]', 'Fruits', 'AI生成', 'Fruit preserve', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2490', '["水果沙拉","果肉沙律","fruit cocktail","fruit cup","Macedonia","Fruit salad"]', 'Fruits', 'AI生成', 'Fruit salad', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2491', '["果味飲料","水果口味飲料","fruit-flavored drink","flavored beverage","syrup-based drink","Fruit-flavor drink"]', 'Beverages', 'AI生成', 'Fruit-flavor drink', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2492', '["水果","fruit","produce","Fruits"]', 'Fruits', 'AI生成', 'Fruits', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2493', '["炸餅","油炸麵包","印第安煎餅","Indian taco base","Navajo frybread","Native American fry bread","Frybread"]', 'Dishes', 'AI生成', 'Frybread', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2494', '["糖巧","軟糖","fudge candy","fudgy","Fudge"]', 'Confectioneries', 'AI生成', 'Fudge', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2495', '["鱈魚","鳕鱼","鯡科","codfish","haddock","whiting","pollock","lingcod","Gadiformes"]', 'Aquatic foods', 'AI生成', 'Gadiformes', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2496', '["鯡魚","鱈魚","Atlantic cod","true cod","Gadus (Common cod)"]', 'Aquatic foods', 'AI生成', 'Gadus (Common cod)', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2497', '["園蔥","水蔊菜","須蔘菜","小薊","mustard and cress","garden pepper cress","pepper grass","pepperwort","poor person's pepper","Garden cress"]', 'Vegetables', 'AI生成', 'Garden cress', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2498', '["蔥","青蔥","大蔥","小蔥","韮蔤","onion","green onion","scallion","spring onion","salad onion","Garden onion (var.)"]', 'Vegetables', 'AI生成', 'Garden onion (var.)', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2499', '["薑芭","大黃菜","pie plant","rhubarb stalks","Garden rhubarb"]', 'Vegetables', 'AI生成', 'Garden rhubarb', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2500', '["番茄","洋柿子","檸檬茄","西红柿","love apple","Roma tomato","beefsteak tomato","cherry tomato","Garden tomato"]', 'Vegetables', 'AI生成', 'Garden tomato', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2501', '["洋蔥果","番茄","番柿","蕃茄","love apple","rambutan tomato","beefsteak tomato","cherry tomato","heirloom tomato","Garden tomato (var.)"]', 'Vegetables', 'AI生成', 'Garden tomato (var.)', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2502', '["海針魚","綠骨魚","sea needle","needlefish","Garfish"]', 'Aquatic foods', 'AI生成', 'Garfish', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2503', '["菊花葉","苦菊菜","黃花菊","chrysanthemum greens","edible chrysanthemum","Garland chrysanthemum"]', 'Vegetables', 'AI生成', 'Garland chrysanthemum', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2504', '["魚肉餡球","碎魚餡餅","ground fish balls","poached fish mixture","Gefilte fish"]', 'Dishes', 'AI生成', 'Gefilte fish', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2505', '["吉利丁","明膠","gelatine","jelly powder","Gelatin"]', 'Baking goods', 'AI生成', 'Gelatin', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2506', '["吉利丁布丁","果凍","凝膠甜點","jelly","jello","gelatin dessert","wobbly pudding","Gelatin dessert"]', 'Confectioneries', 'AI生成', 'Gelatin dessert', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2507', '["yellow gentian","gentian root","Gentiana lutea"]', 'Vegetables', 'AI生成', 'Gentiana lutea', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2508', '["洋甘菊","德國洋甘菊","chamomile","Hungarian chamomile","wild chamomile","scented mayweed","German camomile"]', 'Herbs and Spices', 'AI生成', 'German camomile', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2509', '["佛葵","大萵苣","fuki","bog rhubarb","Giant butterbur"]', 'Vegetables', 'AI生成', 'Giant butterbur', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2510', '["琴酒","杜松子酒","gin","jenever","hollands","Gin"]', 'Beverages', 'AI生成', 'Gin', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2511', '["白果","銀杏果","ginkgo seeds","silver apricot nuts","Ginkgo nuts"]', 'Herbs and Spices', 'AI生成', 'Ginkgo nuts', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2512', '["人參","地精","Asian ginseng","Korean ginseng","Ginseng"]', 'Herbs and Spices', 'AI生成', 'Ginseng', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2513', '["洋薔薇","西洋薔薇","French artichoke","green artichoke","Globe artichoke"]', 'Vegetables', 'AI生成', 'Globe artichoke', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2514', '["枸杞子","紅寶石","金果","地瓜果","wolfberry","goji berry","red medlar","Goji"]', 'Fruits', 'AI生成', 'Goji', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2515', '["醋栗","gooseberry","crawley","Gooseberry"]', 'Fruits', 'AI生成', 'Gooseberry', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2516', '["黑豆","烏爾adh豆","印度扁豆","小扁豆","白扁豆","black gram","urad bean","white urad dal","black matpe bean","black lentil (incorrect)","Gram bean"]', 'Pulses', 'AI生成', 'Gram bean', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2517', '["葡萄","grape","bunch of grapes","Grape"]', 'Fruits', 'AI生成', 'Grape', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2518', '["葡萄酒","grape juice wine","fermented grape beverage","Grape wine"]', 'Beverages', 'AI生成', 'Grape wine', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2519', '["西柚","酸橙","橘柚","forbidden fruit","pomelo-grape hybrid","shaddock-grape hybrid","Grapefruit"]', 'Fruits', 'AI生成', 'Grapefruit', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2520', '["葡萄柚","西柚","grapefruit","pummelo-grapefruit hybrid","orangelo","oriepine","temple orange","Grapefruit/Pummelo hybrid"]', 'Fruits', 'AI生成', 'Grapefruit/Pummelo hybrid', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2521', '["葡萄籽油","grapeseed oil","grape oil","Grapeseed oil"]', 'Herbs and Spices', 'AI生成', 'Grapeseed oil', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2522', '["鐵豆","鉄豌豆","grass pea","green pea","flat pea","chickling vetch","Grass pea"]', 'Pulses', 'AI生成', 'Grass pea', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2523', '["大鱉魚","鯰鱒魚","sturgeon","alosa","rusk whale","Greater sturgeon"]', 'Aquatic foods', 'AI生成', 'Greater sturgeon', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2524', '["希臘費塔奶酪","菲達乾酪","feta cheese","greek white cheese","Greek feta cheese"]', 'Milk and milk products', 'AI生成', 'Greek feta cheese', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2525', '["青蘋果","綠蘋果","green apple","granny smith (注意：Granny Smith是一種特定品種的青蘋果，而非所有青蘋果的通用名稱)","Green apple"]', 'Fruits', 'AI生成', 'Green apple', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2526', '["四季豆","青豆","菜豆","刀豆","長豇豆","string bean","snap bean","French bean","french green bean","french filet bean","fine beans","Green bean"]', 'Pulses', 'AI生成', 'Green bean', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2527', '["青甜椒","綠甜椒","青柿子椒","青灯笼椒","green pepper","capsicum","bell pepper","green capsicum","Green bell pepper"]', 'Vegetables', 'AI生成', 'Green bell pepper', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2528', '["青甘藍","卷心菜","大頭菜","包心白菜","cabbage","white cabbage","common cabbage","heading cabbage","Green cabbage"]', 'Vegetables', 'AI生成', 'Green cabbage', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2529', '["青葡萄","綠葡萄","green seedless grape","seedless green grape","white grapes (lightly green)","grapes (green variety)","Green grape"]', 'Fruits', 'AI生成', 'Green grape', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2530', '["綠小扁豆","綠扁豆","green pea lentil","French green lentils","Pardina lentils","Green lentil"]', 'Pulses', 'AI生成', 'Green lentil', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2531', '["蔥白","青蔥","小蔥","蔥苗","香蔥","大蔥（注意：這裡的大蔥一般指圓蔥根部的成熟部分）","scallion","spring onion","salad onion","green spring onion","bunching onion","young onion","Japanese bunching onion","Green onion"]', 'Vegetables', 'AI生成', 'Green onion', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2532', '["綠李","青梅","greengage","kakadu plum","wild plum","murunga","Green plum"]', 'Fruits', 'AI生成', 'Green plum', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2533', '["綠海龜","黑海龜","black turtle","Pacific green turtle","Green turtle"]', 'Aquatic foods', 'AI生成', 'Green turtle', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2534', '["青菜","綠葉蔬菜","莖菜","葉菜類","leaf vegetables","greens","potherbs","vegetable greens","leafy greens","salad greens","Green vegetables"]', 'Vegetables', 'AI生成', 'Green vegetables', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2535', '["青釘菜","綠胡瓜","西葫蘆","courgette","baby marrow","Italian squash","Green zucchini"]', 'Gourds', 'AI生成', 'Green zucchini', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2536', '["格陵蘭鯡","格林蘭鰈魚","Greenland turbot","turbot","halibut","Reinhardt's halibut","Greenland halibut/turbot"]', 'Aquatic foods', 'AI生成', 'Greenland halibut/turbot', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2537', '["綠絲茶","格雷絲茶","Navajo Tea","Hopi Tea","greenthread","Greenthread tea"]', 'Teas', 'AI生成', 'Greenthread tea', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2538', '["灰雁","graylag goose","common grey goose","Greylag goose"]', 'Animal foods', 'AI生成', 'Greylag goose', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2539', '["地菍","洋地菍","小番茄","cape gooseberry","husk tomato","poha berry","Groundcherry"]', 'Vegetables', 'AI生成', 'Groundcherry', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2540', '["𩾃魚","海鯔魚","石斑魚","龍虎斑","goliath grouper","jewfish","brown trout","black bass","coral grouper","Grouper"]', 'Aquatic foods', 'AI生成', 'Grouper', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2541', '["瓜拉那","巴西咖啡豆","Brazilian cocoa","Simiru","Guarana"]', 'Herbs and Spices', 'AI生成', 'Guarana', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2542', '["番石榴","洋蒲桃","guavaberry","gooseberry tree fruit","Guava"]', 'Fruits', 'AI生成', 'Guava', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2543', '["幾內亞雞","非洲火雞","guinea fowl","pear hen","gibi","farmer's hen","Guinea hen"]', 'Animal foods', 'AI生成', 'Guinea hen', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2544', '["鱈魚","黑線鳕鱼","haddie","blackline cod","Haddock"]', 'Aquatic foods', 'AI生成', 'Haddock', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2545', '["半高灌藍莓","半矮生藍莓","half-high blueberry","intermediate blueberry","Half-highbush blueberry"]', 'Fruits', 'AI生成', 'Half-highbush blueberry', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2546', '["硬質小麥","杜倫小麥","durum wheat","macaroni wheat","Hard wheat"]', 'Cereals and cereal products', 'AI生成', 'Hard wheat', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2547', '["山棗子","荳樅子","荳樅果","quickthorn","thornapple","May-tree","whitethorn","hawberry","Hawthorn"]', 'Fruits', 'AI生成', 'Hawthorn', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2548', '["胡桃","榛子","巴旦杏","cobnut","filbert","common hazel nut","Hazelnut"]', 'Nuts', 'AI生成', 'Hazelnut', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2549', '["棕心","椰子心","樹心中","palm heart","palmito","burglar's thigh","chonta","palm cabbage","swamp cabbage","Heart of palm"]', 'Vegetables', 'AI生成', 'Heart of palm', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2550', '[" Hedge mustard","野生蘿蔔","Hedge mustard","Fenugreek cress","Common sisymbrium","Officinal treacle mustard"]', 'Herbs and Spices', 'AI生成', 'Hedge mustard', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2551', '["草本茶","香草茶","花茶","中草藥茶","herbal infusion","tisane","medicinal tea","botanical tea","Herbal tea"]', 'Teas', 'AI生成', 'Herbal tea', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2552', '["香草","調味料","草本","辛香料","herbs and spices","seasonings","aromatics","flavorings","Herbs and Spices"]', 'Herbs and Spices', 'AI生成', 'Herbs and Spices', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2553', '["羅望子茶","木棉花茶","薔薇茄","roselle","flor de Jamaica","karkadeh","Karkadä","sorrel tea","red sorrel","Jamaica tea","red hibiscus tea","Hibiscus tea"]', 'Teas', 'AI生成', 'Hibiscus tea', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2554', '["核桃樹果實","hickory nut","pignut","mockernut","Hickory nut"]', 'Nuts', 'AI生成', 'Hickory nut', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2555', '["蔓越莓樹藍莓","高灌木藍莓","blue huckleberry","tall huckleberry","swamp huckleberry","high blueberry","swamp blueberry","Highbush blueberry"]', 'Fruits', 'AI生成', 'Highbush blueberry', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2556', '["大比目魚","扁口魚","halibut","flattie","sole-equus","Hippoglossus (Common halibut)"]', 'Aquatic foods', 'AI生成', 'Hippoglossus (Common halibut)', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2557', '["蜜蜂釀造的甜液","蜂糖","蜜","bee bread","liquid gold","Honey"]', 'Confectioneries', 'AI生成', 'Honey', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2558', '["奶茶米露","米茶","Spanish horchata","rice milk drink","Horchata"]', 'Beverages', 'AI生成', 'Horchata', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2559', '["角瓜","刺角瓜","金皮刺角瓜","African horned cucumber","jelly melon","hedged gourd","blowfish fruit","kiwano","cherie","melon-coconut","Horned melon"]', 'Gourds', 'AI生成', 'Horned melon', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2560', '["馬","horse","Horse"]', 'Animal foods', 'AI生成', 'Horse', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2561', '["馬薥薺","山葵根","red horse radish","German mustard","sting root","Japanese horseradish (when referring to wasabi)","Horseradish"]', 'Herbs and Spices', 'AI生成', 'Horseradish', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2562', '["辣木樹","摩力加樹","moringa","drumstick tree","ben oil tree","benzoil tree","Horseradish tree"]', 'Vegetables', 'AI生成', 'Horseradish tree', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2563', '["熱巧","熱朱古力","巧克力糖漿","hot cocoa","cocoa drink","drinking chocolate","Hot chocolate"]', 'Cocoa and cocoa products', 'AI生成', 'Hot chocolate', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2564', '["熱狗","熱狗腸","美式香腸","開放式三明治","frankfurter","wiener","tube steak","dachshund sausage","red hot","Hot dog"]', 'Dishes', 'AI生成', 'Hot dog', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2565', '["胡姆斯","hummus spread","chickpea dip","Hummus"]', 'Dishes', 'AI生成', 'Hummus', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2566', '["玉米面球","炸玉米糕","cornbread ball","fried cornmeal dumpling","seafood joint sidekick","Hushpuppy"]', 'Dishes', 'AI生成', 'Hushpuppy', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2567', '["印度扁豆","紫花刀豆","紅刀豆","非洲刀豆","Indian bean","calavance","seim","Egyptian bean","njahi","bulay","bataw","Hyacinth bean"]', 'Pulses', 'AI生成', 'Hyacinth bean', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2568', '["紫蘇草","hysso","herb hyssop","Hyssop"]', 'Herbs and Spices', 'AI生成', 'Hyssop', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2569', '["冰淇淋","雪糕","冰磚","凍奶","ice cream","frozen custard","soft serve","gelato","Ice cream"]', 'Confectioneries', 'AI生成', 'Ice cream', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2570', '["冰激凌蛋筒","冰淇淋蛋卷","雪糕蛋筒","waffle cone","cake cone","sugar cone","cornet","Ice cream cone"]', 'Baking goods', 'AI生成', 'Ice cream cone', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2571', '["結球生菜","包心生菜","冰山 lettuce","crisphead","bibb","boston lettuce","Iceberg lettuce"]', 'Vegetables', 'AI生成', 'Iceberg lettuce', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2572', '["糖霜","奶油糖霜","蛋糕霜","frosting","icing sugar","confectioner's sugar","buttercream","Icing"]', 'Confectioneries', 'AI生成', 'Icing', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2573', '["石花菜","洋粉草","海蘊","carrageen moss","carraigín","Irish moss"]', 'Aquatic foods', 'AI生成', 'Irish moss', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2574', '["義大利香料","奧瑞岡","Italian marjoram","sweet marjoram","majoram","Italian oregano"]', 'Herbs and Spices', 'AI生成', 'Italian oregano', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2575', '["意大利甜椒","紅色甜椒","Italian sweet pepper","sweet red chili","red bell pepper","Italian sweet red pepper"]', 'Vegetables', 'AI生成', 'Italian sweet red pepper', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2576', '["木果","番木瓜","奇異果","番荔枝","jack tree","jakfruit","jack or jak","vegetable meat","poor man's bread","Jackfruit"]', 'Fruits', 'AI生成', 'Jackfruit', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2577', '["jalapeño辣椒","墨西哥青椒","jalapeno","chipotle pepper in the green stage (ripened)","serrano pepper cousin","Jalapeno pepper"]', 'Vegetables', 'AI生成', 'Jalapeno pepper', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2578', '["日本栗","日栃","Japanese chestnut tree","Korean chestnut","Japanese chestnut"]', 'Nuts', 'AI生成', 'Japanese chestnut', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2579', '["柿子","洋柿子","神果","Persimmon","Kaki","Asian Persimmon","Sharon Fruit","Japanese persimmon"]', 'Fruits', 'AI生成', 'Japanese persimmon', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2580', '["鰆魚","石斑","鯖鰈","suzuki","rockfish","sea bass","Japanese sea bass"]', 'Aquatic foods', 'AI生成', 'Japanese sea bass', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2581', '["日本胡桃","日光核桃","Japanese walnut","Sakhalin walnut","Ailanthus walnut"]', 'Nuts', 'AI生成', 'Japanese walnut', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2582', '["Jamun","印度李子","黑果醋栗","jambul","jambolan","jamblang","java plum","Syzygium cumini","Java plum"]', 'Fruits', 'AI生成', 'Java plum', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2583', '["水母","海蜇","jellyfish","sea jelly","jelly","medusa","Jellyfish"]', 'Aquatic foods', 'AI生成', 'Jellyfish', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2584', '["太陽薯","洋薊頭","地蘋果","鐵棍山藥","sunroot","sunchoke","earth apple","topinambour","Jerusalem artichoke"]', 'Vegetables', 'AI生成', 'Jerusalem artichoke', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2585', '["墨西哥番薯","墨西哥土瓜","洋蔥頭","Mexican yam","Mexican turnip","yam bean","Jicama"]', 'Vegetables', 'AI生成', 'Jicama', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2586', '["雜種果","黑醋栗雜交果","Jochelbeere","Ribes × culverwellii hybrid","Jostaberry"]', 'Fruits', 'AI生成', 'Jostaberry', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2587', '["大棗","黑枣","红枣","山棗","red date","Chinese date","Korean date","Indian date","Jujube"]', 'Fruits', 'AI生成', 'Jujube', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2588', '["赤柏松","圓柏","juniper berry","common juniper","Juniperus communis"]', 'Vegetables', 'AI生成', 'Juniperus communis', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2589', '["布丁奶酪","牛奶凝脂糕","milk junket","sweetened milk dessert","custard dessert","Junket"]', 'Confectioneries', 'AI生成', 'Junket', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2590', '["芲","corchorus leaves","ewedu","turgunuwa","lallo","pala bi","Jute"]', 'Vegetables', 'AI生成', 'Jute', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2591', '["芥蘭","菜心","小棠菜","Chinese broccoli","white flowering broccoli","Chinese kale","Kai-lan"]', 'Vegetables', 'AI生成', 'Kai-lan', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2592', '["羽衣甘藍","苦 Kale","kale","borecole","curly kale","dinosaur kale","lacinato kale","black kale","scots kale","Kale"]', 'Vegetables', 'AI生成', 'Kale', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2593', '["開非爾","kefirs","keefir","kephir","kewra","talai","mudu kekiya","milkkefir","búlgaros","Kefir"]', 'Milk and milk products', 'AI生成', 'Kefir', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2594', '["海帶","昆布","江白菜","seaweed","sea wrack","tangle","Kelp"]', 'Aquatic foods', 'AI生成', 'Kelp', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2595', '["番茄醬","茄汁","茄汁少司","catsup","tomato sauce","Ketchup"]', 'Baking goods', 'AI生成', 'Ketchup', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2596', '["鯖魚","䲠鱼","kingfish","cavalla","spanish mackerel (note: this is similar but different species)","King mackerel"]', 'Aquatic foods', 'AI生成', 'King mackerel', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2597', '["德國洋蔥根","低地白菜","球根甘藍","olkopi","monji haak","German turnip","turnip cabbage","Kohl-rabi","cole rabbi","stem turnip","cabbage turnip","Gongylodes group (Brassica oleracea)","Kohlrabi"]', 'Vegetables', 'AI生成', 'Kohlrabi', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2598', '["小松菜","日本莧菜","Japanese mustard spinach","komatsuna","mustard spinach","Komatsuna"]', 'Vegetables', 'AI生成', 'Komatsuna', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2599', '["昆布","海帶","裙帶菜","乾燥昆布","konbu","dashima","haidai","Kombu"]', 'Aquatic foods', 'AI生成', 'Kombu', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2600', '["金桔","香橘","cumquat","meiwa citrus","Kumquat"]', 'Fruits', 'AI生成', 'Kumquat', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2601', '["湖 Trout","淡水白靈鰭","mackinaw","lake char (or charr)","touladi","togue","grey trout","siscowet","paperbelly","lean","Lake trout"]', 'Aquatic foods', 'AI生成', 'Lake trout', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2602', '["燈籠果","火把果","bladder cherry","Chinese lantern","Japanese-lantern","strawberry groundcherry","winter cherry","Lantern fruit"]', 'Fruits', 'AI生成', 'Lantern fruit', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2603', '["豬油","大油","白油","lard","pig fat","bacon fat (incorrect, but sometimes used)","Lard"]', 'Fats and oils', 'AI生成', 'Lard', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2604', '["拉札尼亞","千層麵","lasagne","baked lasagna","layered pasta","Lasagna"]', 'Dishes', 'AI生成', 'Lasagna', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2605', '["黑皮海牛","皮革海牛","Black Katy chiton","Black Leather chiton","Black chiton","Leather chiton"]', 'Aquatic foods', 'AI生成', 'Leather chiton', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2606', '["發酵粉","膨脹劑","膨鬆劑","baking powder","rising agent","leaven","Leavening agent"]', 'Baking goods', 'AI生成', 'Leavening agent', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2607', '["韮黃","韭白","Leek"]', 'Vegetables', 'AI生成', 'Leek', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2608', '["檸檬薄荷","檸檬香蜂草","balm mint","sweet balm","Lemon balm"]', 'Herbs and Spices', 'AI生成', 'Lemon balm', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2609', '["香茅草","油草","檸檬草","lemongrass","citronella grass","Lemon grass"]', 'Herbs and Spices', 'AI生成', 'Lemon grass', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2610', '["黃花魚","柠檬舌鳎","kitt","European lemon sole","Lemon sole"]', 'Aquatic foods', 'AI生成', 'Lemon sole', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2611', '["檸檬百里香","萊姆薄荷","broad-leaved thyme","pulegioid thyme","Lemon thyme"]', 'Herbs and Spices', 'AI生成', 'Lemon thyme', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2612', '["檸檬香草","檸檬馬鞭草","lemon beebrush","cedar leaf verbena","dolce verbena","Lemon verbena"]', 'Herbs and Spices', 'AI生成', 'Lemon verbena', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2613', '["紅小豆","綠小豆","黃小豆","小扁豆","brown lentils","green lentils","red lentils","puy lentils","Lentils"]', 'Pulses', 'AI生成', 'Lentils', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2614', '["萵苣","生菜","包心萵苣","長葉萵苣","羅馬生菜","lettuce greens","cos lettuce","butterhead","green leaf","red leaf","Lettuce"]', 'Vegetables', 'AI生成', 'Lettuce', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2615', '["荔支","荔枝果","離枝","litchi","licci","leechee","leechi","Lichee"]', 'Fruits', 'AI生成', 'Lichee', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2616', '["鷹嘴豆","牛頭菜","珍珠豆","butter bean","Sieva bean"," Madagascar bean","Sow pea","Lima bean"]', 'Pulses', 'AI生成', 'Lima bean', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2617', '["椴樹","菩提樹","林木","lime tree","basswood","linden tree","Linden"]', 'Herbs and Spices', 'AI生成', 'Linden', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2618', '["石首魚","鱈鯡","ling","codfish","ocean catfish","Lingcod"]', 'Aquatic foods', 'AI生成', 'Lingcod', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2619', '["山越莓","鳶尾果","cowberry","mountain cranberry","rock bilberry","bramble berry","foam flower fruit","Lingonberry"]', 'Fruits', 'AI生成', 'Lingonberry', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2620', '["亞麻籽油","胡麻油","flaxseed oil","linseed","flax oil","linseed oil"]', 'Herbs and Spices', 'AI生成', 'linseed oil', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2621', '["烈酒","蒸餾酒","燒酒","白蘭地","威士忌","伏特加","琴酒","龍舌蘭","朗姆酒","清酒","distilled spirits","hard liquor","spirits","booze","hooch","moonshine","rotgut","white lightning","firewater","shot","tanglefoot","Liquor"]', 'Beverages', 'AI生成', 'Liquor', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2622', '["甘草","甜根子","licorice","sweet root","Spanish licorice","Liquorice"]', 'Confectioneries', 'AI生成', 'Liquorice', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2623', '["洛根莓","loganberry","Loganberry"]', 'Fruits', 'AI生成', 'Loganberry', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2624', '["枇杷","羅_GUAT","日本梅","Japanese medlar","Japanese plum","Chinese plum","Loquat"]', 'Fruits', 'AI生成', 'Loquat', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2625', '["荷花","蓮花","菡萏","芙蕖","water lily (though not closely related)","lotus flower","Lotus"]', 'Herbs and Spices', 'AI生成', 'Lotus', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2626', '["香芹","大葉芹","Love parsley","Sea Holly","Lovage"]', 'Herbs and Spices', 'AI生成', 'Lovage', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2627', '["野生越桔","低蔓越莓","wild blueberry","bog blueberry","Lowbush blueberry"]', 'Fruits', 'AI生成', 'Lowbush blueberry', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2628', '["鰈魚","吸盤魚","lumpfish","sea hen","codfish","oakleaf lumpfish","Lumpsucker"]', 'Aquatic foods', 'AI生成', 'Lumpsucker', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2629', '["羽扇豆","塔維","喬楚","lupin","lupine","bluebonnet","Lupine"]', 'Pulses', 'AI生成', 'Lupine', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2630', '["夏威夷果","堅果皇后","澳洲果仁","macadamia nut","Queensland nut","bush nut","maroochi nut","queen of nuts","bauple nut","Macadamia nut"]', 'Nuts', 'AI生成', 'Macadamia nut', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2631', '["巴西堅果","馬卡朵尼亞果仁","巴浦爾堅果","Macadamia Nut","Bauple Nut","Prickly Macadamia","Queensland Nut","Rough-shelled Bush Nut","Rough-shelled Queensland Nut","Macadamia nut (M. tetraphylla)"]', 'Nuts', 'AI生成', 'Macadamia nut (M. tetraphylla)', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2632', '["芝士通心粉","車達芝士意面","馬克熱尼","mac and cheese","macaroni cheese","baked macaroni and cheese","cheese casserole with pasta","Macaroni and cheese"]', 'Dishes', 'AI生成', 'Macaroni and cheese', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2633', '["海帶","紫菜","昆布","石花菜","江蘗","海苔","seaweed","kelp","algae","laver","wrack","nori","Macroalgae"]', 'Aquatic foods', 'AI生成', 'Macroalgae', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2634', '["馬德拉酒","葡萄牙加烈酒","Madeira","Portuguese Madeira wine","Madeira wine"]', 'Beverages', 'AI生成', 'Madeira wine', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2635', '["松茸","舞菇","hen-of-the-woods","ram's head","sheep's head","signorina mushroom","Maitake"]', 'Vegetables', 'AI生成', 'Maitake', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2636', '["洋薔薇果","馬來果","玫瑰蘋果","rose apple","pomarrosa","jambu air","Malabar plum"]', 'Fruits', 'AI生成', 'Malabar plum', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2637', '["野鴨","綠頭鴨","wild duck","green-headed duck","dabbling duck","Mallard duck"]', 'Animal foods', 'AI生成', 'Mallard duck', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2638', '["野蘋果","山苹果","crabapple","crab apple","wild apple","crabs","Malus (Crab apple)"]', 'Fruits', 'AI生成', 'Malus (Crab apple)', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2639', '["馬梅士果","馬蜜士果","馬梅果","mamey","zapote","red mamey","zapote colorado","zapote rojo","Mamey sapote"]', 'Fruits', 'AI生成', 'Mamey sapote', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2640', '["馬梅果","馬梅子","mamme fruit","mamey sapote","zapote mamey","Spanish custard","Mammee apple"]', 'Fruits', 'AI生成', 'Mammee apple', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2641', '["人造奶油","植物黃油","植脂末","butter substitute","oleo","spread","Margarine"]', 'Fats and oils', 'AI生成', 'Margarine', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2642', '["人造奶油","奶油替代品","植物奶油","黃油軟膏","spreadable margarine","soft margarine","table spread","butter alternative","Margarine-like spread"]', 'Fats and oils', 'AI生成', 'Margarine-like spread', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2643', '["海虹","青口","sea mussel","bay mussel","Marine mussel"]', 'Aquatic foods', 'AI生成', 'Marine mussel', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2644', '["棉花糖","marshmallow","candy pillow","puff candy","Marshmallow"]', 'Confectioneries', 'AI生成', 'Marshmallow', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2645', '["杏仁糖","杏仁膏","almond sugar","almond paste","marchpane","linden blossom candy","kamratti","Marzipan"]', 'Confectioneries', 'AI生成', 'Marzipan', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2646', '["馬黛茶","巴拉圭冬青葉","yerba mate","erva mate","mate tea","South American tea","Mate"]', 'Herbs and Spices', 'AI生成', 'Mate', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2647', '["肉湯精","肉清湯","meat broth powder","beef bouillon","chicken stock granules","Meat bouillon"]', 'Baking goods', 'AI生成', 'Meat bouillon', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2648', '["肉丸","肉圓","炸肉球","四喜丸子","餛飩肉","meatball","ground round","bollito","Meatball"]', 'Dishes', 'AI生成', 'Meatball', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2649', '["肉 loaf","肉蛋糕","肉派","meat pie","ground meat loaf","baked meatloaf","slumgullion","Meatloaf"]', 'Dishes', 'AI生成', 'Meatloaf', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2650', '["歐核木果","歐洲榠楂","common medlar","open-armed","loquat (misnomer)","Medlar"]', 'Fruits', 'AI生成', 'Medlar', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2651', '["薄荷","留蘭草","mint","spearmint","peppermint","scotch mint","Mentha"]', 'Herbs and Spices', 'AI生成', 'Mentha', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2652', '["蛋白酥","蛋白餅","雪白蛋卷","meringue cookies","egg white foam","swiss meringue","Meringue"]', 'Confectioneries', 'AI生成', 'Meringue', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2653', '["墨西哥小黃瓜","番茄果實","綠色牛蕃茄","洋香瓜","tomatillo","jamberry","mexican tomato","purple ground cherry","green husk tomato","Mexican groundcherry"]', 'Vegetables', 'AI生成', 'Mexican groundcherry', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2654', '["墨西哥牛至","紅brush唇形科","redbrush lippia","scented lippia","oregano Cimmaron","scented matgrass","Mexican oregano"]', 'Herbs and Spices', 'AI生成', 'Mexican oregano', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2655', '["温州蜜柑","文旦","無籽柑橘","福岡柑","Satsuma","Clementine","Seedless Mandarin","Unshiu","Mikan"]', 'Fruits', 'AI生成', 'Mikan', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2656', '["牛奶","乳汁","milk","cow's milk","Milk (Cow)"]', 'Milk and milk products', 'AI生成', 'Milk (Cow)', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2657', '["奶","乳汁","母乳","milk","white milk","breast milk","colostrum","Milk (Human)"]', 'Milk and milk products', 'AI生成', 'Milk (Human)', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2658', '["奶","乳汁","牛乳","牛奶","milk","breast milk","cows' milk","dairy milk","Milk (Other mammals)"]', 'Milk and milk products', 'AI生成', 'Milk (Other mammals)', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2659', '["奶類","乳製品","牛奶及其制品","dairy products","milk and milk-derived foods","cow's milk products","dairy items","Milk and milk products"]', 'Milk and milk products', 'AI生成', 'Milk and milk products', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2660', '["豆漿","米漿","杏仁露","花生奶","粟米奶","椰汁","稻米奶","燕麥奶","soy milk","rice milk","almond milk","peanut milk","hemp milk","coconut milk","oat milk","grain milk","plant milk","vegan milk","non-dairy milk","milk alternatives","Milk substitute"]', 'Baking goods', 'AI生成', 'Milk substitute', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2661', '["鯔魚","白鯔","awa","Milkfish"]', 'Aquatic foods', 'AI生成', 'Milkfish', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2662', '["奶昔","冰沙奶","thick shake","frozen custard","ice cream milkshake","milk dudgeon","frappe","Milkshake"]', 'Confectioneries', 'AI生成', 'Milkshake', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2663', '["小米","蕎麥","黍子","稷","䅟子","pearl millet","broomcorn millet","foxtail millet","proso millet","finger millet","Millet"]', 'Cereals and cereal products', 'AI生成', 'Millet', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2664', '["味噌","miso","Miso"]', 'Soy', 'AI生成', 'Miso', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2665', '["混合堅果","五香 nuts","混炒堅果","多味堅果","mixed peanuts and nuts","nut mix","roasted mixed nuts","salted nuts mix","snack nut mixture","Mixed nuts"]', 'Nuts', 'AI生成', 'Mixed nuts', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2666', '["黑糖漿","糖蜜","blackstrap molasses","treacle","sorghum molasses","Molasses"]', 'Baking goods', 'AI生成', 'Molasses', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2667', '["軟體動物","海產","貝類","shellfish","seafood","conchs","clams","oysters","squid","cuttlefish","octopus","abalone","scallops","Mollusks"]', 'Aquatic foods', 'AI生成', 'Mollusks', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2668', '["羅漢果","甜甘草","金不換","神仙果","Luo han guo","Grosvenor fruit","Swingle's fruit","Monk fruit"]', 'Fruits', 'AI生成', 'Monk fruit', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2669', '["僧侶魚","海底鯊","海和尚","goosefish","anglerfish","sea monk","Monkfish"]', 'Aquatic foods', 'AI生成', 'Monkfish', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2670', '["莫尼特瑞賈克乾酪","蒙大拿賈克奶酪","賈克乾酪","Jack cheese","Dry Jack","Mild Monterey Jack","Monterey Jack cheese"]', 'Milk and milk products', 'AI生成', 'Monterey Jack cheese', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2671', '["網狀蜜環菌","蜂窩菌","true morel","morel mushroom","yellow morel","common morel","Morchella (Morel)"]', 'Vegetables', 'AI生成', 'Morchella (Morel)', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2672', '["金鳳豆","土耳其黃豆","mat bean","Turkish gram","Moth bean"]', 'Pulses', 'AI生成', 'Moth bean', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2673', '["山兔","高山兔","blue hare","tundra hare","variable hare","white hare","snow hare","alpine hare","Irish hare","Mountain hare"]', 'Animal foods', 'AI生成', 'Mountain hare', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2674', '["山藥","五葉薯","fiveleaf yam","prickly yam","Dioscorea pentaphylla","Mountain yam"]', 'Vegetables', 'AI生成', 'Mountain yam', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2675', '["莫澤瑞拉芝士","馬札瑞拉奶酪","意大利莫扎里拉","Mozzarella","Italian mozzarella","buffalo mozzarella","Mozzarella cheese"]', 'Milk and milk products', 'AI生成', 'Mozzarella cheese', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2676', '["艾草","青蒿","common wormwood","Artemisia herb","Mugwort"]', 'Herbs and Spices', 'AI生成', 'Mugwort', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2677', '["桑葚","桑果","mulberry","blackberry (misnomer)","red mulberry","white mulberry","Mulberry"]', 'Fruits', 'AI生成', 'Mulberry', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2678', '["麋鹿","美洲麋鹿","black-tailed deer","varieties of Odocoileus hemionus","Mule deer"]', 'Animal foods', 'AI生成', 'Mule deer', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2679', '["全穀面包","多穀面包","multigrain loaf","whole grain bread","seeds and grains bread","mixed grain bread","Multigrain bread"]', 'Cereals and cereal products', 'AI生成', 'Multigrain bread', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2680', '["mundu","Mundu"]', 'Fruits', 'AI生成', 'Mundu', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2681', '["麝貓葡萄","美國麝香葡萄","Bullace grape","Southern fox grape","Muscadine grape"]', 'Fruits', 'AI生成', 'Muscadine grape', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2682', '["菌菇","蘑菇","蕈菇","草菇","香菇","金針菇","杏鮑菇","黑木耳","toadstool","fungus fruit body","agaric","button mushroom","shitake","enoki","Mushrooms"]', 'Vegetables', 'AI生成', 'Mushrooms', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2683', '["香瓜","網紋瓜","絲瓜（注意：這裡的絲瓜通常指的是Cucurbita moschata屬，與Muskmelon不同）","哈密瓜","honeydew","cantaloupe","casaba","Santa Claus melon","Christmas melon","Persian melon","crenshaw","Muskmelon"]', 'Gourds', 'AI生成', 'Muskmelon', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2684', '["芥末","hot mustard","yellow mustard","dijon mustard","mustard powder","Mustard"]', 'Baking goods', 'AI生成', 'Mustard', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2685', '["小松菜","芥藍菜","白菜仔","komatsuna","Japanese mustard spinach","Mustard spinach"]', 'Vegetables', 'AI生成', 'Mustard spinach', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2686', '[" nachos","墨西哥炸玉米片","nachos","tortilla chips with cheese and salsa","Nachos"]', 'Dishes', 'AI生成', 'Nachos', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2687', '["克拉布","薩瓦納瑟雷特","craboo","kraabu","Golden Spoon","nancite","Nance"]', 'Fruits', 'AI生成', 'Nance', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2688', '["毛樱桃","山樱桃","中国矮樱桃"," Hansen的灌木樱桃","Korean cherry","Manchu cherry","downy cherry","Shanghai cherry","Ando cherry","mountain cherry","Chinese bush cherry","Chinese dwarf cherry","Hansen's bush cherry","Nanking cherry"]', 'Fruits', 'AI生成', 'Nanking cherry', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2689', '["娃娃菜","天津白菜","雪白菜","包心捲心菜","北京白菜","Chinese cabbage","celery cabbage","wombok","Wong Bok","Won bok","Chinese Leaf","Napa cabbage"]', 'Vegetables', 'AI生成', 'Napa cabbage', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2690', '["南蘭吉拉","藍吉拉","lulo","Naranjilla"]', 'Fruits', 'AI生成', 'Naranjilla', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2691', '["蒲草","小蘆葦","窄叶香蒲","lesser bulrush","narrowleaf cattail","lesser reedmace","Narrowleaf cattail"]', 'Vegetables', 'AI生成', 'Narrowleaf cattail', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2692', '["大納姆","Large Num-Num","Noem-Noem","Amatungulu","Natal plum"]', 'Fruits', 'AI生成', 'Natal plum', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2693', '["納豆","納島","natto","sticky soybeans","fermented soybeans","Natto"]', 'Soy', 'AI生成', 'Natto', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2694', '["水蜜桃","油桃","shaved peach","fuzzy-less peach","juicy peach","Brazilian peach","Nectarine"]', 'Fruits', 'AI生成', 'Nectarine', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2695', '["新西兰菠菜","澳洲菠菜","海菠菜","Warrigal greens","kokihi","sea spinach","Botany Bay spinach","tetragon","Cook's cabbage","New Zealand spinach"]', 'Vegetables', 'AI生成', 'New Zealand spinach', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2696', '["仙人掌嫩片","仙人掌菜","龍舌蘭掌","prickly pear pad","cactus pad","nopal cactus leaf","Nopal"]', 'Vegetables', 'AI生成', 'Nopal', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2697', '["北太平洋巨型章魚","大太平洋章魚","giant Pacific octopus","North Pacific giant octopus","GPO"]', 'Aquatic foods', 'AI生成', 'North Pacific giant octopus', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2698', '["北蓝鳍金枪鱼","大西洋蓝鳍金枪鱼","northern bluefin tuna","giant bluefin tuna","tunny","Northern bluefin tuna"]', 'Aquatic foods', 'AI生成', 'Northern bluefin tuna', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2699', '["鱖魚","大鱖","pike","jackfish","northern","pickerel","Northern pike"]', 'Aquatic foods', 'AI生成', 'Northern pike', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2700', '["玫瑰魚","挪威鱈魚","ocean perch","Atlantic redfish","red perch","red bream","golden redfish","hemdurgan","Norway haddock"]', 'Aquatic foods', 'AI生成', 'Norway haddock', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2701', '["挪威 lobster","杜林貝蝦","長蝦","挪威龍蝦","挪威蝦","Dublin Bay prawn","langoustine","scampi","Norway lobster","sea scorpion"]', 'Aquatic foods', 'AI生成', 'Norway lobster', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2702', '["北極海鳁鱼","挪威鳁鱼","Esmark's gilthead","Norwegian pout","European pout","Norway pout"]', 'Aquatic foods', 'AI生成', 'Norway pout', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2703', '["奶糖","蛋白軟糖","杏仁軟糖","toothsome","marshmallow nougat","Nougat"]', 'Confectioneries', 'AI生成', 'Nougat', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2704', '["荳蔻","肉豆蔻","nutmeg seed","mace nut","Nutmeg"]', 'Herbs and Spices', 'AI生成', 'Nutmeg', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2705', '["能量飲料","提神飲料","營養保健飲料","運動飲料","energy drink","stamina drink","boost drink","vigour juice","Nutritional drink"]', 'Beverages', 'AI生成', 'Nutritional drink', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2706', '["堅果","果仁","nutmeat","kernel","Nuts"]', 'Nuts', 'AI生成', 'Nuts', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2707', '["華氏蛤蜊","海蠍子","basket cockle","Nuttall's cockle","Nuttall cockle"]', 'Aquatic foods', 'AI生成', 'Nuttall cockle', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2708', '["燕麥","歐大","oatmeal","rolled oats","porridge oats","Oat"]', 'Cereals and cereal products', 'AI生成', 'Oat', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2709', '["燕麥包","燕麥麵包","oaty bread","oat loaf","Oat bread"]', 'Cereals and cereal products', 'AI生成', 'Oat bread', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2710', '["海底滑魚","海豬","滑魚","American eelpout","Atlantic eelpout","Ocean pout"]', 'Aquatic foods', 'AI生成', 'Ocean pout', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2711', '["奥赫洛浆果","夏威夷越桔","Hawaiian berry","Mauna Loa berry","Ohelo berry"]', 'Fruits', 'AI生成', 'Ohelo berry', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2712', '["油棕","oil palm","palm oil plant","Oil palm"]', 'Herbs and Spices', 'AI生成', 'Oil palm', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2713', '["山茶籽","茶籽","tea oil camellia","oil-seed tea","Oil-seed Camellia"]', 'Herbs and Spices', 'AI生成', 'Oil-seed Camellia', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2714', '["秋葵","君子豆","黃秋葵","鬼蠶蛹","lady's fingers","bhindi","gumbo","Okra"]', 'Vegetables', 'AI生成', 'Okra', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2715', '["橄欖果","油橄欖","olive fruit","olea","Olive"]', 'Vegetables', 'AI生成', 'Olive', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2716', '["蔥類蔬菜","蒜苗","韮菜","藠頭","onion family vegetables","alliums","bulb vegetables","Onion-family vegetables"]', 'Vegetables', 'AI生成', 'Onion-family vegetables', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2717', '["鴉片花","嗎啡草","opium poppy","blueweed","breadseed poppy","hector's poppy","Opium poppy"]', 'Herbs and Spices', 'AI生成', 'Opium poppy', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2718', '["橙椒","甜椒","彩椒","bell pepper","pepper","capsicum","maleda (Philippines)","pimiento","manzana (Spain)","Orange bell pepper"]', 'Vegetables', 'AI生成', 'Orange bell pepper', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2719', '["香薄荷","柑橘薄荷","bergamot mint","eau-de-cologne mint","horsemint","lemon mint","lime mint","pineapple mint","su nanesi","water mint","wild water mint","yerba buena","Orange mint"]', 'Herbs and Spices', 'AI生成', 'Orange mint', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2720', '["紅 roughy","深海鱈魚","滑頭鱼","red roughy","slimehead","deep sea perch","Orange roughy"]', 'Aquatic foods', 'AI生成', 'Orange roughy', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2721', '["俄勒岡蔥根","Oregon洋蔦子","Eppaw","Oregon false helleborine","Oregon yampah"]', 'Vegetables', 'AI生成', 'Oregon yampah', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2722', '["波斯小麥","特拉尼科小麥","Khorasan wheat","Triticale (注意：這是一種錯誤的別稱，因為它與另一種不同的穀物混淆)","Oriental wheat"]', 'Cereals and cereal products', 'AI生成', 'Oriental wheat', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2723', '["非洲鸵鳥","common ostrich","camel bird","Ostrich"]', 'Animal foods', 'AI生成', 'Ostrich', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2724', '["鹿尾蕨","沙洲蘆薈","shuttlecock fern","ostrich plume fern","Ostrich fern"]', 'Vegetables', 'AI生成', 'Ostrich fern', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2725', '["其他酒精飲料","非主流酒類","other alcoholic beverage","alternative alcohol","miscellaneous spirits","Other alcoholic beverage"]', 'Beverages', 'AI生成', 'Other alcoholic beverage', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2726', '["動物油","豬油","牛油","雞油","羊油","魚油","奶油","乳油","lard","tallow","schmaltz","ghee","butter","Other animal fat"]', 'Fats and oils', 'AI生成', 'Other animal fat', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2727', '["飲料","飲品","beverage","drink","Other beverage"]', 'Beverages', 'AI生成', 'Other beverage', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2728', '["土司","面包","white bread","loaf","wheat bread","sandwich loaf","brown bread","rye bread","sourdough","Other bread"]', 'Cereals and cereal products', 'AI生成', 'Other bread', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2729', '["其他面包产品","other bread product","various breads","Other bread product"]', 'Cereals and cereal products', 'AI生成', 'Other bread product', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2730', '["糖果","甜食","糖豆","糖果點心","candy","sweets","lollies","confections","Other candy"]', 'Confectioneries', 'AI生成', 'Other candy', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2731', '["其他穀物製品","other cereal product","grain-based products","cereal items","Other cereal product"]', 'Cereals and cereal products', 'AI生成', 'Other cereal product', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2732', '["可可副產品","巧克力原料","cocoa byproduct","cocoa miscellany","Other cocoa product"]', 'Cocoa and cocoa products', 'AI生成', 'Other cocoa product', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2733', '["土豆","洋芋","馬鈴薯","薯仔","potato","spud","tater","murphy","Other dish"]', 'Dishes', 'AI生成', 'Other dish', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2734', '["發酵奶","乳製品","酸奶","酸牛奶","yogurt","curd","sour milk","cultured buttermilk","Other fermented milk"]', 'Milk and milk products', 'AI生成', 'Other fermented milk', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2735', '["魚製品","水產加工品","fish products","aquatic food items","Other fish product"]', 'Aquatic foods', 'AI生成', 'Other fish product', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2736', '["凍甜品","冰品","冷飲","雪糕","冰淇淋","frozen dessert","ice cream alternative","frozen confection","soft serve","ice milk","fro-yo (frozen yogurt)","Other frozen dessert"]', 'Confectioneries', 'AI生成', 'Other frozen dessert', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2737', '["其他水果制品","other fruit product","miscellaneous fruits","Other fruit product"]', 'Fruits', 'AI生成', 'Other fruit product', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2738', '["夾包","多士","三明治","sandwich","sanger","butty","Other sandwich"]', 'Dishes', 'AI生成', 'Other sandwich', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2739', '["零嘴","小吃","點心","茶食","snack food","treats","nibbles","munchies","Other snack food"]', 'Snack foods', 'AI生成', 'Other snack food', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2740', '["豆腐製品","豆制品","soy product","bean curd food","Other soy product"]', 'Soy', 'AI生成', 'Other soy product', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2741', '["土豆","洋芋","馬鈴薯","地瓜","番薯","山藥豆","薯仔","potato","spud","tater","murphy","Irish apple","batty","Other vegetable product"]', 'Vegetables', 'AI生成', 'Other vegetable product', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2742', '["其他酒","其它葡萄酒","other wine","mixed wine","varietal wine","Other wine"]', 'Beverages', 'AI生成', 'Other wine', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2743', '["楕圓葉越桔","北越橘","Alaska blueberry","early blueberry","oval-leaf bilberry","oval-leaf blueberry","Oval-leaf huckleberry"]', 'Fruits', 'AI生成', 'Oval-leaf huckleberry', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2744', '["牛心菜","oxheart cabbage","Chinese flowering cabbage","Oxheart cabbage"]', 'Vegetables', 'AI生成', 'Oxheart cabbage', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2745', '["蚝菇","牡蠣菇","扇形蘑菇","abalone mushroom","tree ear mushroom","oyster grub","Oyster mushroom"]', 'Vegetables', 'AI生成', 'Oyster mushroom', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2746', '["太平洋鳕鱼","灰鳕","gray cod","grey cod","grayfish","greyfish","Pacific cod"]', 'Aquatic foods', 'AI生成', 'Pacific cod', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2747', '["太平洋鱈鰣","大比目魚","halibut","Pacific flatfish","barn-door halibut","turbot","Pacific halibut"]', 'Aquatic foods', 'AI生成', 'Pacific halibut', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2748', '["鳁鱼","鲱鱼","Pacific herring","Clupea pallasii"]', 'Aquatic foods', 'AI生成', 'Pacific herring', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2749', '["太平洋拟鲹","加州拟鲹","Californian jack mackerel","Murphy's jack mackerel","Pacific jack mackerel"]', 'Aquatic foods', 'AI生成', 'Pacific jack mackerel', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2750', '["太平洋紅蟹","Popeye","Alaska red perch","Pacific ocean perch"]', 'Aquatic foods', 'AI生成', 'Pacific ocean perch', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2751', '["太平洋牡蠣","日本牡蠣","宮城牡蠣","Japanese oyster","Miyagi oyster","Pacific oyster"]', 'Aquatic foods', 'AI生成', 'Pacific oyster', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2752', '["鰺科魚","太平洋鯡魚","石首鱼","ocean perch","sea perch","redfish","Pacific rockfish"]', 'Aquatic foods', 'AI生成', 'Pacific rockfish', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2753', '["大麻哈魚","太平洋三文鱼","king salmon","reds","sockeye","coho","chinook","pink salmon","Pacific salmon"]', 'Aquatic foods', 'AI生成', 'Pacific salmon', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2754', '["太平洋鳁鱼","南美鳁鲱","澳洲鳁鲱","蓝饵","South American pilchard","blue pilchard","Australian pilchard","blue-bait","Californian pilchard","Chilean sardine","Japanese pilchard","Southern African pilchard","Pacific sardine"]', 'Aquatic foods', 'AI生成', 'Pacific sardine', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2755', '["彩繪鯛","畫鯛","painted sea bass","Mediterranean comber","scriba","Painted comber"]', 'Aquatic foods', 'AI生成', 'Painted comber', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2756', '["白菜","小白菜","上海青","油菜心","白梗菜","bok choy","Chinese white cabbage","white mustard spinach","Pak choy"]', 'Vegetables', 'AI生成', 'Pak choy', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2757', '["甜面包","墨西哥甜面包","Mexican sweet bread","Pan dulce"]', 'Cereals and cereal products', 'AI生成', 'Pan dulce', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2758', '["薄餅","鬆餅","煎餅","烙餅","flapjack","griddlecake","hotcake","buckwheat cake","crepe (depending on thickness)","Pancake"]', 'Dishes', 'AI生成', 'Pancake', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2759', '["帕馬森芝士","帕瑪森芝士","帕爾馬芝士","Parmigiano-Reggiano","Pecorino Romano","Grana Padano","Parmesan cheese"]', 'Milk and milk products', 'AI生成', 'Parmesan cheese', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2760', '["歐芹","法國 parsley","Italian parsley","curly-leaf parsley","flat-leaf parsley","French parsley","Parsley"]', 'Herbs and Spices', 'AI生成', 'Parsley', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2761', '["糖蘿蔔","土芝士","Parsnip"]', 'Vegetables', 'AI生成', 'Parsnip', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2762', '["紅果實","越橘","lingonberry","cowberry","mountain cranberry","rock cranberry","Partridge berry"]', 'Fruits', 'AI生成', 'Partridge berry', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2763', '["情人果","心醉果","passion fruit","passionflower fruit","purple granadilla","water lemon","Passion fruit"]', 'Fruits', 'AI生成', 'Passion fruit', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2764', '["意粉","義大利面","通心粉","noodle","spaghetti","macaroni","linguine","fettuccine","vermicelli","Pasta"]', 'Cereals and cereal products', 'AI生成', 'Pasta', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2765', '["西點","糕餅","派皮","酥皮","千層皮","酥盒","baked goods","tarts","pasties","pies","quiches","danish pastries","croissants","Pastry"]', 'Confectioneries', 'AI生成', 'Pastry', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2766', '["肉凜","肉醬","肉鬆餅","pâté","paté","meat paste","Pate"]', 'Dishes', 'AI生成', 'Pate', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2767', '[" pea苗","豌豆尖","pea tips","young pea leaves","Pea shoots"]', 'Vegetables', 'AI生成', 'Pea shoots', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2768', '["桃子","仙桃","水蜜桃","油桃","蟠桃","peach","nectarine","Persian plum","stone fruit","Peach"]', 'Fruits', 'AI生成', 'Peach', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2769', '["桃","仙桃","壽桃","peach","nectarine","flat peach","sand peach","Peach (var.)"]', 'Fruits', 'AI生成', 'Peach (var.)', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2770', '["梨","雪梨","香梨","水晶梨","水梨","pot pear","clinging pear","butter pear","apple-pear","Pear"]', 'Fruits', 'AI生成', 'Pear', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2771', '["巴克曼杏仁","美洲胡桃","pecan","pecan nut","native pecan","Pecan nut"]', 'Nuts', 'AI生成', 'Pecan nut', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2772', '["果膠","pectin","gelifying agent","Pectin"]', 'Baking goods', 'AI生成', 'Pectin', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2773', '["辣椒","甜椒","菜椒","柿子椒","甜柿椒","墨西哥椒","bell pepper","sweet pepper","chili pepper","chile pepper","capsicum","peper","Pepper"]', 'Vegetables', 'AI生成', 'Pepper', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2774', '["辣椒巴卡圖姆","熱帶辣椒","Peppadew","Aji","Wiri","Criolla","Limo","Pepper (C. baccatum)"]', 'Vegetables', 'AI生成', 'Pepper (C. baccatum)', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2775', '["小米椒","朝天椒","魔鬼椒","卡宴辣椒","habanero pepper","scotch bonnet","datil pepper","jamaican hot pepper","Pepper (C. chinense)"]', 'Vegetables', 'AI生成', 'Pepper (C. chinense)', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2776', '["小米椒","朝天椒","辣椒仔","bird's eye chili","tabasco pepper","cayenne pepper","Pepper (C. frutescens)"]', 'Vegetables', 'AI生成', 'Pepper (C. frutescens)', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2777', '["樹辣椒","洛可多","rocoto","locoto","tree chili","Pepper (C. pubescens)"]', 'Vegetables', 'AI生成', 'Pepper (C. pubescens)', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2778', '["甜椒","辣椒","柿子椒","彩椒","鷹嘴椒","小米椒","朝天椒","牛角椒","杭椒","線椒","bell pepper","capsicum","chili pepper","pepper","sweet pepper","jalapeño","habanero","tabasco","peppadew","rocoto","Pepper (Capsicum)"]', 'Vegetables', 'AI生成', 'Pepper (Capsicum)', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2779', '["胡椒","黑胡椒","白胡椒","青胡椒","black pepper","white pepper","green peppercorn","Pepper (Spice)"]', 'Herbs and Spices', 'AI生成', 'Pepper (Spice)', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2780', '["薄荷","留息香","mint","winter mint","brandy mint","Peppermint"]', 'Herbs and Spices', 'AI生成', 'Peppermint', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2781', '["鯖魚","鱸魚","鰭魚","perch-like fishes","spiny-rayed fish","ray-finned fishes","Perciformes"]', 'Aquatic foods', 'AI生成', 'Perciformes', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2782', '["鱸魚","鯖魚","石斑","鲬魚","海鰽","bass","snapper","jack","whiting","grouper","perch","porgy","sea bass","Percoidei (Bass and others)"]', 'Aquatic foods', 'AI生成', 'Percoidei (Bass and others)', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2783', '["波斯青檮","雪瑞茲萊莫","Shiraz Lime","Tahiti lime","Bearss lime","Persian lime"]', 'Fruits', 'AI生成', 'Persian lime', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2784', '["柿子","洋柿子","sharon fruit","kaki","japanese persimmon","Persimmon"]', 'Fruits', 'AI生成', 'Persimmon', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2785', '["雉雞","野雞","common pheasant","golden pheasant","ring-necked pheasant","Pheasant"]', 'Animal foods', 'AI生成', 'Pheasant', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2786', '["菲洛 dough","菲羅 dough","皮利多","filo dough","fillo dough","phyllo sheets","Phyllo dough"]', 'Baking goods', 'AI生成', 'Phyllo dough', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2787', '["派","pie","tart","mince pie","custard pie","Pie"]', 'Confectioneries', 'AI生成', 'Pie', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2788', '["派皮","餡餅皮","pastry shell","pie skin","bottom crust","top crust","dough casing","Pie crust"]', 'Baking goods', 'AI生成', 'Pie crust', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2789', '["派餡","pie filling","filling for pie","Pie filling"]', 'Baking goods', 'AI生成', 'Pie filling', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2790', '["紅小豆","印度扁豆","咖納斯豆","red gram","gungo pea","congo pea","no eye pea","kondre","arhar dal","toor dal","Pigeon pea"]', 'Pulses', 'AI生成', 'Pigeon pea', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2791', '["鱒鰉","梭魚","黃花鯡","pale pikeperch","walleye","yellow pickerel","pickerel","jack salmon","northern pike-perch","Pikeperch"]', 'Aquatic foods', 'AI生成', 'Pikeperch', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2792', '["希基薄餅","霍皮薄饼","Hopi bread","blue corn piki","Piki bread"]', 'Cereals and cereal products', 'AI生成', 'Piki bread', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2793', '["披里果","披里仁","菲律果","Pili nut"]', 'Nuts', 'AI生成', 'Pili nut', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2794', '["鳳梨香薄荷","洋莢草","pineapple-flavored sage","tangerine sage","red salvia","Pineappple sage"]', 'Herbs and Spices', 'AI生成', 'Pineappple sage', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2795', '["紅鱒","粉鱒","鰉魚","humpback salmon","humpy","pinks","Pink salmon"]', 'Aquatic foods', 'AI生成', 'Pink salmon', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2796', '["皮塔餅","口袋麵包","pocket bread","arabic pita","Pita bread"]', 'Cereals and cereal products', 'AI生成', 'Pita bread', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2797', '["巴西櫻桃","巴西莓果","西蘭姆櫻桃","Surinam Cherry","Brazilian Cherry","Cayenne Cherry","Pitanga"]', 'Fruits', 'AI生成', 'Pitanga', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2798', '["紅心火龍果","白心火龍果","仙人掌果","Dragon Fruit","Dragonfruit","Pitahaya","Pitaya"]', 'Fruits', 'AI生成', 'Pitaya', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2799', '["披薩","匹薩","比萨","pizza","pie","slice","Pizza"]', 'Dishes', 'AI生成', 'Pizza', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2800', '["奶油奶酪","馬斯卡彭","芝士","soft cheese","white cheese","Philadelphia cream cheese (brand name)","Plain cream cheese"]', 'Milk and milk products', 'AI生成', 'Plain cream cheese', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2801', '["平原仙人掌果","扭刺仙人掌果","紅色仙人掌果","Twist-spine Prickly Pear","Yellow-flowered Prickly Pear","Plains Cactus Fruit","Plains prickly pear"]', 'Fruits', 'AI生成', 'Plains prickly pear', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2802', '["大蕉","芭蕉","飯蕉","banana plantain","cooking banana","Plantain"]', 'Fruits', 'AI生成', 'Plantain', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2803', '["比目魚","扁魚","鰈魚","左口","右口","海鯉","鱆魚","黃花魚","鰜魚","dab","halibut","plaice","flounder","turbot","sole","righteye flounder","lefteye flounder","angler flounder","Pleuronectidae (Dab, Halibut, Plaice)"]', 'Aquatic foods', 'AI生成', 'Pleuronectidae (Dab, Halibut, Plaice)', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2804', '["大比目魚","鱈魚類","pollack","Atlantic pollock","European pollock","lieu jaune","lythe","Boston blues","coalfish","coly","silver bills","saithe","Pollock"]', 'Aquatic foods', 'AI生成', 'Pollock', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2805', '["石榴","安石榴","臘子","granada","pomey","mullberry root bark","Chinese apple","Pomegranate"]', 'Fruits', 'AI生成', 'Pomegranate', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2806', '["蘋果","梨子","apple","pear","orchard apple","crab apple","Pomes"]', 'Fruits', 'AI生成', 'Pomes', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2807', '["爆米花","玉米花","popcorn","popping corn","Popcorn"]', 'Snack foods', 'AI生成', 'Popcorn', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2808', '["罌粟花","鴉片花","corn poppy","field poppy","opium poppy","oriental poppy","iceland poppy","california poppy","welsh poppy","nepal poppy","celandine poppy","prickly poppy","matilija poppy","pygmy poppy","wind poppy","desert bearpaw poppy","tulip poppy","tree poppy","Poppy"]', 'Herbs and Spices', 'AI生成', 'Poppy', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2809', '["砵酒","波特酒","葡萄牙甜酒","Porto","Vinho do Porto","Oporto","Port wine"]', 'Beverages', 'AI生成', 'Port wine', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2810', '["希臘 origanum","土耳其 origanum","Cretan oregano","Turkish oregano","rίgani","Pot marjoram"]', 'Herbs and Spices', 'AI生成', 'Pot marjoram', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2811', '["派撻","肉派","pot pie","hot pie","meat pie","Pot pie"]', 'Dishes', 'AI生成', 'Pot pie', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2812', '["土豆","洋芋","馬鈴薯","薯仔","地瓜（注意：這有時特指甘藷，需區分）","土瓜","potato","spud","tater","murphy","Irish potato","white potato","Potato"]', 'Vegetables', 'AI生成', 'Potato', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2813', '["土豆","洋芋","馬鈴薯","土瓜","山藥","地蘿蔔","薯仔","potato bread","murphy","tater bread","spud bread","potato roll","Potato bread"]', 'Cereals and cereal products', 'AI生成', 'Potato bread', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2814', '["薯片","炸薯片","洋芋片","馬鈴薯片","土豆片","chip","crisps","potato chips","wafers","tater tots","spuds","murphys","Potato chip"]', 'Snack foods', 'AI生成', 'Potato chip', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2815', '["土豆","洋芋","馬鈴薯","薯仔","地瓜","土瓜","potato","spud","tater","murphy","Irish potato","white potato","Potato gratin"]', 'Dishes', 'AI生成', 'Potato gratin', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2816', '["土豆","洋芋","馬鈴薯","薯仔","地瓜（注意：此為甘藷的俗稱，需與土豆區分）","potato","spud","tater","murphy","Irish potato","Potato puffs"]', 'Dishes', 'AI生成', 'Potato puffs', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2817', '["草原洋蔥","tipsin","teepsenee","breadroot","breadroot scurf pea","pomme blanche","little breadroot","Prairie turnip"]', 'Vegetables', 'AI生成', 'Prairie turnip', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2818', '["仙人掌果","仙人球果","刺梨果","平托","nopales","tuna","nopal","paddle cactus","Indian fig opuntia","Prickly pear"]', 'Fruits', 'AI生成', 'Prickly pear', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2819', '["再制奶酪","人造奶油奶酪","調理奶酪","加工奶酪","cheese food","cheese spread","cheese product","American cheese (brand name)","Processed cheese"]', 'Milk and milk products', 'AI生成', 'Processed cheese', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2820', '["梅子","李子","杏子","桃子","plum","cherry","prune","apricot","peach","Prunus (Cherry, Plum)"]', 'Fruits', 'AI生成', 'Prunus (Cherry, Plum)', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2821', '["布甸","奶凍","custard","milk pudding","bread pudding","rice pudding","Christmas pudding","Pudding"]', 'Confectioneries', 'AI生成', 'Pudding', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2822', '["乾豆類","乾豆","穀豆","穀物豆類","legume","dried bean","dried pea","lentil","dry bean","pulse crop","Pulses"]', 'Pulses', 'AI生成', 'Pulses', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2823', '["柚子","西柚","葡萄柚","pomelo","pummelo","pommelo","shaddock","Pummelo"]', 'Fruits', 'AI生成', 'Pummelo', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2824', '["紅耳鰱","紅耳鯝仔","pond perch","common sunfish","punkys","sunny","Pumpkinseed sunfish"]', 'Aquatic foods', 'AI生成', 'Pumpkinseed sunfish', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2825', '["波普莎","pupusa","salvadoran stuffed corn tortilla","Pupusa"]', 'Dishes', 'AI生成', 'Pupusa', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2826', '["紫菜","海苔","purple laver","nori seaweed","red algal genus","Purple laver"]', 'Aquatic foods', 'AI生成', 'Purple laver', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2827', '["紫果","紅毛榴槤","山竹","mangostan","mangosten","mango stone","Purple mangosteen"]', 'Fruits', 'AI生成', 'Purple mangosteen', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2828', '["落蘇","黏花草","粘花草","summer purslane","moss rose","moss-rose purslane","miner's lettuce","winter purslane","pink purslane","sea purslane","Purslane"]', 'Herbs and Spices', 'AI生成', 'Purslane', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2829', '["鴿子般的小鳥","雉雞","野雞","quail bird","japanese quail","bantam chicken","Quail"]', 'Animal foods', 'AI生成', 'Quail', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2830', '["墨西哥薄餅","芝士捲餅","玉米捲餅","Mexican sandwich","tostada folded","cheese turnover","Quesadilla"]', 'Dishes', 'AI生成', 'Quesadilla', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2831', '["薔薇果","洋桃","mace fruit","Japanese quince (for Chaenomeles species, not Cydonia oblonga)","Quince"]', 'Fruits', 'AI生成', 'Quince', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2832', '["奇米","奇雅子","基努瓦","quinoa grain","inca wheat","witua","Quinoa"]', 'Herbs and Spices', 'AI生成', 'Quinoa', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2833', '["兔肉","野兔","家兔","兔子肉","bunny","hare","coney","rabbit meat","Rabbit"]', 'Animal foods', 'AI生成', 'Rabbit', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2834', '["兔眼藍莓","南部黑藍莓","rabbiteye blueberry","smallflower blueberry","southern black blueberry","Rabbiteye blueberry"]', 'Fruits', 'AI生成', 'Rabbiteye blueberry', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2835', '["蘿蔔","紅蘿蔔","白蘿蔔","小紅根","蓮花白","radish","red radish","white radish","oriental radish","daikon (特指日本的大根)","Radish"]', 'Vegetables', 'AI生成', 'Radish', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2836', '["蘿蔔","紅蘿蔔","白蘿蔔","青蘿蔔","圓蘿蔔","小紅蘿蔔","水蘿蔔","大根","蓮霧","radish","red radish","white radish","winter radish","oriental radish","daikon","oilseed radish","Radish (var.)"]', 'Vegetables', 'AI生成', 'Radish (var.)', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2837', '["虹鳁","彩虹鳁","rainbow herring","American smelt","Rainbow smelt"]', 'Aquatic foods', 'AI生成', 'Rainbow smelt', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2838', '["虹彩鱒","虹鱒","steelhead trout","salmon trout","Rainbow trout"]', 'Aquatic foods', 'AI生成', 'Rainbow trout', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2839', '["葡萄乾麵包","提子包","raisin 麵包","raisin loaf","currant bread (誤)","cinnamon raisin bread","Raisin bread"]', 'Cereals and cereal products', 'AI生成', 'Raisin bread', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2840', '["絨毛果","紅毛榴槤","hairy fruit","rambutan berry","Rambutan"]', 'Fruits', 'AI生成', 'Rambutan', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2841', '["芥菜籽","油菜籽","芸苔","rapeseed","canola","oilseed rape","colza","Rape"]', 'Vegetables', 'AI生成', 'Rape', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2842', '["菜籽油","油菜籽油","canola oil","rape oil","Rapeseed oil"]', 'Herbs and Spices', 'AI生成', 'Rapeseed oil', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2843', '["油菜心","抱子芥菜","意大利菠菜","broccoli rabe","broccoli raab","rapone","frarelli","grelos","broom broccoli","Rapini"]', 'Vegetables', 'AI生成', 'Rapini', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2844', '["義大利餃","義式餛飩","意粉餡餅","意大利包","Italian dumplings","Pasta pockets","Meat pillows","Square pasta","Ravioli"]', 'Dishes', 'AI生成', 'Ravioli', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2845', '["紫菜","紅藻","seaweed","marine algae","red seaweed","Red algae"]', 'Aquatic foods', 'AI生成', 'Red algae', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2846', '["紅甜菜","紅蘿蔔","糖菾菜","table beet","garden beet","golden beet","beetroot","blood turnip","Red beetroot"]', 'Vegetables', 'AI生成', 'Red beetroot', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2847', '["紅椒","甜椒","柿子椒","牛角椒","燈籠椒","bell pepper","capsicum","pepper","red pepper","mauvish pepper","Spanish pepper","Red bell pepper"]', 'Vegetables', 'AI生成', 'Red bell pepper', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2848', '["桃紅香檳","粉紅香檳","rosé champagne","pink champagne","Red champagne"]', 'Beverages', 'AI生成', 'Red champagne', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2849', '["紅三葉草","紫花苜蓿","red clover blossom","sweet clover","meadow clover","Red clover"]', 'Herbs and Spices', 'AI生成', 'Red clover', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2850', '["紅葡萄","紫葡萄","red seedless grapes","sultana grape","fl Concord grapes (though these are a different variety and not typically red)","Red grape"]', 'Fruits', 'AI生成', 'Red grape', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2851', '["紅葡萄汁","葡萄酒汁","紫葡萄汁","red grape drink","ruby grape juice","cranberry grape juice (misnomer, avoid)","Red grape juice"]', 'Beverages', 'AI生成', 'Red grape juice', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2852', '["紅越桔","北美越桔","Red Huckleberry","Box Berry","Grouse Berry","Red huckleberry"]', 'Fruits', 'AI生成', 'Red huckleberry', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2853', '["紅帝王蟹","紅蟳","海紅蟹","Alaskan king crab","Russian red crab","Red king crab"]', 'Aquatic foods', 'AI生成', 'Red king crab', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2854', '["紅皮蔥","紫皮蔥","purple onion","blood turnip","Red onion"]', 'Vegetables', 'AI生成', 'Red onion', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2855', '["紅樹莓","山棗子","覆盆子","red raspberry","European raspberry","bramble berry","agrit","Red raspberry"]', 'Fruits', 'AI生成', 'Red raspberry', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2856', '["紅米","brownbeard rice","wild rice","red rice","Red rice"]', 'Cereals and cereal products', 'AI生成', 'Red rice', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2857', '["南非紅茶","羅布št草茶","紅花草茶","Rooibos tea","Red bush tea","Bush tea","Red tea"]', 'Teas', 'AI生成', 'Red tea', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2858', '["紅酒","红酒","red wine","Red wine"]', 'Beverages', 'AI生成', 'Red wine', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2859', '["紅醋栗","山棗","redcurrant","red current","white currant (when referring to the variety that is similar but has white berries)","Redcurrant"]', 'Fruits', 'AI生成', 'Redcurrant', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2860', '["醃菜","漬物","小菜","pickle relish","sweet pickle relish","relish sauce","Relish"]', 'Baking goods', 'AI生成', 'Relish', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2861', '["馬鈴薯蛋黃醬","法式蛋黃醬","瑞慕雷德","tartar sauce","curry mayonnaise","Louisiana remoulade","Remoulade"]', 'Baking goods', 'AI生成', 'Remoulade', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2862', '["大米","白米","糙米","糯米","梗米","香米","胚芽米","white rice","brown rice","sticky rice","jasmine rice","wild rice (注意：這指的不是Oryza sativa, 而是Zizania屬)","Rice"]', 'Cereals and cereal products', 'AI生成', 'Rice', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2863', '["米麺包","大米面包","糙米面包","rice loaf","gluten-free rice bread","Rice bread"]', 'Cereals and cereal products', 'AI生成', 'Rice bread', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2864', '["年糕","餅乾","米糕","糯米糕","飯團","糯飯球","rice pudding","steamed rice cake","compressed rice cake","glutinous rice cake","sweet rice cake","Rice cake"]', 'Dishes', 'AI生成', 'Rice cake', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2865', '["環斑海豹","北极环斑海豹","jar seal","netsik","nattiq","Ringed seal"]', 'Aquatic foods', 'AI生成', 'Ringed seal', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2866', '[" robusta咖啡","強健咖啡","robusta coffee","cannephora coffee","Robusta coffee"]', 'Coffee and coffee products', 'AI生成', 'Robusta coffee', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2867', '["雷鳥","石雞","ptarmigan","snow chicken","Rock ptarmigan"]', 'Animal foods', 'AI生成', 'Rock ptarmigan', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2868', '["火箭生菜","意大利火箭","rocket","roquette","rucola","rugula","colewort","arugula","Rocket salad"]', 'Vegetables', 'AI生成', 'Rocket salad', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2869', '["火箭菜","馬鈴薯苗","salad rocket","roquette","rucola","rugula","colewort","arugula","Rocket salad (ssp.)"]', 'Vegetables', 'AI生成', 'Rocket salad (ssp.)', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2870', '["魚子","蝦籽","貝粒","海膽卵","fish eggs","caviar","ikura","tobiko","Roe"]', 'Aquatic foods', 'AI生成', 'Roe', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2871', '["羅馬萵苣","長葉萵苣","cos lettuce","cos","loosehead lettuce","Romaine lettuce"]', 'Vegetables', 'AI生成', 'Romaine lettuce', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2872', '["洋薑","香英草","小洋薊","chamomile","Roman chamomile","English chamomile","garden chamomile","ground apple","low chamomile","whig plant","Roman camomile"]', 'Herbs and Spices', 'AI生成', 'Roman camomile', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2873', '["土豆","洋芋","馬鈴薯","番藷","薯仔","地瓜","紅薯","白薯","山藥","芋頭","potato","spud","tater","murphy","turnip","rutabaga","radish","beet","carrot","parsnip","sweet potato","yam","Root vegetables"]', 'Vegetables', 'AI生成', 'Root vegetables', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2874', '["玫瑰果","山棗子","rose haw","rose hep","Rose hip"]', 'Herbs and Spices', 'AI生成', 'Rose hip', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2875', '["粉紅酒","桃紅葡萄酒","rose wine","pink wine","Rosé wine"]', 'Beverages', 'AI生成', 'Rosé wine', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2876', '["洛神花","落神花","羅勒葉","Rosella","Red sorrel","Florida cranberry","Hibiscus tea","Roselle"]', 'Herbs and Spices', 'AI生成', 'Roselle', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2877', '["羅勒葉","海露草","anthos","dew of the sea","Rosemary"]', 'Herbs and Spices', 'AI生成', 'Rosemary', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2878', '["果踢球","keluak","kepayang","football fruit","Rowal"]', 'Herbs and Spices', 'AI生成', 'Rowal', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2879', '["山楊梅","錦繡杜梨","mountain-ash","quickbeam","wayfare tree","Rowanberry"]', 'Fruits', 'AI生成', 'Rowanberry', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2880', '["黑莓","紅莓","覆盆子","山莓","荳荳果","blackberry","raspberry","bramble fruit","cane fruit","cling berry","Rubus (Blackberry, Raspberry)"]', 'Fruits', 'AI生成', 'Rubus (Blackberry, Raspberry)', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2881', '["蘭姆酒","朗姆酒","rum","ron","old rum","aged rum","Rum"]', 'Beverages', 'AI生成', 'Rum', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2882', '["黑麥","rye","German rye","winter rye","Rye"]', 'Cereals and cereal products', 'AI生成', 'Rye', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2883', '["黑麥面包","黑麥麵包","rye loaf","dark rye","pumpernickel","ruggens","Rye bread"]', 'Cereals and cereal products', 'AI生成', 'Rye bread', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2884', '["黑鱈","珍珠海鱈","歐洲黑鱈","sable","black cod","blue cod","bluefish","candlefish","coal cod","coalfish","beshow","skil(fish)","Sablefish"]', 'Aquatic foods', 'AI生成', 'Sablefish', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2885', '["荷花","蓮花","水芙蓉","菡萏","Indian lotus","Bean of India","Water lily (misnomer)","Sacred lotus"]', 'Vegetables', 'AI生成', 'Sacred lotus', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2886', '["紅花","絲瓜紅","Carthamus","American saffron","false saffron","Safflower"]', 'Herbs and Spices', 'AI生成', 'Safflower', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2887', '["藏紅花","絲雨","番紅花","crocus","autumn crocus","yellow gold","Saffron"]', 'Herbs and Spices', 'AI生成', 'Saffron', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2888', '["西米","sago","sago palm pith","Sago palm"]', 'Herbs and Spices', 'AI生成', 'Sago palm', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2889', '["清酒","日本酒","nihonshu","rice wine","Sake"]', 'Beverages', 'AI生成', 'Sake', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2890', '["沙律","生菜沙拉","salad","greens","Salad"]', 'Dishes', 'AI生成', 'Salad', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2891', '["沙拉醬","色拉醬","西餐調味汁","salad sauce","vinaigrette","dressing","Salad dressing"]', 'Baking goods', 'AI生成', 'Salad dressing', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2892', '["紅覆盆子","太平洋海岸草莓","Pacific Coast Raspberry","Wild Salmonberry","Salmonberry"]', 'Fruits', 'AI生成', 'Salmonberry', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2893', '["三文魚","大馬哈魚","鱒魚","虹彩鱒","紅鱒","salmon","trout","atlantic salmon","chinook salmon","coho salmon","pink salmon","sockeye salmon","brook trout","rainbow trout","Salmonidae (Salmon, Trout)"]', 'Aquatic foods', 'AI生成', 'Salmonidae (Salmon, Trout)', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2894', '["鹹黃油","鹽巴奶油","咸奶油","salted cream","preserved butter","Salted butter"]', 'Milk and milk products', 'AI生成', 'Salted butter', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2895', '[".sapodilla","番荔枝果","乳梨"," сахар加果","sugar pear","naseberry","chiku","chaucha","Sapodilla"]', 'Fruits', 'AI生成', 'Sapodilla', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2896', '["沙士果","山櫻桃","Pacific serviceberry","western serviceberry","aldershade","clove-berry","pigeon berry","June berry","Saskatoon berry"]', 'Fruits', 'AI生成', 'Saskatoon berry', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2897', '["調料","汁醬","sauce","condiment","Sauce"]', 'Baking goods', 'AI生成', 'Sauce', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2898', '["捲心菜","皺葉甘藍","捲心捲葉甘藍","Savoy cabbage","January King Cabbage","Fernleaf Savoy"]', 'Vegetables', 'AI生成', 'Savoy cabbage', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2899', '["扇貝","海扇貝","sea scallop","king scallop","diving scallop","calico scallop","Scallop"]', 'Aquatic foods', 'AI生成', 'Scallop', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2900', '["紅花豆","天纜豆","runner bean","scarlet runner bean","multiflora bean","oregon lima bean","Scarlet bean"]', 'Pulses', 'AI生成', 'Scarlet bean', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2901', '["馬鈴魚","吞拿魚","金槍魚","三文魚","鯖魚","tuna","mackerel","bonito","albacore","skipjack","Scombridae (Bonito, Mackerel, Tuna)"]', 'Aquatic foods', 'AI生成', 'Scombridae (Bonito, Mackerel, Tuna)', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2902', '["篷 haus","碎肉餡餅","pon haus","panhous","Scrapple"]', 'Dishes', 'AI生成', 'Scrapple', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2903', '["鳁鲸","鳁鱼","银扁鱼","铜盆仔","porgy","sea bream","scup panfish","Scup"]', 'Aquatic foods', 'AI生成', 'Scup', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2904', '["海參","海鼠","寶貝","trepang","bêche-de-mer","balate","Sea cucumber"]', 'Aquatic foods', 'AI生成', 'Sea cucumber', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2905', '["海鱘","海水褐鯡","sewen","peel","peal","mort","finnock","white trout","salmon trout","coho salmon","brook trout","Arctic char","cutthroat trout","Dolly Varden","Northern pikeminnow","weakfish","Sea trout"]', 'Aquatic foods', 'AI生成', 'Sea trout', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2906', '["沙棘果","沙棗子","sea-berry","sallowthorn berry","Sea-buckthornberry"]', 'Fruits', 'AI生成', 'Sea-buckthornberry', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2907', '["粗麥粉","硬麥粒","durum wheat grits","cracked durum","macaroni meal","Semolina"]', 'Cereals and cereal products', 'AI生成', 'Semolina', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2908', '["飛刀花","黃豆花","tropical jointvetch flower","thorn sesbania flower","jointed sesame","Sesbania flower"]', 'Vegetables', 'AI生成', 'Sesbania flower', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2909', '["小蔥","五香頂蘗","山姜","scallion shallot","multiplier onion","green onion shallot","Shallot"]', 'Vegetables', 'AI生成', 'Shallot', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2910', '["鯊魚","鯊","shark","bull shark","hammerhead","tiger shark","white shark","mako shark","blue shark","Shark"]', 'Aquatic foods', 'AI生成', 'Shark', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2911', '["夏伊果","夏夷果","山 Shea 树果实","shea fruit","karite pomme","ngu","koku","nku","nsaa","sahaleni","Shea tree"]', 'Herbs and Spices', 'AI生成', 'Shea tree', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2912', '["白鱒","北极白鱼","omer fish","omer whitefish","caspian white salmon","Sheefish"]', 'Aquatic foods', 'AI生成', 'Sheefish', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2913', '["羊","羊肉","羊羮","山羊肉","綿羊肉","羔羊肉","洋肉","羊寶貝","mutton","lamb","sheep meat","hogget","hagemus","french letter","sweat","flitch of bacon","Sheep (Mutton, Lamb)"]', 'Animal foods', 'AI生成', 'Sheep (Mutton, Lamb)', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2914', '["羊頭魚","斑馬鯛","Convict fish","Pighead","Bullhead","Clown wrasse","Sheepshead"]', 'Aquatic foods', 'AI生成', 'Sheepshead', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2915', '["雪利酒","Jerez","Fino Sherry","Manzanilla","Amontillado","Oloroso","Pedro Ximenez","PX Sherry","Moscatel Sherry","Sherry"]', 'Beverages', 'AI生成', 'Sherry', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2916', '["冬菇","黑木耳","香菇","shitake mushroom","forest mushroom","Chinese black fungus","Shiitake"]', 'Vegetables', 'AI生成', 'Shiitake', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2917', '["起酥油","植物黃油","vegetable shortening","Crisco","solid vegetable fat","Shortening"]', 'Fats and oils', 'AI生成', 'Shortening', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2918', '["白花椴樹","silver lime","buckthorn tree","Silver linden"]', 'Herbs and Spices', 'AI生成', 'Silver linden', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2919', '["月鰭金槍魚","青干魚","青甘魚","aku","arctic bonito","mushmouth","oceanic bonito","striped tuna","victor fish","Skipjack tuna"]', 'Aquatic foods', 'AI生成', 'Skipjack tuna', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2920', '["臭莓果","臭醋栗","stinking gooseberry","scented gooseberry","Skunk currant"]', 'Fruits', 'AI生成', 'Skunk currant', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2921', '["小葉椴樹","歐洲椴","Small-leaved Lime","Little-leaf Linden","Small-leaf linden"]', 'Herbs and Spices', 'AI生成', 'Small-leaf linden', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2922', '["鳁鱼","鳁鳁","gut piper","spiral gut","pea fish","fat smelt","Smelt"]', 'Aquatic foods', 'AI生成', 'Smelt', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2923', '["能量棒","運動棒","健身條","快速充電棒","energy bar","protein bar","fitness bar","nutrition bar","Snack bar"]', 'Snack foods', 'AI生成', 'Snack bar', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2924', '["螺","螽蟻","蝸牛","land snail","sea snail","freshwater snail","slug","semislug","Snail"]', 'Aquatic foods', 'AI生成', 'Snail', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2925', '["海鯻魚","鯷魚","紅鯹","雞蛋魚","red snapper","white snapper","yellowtail snapper","mangrove snapper","Snapper"]', 'Aquatic foods', 'AI生成', 'Snapper', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2926', '["雪花蟹","雪蟹","皇后蟹","蜘蛛蟹","queen crab","spider crab","opilio crab","Snow crab"]', 'Aquatic foods', 'AI生成', 'Snow crab', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2927', '["大紅鱒","藍背三文魚","red salmon","blueback salmon","Sockeye salmon"]', 'Aquatic foods', 'AI生成', 'Sockeye salmon', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2928', '["汽水","可樂","雪碧","七喜","礦泉水（非純淨水）","果粒橙","芬達","百事可樂","健怡可樂","檸檬茶","烏梅汁","菊花晶","soda","pop","coke","fizzy drink","carbonated beverage","tonic","sparkling water","soda pop","soft drink","cola","sprite","mountain dew","Soft drink"]', 'Beverages', 'AI生成', 'Soft drink', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2929', '["軟脖蒜","普通大蒜","softneck garlic","artichoke garlic","silverskin garlic","creole garlic","Soft-necked garlic"]', 'Herbs and Spices', 'AI生成', 'Soft-necked garlic', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2930', '["高粱","酒麴","飼料草","milo","great millet","guinea corn","feterita","Sorghum"]', 'Cereals and cereal products', 'AI生成', 'Sorghum', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2931', '["酸模菜","酢漿草","spinach dock","narrow-leaved dock","Sorrel"]', 'Herbs and Spices', 'AI生成', 'Sorrel', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2932', '["湯","羹","broth","liquid meal","Soup"]', 'Dishes', 'AI生成', 'Soup', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2933', '["酸櫻桃","山櫻桃","tart cherry","pie cherry","sour pie cherry","wild cherry","Sour cherry"]', 'Fruits', 'AI生成', 'Sour cherry', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2934', '["酸奶油","發酵鮮奶油","soured cream","cultured sour cream","creme aigre","Sour cream"]', 'Milk and milk products', 'AI生成', 'Sour cream', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2935', '["酸橙","苦橙","西柚","bitter orange","Seville orange","bigarade orange","marmalade orange","Sour orange"]', 'Fruits', 'AI生成', 'Sour orange', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2936', '["酸葉菜","阿留申薊","Arctic Dock","Acid Dock","Sourdock"]', 'Herbs and Spices', 'AI生成', 'Sourdock', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2937', '["發酵面团","酸面团","sour dough","natural yeast bread","leavened bread","Sourdough"]', 'Cereals and cereal products', 'AI生成', 'Sourdough', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2938', '["鬼蕉","巴西番荔枝","山抛壳","evo","aluguntugui","guanábana","graviola","anona","corossol","sorsaka","adunu","Brazilian pawpaw","guyabano","guanavana","toge-banreisi","durian benggala","nangka blanda","sirsak","zoorzak","nangka londa","Soursop"]', 'Fruits', 'AI生成', 'Soursop', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2939', '["黃豆","大豆","soya bean","Soy bean"]', 'Soy', 'AI生成', 'Soy bean', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2940', '["豆乳霜","豆腐霜","黃豆霜","bean cream","soy custard","tofutti cream","Soy cream"]', 'Soy', 'AI生成', 'Soy cream', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2941', '["豆奶酸奶","素酸奶","soya yogurt","soygurt","yofu","Soy yogurt"]', 'Soy', 'AI生成', 'Soy yogurt', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2942', '["馬嘉烈魚","西班牙鯡鱼","見手縞","Spanish mackerel","serra mackerel","cero","kingfish"]', 'Aquatic foods', 'AI生成', 'Spanish mackerel', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2943', '["光輝果","星光果","Farkleberry","Vaccinium arboreum","Sparkleberry"]', 'Fruits', 'AI生成', 'Sparkleberry', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2944', '["薄荷","綠薄荷","劍形薄荷","garden mint","common mint","Spearmint"]', 'Herbs and Spices', 'AI生成', 'Spearmint', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2945', '["黑麥","裸燕麥","dinkel wheat","hulled wheat","Spelt"]', 'Cereals and cereal products', 'AI生成', 'Spelt', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2946', '["菠菜","青江菜","spanish","spinny","spunage","green spinach","Spinach"]', 'Vegetables', 'AI生成', 'Spinach', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2947', '["泥鰍","狗魚","spurdog","mud shark","piked dogfish","Spiny dogfish"]', 'Aquatic foods', 'AI生成', 'Spiny dogfish', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2948', '["岩龍蝦","海龍蝦","刺蝦",-1," crawfish","langouste","rock lobster","crayfish","sea crayfish","spiny lobster","Spiny lobster"]', 'Aquatic foods', 'AI生成', 'Spiny lobster', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2949', '["靈氣","氣","spirit","hooch","spirits","booze","liquid courage","Spirit"]', 'Beverages', 'AI生成', 'Spirit', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2950', '["螺旋藻","小球藻","blue-green algae","algae supplement","Spirulina"]', 'Aquatic foods', 'AI生成', 'Spirulina', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2951', '["鯙魚","鯙鳁鱼","spot","speckled trout","moss back","Spot croaker"]', 'Aquatic foods', 'AI生成', 'Spot croaker', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2952', '[" larga斑海豹","大拉格海豹","larga seal","Phoca largha","Spotted seal"]', 'Aquatic foods', 'AI生成', 'Spotted seal', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2953', '["抹醬","塗抹料","麵包餡","spread","butter spread","jam","preserve","creme","Spread"]', 'Baking goods', 'AI生成', 'Spread', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2954', '["乳 pige","幼 pigeon","乳 pigeon","young pigeon","pigeon squab","domesticated pigeon meat","Squab"]', 'Animal foods', 'AI生成', 'Squab', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2955', '["蔓越莓藤果","北高櫻桃","mooseberry","pembina","pimbina","highbush cranberry","lowbush cranberry","moosomin","Squashberry"]', 'Fruits', 'AI生成', 'Squashberry', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2956', '["八角","大料","Chinese star anise","Japanese star anise (for Illicium religiosum)","Star anise"]', 'Herbs and Spices', 'AI生成', 'Star anise', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2957', '["五角檸檬","五角瓜","星梨果","香花果","carambola","five-corner fruit","Star fruit"]', 'Fruits', 'AI生成', 'Star fruit', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2958', '["steller海獅","北方海獅","northern sea lion","steller's sea lion","Steller sea lion"]', 'Aquatic foods', 'AI生成', 'Steller sea lion', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2959', '["燉菜","燉品","鍋物料理","pot roast","braised meat","casserole","Stew"]', 'Dishes', 'AI生成', 'Stew', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2960', '["草莓番石榴","小紅果","strawberry guava","Cattley guava","Peruvian guava","waiaw?","red-fruited cherry guava","yellow-fruited cherry guava","Strawberry guava"]', 'Fruits', 'AI生成', 'Strawberry guava', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2961', '["帶魚","帶䲠","Atlantic striped bass","striper","linesider","rockfish","pimpfish","Striped bass"]', 'Aquatic foods', 'AI生成', 'Striped bass', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2962', '["青江魚","鯸魚","鱂魚","灰鲻魚","黑鱂","black mullet","bully mullet","callifaver mullet","common grey mullet","flathead grey mullet","hardgut mullet","mangrove mullet","sea mullet","Striped mullet"]', 'Aquatic foods', 'AI生成', 'Striped mullet', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2963', '["填料","填充物","dressing","filling","Stuffing"]', 'Baking goods', 'AI生成', 'Stuffing', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2964', '["鱘魚","鲟鱼","sterlet","kaluga","beluga","true sturgeon","Sturgeon"]', 'Aquatic foods', 'AI生成', 'Sturgeon', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2965', '["秋葵沙司","玉米豆仁湯","corn and beans","Three Sisters stew","Northern garden bean dish","Succotash"]', 'Dishes', 'AI生成', 'Succotash', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2966', '["番荔枝","釋迦","sugar apple","custard apple","sweetsop","atemoya","Sugar apple"]', 'Fruits', 'AI生成', 'Sugar apple', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2967', '["甜味劑","糖替代品","人工甜味素","sweetener","artificial sweetener","high-intensity sweetener","Sugar substitute"]', 'Baking goods', 'AI生成', 'Sugar substitute', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2968', '["夏葡萄","夏季葡萄","Summer Grape","American Summer Grape","Summer grape"]', 'Fruits', 'AI生成', 'Summer grape', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2969', '["夏胡蘿蔔","夏季百里香","summer savoury","garden savory","Summer savory"]', 'Herbs and Spices', 'AI生成', 'Summer savory', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2970', '["太陽花南瓜","飛碟小瓜","小圓瓜","琺瑯南瓜","scalloped squash","custard marrow","cibleme","white squash","scallopini","granny squash","pâtisson","Sunburst squash (pattypan squash)"]', 'Gourds', 'AI生成', 'Sunburst squash (pattypan squash)', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2971', '["向日葵","sunflower","girasol (Spanish)","tournesol (French)","Sunflower"]', 'Herbs and Spices', 'AI生成', 'Sunflower', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2972', '["向日葵油","太陽花籽油","sunflower seed oil","Sunflower oil"]', 'Herbs and Spices', 'AI生成', 'Sunflower oil', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2973', '["通心菜","空心菜","水蕹菜","水莧菜","water spinach","river spinach","water morning glory","water convolvulus","swamp cabbage","Chinese spinach","kangkong","phak bung (泰)","rau mu?ng (越)","trokuon (柬)","kalmi shak (孟)","hayoyo (迦)","Swamp cabbage"]', 'Vegetables', 'AI生成', 'Swamp cabbage', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2974', '["大頭菜","蘿蔔白菜","洋白菜","瑞典蘿蔔","rutabaga","yellow turnip","neep","Swede"]', 'Vegetables', 'AI生成', 'Swede', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2975', '["九層塔","羅勒","香草","basil","sweet basil","Thai basil","Italian basil","Sweet basil"]', 'Herbs and Spices', 'AI生成', 'Sweet basil', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2976', '["羅勒葉","月桂葉","bay laurel","true laurel","Grecian laurel","laurel tree","sweet bay leaf","Italian bay leaf","Pennyroyal (incorrect, but sometimes mistaken)","Sweet bay"]', 'Herbs and Spices', 'AI生成', 'Sweet bay', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2977', '["櫻桃","西洋櫻桃","wild cherry","bird cherry","gean","Sweet cherry"]', 'Fruits', 'AI生成', 'Sweet cherry', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2978', '["蛋奶糊","奶油布丁","crème anglaise","pastry cream","creme patissiere","Sweet custard"]', 'Confectioneries', 'AI生成', 'Sweet custard', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2979', '["洋義草","馬約蘭","sweet marjoram","knotted marjoram","oregano (in some Middle-Eastern countries)","Sweet marjoram"]', 'Herbs and Spices', 'AI生成', 'Sweet marjoram', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2980', '["橙子","柑橘","中國桔","金柑","orange","mandarin orange","tangerine (注意：這種叫法更常見於某些特定的柑橘類，請區分)","Chinese orange","Sweet orange"]', 'Fruits', 'AI生成', 'Sweet orange', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2981', '["紅薯","地瓜","甘藷","山芋","蕃薯","yam","spud","tater","candy yam","Sweet potato"]', 'Vegetables', 'AI生成', 'Sweet potato', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2982', '["山越橘","野山楂","mountain cranberry","rowan berry","Sweet rowanberry"]', 'Fruits', 'AI生成', 'Sweet rowanberry', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2983', '["甜菜莖","甜菜心","葉甜菜","silver beet","perpetual spinach","spinach beet","Swiss chard"]', 'Vegetables', 'AI生成', 'Swiss chard', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2984', '["瑞士奶酪","瑞士乳酪","眼兒芝士","Swiss Emmental","Emmentaler cheese","American Swiss","Medium-hard Swiss cheese","Swiss cheese"]', 'Milk and milk products', 'AI生成', 'Swiss cheese', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2985', '["劍魚","寶劍魚","broadbill","swordy","Swordfish"]', 'Aquatic foods', 'AI生成', 'Swordfish', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2986', '["糖漿","糖汁","蜜漿","sugar syrup","simple syrup","maple syrup","corn syrup","flavoured syrup","Syrup"]', 'Baking goods', 'AI生成', 'Syrup', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2987', '["塔可","taco","Taco"]', 'Dishes', 'AI生成', 'Taco', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2988', '["硬殼塔可","脆皮塔可","hard shell taco","crispy taco","Taco shell"]', '未分類', 'AI生成', 'Taco shell', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2989', '["牛油","羊油","lard","beef tallow","mutton tallow","rendered beef fat","rendered mutton fat","Tallow"]', 'Fats and oils', 'AI生成', 'Tallow', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2990', '["塔瑪爾","tamale","mole tamal","Tamale"]', 'Dishes', 'AI生成', 'Tamale', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2991', '["酸角","黃皮果","tamarind pod","Indian date","Assam","Tamarind"]', 'Fruits', 'AI生成', 'Tamarind', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2992', '["木薯粉圓","地瓜珍珠","西米","沙葛粒","tapioca ball","pearl tapioca","boba","pudding starch","Tapioca pearl"]', 'Baking goods', 'AI生成', 'Tapioca pearl', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2993', '["芋頭","大芋頭","白芋頭","香芋","紅薯頭","potato (misnomer)","coco","dasheen","provision","Taro"]', 'Vegetables', 'AI生成', 'Taro', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2994', '["龍蒿","蛇草","小胡蘿蔔","French tarragon","Russian tarragon","wild tarragon","Tarragon"]', 'Herbs and Spices', 'AI生成', 'Tarragon', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2995', '["野荞麦","鞑靼荞麦","印度荞麦","duckwheat","India buckwheat","green buckwheat","bitter buckwheat","India wheat","Tartary buckwheat"]', 'Cereals and cereal products', 'AI生成', 'Tartary buckwheat', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2996', '["茶","tea","Tea"]', 'Teas', 'AI生成', 'Tea', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2997', '["茶葉柳","美麗柳","diamondleaf willow","thin red willow","Tea leaf willow"]', 'Herbs and Spices', 'AI生成', 'Tea leaf willow', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2998', '["鐵夫草","威廉愛情草","Williams lovegrass","annual bunch grass","Teff"]', 'Herbs and Spices', 'AI生成', 'Teff', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_2999', '["刺蓬","山蘿蔔","scotch thistle","blessed thistle","milk thistle","Thistle"]', 'Vegetables', 'AI生成', 'Thistle', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_3000', '["無刺黑莓","楓名黑莓","thornless blackberry","elmleaf blackberry","Thornless blackberry"]', 'Fruits', 'AI生成', 'Thornless blackberry', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_3001', '["吞拿魚","金槍鱼","鯖科鱼类","tuna","bluefin tuna","albacore","yellowfin tuna","Thunnus"]', 'Aquatic foods', 'AI生成', 'Thunnus', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_3002', '["金線魚","黃金鯡","golden tilefish","blueline tilefish","ocean perch (note: this is often used as a substitute, but not the same species)","Tilefish"]', 'Aquatic foods', 'AI生成', 'Tilefish', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_3003', '["印度小冬瓜","印度圓瓜","金瓜","Indian round gourd","Apple gourd","Indian Baby Pumpkin","Tendli","Kundru","Tinda"]', 'Gourds', 'AI生成', 'Tinda', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_3004', '["糖蜜","焦糖軟糖","奶油太妃糖","堅果太妃糖","榛子太妃","杏仁太妃","toffy","caramel candy","hard candy","brittle toffee","crystallized sugar candy","English toffee","honeycomb toffee","Crunchie","Violet Crumble","hokey pokey","taffy apple","Toffee"]', 'Confectioneries', 'AI生成', 'Toffee', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_3005', '["薯條","炸土豆","french fries","chips","hot chips","Topping"]', 'Baking goods', 'AI生成', 'Topping', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_3006', '["玉米餅","墨西哥薄餅","potato omelette","Spanish omelette","omelette espagnole","Tortilla"]', 'Cereals and cereal products', 'AI生成', 'Tortilla', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_3007', '["玉米脆片","玉米薯片","墨西哥脆片","corn chip","tortilla crisp","Mexican chip","Tortilla chip"]', 'Snack foods', 'AI生成', 'Tortilla chip', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_3008', '["托斯塔達","toasted dish","tostada","Tostada"]', 'Dishes', 'AI生成', 'Tostada', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_3009', '["托斯塔達殼","tostada shell","corn tortilla base with toppings","Tostada shell"]', '未分類', 'AI生成', 'Tostada shell', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_3010', '["絲瓜","菜瓜","loofah","Chinese okra","Towel gourd"]', 'Gourds', 'AI生成', 'Towel gourd', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_3011', '["能量果仁","戶外小食","乾果混合包","山友糧","攀岩零食","乾果能量棒","trail snack","hiker mix","camping food","outdoor munchies","nut and fruit mix","granola trail mix","Trail mix"]', 'Snack foods', 'AI生成', 'Trail mix', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_3012', '["樹蕨","鐵刀木","tree ferns","woodwardia","cibotium","Tree fern"]', 'Vegetables', 'AI生成', 'Tree fern', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_3013', '["小黑麥","特利凱爾","triticale","hulless triticale","Triticale"]', 'Cereals and cereal products', 'AI生成', 'Triticale', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_3014', '["葡萄牙大白菜","葡萄牙甘藍菜","Portuguese cabbage","Kale collard","Chard kale","Tronchuda cabbage"]', 'Vegetables', 'AI生成', 'Tronchuda cabbage', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_3015', '["熱帶高地黑莓","高山黑莓","tropical highland blackberry","adenotrichos berry","Tropical highland blackberry"]', 'Fruits', 'AI生成', 'Tropical highland blackberry', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_3016', '["田雞","青蛙肉","bullfrog","river frog","common frog","True frog"]', 'Aquatic foods', 'AI生成', 'True frog', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_3017', '["海虹","牡蠔","oyster","mussel (误称)","rock oyster","Pacific oyster","Japanese oyster","True oyster"]', 'Aquatic foods', 'AI生成', 'True oyster', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_3018', '["耳後無孔海獅","true seal","crawling seal","earless seal","True seal"]', 'Aquatic foods', 'AI生成', 'True seal', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_3019', '["大利","扁魚","turbotlet","flounder","soles","True sole"]', 'Aquatic foods', 'AI生成', 'True sole', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_3020', '["海鞘","水海綿","海葯","sea squirt","tunicate","ascidian","sea pork","Tunicate"]', 'Aquatic foods', 'AI生成', 'Tunicate', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_3021', '["扁魚","鯡扁魚","turbot flounder","burrfish","Turbot"]', 'Aquatic foods', 'AI生成', 'Turbot', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_3022', '["黃薑","姜黄","curcumin","Indian saffron","yellow ginger root","turmeric root","Turmeric"]', 'Herbs and Spices', 'AI生成', 'Turmeric', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_3023', '["蘿蔔","大頭菜","洋白蘿蔔","neep","turnip-rooted rape","field mustard","Turnip"]', 'Herbs and Spices', 'AI生成', 'Turnip', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_3024', '["烏庫胡巴","ucuhuba","seed oil from ucuhuba tree","Ucuhuba"]', 'Herbs and Spices', 'AI生成', 'Ucuhuba', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_3025', '["未分類食物或飲料","unclassified food or beverage","Unclassified food or beverage"]', 'Unclassified', 'AI生成', 'Unclassified food or beverage', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_3026', '["蔓越莓","藍莓","越橘","都蘿莓","blueberry","cranberry","huckleberry","lingonberry","bilberry","whortleberry","Vaccinium (Blueberry, Cranberry, Huckleberry)"]', 'Fruits', 'AI生成', 'Vaccinium (Blueberry, Cranberry, Huckleberry)', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_3027', '["香草","香莢蘭","vanilla bean","Madagascar vanilla","Vanilla"]', 'Herbs and Spices', 'AI生成', 'Vanilla', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_3028', '["蔬菜汁","菜汁","植物飲料","vegetable juice","veggie juice","green juice","Vegetable juice"]', 'Beverages', 'AI生成', 'Vegetable juice', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_3029', '["素食","純素食品","植物性飲食","豆製品料理","plant-based food","veggie food","meat-free dishes","vegan cuisine","Vegetarian food"]', 'Dishes', 'AI生成', 'Vegetarian food', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_3030', '["素食漢堡","蔬菜漢堡","素肉漢堡","植物肉漢堡","vegetarian burger","vegan burger","meatless burger","tofurky","Veggie burger"]', 'Dishes', 'AI生成', 'Veggie burger', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_3031', '["絲光鴨","絲光海番 duck（注意：這裡使用了duck保持與英文對應）","Velvet Scoter","Whitewing (not to be confused with the white-winged scoter)","Velvet duck"]', 'Animal foods', 'AI生成', 'Velvet duck', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_3032', '["味美思","味多士","vermouth wine","aromatized wine","Vermouth"]', 'Beverages', 'AI生成', 'Vermouth', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_3033', '["伏特加","俄國酒","vodka","hooch","popov","Vodka"]', 'Beverages', 'AI生成', 'Vodka', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_3034', '["華夫餅","鬆餅","格仔餅","Belgian waffle","American waffle","gridcake","wafer cake","Waffle"]', 'Dishes', 'AI生成', 'Waffle', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_3035', '["鹿尾菜","海蘿","sea mustard","emono","Wakame"]', 'Aquatic foods', 'AI生成', 'Wakame', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_3036', '["walleye（英）","黃鰱","pickerel","yellow pickerel","yellow pike","colored pike","dory","wall-eye","Walleye"]', 'Aquatic foods', 'AI生成', 'Walleye', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_3037', '["胡桃","檨子","核桃","walnut","Persian walnut","English walnut","black walnut","butternut","Walnut"]', 'Nuts', 'AI生成', 'Walnut', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_3038', '["海象","morse","sea elephant","Walrus"]', 'Aquatic foods', 'AI生成', 'Walrus', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_3039', '["三姓李","三及第","wampi","Chinese bayberry grape","Lansium","Galdon fruit","Wampee"]', 'Fruits', 'AI生成', 'Wampee', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_3040', '["山葵","日本山葵","Japanese horseradish","Wasabi root","Wasabi"]', 'Herbs and Spices', 'AI生成', 'Wasabi', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_3041', '["水","白開水","water","H2O","Water"]', 'Beverages', 'AI生成', 'Water', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_3042', '["通心菜","空心菜","水流菜","節節菜","水莧","water morning glory","swamp cabbage","Chinese spinach","Chinese watercress","kangkong","Water spinach"]', 'Vegetables', 'AI生成', 'Water spinach', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_3043', '["水田菜","蕪菁菜","cresses","yellowcress","Watercress"]', 'Herbs and Spices', 'AI生成', 'Watercress', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_3044', '["水蒲桃","蓮霧","雲蘋果","山蘋果","jambu air","champoo","lembu","lian-woo","love apple","java apple","royal apple","bell fruit","Jamaican apple","water apple","wax jambu","rose apple","makopa","Wax apple"]', 'Fruits', 'AI生成', 'Wax apple', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_3045', '["白瓜","冬瓜","雪菜瓜","冬蔘果","佛手瓜","水瓜","white gourd","winter gourd","tallow gourd","Chinese preserving melon","ash gourd","Wax gourd"]', 'Gourds', 'AI生成', 'Wax gourd', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_3046', '["小蔥","青蔥","蔥苗","蠶豆苗","春蔥","green onion","spring onion","scallion","salad onion","bunching onion","Japanese bunching onion","Welsh onion"]', 'Herbs and Spices', 'AI生成', 'Welsh onion', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_3047', '["麥子","大麥","wheat berry","red wheat","white wheat","Wheat"]', 'Cereals and cereal products', 'AI生成', 'Wheat', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_3048', '["全麥面包","黑麥面包","粗糧面包","全麥土司","谷物面包","whole wheat bread","brown bread","rye bread","wheatgerm bread","grainy bread","Wheat bread"]', 'Cereals and cereal products', 'AI生成', 'Wheat bread', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_3049', '["海螺","鳱鴆","大鳱","whelk","conch","mermaid's toenail","Whelk"]', 'Aquatic foods', 'AI生成', 'Whelk', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_3050', '["乳清","奶清","whey","milk serum","cheese whey","sweet whey","acid whey","sour whey","Whey"]', 'Milk and milk products', 'AI生成', 'Whey', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_3051', '["威士忌","芝華士","尊尼走路","whisky","whiskey","scotch","bourbon","Whisky"]', 'Beverages', 'AI生成', 'Whisky', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_3052', '["白吐司","白面包","牛奶包","plain bread","sandwich loaf","wonder bread","White bread"]', 'Cereals and cereal products', 'AI生成', 'White bread', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_3053', '["白菜","洋白菜","包心菜","結球甘藍","cabbage","white cabbage","wombok","bok choy (誤, 錯誤的稱呼，實際上是另一種蔬菜)","White cabbage"]', 'Vegetables', 'AI生成', 'White cabbage', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_3054', '["白香檳","白酒 champagne","white bubbly","blanc de blancs","sparkling white wine","White champagne"]', 'Beverages', 'AI生成', 'White champagne', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_3055', '["綠葡萄汁","尼加拉葡萄汁","white grape drink","green grape juice","niagara grape juice","White grape juice"]', 'Beverages', 'AI生成', 'White grape juice', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_3056', '["白羽扇豆","white lupin","lupine white","white flowered lupin","White lupine"]', 'Pulses', 'AI生成', 'White lupine', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_3057', '["白桑葚","白桑果","甜桑莓","white berry mulberry","white fruit mulberry","morus alba variegata","White mulberry"]', 'Herbs and Spices', 'AI生成', 'White mulberry', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_3058', '["白芥子","大芥子","Brassica alba","B. hirta","White mustard"]', 'Herbs and Spices', 'AI生成', 'White mustard', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_3059', '["白蔥","白蔥頭","甜蔥","sweet onion","white sweet onion","White onion"]', 'Vegetables', 'AI生成', 'White onion', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_3060', '["白鰭吸魚","溪鯡","bay fish","brook sucker","common sucker","mullet","White sucker"]', 'Aquatic foods', 'AI生成', 'White sucker', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_3061', '["白葡萄酒","白酒","white juice","blanc","dry white wine","off-dry white wine","sweet white wine","White wine"]', 'Beverages', 'AI生成', 'White wine', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_3062', '["白魚","銀魚","whitefish","cisco","coregonid","Whitefish"]', 'Aquatic foods', 'AI生成', 'Whitefish', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_3063', '["小黃魚","白花鰽","hake","silver cod","rock cod","Whiting"]', 'Aquatic foods', 'AI生成', 'Whiting', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_3064', '["全麥麵包","粗糧麵包","高纖維麵包","黑麥麵包（注意：這不是指特定的黑色或燕麥類型，而是廣泛用來形容健康類型的麵包）","whole grain bread","brown bread","healthy bread","wheaty bread","Whole wheat bread"]', 'Cereals and cereal products', 'AI生成', 'Whole wheat bread', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_3065', '["野豬","山豬","野豭","土猪","wild pig","feral hog","razorback","boar","Wild boar"]', 'Animal foods', 'AI生成', 'Wild boar', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_3066', '["野薺菜","小薺","bird's nest","bishop's lace","Queen Anne's lace","Wild carrot"]', 'Vegetables', 'AI生成', 'Wild carrot', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_3067', '["水芹","野芹菜","Wild celery","Celery leaf","Marsh celery"]', 'Herbs and Spices', 'AI生成', 'Wild celery', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_3068', '["野韭","廣葉野韭","wild leek","broadleaf wild leek","Yorktown Onion","Wild leek"]', 'Vegetables', 'AI生成', 'Wild leek', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_3069', '["加拿大米","印度米","水燕麦","野米","Canada rice","Indian rice","water oats","wild rice","Wild rice"]', 'Cereals and cereal products', 'AI生成', 'Wild rice', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_3070', '["四角豆","飛刀菜","四角莢","Goa bean","Asparagus pea","Four-angled bean","Winged pea","Winged bean"]', 'Pulses', 'AI生成', 'Winged bean', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_3071', '["冬迷迭香","冬韌草","winter savoury","mountain savory","Winter savory"]', 'Herbs and Spices', 'AI生成', 'Winter savory', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_3072', '["老南瓜","冬南瓜","硬皮南瓜","winter gourd","storage squash","Winter squash"]', 'Gourds', 'AI生成', 'Winter squash', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_3073', '["雲吞皮","餛飩皮","wonton skin","dumpling wrapper","Wonton wrapper"]', 'Baking goods', 'AI生成', 'Wonton wrapper', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_3074', '["雪花梨","白梨","Chinese White Pear","Asian pear","Yali pear"]', 'Fruits', 'AI生成', 'Yali pear', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_3075', '["山藥","芋頭","洋山药","土薯","地栗","potato","spud","tater","murphy","cush-cush yam","woody nightshade tuber","Yam"]', 'Vegetables', 'AI生成', 'Yam', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_3076', '["長豇豆","四季豆","龍頭豆","扁豆角","bora","long-podded cowpea","asparagus bean","snake bean","Chinese long bean","Yardlong bean"]', 'Pulses', 'AI生成', 'Yardlong bean', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_3077', '["油菜","滝菜","苔菜","Gai choy","Chinese flowering cabbage","Flowering mustard","Rape flower","Yau choy"]', 'Vegetables', 'AI生成', 'Yau choy', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_3078', '["亞地亞","箭葉馬鈴薯","arrowleaf elephant ear","tropical yam bean","yellow yautia","Yautia"]', 'Vegetables', 'AI生成', 'Yautia', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_3079', '["黃甜椒","黃彩椒","黃柿子椒","yellow sweet pepper","yellow capsicum","yellow chili pepper","Yellow bell pepper"]', 'Vegetables', 'AI生成', 'Yellow bell pepper', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_3080', '["黃花蓮草","荷花莖","brandywine lily","cow lily","yellow water-lily","helmet pad","Yellow pond-lily"]', 'Herbs and Spices', 'AI生成', 'Yellow pond-lily', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_3081', '["黃絲豆","黃蠟莢","yellow snap bean","yellow French bean","wax bean","butter bean (note: this can also refer to other beans in some contexts)","Yellow wax bean"]', 'Pulses', 'AI生成', 'Yellow wax bean', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_3082', '["黃西葫蘆","黃秋葵（誤稱）","黃ucchini","yellow squash","golden zucchini","summer squash (yellow variety)","Yellow zucchini"]', 'Gourds', 'AI生成', 'Yellow zucchini', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_3083', '["黃金鰭吞拿魚","黃金鰭 tuna","黄鳍金枪鱼","yellowfin tuna","Thunnus albacares","yalow fin","yellowsnout tuna","Yellowfin tuna"]', 'Aquatic foods', 'AI生成', 'Yellowfin tuna', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_3084', '["黃鰭金目鯛","黃鰭黃鰤","鰤魚","鰤","great amberjack","buri","hiramasa","california yellowtail","southern yellowtail","yellowtail kingfish","kingfish","Yellowtail amberjack"]', 'Aquatic foods', 'AI生成', 'Yellowtail amberjack', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_3085', '["優美兒","丹麥酸奶","soured milk","Danish soured milk","ymer","filmyolk","scandinavian cultured milk","Ymer"]', 'Milk and milk products', 'AI生成', 'Ymer', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_3086', '["優格","酸奶","乳酸菌飲品","活性乳酸菌","yogurt","yoghurt","yoghourt","cultured milk","bio milk","curdled milk","Yogurt"]', 'Milk and milk products', 'AI生成', 'Yogurt', NULL);
INSERT INTO food_aliases (family_key, aliases, category, description, foodb_search_term, taiwan_search_term)
VALUES ('map_3087', '["雙烤麵包","脆皮蛋捲","Twice-Baked Bread","Zwieback Toast","Zwieback"]', 'Cereals and cereal products', 'AI生成', 'Zwieback', NULL);