# Recipe-AI 系統工作流程

## 系統總覽

本文件只收錄可由程式碼直接驗證的內容，並聚焦四個功能：整合分析、症狀搜尋、DRI 分析、個人資料。

| 層級 | 作用 | 可驗證檔案 |
|---|---|---|
| Frontend | 入口路由、畫面呈現、部分本地計算 | [frontend/src/App.jsx](frontend/src/App.jsx), [frontend/src/components/layout/Navbar.jsx](frontend/src/components/layout/Navbar.jsx), [frontend/src/pages/UnifiedAnalysisPage.jsx](frontend/src/pages/UnifiedAnalysisPage.jsx), [frontend/src/pages/SymptomSearchPage.jsx](frontend/src/pages/SymptomSearchPage.jsx), [frontend/src/pages/DriGapPage.jsx](frontend/src/pages/DriGapPage.jsx), [frontend/src/pages/ProfilePage.jsx](frontend/src/pages/ProfilePage.jsx) |
| Control | API 編排、規則擷取、symptom mapping、DRI metadata、停用詞 / 同義詞管理 | [control/app/routers/recipe.py](control/app/routers/recipe.py), [control/app/routers/health.py](control/app/routers/health.py), [control/app/routers/profile.py](control/app/routers/profile.py), [control/app/routers/dri.py](control/app/routers/dri.py), [control/app/services/ai_service.py](control/app/services/ai_service.py), [control/app/services/reverse_search_service.py](control/app/services/reverse_search_service.py), [control/app/services/symptom_service.py](control/app/services/symptom_service.py), [control/app/services/dri_gap_service.py](control/app/services/dri_gap_service.py) |
| NLP Modules | 規則抽取、斷詞、症狀對照、同義詞展開、停用詞熱更新 | [control/app/services/ai_service.py](control/app/services/ai_service.py), [control/app/services/reverse_search_service.py](control/app/services/reverse_search_service.py), [control/app/services/symptom_service.py](control/app/services/symptom_service.py), [control/app/services/synonym_expander.py](control/app/services/synonym_expander.py), [control/app/services/stopword_store.py](control/app/services/stopword_store.py) |
| Backend | 實際 SQL 查詢、排序、聚合、資料存取 | [backend/repositories/health_repository.py](backend/repositories/health_repository.py), [backend/repositories/food_repository.py](backend/repositories/food_repository.py), [backend/repositories/user_repository.py](backend/repositories/user_repository.py) |
| Databases | Postgres 實體表與資料來源 | `recipe_ai_db`、`taiwan_foods`、`foods`、`recipes`、`profiles`、`foodb_*` tables |
| Resources / JSON | canonical DRI、nutrient mapping、停用詞、同義詞、症狀對照 | [control/resources/hpa_dri_v8.json](control/resources/hpa_dri_v8.json), [backend/resources/nutrient_field_map.json](backend/resources/nutrient_field_map.json), [control/resources/stopwords.json](control/resources/stopwords.json), [control/resources/food_synonym_dict.json](control/resources/food_synonym_dict.json), [control/resources/symptom_mapping.json](control/resources/symptom_mapping.json) |

## 功能節點表

| 功能 | Frontend 入口 | Control 中介 | Backend 依賴 | 輸出 |
|---|---|---|---|---|
| 整合分析 | `/analysis` → [UnifiedAnalysisPage.jsx](frontend/src/pages/UnifiedAnalysisPage.jsx) | recipe router + ai_service + reverse_search_service + stopword store | food_repository + health_repository + user_repository | 食材解析、比對、營養計算、DRI 缺口、推薦食物 |
| 症狀搜尋 | `/symptom-search` → [SymptomSearchPage.jsx](frontend/src/pages/SymptomSearchPage.jsx) | symptom_service + health router | health_repository | 症狀對應 effects、compounds、foods |
| DRI 分析 | `/dri-gap` → [DriGapPage.jsx](frontend/src/pages/DriGapPage.jsx) | dri router + dri_gap_service | health_repository | DRI rows、gap、top foods |
| 個人資料 | `/profile` → [ProfilePage.jsx](frontend/src/pages/ProfilePage.jsx) | profile router | user_repository | 個人資料、BMI、熱量、攝取進度 |

