# 0520 Recipe-AI 優化紀錄與 Ubuntu 實作流程

日期：2026-05-20  
目的：整理本日 Recipe-AI 優化內容，作為後續在 Ubuntu 環境實際修改、部署、驗證的依據。

---

## 1. 本日優化目標

本日主要處理四個方向：

1. 統一營養分析流程恢復與修正
   - 保留原本完整流程：停用詞、食材抽取、自動判斷份數、食材匹配、份量換算、完整營養分析、DRI 缺口分析、改善建議。
   - 修正食譜名稱擷取過長問題。
   - 第 6 步「記錄與儲存」新增可即時編輯的儲存/記錄份數。

2. 今日飲食紀錄與日分析行事曆同步
   - 「加入今日飲食紀錄」後，同步建立食譜並加入日分析行事曆。
   - 日分析行事曆支援每筆食譜的當日份數調整。

3. 缺口推薦食物細節化
   - 將日分析行事曆的「缺口推薦食物」從單純食物名稱清單，升級成類似「營養素排名」的詳細表格。
   - 顯示食物分類、來源、常用份量、每 100g 含量、建議份數。
   - 新增自選營養素查詢，可查看當日攝取狀況與推薦食物。

4. 資料庫與 API 補齊
   - 補 `diet_logs` 缺失欄位。
   - 補 `recipe_calendar_entries` 表。
   - 補 `servings_override` 欄位，讓日分析可用不同於原食譜的當日份數。

---

## 2. 架構概覽

目前系統主要分成四層：

```text
Browser
  |
  | localhost:3001
  v
frontend / nginx
  React pages
  - UnifiedAnalysisPage.jsx
  - DailyAnalysisCalendarPage.jsx
  - NutrientRankingPage.jsx
  - SavedRecipesPage.jsx
  |
  | API calls
  v
control service
  FastAPI proxy / advisor workflow
  - control/app/routers/calendar.py
  |
  | internal API
  v
backend service
  FastAPI business API
  - backend/routers/calendar.py
  - backend/repositories/calendar_repository.py
  - backend/database.py
  |
  | SQL
  v
postgres
  tables
  - saved_recipes
  - diet_logs
  - recipe_calendar_entries
  - taiwan_foods
  - foodb_* tables
```

Docker container 角色：

```text
recipe_ai_frontend  -> nginx serving frontend/dist
recipe_ai_control   -> advisor / proxy layer
recipe_ai_backend   -> main API
recipe_ai_postgres  -> database
```

---

## 3. 本日實際修改功能

### 3.1 食譜名稱擷取修正

問題：

原本第 6 步摘要顯示用：

```js
(recipeText || "").slice(0, 50)
```

因此像下面這種輸入會變成很長的標題：

```text
土耳其雞肉飯 土耳其雞肉飯 #雞肉 #高蛋白 #鷹嘴豆 #土耳其料理 1 說讚 份量 2
```

修正後：

新增/修改：

```text
frontend/src/utils/recipeTitle.js
frontend/src/pages/UnifiedAnalysisPage.jsx
```

邏輯：

1. 優先找 `食譜名稱：`、`料理名稱：`、`recipe title:` 等標籤後面的文字。
2. 遇到句號、驚嘆號、換行等硬中斷就停止。
3. 去掉 hashtag 與平台尾巴，例如：
   - `#雞肉`
   - `說讚`
   - `份量`
   - `食材`
   - `材料`
   - `步驟`
4. 如果前兩段重複，例如 `土耳其雞肉飯 土耳其雞肉飯`，保留第一段。
5. 過長時嘗試擷取常見菜名結尾，例如 `飯`、`麵`、`湯`、`肉`、`雞`、`魚`、`炒`、`滷`。

修改結果：

```text
土耳其雞肉飯 土耳其雞肉飯 #雞肉 #高蛋白 ...
```

會顯示為：

```text
土耳其雞肉飯
```

---

### 3.2 第 6 步新增儲存/記錄份數

問題：

使用者分析一份多人份食譜時，可能實際只吃 1 人份。如果直接儲存多人份，日分析會高估營養攝取。

修正位置：

```text
frontend/src/pages/UnifiedAnalysisPage.jsx
```

新增狀態：

```js
const [saveServings, setSaveServings] = useState(1);
```

當原始分析份數變動時，同步預設值：

```js
useEffect(() => {
  setSaveServings(servings);
}, [servings]);
```

新增縮放工具：

```js
function scaleNutritionDetail(detail, factor) {
  const scale = Number.isFinite(factor) && factor > 0 ? factor : 1;
  return Object.fromEntries(
    Object.entries(detail || {}).map(([key, value]) => {
      const n = Number(value);
      return [key, Number.isFinite(n) ? n * scale : value];
    })
  );
}
```

儲存時使用：

