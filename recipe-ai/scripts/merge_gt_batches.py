"""
merge_gt_batches.py — 合併所有 gt_batch_output_*.jsonl 為 claude_ground_truth.jsonl

用法：
  python scripts/merge_gt_batches.py
  python scripts/merge_gt_batches.py --check  # 只檢查完成度
"""
import argparse
import json
from pathlib import Path

OUTPUT_DIR = Path(__file__).resolve().parent / "output"
MERGED = OUTPUT_DIR / "claude_ground_truth.jsonl"
TOTAL_RECIPES = 5034


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--check", action="store_true")
    args = parser.parse_args()

    batch_files = sorted(OUTPUT_DIR.glob("gt_batch_output_*.jsonl"))

    total_lines = 0
    all_records = []
    seen_urls = set()
    errors = []

    for bf in batch_files:
        with open(bf, "r", encoding="utf-8") as f:
            for line_num, line in enumerate(f, 1):
                if not line.strip():
                    continue
                try:
                    r = json.loads(line)
                    url = r.get("url", "")
                    gt = r.get("claude_ground_truth", [])
                    if not url:
                        errors.append(f"{bf.name}:{line_num} missing url")
                        continue
                    if url in seen_urls:
                        continue
                    seen_urls.add(url)
                    all_records.append(r)
                    total_lines += 1
                except json.JSONDecodeError as e:
                    errors.append(f"{bf.name}:{line_num} JSON error: {e}")

    print(f"Batch files found: {len(batch_files)}")
    print(f"Total GT records: {total_lines}")
    print(f"Coverage: {total_lines}/{TOTAL_RECIPES} ({total_lines/TOTAL_RECIPES*100:.1f}%)")

    if errors:
        print(f"\nErrors ({len(errors)}):")
        for e in errors[:10]:
            print(f"  {e}")

    avg_ingredients = sum(len(r.get("claude_ground_truth", [])) for r in all_records) / max(len(all_records), 1)
    print(f"Avg ingredients per recipe: {avg_ingredients:.1f}")

    if args.check:
        return

    with open(MERGED, "w", encoding="utf-8") as f:
        for r in all_records:
            f.write(json.dumps(r, ensure_ascii=False) + "\n")

    print(f"\nMerged to: {MERGED}")


if __name__ == "__main__":
    main()
