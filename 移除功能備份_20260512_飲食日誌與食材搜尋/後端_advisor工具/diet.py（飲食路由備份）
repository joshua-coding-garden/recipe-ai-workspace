"""diet.py - 飲食記錄路由（代理到 backend/）"""
import httpx
from fastapi import APIRouter, Depends
from pydantic import BaseModel
from loguru import logger
from app.config import settings
from app.middleware.auth_middleware import require_auth
from app.services.nutrition_service import calculate_single_food_nutrition

router = APIRouter(prefix="/diet", tags=["diet"])
_TIMEOUT = httpx.Timeout(10.0)


class DietLogIn(BaseModel):
    food_name: str
    amount_g: float
    meal_type: str = "lunch"
    logged_at: str | None = None
    calories: float | None = None
    food_id: int | None = None
    food_source: str | None = None


@router.get("/logs")
async def list_logs(user: dict = Depends(require_auth)):
    async with httpx.AsyncClient(timeout=_TIMEOUT) as client:
        resp = await client.get(
            f"{settings.backend_url}/diet-logs",
            params={"user_id": user["sub"]},
        )
        resp.raise_for_status()
    return resp.json()


@router.post("/logs", status_code=201)
async def create_log(body: DietLogIn, user: dict = Depends(require_auth)):
    payload = {
        "user_id": int(user["sub"]),
        "food_name": body.food_name,
        "amount_g": body.amount_g,
        "meal_type": body.meal_type,
        "logged_at": body.logged_at,
        "calories": body.calories,
        "food_id": body.food_id,
        "food_source": body.food_source,
    }

    # 如有 food_id，自動計算完整營養素
    nutrition_detail = {}
    if body.food_id and body.food_source:
        try:
            result = await calculate_single_food_nutrition(
                body.food_id, body.food_source, body.amount_g,
            )
            nutrition_detail = result.get("nutrition", {})
        except Exception as e:
            logger.warning("auto_nutrition_calc_failed: {}", e)

    payload["nutrition_detail"] = nutrition_detail

    async with httpx.AsyncClient(timeout=_TIMEOUT) as client:
        resp = await client.post(
            f"{settings.backend_url}/diet-logs",
            json=payload,
        )
        resp.raise_for_status()
    return resp.json()


class DietLogUpdate(BaseModel):
    food_name: str | None = None
    amount_g: float | None = None
    meal_type: str | None = None
    logged_at: str | None = None
    calories: float | None = None
    food_id: int | None = None
    food_source: str | None = None


@router.put("/logs/{log_id}")
async def update_log(log_id: int, body: DietLogUpdate, user: dict = Depends(require_auth)):
    payload = {k: v for k, v in body.model_dump().items() if v is not None}
    if body.amount_g is not None and body.food_id and body.food_source:
        try:
            result = await calculate_single_food_nutrition(
                body.food_id, body.food_source, body.amount_g,
            )
            payload["nutrition_detail"] = result.get("nutrition", {})
        except Exception as e:
            logger.warning("auto_nutrition_calc_failed: {}", e)
    async with httpx.AsyncClient(timeout=_TIMEOUT) as client:
        resp = await client.put(
            f"{settings.backend_url}/diet-logs/{log_id}",
            json=payload,
            params={"user_id": user["sub"]},
        )
        resp.raise_for_status()
    return resp.json()


@router.delete("/logs/{log_id}")
async def delete_log(log_id: int, user: dict = Depends(require_auth)):
    async with httpx.AsyncClient(timeout=_TIMEOUT) as client:
        resp = await client.delete(
            f"{settings.backend_url}/diet-logs/{log_id}",
            params={"user_id": user["sub"]},
        )
        resp.raise_for_status()
    return resp.json()
