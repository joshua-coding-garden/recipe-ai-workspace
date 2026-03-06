"""calendar_repository.py - 食譜行事曆 entries CRUD"""
import json
from datetime import date
from database import get_pool


async def list_entries(user_id: int, start_date: date, end_date: date) -> list[dict]:
    """列出使用者在指定日期區間的所有 calendar entries，含食譜名與完整營養。"""
    pool = get_pool()
    async with pool.acquire() as conn:
        rows = await conn.fetch(
            """SELECT ce.id, ce.entry_date, ce.recipe_id, ce.sort_order, ce.created_at,
                      ce.servings_override,
                      r.recipe_name, r.servings AS recipe_servings,
                      rn.calories, rn.protein, rn.carbs, rn.fat, rn.fiber,
                      rn.nutrition_detail
               FROM recipe_calendar_entries ce
               JOIN recipes r ON r.id = ce.recipe_id
               LEFT JOIN recipe_nutrition rn ON rn.recipe_id = r.id
               WHERE ce.user_id = $1
                 AND ce.entry_date >= $2
                 AND ce.entry_date <= $3
               ORDER BY ce.entry_date, ce.sort_order, ce.id""",
            user_id, start_date, end_date,
        )
    results = []
    for r in rows:
        d = dict(r)
        if isinstance(d.get("nutrition_detail"), str):
            try:
                d["nutrition_detail"] = json.loads(d["nutrition_detail"])
            except (json.JSONDecodeError, TypeError):
                d["nutrition_detail"] = {}
        if d.get("entry_date") is not None:
            d["entry_date"] = d["entry_date"].isoformat()
        if d.get("created_at") is not None:
            d["created_at"] = d["created_at"].isoformat()
        if d.get("servings_override") is not None:
            d["servings_override"] = float(d["servings_override"])
        if d.get("recipe_servings") is not None:
            d["recipe_servings"] = float(d["recipe_servings"])
        results.append(d)
    return results


async def add_entry(
    user_id: int,
    recipe_id: int,
    entry_date: date,
    servings_override: float | None = None,
) -> dict:
    """新增一筆行事曆 entry。先驗證食譜屬於該使用者。"""
    pool = get_pool()
    async with pool.acquire() as conn:
        owns = await conn.fetchval(
            "SELECT 1 FROM recipes WHERE id=$1 AND user_id=$2",
            recipe_id, user_id,
        )
        if not owns:
            return {}
        servings = max(0.1, float(servings_override or 1))
        row = await conn.fetchrow(
            """INSERT INTO recipe_calendar_entries
                 (user_id, recipe_id, entry_date, servings_override)
               VALUES ($1, $2, $3, $4)
               RETURNING id, user_id, recipe_id, entry_date, servings_override, sort_order, created_at""",
            user_id, recipe_id, entry_date, servings,
        )
    d = dict(row)
    if d.get("entry_date") is not None:
        d["entry_date"] = d["entry_date"].isoformat()
    if d.get("created_at") is not None:
        d["created_at"] = d["created_at"].isoformat()
    if d.get("servings_override") is not None:
        d["servings_override"] = float(d["servings_override"])
    return d


async def update_entry(
    entry_id: int,
    user_id: int,
    servings_override: float | None = None,
) -> dict:
    pool = get_pool()
    servings = max(0.1, float(servings_override or 1))
    async with pool.acquire() as conn:
        row = await conn.fetchrow(
            """UPDATE recipe_calendar_entries
               SET servings_override=$1
               WHERE id=$2 AND user_id=$3
               RETURNING id, user_id, recipe_id, entry_date, servings_override, sort_order, created_at""",
            servings, entry_id, user_id,
        )
    if not row:
        return {}
    d = dict(row)
    if d.get("entry_date") is not None:
        d["entry_date"] = d["entry_date"].isoformat()
    if d.get("created_at") is not None:
        d["created_at"] = d["created_at"].isoformat()
    if d.get("servings_override") is not None:
        d["servings_override"] = float(d["servings_override"])
    return d


async def delete_entry(entry_id: int, user_id: int) -> bool:
    pool = get_pool()
    async with pool.acquire() as conn:
        result = await conn.execute(
            "DELETE FROM recipe_calendar_entries WHERE id=$1 AND user_id=$2",
            entry_id, user_id,
        )
    return result == "DELETE 1"
