# Recipe AI 變更紀錄（從前幾天到目前）

> 產出日期：2026-03-25
> 範圍：從「前幾天個人頁面優化」開始，到目前所有連續改動（DRI/UL、抽取、換算、匹配、日誌治理、英文文章解析）
> 目的：完整回顧每一階段改了什麼、為什麼改、如何驗證、目前狀態

---

## 0. 起點說明（依你指定：從個人頁面開始）

這份紀錄的時間起點不是專案最初開發，而是「前幾天你要求先改個人頁面」那一批改動。

實際順序是：
1. 個人頁（DRI/UL 顯示與資料化）
2. 食譜抽取與換算修正（20g*4顆、cc、顆等）
3. 防 AI 幻覺與預設匹配調整
4. control/backend 全鏈路診斷日誌
5. backend 寫檔日誌與時區/輪替策略
6. 英文文章食譜抽取能力補強
7. 最新「茄汁蝦仁」噪音文本與 100 倍換算錯誤修復

---

## 1. 第一階段：個人頁面（Profile）起始改動

> 這一階段就是你提到的「前幾天從個人頁面開始」。

## 1.1 前端 DRI 資料表導入

### 改動
- 新增 `frontend/src/data/driV8Table.js`
- `frontend/src/utils/driReferences.js` 改為查表 + 上限解析

### 解決問題
- DRI 資料改為結構化維護，可按性別/年齡層解析 target 與 UL。

## 1.2 Profile 頁可視化改善

### 改動
- `frontend/src/pages/ProfilePage.jsx`

### 內容
1. 顯示年齡分層與資料格式。
2. 顯示建議值進度。
3. 新增 UL 第二軌進度條（風險/接近上限提示）。

### 附帶修復
- 曾發生 `DRI_V8_SOURCE_URL` 匯出缺失導致 build fail，已補 re-export。

### 後續延伸出的新痛點（接著才進入抽取與換算）
1. 食譜文本如 `黑糖饅頭20g*4顆 / 水煮蛋1顆 / 鮮奶250cc` 只抓到部分食材。
2. 換算結果出現巨大錯誤（例如 2000g、後續又出現 30000g/38000g）。
3. AI 會出現幻覺食材（文本沒寫卻被補出來）。
4. 前端預設匹配偏單一來源（常全落 FooDB）。
5. 日誌不夠可追，難以判斷是抽取錯、匹配錯還是換算錯。
6. 英文食譜文章型文本（非條列）抽取率差。

---

## 2. 第二階段：修正基礎抽取與乘數換算

## 2.1 單位換算核心修補

### 問題
- `20g*4顆` 這種乘數格式先被一般 parser 誤拆，導致單位落入 unknown，後續被 `amount * 100g` 放大。

### 改動
- 在 `control/app/services/unit_converter.py` 新增乘數優先解析流程：
  - 先用 `_MULTIPLIER_PATTERN` 辨識 `left x right`。
  - 若某一側是重量/體積，先換算該側 grams，再乘另一側倍數。
  - 避免過早落入 unknown unit fallback。

### 驗證
- `20g*4顆 -> 80g`
- `250cc -> 257.5g`（依密度）
- `1顆 -> 60g`（依 piece weight）

## 2.2 抽取 fallback 補強

### 問題
- 食材與數量黏在一起時（如 `黑糖饅頭20g*4顆`）AI 容易漏抓。

### 改動
- `control/app/services/ai_service.py` 增加逐行規則抽取 fallback：
  - 從原文逐行抓「食材 + 用量」。
  - 補齊 AI 漏抓項目。

### 成果
- 可抓出原先被漏掉的「黏字食材」與其用量。

---

## 3. 第三階段：防 AI 幻覺與預設匹配優化

## 3.1 抽取結果合併規則重設

### 問題
- AI 回傳會憑空補出文本中沒有的食材（例如醬油、鹽）。

### 改動
- `extract_keywords_with_amounts` 合併策略改為：
  1. 逐行規則抽取結果優先（line fallback as source）。
  2. AI 項目只有在原文中可找到名稱才允許合併。
  3. 同名衝突時，保留品質較高的 amount（乘數格式優先、資訊較完整優先）。

### 成果
- 顯著降低幻覺食材。

## 3.2 前端預設匹配邏輯調整

### 問題
- 預設選擇常固定某來源（例如第一個台灣候選），無法全局比較最佳。

