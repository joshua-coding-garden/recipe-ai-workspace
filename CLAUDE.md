# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

---

## 這層是什麼

`/home/aiiauser/JM/0325new` 是 **workspace 目錄，不是單一專案**。實際 code 全部在 `recipe-ai/` 裡，這層其餘內容是設計文件、來源資料、改動紀錄、視覺資產。

**沒有 git**：整棵目錄樹找不到 `.git`，所有變更靠手動檔案管理；`recipe-ai/` 內也是 baked-in（沒有版控），改動需自己留意覆蓋風險。

開發工作幾乎都發生在 `recipe-ai/`，**先讀 [recipe-ai/CLAUDE.md](recipe-ai/CLAUDE.md)**——那是完整的服務拓撲、啟停指令、踩坑案例、API 端點清單。本檔只補該檔沒涵蓋的 workspace-level 脈絡。

---

## 目錄分工（只列含義不顯而易見的）

| 路徑 | 角色 | 說明 |
|---|---|---|
| `recipe-ai/` | 主應用程式 | backend (FastAPI 8001) + control (FastAPI 8000) + frontend (Vite/React 3001) + Postgres。詳見內含 CLAUDE.md |
| `graph/` | **GraphRAG 學習子專案**（2026-05 起） | 從零自刻 vector RAG → GraphRAG 的差異實作。**完全環境隔離**（自己的 `.venv/`、`.cache/huggingface/`、`chroma_db/`），所有產物都在 `graph/` 內，`rm -rf graph/` 即可完整清除。詳見 `graph/計畫.md` |
| `3.「國人膳食營養素參考攝取量」第八版_總表(1111020).pdf` / `.xlsx` | **HPA DRI v8 權威原檔** | 這是 `recipe-ai/control/resources/hpa_dri_v8.json` 的**真源**，重建 canonical 一定回到這檔 |
| `食品營養成分資料庫2024UPDATE2.xlsx` | **台灣食品成分權威原檔** | DB 表 `taiwan_foods`(2,213 筆，2024 UPDATE2 已於 2026-04-30 匯入)的來源；要新增/修正欄位先看這檔 |
| `建議攝取量_DRI_v8.xlsx` | 舊版 DRI 整理稿 | 已被上面的 HPA 原檔取代，避免引用 |
| `變更紀錄_RecipeAI_從起始到目前.md` | 早期完整改動史（~2026-03-25 為止） | 想追「為什麼當初這樣設計」第一個翻這份，後續改動沒持續 append |
| `食譜偵測/` | 優化決策追蹤點 | 目前只有 `0429小優化.md`（**該文檔內引用的 `0406/` 路徑已失效**，是舊整理稿，閱讀時注意斷鏈） |
| `0429製圖/`、`製圖/` | 系統架構圖／流程圖 SVG | 簡報用，與 code 不同步 |
| `成果圖/`、`營養架構圖(初版)/` | UI 截圖、早期架構圖 | 純歷史素材 |

---

## 何時動哪一層

- **改 code、跑服務、寫測試**：進 `recipe-ai/`，照該層 CLAUDE.md。**不要**在 workspace root 跑指令。
- **更新 DRI 標準**：源頭是 root 那份 HPA pdf／xlsx → 重新匯出到 `recipe-ai/control/resources/hpa_dri_v8.json`（再手動同步到 `recipe-ai/frontend/src/utils/hpa_dri_v8.json`，見 recipe-ai/CLAUDE.md 的 SSoT 章節）。
- **更新台灣食品資料**：源頭是 root 那份 `食品營養成分資料庫2024UPDATE2.xlsx` → 用 `recipe-ai/backend/scripts/import_taiwan_foods_2024update2.py` upsert(依 `integration_code`),既有 row 會更新到最新數值、Excel 多出的會新增。需先 `docker cp script + xlsx` 進 `recipe-backend`,且 openpyxl 需 `docker exec --user root recipe-backend pip install openpyxl`。原始 schema migration 在 `recipe-ai/backend/migrations/002_taiwan_foods.sql`(110 個營養素欄位已齊全,新匯入腳本不需動 schema)。
- **追歷史**：先 `變更紀錄_RecipeAI_從起始到目前.md` → 較細節去 `食譜偵測/0429小優化.md`（注意外部引用斷鏈）→ 再不行直接讀 code。
- **graph/ 子專案開發**：進 `graph/`，使用 `graph/.venv/bin/python`（**不要用** root `.venv/`）。所有 script 開頭 `import _paths`（`graph/src/_paths.py`）會自動把 HF cache 重定向到 `graph/.cache/`。phase 進度看 `graph/notes/step_NN_*.md`。**不可** pip install 到系統 / root venv，**不可**寫檔到 `graph/` 之外。

