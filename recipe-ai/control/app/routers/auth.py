"""auth.py - 登入/註冊路由"""
import httpx
from fastapi import APIRouter, HTTPException
from pydantic import BaseModel, EmailStr
from app.config import settings
from app.services.auth_service import hash_password, verify_password, create_token

router = APIRouter(prefix="/auth", tags=["auth"])
_TIMEOUT = httpx.Timeout(5.0)


class LoginIn(BaseModel):
    email: EmailStr
    password: str


class RegisterIn(BaseModel):
    email: EmailStr
    password: str
    name: str | None = None


@router.post("/login")
async def login(body: LoginIn):
    async with httpx.AsyncClient(timeout=_TIMEOUT) as client:
        resp = await client.get(
            f"{settings.backend_url}/users/by-email/{body.email}"
        )
    if resp.status_code == 404:
        raise HTTPException(status_code=401, detail="帳號或密碼錯誤")

    user = resp.json()
    if not user.get("password") or not verify_password(body.password, user["password"]):
        raise HTTPException(status_code=401, detail="帳號或密碼錯誤")

    token = create_token(user["id"], user["email"])
    return {"access_token": token, "token_type": "bearer", "user": {
        "id": user["id"], "email": user["email"], "name": user.get("name"),
    }}


@router.post("/register", status_code=201)
async def register(body: RegisterIn):
    hashed = hash_password(body.password)
    async with httpx.AsyncClient(timeout=_TIMEOUT) as client:
        resp = await client.post(
            f"{settings.backend_url}/users",
            json={
                "email": body.email,
                "hashed_password": hashed,
                "provider": "local",
                "name": body.name,
            },
        )
    if resp.status_code == 409:
        raise HTTPException(status_code=409, detail="Email 已被使用")
    resp.raise_for_status()
    user = resp.json()
    token = create_token(user["id"], user["email"])
    return {"access_token": token, "token_type": "bearer", "user": {
        "id": user["id"], "email": user["email"], "name": user.get("name"),
    }}


@router.get("/me")
async def me(user: dict = None):
    # 使用 middleware 驗證，見 main.py 依賴注入
    return user
