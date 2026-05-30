"""
build_clean_corpus.py — 移除 full_text 中的人工標題，產生 corpus_clean.jsonl

用法：
  python scripts/build_clean_corpus.py
"""
import json
from pathlib import Path

SCRIPT_DIR = Path(__file__).resolve().parent
INPUT = SCRIPT_DIR / "output" / "corpus_all.jsonl"
OUTPUT = SCRIPT_DIR / "output" / "corpus_clean.jsonl"

HEADERS_TO_REMOVE = [
    "食材：\n",
    "作法：\n",
    "小撇步：\n",
]


def clean_full_text(text: str) -> str:
    for header in HEADERS_TO_REMOVE:
        text = text.replace(header, "")
    return text


def main():
    records = []
    with open(INPUT, "r", encoding="utf-8") as f:
        for line in f:
            if not line.strip():
                continue
            r = json.loads(line)
            r["full_text"] = clean_full_text(r["full_text"])
            records.append(r)

    with open(OUTPUT, "w", encoding="utf-8") as f:
        for r in records:
            f.write(json.dumps(r, ensure_ascii=False) + "\n")

    print(f"Done: {len(records)} records -> {OUTPUT}")


if __name__ == "__main__":
    main()
