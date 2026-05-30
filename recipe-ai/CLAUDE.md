# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

---

## 專案速查

食譜營養 AI:使用者貼食譜 → 自動抽取食材 → 對 taiwan_foods + FooDB 雙資料庫匹配 → 換算營養素 → 根據 HPA 第八版 DRI 比對缺口 → 推薦補足食物。附帶中英雙向同義詞擴展 pipeline、jieba 斷詞停用詞維護 UI。**預設首頁為 AI 營養顧問**（`/advisor`），以對話式介面整合 13 個工具（食物搜尋、症狀查詢、學術文獻、食譜分析、營養素排名、行事曆 CRUD 等），走 4 步驟 LLM Pipeline + SSE 串流。DRI 缺口分析走整合分析頁 `/analysis`（非 advisor 工具）。

---

## 服務拓撲與網路

| 服務 | 容器名 | Port | 技術棧 | 工作目錄 |
|---|---|---|---|---|
| PostgreSQL | `recipe_ai_db` | 5432 | postgres:16-alpine | — |
| backend | `recipe-backend` | 8001 | FastAPI + asyncpg(無 ORM) | `/app` |
| control | `recipe-control` | 8000 | FastAPI + httpx + jieba + argostranslate + nltk | `/app` |
| frontend | `recipe-frontend` | 3001 | React 18 + Vite + nginx | `/usr/share/nginx/html` |
| Health Vector | **非 Docker**（手動進程） | 8003 | FastAPI + chromadb + sentence-transformers（Snowflake Arctic Embed L v2.0） | `health-vector/` |
| GraphRAG API | **非 Docker**（手動進程） | 8002 | FastAPI + chromadb + sentence-transformers + networkx | `graph/src/` |
| Gemma LLM | **非 Docker**（llama-server） | 8080 | llama.cpp + Gemma-4-E4B Q8_0（4B 參數） | — |

- 前 4 個容器都用 `--network host`,**不是** docker-compose(RUNBOOK.md 的 `docker compose` 指令已過時,不要照抄)。
- Health Vector、GraphRAG API 和 Gemma LLM 是獨立進程，不在 Docker 裡。前端 Vite proxy 把 `/graphrag-api` 轉到 port 8002。
- 容器命名混用 `-` 跟 `_`:DB 是 `recipe_ai_db`,服務是 `recipe-*`。
- nginx 代理:前端 `/api/*` → control `http://localhost:8000/`。
- control 透過 `BACKEND_URL=http://localhost:8001` 呼叫 backend(host network 下直接 localhost)。

## 啟動、停止、日誌

```bash
# 標準啟動 / 停止(start-dev.sh 會用手動 docker run + host network)
./start-dev.sh start
./start-dev.sh stop
./start-dev.sh restart
./start-dev.sh build      # no-cache 重建所有 image
./start-dev.sh status
./start-dev.sh logs control   # 或 backend / frontend / db / all

# 手動重啟單一容器(推 code + reload)
docker restart recipe-control
docker logs recipe-control --since 30s

# PostgreSQL 快速查
docker exec recipe_ai_db psql -U postgres -d recipe_ai -c "SELECT COUNT(*) FROM taiwan_foods;"
```

日誌:
- `control/logs/app_YYYY-MM-DD.log` — loguru JSON,30 天保留
- `control/logs/audit_YYYY-MM-DD.log` — 審計專用,90 天保留,懶初始化
- `backend/logs/backend.log` — 每小時輪替,保留 3 小時
- bind-mount 後 host 端可直接讀:`control/logs/`、`control/resources/`、`backend/logs/`

## 常用部署指令（改 code 後推上容器）

```bash
# ── control（Python）：cp + restart ──
docker cp control/app/routers/advisor.py recipe-control:/app/app/routers/advisor.py
docker restart recipe-control
docker logs recipe-control --since 10s   # 確認 Uvicorn running

# ── backend（Python）：cp + restart ──
docker cp backend/app/services/some_file.py recipe-backend:/app/app/services/some_file.py
docker restart recipe-backend

# ── frontend（React）：必須整包 build ──
cd frontend && docker build -t recipe-frontend .
docker stop recipe-frontend && docker rm recipe-frontend
docker run -d --name recipe-frontend --network host recipe-frontend

# ── Python 語法預檢（推前必做）──
python3 -c "import ast; ast.parse(open('control/app/routers/advisor.py').read()); print('OK')"
```

## 容器持久化:bind-mount 與 rebuild(重要!踩過坑)

| 物件 | 如何進容器 | 修改如何生效 | 永久化 |
|---|---|---|---|
| Python 原始碼(`app/`, `main.py`) | Dockerfile `COPY . .` baked-in | `docker cp src dest` + `docker restart` | 改完 `docker build` |
| `control/resources/*.json` | **bind-mount** `-v .../resources:/app/resources` | 直接改 host 檔,容器讀即時生效(get_set 有 60s cache) | host 端已是真源 |
| `control/logs/` | **bind-mount** `-v .../logs:/app/logs` | 同上 | 同上 |
| `control/scripts/` | **未**掛載 | 必須 `docker cp ...` 進去,`restart` 後會消失要重 cp | 要列入 Dockerfile |
| frontend bundle (`assets/*.js`) | builder stage 打包進 nginx image | **必須** `docker build` 整包 | 同左 |
| backend 原始碼 | baked-in,**無 mount** | `docker cp` + `docker restart` | `docker build -t recipe-backend .` |

