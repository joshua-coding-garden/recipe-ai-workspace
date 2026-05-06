"""Phase 0：把 Stage A 的中文 PDF 解析成純文字。

策略：
- 主解析器：pypdf（純 Python、輕量）
- Fallback：pdfplumber（pypdf 抓不到文字時改用）
- 範圍：論文20/ 根目錄下的 PDF（不遞迴進子資料夾）
- 輸出：corpus_text/<原檔名>.txt
- 同時印出字元數，讓使用者目測解析品質

執行：.venv/bin/python src/00_pdf_to_text.py
"""
from __future__ import annotations

import _paths  # noqa: F401  設環境變數 + 暴露常數

import sys
from pathlib import Path

from pypdf import PdfReader
import pdfplumber

from _paths import CORPUS_PDF_DIR, CORPUS_TEXT_DIR


def extract_with_pypdf(pdf_path: Path) -> str:
    reader = PdfReader(str(pdf_path))
    parts: list[str] = []
    for page in reader.pages:
        try:
            parts.append(page.extract_text() or "")
        except Exception as e:
            parts.append(f"[pypdf 解析錯誤: {e}]")
    return "\n".join(parts)


def extract_with_pdfplumber(pdf_path: Path) -> str:
    parts: list[str] = []
    with pdfplumber.open(str(pdf_path)) as pdf:
        for page in pdf.pages:
            parts.append(page.extract_text() or "")
    return "\n".join(parts)


def parse_pdf(pdf_path: Path) -> tuple[str, str]:
    """回傳 (text, parser_used)。若 pypdf 抓到 < 200 字元，改試 pdfplumber。"""
    text = extract_with_pypdf(pdf_path)
    if len(text.strip()) < 200:
        try:
            text2 = extract_with_pdfplumber(pdf_path)
            if len(text2.strip()) > len(text.strip()):
                return text2, "pdfplumber"
        except Exception as e:
            print(f"  pdfplumber fallback 失敗: {e}", file=sys.stderr)
    return text, "pypdf"


def main() -> None:
    CORPUS_TEXT_DIR.mkdir(parents=True, exist_ok=True)

    pdfs = sorted(p for p in CORPUS_PDF_DIR.iterdir() if p.is_file() and p.suffix.lower() == ".pdf")
    if not pdfs:
        print(f"找不到 PDF：{CORPUS_PDF_DIR}", file=sys.stderr)
        sys.exit(1)

    print(f"Stage A 語料：{len(pdfs)} 個根目錄中文 PDF\n")

    rows: list[tuple[str, int, str]] = []
    for i, pdf_path in enumerate(pdfs, 1):
        print(f"[{i}/{len(pdfs)}] {pdf_path.name}")
        text, parser = parse_pdf(pdf_path)
        out_path = CORPUS_TEXT_DIR / (pdf_path.stem + ".txt")
        out_path.write_text(text, encoding="utf-8")
        n_chars = len(text)
        rows.append((pdf_path.name, n_chars, parser))
        print(f"   → {out_path.name}（{n_chars:,} chars，{parser}）\n")

    print("=" * 80)
    print(f"{'檔名':<60} {'字元':>10}  parser")
    print("-" * 80)
    for name, n, parser in rows:
        short = name if len(name) <= 58 else name[:55] + "..."
        print(f"{short:<60} {n:>10,}  {parser}")
    print("=" * 80)
    print(f"總計：{sum(r[1] for r in rows):,} 字元，輸出於 {CORPUS_TEXT_DIR}")


if __name__ == "__main__":
    main()
