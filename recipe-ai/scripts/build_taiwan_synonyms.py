"""
build_taiwan_synonyms.py — 台灣 2300 種食品：MoeDict + 翻譯 + WordNet 同義詞

用法：
  docker exec recipe-control python /app/scripts/build_taiwan_synonyms.py
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

from app.services.synonym_expander import SynonymExpander, ExpandedResult  # noqa: E402
from app.services.food_synonym_store import food_synonym_store              # noqa: E402


def _get_db_dsn() -> str:
    return os.environ.get(
        "DATABASE_URL",
        "postgresql://postgres:postgres@localhost:5432/recipe_ai",
    )


def _parse_common_names(common_name: str | None) -> list[str]:
    """解析 common_name 欄位，可能包含多個名稱（用 、 或 ; 分隔）。"""
    if not common_name or not common_name.strip():
        return []

    names: list[str] = []
    # 先用 ; 分隔，再用 、 分隔
    for part in common_name.replace(";", "、").split("、"):
        name = part.strip()
        if name and len(name) >= 2:
            names.append(name)
    return names


async def main():
    print("=" * 60)
    print("  build_taiwan_synonyms.py")
    print("  台灣食品名稱 → MoeDict + 翻譯 + WordNet → 辭典")
    print("=" * 60)

    # Step 1: 連接 DB 取得台灣食品清單
    import asyncpg
    dsn = _get_db_dsn()
    try:
        conn = await asyncpg.connect(dsn)
    except Exception as e:
        print(f"ERROR: 無法連接資料庫 — {e}")
        sys.exit(1)

    try:
        rows = await conn.fetch(
            "SELECT id, food_name, common_name FROM taiwan_foods ORDER BY id"
        )
    except Exception as e:
        print(f"ERROR: 查詢 taiwan_foods 失敗 — {e}")
        await conn.close()
        sys.exit(1)

    await conn.close()

    total = len(rows)
    print(f"\n  取得 {total} 筆台灣食品\n")

    # Step 2: 逐筆處理
    expander = SynonymExpander()
    success_count = 0
    skip_count = 0
    error_count = 0
    new_count = 0
    updated_count = 0
    common_name_additions = 0
    t_start = time.monotonic()

    for i, row in enumerate(rows):
        food_id = row["id"]
        food_name = row["food_name"]
        common_name = row["common_name"]

        if not food_name or not food_name.strip():
            skip_count += 1
            continue

        food_name = food_name.strip()

        try:
            # 2a. 使用 SynonymExpander 完整擴展（MoeDict + translate + WordNet）
            result = await expander.expand(food_name)

            # 2b. 如果有 common_name，解析並加入 zh_synonyms
            extra_names = _parse_common_names(common_name)
            if extra_names:
                existing_zh = set(result.zh_synonyms)
                for name in extra_names:
                    if name not in existing_zh and name != result.canonical:
                        result.zh_synonyms.append(name)
                        existing_zh.add(name)
                        common_name_additions += 1
                if "common_name" not in result.sources:
                    result.sources.add("common_name")

            # 2c. 合併到辭典
            existing = food_synonym_store.read(food_name)
            food_synonym_store.merge_expanded(result)

            if existing:
                updated_count += 1
            else:
                new_count += 1

            success_count += 1

        except Exception as e:
            error_count += 1
            if error_count <= 10:
                print(f"  ERROR [{food_id}] {food_name}: {e}")
            elif error_count == 11:
                print("  （後續錯誤省略...）")

        # 進度報告
        if (i + 1) % 100 == 0 or (i + 1) == total:
            elapsed = time.monotonic() - t_start
            rate = (i + 1) / max(elapsed, 0.01)
            eta_s = (total - i - 1) / max(rate, 0.01)
            print(f"  [{i+1}/{total}] 成功={success_count} 新增={new_count} "
                  f"更新={updated_count} 錯誤={error_count} "
                  f"({rate:.1f} items/s, ETA {eta_s:.0f}s)")

        # 延遲（MoeDict API 有限制）
        await asyncio.sleep(0.5)

    # Step 3: 最終統計
    elapsed = time.monotonic() - t_start
    stats = food_synonym_store.stats()

    print("\n" + "=" * 60)
    print("  台灣食品同義詞建置完成")
    print("=" * 60)
    print(f"  台灣食品總數：{total}")
    print(f"  成功處理：{success_count}")
    print(f"  新增條目：{new_count}")
    print(f"  更新條目：{updated_count}")
    print(f"  common_name 補充：{common_name_additions}")
    print(f"  跳過（空名稱）：{skip_count}")
    print(f"  錯誤：{error_count}")
    print(f"  耗時：{elapsed:.1f}s ({elapsed/60:.1f}min)")
    print()
    print(f"  辭典統計：")
    print(f"    總條目數：{stats['total_entries']}")
    print(f"    中文條目：{stats['zh_entries']}")
    print(f"    英文條目：{stats['en_entries']}")
    print(f"    同義詞總數：{stats['total_synonyms']}")
    print("=" * 60)


if __name__ == "__main__":
    asyncio.run(main())
