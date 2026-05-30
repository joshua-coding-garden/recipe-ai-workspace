# Recipe-AI 系統工作流程（實作對齊版）

## 系統總覽與實作摘要

本系統採用**規則與檢索雙軌制**：

- **規則提取**：以規則、正則匹配、停用詞與同義詞字典為主，負責食材抽取、清理與基礎判斷。
- **檢索聚合**：依賴 SQL 精確比對、ILIKE、trigram 相似度與跨資料庫聚合排序，回傳候選與推薦。

**不使用模型推論**作為主要決策基礎。所有流程均可由現有原始碼直接驗證。

## 功能節點表

| 功能 | 前端入口 | 後端 API | 中介 Service | 資料來源 | 輸出結果 |
|---|---|---|---|---|---|
| 整合分析 | `/analysis` → frontend/src/pages/UnifiedAnalysisPage.jsx | `/recipe/extract`, `/recipe/extract-with-amounts`, `/recipe/lookup`, `/recipe/calculate-nutrition`, `/health/nutrients/{field}/top-foods` | `ai_service`, `reverse_search_service` | `taiwan_foods`, `foodb_*`, `nutrient_field_map.json`, `stopwords.json` | 食材清單、營養彙總、DRI 缺口、推薦食物 |
| 症狀搜尋 | `/symptom-search` → frontend/src/pages/SymptomSearchPage.jsx | `/health/symptom-search`, `/health/symptom-lookup` | `symptom_service` | `symptom_mapping.json`, `foodb_health_effects`, `foodb_compounds`, `foodb_contents` | 效果、化合物、推薦食物 |
| DRI 分析 | `/dri-gap` → frontend/src/pages/DriGapPage.jsx | `/health/dri-gap`, `/health/nutrients/{field}/top-foods`, `/dri/fields` | `dri_gap_service` | `hpa_dri_v8.json`, `nutrient_field_map.json`, `taiwan_foods`, `foodb_*` | DRI 缺口、推薦食物 |
| 個人資料 | `/profile` → frontend/src/pages/ProfilePage.jsx | `/profile` | `user_repository` | `profiles` | 個人資料與基礎指標 |

## API 與 Service 對照表

| API / Service | 檔案 | 責任說明 |
|---|---|---|
| `POST /recipe/reverse-search` | control/app/routers/recipe.py | 入口路由，調用 reverse_search_service 執行 fallback 搜尋 |
| `reverse_search_service` | control/app/services/reverse_search_service.py | Direct Match → Jieba 斷詞 → backend 搜尋（精確 / 相似度） |
| `symptom_service` | control/app/services/symptom_service.py | 症狀 mapping → effect 名稱 → 呼叫 `/health/symptom-lookup` |
| `dri_gap_service` | control/app/services/dri_gap_service.py | DRI 目標選擇、缺口計算、推薦食物查詢 |
| `health_repository` | backend/repositories/health_repository.py | foodb_health_effects 檢索、化合物查詢、營養素 Top Foods |
| `food_repository` | backend/repositories/food_repository.py | taiwan_foods / foodb 的 ILIKE + trigram 相似度搜尋 |
| `nutrient_field_map.json` | backend/resources/nutrient_field_map.json | 營養欄位白名單與跨 DB 對照 |
| `symptom_mapping.json` | control/resources/symptom_mapping.json | 症狀 → 效果名稱對照 |
| `hpa_dri_v8.json` | control/resources/hpa_dri_v8.json | DRI 欄位定義與目標值 |

## 核心流程（可驗證）

### 1) 食材提取 Fallback 鍊條（reverse_search_service）

1. **Direct Match**：先取全量食物名稱，依名稱長度排序，長名優先在文本中做直接比對。
2. **Jieba 斷詞**：未命中的文本進行斷詞，套用停用詞、去重、最短詞長與已匹配名稱排除。
3. **Backend 檢索**：每個 token 依序呼叫：
   - 精確匹配 `/foods/search/zh/exact` 與 `/foods/search/en/exact`
   - 無結果則改用相似度 `/foods/search/zh` 與 `/foods/search/en`
4. **排序來源**：中文與英文端皆依 ILIKE / trigram / score 公式排序。

### 2) 營養標籤白名單（nutrient_field_map）

- `nutrient_field_map.json` 是**欄位白名單**，`health_repository.get_top_foods_by_nutrient()` 只接受 map 中存在的欄位。
- 白名單同時提供 `taiwan_foods` 欄位與 FooDB nutrient name 對照；支援以 `taiwan_cols`（若有定義）做多欄位加總。
- 跨 DB 查詢時先查 `taiwan_foods`，再依 `foodb_name` 連 `foodb_contents` / `foodb_nutrients` 聚合結果。

### 3) DRI 目標動態選擇（dri_gap_service）

- `hpa_dri_v8.json` 為唯一來源，`dri_gap_service` 只使用 **年齡 + 性別** 篩出 DRI profile。
- 目前程式碼**未使用活動量**作為動態選擇條件（JSON 內的 activity 註解僅為資料說明）。
- 計算缺口時，只針對 `supported=true` 的欄位回報。

### 4) 症狀搜尋對照與推薦（symptom_service → health_repository）

- `symptom_mapping.json` 將中文症狀映射到英文 effect names（精確 → 同義詞 → 部分比對）。
- effect names 送入 `health_repository.search_health_effects()`，依 **精確 → ILIKE → trigram** 順序查 `foodb_health_effects`。
- 後續依效果查化合物，再查每個化合物的 top foods，完成推薦。

## 可驗證依據（原始碼路徑）

- control/app/services/reverse_search_service.py
- backend/repositories/food_repository.py
- backend/repositories/health_repository.py
- control/app/services/dri_gap_service.py
- control/app/services/symptom_service.py
- backend/resources/nutrient_field_map.json
- control/resources/hpa_dri_v8.json
- control/resources/symptom_mapping.json
- control/app/routers/recipe.py
- control/app/routers/health.py
- control/app/routers/dri.py
