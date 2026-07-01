# Gemini 補論文 Prompt：運動員表現 × 台灣食品資料庫

> 用法：複製下面 `===` 之間的整段（從「我正在做一個台灣食品營養網站」到「開始吧」），貼進 Gemini 2.5 Pro（建議開 Deep Research 模式）。

===

我正在做一個台灣食品營養健康網站（recipe-ai）。我要新增一個「運動員營養專欄」，用權威論文為基礎，**幫每篇論文匹配台灣食品成分資料庫實際有的營養素，自動推薦相對應的食物**。

請依下列規則找 **50篇** 運動員營養相關代表性論文。

## 任務本質

每篇論文除了學術資訊外，必須能**直接對接到我的資料庫**——也就是論文的核心結論必須圍繞在「下方清單裡的某幾個營養素」，這樣讀者讀完論文摘要後可以立刻看到「應該吃什麼食物」的推薦。

## 自由度

主題不限——只要跟運動員/運動表現相關都可以。下面 7 個 angle 給你參考，**不必每個 angle 都湊一篇，也可以多篇集中在同一個熱門 angle**：

1. **耐力運動**（馬拉松、長跑、自行車、游泳）—— 鐵、omega-3、碳水補充策略、Vit D、抗氧化
2. **肌力/爆發力**（重訓、田徑、舉重）—— 蛋白質量與時機、leucine / BCAA、Vit D 與肌肉
3. **賽後恢復與抗發炎** —— EPA / DHA、Vit E / C、tart cherry-like polyphenols、leucine
4. **免疫與訓練可持續性** —— 鋅、Vit D、glutamine（注意 glutamine 不在我資料庫）、蛋白質充足度
5. **電解質補水** —— 鈉、鉀、鎂、運動中流失與補充
6. **女性運動員（特別重要）** —— 鐵（月經失血）、鈣（骨密度）、Energy Availability、RED-S
7. **大師級/中老年運動員** —— 蛋白質劑量上修、Vit D、肌少症預防

## 篩選優先序

| 條件 | 偏好 |
|---|---|
| 期刊 | IJSNEM > JISSN > Med Sci Sports Exerc > BJSM > Sports Medicine > AJCN > Nutrients > Lancet > NEJM |
| 研究設計 | Position Stand / Consensus Statement > Systematic review / Meta-analysis > 大型 RCT > 小 RCT > 觀察性 > narrative review |
| 引用次數 | 越高越好（>500 為佳；ISSN/IOC consensus statement 通常 >1000） |
| 年份 | 優先 2015 年後；經典如 ISSN protein position stand 2017 / 2024、IOC consensus 2018 等可採用 |
| 樣本 / 共識權威 | RCT n>50；consensus statement 寫越多人的越好 |
| Open Access | 強優先 open access（讓我能放網站 link）；paywall 也可但要標記 |
| 對台灣讀者實用性 | 結論要可被一般運動者理解、不只是頂尖菁英才適用 |

## 必須避開的 6 個營養素（我資料庫無此欄位）

膽素（Choline）、生物素（Biotin）、泛酸（Pantothenic acid）、碘（Iodine）、硒（Selenium）、氟（Fluoride）。
論文核心結論若**只**談這幾項，請跳過。若是順帶提到、主軸是其他營養素，沒問題。

## 我資料庫實有的 106 項營養素（每篇論文回覆時必須對應到至少 1 個 key）

