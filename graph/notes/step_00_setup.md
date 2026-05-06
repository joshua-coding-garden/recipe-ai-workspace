# Phase 0：環境準備 + 語料探勘

> 目標：把 venv、套件、目錄結構、PDF→純文字流水線就位，並印出每份檔案的字元數讓人目測解析品質。

## 做了什麼

### 1. 目錄與配置
- `graph/.venv/`：本專案專屬 Python 3.11.14 虛擬環境
- `graph/requirements.txt`：12 個套件（networkx / louvain / leiden / sentence-transformers / chromadb / pypdf / pdfplumber / pyvis / matplotlib / tiktoken / tqdm）
- `graph/.gitignore`：排除 venv、cache、產物目錄
- `graph/src/_paths.py`：共用路徑模組，把 `HF_HOME`、`TRANSFORMERS_CACHE`、`SENTENCE_TRANSFORMERS_HOME` 全部重定向到 `graph/.cache/`，**所有 script 開頭 `import _paths` 即可**

子目錄樹：
```
graph/
├── src/                    # 程式碼（00–09）
├── data/                   # JSONL / GML 中間產物
├── viz/                    # 互動式 HTML 視覺化
├── notes/                  # 階段筆記（你正在讀這份）
├── corpus_text/            # PDF 解析後的純文字
├── chroma_db/              # 向量庫（持久化）
├── .cache/huggingface/     # HF 模型快取（重定向到此）
├── .cache/sentence_transformers/
└── .venv/                  # Python 虛擬環境
```

### 2. 安裝套件
```bash
.venv/bin/pip install -r requirements.txt
```
全部成功，含 PyTorch、CUDA wheels、chromadb 1.5.9、sentence-transformers 5.4.1、leidenalg 0.11.0。共 130+ 套件。安裝產物約 4.5 GB，全部位於 `graph/.venv/`，無系統污染。

### 3. PDF→純文字（`src/00_pdf_to_text.py`）
- 主解析器：`pypdf`
- Fallback：當 pypdf 抽到 < 200 字元時改用 `pdfplumber`
- 輸入範圍：`論文20/` 根目錄下的 PDF（不遞迴子資料夾）
- 輸出：`corpus_text/<原檔名>.txt`

執行結果（**Stage A**）：

| # | 檔名 | 字元數 | parser |
|---|---|---:|---|
| 1 | 2017 年全球疾病負擔（GBD）飲食風險分析 | 80,571 | pypdf |
| 2 | 全球疾病負擔 2019 系列分析 (含營養素缺乏) | 145,989 | pypdf |
| 3 | 全球貧血盛行率及其微量營養素成因(簡) | 2,590 | pypdf |
| 4 | 水果、蔬菜與豆類的黃金攝取量 (PURE 研究) | 75,200 | pypdf |
| 5 | 碳水化合物的「品質」對健康的影響 | 62,898 | pypdf |
| 6 | 肥胖、營養不良與氣候變遷的全球綜合症 | 357,353 | pypdf |
| 7 | 關於永續與全球健康飲食的里程碑 | 301,275 | pypdf |
| | **總計** | **1,025,876** | |

7 份全部 pypdf 一次成功，沒有觸發 pdfplumber fallback。

---

## ⚠️ 與計畫假設不符之處（已與作者確認）

### 差異 1：PDF 數量是 7 不是 8
計畫寫「根目錄 8 個中文摘要 PDF」，實際只有 7 個。差一份不影響 Stage A 學習目標。

### 差異 2（**重要**）：所有論文都是英文（**作者已確認**）
原計畫假設根目錄 PDF 是「中文摘要」，但實際內容全部是 The Lancet / Current Developments in Nutrition 等英文期刊原文，中文檔名只是作者貼的主題標籤。**作者明確確認：所有論文（包含 Stage B / C 子資料夾）都會是英文**。

抽查樣本：

| 檔名 | 實際內容 |
|---|---|
| 肥胖、營養不良與氣候變遷的全球綜合症 | The Lancet Commissions, Vol 393, Feb 2019 — *The Global Syndemic of Obesity, Undernutrition, and Climate Change*（**英文**） |
| 全球貧血盛行率及其微量營養素成因(簡) | Current Developments in Nutrition — *Global, Regional, and National Prevalence of Anemia...*（**英文**） |
| 2017 年全球疾病負擔（GBD）飲食風險分析 | The Lancet, Vol 393, May 2019 — *Articles*（**英文**） |
| 水果、蔬菜與豆類的黃金攝取量 (PURE 研究) | The Lancet, Vol 390, Nov 2017 — *Fruit, vegetable, and legume intake...*（**英文**） |
| 碳水化合物的「品質」對健康的影響 | The Lancet, Vol 393, Feb 2019 — *Carbohydrate quality and human health*（**英文**） |
| 關於永續與全球健康飲食的里程碑 | The Lancet Commissions — *Food in the Anthropocene: the EAT-Lancet Commission*（**英文**） |