```js
const storageServings = Math.max(0.1, Number(saveServings) || 1);
const factor = storageServings / Math.max(0.1, Number(servings) || 1);
const storageDetail = scaleNutritionDetail(nutritionResult?.total || {}, factor);
```

儲存食譜時寫入：

```js
servings: storageServings,
nutrition: toRecipeMacroNutrition(storageDetail),
nutrition_detail: storageDetail,
```

加入今日飲食紀錄時：

```js
await addEntry(entryDate, savedRecipe.id, storageServings);
```

畫面顯示：

- 原始份數
- 要儲存/記錄的份數
- 依照該份數即時計算的儲存熱量

---

### 3.3 今日飲食紀錄同步日分析行事曆

問題：

原本「加入今日飲食紀錄」只寫飲食紀錄，沒有真的出現在日分析行事曆。

修正位置：

```text
frontend/src/pages/UnifiedAnalysisPage.jsx
frontend/src/api/calendarApi.js
backend/routers/calendar.py
backend/repositories/calendar_repository.py
control/app/routers/calendar.py
backend/database.py
```

前端流程：

```js
await createDietLog(...);
const savedRecipe = await saveRecipe(...);
await addEntry(entryDate, savedRecipe.id, storageServings);
```

後端新增/調整：

1. `recipe_calendar_entries` 表支援 `servings_override`
2. `POST /calendar/entries` 可帶 `servings`
3. `PUT /calendar/entries/{entry_id}` 可修改當日份數
4. `GET /calendar/entries` 回傳：
   - `servings_override`
   - `recipe_servings`
   - `servings`

資料表概念：

```sql
recipe_calendar_entries
  id
  user_id
  recipe_id
  entry_date
  servings_override
  sort_order
  created_at
```

---

### 3.4 日分析行事曆可調整每筆食譜份數

修正位置：

```text
frontend/src/pages/DailyAnalysisCalendarPage.jsx
frontend/src/utils/recipeNutritionAggregator.js
```

畫面新增：

每筆食譜右側有「今日份數」輸入框。

更新流程：

```text
使用者調整今日份數
  -> frontend updateEntry(entryId, { servings })
  -> control PUT /calendar/entries/{entry_id}
  -> backend PUT /calendar/entries/{entry_id}
  -> recipe_calendar_entries.servings_override
  -> refresh calendar entries
  -> sumRecipeNutrients 重新計算當日攝取
```

營養加總縮放：

```js
const baseServings = recipe.recipe_servings || recipe.servings || 1;
const entryServings = recipe.servings_override || recipe.servings || baseServings;
const factor = entryServings / baseServings;
```

然後所有營養素乘上 `factor`。

---

### 3.5 缺口推薦食物細節化

問題：

原本日分析行事曆只顯示：

```text
飽和脂肪酸
1. 中鏈脂肪酸油
2. 椰子油
...
```

資訊太少，不方便營養師判斷。

修正位置：

```text
frontend/src/pages/DailyAnalysisCalendarPage.jsx
frontend/src/utils/driCalculations.js
frontend/src/utils/nutrientRankingFields.js
```

改成表格顯示：

```text
排名
食物名稱
分類
來源
常用份量
含量（unit/100g）
建議份數
```

其中：

- 食物名稱可點擊開詳細營養 modal
- 台灣食品開 `TaiwanFoodModal`
- FooDB 開 `FoodbFoodModal`
- 常用份量使用 API 回傳的 `serving_unit` / `serving_grams`
- 若是 FooDB 且有 matched Taiwan food，優先使用 `matched_taiwan_food` 的份量資訊

建議份數計算：

沿用既有工具：

```js
suggestedServing(gap, contentPer100g, food)
```

公式：

```text
需要克數 = 缺口量 / 每 100g 含量 * 100
```

再依照常用份量換算成：

```text
少量
約 1/4 份
約半份
約 1 份
約 1.5 份
約 2 份
約 N 份
```

---

### 3.6 自選營養素攝取狀況

需求：

使用者除了系統自動推薦缺口，也可以自己查想看的營養素攝取狀況。

修正位置：

```text
frontend/src/pages/DailyAnalysisCalendarPage.jsx
frontend/src/utils/nutrientRankingFields.js
```

新增功能：

1. 分組選單
   - 基本
   - 糖類
   - 礦物質
   - 維生素 A/D/E/K/B 群
   - 脂肪酸
   - 胺基酸
   - 其他

2. 營養素選單
   - 使用 `NUTRIENT_GROUPS`
   - 與「營養素排名」頁共用欄位定義

3. 顯示當日攝取狀況

```text
今日攝取 / 目標 / 缺口
```

4. 查詢推薦食物

```text
GET /health/nutrients/{field}/top-foods?limit=10
```

查詢結果同樣用詳細表格顯示，並提供建議份數。