### 改動
- `frontend/src/pages/RecipeAnalyzerPage.jsx`：
  - 先聚合 tw/en 候選再統一評分。
  - 以 score 排序，後續又加入 `richnessBonus`（營養欄位非零數量）與 `sourceBonus`（台灣來源小幅加權）。

### 成果
- 降低「全部落同一資料源」機率，預設匹配更符合可用性。

---

## 4. 第四階段：全鏈路診斷日誌（control/backend）

## 4.1 control 端

### 改動範圍
- `control/app/services/ai_service.py`
- `control/app/services/recipe_analyzer.py`
- `control/app/services/nutrition_service.py`
- `control/app/routers/recipe.py`

### 新增重點日誌
1. 抽取：cleaned text、merge mode、AI raw、fallback 結果。
2. 匹配：lookup terms、候選 topN、最終選擇理由。
3. 換算：raw amount、parsed unit、grams、estimated。
4. 結算：送 backend 前 payload 與聚合後摘要。

## 4.2 backend 端

### 改動範圍
- `backend/repositories/food_repository.py`
- `backend/repositories/nutrition_repository.py`
- `backend/routers/food.py`

### 新增重點日誌
1. 候選分數拆解：`sim / contains / exact / formula`。
2. 聚合輸入細節：`raw_amount / parsed_unit / estimated / input_food_name`。
3. 聚合分段輸出：start/item/done。

### 成果
- 可以快速定位錯誤層級（抽取錯、匹配錯、換算錯、聚合錯）。

---

## 5. 第五階段：backend 寫檔日誌落地

## 5.1 新增 backend logger + middleware

### 改動
- 新增 `backend/logger.py`
- 新增 `backend/middleware/logging_middleware.py`
- `backend/main.py` 掛載 logger 與 request middleware
- `docker-compose.yml` 增加 volume：`./backend/logs:/app/logs`

### 成果
- backend 請求可在 `backend/logs` 留存 `BACKEND_REQUEST_START/END`。
- `/health` 驗證可看到寫檔。

---

## 6. 第六階段：英文文章型食譜抽取能力


## 6.1 Ingredients 區塊解析器

### 問題
- 英文 recipe 網頁常是長文 + 區塊，不是規整條列 JSON。

### 改動
- `ai_service.py` 新增：
  - `_extract_ingredients_section_lines`
  - `_extract_ingredient_amounts_from_ingredients_section`
- 優先從 `Ingredients` 區塊抓「amount-first」格式。

## 6.2 正規化修正

### 改動
- `_normalize_ingredient` 防止英文單字誤刪（如 cabbage 的 g）。
- 支援 unicode fraction（¼, ⅓, ¾...）。

### 成果
- 可抽出 tortilla/hummus/cucumber/yogurt/pickle juice/cabbage 等常見英文食材與用量。

---

## 7. 第七階段：運維策略強化（台灣時區 + 小時輪替）

## 7.1 backend 日誌策略更新

### 改動
- `backend/logger.py`：
  - 主檔改 `backend.log`
  - `rotation="1 hour"`
  - `retention="3 hours"`
  - `watch=True`（手動刪檔後自動重建）
- `backend/main.py`：新增 hourly checkpoint loop（Asia/Taipei）
- `docker-compose.yml`：backend env 增加 `TZ: Asia/Taipei`

### RUNBOOK 同步
- 更新到 `backend.log` 查看方式
- 加入 UTC+8、保留 3 小時說明
- 補上單位換算表位置章節

### 驗證
- 重建容器後，主機端 `backend/logs` 已見 `backend.log`。
- `/health` 請求可寫入新檔。

---

## 8. 最新階段（你提供「茄汁蝦仁」案例）專案修復

> 這一段是最新、最關鍵，直接對應你剛剛回報的錯誤。

## 8.1 問題重現

### 你回報的異常
1. 抽取不完整，且抓到不該抓的噪音詞。
2. 換算暴增：
   - `380克） -> 38000g`
   - `300克，切丁 -> 30000g`
   - `50克，切末 -> 5000g`
3. 期望能抽出：
   - 新鮮白蝦1斤（蝦仁380克）
   - 蕃茄300克，切丁
   - 洋蔥50克，切末
   - 油少許
   - 康門提斯有鹽小奶油40克
   - 水300克
   - 酒2T
   - 蝦仁醃料：
   - 鹽麴1t
   - 鹽1/4t
   - 乾燥羅勒葉末少許
   - 阿順師蒜粉

