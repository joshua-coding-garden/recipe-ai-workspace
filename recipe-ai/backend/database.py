import asyncpg
from loguru import logger
from app_config import settings

_pool: asyncpg.Pool | None = None


async def _ensure_schema_compat(pool: asyncpg.Pool) -> None:
    """補齊舊版 DB volume 缺少的欄位，避免新版程式查詢/寫入 500。"""
    async with pool.acquire() as conn:
        await conn.execute(
            """
            ALTER TABLE IF EXISTS recipe_nutrition
            ADD COLUMN IF NOT EXISTS nutrition_detail JSONB DEFAULT '{}'::jsonb
            """
        )
        await conn.execute(
            """
            ALTER TABLE IF EXISTS diet_logs
              ADD COLUMN IF NOT EXISTS food_id INT,
              ADD COLUMN IF NOT EXISTS food_source VARCHAR(20),
              ADD COLUMN IF NOT EXISTS nutrition_detail JSONB DEFAULT '{}'::jsonb
            """
        )
        await conn.execute(
            """
            ALTER TABLE IF EXISTS recipe_calendar_entries
              ADD COLUMN IF NOT EXISTS servings_override NUMERIC DEFAULT 1
            """
        )
    logger.info("Schema 相容性檢查完成（nutrition_detail / diet_logs / calendar servings）")


async def init_pool() -> None:
    global _pool
    _pool = await asyncpg.create_pool(
        host=settings.db_host,
        port=settings.db_port,
        database=settings.db_name,
        user=settings.db_user,
        password=settings.db_password,
        min_size=2,
        max_size=10,
        command_timeout=30,
    )
    await _ensure_schema_compat(_pool)
    logger.info("PostgreSQL 連線池建立完成 (min=2, max=10)")


async def close_pool() -> None:
    global _pool
    if _pool:
        await _pool.close()
        logger.info("PostgreSQL 連線池已關閉")


def get_pool() -> asyncpg.Pool:
    if _pool is None:
        raise RuntimeError("資料庫連線池尚未初始化")
    return _pool
