"""Phase 1：文字正規化 + tiktoken 切塊。

策略：
- 正規化：保守清理 PDF 共通的頁眉頁尾雜訊
  - 整行命中固定 pattern（如 www.thelancet.com、Vol/Page、DOI 行、Published Online）
  - 連續多餘空白行壓成單一空白行
  - **不動**字間黏連（如 "D e s p i t e"）—— 留給 LLM 在 Phase 2 容忍處理
  - 註：行 drop pattern 原為 Lancet PDF 設計；運動營養期刊命中率較低但不影響功能
- 切塊：tiktoken cl100k_base，**1200 token / overlap 100**（計畫.md 原案）
  - 建構階段走 Claude Agent，無需配合 Gemma 8K context 上限
- 輸出：data/chunks.jsonl，每行
  {chunk_id, doc_id, doc_filename, chunk_idx, n_tokens, char_start, char_end, text}

執行：.venv/bin/python src/01_normalize_and_chunk.py
"""
from __future__ import annotations

import _paths  # noqa: F401

import json
import re
import sys
from pathlib import Path

import tiktoken

from _paths import CORPUS_TEXT_DIR, DATA_DIR

CHUNK_TOKENS = 1200
OVERLAP_TOKENS = 100
ENCODING_NAME = "cl100k_base"

# 行級命中即整行刪除（Lancet PDF 常見頁眉頁尾）
LINE_DROP_PATTERNS = [
    re.compile(r"^\s*www\.thelancet\.com\s+.*Vol\s+\d+\s+.*\d{4}.*\d+\s*$"),  # 完整頁腳行
    re.compile(r"^\s*www\.thelancet\.com\s*$"),
    re.compile(r"^\s*Vol\s+\d+\s+\w+\s+\d+,?\s+\d{4}\s*$"),                   # 「Vol 393 February 23, 2019」單行
    re.compile(r"^\s*Published\s+Online\s+.*\d{4}\s*$", re.IGNORECASE),
    re.compile(r"^\s*https?://(dx\.)?doi\.org/.*$", re.IGNORECASE),
    re.compile(r"^\s*See\s+.*\s+page\s+\d+\s*$", re.IGNORECASE),              # 「See Comment page 444」
    re.compile(r"^\s*\d+\s*$"),                                                # 純頁碼行
    re.compile(r"^\s*Articles\s*$"),                                           # 空標題行
    re.compile(r"^\s*The\s+Lancet\s+Commissions\s*$"),
]


def normalize_text(text: str) -> tuple[str, dict[str, int]]:
    """回傳 (cleaned_text, stats)。stats 統計各 pattern 命中行數。"""
    stats: dict[str, int] = {"input_lines": 0, "dropped_lines": 0, "blank_collapsed": 0}
    out_lines: list[str] = []
    prev_blank = False

    for line in text.splitlines():
        stats["input_lines"] += 1
        if any(p.match(line) for p in LINE_DROP_PATTERNS):
            stats["dropped_lines"] += 1
            continue
        is_blank = not line.strip()
        if is_blank and prev_blank:
            stats["blank_collapsed"] += 1
            continue
        prev_blank = is_blank
        out_lines.append(line)

    return "\n".join(out_lines), stats


def chunk_by_tokens(
    text: str,
    encoder: tiktoken.Encoding,
    chunk_tokens: int,
    overlap_tokens: int,
) -> list[tuple[int, int, str, int]]:
    """回傳 [(char_start, char_end, chunk_text, n_tokens), ...]。

    用 tiktoken 切，再用 decode 取出文字、再用 text.find 對應到原始字元位置。
    """
    tokens = encoder.encode(text)
    chunks: list[tuple[int, int, str, int]] = []
    step = chunk_tokens - overlap_tokens
    if step <= 0:
        raise ValueError("overlap 必須小於 chunk 大小")

    cursor_char = 0
    for i in range(0, len(tokens), step):
        token_window = tokens[i : i + chunk_tokens]
        if not token_window:
            break
        chunk_text = encoder.decode(token_window)

        # 嘗試在原文中對齊起始位置
        start_char = text.find(chunk_text[:64], cursor_char) if len(chunk_text) >= 64 else cursor_char
        if start_char < 0:
            start_char = cursor_char
        end_char = start_char + len(chunk_text)
        chunks.append((start_char, end_char, chunk_text, len(token_window)))
        cursor_char = max(cursor_char, start_char + step * 4)  # 估計步進（4 字元/token）

        if i + chunk_tokens >= len(tokens):
            break

    return chunks


