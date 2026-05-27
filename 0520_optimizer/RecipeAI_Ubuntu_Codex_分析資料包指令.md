# RecipeAI Ubuntu Codex 分析資料包指令

> 目的：`0520_recipe_ai_optimization_record.md` 是優化紀錄 / 實作計畫，不是最終分析報告。  
> 本輪請 Ubuntu Codex 根據該優化紀錄與目前 Ubuntu 專案實際狀態，產生「可交給 GPT 撰寫 Word 書面成果」的分析資料包。  
> 重要：本輪不要產生 Word、不要產生 PDF、不要重排論文、不要自由修改正式程式碼。

---

## 0. 執行原則

1. `0520_recipe_ai_optimization_record.md` 只能當作「優化目標與修改紀錄參考」。
2. 請比對該紀錄與目前 Ubuntu 專案實際程式碼，判斷哪些已實作、哪些未實作、哪些待確認。
3. 不要把 0520 紀錄中的內容直接當成已完成成果。
4. 所有結論都必須能追溯到：
   - 程式檔案路徑
   - API route
   - DB schema / SQL 查詢
   - 現有截圖
   - smoke test 結果
   - 或明確標註「目前未找到 / 待確認」
5. 不要編造實驗結果。
6. 不要編造 HackMD / GitHub / DEMO 影片連結。
7. 不要把 TODO 寫成已完成。
8. 不要把 Gemma 4 說成直接產生營養數值。Gemma 4 只能寫成食材校正、搜尋詞增強、候選驗證與 Advisor 輔助。

---

## 1. 輸出資料夾

請產生以下資料夾與檔案：

```text
recipeai_analysis_pack/
├── 00_analysis_summary.md
├── 01_project_inventory.md
├── 02_0520_plan_vs_current_status.md
├── 03_current_system_features.md
├── 04_missing_data_for_paper.md
├── 05_database_schema_and_counts.md
├── 05_database_schema.csv
├── 06_api_routes_and_smoke_tests.md
├── 06_api_smoke_test_results.csv
├── 07_recipe_parsing_and_matching_analysis.md
├── 08_unit_conversion_analysis.md
├── 09_gemma4_status_and_prompt_analysis.md
├── 10_experiment_feasibility_plan.md
├── 10_recipe_parsing_gold_template.csv
├── 10_unit_conversion_gold_template.csv
├── 10_food_matching_gold_template.csv
├── 10_gemma_on_off_comparison_template.csv
├── 11_demo_case_plan.md
├── 12_hackmd_and_demo_script_plan.md
└── 13_gpt_handoff_summary.md
```

---

## 2. 00_analysis_summary.md

請用 1–2 頁整理目前 Ubuntu 專案狀態。

必須包含：

1. 此次分析依據哪些檔案。
2. `0520_recipe_ai_optimization_record.md` 中哪些項目已在目前專案找到對應實作。
3. 哪些項目目前沒有找到。
4. 哪些項目只找到部分實作。
5. 哪些資料可以直接交給 GPT 寫 Word。
6. 哪些資料仍需人工補。
7. 哪些內容只能寫成「後續工作 / 預期實驗」。

---

## 3. 01_project_inventory.md

請掃描目前專案目錄，整理專案結構。

請列出：

- 專案根目錄
- 是否有 git
- frontend 主要資料夾
- control service 主要資料夾
- backend 主要資料夾
- database / migration 相關檔案
- docker-compose 檔案
- 環境變數檔案是否存在，但不要輸出敏感內容
- 測試資料、截圖、MD 文件位置

請用表格：

| 類別 | 路徑 | 用途 | 是否存在 | 備註 |
|---|---|---|---|---|

---

## 4. 02_0520_plan_vs_current_status.md

請把 `0520_recipe_ai_optimization_record.md` 當成優化計畫，逐項比對目前實作。

請至少檢查以下項目：

1. 食譜名稱擷取修正
   - `frontend/src/utils/recipeTitle.js`
   - `inferRecipeTitle`
   - hashtag / 說讚 / 份量 / 材料 / 步驟 清除

2. 第 6 步儲存 / 記錄份數
   - `saveServings`
   - `scaleNutritionDetail()`
   - `storageServings`
   - 儲存食譜時是否寫入 servings / nutrition_detail

3. 今日飲食紀錄同步日分析行事曆
   - `createDietLog`
   - `saveRecipe`
   - `addEntry(entryDate, savedRecipe.id, storageServings)`

4. 日分析行事曆可調整每筆食譜份數
   - `recipe_calendar_entries`
   - `servings_override`
   - `recipe_servings`
   - `sumRecipeNutrients`

5. 缺口推薦食物細節化
   - `RecommendationTable`
   - 食物名稱、分類、來源、常用份量、含量、建議份數
   - `suggestedServing()`

