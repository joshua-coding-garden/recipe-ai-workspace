"""
taiwan_food_browse_repository.py
台灣食物資料庫瀏覽（分頁、分類、統計）
"""
from typing import Any
from database import get_pool


async def browse_taiwan_foods(
    page: int = 1,
    limit: int = 24,
    search: str = "",
    category: str = "",
) -> dict[str, Any]:
    pool = get_pool()
    offset = (page - 1) * limit

    conditions = []
    params = []
    idx = 1

    if search:
        conditions.append(f"food_name ILIKE '%' || ${idx} || '%'")
        params.append(search)
        idx += 1

    if category:
        conditions.append(f"category = ${idx}")
        params.append(category)
        idx += 1

    where = ("WHERE " + " AND ".join(conditions)) if conditions else ""

    count_query = f"SELECT COUNT(*) FROM taiwan_foods {where}"
    data_query = f"""
        SELECT id, integration_code, category, food_name, sample_name, common_name,
               cal_per_100g, protein_per_100g, carbon_per_100g, fats_per_100g,
               dietary_fiber_per_100g
        FROM taiwan_foods {where}
        ORDER BY id
        LIMIT ${idx} OFFSET ${idx + 1}
    """
    params_data = params + [limit, offset]

    async with pool.acquire() as conn:
        total = await conn.fetchval(count_query, *params)
        rows = await conn.fetch(data_query, *params_data)

    foods = [dict(r) for r in rows]
    # Convert Decimal to float for JSON serialization
    for food in foods:
        for key in ("cal_per_100g", "protein_per_100g", "carbon_per_100g",
                     "fats_per_100g", "dietary_fiber_per_100g"):
            if food.get(key) is not None:
                food[key] = float(food[key])

    total_pages = (total + limit - 1) // limit

    return {
        "foods": foods,
        "pagination": {
            "page": page,
            "limit": limit,
            "total": total,
            "totalPages": total_pages,
        },
    }


async def get_taiwan_food_categories() -> list[dict[str, Any]]:
    pool = get_pool()
    async with pool.acquire() as conn:
        rows = await conn.fetch(
            "SELECT category, COUNT(*)::int AS count FROM taiwan_foods "
            "GROUP BY category ORDER BY category"
        )
    return [{"category": r["category"], "count": r["count"]} for r in rows]


async def get_taiwan_food_stats() -> dict[str, Any]:
    pool = get_pool()
    async with pool.acquire() as conn:
        total = await conn.fetchval("SELECT COUNT(*) FROM taiwan_foods")
        categories = await conn.fetchval(
            "SELECT COUNT(DISTINCT category) FROM taiwan_foods"
        )
    return {
        "totalFoods": total,
        "totalCategories": categories,
        "totalNutrients": 25,
    }