def main() -> None:
    DATA_DIR.mkdir(parents=True, exist_ok=True)
    encoder = tiktoken.get_encoding(ENCODING_NAME)

    txt_files = sorted(CORPUS_TEXT_DIR.glob("*.txt"))
    if not txt_files:
        print(f"找不到 corpus 純文字：{CORPUS_TEXT_DIR}", file=sys.stderr)
        sys.exit(1)

    out_path = DATA_DIR / "chunks.jsonl"
    norm_dir = CORPUS_TEXT_DIR / ".normalized"
    norm_dir.mkdir(exist_ok=True)

    total_chunks = 0
    total_tokens = 0
    summary_rows: list[tuple[str, int, int, int, int]] = []  # (filename, input_chars, normalized_chars, n_chunks, n_tokens)

    with out_path.open("w", encoding="utf-8") as f_out:
        for doc_idx, txt_path in enumerate(txt_files):
            raw = txt_path.read_text(encoding="utf-8")
            cleaned, stats = normalize_text(raw)
            (norm_dir / txt_path.name).write_text(cleaned, encoding="utf-8")

            chunks = chunk_by_tokens(cleaned, encoder, CHUNK_TOKENS, OVERLAP_TOKENS)
            doc_id = f"doc_{doc_idx:02d}"
            doc_total_tokens = 0
            for chunk_idx, (cs, ce, text_, n_tok) in enumerate(chunks):
                rec = {
                    "chunk_id": f"{doc_id}_chunk_{chunk_idx:03d}",
                    "doc_id": doc_id,
                    "doc_filename": txt_path.stem,
                    "chunk_idx": chunk_idx,
                    "n_tokens": n_tok,
                    "char_start": cs,
                    "char_end": ce,
                    "text": text_,
                }
                f_out.write(json.dumps(rec, ensure_ascii=False) + "\n")
                doc_total_tokens += n_tok
            summary_rows.append((txt_path.stem, len(raw), len(cleaned), len(chunks), doc_total_tokens))
            total_chunks += len(chunks)
            total_tokens += doc_total_tokens
            print(
                f"[{doc_idx + 1}/{len(txt_files)}] {txt_path.stem[:50]:<50} "
                f"{len(raw):>7,}→{len(cleaned):>7,} chars  "
                f"{len(chunks):>3} chunks  "
                f"drop {stats['dropped_lines']:>3} lines, collapse {stats['blank_collapsed']:>3} blanks"
            )

    print()
    print("=" * 100)
    print(f"{'doc':<50} {'in_chars':>10} {'out_chars':>10} {'chunks':>7} {'tokens':>10}")
    print("-" * 100)
    for name, ic, oc, n, t in summary_rows:
        short = name if len(name) <= 48 else name[:45] + "..."
        print(f"{short:<50} {ic:>10,} {oc:>10,} {n:>7} {t:>10,}")
    print("-" * 100)
    print(f"{'TOTAL':<50} {sum(r[1] for r in summary_rows):>10,} {sum(r[2] for r in summary_rows):>10,} "
          f"{total_chunks:>7} {total_tokens:>10,}")
    print(f"\n寫入：{out_path}")
    print(f"正規化備份：{norm_dir}")


if __name__ == "__main__":
    main()