## API / 路由表

| 層級 | 路由 | 作用 | 證據 |
|---|---|---|---|
| Frontend | `/analysis` | 整合分析頁 | [frontend/src/App.jsx](frontend/src/App.jsx) |
| Frontend | `/symptom-search` | 症狀搜尋頁 | [frontend/src/App.jsx](frontend/src/App.jsx) |
| Frontend | `/dri-gap` | DRI 分析頁 | [frontend/src/App.jsx](frontend/src/App.jsx) |
| Frontend | `/profile` | 個人資料頁 | [frontend/src/App.jsx](frontend/src/App.jsx) |
| Control | `POST /recipe/extract` | 規則擷取食材 | [control/app/routers/recipe.py](control/app/routers/recipe.py) |
| Control | `POST /recipe/extract-with-amounts` | 擷取食材與用量 | [control/app/routers/recipe.py](control/app/routers/recipe.py) |
| Control | `POST /recipe/lookup` | 食材候選比對 | [control/app/routers/recipe.py](control/app/routers/recipe.py) |
| Control | `POST /recipe/calculate-nutrition` | 營養換算 | [control/app/routers/recipe.py](control/app/routers/recipe.py) |
| Control | `POST /recipe/save` | 儲存食譜 | [control/app/routers/recipe.py](control/app/routers/recipe.py) |
| Control | `POST /recipe/reverse-search` | 反向搜尋 | [control/app/routers/recipe.py](control/app/routers/recipe.py) |
| Control | `POST /health/symptom-search` | 症狀查詢主 API | [control/app/routers/health.py](control/app/routers/health.py) |
| Control | `POST /health/symptom-lookup` | 症狀對應 effect / foods | [control/app/routers/health.py](control/app/routers/health.py) |
| Control | `GET /health/nutrients/{field}/top-foods` | 營養推薦食物 | [control/app/routers/health.py](control/app/routers/health.py) |
| Control | `POST /health/dri-gap` | DRI gap 分析 | [control/app/routers/health.py](control/app/routers/health.py) |
| Control | `GET /dri/fields` | DRI 欄位 metadata | [control/app/routers/dri.py](control/app/routers/dri.py) |
| Control | `GET /profile` / `PUT /profile` | 個人資料讀寫 | [control/app/routers/profile.py](control/app/routers/profile.py) |
| Control | `POST /stopwords/bulk` / `DELETE /stopwords/{word}` | 停用詞熱更新 | [control/app/routers/stopwords.py](control/app/routers/stopwords.py) |
| Control | `GET /synonym-dict/*` | 同義詞字典與 pipeline | [control/app/routers/synonym_dict.py](control/app/routers/synonym_dict.py) |

## Service / Repository 對照表

| Service / Repository | 責任 | 主要使用情境 | 備註 |
|---|---|---|---|
| `ai_service.py` | 規則式食材擷取、垃圾詞過濾、停用詞檢查 | 整合分析的前段 | 沒有看到 LLM 自主決策 |
| `reverse_search_service.py` | direct match → jieba → backend 搜尋 | 整合分析 / 反向搜尋 | 明確 fallback chain |
| `symptom_service.py` | 症狀文字 → effect names → backend symptom lookup | 症狀搜尋 | 先 mapping，後直接查詢 |
| `dri_gap_service.py` | 載入 HPA v8 canonical DRI、計算缺口、查推薦食物 | DRI 分析 | unsupported 項目不算 gap |
| `stopword_store.py` | JSON 停用詞存取、cache、atomic write | 整合分析 / 反向搜尋 | runtime hot update |
| `synonym_expander.py` | 同義詞展開與合併 | 同義詞字典維護 | 屬於 NLP module，不是模型推論 |
| `health_repository.py` | health effects / compounds / top foods / nutrient ranking | 症狀搜尋、DRI 推薦 | exact → ILIKE → trigram、batch 排序 |
| `food_repository.py` | 食材搜尋與模糊比對 | 整合分析 | taiwan_foods / foods 雙資料源 |
| `user_repository.py` | profile CRUD | 個人資料 | `profiles` 表 |

