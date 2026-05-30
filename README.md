# RecipeAI — 基於自然語言食譜解析之可追溯營養分析與候選補充食物查詢系統

> 使用者貼入食譜 → 自動抽取食材與份量 → 雙資料庫（台灣食品成分 + FooDB）營養素換算 → HPA 第八版 DRI 缺口分析 → 推薦補足食物  
> 附帶 AI 營養顧問對話介面（13 個工具的 LLM Pipeline + SSE 串流）與 GraphRAG 運動營養文獻問答

---

## 目錄

- [系統架構](#系統架構)
- [目錄結構](#目錄結構)
- [環境需求](#環境需求)
- [依賴來源總覽](#依賴來源總覽)
- [快速開始](#快速開始)
- [各服務詳細依賴](#各服務詳細依賴)
- [外部資料來源](#外部資料來源)
- [.gitignore 排除說明](#gitignore-排除說明)
- [關聯 Repo](#關聯-repo)

---

## 系統架構

```
┌─────────────────────────────────────────────────────────────────┐
│                        使用者瀏覽器                               │
│                     http://localhost:3001                        │
└────────┬──────────────────────┬───────────────────┬─────────────┘
         │ /api/*               │ /graphrag-api/*    │ 靜態資源
         ▼                      ▼                    ▼
┌────────────────┐  ┌────────────────┐  ┌────────────────────────┐
│   Frontend     │  │  GraphRAG API  │  │       nginx            │
│   (Vite/React) │  │  (FastAPI)     │  │   SPA fallback         │
│   Port 3001    │  │  Port 8002     │  │   Port 3001 (prod)     │
└────────┬───────┘  └───────┬────────┘  └────────────────────────┘
         │                  │
         ▼                  ▼
┌────────────────┐  ┌────────────────┐
│   Control      │  │  Gemma LLM     │
│   (FastAPI)    │  │  (llama-server) │
│   Port 8000    │  │  Port 8080     │
└────────┬───────┘  └────────────────┘
         │
         ▼
┌────────────────┐  ┌────────────────┐
│   Backend      │  │  Health Vector │
│   (FastAPI)    │  │  (FastAPI)     │
│   Port 8001    │  │  Port 8003     │
└────────┬───────┘  └────────────────┘
         │
         ▼
┌────────────────┐
│  PostgreSQL    │
│  Port 5432     │
└────────────────┘
```

| 服務 | 容器/進程 | Port | 技術棧 |
|---|---|---|---|
| PostgreSQL | Docker `recipe_ai_db` | 5432 | postgres:16-alpine |
| Backend | Docker `recipe-backend` | 8001 | Python 3.11 + FastAPI + asyncpg |
| Control | Docker `recipe-control` | 8000 | Python 3.11 + FastAPI + jieba + argostranslate + NLTK |
| Frontend | Docker `recipe-frontend` | 3001 | Node 20 + React 18 + Vite 6 + nginx |
| Health Vector | 手動進程 | 8003 | Python + FastAPI + ChromaDB + sentence-transformers |
| GraphRAG API | 手動進程 | 8002 | Python + FastAPI + ChromaDB + networkx |
| Gemma LLM | 手動進程 | 8080 | llama.cpp + Gemma-4-E4B Q8_0 |

---

## 目錄結構

```
0325new/                          ← workspace 根目錄
├── recipe-ai/                    ← 主應用程式（Docker 化）
│   ├── backend/                  ← FastAPI 後端（Port 8001）
│   │   ├── main.py
│   │   ├── requirements.txt      ★ Python 依賴宣告
│   │   ├── Dockerfile            ★ 容器建構定義
│   │   ├── migrations/           ← SQL schema migration
│   │   ├── repositories/         ← DB 存取層
│   │   ├── routers/              ← API 路由
│   │   ├── resources/            ← nutrient_field_map.json 等
│   │   ├── scripts/              ← 資料匯入/評估腳本
│   │   └── database/             ← foodb.sql（已 gitignore，2.3GB）
│   ├── control/                  ← FastAPI 控制層（Port 8000）
│   │   ├── main.py
│   │   ├── requirements.txt      ★ Python 依賴宣告
│   │   ├── Dockerfile            ★ 容器建構定義
│   │   ├── app/routers/          ← API 路由（含 advisor LLM pipeline）
│   │   └── resources/            ← 同義詞辭典、DRI JSON、停用詞等
│   ├── frontend/                 ← React SPA（Port 3001）
│   │   ├── package.json          ★ npm 依賴宣告
│   │   ├── Dockerfile            ★ 多階段建構（builder + nginx）
│   │   ├── vite.config.js
│   │   └── src/
│   ├── health-vector/            ← 健康向量搜尋服務（Port 8003）
│   │   ├── server.py
│   │   └── data/                 ← health_effects JSON
│   ├── docker-compose.yml        ★ 編排定義（參考用，實際用 start-dev.sh）
│   ├── start-dev.sh              ← 啟動腳本（docker run + host network）
│   └── .env.example              ★ 環境變數範本
├── graph/                        ← GraphRAG 學習子專案
│   ├── 計畫.md                   ← 10 phase 計畫主檔
│   ├── requirements.txt          ★ Python 依賴宣告
│   ├── src/                      ← GraphRAG 核心程式碼
│   │   ├── api_server.py         ← GraphRAG API（Port 8002）
│   │   ├── 08_retrieval_comparison.py
│   │   └── _paths.py             ← 路徑隔離（HF cache 重定向）
│   ├── 論文50/                    ← 65 篇運動營養學 PDF（英文論文）
│   ├── data/                     ← JSONL 中間產物
│   │   ├── chunks.jsonl          ← 1,668 text chunks
│   │   ├── entities.jsonl        ← 10,172 entities
│   │   ├── relations.jsonl       ← 4,585 relations
│   │   ├── graph.gml             ← NetworkX 圖
│   │   └── reports.jsonl         ← 20 community reports
│   └── notes/                    ← 每 phase 筆記
├── *.xlsx                        ← 權威來源資料檔（HPA DRI v8、台灣食品）
├── *.docx                        ← 技術教學文件、論文草稿
├── CLAUDE.md                     ← Claude Code 開發指引
└── .gitignore
```

---

## 環境需求

| 類別 | 工具 | 版本需求 | 用途 |
|---|---|---|---|
| 容器 | Docker Engine | ≥ 24.0 | 執行 Postgres、Backend、Control、Frontend |
| 執行期 | Python | ≥ 3.11 | Backend/Control 的 Dockerfile base image |
| 執行期 | Node.js | ≥ 20 | Frontend 建構 |
| 執行期 | PostgreSQL | 16 (alpine) | 主資料庫（Docker image 提供） |
| GPU（選用） | NVIDIA CUDA | ≥ 12.x | Control 服務的 PyTorch 語意匹配 |
| 本機 LLM（選用） | llama.cpp | latest | GraphRAG 查詢階段的 Gemma 推論 |
| OS | Linux (Ubuntu 24.04+) | — | 開發環境 |

---

## 依賴來源總覽

### recipe-ai/backend（Python 後端）

**來源檔**: [`recipe-ai/backend/requirements.txt`](recipe-ai/backend/requirements.txt)

| 套件 | 版本 | 來源 | 用途 |
|---|---|---|---|
| fastapi | 0.115.0 | PyPI | Web 框架 |
| uvicorn[standard] | 0.32.0 | PyPI | ASGI 伺服器 |
| asyncpg | 0.30.0 | PyPI | PostgreSQL 非同步驅動（無 ORM） |
| pydantic | 2.10.0 | PyPI | 資料驗證 |
| pydantic-settings | 2.6.0 | PyPI | 環境變數設定管理 |
| python-dotenv | 1.0.1 | PyPI | .env 檔讀取 |
| loguru | 0.7.2 | PyPI | 結構化日誌 |

**Dockerfile 額外安裝**: `gcc`, `libpq-dev`（編譯 asyncpg 需要）

**容器 base image**: `python:3.11-slim`

---

### recipe-ai/control（Python 控制層 / AI 核心）

**來源檔**: [`recipe-ai/control/requirements.txt`](recipe-ai/control/requirements.txt)

| 套件 | 版本 | 來源 | 用途 |
|---|---|---|---|
| fastapi | 0.115.0 | PyPI | Web 框架 |
| uvicorn[standard] | 0.32.0 | PyPI | ASGI 伺服器 |
| httpx | 0.28.0 | PyPI | 非同步 HTTP client（呼叫 backend） |
| nltk | 3.9.1 | PyPI | WordNet 同義詞擴展 |
| synonyms | 3.25.1 | PyPI | 中文同義詞 |
| argostranslate | ≥ 1.11.0 | PyPI | 離線中英翻譯（隔離 venv `/opt/argos_venv`，因 pydantic v1/v2 衝突） |
| opencc-python-reimplemented | ≥ 0.1.6 | PyPI | 簡繁轉換 |
| python-jose[cryptography] | 3.3.0 | PyPI | JWT 驗證 |
| passlib[bcrypt] | 1.7.4 | PyPI | 密碼雜湊 |
| bcrypt | 4.0.1 | PyPI | bcrypt 加密 |
| loguru | 0.7.2 | PyPI | 日誌 |
| pydantic[email] | 2.10.0 | PyPI | 資料驗證（含 email validator） |
| pydantic-settings | 2.6.0 | PyPI | 環境變數設定 |
| python-dotenv | 1.0.1 | PyPI | .env 讀取 |
| beautifulsoup4 | ≥ 4.12.0 | PyPI | 食譜 HTML 解析 |
| jieba | ≥ 0.42.1 | PyPI | 中文斷詞 |

**Dockerfile 額外步驟**:
1. `gcc`, `g++`（編譯 C 擴展）
2. NLTK 資料下載: `wordnet`, `omw-1.4`
3. Argos 翻譯模型: 中→英 + 英→中語言包（Dockerfile 內自動下載安裝）

**容器 base image**: `python:3.11-slim`

**本機開發 venv 額外依賴**（Docker 內不含，GPU 推論用）:
- `torch` (with CUDA) — 語意匹配
- `sentence-transformers` — 嵌入模型
- `ctranslate2` — 翻譯加速

---

### recipe-ai/frontend（React 前端）

**來源檔**: [`recipe-ai/frontend/package.json`](recipe-ai/frontend/package.json)

| 套件 | 版本 | 來源 | 用途 |
|---|---|---|---|
| react | ^18.3.0 | npm | UI 框架 |
| react-dom | ^18.3.0 | npm | React DOM 渲染 |
| react-router-dom | ^6.28.0 | npm | 客戶端路由 |
| axios | ^1.7.0 | npm | HTTP client |
| recharts | ^3.8.0 | npm | 圖表元件（營養素雷達圖等） |
| zustand | ^5.0.0 | npm | 狀態管理 |
| three | ^0.184.0 | npm | 3D 渲染（首頁動畫） |
| @tweenjs/tween.js | ^25.0.0 | npm | 動畫插值 |
| pdfjs-dist | ^5.7.284 | npm | PDF 檢視器（GraphRAG 論文閱讀） |

**DevDependencies**:

| 套件 | 版本 | 來源 | 用途 |
|---|---|---|---|
| vite | ^6.0.0 | npm | 建構工具 |
| @vitejs/plugin-react | ^4.3.0 | npm | React HMR |

**Dockerfile**: 多階段建構
1. `node:20-alpine` 建構 → `npm run build`
2. `nginx:alpine` 提供靜態檔 + SPA fallback + 反向代理

---

### recipe-ai/health-vector（健康向量服務）

**來源檔**: 無獨立 requirements.txt（使用 control 的 venv 或手動安裝）

| 套件 | 版本 | 來源 | 用途 |
|---|---|---|---|
| fastapi | — | PyPI | Web 框架 |
| chromadb | ≥ 0.4.22 | PyPI | 向量資料庫 |
| sentence-transformers | ≥ 2.5 | PyPI + HuggingFace | 文本嵌入 |

**嵌入模型**: `Snowflake/snowflake-arctic-embed-l-v2.0`（首次啟動自動從 HuggingFace 下載，約 2.2GB）

---

### graph/（GraphRAG 子專案）

**來源檔**: [`graph/requirements.txt`](graph/requirements.txt)

| 套件 | 版本 | 來源 | 用途 |
|---|---|---|---|
| networkx | ≥ 3.2 | PyPI | 圖資料結構 |
| python-louvain | ≥ 0.16 | PyPI | Louvain 社群偵測 |
| igraph | ≥ 0.11 | PyPI | 高效圖演算法 |
| leidenalg | ≥ 0.10 | PyPI | Leiden 社群偵測 |
| sentence-transformers | ≥ 2.5 | PyPI + HuggingFace | 文本嵌入 |
| chromadb | ≥ 0.4.22 | PyPI | 向量儲存 |
| pypdf | ≥ 4.0 | PyPI | PDF 文字擷取 |
| pdfplumber | ≥ 0.10 | PyPI | PDF 表格/圖表擷取 |
| pyvis | ≥ 0.3.2 | PyPI | 圖視覺化 |
| matplotlib | ≥ 3.8 | PyPI | 圖表繪製 |
| tiktoken | ≥ 0.5 | PyPI | Token 計數（cl100k_base） |
| tqdm | latest | PyPI | 進度條 |

**嵌入模型**: `Snowflake/snowflake-arctic-embed-l-v2.0`（首次啟動自動從 HuggingFace 下載）

**LLM 推論**: Gemma-4-E4B Q8_0（需另外下載 GGUF 模型檔，透過 llama.cpp 的 `llama-server` 提供）

---

### Docker 編排

**來源檔**: [`recipe-ai/docker-compose.yml`](recipe-ai/docker-compose.yml)（參考用）

**實際啟動方式**: `start-dev.sh`（使用 `docker run --network host`，而非 docker-compose）

| Image | 來源 | 用途 |
|---|---|---|
| `postgres:16-alpine` | Docker Hub | 主資料庫 |
| `python:3.11-slim` | Docker Hub | Backend + Control base |
| `node:20-alpine` | Docker Hub | Frontend 建構階段 |
| `nginx:alpine` | Docker Hub | Frontend 運行階段 |

---

## 外部資料來源

以下資料檔因體積或版權原因不納入 git，需手動取得：

### 1. FooDB 食品資料庫（必要）

- **用途**: `recipe_ai` PostgreSQL 中的食品化合物、營養素資料
- **來源**: https://foodb.ca/downloads
- **檔案**: `foodb.sql`（約 2.3GB）
- **匯入方式**:
  ```bash
  # 將 foodb.sql 放到 recipe-ai/backend/database/
  docker cp recipe-ai/backend/database/foodb.sql recipe_ai_db:/tmp/
  docker exec -it recipe_ai_db psql -U postgres -d recipe_ai -f /tmp/foodb.sql
  ```

### 2. 台灣食品營養成分資料庫 2024 UPDATE2（已含於 repo）

- **用途**: `taiwan_foods` 表（2,213 筆食品 × 110 營養素欄位）
- **來源**: 衛生福利部食品藥物管理署
- **檔案**: `食品營養成分資料庫2024UPDATE2.xlsx`（已提交至 repo）
- **匯入方式**:
  ```bash
  docker cp recipe-ai/backend/scripts/import_taiwan_foods_2024update2.py recipe-backend:/app/
  docker cp 食品營養成分資料庫2024UPDATE2.xlsx recipe-backend:/app/
  docker exec --user root recipe-backend pip install openpyxl
  docker exec recipe-backend python import_taiwan_foods_2024update2.py
  ```

### 3. HPA 第八版 DRI 膳食營養素參考攝取量（已含於 repo）

- **用途**: 營養缺口分析的參考標準
- **來源**: 衛生福利部國民健康署
- **檔案**: `3.「國人膳食營養素參考攝取量」第八版_總表(1111020).pdf` + `.xlsx`
- **轉換後**: `recipe-ai/control/resources/hpa_dri_v8.json`（已含於 repo）

### 4. HuggingFace 嵌入模型（自動下載）

- **模型**: `Snowflake/snowflake-arctic-embed-l-v2.0`
- **大小**: 約 2.2GB
- **來源**: https://huggingface.co/Snowflake/snowflake-arctic-embed-l-v2.0
- **下載時機**: health-vector / graph 服務首次啟動時自動下載到 `.cache/huggingface/`

### 5. Gemma LLM 模型（GraphRAG 專用，選用）

- **模型**: `google/gemma-4-E4B-it` Q8_0 量化版
- **格式**: GGUF
- **用途**: GraphRAG 查詢階段的 LLM 推論
- **啟動**: 需 llama.cpp，見下方 [GraphRAG 啟動](#graphrag-啟動graphrag-子專案)

### 6. NLTK 資料（Dockerfile 自動下載）

- `wordnet`, `omw-1.4`
- Control 的 Dockerfile 在建構時自動下載

### 7. Argos 翻譯模型（Dockerfile 自動下載）

- 中→英、英→中語言包
- Control 的 Dockerfile 在建構時自動安裝

---

## 快速開始

### 1. Clone 並設定環境變數

```bash
git clone https://github.com/<your-username>/recipe-ai-workspace.git
cd recipe-ai-workspace

# 複製 .env 範本
cp recipe-ai/.env.example recipe-ai/.env
cp recipe-ai/backend/.env.example recipe-ai/backend/.env
cp recipe-ai/control/.env.example recipe-ai/control/.env

# 編輯 recipe-ai/.env，設定：
#   POSTGRES_PASSWORD=<自訂密碼>
#   JWT_SECRET=<隨機長字串>
```

### 2. 啟動主服務（Docker）

```bash
cd recipe-ai
./start-dev.sh start
# 或手動：
./start-dev.sh build   # 首次需建構 image
./start-dev.sh start   # 啟動全部容器
./start-dev.sh status  # 確認狀態
```

### 3. 匯入資料

```bash
# PostgreSQL migration 會在容器首次啟動時自動執行
# (backend/migrations/ 掛載為 docker-entrypoint-initdb.d)

# 匯入 FooDB（需先下載 foodb.sql）
docker cp recipe-ai/backend/database/foodb.sql recipe_ai_db:/tmp/
docker exec recipe_ai_db psql -U postgres -d recipe_ai -f /tmp/foodb.sql

# 匯入台灣食品資料
docker cp recipe-ai/backend/scripts/import_taiwan_foods_2024update2.py recipe-backend:/app/
docker cp 食品營養成分資料庫2024UPDATE2.xlsx recipe-backend:/app/
docker exec --user root recipe-backend pip install openpyxl
docker exec recipe-backend python import_taiwan_foods_2024update2.py
```

### 4. 存取

- **主應用**: http://localhost:3001
- **AI 營養顧問**: http://localhost:3001/advisor
- **整合營養分析**: http://localhost:3001/analysis
- **營養素排名**: http://localhost:3001/nutrient-ranking

### GraphRAG 啟動（GraphRAG 子專案）

```bash
# 1. 建立 Python venv
cd graph
python3 -m venv .venv
.venv/bin/pip install -r requirements.txt

# 2. 啟動 Gemma LLM（需 llama.cpp + GGUF 模型檔）
~/llama.cpp/build/bin/llama-server \
  -m ~/models/google_gemma-4-E4B-it-Q8_0.gguf \
  -ngl 99 -c 16384 --jinja --host 0.0.0.0 --port 8080

# 3. 啟動 GraphRAG API
.venv/bin/python src/api_server.py

# 4. 存取 GraphRAG 頁面
# http://localhost:3001/graphrag
```

---

## .gitignore 排除說明

以下檔案/目錄已從版本控制中排除，需手動重建：

| 排除項目 | 大小 | 重建方式 |
|---|---|---|
| `recipe-ai/control/venv/` | 7.7 GB | `pip install -r requirements.txt`（Docker 建構時自動） |
| `graph/.venv/` | 5.5 GB | `python3 -m venv .venv && .venv/bin/pip install -r requirements.txt` |
| `graph/.cache/` | 2.6 GB | 首次載入 sentence-transformers 模型時自動下載 |
| `recipe-ai/backend/database/foodb.sql` | 2.3 GB | 從 https://foodb.ca/downloads 下載 |
| `recipe-ai/health-vector/.cache/` | 2.2 GB | 首次啟動 health-vector 服務時自動下載 |
| `recipe-ai/frontend/node_modules/` | 253 MB | `cd frontend && npm install` |
| `graph/data/figures/` | 117 MB | 由 PDF 擷取腳本重建 |
| `recipe-ai/scripts/output/` | 85 MB | 由 `scripts/` 下的評估腳本重新產生 |
| `graph/corpus_text/` | 15 MB | 由 PDF→text 轉換重建 |
| `**/chroma_db/` | ~60 MB | 由嵌入模型重新建構向量索引 |
| `recipe-ai/control/resources/backups/` | 19 MB | 服務啟動時自動建立快照 |
| `*.log` | ~65 MB | 執行期自動產生 |
| `.env` | — | 從 `.env.example` 複製並填入機敏資訊 |
| `ui-ux-pro-max-skill/` | 17 MB | `git clone https://github.com/nextlevelbuilder/ui-ux-pro-max-skill.git`（第三方 Claude Code skill） |
| `.venv/`（root） | 14 MB | root 層不需要，開發用 graph/.venv 或容器內 venv |

---

## 關聯 Repo

| Repo | 可見度 | 說明 |
|---|---|---|
| [recipe-ai-workspace](https://github.com/joshua-coding-garden/recipe-ai-workspace)（本 repo） | **Public** | 完整原始碼、技術文件、依賴宣告 |
| [recipe-ai-papers](https://github.com/joshua-coding-garden/recipe-ai-papers) | **Private** | GraphRAG 子專案使用的 65 篇運動營養學論文 PDF（版權考量） |

### 如何取得論文 PDF（有權限者）

```bash
# 在本 repo 根目錄下
git clone https://github.com/joshua-coding-garden/recipe-ai-papers.git graph/論文50
```

論文已列於 `.gitignore`，clone 後不會被意外提交。

---

## 授權

本專案為學術研究用途。
