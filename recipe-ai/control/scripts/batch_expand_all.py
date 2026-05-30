"""
batch_expand_all.py - 對全 DB (taiwan_foods + foods/FooDB) 批次擴展同義詞

對每筆食物名稱呼叫 SynonymExpander.expand() (內建中英互譯 + MoeDict + WordNet),
結果用 food_synonym_store.merge_expanded() 寫入 JSON,atomic 寫入 host (有 bind-mount)。

特性:
- Idempotent + 斷點續跑:已有 ≥ MIN_EXIST_SYN 個同義詞的條目跳過
- 限速:每筆 ~ SLEEP_EACH 秒、每 FLUSH_EVERY 筆強制 flush 進度
- 進度:logs/batch_expand_progress.json (可查剩餘)
- 可獨立 CLI 使用 --limit N --only zh|en 測試

用法 (容器內):
    python /app/scripts/batch_expand_all.py                  # 全部跑
    python /app/scripts/batch_expand_all.py --limit 20        # 先跑 20 筆
    python /app/scripts/batch_expand_all.py --only zh         # 只跑中文
"""
from __future__ import annotations

import argparse
import asyncio
import json
import os
import sys
import time
from pathlib import Path

import httpx
from loguru import logger

# 讓 /app 在 sys.path (容器內 WORKDIR=/app)
sys.path.insert(0, "/app")

from app.config import settings
from app.services.food_synonym_store import food_synonym_store
from app.services.synonym_expander import SynonymExpander

SLEEP_EACH = float(os.getenv("BATCH_SLEEP", "0.15"))
FLUSH_EVERY = int(os.getenv("BATCH_FLUSH", "20"))
MIN_EXIST_SYN = int(os.getenv("BATCH_MIN_EXIST", "2"))

PROG_PATH = Path("/app/logs/batch_expand_progress.json")
PROG_PATH.parent.mkdir(exist_ok=True)


def _write_progress(state: dict) -> None:
    try:
        tmp = PROG_PATH.with_suffix(".tmp")
        tmp.write_text(json.dumps(state, ensure_ascii=False, indent=2), encoding="utf-8")
        os.replace(str(tmp), str(PROG_PATH))
    except Exception as e:
        logger.warning("write progress failed: {}", e)


async def _fetch_all_names() -> list[tuple[str, str, int]]:
    """從 backend /foods/names/all 拿 (name, source, id)。"""
    url = f"{settings.backend_url}/foods/names/all"
    async with httpx.AsyncClient(timeout=30) as client:
        resp = await client.get(url)
        resp.raise_for_status()
        data = resp.json()

    items: list[tuple[str, str, int]] = []
    for item in data.get("taiwan_foods", []):
        name = (item.get("name") or "").strip()
        if name:
            items.append((name, "taiwan_foods", item.get("id", 0)))
    for item in data.get("foodb", []):
        name = (item.get("name") or "").strip()
        if name:
            items.append((name, "foodb", item.get("id", 0)))
    return items


def _existing_synonym_count(canonical: str) -> int:
    entry = food_synonym_store.read(canonical)
    if not entry:
        return 0
    return len(entry.get("synonyms", []))


async def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--limit", type=int, default=0, help="只跑前 N 筆 (0 = 全跑)")
    parser.add_argument("--only", choices=["zh", "en"], help="只跑中文或英文")
    parser.add_argument("--force", action="store_true", help="即使已有同義詞也重跑")
    args = parser.parse_args()

    logger.info("=== batch expand start ===")
    logger.info("sleep={}s flush={} min_exist={} only={} limit={}",
                SLEEP_EACH, FLUSH_EVERY, MIN_EXIST_SYN, args.only, args.limit)

    all_items = await _fetch_all_names()
    logger.info("fetched {} food names ({} taiwan + {} foodb)",
                len(all_items),
                sum(1 for _, s, _ in all_items if s == "taiwan_foods"),
                sum(1 for _, s, _ in all_items if s == "foodb"))

    if args.only == "zh":
        all_items = [x for x in all_items if x[1] == "taiwan_foods"]
    elif args.only == "en":
        all_items = [x for x in all_items if x[1] == "foodb"]
    if args.limit > 0:
        all_items = all_items[: args.limit]

    expander = SynonymExpander()
    started = time.time()
    processed = 0
    expanded_new = 0
    skipped_existing = 0
    failed = 0
    err_samples: list[str] = []

    state = {
        "started_at": int(started),
        "total": len(all_items),
        "processed": 0,
        "expanded_new": 0,
        "skipped_existing": 0,
        "failed": 0,
        "last_term": None,
        "last_update": int(started),
    }
    _write_progress(state)

    for idx, (name, source, fid) in enumerate(all_items, start=1):
        processed += 1
        try:
            if not args.force and _existing_synonym_count(name) >= MIN_EXIST_SYN:
                skipped_existing += 1
            else:
                result = await expander.expand(name)
                total_syn = len(result.zh_synonyms) + len(result.en_synonyms)
                if total_syn > 0:
                    food_synonym_store.merge_expanded(result)
                    expanded_new += 1
        except Exception as e:
            failed += 1
            if len(err_samples) < 5:
                err_samples.append(f"{name}: {e}")
            logger.warning("expand '{}' failed: {}", name, e)

        if processed % FLUSH_EVERY == 0 or processed == len(all_items):
            elapsed = time.time() - started
            rate = processed / elapsed if elapsed > 0 else 0
            eta = (len(all_items) - processed) / rate if rate > 0 else 0
            state.update({
                "processed": processed,
                "expanded_new": expanded_new,
                "skipped_existing": skipped_existing,
                "failed": failed,
                "last_term": name,
                "last_update": int(time.time()),
                "rate_per_sec": round(rate, 2),
                "eta_sec": int(eta),
            })
            _write_progress(state)
            logger.info(
                "[{}/{}] new={} skip={} fail={} rate={:.1f}/s eta={}s last='{}'",
                processed, len(all_items), expanded_new, skipped_existing, failed,
                rate, int(eta), name,
            )

        if SLEEP_EACH > 0:
            await asyncio.sleep(SLEEP_EACH)

    elapsed = time.time() - started
    final_stats = food_synonym_store.stats()
    logger.info("=== DONE in {:.1f}s ({:.1f} min) ===", elapsed, elapsed / 60)
    logger.info("processed={} expanded_new={} skipped_existing={} failed={}",
                processed, expanded_new, skipped_existing, failed)
    logger.info("store final: {} entries / {} synonyms",
                final_stats.get("total_entries"),
                final_stats.get("total_synonyms"))
    if err_samples:
        logger.info("error samples: {}", err_samples)

    state.update({
        "done": True,
        "elapsed_sec": int(elapsed),
        "final_stats": final_stats,
    })
    _write_progress(state)


if __name__ == "__main__":
    asyncio.run(main())
