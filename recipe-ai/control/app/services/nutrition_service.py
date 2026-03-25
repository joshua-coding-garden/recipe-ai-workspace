"""
nutrition_service.py - 營養素結算服務

協調 unit_converter（用量解析）與 backend aggregate-nutrition API，
完成從「食材清單 + 用量」到「完整營養素總量」的計算。
"""
import httpx
from loguru import logger
from app.config import settings
from app.services.unit_converter import convert_ingredient_amount

_TIMEOUT = httpx.Timeout(connect=3.0, read=30.0, write=5.0, pool=3.0)


async def calculate_recipe_nutrition(ingredients: list[dict]) -> dict:
    """
    計算食譜的完整營養素結算。

    ingredients: [
        {
            "food_id": int,
            "source": "taiwan_foods" | "foodb",
            "food_name": str,
            "amount": str,          # 原始用量字串，如 "3顆"、"2大匙"、"300g"
            "grams": float | None,  # 如已知公克數可直接指定，優先於 amount 解析
        },
        ...
    ]

    回傳: {
        "items": [...],             # 每項食材的營養明細 + 換算資訊
        "total": {...},             # 營養素總量
        "nutrient_meta": {...},     # 營養素 metadata
    }
    """
    # 1. 解析每項食材的用量 → 公克
    logger.info(
        "NUTRI_CALC_START item_count={} inputs={}",
        len(ingredients),
        [
            {
                "food_name": x.get("food_name", ""),
                "amount": x.get("amount", ""),
                "source": x.get("source", ""),
                "food_id": x.get("food_id"),
            }
            for x in ingredients
        ],
    )

    backend_items = []
    conversion_info = []

    for ing in ingredients:
        food_id = ing.get("food_id")
        source = ing.get("source", "taiwan_foods")
        food_name = ing.get("food_name", "")
        raw_amount = ing.get("amount", "")

        # 優先使用明確指定的 grams
        explicit_grams = ing.get("grams")
        if explicit_grams is not None and explicit_grams > 0:
            grams = float(explicit_grams)
            conv = {
                "grams": grams,
                "parsed_amount": grams,
                "parsed_unit": "g",
                "estimated": False,
                "raw": raw_amount or f"{grams}g",
            }
        else:
            conv = convert_ingredient_amount(food_name, raw_amount)
            grams = conv["grams"]

        logger.info(
            "UNIT_CONVERT food_name='{}' raw='{}' parsed_amount={} parsed_unit='{}' grams={} estimated={}",
            food_name,
            raw_amount,
            conv.get("parsed_amount"),
            conv.get("parsed_unit"),
            conv.get("grams"),
            conv.get("estimated"),
        )

        backend_items.append({
            "food_id": food_id,
            "source": source,
            "grams": grams,
            "input_food_name": food_name,
            "raw_amount": raw_amount,
            "parsed_unit": conv.get("parsed_unit"),
            "estimated": conv.get("estimated", False),
        })
        conversion_info.append(conv)

    # 2. 呼叫 backend 批次結算
    async with httpx.AsyncClient(timeout=_TIMEOUT) as client:
        resp = await client.post(
            f"{settings.backend_url}/foods/aggregate-nutrition",
            json={"items": backend_items},
        )
        resp.raise_for_status()
        result = resp.json()

    logger.info(
        "NUTRI_CALC_AGGREGATED item_count={} total_keys={} total_preview={}",
        len(result.get("per_item", [])),
        len((result.get("total") or {}).keys()),
        dict(list((result.get("total") or {}).items())[:8]),
    )

    # 3. 組合回應：合併 conversion_info 到 per_item
    enriched_items = []
    for i, per_item in enumerate(result.get("per_item", [])):
        item = {
            **per_item,
            "conversion": conversion_info[i] if i < len(conversion_info) else {},
            "input_food_name": ingredients[i].get("food_name", "") if i < len(ingredients) else "",
            "input_amount": ingredients[i].get("amount", "") if i < len(ingredients) else "",
        }
        enriched_items.append(item)

    return {
        "items": enriched_items,
        "total": result.get("total", {}),
        "nutrient_meta": result.get("nutrient_meta", {}),
    }


async def calculate_single_food_nutrition(
    food_id: int,
    source: str,
    grams: float,
) -> dict:
    """
    計算單一食物的完整營養素（用於飲食記錄）。

    回傳: {
        "nutrition": {...},     # 按克數縮放後的營養素
        "nutrient_meta": {...},
    }
    """
    async with httpx.AsyncClient(timeout=_TIMEOUT) as client:
        resp = await client.post(
            f"{settings.backend_url}/foods/aggregate-nutrition",
            json={"items": [{"food_id": food_id, "source": source, "grams": grams}]},
        )
        resp.raise_for_status()
        result = resp.json()

    per_item = result.get("per_item", [{}])
    nutrition = per_item[0].get("nutrition", {}) if per_item else {}

    return {
        "nutrition": nutrition,
        "nutrient_meta": result.get("nutrient_meta", {}),
    }
