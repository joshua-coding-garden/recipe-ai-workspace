"""user_repository.py - 使用者 CRUD"""
from typing import Any
from database import get_pool


async def get_by_email(email: str) -> dict | None:
    pool = get_pool()
    async with pool.acquire() as conn:
        row = await conn.fetchrow("SELECT * FROM users WHERE email = $1", email)
    return dict(row) if row else None


async def get_by_id(user_id: int) -> dict | None:
    pool = get_pool()
    async with pool.acquire() as conn:
        row = await conn.fetchrow("SELECT * FROM users WHERE id = $1", user_id)
    return dict(row) if row else None


async def create(email: str, hashed_pw: str | None, provider: str = "local",
                 name: str | None = None, google_id: str | None = None,
                 avatar_url: str | None = None) -> dict[str, Any]:
    pool = get_pool()
    async with pool.acquire() as conn:
        row = await conn.fetchrow(
            """INSERT INTO users (email, password, provider, name, google_id, avatar_url)
               VALUES ($1, $2, $3, $4, $5, $6) RETURNING *""",
            email, hashed_pw, provider, name, google_id, avatar_url,
        )
    return dict(row)


async def get_profile(user_id: int) -> dict | None:
    pool = get_pool()
    async with pool.acquire() as conn:
        row = await conn.fetchrow(
            "SELECT * FROM profiles WHERE user_id = $1", user_id
        )
    return dict(row) if row else None


async def upsert_profile(user_id: int, data: dict) -> dict[str, Any]:
    pool = get_pool()
    async with pool.acquire() as conn:
        # 某些既有資料庫沒有 profiles.user_id 的 UNIQUE constraint，
        # 以 update-then-insert 避免 ON CONFLICT 造成 500。
        row = await conn.fetchrow(
            """UPDATE profiles
               SET name=$2, birthday=$3, height=$4, weight=$5,
                   sport_type=$6, gender=$7, notes=$8, updated_at=NOW()
               WHERE user_id=$1
               RETURNING *""",
            user_id,
            data.get("name"), data.get("birthday"), data.get("height"),
            data.get("weight"), data.get("sport_type", "general"),
            data.get("gender", "male"), data.get("notes"),
        )

        if not row:
            row = await conn.fetchrow(
                """INSERT INTO profiles (user_id, name, birthday, height, weight, sport_type, gender, notes)
                   VALUES ($1, $2, $3, $4, $5, $6, $7, $8)
                   RETURNING *""",
                user_id,
                data.get("name"), data.get("birthday"), data.get("height"),
                data.get("weight"), data.get("sport_type", "general"),
                data.get("gender", "male"), data.get("notes"),
            )
    return dict(row)