---

### 3.7 自選營養素查詢結果不同步修正

問題：

切換「自選營養素攝取狀況」的分組或營養素後，畫面上的標題與單位會跟著新選項改變，但表格資料仍保留上一筆查詢結果。

錯誤範例：

```text
選單：糖類 / 半乳糖 (g)
表格：仍顯示上一個營養素查出的魚類結果
表頭：半乳糖，含量 g/100g
結果：看起來不同篩選類別推薦食物都一樣
```

技術原因：

```text
customField 已更新
customFoods 沒有清空
RecommendationTable 使用目前 customField 當表頭
但 foods 仍是上一個 API 結果
```

修正位置：

```text
frontend/src/pages/DailyAnalysisCalendarPage.jsx
```

新增 state：

```js
const [customResultField, setCustomResultField] = useState("");
```

查詢時固定實際查詢欄位，避免非同步回傳時對錯表頭：

```js
async function handleCustomNutrientQuery() {
  if (!customField) return;
  const fieldToQuery = customField;
  try {
    setCustomLoading(true);
    const data = await getNutrientFoods(fieldToQuery, 10);
    setCustomFoods(Array.isArray(data) ? data : data?.foods || []);
    setCustomResultField(fieldToQuery);
  } catch (e) {
    setError("營養素查詢失敗：" + (e.response?.data?.detail || e.message));
    setCustomFoods([]);
    setCustomResultField("");
  } finally {
    setCustomLoading(false);
  }
}
```

切換分組時清空舊結果：

```js
function handleCustomGroupChange(group) {
  setCustomGroup(group);
  const next = NUTRIENT_GROUPS.find((item) => item.group === group);
  if (next?.items?.[0]) setCustomField(next.items[0].field);
  setCustomFoods([]);
  setCustomResultField("");
}
```

切換營養素時清空舊結果：

```js
function handleCustomFieldChange(field) {
  setCustomField(field);
  setCustomFoods([]);
  setCustomResultField("");
}
```

表格顯示時使用實際查詢欄位：

```js
const resultField = customResultField || customField;
const resultMeta = FIELD_LOOKUP[resultField] || getNutrientMeta(resultField);
const resultGap = gapResults.find((gap) => gap.field === resultField);
```

只有真的查詢過且結果欄位存在時才顯示表格：

```js
{customFoods.length > 0 && customResultField && (
  <RecommendationTable
    field={resultField}
    rec={{
      nutrient: resultMeta?.label || resultField,
      unit: resultMeta?.unit || "",
      gap: resultGap?.gap || 0,
      foods: customFoods,
    }}
  />
)}
```

修正後行為：

```text
1. 切換分組/營養素
   -> 舊表格立即消失
2. 按「查詢推薦食物」
   -> API 用目前 customField 查詢
3. API 回來
   -> 表格標題、單位、食物結果都使用同一個 customResultField
```

---

## 4. 詳細 Workflow

### 4.1 統一營養分析 workflow

```text
1. 使用者輸入食譜文字
   |
   v
2. 食材抽取
   - extractIngredientsWithAmounts
   - extractIngredients
   - 停用詞過濾
   |
   v
3. 自動判斷份數
   - detectServingsFromText
   - 使用者可手動修正
   |
   v
4. 食材匹配
   - TaiwanDB
   - FooDB
   - 同義詞字典
   |
   v
5. 份量換算
   - 使用者輸入食材份量
   - parsedAmounts
   - 換算成營養計算可用數值
   |
   v
6. 營養素計算
   - calculateNutrition
   - nutritionResult.total
   - nutritionResult.items
   - nutritionResult.nutrition_detail
   |
   v
7. DRI 分析
   - mapNutritionToIntake
   - buildDriRows
   - calculateDriGap
   |
   v
8. 缺口推薦食物
   - getNutrientFoods
   - DRI_TO_RECOMMEND_FIELD_CANDIDATES
   |
   v
9. 第 6 步儲存
   - inferRecipeTitle
   - saveServings
   - scaleNutritionDetail
   - saveRecipe
   - createDietLog
   - addEntry
```

### 4.2 日分析行事曆 workflow

```text
1. 載入已儲存食譜
   - listRecipes
   |
   v
2. 載入使用者 Profile
   - getProfile
   - age / gender / activity level
   |
   v
3. 載入當月行事曆 entries
   - listEntries(start, end)
   |
   v
4. 選定日期
   - entriesByDate[selectedDate]
   |
   v
5. 加總當日營養
   - sumRecipeNutrients(selectedEntries)
   - recipe_servings
   - servings_override
   |
   v
6. DRI 差距
   - getDriTargets
   - buildDriRows
   - calculateDriGap
   |
   v
7. 缺口推薦
   - 取 deficient / low
   - getNutrientFoods(field, 5)
   - RecommendationTable
   - suggestedServing
   |
   v
8. 自選營養素查詢
   - NUTRIENT_GROUPS
   - FIELD_LOOKUP
   - getNutrientFoods(customField, 10)
   - customResultField 綁定實際查詢欄位
   - 切換選單時清空 customFoods，避免舊結果套新表頭
```

