# Phase 1：文字正規化 + Chunking

> 目標：把 7 個正規化後的純文字切成 LLM 可消化的 chunk，輸出到 `data/chunks.jsonl`，每 chunk 帶可追溯的字元偏移與 token 數。

## 設定（與作者拍板的差異）

| 項目 | 計畫原案 | 本次採用 | 原因 |
|---|---|---|---|
| chunk size | 1200 token | **2000 token** | 配合 Gemma-2 8192 context（chunk 2000 + system prompt + few-shot + output buffer） |
| overlap | 100 token | **200 token**（10%） | 同比例放大 |
| tokenizer | tiktoken cl100k_base | 同 | 英文語料 ~4 字元/token，估算與切塊都用同一把尺 |
| 正規化 | 計畫沒明確規範 | **保守清理** | 移除 The Lancet 頁眉頁尾固定字串，不動字間黏連 |

## 正規化規則（行級）

逐行匹配，**整行命中即刪**。不做 token 級替換，避免破壞 LLM 對原文的理解：

```python
LINE_DROP_PATTERNS = [
    r"^\s*www\.thelancet\.com\s+.*Vol\s+\d+\s+.*\d{4}.*\d+\s*$",  # 完整頁腳行
    r"^\s*www\.thelancet\.com\s*$",
    r"^\s*Vol\s+\d+\s+\w+\s+\d+,?\s+\d{4}\s*$",
    r"^\s*Published\s+Online\s+.*\d{4}\s*$",
    r"^\s*https?://(dx\.)?doi\.org/.*$",
    r"^\s*See\s+.*\s+page\s+\d+\s*$",
    r"^\s*\d+\s*$",                          # 純頁碼行
    r"^\s*Articles\s*$",
    r"^\s*The\s+Lancet\s+Commissions\s*$",
]
```

連續多餘空白行也會壓成一行。

### 已知遺漏

- **頁碼黏在 URL 前同一行**（如 `1958 www.thelancet.com   Vol 393   May 11, 2019`）沒被攔下。修這個 regex 收益有限——LLM 抽 entity 時自然會跳過。

## 切塊演算法

```python
encoder = tiktoken.get_encoding("cl100k_base")
tokens = encoder.encode(cleaned_text)
step = 2000 - 200 = 1800
for i in range(0, len(tokens), step):
    chunk = encoder.decode(tokens[i:i+2000])
```

每個 chunk 寫一行 JSON：

```json
{
  "chunk_id": "doc_00_chunk_000",
  "doc_id": "doc_00",
  "doc_filename": "2017 年全球疾病負擔（GBD）飲食風險分析",
  "chunk_idx": 0,
  "n_tokens": 2000,
  "char_start": 0,
  "char_end": 8047,
  "text": "..."
}
```

## 執行結果

| doc | in_chars | out_chars | 刪行 | chunks | tokens |
|---|---:|---:|---:|---:|---:|
| 2017 GBD | 80,571 | 80,028 | 33 | 12 | 22,782 |
| 全球疾病負擔 2019 | 145,989 | 145,166 | 41 | 23 | 45,872 |
| 全球貧血(簡) | 2,590 | 2,590 | 0 | 1 | 716 |
| 水果蔬菜豆類 PURE | 75,200 | 74,152 | 156 | 13 | 25,221 |
| 碳水化合物品質 | 62,898 | 62,079 | 128 | 9 | 16,994 |
| 肥胖綜合症 EAT-Lancet | 357,353 | 353,343 | 419 | 43 | 85,698 |
| 永續健康飲食 | 301,275 | 298,638 | 162 | 39 | 76,343 |
| **TOTAL** | **1,025,876** | **1,015,996** | **939** | **140** | **273,626** |

平均每 chunk 1,954 tokens（最大切到 2000、最小 716 是「全球貧血(簡)」這份本來就只有 716 token 的整份內容）。

## 與後續 Phase 的接點

### Phase 2 預估時間（用 Gemma-2-27B 本機 LLM）

| 項目 | 數值 |
|---|---|
| chunks 總數 | 140 |
| 每 chunk 輸入 | ~2000 token |
| 每 chunk 輸出（entity + relation JSON） | 估 ~600 token |
| Gemma-2 generation speed | 1.88 tok/s |
| 每 chunk 預估 | ~5 分鐘（含 prompt eval） |
| **Stage A 預估總時** | **~10–12 小時** |

可考慮平行：llama-server 預設只跑 1 個 slot，可開 `--parallel N` 但會吃 VRAM。當前 9.6/11.9 GB VRAM 已經滿，不太能再加 slot。**先序列跑**。

如果想壓縮時間，可改 chunk size 回 1200 token / overlap 100，相同 200 chunks 但每 chunk output 更短、context cache 命中率高，反而可能更快——這個下一階段再實測。

### Phase 5 嵌入

每個 entity 的 `name + description` 嵌入；不嵌 chunk 本身。

## 產物

- `data/chunks.jsonl` — 140 行
- `corpus_text/.normalized/*.txt` — 7 個正規化備份檔（debug 用）
- `src/01_normalize_and_chunk.py` — 可重跑、無副作用