**踩過的坑**:control 原本完全沒有 bind-mount,所以任何寫入 `/app/resources/food_synonym_dict.json` 的變動(例如 synonym pipeline 擴展結果)在 `docker restart` / `docker rm` 瞬間會被 image 裡 baked 的舊版覆蓋 — 使用者發現「3000 筆同義詞驟降為 324」就是這個問題。**現在已加 bind-mount**(`start-dev.sh` 沒更新,使用者是自己 docker run),務必保持。

**uid 對齊**:Dockerfile 建 `appuser`(uid 1000)與 host `aiiauser`(uid 1000)完全一致。Dockerfile 的 `chown -R appuser logs resources` 缺一不可,否則 bind-mount 後 container 寫不進去 → `Permission denied: /app/resources/stopwords.json.tmp`。

---

## 兩條食材提取 pipeline(必知)

後端有**兩條完全獨立**的食材提取路徑,極容易只接到一條造成 bug:

| 路由 | 服務模組 | 提取方式 | 停用詞來源 |
|---|---|---|---|
| `POST /recipe/extract` / `/recipe/extract-with-amounts` | `ai_service.py` | 正則 + 垃圾詞表 `_GARBAGE_EXACT` / `_GARBAGE_PATTERNS` | `_GARBAGE_EXACT` + `stopword_store` |
| `POST /recipe/reverse-search` | `reverse_search_service.py` | jieba 斷詞(自訂詞典 + 停用詞過濾) | `_STOP_WORDS`(seed)+ `stopword_store` |

**踩過的坑**:`stopword_store` 原本只接 reverse_search_service。使用者在 UI(走 `/recipe/extract-with-amounts`)拖食材到停用詞後,下次解析還是會抓回來 — 因為 ai_service 根本不讀 store。

**修法**:`ai_service.py` 的 `_is_garbage_ingredient` 先查 `stopword_store.get_set()`;`extract_keywords` 與 `extract_keywords_with_amounts` 最終出口再加一道 `_filter_stopwords` 雙重保險。未來若新增第三條提取 pipeline(例如 LLM-based),也必須接這兩道。

---

## Single Source of Truth(SSoT)— Canonical JSON

| 檔案 | 用途 |
|---|---|
| `control/resources/hpa_dri_v8.json` | **HPA 第八版 DRI 主表 canonical**(33 項營養素 + 男女 4 年齡段)|
| `frontend/src/utils/hpa_dri_v8.json` | 前端手動 copy,需跟 control 同步(Vite bundle 要自己 context 的檔) |
| `control/resources/stopwords.json` | 動態停用詞字典(97 筆 seed) |
| `control/resources/food_synonym_dict.json` | 食材同義詞辭典(3172 canonical / 8646 synonyms) |
| `control/resources/food_alias_overrides.json` | 舊靜態別名覆蓋(pipeline 前身) |
| `control/resources/moedict_synonyms.json` | MoeDict 靜態同義詞 |
| `control/resources/backups/` | 自動快照(寫入前 snapshot、啟動時備份) |
| `backend/resources/nutrient_field_map.json` | backend 端 nutrient key → taiwan_foods 欄位白名單(防 SQL injection) |

**為什麼分兩份 HPA JSON**:前端 Vite bundle 不能跨 context import,所以手動複製一份到 `frontend/src/utils/hpa_dri_v8.json`,`_comment` 欄位提醒「真源在 control/resources/hpa_dri_v8.json」。改 canonical 後記得手動同步。

---

## HPA 第八版 DRI 對齊(踩過坑)

**歷史包袱**:原本後端 `DRI_TABLE` 硬編碼 25 項,前端 `FIELD_META_MAP` 另一份硬編碼。雙方 drift:
- 後端多出 `copper_per_100g`、`manganese_per_100g`(HPA 第八版主表已刪除)
- 後端送 `vitamin_k_ug` 但前端只有 `vitamin_k1_ug` / `vitamin_k2_mk4_ug` / `vitamin_k2_mk7_ug` 細分 → UI 顯示 raw key「vitamin_k_ug(缺口:120)」
- 後端缺 10 項 HPA 有的:膽素、生物素、泛酸、碘、硒、氟、4 種脂肪酸

**現已重整**:
- `control/app/services/dri_gap_service.py` 改成從 `hpa_dri_v8.json` 載入,`@lru_cache` 快取,`_build_dri_table()` / `_build_field_meta()` 動態產生
- 新 router `/dri/fields` 給前端拿 canonical
- 前端 `driReferences.js:FIELD_META_LIST` / `FIELD_META_MAP` 都從 JSON 驅動
- 33 項中 6 項(膽素/生物素/泛酸/碘/硒/氟)`supported: false` — taiwan_foods 沒欄位,顯示目標值但不算缺口(避免假警)

**合計欄位**(重要):HPA 的「維生素 K」「n-3 多元不飽和」是單一 label,但 DB 存的是拆分:
- `vitamin_k_ug` = k1 + k2mk4 + k2mk7
- `n3_pufa_total_mg` = 次亞麻油酸 + EPA + DHA