## 資料庫與資源表

| 類型 | 名稱 / 檔名 | 用途 |
|---|---|---|
| Postgres | `recipe_ai_db` | 主資料庫 |
| Table | `taiwan_foods` | 台灣食物與每 100g 營養欄位 |
| Table | `foods` | FooDB 食物資料 |
| Table | `foodb_nutrients` | FooDB 營養來源 |
| Table | `foodb_contents` | 成分內容 |
| Table | `foodb_compounds` | 化合物 |
| Table | `foodb_health_effects` | 健康效果 |
| Table | `recipes` | 使用者儲存食譜與 nutrition detail |
| Table | `profiles` | 使用者個人資料 |
| JSON | `control/resources/hpa_dri_v8.json` | HPA 第八版 canonical DRI |
| JSON | `backend/resources/nutrient_field_map.json` | nutrient key → DB 欄位白名單 |
| JSON | `control/resources/stopwords.json` | 動態停用詞字典 |
| JSON | `control/resources/food_synonym_dict.json` | 食材同義詞字典 |
| JSON | `control/resources/symptom_mapping.json` | 症狀 → effect names 對照表 |

## 主要流程表

| 功能 | 前端入口 | 後端 API | 中介 service | 資料來源 | 輸出結果 |
|---|---|---|---|---|---|
| 整合分析 | `UnifiedAnalysisPage` | `/recipe/extract`, `/recipe/extract-with-amounts`, `/recipe/lookup`, `/recipe/calculate-nutrition`, `/health/nutrients/{field}/top-foods`, `/stopwords/bulk`, `/stopwords/{word}`, `/profile` | `ai_service`, `reverse_search_service`, `stopword_store` | `taiwan_foods`, `foods`, `recipes`, `profiles`, `stopwords.json`, `food_synonym_dict.json` | 食材清單、候選匹配、營養總計、DRI 缺口、推薦食物 |
| 症狀搜尋 | `SymptomSearchPage` | `/health/symptom-search`, `/health/symptom-lookup` | `symptom_service` | `symptom_mapping.json`, `foodb_health_effects`, `foodb_compounds`, `foodb_contents` | effects、compounds、top foods |
| DRI 分析 | `DriGapPage` | `/dri/fields`, `/health/dri-gap`, `/health/nutrients/{field}/top-foods` | `dri_gap_service` | `hpa_dri_v8.json`, `nutrient_field_map.json`, `taiwan_foods`, `foods` | DRI rows、缺口、推薦食物 |
| 個人資料 | `ProfilePage` | `/profile`, `/diet/logs`, `/recipes` | `profile router` | `profiles`, `recipes`, `diet_logs` | BMI、熱量區間、攝取進度、DRI 進度 |

## 各功能實作說明

### 整合分析

- 前端入口：[frontend/src/pages/UnifiedAnalysisPage.jsx](frontend/src/pages/UnifiedAnalysisPage.jsx)
- 後端 API：recipe extract / lookup / calculate-nutrition、stopwords bulk CRUD、nutrient top-foods、profile
- 中介 service：規則式擷取、反向搜尋、停用詞熱更新
- 資料來源：`taiwan_foods`、`foods`、`recipes`、`profiles`、`stopwords.json`、`food_synonym_dict.json`
- 輸出結果：食材解析、候選食材、營養換算、DRI 缺口、推薦食物
- 規則 / 檢索 / 聚合：擷取是規則，候選是檢索，營養與推薦是聚合

### 症狀搜尋