```
[基本]
cal_per_100g 熱量 Calories | water_per_100g 水分 Water | protein_per_100g 蛋白質 Protein
fats_per_100g 脂肪 Fat | saturated_fat_per_100g 飽和脂肪 Saturated Fat
ash_per_100g 灰分 Ash | carbon_per_100g 碳水化合物 Carbohydrates
dietary_fiber_per_100g 膳食纖維 Dietary Fiber

[糖類]
total_sugar_per_100g 總糖 | glucose_per_100g 葡萄糖 | fructose_per_100g 果糖
galactose_per_100g 半乳糖 | maltose_per_100g 麥芽糖 | sucrose_per_100g 蔗糖
lactose_per_100g 乳糖

[礦物質]
sodium_per_100g 鈉 Sodium | potassium_per_100g 鉀 Potassium
calcium_per_100g 鈣 Calcium | magnesium_per_100g 鎂 Magnesium
iron_per_100g 鐵 Iron | zinc_per_100g 鋅 Zinc
phosphorus_per_100g 磷 Phosphorus | copper_per_100g 銅 Copper
manganese_per_100g 錳 Manganese

[維生素 A]
vitamin_a_total_iu 維生素 A 總量 | retinol_equivalent_ug 視網醇當量 RE
retinol_ug 視網醇 | alpha_carotene_ug α-胡蘿蔔素 | beta_carotene_ug β-胡蘿蔔素

[維生素 D]
vitamin_d_total_ug 維生素 D 總量 | vitamin_d2_ug D2 | vitamin_d3_ug D3

[維生素 E]
vitamin_e_total_mg 總量 | alpha_vitamin_e_te_mg α-TE
alpha_tocopherol_mg α-生育酚 | beta_tocopherol_mg β | gamma_tocopherol_mg γ | delta_tocopherol_mg δ

[維生素 K]
vitamin_k_ug 總量(K1+K2) | vitamin_k1_ug | vitamin_k2_mk4_ug | vitamin_k2_mk7_ug

[維生素 B 群 + C]
vitamin_b1_mg B1 Thiamine | vitamin_b2_mg B2 Riboflavin
niacin_mg B3 Niacin | vitamin_b6_mg B6
vitamin_b12_ug B12 | folate_ug Folate | vitamin_c_mg C

[飽和脂肪酸] (按碳鏈長度)
saturated_fatty_acids_total_mg 總量
butyric_acid_4_0 / caproic_6_0 / caprylic_8_0 / capric_10_0 / lauric_12_0 / tridecanoic_13_0
myristic_14_0 / pentadecanoic_15_0 / palmitic_16_0 / heptadecanoic_17_0
stearic_18_0 / nonadecanoic_19_0 / arachidic_20_0 / behenic_22_0 / lignoceric_24_0

[單元不飽和]
monounsaturated_fatty_acids_total_mg 總量
myristoleic_14_1 / palmitoleic_16_1 / oleic_18_1 / gadoleic_20_1 / erucic_22_1

[多元不飽和]
polyunsaturated_fatty_acids_total_mg 總量
n3_pufa_total_mg n-3 合計 (linolenic + EPA + DHA)
linoleic_18_2 亞麻油酸 (n-6) | linolenic_18_3 次亞麻油酸 (n-3 ALA)
octadecatetraenoic_18_4 | arachidonic_20_4 花生四烯酸
epa_20_5 EPA | dpa_22_5 DPA | dha_22_6 DHA

[胺基酸 19 項]
total_amino_acids_mg 總量
aspartic_acid 天門冬胺酸 | threonine 蘇胺酸* | serine 絲胺酸 | glutamic_acid 麩胺酸
proline 脯胺酸 | glycine 甘胺酸 | alanine 丙胺酸 | cystine 胱胺酸
valine 纈胺酸* (BCAA) | methionine 甲硫胺酸* | isoleucine 異白胺酸* (BCAA) | leucine 白胺酸* (BCAA)
tyrosine 酪胺酸 | phenylalanine 苯丙胺酸* | lysine 離胺酸* | histidine 組胺酸*
arginine 精胺酸 | tryptophan 色胺酸*  (* = 必需胺基酸)

[其他]
trans_fat_mg 反式脂肪 | cholesterol_mg 膽固醇 | alcohol_content_g 酒精
waste_rate 廢棄率 | modified_cal_per_100g 修正熱量
```

## 每篇論文的回傳格式

```
### [編號]. [一句話主題標籤，例如「賽後 leucine 補充加速肌肉合成」]

**完整英文標題：** [...]
**作者：** [第一作者] et al. ([作者數])
**期刊：** [全名] [年份]; [卷]([期]): [頁]
**DOI：** https://doi.org/[...]
**PubMed ID：** [PMID]
**研究設計：** [類型] (n=[數])
**引用次數：** [數] (Google Scholar)
**Open Access：** [Yes/No]
**全文 PDF 連結：** [URL 或 "paywall"]

**對應台灣資料庫營養素 key（重要）：**
- 主要：[`field_key_1`、`field_key_2`...]（最多 3 個，論文核心圍繞的）
- 次要：[`field_key_3`...]（論文有提但非核心）

**核心結論（中文一句話，<60 字）：** [...]

**繁中 200 字摘要：** [完整改寫摘要，給網站直接使用，避免直接複製貼 abstract]

**運動員場景應用（<100 字）：** [我網站如何用這篇？例如：「耐力跑者賽前 7 天每日攝取 X mg，可從以下台灣食物獲得」]

**選擇理由（<80 字）：** [為什麼這篇而非同主題其他]
```

## 補充要求

1. 50 篇 spread across 多個 angle，但若某 angle 證據強（例如蛋白質劑量有 ISSN position stand），可同 angle 收 2–3 篇互補。
2. 至少包含 **1 篇 ISSN position stand 或 IOC consensus statement**（這類 high-impact、台灣讀者搜得到）。
3. 至少包含 **1 篇女性運動員專題**（鐵 / RED-S），台灣女性運動者資料較少，這部分有引用價值。
4. **在所有論文後面附一張總表**，欄位：編號 / 標題（短）/ 第一作者 / 年份 / 期刊 / 主要 nutrient key / Open Access。

開始吧。

===

## 拿到 Gemini 回覆後我會做的事

1. 把所有 PDF 下載到 `graph/論文20/_gemini_supplements/`
2. 跑 PDF→text 加進 `corpus_text/`
3. 重跑 Phase 1 chunking（1200/100）
4. 進 Phase 2 entity 抽取（Claude Agent subagent）
5. **附加：把每篇論文的「對應 nutrient key」與「繁中 200 字摘要」也存成 JSON，未來 recipe-ai 可以做「這個營養素背後的科學依據」連結到論文摘要 + 推薦食物**