`hpa_dri_v8.json` 用 `"db_fields": [...]`(複數)聲明合計來源。對應 backend 推薦食物 API(`/health/nutrients/{field}/top-foods`)也必須支援多欄位合計 — `nutrient_field_map.json` 用 `taiwan_cols` 陣列,`health_repository.py:get_top_foods_by_nutrient` 用 `COALESCE(c1,0) + COALESCE(c2,0) + ...` 排序。**單欄位模型收到 `vitamin_k_ug` 會 return `[]` → UI 顯示「無推薦食物資料」**。

**前端 intake key 沿用 `*_per_100g` 命名,不用再映射**:`UnifiedAnalysisPage.jsx` 原本有 `NUTRITION_TO_DRI_MAP` 把 `cal_per_100g` → `calories` 做舊 DRI schema translation。HPA v8 後 intake key 跟 DRI key 一致(都是 `cal_per_100g`),這張 map 反而會錯翻 → 已刪除,改為 pass-through,只保留 `modified_cal_per_100g` → `cal_per_100g` 的特例。

---

## 同義詞擴展 pipeline

`control/app/services/synonym_expander.py:SynonymExpander`:
- 中文路徑:MoeDict live API + static fallback → translate to EN(argos)→ WordNet lemmas + hyponyms → translate back to ZH → deduplicate,`_validate_food_relevance` 用 WordNet hypernym chain 過濾非食材義(例如「Mi」→ nautical mile 會被擋)
- 英文路徑:WordNet → translate to ZH → MoeDict → translate back to EN → deduplicate

`food_synonym_store.merge_expanded()` 合併到 JSON(union synonyms,保留 sources 標記)。

**批次腳本**:`control/scripts/batch_expand_all.py`
```bash
# scripts/ 沒 bind-mount,要先 cp
docker cp /home/aiiauser/JM/0325new/recipe-ai/control/scripts recipe-control:/app/scripts
# 背景跑完整 3172 筆 (~16 分)
docker exec -d recipe-control sh -c 'python /app/scripts/batch_expand_all.py > /app/logs/batch_stdout.log 2>&1'
# 監控
cat /home/aiiauser/JM/0325new/recipe-ai/control/logs/batch_expand_progress.json
# 只跑前 5 筆 smoke
docker exec recipe-control python /app/scripts/batch_expand_all.py --limit 5
```

特性:idempotent(已有 `>=MIN_EXIST_SYN` 同義詞的跳過)、progress JSON、atomic write(每批 flush)、0.15s/筆 rate limit(避免爆 MoeDict)。

**翻譯噪音**:argos 對單字/短詞翻譯常出錯(「小米」→「Mi」→ WordNet 吐 `myocardial infarction`、`nautical mile`、`sir tim rice`)。`_validate_food_relevance` 擋掉一部分但不能全擋。若要清理,可跑一次 `_filter_noisy_synonyms` 或手動編輯 JSON。

---

## 停用詞熱更新機制

- `stopword_store.get_set()` 內部 60 秒 TTL cache,寫入時 invalidate
- `reverse_search_service._segment_text` 與 `ai_service._is_garbage_ingredient` / `_filter_stopwords` 在 runtime 讀這個 set
- HTTP 加停用詞後,**下次 extract 立即生效**(in-process singleton),不需重啟、不需等 TTL

**驗證命令**:
```bash
TOKEN=<jwt>
RECIPE='準備雞蛋 3 顆、牛奶 200ml,打散備用。'
# before: 應該看到「準備雞蛋」
curl -s -X POST http://localhost:8000/recipe/extract -H "Authorization: Bearer $TOKEN" -H "Content-Type: application/json" -d "{\"recipe_text\":\"$RECIPE\"}"
# 加入停用詞
curl -X POST http://localhost:8000/stopwords -H "Authorization: Bearer $TOKEN" -H "Content-Type: application/json" -d '{"word":"準備雞蛋"}'
# after: keywords 為空
curl -s -X POST http://localhost:8000/recipe/extract -H "Authorization: Bearer $TOKEN" -H "Content-Type: application/json" -d "{\"recipe_text\":\"$RECIPE\"}"
```

---

## 審計日誌 + 備份

- 所有 `POST/PUT/DELETE /stopwords*` 寫操作都會呼叫 `audit_log_service.log(action=..., actor=jwt, target=word, before=..., after=..., request=request)`,寫到 `control/logs/audit_YYYY-MM-DD.log`(JSON 結構化,90 天保留)
- `stopword_store` 寫入前會 snapshot 到 `control/resources/backups/stopwords_<timestamp>.json`,保留最近 10 份
- 啟動時 `seed_stopwords.run_startup_seed()` 做兩件 idempotent 事:寫 75 筆種子停用詞(若空)、備份一份 `food_synonym_dict.json` 到 `backups/`(若今日未備份)
- `food_synonym_store` 若載入時 JSON 損毀 → 自動 rename `.json.bak` + 新建空檔

**無 admin role**:所有登入者平權,靠 audit log 追責。JWT 7 天有效,bcrypt 密碼。`control/app/middleware/auth_middleware.py` 的 `require_auth` 依賴。

---

## 前端雙向拖曳 + 停用詞 UX