**換句話說：中文檔名是作者自己貼的「主題標籤」，內容全部是 The Lancet 等英文期刊主論文。** 子資料夾（如 `2017 年全球疾病負擔（GBD）飲食風險分析/`）裡放的是同主題的延伸論文（勘誤、相關綜述）。

### 對後續 Phase 的設計（依「全英文語料」做必要調整，其餘維持計畫原案）

| 議題 | 設計 |
|---|---|
| Phase 1 chunking | 用 `tiktoken cl100k_base` 直接切英文，`token` 概念對英文很乾淨（~1 token/4 字元） |
| Phase 2 entity 抽取 prompt | entity types 維持計畫原案 5 類，但翻成英文：`PERSON / LOCATION / ORGANIZATION / EVENT / CONCEPT`。是否要為營養領域加 `DISEASE / NUTRIENT / FOOD / STUDY` 留到 Phase 2 進場前再決定 |
| 抽取輸出語言 | entity name、description、relation description 統一用**英文**，避免中英混雜導致同義詞偵測失敗 |
| Phase 5 嵌入 | 維持計畫原案 `paraphrase-multilingual-MiniLM-L12-v2`（多語，~470MB）；若 Phase 5 真的跑出英文效果不佳再評估換 `all-MiniLM-L6-v2` |
| LLM 角色分工 | **建構階段（Phase 2 entity 抽取、Phase 7 社群摘要）走計畫原案 Claude Agent subagent**；**查詢階段（Phase 8 三種檢索的最終回答、Phase 9 baseline）走本機 Gemma-2-27B（llama-server, port 8080, -c 5500）**——這是使用者明確的最終分工 |
| Entity resolution | **變簡單**——英文沒有簡繁體、全半形、直排雜訊，同義詞合併乾淨；只需處理大小寫、單複數、全名 vs 縮寫（如 "GBD" vs "Global Burden of Disease"） |

**Stage A 規模重估**：215 chunks 比預期大但仍可控，Phase 2 entity 抽取會比預期久（每 chunk 一次 LLM 呼叫，預估 3–5 小時，不是計畫表上的 30–60 分鐘）。如果要忠於原計畫的「快」，可考慮：
- (a) 用更大的 chunk size（例如 2000 token / overlap 200）→ 切下來約 130 chunks
- (b) 採子集（例如只取 4 篇代表作）
- (c) 直接吃完整 215 chunks，接受時間成本

### 解析品質微小瑕疵
觀察到一些字間黏連，例如：
```
Causesin204CountriesandTerritories
D e s p i t er e d u c t i o n s
```
這是 The Lancet 雙欄排版抽文字時常見的字距處理問題。Phase 1 chunking 前可加一個正規化步驟（合併過短 token、移除頁眉頁尾的固定字串如 "www.thelancet.com   Vol 393"），但**不影響**圖譜結構，可暫不處理、留到 Phase 1 再決定。

---

## 環境隔離自檢

| 檢查項 | 狀態 |
|---|---|
| pip install 全部進到 `.venv/Lib/site-packages/`？ | ✅ |
| HF / sentence-transformers 模型快取重定向？ | ✅（`_paths.py` 設好，但 Phase 0 沒實際下載任何模型，等 Phase 5 才會驗證） |
| 是否動到 `~/.bashrc` / 系統設定？ | ❌ 沒動 |
| 是否需要 admin / sudo？ | ❌ 完全沒用 |
| `rm -rf graph/` 是否能完整復原？ | ✅ 所有產物都在 `graph/` 內 |

---

## 後續 Phase 0 的決策紀錄

### chunk size：1200 / overlap 100（計畫原案）
中途曾因「配合本機 Gemma 8K context」放大到 2000/200，但後來確認**Gemma 只用於查詢階段、不用於建構**，建構走 Claude Agent 200K context 沒這個限制 → **回計畫原案 1200/100**。

### 文字正規化：保守清理
The Lancet PDF 雙欄排版有字間黏連（`Causesin204CountriesandTerritories`、`D e s p i t e`）與重複頁眉頁尾（`www.thelancet.com   Vol 393`）。決策：(a) 行級命中固定樣板字串即整行刪；(b) 不動字間黏連（修復字典查找成本高，且 LLM 抽 entity 容忍度足夠）。

### Stage A 範圍：擴到 20 篇主論文
原本只解析根目錄 7 個 PDF，使用者澄清語料應為 20 篇主題論文（15 個主題子資料夾 + 5 個獨立根目錄論文）。但子資料夾內容混亂（訃聞、勘誤、不相關文章），13 個未涵蓋的主題需用 PDF 第一頁標題/摘要識別主論文。詳見 [step_01_corpus_expansion.md](step_01_corpus_expansion.md)。
