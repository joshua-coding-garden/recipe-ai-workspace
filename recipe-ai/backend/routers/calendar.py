"""calendar.py - 行事曆 entries 路由"""
from datetime import date
from fastapi import APIRouter, HTTPException
from pydantic import BaseModel
from repositories import calendar_repository

router = APIRouter(prefix="/calendar", tags=["calendar"])


class EntryCreateIn(BaseModel):
    user_id: int
    recipe_id: int
    entry_date: date
    servings_override: float | None = None


class EntryUpdateIn(BaseModel):
    user_id: int
    servings_override: float | None = None


@router.get("/entries")
async def list_entries(user_id: int, start_date: date, end_date: date):
    if end_date < start_date:
        raise HTTPException(status_code=400, detail="end_date 不能早於 start_date")
    return await calendar_repository.list_entries(user_id, start_date, end_date)


@router.post("/entries", status_code=201)
async def add_entry(body: EntryCreateIn):
    entry = await calendar_repository.add_entry(
        user_id=body.user_id,
        recipe_id=body.recipe_id,
        entry_date=body.entry_date,
        servings_override=body.servings_override,
    )
    if not entry:
        raise HTTPException(status_code=404, detail="食譜不存在或不屬於該使用者")
    return entry


@router.put("/entries/{entry_id}")
async def update_entry(entry_id: int, body: EntryUpdateIn):
    entry = await calendar_repository.update_entry(
        entry_id=entry_id,
        user_id=body.user_id,
        servings_override=body.servings_override,
    )
    if not entry:
        raise HTTPException(status_code=404, detail="entry 不存在或無權限更新")
    return entry


@router.delete("/entries/{entry_id}")
async def delete_entry(entry_id: int, user_id: int):
    ok = await calendar_repository.delete_entry(entry_id, user_id)
    if not ok:
        raise HTTPException(status_code=404, detail="entry 不存在或無權限刪除")
    return {"message": "已刪除"}