食譜分析與整合分析頁的 Step 2「確認食材」:
- 食材 tag `draggable={true}`,`dataTransfer.setData("text/plain", word)`
- **正向 drop zone**(`S.stopwordDrop`):接 `text/plain`,呼叫 `POST /stopwords/bulk`,chip 加入 `recentStopwords`
- 停用詞 chip `draggable={true}`,`dataTransfer.setData("application/x-stopword", word)` **同時** `text/plain`(繞 Safari ghost-image)
- **反向 drop zone**(tag list outer div):`onDragOver` 只接 `application/x-stopword`,drop 時呼叫 `DELETE /stopwords/{word}`,把詞加回 ingredients
- 方向判斷:`e.dataTransfer.types.includes("application/x-stopword")` — 同一 drop zone 不會誤收反方向

**停用詞管理頁 `/stopwords`**:一次顯示全部(使用者明確要求不分頁、不搜尋),按 category 分組,支援新增/編輯/刪除。

---

## Playwright E2E 與 headless DnD 黑魔法

Headless Chromium **不產生 trusted DragEvent**(HTML5 DnD 需要 OS 層介入)。三種嘗試過的方法:
1. ❌ `dispatchEvent(new DragEvent(...))`:React synthetic event 不接 `isTrusted=false`
2. ❌ Playwright `locator.dispatchEvent("drop", { dataTransfer })`:超時或 bubble 不到正確 listener
3. ✅ **Fiber-based**:讀 DOM 節點上的 `__reactProps$*` key 拿到 React props,直接 `props.onDrop(fakeEvent)`

```javascript
const target = ... // 找到綁 onDrop 的 DOM
const propKey = Object.keys(target).find(k => k.startsWith("__reactProps$"));
target[propKey].onDrop({
  preventDefault() {}, stopPropagation() {},
  dataTransfer: { getData: (t) => t === "text/plain" ? word : "" }
});
```

對驗證「onDrop handler 裡的業務邏輯是否正確」這一軌完全等效於真實使用者拖放。Safari / 桌面 Chrome 真實使用者測試仍要手動。

Playwright 相關路徑:`/home/aiiauser/JM/0325new/recipe-ai/node_modules/playwright/`,chromium:`~/.cache/ms-playwright/chromium-*`。

---

## 本機 LLM — Gemma-4-E4B（已整合）

本機裝 llama.cpp + **Gemma-4-E4B-Instruct(Q8_0, 7.5GB)**。**選 Gemma 不選 Qwen 是地緣政治考量(避開中國模型),別自作主張改回 Qwen/GLM/DeepSeek 系**。

- 模型:`~/models/google_gemma-4-E4B-it-Q8_0.gguf`(Google Gemma 4 系列,4B 參數 expert 模型)
- 引擎:`~/llama.cpp/build/bin/llama-server`(自編,CUDA,sm_86 for RTX 3060)
- 啟動指令(**必加 `--jinja`**):
  ```bash
  ~/llama.cpp/build/bin/llama-server \
    -m ~/models/google_gemma-4-E4B-it-Q8_0.gguf \
    -ngl 99 -c 16384 --jinja \
    --host 0.0.0.0 --port 8080
  ```
- VRAM:模型 ~5.6 GB + KV cache,與 health-vector(~2.7GB)共存約 9.1/12.3 GB
- `-c 16384` 必要:advisor 的 SYSTEM_MANUAL prompt(~30KB)需要大 context
- **已整合的功能**:
  - `advisor.py`:4 步驟 LLM Pipeline(echo → intent → toolcall → analysis)
  - `symptom_service.py`:LLM 症狀解析 + LLM 相關性判斷(graceful degradation:LLM 掛掉仍可運作)
- **Gemma 4 特性**:
  - 內建 chain-of-thought reasoning(輸出含 `<|channel>thought` 自審區塊)
  - Context 上限 256K(VRAM 限制下實務用 16K)
  - License:Apache 2.0
- **不要做的事**:
  - **不要為了「中文更強」或「速度更快」改回 Qwen / GLM / DeepSeek**
  - 不要忘記 `--jinja` 旗標
  - 跑前確認沒殭屍 `llama-server` 占 VRAM:`nvidia-smi`,若有 `kill <pid>`

---

## AI 營養顧問系統（advisor.py — ~1876 行）

`control/app/routers/advisor.py` 是系統最複雜的單一檔案，實作完整的 AI 對話式營養顧問。前端路由 `/advisor`（預設首頁）。

**架構：4 步驟 LLM Pipeline**

每次使用者輸入都經過：
1. **Echo**（即時確認）→ temp=0.5, 1 次呼叫
2. **Intent**（意圖偵測，12 種意圖）→ temp=0.1, 2 次嘗試
3. **ToolCall**（工具指令生成）→ 系統優先（`_system_generate_toolcalls()`），LLM 備援 temp=0.1
4. **Analysis**（綜合分析回覆）→ temp=0.3, 2 次嘗試

另有兩個輔助 LLM 呼叫：
- **Memory compression**（`_compress_memory`）→ temp=0.2
- **Parameter extraction**（`_extract_params_llm`）→ temp=0.1，regex 失敗時的 fallback