## 8.2 根因分析

1. 單位尾巴污染：
   - parser 讀到 `克）`、`克，切丁`，在單位表查不到，落入 unknown fallback（`amount*100g`）。
2. 文本噪音混入：
   - 社群文案（說讚、分享成品照、地區資訊）未完全隔離，易被誤判成食材句。
3. 模糊量與無數量行缺補抓：
   - `少許`、純食材名行（無數字）需要補強規則。

## 8.3 已實作修復

### A. `control/app/services/unit_converter.py`
1. 新增 `t`（小寫）到 volume 單位（teaspoon）映射。
2. `parse_amount` 對 `unit_raw` 做清洗：
   - 去掉 `，切丁`、`）`、句尾標點與描述尾巴。
   - 保留首段有效單位再查表。

### B. `control/app/services/ai_service.py`
1. `_clean_recipe_text` 段落 marker 新增：
   - 起點：`預備食材`
   - 終點：`料理步驟`
2. `_LINE_AMOUNT_PATTERN` 擴充支持 `T/t`。
3. 新增噪音行關鍵字過濾（分享/說讚/成品照/照片等）。
4. 新增 `_VAGUE_AMOUNT_PATTERN`：
   - 可抓 `油少許`、`羅勒少許`。
5. 增加「純食材行」補抓：
   - 如 `阿順師蒜粉`（amount 允許空字串）。
6. fallback 改跑 cleaned text：
   - 減少社群噪音對規則抽取的干擾。

## 8.4 最新實測結果（已重建 control 後驗證）

抽取結果示例（重點）：
1. `新鮮白蝦蝦仁 380克）`
2. `蕃茄 300克，切丁`
3. `洋蔥 50克，切末`
4. `油 少許`
5. `康門提斯有鹽小奶油 40克`
6. `水 300克`
7. `酒 2T`
8. `鹽麴 1t`
9. `鹽 1/4t`
10. `乾燥羅勒葉末 少許`
11. `阿順師蒜粉`（空用量）

換算結果示例（重點）：
1. `380克） -> 380.0g`（修正成功）
2. `300克，切丁 -> 300.0g`（修正成功）
3. `50克，切末 -> 50.0g`（修正成功）
4. `2T -> 28.5g`（依密度）
5. `1t -> 6.1g`（依密度）
6. `1/4t -> 1.5g`（依密度）

---

## 9. 目前狀態總結

## 9.1 已完成
1. 大數值爆炸（x100）問題已修復。
2. 中文社群噪音誤抓顯著降低。
3. 模糊量詞與無數量行可被納入。
4. 英文文章食譜抽取能力已建立。
5. UL 雙軌顯示已上線。
6. backend log 已具備 UTC+8 + hourly + 3h retention + 手動刪除自動重建。
7. RUNBOOK 已同步新版操作與排錯流程。

## 9.2 仍可再優化（建議下一步）
1. 「外層 + 內層」雙重量保留策略：
   - 例如 `白蝦1斤（蝦仁380克）` 同時保留兩筆候選，讓 UI 可選採用哪個。
2. 空用量食材（如蒜粉）預設 grams 策略可更保守：
   - 目前 fallback 100g 偏大，建議針對調味粉降預設值。
3. 預設匹配可再引入「營養完整度白名單」與「來源偏差保護」。

---

## 10. 快速核對清單（給下次調參）

1. 啟動：`docker compose up -d --build`
2. 看 control 抽取：`docker compose logs -f control | Select-String "extract_with_amounts|UNIT_CONVERT"`
3. 看 backend 聚合：`docker compose logs -f backend | Select-String "AGG_NUTRI|search_zh_top5|search_en_top5"`
4. 看本機 backend 檔案日誌：`Get-Content -Encoding UTF8 -Tail 200 .\backend\logs\backend.log`

---

## 附錄 A：本次重點異常與修復對照

1. 異常：`Beech nut / Ice cream cone` 亂配
- 修復：抽取去噪 + 合併約束 + 預設匹配評分調整

2. 異常：`380克） -> 38000g`
- 修復：`unit_raw` 清洗後再查單位表

3. 異常：`1t` 未按 teaspoon 處理
- 修復：`t` 映射加入 `VOLUME_UNITS`