---

### 4.3 實際處理 Workflow：從問題到修正

這一段是給 Ubuntu 實驗室電腦實作時用的「處理 SOP」。重點不是只看功能從哪裡到哪裡，而是說明每個問題如何定位、用什麼技術、改哪些層、怎麼驗證。

整體處理順序：

```text
1. 先重現問題
   - 在瀏覽器操作出錯畫面
   - 確認是哪一頁：統一營養分析 / 日分析行事曆 / 營養素排名
   - 確認是前端顯示錯、API 錯、DB schema 錯、還是容器未更新

2. 找功能入口
   - 用 rg 搜尋畫面文字、API 函式、component 名稱
   - 例如：rg "缺口推薦食物" frontend/src
   - 例如：rg "addEntry|updateEntry|servings_override" frontend/src backend control

3. 看資料流
   - 前端 state 如何變化
   - API request 帶什麼資料
   - control 是否有 proxy
   - backend router 是否有 endpoint
   - repository SQL 是否有欄位
   - DB table 是否真的存在

4. 小範圍修改
   - 不整頁重寫
   - 只改對應函式、state、API wrapper、SQL
   - 修改前先備份

5. Build / API / DB 驗證
   - npm run build
   - docker compose ps
   - docker compose logs
   - 必要時用 curl 測 API

6. 更新 Docker
   - frontend：npm run build 後 docker cp dist
   - backend/control：copy py 檔後 restart
   - DB：ALTER TABLE IF NOT EXISTS

7. 瀏覽器重新測
   - Ctrl + F5
   - 用同一筆測試資料重跑
   - 確認畫面、API、DB 結果一致
```

### 4.4 本次用到的技術 Skill 與角色

| Skill | 用途 | 對應位置 |
|---|---|---|
| 前端狀態追蹤 | 找出 UI 顯示與 state 不一致問題 | `DailyAnalysisCalendarPage.jsx`, `UnifiedAnalysisPage.jsx` |
| React state 設計 | 新增 `saveServings`, `customResultField`，避免舊資料套新表頭 | frontend pages |
| 食譜文字解析 | 修正食譜標題過長、平台雜訊、hashtag | `recipeTitle.js` |
| 營養素資料映射 | DRI 欄位、TaiwanDB 欄位、推薦食物欄位對應 | `driCalculations.js`, `nutrientRankingFields.js` |
| 營養素縮放 | 依份數重新計算 nutrition_detail | `scaleNutritionDetail`, `sumRecipeNutrients` |
| API 串接 | 新增 calendar entry 與 update servings | `calendarApi.js`, routers |
| DB schema migration | 補 `recipe_calendar_entries`, `servings_override` | `backend/database.py`, SQL |
| Docker 部署 | build frontend、copy dist、restart backend/control | Docker compose |
| 回復與備份 | 保留 VS Code history / `_backup_0520_restore` | backup folder |

#### A. 前端狀態追蹤 Skill

使用時機：

```text
畫面顯示內容與使用者選擇不一致。
例如：選半乳糖，但表格仍顯示上一個營養素的魚類結果。
```

處理方式：

```text
1. 找出畫面 component
   rg "自選營養素攝取狀況" frontend/src

2. 找出 state
   customGroup
   customField
   customFoods
   customLoading

3. 找出 render 依賴
   RecommendationTable field={customField}
   rec.foods={customFoods}

4. 判斷 mismatch
   customField 是新值
   customFoods 是舊 API 結果

5. 修正
   - 切換 select 時清空 customFoods
   - 查詢完成後記錄 customResultField
   - table 用 customResultField 顯示標題與單位
```

核心原則：

```text
任何 API 查詢結果都要綁定「實際查詢條件」。
不能只用目前 select state 當表格標題，因為 select 可能已經被使用者改掉。
```

#### B. 食譜文字解析 Skill

使用時機：

```text
食譜名稱抓太長，混入平台文字、hashtag、份量、說讚等資訊。
```

處理方式：

```text
1. 找出所有產生食譜名稱的位置
   rg "recipe_name|food_name|slice\\(0, 50\\)|inferRecipeTitle" frontend/src

2. 把標題解析集中到 util
   frontend/src/utils/recipeTitle.js

3. 設計清理順序
   - normalize 空白
   - 優先抓「食譜名稱：」後方
   - 遇到句號、換行、驚嘆號停止
   - 去掉 hashtag 與平台尾巴
   - 去掉「說讚 / 份量 / 食材 / 材料」
   - 重複菜名只保留第一段

4. 所有儲存入口都改用 inferRecipeTitle(recipeText)
```