**6 個 Prompt 常數**：`PROMPT_ECHO`(L38)、`PROMPT_INTENT`(L79)、`PROMPT_TOOLCALL`(L186)、`PROMPT_ANALYSIS`(L253)、`MEMORY_PROMPT`(L302)、`PROMPT_EXTRACT_PARAMS`(L1489)

**13 個工具**（`_TOOL_DISPATCH`）：

| 工具 | 後端呼叫 |
|------|---------|
| `get_nutrient_ranking` | `GET /health/nutrients/{field}/top-foods` |
| `search_food` | `GET /food/search?q=` |
| `browse_taiwan_food` | `GET /food/taiwan/browse` |
| `analyze_recipe` | `POST /recipe/calculate-nutrition` |
| `get_literature_papers` | `GET /food/literature/papers` |
| `search_symptom` | `GET /food/symptom/{symptom}` |
| `search_graphrag` | `POST localhost:8002/retrieve-only`（60s timeout） |
| `get_saved_recipes` | `GET /recipe/saved` |
| `get_calendar_entries` | `GET /calendar/entries` |
| `add_to_calendar` | `POST /recipe/save` → `POST /calendar/entries`（先儲存食譜再加行事曆；需 `structured_store` 中有 `recipe_store`） |
| `delete_calendar_entry` | `GET /calendar/entries` → `DELETE /calendar/entries/{id}`（先查再刪；可指定 recipe_name 刪特定筆） |
| `get_user_profile` | `GET /auth/me` |
| `update_user_profile` | `PUT /profile` |

**已移除的工具**（備份在 `移除功能備份_20260512_*/`）：`query_dri`（DRI 功能由整合分析頁 `/analysis` 覆蓋）、`add_diet_log` / `get_diet_logs` / `update_diet_log` / `delete_diet_log`（飲食日誌頁面已移除）。

**通信協議**：SSE（Server-Sent Events），9 種事件類型：`thinking`、`echo`、`tool_start`、`tool_result`、`tool_done`、`reply`、`memory`、`workflow_state`、`error`

**工作流程狀態機**：`idle` → `collecting`（參數不足追問，最多 3 輪）→ `ready` → `executing` → `done`。中斷偵測在 `_detect_interruption()`。

**前端元件**：
- `AdvisorPage.jsx` — 主頁面、SSE 事件處理、localStorage 持久化（最近 30 則）
- `advisorApi.js` — SSE 客戶端（native fetch + ReadableStream）
- `ToolResultCard.jsx` — 11 種工具結果的專用渲染器（含 `FoodDetailInline` 展開式營養詳情）
- `ThinkingPanel.jsx` — 思考進度面板

**LLM 設定**：所有呼叫走 `_call_gemma()` → `config.GEMMA_URL`（localhost:8080），預設 `max_tokens=16384`（全部步驟統一，不再個別覆蓋），模型名 `config.GEMMA_MODEL_NAME`（gemma-4）。所有 Prompt 無字數/句數約束，所有工具資料無截斷限制。

---

## GraphRAG 前端整合（2026-05 起）

前端有兩頁連接 `graph/src/api_server.py`（port 8002），走 Vite proxy `/graphrag-api` → `http://localhost:8002`：

| 前端路由 | 元件 | 用途 |
|---|---|---|
| `/graphrag` | `GraphRAGPage.jsx` | 主問答頁：textarea 輸入 → SSE 串流顯示 4 個方法(A/B/C/D)的 Gemma 回答 + 參考文獻 |
| `/pdf-viewer` | `PdfViewerPage.jsx` | PDF 原文檢視器：pdfjs-dist 渲染 + 多段螢光筆標記（sessionStorage 傳 highlight data） |

**GraphRAG 專屬元件**（`frontend/src/components/graphrag/`）：
- `ReferenceList.jsx` — 參考文獻列表：IF/SJR quartile 色標、DOI 連結、study type 徽章、community report 卡片、「查看原文 PDF」按鈕、extra_highlights 多頁標記
- `FigureGallery.jsx` — 論文圖表畫廊：圖片 + caption，圖片來源 `/graphrag-api/papers/{doc_id}/figures/{filename}`

**前端→後端資料流**：`GraphRAGPage` 用原生 `fetch("/graphrag-api/query")` 讀 SSE stream（不走 axios client），`PdfViewerPage` 用 `sessionStorage` 接收 text_preview + extra_highlights（避免 URL 長度限制）。

**注意**：graph/ api_server 是**非 Docker 的獨立進程**。前端 dev server（Vite 3001）能代理，但 production nginx 需額外配 proxy pass。

---

## 症狀搜尋升級 — Health Vector 微服務（2026-05-18）

原本 87 筆靜態 `symptom_mapping.json` 對照表已升級為 5 階段搜尋管道，覆蓋全部 1,435 筆 FooDB health effects。

**Health Vector 微服務**（`health-vector/server.py`，port 8003）：
- 資料：1,435 筆 health effects（name_index 快速查找）+ 619 筆有 description 的做向量嵌入
- 嵌入模型：`Snowflake/snowflake-arctic-embed-l-v2.0`（與 graph/ 共用）
- 向量庫：ChromaDB（`health-vector/chroma_db/`），cosine similarity
- 資料檔：`health-vector/data/health_effects_all.json`（1,435 筆）、`health_effects_with_desc.json`（619 筆）
- 搜尋：name 精確/部分匹配 + 向量語義搜尋，合併去重回傳 top-K
- **共用 `graph/.venv`**（sentence-transformers、chromadb 已裝在那）