- 前端入口：[frontend/src/pages/SymptomSearchPage.jsx](frontend/src/pages/SymptomSearchPage.jsx)
- 後端 API：`/health/symptom-search`, `/health/symptom-lookup`
- 中介 service：`symptom_service.py`
- 資料來源：`symptom_mapping.json`、`foodb_health_effects`、`foodb_compounds`、`foodb_contents`
- 輸出結果：effects、compounds、推薦食物
- 規則 / 檢索 / 聚合：mapping 與部分比對是規則，effect / compound / food 是檢索與排序

### DRI 分析

- 前端入口：[frontend/src/pages/DriGapPage.jsx](frontend/src/pages/DriGapPage.jsx)
- 後端 API：`/dri/fields`, `/health/dri-gap`, `/health/nutrients/{field}/top-foods`
- 中介 service：`dri_gap_service.py`
- 資料來源：`hpa_dri_v8.json`、`nutrient_field_map.json`、`taiwan_foods`、`foods`
- 輸出結果：DRI rows、缺口、推薦食物
- 規則 / 檢索 / 聚合：DRI target selection 是規則，gap 計算是本地聚合，推薦食物是 backend 檢索與排序

### 個人資料

- 前端入口：[frontend/src/pages/ProfilePage.jsx](frontend/src/pages/ProfilePage.jsx)
- 後端 API：`/profile`、`/diet/logs`、`/recipes`
- 中介 service：profile router
- 資料來源：`profiles`、`recipes`、`diet_logs`
- 輸出結果：BMI、熱量建議、今日攝取、營養進度
- 規則 / 檢索 / 聚合：熱量估算與營養進度是前端本地計算，資料讀取來自 backend

## 可驗證依據

- [frontend/src/App.jsx](frontend/src/App.jsx)
- [frontend/src/components/layout/Navbar.jsx](frontend/src/components/layout/Navbar.jsx)
- [frontend/src/pages/UnifiedAnalysisPage.jsx](frontend/src/pages/UnifiedAnalysisPage.jsx)
- [frontend/src/pages/SymptomSearchPage.jsx](frontend/src/pages/SymptomSearchPage.jsx)
- [frontend/src/pages/DriGapPage.jsx](frontend/src/pages/DriGapPage.jsx)
- [frontend/src/pages/ProfilePage.jsx](frontend/src/pages/ProfilePage.jsx)
- [control/app/routers/recipe.py](control/app/routers/recipe.py)
- [control/app/routers/health.py](control/app/routers/health.py)
- [control/app/routers/profile.py](control/app/routers/profile.py)
- [control/app/routers/dri.py](control/app/routers/dri.py)
- [control/app/services/ai_service.py](control/app/services/ai_service.py)
- [control/app/services/reverse_search_service.py](control/app/services/reverse_search_service.py)
- [control/app/services/symptom_service.py](control/app/services/symptom_service.py)
- [control/app/services/dri_gap_service.py](control/app/services/dri_gap_service.py)
- [control/app/services/stopword_store.py](control/app/services/stopword_store.py)
- [control/app/services/synonym_expander.py](control/app/services/synonym_expander.py)
- [backend/repositories/health_repository.py](backend/repositories/health_repository.py)
- [backend/repositories/food_repository.py](backend/repositories/food_repository.py)
- [backend/repositories/user_repository.py](backend/repositories/user_repository.py)
- [control/resources/hpa_dri_v8.json](control/resources/hpa_dri_v8.json)
- [backend/resources/nutrient_field_map.json](backend/resources/nutrient_field_map.json)
- [control/resources/stopwords.json](control/resources/stopwords.json)
- [control/resources/food_synonym_dict.json](control/resources/food_synonym_dict.json)
- [control/resources/symptom_mapping.json](control/resources/symptom_mapping.json)

## 待確認事項

1. `UnifiedAnalysisPage` 中的 `searchFood()`、`lookupSynonym()` 是輔助支線，若要放入正式簡報圖，建議標成次要呼叫，不要和主 recipe flow 混在一起。
2. `ProfilePage` 的今日攝取是 frontend local calculation；若簡報需要完全資料流圖，可以再補一條從 `diet_logs` / `recipes` 到本地計算器的支線。
