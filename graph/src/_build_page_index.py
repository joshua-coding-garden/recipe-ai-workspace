"""對每個 PDF 計算每頁的字元邊界，產出 page_index.json。

用途：chunk 的 char_start → 快速查到 PDF 第幾頁。

注意：字元邊界是基於 pypdf 的 extract_text()，與 00_pdf_to_text.py 的
pdfplumber 產出有微幅差異，但足以做頁碼對應。
"""
import _paths
import json
from pathlib import Path
from pypdf import PdfReader

PDF_DIR = _paths.CORPUS_PDF_DIR
OUTPUT_FILE = _paths.DATA_DIR / "page_index.json"
METADATA_FILE = _paths.DATA_DIR / "paper_metadata.json"


def build_page_index():
    with open(METADATA_FILE) as f:
        metadata = json.load(f)

    page_index = {}
    errors = []

    for doc_id in sorted(metadata, key=lambda x: int(x.split("_")[1])):
        fname = metadata[doc_id]["filename"]
        pdf_path = PDF_DIR / f"{fname}.pdf"

        if not pdf_path.exists():
            errors.append(f"{doc_id}: PDF not found at {pdf_path}")
            continue

        try:
            reader = PdfReader(str(pdf_path))
            pages = []
            cumulative = 0

            for page_num, page in enumerate(reader.pages, start=1):
                text = page.extract_text() or ""
                char_count = len(text)
                pages.append({
                    "page": page_num,
                    "char_start": cumulative,
                    "char_end": cumulative + char_count,
                })
                cumulative += char_count

            page_index[doc_id] = pages
            print(f"  {doc_id}: {len(pages)} pages, {cumulative} chars")

        except Exception as e:
            errors.append(f"{doc_id}: {e}")

    with open(OUTPUT_FILE, "w", encoding="utf-8") as f:
        json.dump(page_index, f, ensure_ascii=False, indent=2)

    print(f"\n完成！{len(page_index)} 篇已建立頁碼索引 → {OUTPUT_FILE}")
    if errors:
        print(f"\n⚠ {len(errors)} 個錯誤：")
        for e in errors:
            print(f"  {e}")


if __name__ == "__main__":
    build_page_index()