```bash
# 啟動 health-vector
cd /home/aiiauser/JM/0325new/recipe-ai/health-vector
/home/aiiauser/JM/0325new/graph/.venv/bin/python server.py
```

**5 階段搜尋管道**（`control/app/services/symptom_service.py`）：
1. **LLM 結構化解析**：使用者自由輸入 → Gemma 拆解為獨立症狀關鍵字（graceful degradation）
2. **雙路搜尋**（per keyword）：symptom_mapping.json 對照表 + health-vector 向量語義搜尋
3. **LLM 判斷相關性**：合併候選 → Gemma 篩選 top 10（fallback: score 排序）
4. **Backend compound→food pipeline**：mapping path 走 per-name lookup，vector path 走 batch `effects-to-foods`
5. **去重彙總**

**DB 變更**：`foodb_health_effects` 新增 `name_zh VARCHAR(255)` 欄位（全部 1,435 筆已翻譯），附 B-tree + GIN pg_trgm 索引。`search_health_effects()` 現在搜尋 `name` 和 `name_zh` 雙欄。

**新 Backend endpoint**：`POST /health/effects-to-foods`（接受 `effect_ids` 陣列，直接查 compound→food，跳過 name 搜尋）

**前端**：`SymptomSearchPage.jsx` 顯示 LLM 解析標籤、向量語義匹配區塊（含中文名、相似度%、來源徽章）、效果卡片含 `name_zh`。

---

## 前端路由總覽

所有 authenticated 路由都走 `PrivateRoute`（JWT 過期檢查），包在 `Layout`（Navbar + footer）裡。

| 路由 | 頁面元件 | 說明 |
|---|---|---|
| `/advisor` | AdvisorPage | **AI 營養顧問**（**預設首頁**，`/` 重導到此） |
| `/analysis` | UnifiedAnalysisPage | 整合分析（7 步流程 + DRI 缺口 + 推薦食物） |
| `/food-search` | FoodSearchPage | 食材搜尋（雙 DB） |
| `/food-database` | TaiwanFoodDatabasePage | 台灣食品資料庫瀏覽 |
| `/nutrient-ranking` | NutrientRankingPage | 營養素排名（110+ 欄分 13 組） |
| `/symptom-search` | SymptomSearchPage | 症狀→化合物→食物搜尋 |
| `/dri-gap` | DriGapPage | DRI 缺口分析 |
| `/calendar` | DailyAnalysisCalendarPage | 每日分析日曆 |
| `/recipes` | SavedRecipesPage | 已儲存食譜 |
| `/graphrag` | GraphRAGPage | GraphRAG 知識圖譜問答 |
| `/literature-review` | LiteratureReviewPage | 學術文獻瀏覽 |
| `/pdf-viewer` | PdfViewerPage | PDF 檢視器（**無 Layout**，獨立視窗開啟） |
| `/synonym-dict` | SynonymDictPage | 同義詞管理 |
| `/stopwords` | StopwordsPage | 停用詞管理 |
| `/profile` | ProfilePage | 個人資料 |
| `/login` | LoginPage | 登入（**無 PrivateRoute**） |
| `/register` | RegisterPage | 註冊（**無 PrivateRoute**） |

所有頁面用 `lazy()` + `Suspense` 做 code splitting。

---

## 常見 API endpoints

認證(`control/app/routers/auth.py`):
- `POST /auth/register` / `POST /auth/login` → `{access_token, token_type, user}`(回應 key 是 `access_token`,不是 `token`)
- `GET /auth/me`

食譜流程(`control/app/routers/recipe.py`,全部要 JWT):
- `POST /recipe/extract` 簡單 keywords
- `POST /recipe/extract-with-amounts` 帶用量
- `POST /recipe/reverse-search` jieba 斷詞路徑
- `POST /recipe/lookup` 食材 → 雙 DB 候選
- `POST /recipe/calculate-nutrition` 按用量換算
- `POST /recipe/save` 儲存到 PostgreSQL
- `POST /recipe/analyze` 完整 7 步分析

DRI / 營養:
- `GET /dri/fields` HPA v8 canonical 33 項(前端用)
- `POST /health/dri-gap` 缺口分析
- `GET /health/nutrients/{field}/top-foods` 含量最高食物(**支援合計 field**;同時是前端 `/nutrient-ranking` 頁面的核心 API,前端可選欄位由 `frontend/src/utils/nutrientRankingFields.js` 定義,必須與 `backend/resources/nutrient_field_map.json` 同步,否則 dropdown 選了會 return `[]`)

AI 顧問(`control/app/routers/advisor.py`):
- `POST /advisor/chat` SSE 串流，body: `{message, history, user_profile, memory, workflow_state}`

同義詞 / 停用詞:
- `GET/POST/PUT/DELETE /synonym-dict/*` CRUD,`POST /synonym-dict/pipeline/run` 啟動擴展管道
- `GET /stopwords`(一次回全部、無分頁)、`POST /stopwords` / `/stopwords/bulk` / `PUT /stopwords/{word}` / `DELETE /stopwords/{word}`

