"""
run_ai_refinement_batch.py — 對已有 regex 結果補跑 Gemma AI 校正

讀取 extraction_results.jsonl（已有 regex_only），對每筆補跑 refine_extraction，
寫出到 extraction_results_ai.jsonl。支援 --resume 斷點續跑。

用法（在 Docker 容器內）：
  python /app/scripts/run_ai_refinement_batch.py --resume
  python /app/scripts/run_ai_refinement_batch.py --resume --concurrency 1
"""
from __future__ import annotations

import asyncio
import argparse
import json
import sys
import time
from pathlib import Path

sys.path.insert(0, "/app")

from app.services.gemma_extraction_service import refine_extraction  # noqa: E402

SCRIPT_DIR = Path(__file__).resolve().parent
INPUT_REGEX = SCRIPT_DIR / "output" / "extraction_results.jsonl"
INPUT_CORPUS = SCRIPT_DIR / "output" / "corpus_clean.jsonl"
OUTPUT = SCRIPT_DIR / "output" / "extraction_results_ai.jsonl"
PROGRESS_FILE = SCRIPT_DIR / "output" / "ai_refinement_progress.json"


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


def load_corpus_texts(path: Path) -> dict[str, str]:
    texts = {}
    with open(path, "r", encoding="utf-8") as f:
        for line in f:
            if line.strip():
                r = json.loads(line)
                texts[r["url"]] = r["full_text"]
    return texts


def save_progress(done: int, total: int, elapsed: float, gemma_ok: int, gemma_fail: int):
    data = {
        "done": done,
        "total": total,
        "elapsed_min": round(elapsed / 60, 1),
        "gemma_ok": gemma_ok,
        "gemma_fail": gemma_fail,
        "updated": time.strftime("%Y-%m-%d %H:%M:%S"),
    }
    with open(PROGRESS_FILE, "w") as f:
        json.dump(data, f, indent=2)


async def process_one(full_text: str, regex_items: list[dict]) -> dict:
    regex_as_input = [{"name": r["name"], "amount": r.get("amount", "")} for r in regex_items]
    try:
        refined = await refine_extraction(full_text, regex_as_input)
        return {
            "regex_plus_ai": refined.get("refined", []),
            "corrections": refined.get("corrections", []),
            "gemma_available": refined.get("gemma_available", False),
        }
    except Exception as e:
        print(f"  AI error: {e}", file=sys.stderr)
        return {
            "regex_plus_ai": [],
            "corrections": [],
            "gemma_available": False,
        }


async def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--resume", action="store_true")
    parser.add_argument("--limit", type=int, default=0)
    parser.add_argument("--concurrency", type=int, default=1,
                        help="Parallel Gemma calls (1 recommended for stability)")
    args = parser.parse_args()

    print("Loading corpus texts...")
    corpus_texts = load_corpus_texts(INPUT_CORPUS)
    print(f"  {len(corpus_texts)} recipes in corpus")

    print("Loading regex results...")
    regex_records = []
    with open(INPUT_REGEX, "r", encoding="utf-8") as f:
        for line in f:
            if line.strip():
                regex_records.append(json.loads(line))
    print(f"  {len(regex_records)} regex results")

    done_urls = load_done_urls(OUTPUT) if args.resume else set()
    if args.resume:
        print(f"[resume] Skipping {len(done_urls)} already processed")

    to_process = [r for r in regex_records if r["url"] not in done_urls]
    if args.limit > 0:
        to_process = to_process[:args.limit]

    total = len(to_process)
    print(f"Processing {total} recipes (concurrency={args.concurrency})")

    sem = asyncio.Semaphore(args.concurrency)
    lock = asyncio.Lock()
    stats = {"done": 0, "gemma_ok": 0, "gemma_fail": 0}
    t0 = time.time()

    async def worker(rec):
        url = rec["url"]
        full_text = corpus_texts.get(url, "")
        if not full_text:
            print(f"  WARN: no corpus text for {url}", file=sys.stderr)
            return

        async with sem:
            result = await process_one(full_text, rec["regex_only"])

        record = {
            "url": url,
            "title": rec.get("title", ""),
            "regex_only": rec["regex_only"],
            **result,
        }
        line_out = json.dumps(record, ensure_ascii=False) + "\n"

        async with lock:
            with open(OUTPUT, "a", encoding="utf-8") as f:
                f.write(line_out)
            stats["done"] += 1
            if result["gemma_available"]:
                stats["gemma_ok"] += 1
            else:
                stats["gemma_fail"] += 1

            n = stats["done"]
            elapsed = time.time() - t0
            if n % 20 == 0 or n == 1 or n == total:
                rate = n / elapsed if elapsed > 0 else 0
                eta = (total - n) / rate / 60 if rate > 0 else 0
                print(f"  [{n}/{total}] {rate:.2f}/s | Gemma OK: {stats['gemma_ok']} | "
                      f"Fail: {stats['gemma_fail']} | ETA: {eta:.1f}min")
                save_progress(n, total, elapsed, stats["gemma_ok"], stats["gemma_fail"])

    # Process sequentially in batches to avoid overwhelming Gemma
    batch_size = args.concurrency
    for i in range(0, total, batch_size):
        batch = to_process[i:i + batch_size]
        await asyncio.gather(*(worker(r) for r in batch))

    elapsed = time.time() - t0
    save_progress(stats["done"], total, elapsed, stats["gemma_ok"], stats["gemma_fail"])
    print(f"\nDone: {stats['done']} recipes in {elapsed/60:.1f} min")
    print(f"Gemma OK: {stats['gemma_ok']}, Fail: {stats['gemma_fail']}")


if __name__ == "__main__":
    asyncio.run(main())