6. 自選營養素攝取狀況
   - `NUTRIENT_GROUPS`
   - `FIELD_LOOKUP`
   - `getNutrientFoods(customField, 10)`

7. 自選營養素查詢結果不同步修正
   - `customResultField`
   - `handleCustomGroupChange()`
   - `handleCustomFieldChange()`
   - `handleCustomNutrientQuery()`
   - 是否切換選單後清空舊結果

8. 後端 / control / DB 變更
   - `backend/database.py`
   - `backend/repositories/calendar_repository.py`
   - `backend/routers/calendar.py`
   - `control/app/routers/calendar.py`
   - `servings_override`
   - `POST /calendar/entries`
   - `PUT /calendar/entries/{entry_id}`

請用表格：

| 0520 計畫項目 | 目前實作狀態 | 證據檔案 / 函式 | 可寫進 paper？ | 備註 |
|---|---|---|---|---|

狀態只能用：
- 已實作
- 部分實作
- 未找到
- 待確認

---

## 5. 03_current_system_features.md

請整理目前系統已有哪些功能。

表格欄位：

| 功能 | 是否已實作 | 前端檔案 | API route | DB table | 可截圖證據 | 限制 |
|---|---|---|---|---|---|---|

至少檢查：

- 登入
- 個人資料
- 統一營養分析
- 食譜輸入
- 食譜名稱擷取
- 食材抽取
- 停用詞
- 自動判斷份數
- 食材匹配
- 單位 / 份量換算
- 營養分析
- DRI 缺口分析
- 改善建議
- 儲存 / 記錄份數
- 今日飲食紀錄
- 日分析行事曆
- 每筆食譜當日份數調整
- 缺口推薦食物詳細表格
- 自選營養素查詢
- 食物搜尋
- 化合物搜尋
- 營養素 ranking
- Advisor / Gemma 4
- SSE streaming status

---

## 6. 04_missing_data_for_paper.md

請整理目前書面成果缺哪些資料。

請分成三類：

### A. 寫 Word 必須補的資料

例如：
- 固定展示食譜案例
- 系統截圖
- 操作流程連結
- DB table counts
- API route 對照

### B. 可寫成後續工作 / 實驗設計的資料

例如：
- 食材擷取 Precision / Recall / F1
- 單位解析成功率
- 食材匹配 Top-1 / Top-3
- Gemma 4 開 / 關比較
- 人工查表比較
- 使用者測試

### C. 不可以寫成已完成的資料

例如：
- DEMO 影片完成
- 正式 HackMD / GitHub 連結
- 食材擷取準確率已完成
- Gemma 4 有顯著改善
- 營養師正式評估結果

---

## 7. 05_database_schema_and_counts.md / CSV

請實際查 PostgreSQL，不要猜。

輸出：

1. `05_database_schema_and_counts.md`
2. `05_database_schema.csv`

CSV 欄位：

```csv
table_name,column_name,data_type,is_primary_key,is_foreign_key,nullable,description,used_by_module
```

請至少檢查：

- taiwan_foods
- foodb_foods
- foodb_contents
- foodb_compounds
- foodb_health_effects
- saved_recipes
- diet_logs
- recipe_calendar_entries
- users
- profiles
- synonym / alias 相關表
- DRI 相關資料表或 JSON
- nutrient ranking 相關資料來源

另外請輸出 table counts。

如果某張表不存在，請寫「目前未找到」，不要編造。

---

## 8. 06_api_routes_and_smoke_tests.md / CSV

請掃描 FastAPI routes，並實際跑可安全執行的 smoke test。

輸出：

1. `06_api_routes_and_smoke_tests.md`
2. `06_api_smoke_test_results.csv`

API route 表格欄位：

| API route | Method | Input | Output | 對應功能 | 對應 DB | 程式檔案 | 是否已實作 |
|---|---|---|---|---|---|---|---|

smoke test CSV 欄位：

```csv
test_name,endpoint,method,status_code,elapsed_ms,success,response_summary,error
```

至少測：

- analysis page reachable
- advisor page reachable
- backend health
- control health
- food search
- nutrient ranking
- DRI gap
- calendar entries
- saved recipes
- profile
- Gemma status

若失敗，請保留失敗結果，不要刪除。

---

## 9. 07_recipe_parsing_and_matching_analysis.md

請分析目前食譜解析與匹配流程。

需包含：

1. 輸入格式
2. 食譜名稱擷取
3. 停用詞
4. 食材抽取
5. 份量與單位解析
6. 自動判斷份數
7. 食材匹配
8. TaiwanDB / FooDB 優先順序
9. alias / synonym mapping
10. fuzzy match / pg_trgm / BM25 / embedding 是否實作
11. Gemma 4 是否參與搜尋詞增強或候選驗證
12. 輸出格式
13. 已知失敗案例
14. 可寫進 paper 的段落建議

請標註每一步的程式檔案與函式名稱。

---

