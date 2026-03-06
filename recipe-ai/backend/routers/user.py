"""user.py - 使用者 CRUD 路由（供 control/ 呼叫）"""
from fastapi import APIRouter, HTTPException
from pydantic import BaseModel
from repositories import user_repository

router = APIRouter(prefix="/users", tags=["users"])


class UserCreateIn(BaseModel):
    email: str
    hashed_password: str | None = None
    provider: str = "local"
    name: str | None = None
    google_id: str | None = None
    avatar_url: str | None = None


class ProfileIn(BaseModel):
    name: str | None = None
    birthday: str | None = None
    height: int | None = None
    weight: int | None = None
    sport_type: str = "general"
    gender: str = "male"
    notes: str | None = None


@router.get("/{user_id}")
async def get_user(user_id: int):
    user = await user_repository.get_by_id(user_id)
    if not user:
        raise HTTPException(status_code=404, detail="使用者不存在")
    user.pop("password", None)
    return user


@router.get("/by-email/{email}")
async def get_user_by_email(email: str):
    user = await user_repository.get_by_email(email)
    if not user:
        raise HTTPException(status_code=404, detail="使用者不存在")
    return user


@router.post("", status_code=201)
async def create_user(body: UserCreateIn):
    existing = await user_repository.get_by_email(body.email)
    if existing:
        raise HTTPException(status_code=409, detail="Email 已被使用")
    return await user_repository.create(
        email=body.email,
        hashed_pw=body.hashed_password,
        provider=body.provider,
        name=body.name,
        google_id=body.google_id,
        avatar_url=body.avatar_url,
    )


@router.get("/{user_id}/profile")
async def get_profile(user_id: int):
    profile = await user_repository.get_profile(user_id)
    if not profile:
        raise HTTPException(status_code=404, detail="個人資料不存在")
    return profile


@router.put("/{user_id}/profile")
async def update_profile(user_id: int, body: ProfileIn):
    return await user_repository.upsert_profile(user_id, body.model_dump())
