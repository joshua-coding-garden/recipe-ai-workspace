"""profile.py - 個人資料路由"""
import json
import httpx
from fastapi import APIRouter, Depends
from pydantic import BaseModel
from app.config import settings
from app.middleware.auth_middleware import require_auth

router = APIRouter(prefix="/profile", tags=["profile"])
_TIMEOUT = httpx.Timeout(10.0)
_NOTES_SCHEMA_VERSION = 1


class ProfileIn(BaseModel):
    username: str | None = None
    height_cm: float | None = None
    weight_kg: float | None = None
    age: int | None = None
    gender: str | None = None
    activity_level: str | None = None
    goal: str | None = None


def _decode_notes(notes: str | None) -> tuple[int | None, str]:
    if not notes:
        return None, ""

    try:
        data = json.loads(notes)
        if isinstance(data, dict) and data.get("__profile_v") == _NOTES_SCHEMA_VERSION:
            age = data.get("age")
            goal = data.get("goal") or ""
            return (int(age) if isinstance(age, (int, float)) else None), str(goal)
    except (json.JSONDecodeError, TypeError, ValueError):
        pass

    return None, notes


def _encode_notes(age: int | None, goal: str | None) -> str:
    payload = {
        "__profile_v": _NOTES_SCHEMA_VERSION,
        "age": age,
        "goal": goal or "",
    }
    return json.dumps(payload, ensure_ascii=False)


@router.get("")
async def get_profile(user: dict = Depends(require_auth)):
    uid = user["sub"]
    async with httpx.AsyncClient(timeout=_TIMEOUT) as client:
        user_resp = await client.get(f"{settings.backend_url}/users/{uid}")
        user_data = user_resp.json() if user_resp.status_code == 200 else {}
        profile_resp = await client.get(f"{settings.backend_url}/users/{uid}/profile")
        profile_data = profile_resp.json() if profile_resp.status_code == 200 else {}

    age, goal = _decode_notes(profile_data.get("notes"))

    return {
        "id": uid,
        "email": user.get("email", ""),
        "username": user_data.get("name", ""),
        "height_cm": profile_data.get("height"),
        "weight_kg": profile_data.get("weight"),
        "age": age,
        "gender": profile_data.get("gender", ""),
        "activity_level": profile_data.get("sport_type", "moderate"),
        "goal": goal,
    }


@router.put("")
async def update_profile(body: ProfileIn, user: dict = Depends(require_auth)):
    uid = user["sub"]

    # 先讀既有 profile，只覆蓋本次有提供的欄位（避免部分更新洗掉其他欄位）
    async with httpx.AsyncClient(timeout=_TIMEOUT) as client:
        existing_resp = await client.get(f"{settings.backend_url}/users/{uid}/profile")
        existing = existing_resp.json() if existing_resp.status_code == 200 else {}

    prev_age, prev_goal = _decode_notes(existing.get("notes"))

    merged_name = body.username if body.username is not None else existing.get("name")
    merged_height = int(body.height_cm) if body.height_cm is not None else existing.get("height")
    merged_weight = int(body.weight_kg) if body.weight_kg is not None else existing.get("weight")
    merged_sport = body.activity_level if body.activity_level is not None else existing.get("sport_type", "general")
    merged_gender = body.gender if body.gender is not None else existing.get("gender", "male")
    merged_age = body.age if body.age is not None else prev_age
    merged_goal = body.goal if body.goal is not None else prev_goal

    backend_payload = {
        "name": merged_name,
        "height": merged_height,
        "weight": merged_weight,
        "sport_type": merged_sport,
        "gender": merged_gender,
        "notes": _encode_notes(merged_age, merged_goal),
    }
    async with httpx.AsyncClient(timeout=_TIMEOUT) as client:
        resp = await client.put(
            f"{settings.backend_url}/users/{uid}/profile",
            json=backend_payload,
        )
        resp.raise_for_status()
    profile_data = resp.json()
    age, goal = _decode_notes(profile_data.get("notes"))

    return {
        "id": uid,
        "email": user.get("email", ""),
        "username": profile_data.get("name", ""),
        "height_cm": profile_data.get("height"),
        "weight_kg": profile_data.get("weight"),
        "age": age,
        "gender": profile_data.get("gender", ""),
        "activity_level": profile_data.get("sport_type", "moderate"),
        "goal": goal,
    }