---

## graph/ 子專案的關鍵約定

| 項目 | 值 |
|---|---|
| 計畫主檔 | [graph/計畫.md](graph/計畫.md)（10 個 phase，環境隔離原則寫在最前面） |
| 進度筆記 | `graph/notes/step_00_setup.md`、`step_01_chunking.md`...（每 phase 一份） |
| 語料來源 | `graph/論文50/`（65 篇 PDF，原始 7 篇 + Gemini 搜尋補充，見 `graph/data/_gemini_paper_search_prompt.md`） |
| 中間產物 | `graph/corpus_text/*.txt`（PDF→text）、`graph/data/chunks.jsonl`（1,668 chunks）、`graph/data/entities.jsonl`（10,172 筆）、`graph/data/relations.jsonl`（4,585 筆）、`graph/data/reports.jsonl`（20 份 community report）、`graph/chroma_db/`（向量庫） |
| Chunking 設定 | tiktoken `cl100k_base`，**1200 token / overlap 100**（已改回計畫原案） |
| LLM 分工 | **建構階段**（Phase 2 entity / Phase 7 community summary）走 **Claude Agent subagent**；**查詢階段**（Phase 8/9）走 **本機 Gemma-2-27B llama-server**（`-c 5500`，port 8080）|
| 嵌入模型 | `Snowflake/snowflake-arctic-embed-l-v2.0`（Phase 5 後已從 MiniLM 升級） |
| 全英文語料 | 所有論文都是英文（檔名是中文主題標籤），entity name / description / relation 統一用英文 |

**重要**：不可自作主張替換計畫文件規定的工具或路線（LLM 廠商、chunk size、嵌入模型、流程切分）。本機有「更便宜 / 更快」的替代品時，**先停下來問**——先前已因擅自把 Claude Agent 換成 Gemma + 把 chunk 1200/100 放大到 2000/200 被糾正一次。

---

## graph/api_server.py — GraphRAG API（第 4 個服務）

`graph/src/api_server.py` 是一個**獨立的 FastAPI 服務**（非 Docker），連接 recipe-ai 前端，提供 GraphRAG 問答功能。

| 項目 | 值 |
|---|---|
| Port | **8002**（`uvicorn.run(host="0.0.0.0", port=8002)`） |
| 前提 | llama-server（Gemma）必須先跑在 port 8080 |
| 前端代理 | `vite.config.js` 的 `/graphrag-api` → `http://localhost:8002`（rewrite 掉前綴） |
| 前端頁面 | `/graphrag`（GraphRAGPage.jsx）+ `/pdf-viewer`（PdfViewerPage.jsx） |

**啟動：**
```bash
# 1. 先啟動 Gemma LLM（Gemma-4-E4B Q8_0，需 --jinja）
~/llama.cpp/build/bin/llama-server -m ~/models/google_gemma-4-E4B-it-Q8_0.gguf \
  -ngl 99 -c 16384 --jinja --host 0.0.0.0 --port 8080

# 2. 啟動 GraphRAG API
cd /home/aiiauser/JM/0325new/graph
.venv/bin/python src/api_server.py
```

**檢索架構（2026-05-08 重寫後）：**
- **Method A**（Vector RAG）：純向量搜尋，做為對照組，**不動**
- **Method B**（Local Search）：entity → **graph traversal（edge weight ≥5.0 排序）** → entity_chunk_map 查 chunk_ids → cosine re-rank
- **Method C**（Global Search）：community reports → 收集 key_entities → entity_chunk_map → grounding chunks（不再是空中樓閣）
- **Method D**（Drift Search）：entity-augmented HDE → graph relation types 生成 sub-queries（0 個 LLM call）→ 每條 sub-query 走 graph-driven chunk selection

核心 helpers 在 `08_retrieval_comparison.py`：`build_entity_chunk_map()`、`graph_weighted_neighbors()`、`graph_driven_chunk_selection()`、`_generate_graph_sub_queries()`。

