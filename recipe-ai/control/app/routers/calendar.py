"""calendar.py - 行事曆 entries proxy（control 層，需 JWT）"""
import httpx
from datetime import date
from fastapi import APIRouter, Depends, HTTPException
from pydantic import BaseModel
from loguru import logger
from app.config import settings
from app.middleware.auth_middleware import require_auth

router = APIRouter(prefix="/calendar", tags=["calendar"])

_TIMEOUT = httpx.Timeout(connect=3.0, read=10.0, write=5.0, pool=3.0)


class EntryCreateRequest(BaseModel):
    entry_date: date
    recipe_id: int
    servings_override: float | None = None


class EntryUpdateRequest(BaseModel):
    servings_override: float | None = None


@router.get("/entries")
async def list_entries(
    start_date: date,
    end_date: date,
    user: dict = Depends(require_auth),
):
    if end_date < start_date:
        raise HTTPException(status_code=400, detail="end_date 不能早於 start_date")
    logger.info(
        "calendar_list user_id={} start={} end={}",
        user["sub"], start_date, end_date,
    )
    async with httpx.AsyncClient(timeout=_TIMEOUT) as client:
        resp = await client.get(
            f"{settings.backend_url}/calendar/entries",
            params={
                "user_id": user["sub"],
                "start_date": start_date.isoformat(),
                "end_date": end_date.isoformat(),
            },
        )
        resp.raise_for_status()
    return resp.json()


@router.post("/entries", status_code=201)
async def add_entry(body: EntryCreateRequest, user: dict = Depends(require_auth)):
    logger.info(
        "calendar_add user_id={} date={} recipe_id={}",
        user["sub"], body.entry_date, body.recipe_id,
    )
    async with httpx.AsyncClient(timeout=_TIMEOUT) as client:
        resp = await client.post(
            f"{settings.backend_url}/calendar/entries",
            json={
                "user_id": int(user["sub"]),
                "recipe_id": body.recipe_id,
                "entry_date": body.entry_date.isoformat(),
                "servings_override": body.servings_override,
            },
        )
        resp.raise_for_status()
    return resp.json()


@router.put("/entries/{entry_id}")
async def update_entry(
    entry_id: int,
    body: EntryUpdateRequest,
    user: dict = Depends(require_auth),
):
    logger.info(
        "calendar_update user_id={} entry_id={} servings={}",
        user["sub"], entry_id, body.servings_override,
    )
    async with httpx.AsyncClient(timeout=_TIMEOUT) as client:
        resp = await client.put(
            f"{settings.backend_url}/calendar/entries/{entry_id}",
            json={
                "user_id": int(user["sub"]),
                "servings_override": body.servings_override,
            },
        )
        resp.raise_for_status()
    return resp.json()


@router.delete("/entries/{entry_id}")
async def delete_entry(entry_id: int, user: dict = Depends(require_auth)):
    logger.info("calendar_delete user_id={} entry_id={}", user["sub"], entry_id)
    async with httpx.AsyncClient(timeout=_TIMEOUT) as client:
        resp = await client.delete(
            f"{settings.backend_url}/calendar/entries/{entry_id}",
            params={"user_id": user["sub"]},
        )
        resp.raise_for_status()
    return resp.json()
