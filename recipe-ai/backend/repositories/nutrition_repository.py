"""
nutrition_repository.py - 全量營養素查詢與批次結算

提供：
  - get_full_nutrition : 取得單一食物所有非 null 營養素
  - aggregate_nutrition: 批次取得多食物營養素，按克數縮放並累加
"""
from typing import Any
from loguru import logger

from database import get_pool
from nutrient_registry import extract_nutrients, get_nutrient_meta, NUTRIENT_COLUMNS


async def get_full_nutrition(food_id: int, source: str) -> dict[str, float]:
    """取得單一食物的完整營養素 dict（僅含非 null 值）。"""
    pool = get_pool()

    if source == "taiwan_foods":
        query = "SELECT * FROM taiwan_foods WHERE id = $1"
    else:
        query = "SELECT * FROM foods WHERE id = $1"

    async with pool.acquire() as conn:
        row = await conn.fetchrow(query, food_id)

    if not row:
        return {}

    return extract_nutrients(dict(row))


async def aggregate_nutrition(
    items: list[dict[str, Any]],
) -> dict[str, Any]:
    """
    批次結算多食物的營養素總量。

    items: [{"food_id": int, "source": str, "grams": float}, ...]

    回傳:
    {
        "total": {"cal_per_100g": 523.5, ...},          # 按克數縮放後的總和
        "per_item": [{"food_id": ..., "nutrition": {...}, "grams": ...}, ...],
        "nutrient_meta": {"cal_per_100g": {"label": "熱量", ...}, ...}
    }
    """
    pool = get_pool()
    logger.info(
        "AGG_NUTRI_START item_count={} items={}",
        len(items),
        [
            {
                "food_id": it.get("food_id"),
                "source": it.get("source"),
                "grams": it.get("grams"),
                "raw_amount": it.get("raw_amount"),
                "parsed_unit": it.get("parsed_unit"),
                "estimated": it.get("estimated"),
            }
            for it in items
        ],
    )

    # 分開兩個資料庫的 id
    tw_ids = [it["food_id"] for it in items if it["source"] == "taiwan_foods"]
    en_ids = [it["food_id"] for it in items if it["source"] != "taiwan_foods"]

    # 批次查詢
    tw_rows: dict[int, dict] = {}
    en_rows: dict[int, dict] = {}

    async with pool.acquire() as conn:
        if tw_ids:
            rows = await conn.fetch(
                "SELECT * FROM taiwan_foods WHERE id = ANY($1::int[])", tw_ids
            )
            tw_rows = {r["id"]: dict(r) for r in rows}

        if en_ids:
            rows = await conn.fetch(
                "SELECT * FROM foods WHERE id = ANY($1::int[])", en_ids
            )
            en_rows = {r["id"]: dict(r) for r in rows}

    # 累加
    total: dict[str, float] = {}
    per_item: list[dict] = []
    all_keys: set[str] = set()

    for item in items:
        food_id = item["food_id"]
        source = item["source"]
        grams = float(item["grams"])

        if source == "taiwan_foods":
            row = tw_rows.get(food_id)
        else:
            row = en_rows.get(food_id)

        if not row:
            logger.warning("food_not_found id={} source={}", food_id, source)
            per_item.append({
                "food_id": food_id,
                "source": source,
                "grams": grams,
                "nutrition": {},
                "found": False,
            })
            continue

        nutrients = extract_nutrients(row)
        scale = grams / 100.0

        # 按克數縮放的營養素
        scaled: dict[str, float] = {}
        for key, value in nutrients.items():
            scaled_val = value * scale
            scaled[key] = round(scaled_val, 4)
            total[key] = total.get(key, 0.0) + scaled_val

        all_keys.update(scaled.keys())

        per_item.append({
            "food_id": food_id,
            "source": source,
            "grams": grams,
            "food_name": row.get("food_name") or row.get("name", ""),
            "nutrition": scaled,
            "found": True,
        })

        logger.debug(
            "AGG_NUTRI_ITEM food_id={} source={} grams={} key_count={} calories={}",
            food_id,
            source,
            grams,
            len(scaled.keys()),
            scaled.get("cal_per_100g") or scaled.get("calories") or 0,
        )

    # 四捨五入 total
    total = {k: round(v, 4) for k, v in total.items()}

    logger.info(
        "AGG_NUTRI_DONE item_count={} total_keys={} total_preview={}",
        len(per_item),
        len(total.keys()),
        dict(list(total.items())[:8]),
    )

    return {
        "total": total,
        "per_item": per_item,
        "nutrient_meta": get_nutrient_meta(all_keys),
    }