4. 異常：UL 不明顯
- 修復：Profile 頁顯示「建議值進度 + UL 進度」雙軌

---

## 附錄 B：主要改動檔案索引

### Control
- `control/app/services/ai_service.py`
- `control/app/services/unit_converter.py`
- `control/app/services/nutrition_service.py`
- `control/app/services/recipe_analyzer.py`
- `control/app/routers/recipe.py`

### Backend
- `backend/logger.py`
- `backend/main.py`
- `backend/middleware/logging_middleware.py`
- `backend/repositories/food_repository.py`
- `backend/repositories/nutrition_repository.py`
- `backend/routers/food.py`

### Frontend
- `frontend/src/pages/RecipeAnalyzerPage.jsx`
- `frontend/src/pages/ProfilePage.jsx`
- `frontend/src/utils/driReferences.js`
- `frontend/src/data/driV8Table.js`

### Infra / Docs
- `docker-compose.yml`
- `RUNBOOK.md`

---

（完）

---

## 11. 三大頁面完整改動專章（個人頁面 / 我的食譜 / 食譜分析）

> 本章是你指定的重點版本：只聚焦三個頁面，並把前端、control、backend 的連動一次寫清楚。

## 11.1 個人頁面（ProfilePage）完整改動

### A. 頁面目標從「資料展示」升級為「每日需求 + 攝取進度儀表板」

前幾天的起始需求不是只顯示個資，而是要把：
1. 個人基本資料（身高/體重/年齡/性別/活動量）
2. 每日熱量與三大營養素需求
3. 當日實際攝取（含我的食譜勾選）
4. DRI 第八版的延伸營養素與 UL（上限）

整合在同一頁。

### B. 主要前端改動（`frontend/src/pages/ProfilePage.jsx`）

1. 資料來源整合
- `getProfile()`：讀取個人檔案。
- `getDietLogs()`：讀取今日飲食紀錄。
- `listRecipes()`：讀取已儲存食譜。
- localStorage：
   - `today_recipe_intake_selection`（哪些食譜計入今日）
   - `profile_view_nutrients`（頁面追蹤的營養素清單）

2. 計算邏輯新增/強化
- BMI 計算與狀態標示。
- 每日熱量估算（依體重、BMI 狀態、活動量）。
- 宏量營養素目標拆分（蛋白/碳水/脂肪比例）。
- 當日攝取彙總（飲食記錄 + 勾選食譜）。

3. DRI 第八版整合
- `getDriTargets(profile)` 依性別/年齡帶回：
   - `targets`（建議值）
   - `upperLimits`（UL 上限值）
   - `ageBand`、`storageFormat`、`source`。
- 延伸營養素清單可動態新增/刪除，並持久化。

4. UL 雙軌顯示（你特別要求）
- 同一營養素同時顯示：
   - 建議值進度條
   - UL 進度條
- 依 UL 比例顯示風險文案：正常 / 接近上限 / 已超過上限。

5. 文案與資訊可追溯性
- 顯示 DRI 來源說明與 PDF 連結。
- 顯示「年齡分層」與「資料格式（javascript-object）」。

### C. DRI 支援檔案改動

1. `frontend/src/data/driV8Table.js`
- 新增結構化資料表（profile->range->targets / upperLimits）。

2. `frontend/src/utils/driReferences.js`
- 新增 alias 映射（同義欄位對齊）。
- `resolveDriTarget` / `resolveDriUpperLimit` 統一取值。
- `getNutrientMeta` 整合各類營養素欄位 metadata。
- 修復過一次 `DRI_V8_SOURCE_URL` 匯出缺失造成的 build 問題。

### D. 使用者可見改變

1. 個人頁不再只是基本資料，而是完整「需求 vs 攝取」面板。
2. 可追蹤營養素可自訂，且會記住你的選擇。
3. UL 風險變成明確可見，不再只能看建議值。

### E. 已知限制與後續可優化

1. UL 目前是營養素層級顯示，尚未分餐次提示。
2. 目標比例（20/50/30）目前固定，可考慮個人化參數化。

---

## 11.2 我的食譜（SavedRecipesPage）完整改動

### A. 頁面定位從「列表」升級為「可編輯的攝取管理中心」

你的需求是：
1. 能刪除與編輯食譜
2. 能選擇哪些食譜計入今日攝取
3. 能看主要與詳細營養素
4. 能快速調整人份並等比例重算