---

## 關鍵數據快照(2026-04-30)

```
taiwan_foods:       2,213 entries(2024 UPDATE2 於 2026-04-30 匯入,33 新增 + 2,180 更新;
                                 來源:食品營養成分資料庫2024UPDATE2.xlsx 的 2,213 筆有效資料,
                                 2,503 raw rows 中 290 筆是空白 trailing row)
foods (FooDB):        992 entries(25 類,前四大:Aquatic foods/Fruits/Vegetables/Herbs and Spices)
食物總 canonical:   3,172(全部進同義詞擴展)
food_synonym_dict:  3,172 entries / 8,646 synonyms(平均 2.73/筆)
  來源分布:auto 2241 / wordnet 913 / argos_bridge 420 / moedict 71
  (0 舊 alias_overrides/fallback_map 污染)
stopwords.json:       97 筆(57 general + 40 cooking)
HPA DRI v8 fields:    33 項(27 可計算缺口 + 6 無 DB 欄位僅顯示目標)
nutrient_field_map.json: 106 keys(105 個 single col + 2 個合計 vitamin_k_ug/n3_pufa_total_mg
                                  + waste_rate 於 2026-04-30 補入)
```

---

## 本 session 踩過的坑 / 歷史案例

每個案例:**症狀 → 根因 → 修法 → 涉及檔案**。

### 1. 同義詞「驟降」3000 → 324
- **症狀**:使用者打開 UI 看到同義詞辭典「總條目數 324 / 總同義詞數 504」,記憶中是 3000/12000。
- **根因**:control 容器沒 bind-mount,之前跑 `/synonym-dict/pipeline/run` 擴展的結果寫在 `/app/resources/food_synonym_dict.json`(容器內),`docker restart` / `docker rm` 時被 image 的 4/2 版本覆蓋。
- **修法**:`docker run ... -v control/resources:/app/resources -v control/logs:/app/logs`,並 `chown -R appuser resources` 於 Dockerfile;host 端檔案從此成為真源。
- **檔案**:`control/Dockerfile`、`start-dev.sh`(未更新)、手動 `docker run` 有 mount。

### 2. `vitamin_k_ug` 顯示 raw key
- **症狀**:DRI 缺口清單出現「vitamin_k_ug(缺口:120)」、其他營養素是中文。
- **根因**:後端 DRI_TABLE 送 `vitamin_k_ug`,前端 `FIELD_META_MAP` 只有 K1/K2MK4/K2MK7 子型,沒總量 key → fallback 印 raw。深層原因是前後端各自定義清單,沒 SSoT。
- **修法**:建 `hpa_dri_v8.json` canonical,後端 `dri_gap_service.py` 重寫為 JSON-driven,新 router `/dri/fields` 給前端,前端 `nutrientMappings.js`/`driReferences.js` 改成讀 JSON。
- **檔案**:`control/resources/hpa_dri_v8.json`、`control/app/services/dri_gap_service.py`、`control/app/routers/dri.py`、`frontend/src/utils/{hpa_dri_v8.json,driReferences.js,nutrientMappings.js,driCalculations.js}`、`frontend/src/pages/UnifiedAnalysisPage.jsx`(NUTRITION_TO_DRI_MAP 刪)。

### 3. 停用詞拖曳後,下次解析食譜該詞還是出現
- **症狀**:使用者拖「準備雞蛋」到停用詞,再貼同份食譜解析,「準備雞蛋」仍被抓為食材。
- **根因**:`stopword_store` 只 wire 到 `reverse_search_service._segment_text`(jieba 路徑);但 UI 實際打的是 `/recipe/extract-with-amounts`(ai_service 規則解析),完全沒讀 store。
- **修法**:`ai_service.py` 的 `_is_garbage_ingredient` 先查 `stopword_store.get_set()`;`extract_keywords` 與 `extract_keywords_with_amounts` 最終出口加 `_filter_stopwords` 雙重防線。
- **檔案**:`control/app/services/ai_service.py`。

### 4. 停用詞拖曳單向 — 不能拉回
- **症狀**:食材 → 停用詞 OK,但停用詞 chip 無法拖回食材區。
- **根因**:chip 沒 `draggable`,tag list 也沒 `onDrop`。
- **修法**:chip 加 `draggable` + `application/x-stopword` mime;tag list outer div 加 `onDragOver`/`onDrop`,只接 `application/x-stopword`,drop 時 `DELETE /stopwords/{word}` 再加回 ingredients;兩個方向用 mime 區分同一 drop zone 不會誤收。
- **檔案**:`frontend/src/pages/{RecipeAnalyzerPage.jsx,UnifiedAnalysisPage.jsx}`、`frontend/src/api/stopwordsApi.js`。

### 5. 「維生素 K」「n-3 多元不飽和」顯示「無推薦食物資料」
- **症狀**:DRI 缺口清單中 K / n-3 PUFA 展開後沒有推薦食物,但 A/D/E/trans-fat 有。
- **根因**:backend `nutrient_field_map.json` 是單欄位模型(`taiwan_col`),`vitamin_k_ug` / `n3_pufa_total_mg` 是合計欄位不在白名單 → `get_top_foods_by_nutrient` 回 `[]`。
- **修法**:backend JSON map 加 `"taiwan_cols": [...]` 複數欄位;`health_repository.py:get_top_foods_by_nutrient` 支援多欄 `COALESCE(...)` 合計排序,保留白名單安全。
- **檔案**:`backend/resources/nutrient_field_map.json`、`backend/repositories/health_repository.py`。

