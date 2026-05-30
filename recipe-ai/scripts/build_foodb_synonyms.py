"""
build_foodb_synonyms.py — FooDB 992 種食品：翻譯 + WordNet 同義詞

用法：
  docker exec recipe-control python /app/scripts/build_foodb_synonyms.py
"""
from __future__ import annotations

import asyncio
import os
import sys
import time
from pathlib import Path

# ── 路徑設定：讓 import app.services.* 能找到 control/ ──
_SCRIPT_DIR = Path(__file__).resolve().parent
_PROJECT_ROOT = _SCRIPT_DIR.parent
_CONTROL_DIR = _PROJECT_ROOT / "control"
if str(_CONTROL_DIR) not in sys.path:
    sys.path.insert(0, str(_CONTROL_DIR))

from app.services.translate_service import translate_to_chinese  # noqa: E402
from app.services.synonym_service import get_english_synonyms    # noqa: E402
from app.services.food_synonym_store import food_synonym_store    # noqa: E402
from app.services.synonym_expander import ExpandedResult          # noqa: E402


def _get_db_dsn() -> str:
    return os.environ.get(
        "DATABASE_URL",
        "postgresql://postgres:postgres@localhost:5432/recipe_ai",
    )


async def main():
    print("=" * 60)
    print("  build_foodb_synonyms.py")
    print("  FooDB 食品名稱 → 翻譯 + WordNet 同義詞 → 辭典")
    print("=" * 60)

    # Step 1: 連接 DB 取得 FooDB 食品清單
    import asyncpg
    dsn = _get_db_dsn()
    try:
        conn = await asyncpg.connect(dsn)
    except Exception as e:
        print(f"ERROR: 無法連接資料庫 — {e}")
        sys.exit(1)

    try:
        rows = await conn.fetch("SELECT id, name FROM foodb_foods ORDER BY id")
    except Exception as e:
        print(f"ERROR: 查詢 foodb_foods 失敗 — {e}")
        await conn.close()
        sys.exit(1)

    await conn.close()

    total = len(rows)
    print(f"\n  取得 {total} 筆 FooDB 食品\n")

    # Step 2: 逐筆處理
    success_count = 0
    skip_count = 0
    error_count = 0
    new_count = 0
    updated_count = 0
    t_start = time.monotonic()

    for i, row in enumerate(rows):
        food_id = row["id"]
        name = row["name"]

        if not name or not name.strip():
            skip_count += 1
            continue

        name = name.strip()

        try:
            # 2a. 翻譯 en → zh
            zh_name = translate_to_chinese(name)
            zh_synonyms = []
            if zh_name and zh_name != name and any("\u4e00" <= c <= "\u9fff" for c in zh_name):
                zh_synonyms = [zh_name]

            # 2b. WordNet 英文同義詞
            en_synonyms = get_english_synonyms(name)

            # 2c. 建立 ExpandedResult
            result = ExpandedResult(
                canonical=name,
                language="en",
                zh_synonyms=zh_synonyms,
                en_synonyms=en_synonyms,
                sources={"foodb_auto"},
            )

            # 2d. 合併到辭典
            existing = food_synonym_store.read(name)
            food_synonym_store.merge_expanded(result)

            if existing:
                updated_count += 1
            else:
                new_count += 1

            success_count += 1

        except Exception as e:
            error_count += 1
            if error_count <= 10:
                print(f"  ERROR [{food_id}] {name}: {e}")
            elif error_count == 11:
                print("  （後續錯誤省略...）")

        # 進度報告
        if (i + 1) % 50 == 0 or (i + 1) == total:
            elapsed = time.monotonic() - t_start
            rate = (i + 1) / max(elapsed, 0.01)
            print(f"  [{i+1}/{total}] 成功={success_count} 新增={new_count} "
                  f"更新={updated_count} 錯誤={error_count} "
                  f"({rate:.1f} items/s)")

        # 延遲
        await asyncio.sleep(0.1)

    # Step 3: 最終統計
    elapsed = time.monotonic() - t_start
    stats = food_synonym_store.stats()

    print("\n" + "=" * 60)
    print("  FooDB 同義詞建置完成")
    print("=" * 60)
    print(f"  FooDB 食品總數：{total}")
    print(f"  成功處理：{success_count}")
    print(f"  新增條目：{new_count}")
    print(f"  更新條目：{updated_count}")
    print(f"  跳過（空名稱）：{skip_count}")
    print(f"  錯誤：{error_count}")
    print(f"  耗時：{elapsed:.1f}s")
    print()
    print(f"  辭典統計：")
    print(f"    總條目數：{stats['total_entries']}")
    print(f"    中文條目：{stats['zh_entries']}")
    print(f"    英文條目：{stats['en_entries']}")
    print(f"    同義詞總數：{stats['total_synonyms']}")
    print("=" * 60)


if __name__ == "__main__":
    asyncio.run(main())