### B. 主要前端改動（`frontend/src/pages/SavedRecipesPage.jsx`）

1. 核心 CRUD
- `listRecipes()` 載入
- `deleteRecipe(id)` 刪除
- `updateRecipe(id, payload)` 更新

2. 今日攝取勾選機制
- checkbox「納入今日攝取進度」
- localStorage `today_recipe_intake_selection` 保存當日選擇
- 以日期 key 隔天自動重置

3. 營養素視圖客製化
- `TODAY_NUTRIENT_VIEW_KEY` 保存要看的營養素欄位
- 可動態新增顯示欄位（從可用營養素集合挑選）

4. 主營養進度卡
- 顯示熱量/蛋白/碳水/脂肪進度圓環
- `calculateMainTargets(profile)` 依 profile 估主目標

5. 編輯模式強化
- 可改名稱、人份、宏量、詳細營養素。
- 改人份時以比例縮放：
   - `ratio = nextServings / baseServings`
   - 宏量與 detail 都同步放大/縮小
- 支援新增或移除可編輯的詳細營養素欄位。

6. 資料正規化與兼容
- `normalizeRecipeNutrition`：處理不同欄位命名（如 `cal_per_100g` vs `calories`）。
- `normalizeDetail`：確保數值型態可運算。
- `sumRecipeNutrients`：彙總宏量 + detail 所有欄位。

7. 詳細營養素展開面板
- `DetailNutrientsPanel` 顯示非 0 項目
- 以 `getNutrientMeta` 翻譯欄位名稱與單位

### C. control/backend 連動改動

1. control 路由（`control/app/routers/recipe.py`）
- `/recipe/list`、`/recipe/{id}`（PUT/DELETE）、`/recipe/save` 對接 backend。

2. API 客戶端（`frontend/src/api/recipeApi.js`）
- `listRecipes/deleteRecipe/updateRecipe/saveRecipe` 完整對應。

### D. 使用者可見改變

1. 食譜從靜態展示變成可操作資料（編輯、刪除、重算）。
2. 今日攝取可由你主動控制，不再被動全加總。
3. 進度卡與詳細營養清單可並存，查閱效率提高。

### E. 已知限制與後續可優化

1. localStorage 為前端保存，跨裝置不共享。
2. 人份縮放是線性模型，尚未處理烹調損耗非線性。

---

## 11.3 食譜分析（RecipeAnalyzerPage）完整改動

### A. 流程重構為 4 步驟可回跳 UI

目前步驟：
1. 輸入食譜
2. 確認食材
3. 選擇匹配 + 用量
4. 完整營養結算

每一步都可回跳修改，提升可控性。

### B. 前端主要改動（`frontend/src/pages/RecipeAnalyzerPage.jsx`）

1. 抽取層
- 優先呼叫 `extractIngredientsWithAmounts(recipeText)`。
- 失敗 fallback 到 `extractIngredients(recipeText)`。
- 同步保存 `parsedAmounts`，直接帶入 Step 3 用量欄。

2. 人份偵測
- 支援從文本偵測 `X人份 / servings` 自動帶值。

3. 匹配預設選擇優化
- 合併 tw/en 候選後排序。
- ranking：`score + richnessBonus + sourceBonus`。
   - `richnessBonus`：營養欄位非零越多，分數越高。
   - `sourceBonus`：台灣來源小幅加權，降低全 FooDB。

4. 用量預覽與單位提示
- `getAmountConversionPreview()` 前端即時計算提示：
   - 支援 unicode fraction（¼ ½ ¾ ...）
   - 支援 `g/kg/ml/cc/T/tsp/tbsp/cup/顆/片/碗`
   - 支援乘數格式與 `(8-inch)` tortilla 估算
- 在卡片顯示估算 kcal（依候選每 100g 熱量）。

5. 計算與儲存
- Step 4 呼叫 `calculateNutrition(items)`。
- 儲存時送：`recipe_name/content/servings/nutrition/nutrition_detail/ingredients`。

### C. control 端主要改動（抽取、匹配、換算、結算）

1. 路由層（`control/app/routers/recipe.py`）
- 新增/強化：
   - `/recipe/extract-with-amounts`
   - `/recipe/lookup`
   - `/recipe/calculate-nutrition`
   - `/recipe/save`。

