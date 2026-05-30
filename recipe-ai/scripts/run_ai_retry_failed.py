"""
run_ai_retry_failed.py — 只重跑 Gemma 失敗的筆數

讀取 extraction_results_ai.jsonl，找出 gemma_available=False 的 URL，
只對這些重跑 AI 校正，結果寫到 extraction_results_ai_retry.jsonl。
"""
from __future__ import annotations

import asyncio
import json
import sys
import time
from pathlib import Path

sys.path.insert(0, "/app")

from app.services.gemma_extraction_service import refine_extraction  # noqa: E402

SCRIPT_DIR = Path(__file__).resolve().parent
AI_FILE = SCRIPT_DIR / "output" / "extraction_results_ai.jsonl"
CORPUS_FILE = SCRIPT_DIR / "output" / "corpus_clean.jsonl"
OUTPUT = SCRIPT_DIR / "output" / "extraction_results_ai_retry.jsonl"
PROGRESS_FILE = SCRIPT_DIR / "output" / "ai_retry_progress.json"


def save_progress(done: int, total: int, elapsed: float, ok: int, fail: int):
    with open(PROGRESS_FILE, "w") as f:
        json.dump({
            "done": done, "total": total,
            "elapsed_min": round(elapsed / 60, 1),
            "gemma_ok": ok, "gemma_fail": fail,
            "updated": time.strftime("%Y-%m-%d %H:%M:%S"),
        }, f, indent=2)


async def process_one(full_text: str, regex_items: list[dict]) -> dict:
    try:
        refined = await refine_extraction(full_text, regex_items)
        return {
            "regex_plus_ai": refined.get("refined", []),
            "corrections": refined.get("corrections", []),
            "gemma_available": refined.get("gemma_available", False),
        }
    except Exception as e:
        print(f"  AI error: {e}", file=sys.stderr)
        return {"regex_plus_ai": [], "corrections": [], "gemma_available": False}


async def main():
    print("Loading corpus texts...")
    corpus = {}
    with open(CORPUS_FILE, "r", encoding="utf-8") as f:
        for line in f:
            if line.strip():
                r = json.loads(line)
                corpus[r["url"]] = r["full_text"]

    print("Loading AI results to find failures...")
    failed = []
    with open(AI_FILE, "r", encoding="utf-8") as f:
        for line in f:
            if line.strip():
                r = json.loads(line)
                if not r.get("gemma_available", False):
                    failed.append(r)

    # Check for already-retried URLs
    done_urls = set()
    if OUTPUT.exists():
        with open(OUTPUT, "r", encoding="utf-8") as f:
            for line in f:
                if line.strip():
                    try:
                        done_urls.add(json.loads(line)["url"])
                    except:
                        pass
        print(f"  Skipping {len(done_urls)} already retried")
        failed = [r for r in failed if r["url"] not in done_urls]

    total = len(failed)
    print(f"Retrying {total} failed recipes...")

    stats = {"done": 0, "ok": 0, "fail": 0}
    t0 = time.time()

    for rec in failed:
        url = rec["url"]
        full_text = corpus.get(url, "")
        if not full_text:
            print(f"  WARN: no text for {url}", file=sys.stderr)
            continue

        result = await process_one(full_text, rec["regex_only"])
        record = {
            "url": url,
            "title": rec.get("title", ""),
            "regex_only": rec["regex_only"],
            **result,
        }
        with open(OUTPUT, "a", encoding="utf-8") as f:
            f.write(json.dumps(record, ensure_ascii=False) + "\n")

        stats["done"] += 1
        if result["gemma_available"]:
            stats["ok"] += 1
        else:
            stats["fail"] += 1

        n = stats["done"]
        elapsed = time.time() - t0
        if n % 20 == 0 or n == 1 or n == total:
            rate = n / elapsed if elapsed > 0 else 0
            eta = (total - n) / rate / 60 if rate > 0 else 0
            print(f"  [{n}/{total}] Gemma OK: {stats['ok']} | Fail: {stats['fail']} | ETA: {eta:.1f}min")
            save_progress(n, total, elapsed, stats["ok"], stats["fail"])

    elapsed = time.time() - t0
    save_progress(stats["done"], total, elapsed, stats["ok"], stats["fail"])
    print(f"\nDone: {stats['done']} retried in {elapsed/60:.1f} min")
    print(f"Gemma OK: {stats['ok']}, Still fail: {stats['fail']}")


if __name__ == "__main__":
    asyncio.run(main())