核心原則：

```text
不要在每個頁面各自 slice 字串。
標題解析要集中，否則不同功能會產生不同食譜名稱。
```

#### C. 份數與營養縮放 Skill

使用時機：

```text
原食譜是多人份，但使用者實際只吃其中一份。
日分析需要依實際吃的份數計算，而不是永遠用原食譜總量。
```

處理方式：

```text
1. 在統一分析第 6 步新增 saveServings
   - 原始 servings 保留分析用
   - saveServings 代表要儲存/記錄的份數

2. 儲存前計算 factor
   factor = saveServings / originalServings

3. 對 nutrition_detail 全欄位縮放
   scaleNutritionDetail(total, factor)

4. 儲存 saved_recipes
   - servings = saveServings
   - nutrition_detail = storageDetail
   - nutrition = toRecipeMacroNutrition(storageDetail)

5. 加入日分析行事曆
   - addEntry(entryDate, recipeId, saveServings)
```

日分析端：

```text
1. 後端 list_entries 回傳
   - recipe_servings
   - servings_override
   - servings

2. 前端 sumRecipeNutrients 計算
   baseServings = recipe_servings 或 recipe.servings
   entryServings = servings_override 或 servings
   factor = entryServings / baseServings

3. 所有營養素乘 factor
```

核心原則：

```text
原始分析份數、儲存份數、當日食用份數要分清楚。
不要覆蓋原本食譜意義，日分析可用 servings_override 表示當日使用量。
```

#### D. API 與 DB 串接 Skill

使用時機：

```text
前端按鈕成功，但資料沒有真的進日分析；
或 API 500 Internal Server Error；
或 DB table/column 不存在。
```

處理方式：

```text
1. 前端 API wrapper
   frontend/src/api/calendarApi.js

2. control proxy
   control/app/routers/calendar.py

3. backend router
   backend/routers/calendar.py

4. repository SQL
   backend/repositories/calendar_repository.py

5. database init/migration
   backend/database.py
```

檢查順序：

```text
frontend request body
  -> control model 是否接住
  -> backend model 是否接住
  -> repository SQL 是否 insert/update
  -> DB table/column 是否存在
```

這次新增：

```text
POST /calendar/entries
  body.servings -> servings_override

PUT /calendar/entries/{entry_id}
  body.servings -> update servings_override
```

核心原則：

```text
前端新增欄位時，control 與 backend 的 Pydantic model 都要同步。
DB 欄位要用 ALTER TABLE IF NOT EXISTS，避免重跑 migration 爆掉。
```

#### E. 缺口推薦食物 Skill

使用時機：

```text
營養師需要快速知道某缺口營養素該吃什麼，
不能只顯示食物名稱，還要知道含量、來源、份量與建議份數。
```

處理方式：

```text
1. 取得 DRI 缺口
   calculateDriGap(hpaIntake, driRows)

2. 篩選缺口
   status === deficient 或 low

3. 用缺口欄位查高含量食物
   getNutrientFoods(field, limit)

4. 顯示表格
   RecommendationTable
   - 排名
   - 食物名稱
   - 分類
   - 來源
   - 常用份量
   - 每 100g 含量
   - 建議份數

5. 建議份數
   suggestedServing(gap, contentPer100g, food)
```

核心原則：

```text
推薦食物不是只列 Top N。
要能回答「吃多少大概補多少缺口」。
```

#### F. Docker 驗證 Skill

使用時機：

```text
本機檔案改了，但瀏覽器沒有變；
或 build 成功但容器還在跑舊版 dist。
```

處理方式：

```bash
cd ~/recipe-ai/frontend
npm run build

cd ~/recipe-ai
docker cp frontend/dist/. recipe_ai_frontend:/usr/share/nginx/html
```

後端/control 修改：

```bash
docker cp backend/database.py recipe_ai_backend:/app/database.py
docker cp backend/repositories/calendar_repository.py recipe_ai_backend:/app/repositories/calendar_repository.py
docker cp backend/routers/calendar.py recipe_ai_backend:/app/routers/calendar.py
docker cp control/app/routers/calendar.py recipe_ai_control:/app/app/routers/calendar.py

docker compose restart backend control
```

驗證：

```bash
docker compose ps
docker compose logs -f backend
docker compose logs -f control
```

核心原則：

```text
React build 後才會進 dist。
nginx 容器吃的是 dist，不是 src。
所以改 src 後一定要 build + docker cp。
```

### 4.5 各功能的詳細處理流程

#### 4.5.1 食譜名稱過長