2. 抽取層（`control/app/services/ai_service.py`）
- 清理文本 `_clean_recipe_text`：移除網站噪音、保留食材段。
- 英文區塊解析器：Ingredients section 優先。
- AI JSON + line parser 雙模式。
- 規則 fallback 與合併策略：
   - line fallback 優先
   - AI 項目需在原文出現才保留
   - amount 品質比較後覆蓋。
- 最新噪音文本強化：
   - 噪音行過濾（說讚/分享成品照/照片等）
   - `少許/適量` 與純食材行補抓
   - fallback 改跑 cleaned text。

3. 匹配層（`control/app/services/recipe_analyzer.py`）
- 語言偵測、雙向翻譯、同義詞展開。
- 拿 separate candidates（tw/en）供前端雙欄選擇。
- 查詢與 topN 候選 log 詳細輸出。

4. 換算層（`control/app/services/unit_converter.py`）
- `20g*4顆` 乘數換算優先。
- unicode fraction 轉換。
- 英文單位與 tortilla/wrap piece weight 補強。
- `t`（teaspoon）新增。
- 單位清洗：
   - `380克）` -> `克`
   - `300克，切丁` -> `克`
   - 避免 unknown unit 乘 100。

5. 結算層（`control/app/services/nutrition_service.py`）
- 逐項 `convert_ingredient_amount`，帶入 backend aggregate。
- 回傳 per-item + total + nutrient_meta。
- 附帶 conversion 與 input amount 資訊給前端顯示。

### D. backend 端配合改動

1. `backend/repositories/food_repository.py`
- 分數拆解欄位：`sim/contains/exact/formula`。

2. `backend/repositories/nutrition_repository.py`
- aggregate log 擴充：輸入用量上下文（raw/parsed/estimated）。

3. `backend/routers/food.py`
- aggregate payload 支援擴展欄位。

### E. 這頁修過的關鍵 bug（按影響排序）

1. 乘數格式爆量
- `20g*4顆` 被誤算 -> 已修為 80g。

2. 單位尾巴污染導致 x100
- `380克）`、`300克，切丁` -> 已修。

3. AI 幻覺食材
- 文本無該食材卻被補進結果 -> 已加原文約束。

4. 英文文章抽取率低
- 非條列配方抓不到 -> 已加 Ingredients section parser。

5. `1 (8-inch)`、`1 tablespoon`、`¼ cup` 前端預覽不足
- 已補單位與分數解析。

### F. 使用者可見改變

1. 抽取成功率提高（中英混合、網站內容、雜訊文本）。
2. 用量估算更可解釋（每步有提示，不是黑箱）。
3. 匹配不再偏單一資料源。
4. Step4 可看到更多完整營養細項。

### G. 仍可再優化

1. 括號雙重量策略（`白蝦1斤（蝦仁380克）`）可做雙候選。
2. 無用量香辛料預設值可改成更保守（目前部分情境仍偏大）。
3. ranking 可加入「資料完整度門檻 + 類別一致性」再降錯配。

---

## 11.4 三頁面共同支撐改動（橫向）

1. API 封裝統一（`frontend/src/api/recipeApi.js`）
- 分析、抽取、查詢、結算、儲存、列表、刪除、更新全走同一 client。

2. 日誌可觀測性升級
- control：抽取/匹配/換算/結算
- backend：分數拆解/聚合輸入輸出
- backend file logging：`backend.log` hourly rotation + 3h retention + Asia/Taipei

3. RUNBOOK 同步
- 啟停、排錯、關鍵 log 關鍵字、backend 檔案查看方式與單位表位置。

---

## 11.5 驗證摘要（針對三頁面）

1. 個人頁面
- DRI/UL 顯示、年齡層顯示、來源鏈接可見。

2. 我的食譜
- 勾選今日攝取、編輯人份縮放、詳細營養顯示可用。

3. 食譜分析
- 中文乘數、英文單位、雜訊文本案例已完成重建後實測。
- 30000g/38000g 問題已被消除。

---

## 11.6 你現在可直接拿去對照測試的重點案例

1. 個人頁面
- 檢查任一含 UL 的營養素，是否同時有「建議值進度 + UL 進度」。

2. 我的食譜
- 編輯某食譜人份從 1 改 2，確認宏量與 detail 等比例放大。

3. 食譜分析
- 測：`新鮮白蝦1斤（蝦仁380克）`、`酒2T`、`鹽1/4t`、`乾燥羅勒葉末少許`
- 應不再出現 `x100` 放大量。
