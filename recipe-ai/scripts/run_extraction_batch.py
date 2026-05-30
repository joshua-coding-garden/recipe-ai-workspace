"""
run_extraction_batch.py — 批量跑兩組食材提取 pipeline

對 corpus_clean.jsonl 的每筆 full_text 執行：
  1. Regex only (extract_keywords_with_amounts)
  2. Regex + AI 校正 (refine_extraction, 需 Gemma 運行)

用法（在 Docker 容器內）：
  python /app/scripts/run_extraction_batch.py
  python /app/scripts/run_extraction_batch.py --resume
  python /app/scripts/run_extraction_batch.py --regex-only  # 只跑 regex，不需 Gemma

輸出：scripts/output/extraction_results.jsonl
"""
from __future__ import annotations

import asyncio
import argparse
import json
import sys
import time
from pathlib import Path

sys.path.insert(0, "/app")

from app.services.ai_service import extract_keywords_with_amounts  # noqa: E402

try:
    from app.services.gemma_extraction_service import refine_extraction  # noqa: E402
    HAS_GEMMA_SERVICE = True
except ImportError:
    HAS_GEMMA_SERVICE = False

SCRIPT_DIR = Path(__file__).resolve().parent
INPUT = SCRIPT_DIR / "output" / "corpus_clean.jsonl"
OUTPUT = SCRIPT_DIR / "output" / "extraction_results.jsonl"


def load_done_urls(path: Path) -> set[str]:
    urls = set()
    if not path.exists():
        return urls
    with open(path, "r", encoding="utf-8") as f:
        for line in f:
            if line.strip():
                try:
                    urls.add(json.loads(line)["url"])
                except (json.JSONDecodeError, KeyError):
                    pass
    return urls


async def process_one(full_text: str, do_ai: bool) -> dict:
    regex_results = await extract_keywords_with_amounts(full_text)
    regex_only = [{"name": r["name"], "amount": r.get("amount", "")} for r in regex_results]

    regex_plus_ai = []
    corrections = []
    gemma_available = False

    if do_ai and HAS_GEMMA_SERVICE:
        try:
            refined = await refine_extraction(full_text, regex_results)
            regex_plus_ai = refined.get("refined", [])
            corrections = refined.get("corrections", [])
            gemma_available = refined.get("gemma_available", False)
        except Exception as e:
            print(f"  AI refinement error: {e}", file=sys.stderr)
            regex_plus_ai = [{"name": r["name"], "amount": r.get("amount", ""), "source": "regex"} for r in regex_results]

    return {
        "regex_only": regex_only,
        "regex_plus_ai": regex_plus_ai,
        "corrections": corrections,
        "gemma_available": gemma_available,
    }


async def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--resume", action="store_true")
    parser.add_argument("--regex-only", action="store_true", help="Skip AI refinement")
    parser.add_argument("--limit", type=int, default=0, help="Max recipes to process (0=all)")
    parser.add_argument("--concurrency", type=int, default=3, help="Parallel workers")
    args = parser.parse_args()

    do_ai = not args.regex_only

    done_urls = load_done_urls(OUTPUT) if args.resume else set()
    if args.resume:
        print(f"[resume] Skipping {len(done_urls)} already processed")

    recipes = []
    with open(INPUT, "r", encoding="utf-8") as f:
        for line in f:
            if line.strip():
                r = json.loads(line)
                if r["url"] not in done_urls:
                    recipes.append(r)

    if args.limit > 0:
        recipes = recipes[:args.limit]

    total = len(recipes)
    sem = asyncio.Semaphore(args.concurrency)
    lock = asyncio.Lock()
    counter = {"done": 0}
    print(f"Processing {total} recipes (AI={'ON' if do_ai else 'OFF'}, concurrency={args.concurrency})")

    t0 = time.time()

    async def worker(r):
        async with sem:
            result = await process_one(r["full_text"], do_ai)
        record = {
            "url": r["url"],
            "title": r.get("title", ""),
            **result,
        }
        line = json.dumps(record, ensure_ascii=False) + "\n"
        async with lock:
            with open(OUTPUT, "a", encoding="utf-8") as f:
                f.write(line)
            counter["done"] += 1
            n = counter["done"]
            if n % 50 == 0 or n == 1:
                elapsed = time.time() - t0
                rate = n / elapsed if elapsed > 0 else 0
                eta = (total - n) / rate / 60 if rate > 0 else 0
                print(f"  [{n}/{total}] {rate:.1f}/s, ETA {eta:.1f}min")

    await asyncio.gather(*(worker(r) for r in recipes))

    elapsed = time.time() - t0
    print(f"Done: {total} recipes in {elapsed/60:.1f} min")


if __name__ == "__main__":
    asyncio.run(main())