```text
問題現象
  食譜名稱顯示整段文案、hashtag、說讚、份量。

定位
  rg "食譜名稱" frontend/src/pages/UnifiedAnalysisPage.jsx
  發現第 6 步摘要仍使用 recipeText.slice(0, 50)

修改
  1. 建立 recipeTitle.js
  2. 新增 inferRecipeTitle()
  3. 第 6 步摘要改用 inferredRecipeTitle
  4. saveRecipe / createDietLog 均使用 inferRecipeTitle

驗證
  輸入含 hashtag 的食譜文字
  第 6 步應只顯示菜名
```

#### 4.5.2 加入今日飲食紀錄沒有進日分析

```text
問題現象
  統一分析按「加入今日飲食紀錄」後，日分析行事曆沒有新增食譜。

定位
  1. 找按鈕 handler：handleCreateDietLog
  2. 發現只呼叫 createDietLog
  3. 沒有呼叫 saveRecipe + addEntry

修改
  1. handleCreateDietLog 先 createDietLog
  2. 再 saveRecipe
  3. 取得 savedRecipe.id
  4. 呼叫 addEntry(today, savedRecipe.id, storageServings)

驗證
  1. 按加入今日飲食紀錄
  2. 到日分析今天日期
  3. 應看到該食譜
```

#### 4.5.3 日分析行事曆份數調整

```text
問題現象
  食譜原本是多人份，日分析不能表示今天只吃 1 人份。

定位
  需要 DB 多存一個當日份數，不應直接改 saved_recipes.servings。

修改
  1. DB 新增 recipe_calendar_entries.servings_override
  2. backend add_entry 支援 servings_override
  3. backend update_entry 支援修改 servings_override
  4. frontend DailyAnalysisCalendarPage 增加今日份數 input
  5. sumRecipeNutrients 依 entryServings/baseServings 縮放

驗證
  1. 同一食譜原始 2 份
  2. 日分析改成 1 份
  3. 熱量與營養素應約減半
```

#### 4.5.4 缺口推薦食物詳細化

```text
問題現象
  缺口推薦只列食物名稱，營養師無法判斷含量與吃多少。

定位
  rg "缺口推薦食物" frontend/src/pages/DailyAnalysisCalendarPage.jsx
  發現原本是 ol/li 簡單列表。

修改
  1. 新增 RecommendationTable
  2. 表格欄位比照 NutrientRankingPage
  3. 引入 TaiwanFoodModal / FoodbFoodModal
  4. 使用 suggestedServing 計算建議份數

驗證
  1. 有 DRI 缺口時，推薦區顯示詳細表格
  2. 點食物名稱可開 modal
  3. 有缺口時顯示建議份數
```

#### 4.5.5 自選營養素查詢結果一直一樣

```text
問題現象
  使用者切換分組/營養素，但推薦食物看起來都一樣。

定位
  1. customField 改了
  2. customFoods 沒清空
  3. 表格使用 customField 顯示表頭
  4. 但 foods 還是上一筆 API 結果

修改
  1. 新增 customResultField
  2. 查詢時 const fieldToQuery = customField
  3. API 回來後 setCustomResultField(fieldToQuery)
  4. 切換 group/field 時 setCustomFoods([]), setCustomResultField("")
  5. RecommendationTable 使用 resultField

驗證
  1. 查詢鈣
  2. 切換半乳糖
  3. 舊表格應消失
  4. 按查詢後才顯示半乳糖結果
```

---

## 5. Ubuntu 實際修改方法

以下假設 Ubuntu 上專案路徑為：

```bash
cd ~/recipe-ai
```

若實際路徑不同，請先切到 `docker-compose.yml` 所在目錄。

### 5.1 修改前備份

務必先做：

```bash
mkdir -p _backup_0520_restore

cp frontend/src/pages/UnifiedAnalysisPage.jsx \
  _backup_0520_restore/UnifiedAnalysisPage.before_0520.jsx

cp frontend/src/pages/DailyAnalysisCalendarPage.jsx \
  _backup_0520_restore/DailyAnalysisCalendarPage.before_0520.jsx

cp frontend/src/utils/recipeTitle.js \
  _backup_0520_restore/recipeTitle.before_0520.js 2>/dev/null || true

cp frontend/src/api/calendarApi.js \
  _backup_0520_restore/calendarApi.before_0520.js

cp backend/database.py \
  _backup_0520_restore/backend_database.before_0520.py

cp backend/repositories/calendar_repository.py \
  _backup_0520_restore/calendar_repository.before_0520.py

cp backend/routers/calendar.py \
  _backup_0520_restore/backend_calendar_router.before_0520.py

cp control/app/routers/calendar.py \
  _backup_0520_restore/control_calendar_router.before_0520.py
```

### 5.2 前端修改檔案

需要同步的檔案：