**API endpoints：**
- `GET /health` — 健康檢查
- `POST /query` — 檢索 + LLM SSE 串流回答
- `POST /retrieve-only` — 只檢索不呼叫 LLM
- `POST /skip` / `POST /abort` — 跳過/中止
- `GET /papers` — 論文元數據
- `GET /papers/{doc_id}/pdf` — 提供 PDF 檔案
- `GET /papers/{doc_id}/figures/{fig}` — 提供論文圖表

---

## 0429小優化.md 的真實狀態（會誤導未來 instance）

該檔宣稱兩項功能「已完成且與症狀搜尋頁的食物詳情導向保持一致」。**這個對照基準是錯的**：在 2026-04-29 之前症狀搜尋頁**根本沒有食物點擊功能**。2026-04-29 / 04-30 已補上：

- **新增 Block A**：`recipe-ai/frontend/src/pages/UnifiedAnalysisPage.jsx` Section 2「各食材營養明細」食材名為 button → 開 `TaiwanFoodModal`
- **新增 Block B**：同檔 Section 3 DRI 表，缺乏列加「▼ 推薦食物」toggle → 內嵌 5 欄表（排名/食物名/來源/推薦原因/含量），共用 `foodRecs` state（不重打 API）
- **新增 Block C**：`SymptomSearchPage.jsx` 化合物展開列食物名為 button → 開**新的** `FoodbFoodModal`（獨立元件，不動 TaiwanFoodModal）；走全新後端 endpoint `GET /foods/foodb/{food_id}` + control proxy `/food/foodb/{food_id}` + helper `frontend/src/api/foodbFoodApi.js`
- **TaiwanFoodModal 從 Section 5 子層搬到 UnifiedAnalysisPage 頂層**（避免 Section 5 收合時其他 Section 點食物 modal 失效）
- **新增 Block D（2026-04-30）**：獨立頁面 `/nutrient-ranking`(營養素排名)
  - 元數據：`frontend/src/utils/nutrientRankingFields.js`(110+ 欄分 13 組:基本/糖類/礦物質/維生素 A/D/E/K/B 群/SFA/MUFA/PUFA/胺基酸/其他)
  - 頁面：`frontend/src/pages/NutrientRankingPage.jsx`(分組下拉 → 營養素下拉 → Top N 表 → 點擊跳 TaiwanFoodModal / FoodbFoodModal,依 source 分流)
  - 走既有 `/health/nutrients/{field}/top-foods`,**無新 endpoint**;backend 只補了 `waste_rate` 進 `nutrient_field_map.json`(現 106 keys)
  - Excel 2024 UPDATE2 匯入腳本同時上線:`backend/scripts/import_taiwan_foods_2024update2.py`(idempotent upsert by `integration_code`)
- 若要再讀 0429 那份決策文，記得對照當前 code：例如 0429 提到的「單筆刪除歷史紀錄」**仍未實作**，只有「清空全部」

---

## Playwright（root 層 package.json）

`/home/aiiauser/JM/0325new/recipe-ai/package.json` 有 `playwright: ^1.59.0`、Chromium 已安裝在 `~/.cache/ms-playwright/chromium-*`。可用於 headed E2E：

```bash
DISPLAY=:1 node /tmp/your_pw_script.mjs
# 用 chromium.launch({ headless: false, slowMo: 600 }) 可看見視窗
```

**Headless DnD 限制**：見 recipe-ai/CLAUDE.md「Headless Chromium 黑魔法」一節，要用 fiber-based 直接呼叫 React `onDrop`。

**自動登入**：用 `POST /auth/login` 拿 JWT，`context.addInitScript` 預塞 `localStorage.token` + `localStorage.user`（key 名都不帶 prefix）。

---

## 不要做的事

- 不要把 root 那份 HPA xlsx／台灣食品 xlsx 當成 reference 之外的東西去動——那是來源檔
- 不要在 `recipe-ai/` 之外建立 build／test scripts；docker 容器只認 `recipe-ai/` 內路徑
- 不要相信 `食譜偵測/0429小優化.md` 內提及的子目錄路徑（`0406/` 等）——它們已不存在
- 不要在 `graph/` 用系統 / root `.venv/` 的 Python；只用 `graph/.venv/bin/python`，避免污染與套件版本衝突
