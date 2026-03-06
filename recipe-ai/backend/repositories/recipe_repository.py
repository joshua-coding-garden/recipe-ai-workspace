"""recipe_repository.py - 食譜 CRUD"""
import json
from typing import Any
from database import get_pool


async def list_by_user(user_id: int) -> list[dict]:
    pool = get_pool()
    async with pool.acquire() as conn:
        rows = await conn.fetch(
            """SELECT r.id, r.recipe_name, r.servings, r.created_at,
                      rn.calories, rn.protein, rn.carbs, rn.fat, rn.fiber,
                      rn.nutrition_detail
               FROM recipes r
               LEFT JOIN recipe_nutrition rn ON rn.recipe_id = r.id
               WHERE r.user_id=$1
               ORDER BY r.created_at DESC""",
            user_id,
        )
    results = []
    for r in rows:
        d = dict(r)
        # asyncpg returns JSONB as str, parse it
        if isinstance(d.get("nutrition_detail"), str):
            try:
                d["nutrition_detail"] = json.loads(d["nutrition_detail"])
            except (json.JSONDecodeError, TypeError):
                d["nutrition_detail"] = {}
        results.append(d)
    return results


async def get_by_id(recipe_id: int, user_id: int) -> dict | None:
    pool = get_pool()
    async with pool.acquire() as conn:
        row = await conn.fetchrow(
            "SELECT * FROM recipes WHERE id=$1 AND user_id=$2",
            recipe_id, user_id,
        )
    return dict(row) if row else None


async def create(user_id: int, name: str, content: str, servings: int,
                 nutrition: dict, ingredients: list[dict],
                 nutrition_detail: dict | None = None) -> dict[str, Any]:
    pool = get_pool()
    async with pool.acquire() as conn:
        async with conn.transaction():
            recipe = await conn.fetchrow(
                """INSERT INTO recipes (user_id, recipe_name, recipe_content, servings)
                   VALUES ($1, $2, $3, $4) RETURNING *""",
                user_id, name, content, servings,
            )
            rid = recipe["id"]
            await conn.execute(
                """INSERT INTO recipe_nutrition
                   (recipe_id, calories, protein, carbs, fat, fiber, nutrition_detail)
                   VALUES ($1,$2,$3,$4,$5,$6,$7)""",
                rid,
                nutrition.get("calories", 0), nutrition.get("protein", 0),
                nutrition.get("carbs", 0), nutrition.get("fat", 0),
                nutrition.get("fiber", 0),
                json.dumps(nutrition_detail or {}, ensure_ascii=False),
            )
            for ing in ingredients:
                await conn.execute(
                    "INSERT INTO recipe_ingredients (recipe_id, ingredient_name, amount) VALUES ($1,$2,$3)",
                    rid, ing.get("name", ""), ing.get("amount"),
                )
    return dict(recipe)


async def delete(recipe_id: int, user_id: int) -> bool:
    pool = get_pool()
    async with pool.acquire() as conn:
        result = await conn.execute(
            "DELETE FROM recipes WHERE id=$1 AND user_id=$2",
            recipe_id, user_id,
        )
    return result == "DELETE 1"


async def update(recipe_id: int, user_id: int, name: str, servings: int,
                 nutrition: dict, nutrition_detail: dict | None = None) -> dict | None:
    pool = get_pool()
    async with pool.acquire() as conn:
        async with conn.transaction():
            recipe = await conn.fetchrow(
                """UPDATE recipes
                   SET recipe_name=$3, servings=$4, updated_at=NOW()
                   WHERE id=$1 AND user_id=$2
                   RETURNING *""",
                recipe_id, user_id, name, servings,
            )
            if not recipe:
                return None

            await conn.execute(
                """UPDATE recipe_nutrition
                   SET calories=$2, protein=$3, carbs=$4, fat=$5, fiber=$6, nutrition_detail=$7
                   WHERE recipe_id=$1""",
                recipe_id,
                nutrition.get("calories", 0), nutrition.get("protein", 0),
                nutrition.get("carbs", 0), nutrition.get("fat", 0),
                nutrition.get("fiber", 0),
                json.dumps(nutrition_detail or {}, ensure_ascii=False),
            )
    return dict(recipe)