```text
frontend/src/utils/recipeTitle.js
frontend/src/pages/UnifiedAnalysisPage.jsx
frontend/src/pages/DailyAnalysisCalendarPage.jsx
frontend/src/api/calendarApi.js
frontend/src/utils/recipeNutritionAggregator.js
```

重點修改：

1. `recipeTitle.js`
   - 加強食譜標題擷取。
   - 去除 hashtag、說讚、份量、材料、步驟等尾巴。

2. `UnifiedAnalysisPage.jsx`
   - 第 6 步摘要使用 `inferRecipeTitle(recipeText)`。
   - 新增 `saveServings`。
   - 新增 `scaleNutritionDetail()`。
   - 儲存食譜與加入今日飲食紀錄時使用 `storageServings` 與縮放後營養素。
   - 加入今日飲食紀錄後同步 `addEntry(entryDate, savedRecipe.id, storageServings)`。

3. `DailyAnalysisCalendarPage.jsx`
   - 每筆行事曆 entry 可調整今日份數。
   - 缺口推薦食物改成 `RecommendationTable`。
   - 新增自選營養素查詢。
   - 引入 `NUTRIENT_GROUPS`、`FIELD_LOOKUP`、`suggestedServing`、`TaiwanFoodModal`、`FoodbFoodModal`。
   - 新增 `customResultField`，讓表格資料與實際查詢欄位綁定。
   - `handleCustomGroupChange()` / `handleCustomFieldChange()` 需清空 `customFoods`，避免顯示上一筆查詢結果。

4. `calendarApi.js`
   - `addEntry(entryDate, recipeId, servings)`
   - `updateEntry(entryId, data)`

5. `recipeNutritionAggregator.js`
   - 依 `recipe_servings` 與 `servings_override` 縮放營養素。

### 5.3 後端修改檔案

需要同步的檔案：

```text
backend/database.py
backend/repositories/calendar_repository.py
backend/routers/calendar.py
control/app/routers/calendar.py
```

重點修改：

1. `backend/database.py`
   - 確保 `recipe_calendar_entries` 存在。
   - 確保 `servings_override NUMERIC(10,2)` 存在。
   - 確保 `diet_logs` 缺失欄位會補上。

2. `backend/repositories/calendar_repository.py`
   - `list_entries()` 回傳 `recipe_servings`、`servings_override`、`servings`。
   - `add_entry()` 可寫入 `servings_override`。
   - 新增 `update_entry()` 修改 `servings_override`。

3. `backend/routers/calendar.py`
   - `EntryCreateIn` 新增 `servings`。
   - 新增 `EntryUpdateIn`。
   - `POST /calendar/entries` 支援份數。
   - `PUT /calendar/entries/{entry_id}` 支援更新份數。

4. `control/app/routers/calendar.py`
   - 同步轉發 `servings`。
   - 新增 `PUT /calendar/entries/{entry_id}` proxy。

### 5.4 資料庫 migration

若 Ubuntu DB 尚未有欄位，執行：

```bash
docker compose exec postgres psql -U postgres -d recipe_ai -c \
"ALTER TABLE recipe_calendar_entries ADD COLUMN IF NOT EXISTS servings_override NUMERIC(10,2);"
```

若 `recipe_calendar_entries` 表不存在，需由 `backend/database.py` 初始化建立，或手動建立：

```sql
CREATE TABLE IF NOT EXISTS recipe_calendar_entries (
  id SERIAL PRIMARY KEY,
  user_id INTEGER NOT NULL,
  recipe_id INTEGER NOT NULL,
  entry_date DATE NOT NULL,
  servings_override NUMERIC(10,2),
  sort_order INTEGER DEFAULT 0,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
```

---

## 6. Ubuntu 部署流程

### 6.1 重新 build 前端

```bash
cd ~/recipe-ai/frontend
npm run build
```

成功會看到：

```text
✓ built
```

### 6.2 更新 Docker 前端容器

如果使用目前開發方式，將 build 出來的 dist 複製進 nginx：

```bash
cd ~/recipe-ai
docker cp frontend/dist/. recipe_ai_frontend:/usr/share/nginx/html
```

瀏覽器使用：

```text
Ctrl + F5
```

強制重新整理。

### 6.3 更新 backend/control 容器程式碼

若容器內不是 volume 掛載，而是需要手動 copy：

```bash
cd ~/recipe-ai

docker cp backend/database.py recipe_ai_backend:/app/database.py
docker cp backend/repositories/calendar_repository.py recipe_ai_backend:/app/repositories/calendar_repository.py
docker cp backend/routers/calendar.py recipe_ai_backend:/app/routers/calendar.py
docker cp control/app/routers/calendar.py recipe_ai_control:/app/app/routers/calendar.py

docker compose restart backend control
```

若 Ubuntu 是 volume 掛載模式，則修改本機檔案後直接：

```bash
docker compose restart backend control
```

### 6.4 檢查容器狀態

