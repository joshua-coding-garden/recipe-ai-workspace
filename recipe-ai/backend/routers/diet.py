"""diet.py - 飲食記錄 CRUD"""
import json
from fastapi import APIRouter, HTTPException
from pydantic import BaseModel
from database import get_pool

router = APIRouter(prefix="/diet-logs", tags=["diet"])


from datetime import datetime


class DietLogIn(BaseModel):
    user_id: int
    food_name: str
    grams: int = 0
    amount_g: float | None = None
    meal_type: str = "lunch"
    logged_at: str | None = None
    calories: float | None = None
    food_id: int | None = None
    food_source: str | None = None
    nutrition_detail: dict | None = None


@router.get("")
async def list_logs(user_id: int):
    pool = get_pool()
    async with pool.acquire() as conn:
        rows = await conn.fetch(
            "SELECT * FROM diet_logs WHERE user_id=$1 ORDER BY logged_at DESC, created_at DESC",
            user_id,
        )
    result = []
    for r in rows:
        d = dict(r)
        d["amount_g"] = d.get("grams", 0)
        if isinstance(d.get("nutrition_detail"), str):
            try:
                d["nutrition_detail"] = json.loads(d["nutrition_detail"])
            except (json.JSONDecodeError, TypeError):
                d["nutrition_detail"] = {}
        result.append(d)
    return result


@router.post("", status_code=201)
async def create_log(body: DietLogIn):
    pool = get_pool()
    grams = int(body.amount_g or body.grams or 0)
    logged_at = None
    if body.logged_at:
        try:
            logged_at = datetime.fromisoformat(body.logged_at)
        except Exception:
            pass
    nutrition_json = json.dumps(body.nutrition_detail or {}, ensure_ascii=False)
    async with pool.acquire() as conn:
        row = await conn.fetchrow(
            """INSERT INTO diet_logs
               (user_id, food_name, grams, meal_type, logged_at, calories,
                food_id, food_source, nutrition_detail)
               VALUES ($1,$2,$3,$4,$5,$6,$7,$8,$9) RETURNING *""",
            body.user_id, body.food_name, grams,
            body.meal_type, logged_at, body.calories,
            body.food_id, body.food_source, nutrition_json,
        )
    d = dict(row)
    d["amount_g"] = d.get("grams", 0)
    if isinstance(d.get("nutrition_detail"), str):
        try:
            d["nutrition_detail"] = json.loads(d["nutrition_detail"])
        except (json.JSONDecodeError, TypeError):
            d["nutrition_detail"] = {}
    return d


class DietLogUpdate(BaseModel):
    food_name: str | None = None
    amount_g: float | None = None
    meal_type: str | None = None
    logged_at: str | None = None
    calories: float | None = None
    food_id: int | None = None
    food_source: str | None = None
    nutrition_detail: dict | None = None


@router.put("/{log_id}")
async def update_log(log_id: int, body: DietLogUpdate, user_id: int):
    pool = get_pool()
    sets, vals, idx = [], [], 1
    if body.food_name is not None:
        sets.append(f"food_name=${idx}"); vals.append(body.food_name); idx += 1
    if body.amount_g is not None:
        sets.append(f"grams=${idx}"); vals.append(int(body.amount_g)); idx += 1
    if body.meal_type is not None:
        sets.append(f"meal_type=${idx}"); vals.append(body.meal_type); idx += 1
    if body.logged_at is not None:
        try:
            vals.append(datetime.fromisoformat(body.logged_at))
        except Exception:
            vals.append(None)
        sets.append(f"logged_at=${idx}"); idx += 1
    if body.calories is not None:
        sets.append(f"calories=${idx}"); vals.append(body.calories); idx += 1
    if body.food_id is not None:
        sets.append(f"food_id=${idx}"); vals.append(body.food_id); idx += 1
    if body.food_source is not None:
        sets.append(f"food_source=${idx}"); vals.append(body.food_source); idx += 1
    if body.nutrition_detail is not None:
        sets.append(f"nutrition_detail=${idx}")
        vals.append(json.dumps(body.nutrition_detail, ensure_ascii=False)); idx += 1
    if not sets:
        raise HTTPException(status_code=400, detail="沒有要更新的欄位")
    vals.extend([log_id, user_id])
    sql = f"UPDATE diet_logs SET {', '.join(sets)} WHERE id=${idx} AND user_id=${idx+1} RETURNING *"
    async with pool.acquire() as conn:
        row = await conn.fetchrow(sql, *vals)
    if not row:
        raise HTTPException(status_code=404, detail="記錄不存在")
    d = dict(row)
    d["amount_g"] = d.get("grams", 0)
    if isinstance(d.get("nutrition_detail"), str):
        try:
            d["nutrition_detail"] = json.loads(d["nutrition_detail"])
        except (json.JSONDecodeError, TypeError):
            d["nutrition_detail"] = {}
    return d


@router.delete("/{log_id}")
async def delete_log(log_id: int, user_id: int):
    pool = get_pool()
    async with pool.acquire() as conn:
        result = await conn.execute(
            "DELETE FROM diet_logs WHERE id=$1 AND user_id=$2", log_id, user_id
        )
    if result == "DELETE 0":
        raise HTTPException(status_code=404, detail="記錄不存在")
    return {"message": "已刪除"}