## 10. 08_unit_conversion_analysis.md

請整理目前支援哪些單位與份量。

表格欄位：

| 單位 / 量詞 | 類型 | 轉換方式 | 是否固定值 | 是否需估計 | 程式來源 | 限制 |
|---|---|---|---|---|---|---|

至少檢查：

- 克 / g
- 毫升 / ml
- 碗
- 匙
- 湯匙
- 茶匙
- 顆
- 片
- 份
- 半
- 1/2
- 少許
- 適量
- 中文數字
- 英文單位

---

## 11. 09_gemma4_status_and_prompt_analysis.md

請分析 Gemma 4 整合狀態。

表格欄位：

| 項目 | 內容 | 證據 | 備註 |
|---|---|---|---|

請檢查：

- Gemma 4 是否部署於 Ubuntu
- Advisor URL 是否可連線
- 是否 OpenAI-compatible endpoint
- 模型名稱
- prompt 檔案位置
- system prompt
- tool routing prompt
- 食材校正 prompt
- 搜尋詞增強 prompt
- 候選驗證 prompt
- fallback 機制
- SSE status
- 是否有防止 LLM 直接編造營養數值的限制

如果找不到 prompt，請寫「目前未找到 Gemma 4 prompt」，不要編造。

---

## 12. 10_experiment_feasibility_plan.md 與 CSV 模板

請產生：

- `10_recipe_parsing_gold_template.csv`
- `10_unit_conversion_gold_template.csv`
- `10_food_matching_gold_template.csv`
- `10_gemma_on_off_comparison_template.csv`

### 12.1 食材擷取測試模板

CSV 欄位：

```csv
case_id,input_recipe_text,expected_ingredient_list,expected_quantity_list,expected_unit_list,source,annotation_status,notes
```

### 12.2 單位轉換測試模板

CSV 欄位：

```csv
case_id,input_phrase,expected_amount,expected_unit,expected_grams,conversion_type,annotation_status,notes
```

### 12.3 食材匹配測試模板

CSV 欄位：

```csv
case_id,input_ingredient,expected_taiwandb_match,expected_foodb_match,expected_top1_source,annotation_status,notes
```

### 12.4 Gemma 4 開關比較模板

CSV 欄位：

```csv
case_id,input_text,baseline_method,gemma_enabled,output_ingredients,top_candidates,manual_judgement,improvement_type,notes
```

annotation_status 只能用：
- confirmed
- needs_manual_review
- generated_template

generated_template 不能寫成正式實驗資料。

---

## 13. 11_demo_case_plan.md

請設計 3 組固定展示案例。

每組包含：

- case name
- input recipe text
- 預期展示流程
- 會用到的頁面
- 預期截圖
- DEMO 影片片段建議
- 風險與備援

案例建議：

1. 簡單案例：雞胸肉、白飯、青菜
2. 複雜案例：土耳其雞肉飯，含 hashtag / 平台雜訊 / 份量
3. DRI 缺口案例：能展示缺口推薦食物與份數建議

---

## 14. 12_hackmd_and_demo_script_plan.md

請整理 HackMD / GitHub 操作說明草稿應包含什麼。

需包含：

- 系統定位
- 展示前準備
- 登入與首頁
- 食譜輸入與整合分析
- DRI 缺口分析
- 食物推薦與 ranking
- Advisor / Gemma 4
- 日分析行事曆
- 現場失敗備援
- DEMO 影片建議流程

若目前沒有正式連結，請寫 TODO。

---

## 15. 13_gpt_handoff_summary.md

這份最重要。請整理給 GPT 的交接摘要。

請分成：

### 15.1 可直接寫進 Word 的資料

例如：
- 系統功能
- 0520 優化內容
- 資料庫 schema
- API routes
- Gemma 4 用途
- 資料來源權威性與限制
- 公式
- 系統限制
- 預期實驗設計

### 15.2 建議放 Appendix 的資料

例如：
- 完整 DB schema
- 完整 API routes
- 完整 smoke test
- 全部截圖
- 詳細操作流程
- 測試 CSV 模板

### 15.3 建議放 HackMD / DEMO 的資料

例如：
- 操作流程
- 圖文教學
- 展示帳號
- DEMO 影片
- 失敗備援截圖

### 15.4 不能寫成已完成的資料

例如：
- Precision / Recall / F1
- Top-1 / Top-3
- Gemma 4 開關比較
- 人工查表誤差
- 使用者測試
- DEMO 影片
- 正式 HackMD / GitHub 連結

---

## 16. 最後回報格式

完成後請回報：

1. 已產生的檔案清單
2. 哪些資料可直接給 GPT 寫 Word
3. 哪些資料仍需人工標註
4. 哪些資料還缺截圖
5. 哪些資料還缺 DEMO
6. 哪些項目與 0520 優化紀錄不一致
7. 哪些內容無法確認

請不要只回覆「完成」。