### 6. 我為了「清除舊資料」直接清空 JSON 重跑 16 分鐘
- **症狀(使用者抱怨)**:「不是已經擴展完了嗎?為何重跑?」
- **根因(自己的決策失誤)**:使用者要求「砍掉舊 324/504 換成純擴展的」,正確做法是過濾 sources 只有 `{alias_overrides, fallback_map}` 的條目 → 保留其他 ~3110 筆 pipeline 擴展結果。但我直接把整份 JSON 清空重跑 → 重複 16 分鐘 translate/MoeDict 呼叫。
- **教訓**:面對「砍舊換新」要先分析 source tag 構成,而不是本能選「clean slate」。

### 7. Headless Chromium 驗證 DnD
- **症狀**:Playwright 用 `dragTo` / `dispatchEvent(new DragEvent)` 都沒觸發 React `onDrop`。
- **根因**:headless 沒 OS DnD session,事件 `isTrusted=false`,React 的某些 delegated listeners 不吃。
- **修法**:讀 `element.__reactProps$*` 直接呼叫 `onDrop({...fake event})`。業務邏輯等效驗證,但 UI 實機仍需人工。
- **檔案**:`/tmp/pw_*.mjs`(非 repo,scratch)。

### 8. Dockerfile `adduser` 互動 prompt 在 build 卡住
- **症狀**:build 時 `Enter the new value, or press ENTER for the default Full Name []:` 雜訊。
- **根因**:`adduser --disabled-password` 沒加 `--gecos ""` 預設會 prompt。
- **狀況**:目前 build log 有這段雜訊但 build 過得去,不影響功能。若要清理可加 `--gecos ""`。

### 9. PDF WebFetch SSL 憑證錯誤
- **症狀**:`WebFetch https://www.hpa.gov.tw/...GetFile.ashx` 回 `unable to verify the first certificate`。
- **根因**:HPA 站 cert 鏈在 node 的 CA bundle 有問題。
- **修法**:`curl -skL -H "User-Agent: Mozilla/5.0 ..." -H "Referer: https://www.hpa.gov.tw/..." -o dri.pdf` 本地下載,再 `pdftotext -layout dri.pdf dri.txt` 解析。
- **用途**:拿 HPA 第八版 DRI 數值重寫 canonical。

### 10. backend 容器 pip install 權限
- **症狀**:`docker exec recipe-backend pip install openpyxl` 報 `Permission denied: '/home/appuser'`。
- **根因**:image 內 appuser 的 HOME 沒寫入權限,user-site install 目標(`~/.local/...`)寫不進去。
- **修法**:`docker exec --user root recipe-backend pip install <pkg>`。
- **適用情境**:跑一次性 import 腳本(例如 2024 UPDATE2 匯入需要 openpyxl)要臨時加套件時。一次性的 deps 不必寫進 Dockerfile,但若要永久化才 rebuild image。
- **檔案**:`backend/scripts/import_taiwan_foods_2024update2.py`(idempotent upsert by `integration_code`,執行流程見 root CLAUDE.md「更新台灣食品資料」段)。

---

## 未解決 / 可改進(TODO)

- `start-dev.sh` 仍以 `docker run` 手動管理,Dockerfile 沒 bind-mount 宣告。建議改成 docker-compose 並把 `resources/`、`logs/` mount 寫入 `docker-compose.yml`(compose 檔目前還在,只是沒跑),同步 RUNBOOK.md。
- 前端 `frontend/src/utils/hpa_dri_v8.json` 是 control canonical 的手動 copy,未來改 canonical 要記得同步。可考慮 `/dri/fields` runtime fetch 取代 bundle(但要加 loading state)。
- `frontend/src/data/driV8Table.js` 在 HPA v8 對齊後已無引用,可安全刪除(未刪避免誤動)。
- Argos 翻譯對單字 / 短詞雜訊大(Mi → myocardial infarction、Rice → sir tim rice)。現有 `_validate_food_relevance` 只擋一部分,可加黑名單或長度 heuristic。
- 本 session 新增的停用詞 chip UX 在擠爆時(拖多次後)會越長,沒捲動/分頁,實務若需要再加 UI 改進。

---

## 未完成的對話決策(給未來 Claude 參考)

使用者明確「完全按照 HPA 第八版去做」= 33 項為準,不能出現 HPA 沒列的(copper/manganese 已移除,**不要加回來**)。`supported: false` 的 6 項(膽素/生物素/泛酸/碘/硒/氟)只顯示目標、不算缺口,除非後續補齊 DB 欄位。

使用者偏好:
- 不要做不必要的 refactor / 過度設計
- 面對決策偏向「乾淨重做」要先確認 — 使用者 push back 過一次
- 管理頁要一次顯示全部,不要加搜尋/分頁
- 修 bug 要追到根因(兩條 pipeline 各自有 stopword 接入)而非貼 workaround