```bash
docker compose ps
```

### 6.5 查看 log

```bash
docker compose logs -f backend
docker compose logs -f control
docker compose logs -f frontend
```

---

## 7. 驗證流程

### 7.1 統一營養分析驗證

1. 開啟：

```text
http://localhost:3001
```

2. 到「統一營養分析」。
3. 輸入含平台雜訊的食譜，例如：

```text
土耳其雞肉飯 土耳其雞肉飯 #雞肉 #高蛋白 #鷹嘴豆 #土耳其料理 1 說讚 份量 2
```

4. 完成食材抽取、匹配、營養計算。
5. 到第 6 步確認：
   - 食譜名稱應顯示 `土耳其雞肉飯`
   - 原始份數顯示分析份數
   - 可修改「要儲存/記錄的份數」
   - 儲存熱量會跟著份數變化

6. 點「加入今日飲食紀錄」。
7. 到「日分析」確認今日行事曆有新增該食譜。

### 7.2 日分析份數驗證

1. 到「日分析」。
2. 選今天。
3. 找到剛加入的食譜。
4. 修改「今日份數」。
5. 確認：
   - 當日營養加總重新變化。
   - DRI 差距重新變化。
   - 缺口推薦食物重新載入。

### 7.3 缺口推薦食物驗證

1. 日分析頁選有食譜的日期。
2. 查看「缺口推薦食物」。
3. 表格應包含：
   - 排名
   - 食物名稱
   - 分類
   - 來源
   - 常用份量
   - 含量
   - 建議份數

4. 點台灣食品名稱，應開啟台灣食品營養詳細 modal。
5. 若來源是 FooDB，應開啟 FooDB modal。

### 7.4 自選營養素查詢驗證

1. 日分析頁找到「自選營養素攝取狀況」。
2. 選擇分組，例如「礦物質」。
3. 選擇營養素，例如「鈣」。
4. 點「查詢推薦食物」。
5. 應顯示：
   - 今日攝取 / 目標 / 缺口
   - 推薦食物表格
   - 若有 DRI 缺口，會顯示建議份數

---

## 8. API 與資料格式

### 8.1 新增行事曆 entry

Frontend：

```js
addEntry(entryDate, recipeId, servings)
```

Request：

```json
{
  "entry_date": "2026-05-20",
  "recipe_id": 36,
  "servings": 1
}
```

### 8.2 更新行事曆 entry 份數

Frontend：

```js
updateEntry(entryId, { servings: 1.5 })
```

Request：

```json
{
  "servings": 1.5
}
```

### 8.3 查詢營養素推薦食物

```http
GET /health/nutrients/{field}/top-foods?limit=10
```

回傳欄位會用到：

```text
id
name / food_name
category
source
content_per_100g
standard_content
serving_unit
serving_grams
matched_taiwan_food
```

---

## 9. 已知注意事項

1. 前端若看起來沒更新，先按 `Ctrl + F5`。
2. 若 Docker 每次啟動下載大量東西，通常是 image/build cache 或 volume 狀態造成，需要用 `docker system df` 檢查。
3. 不要直接 `docker system prune -a`，會刪掉未使用 images，之後可能又要重抓。
4. 目前 GraphRAG / Gemma 若未啟動，和本文件中的日分析、營養素推薦主流程無直接關係，但 AI advisor 相關功能可能受影響。
5. 修改 `UnifiedAnalysisPage.jsx` 時禁止整頁重寫，該頁保留大量原始流程，應用小 patch。

---

## 10. 回復方式

本次 Windows 環境已建立備份：

```text
_backup_0520_restore/
  UnifiedAnalysisPage.vscode-history-Z1FQ.jsx
  UnifiedAnalysisPage.current.jsx
  DailyAnalysisCalendarPage.current.jsx
```

Ubuntu 實作前也應建立自己的備份。

若要回復單一檔案：

```bash
cp _backup_0520_restore/UnifiedAnalysisPage.before_0520.jsx \
  frontend/src/pages/UnifiedAnalysisPage.jsx

npm --prefix frontend run build
docker cp frontend/dist/. recipe_ai_frontend:/usr/share/nginx/html
```

若後端 API 有問題：

```bash
cp _backup_0520_restore/calendar_repository.before_0520.py \
  backend/repositories/calendar_repository.py

docker compose restart backend control
```

---

## 11. 建議後續

1. 將本專案初始化 git 或確認 `.git` 所在位置。
2. 每次修改前先建立 branch，例如：

```bash
git checkout -b feature/0520-recipe-ai-optimization
```

3. 每完成一個功能點就 commit：

```bash
git add frontend/src/pages/DailyAnalysisCalendarPage.jsx
git commit -m "Improve daily nutrient gap food recommendations"
```

4. 避免再靠 VS Code History 當唯一回復來源。
