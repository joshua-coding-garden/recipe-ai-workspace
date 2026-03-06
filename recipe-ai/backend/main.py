"""
backend/main.py - 資料層微服務入口（Port 8001）
僅供 control/ 內部呼叫，不對外公開
"""
from contextlib import asynccontextmanager
import asyncio
from datetime import datetime, timedelta
from zoneinfo import ZoneInfo
from fastapi import FastAPI, Request
from fastapi.middleware.cors import CORSMiddleware
from fastapi.responses import JSONResponse

from database import init_pool, close_pool
from logger import setup_logger, logger
from middleware.logging_middleware import LoggingMiddleware
from routers import food, recipe, user, diet, health, calendar, conversation, memory_tree, cognitive


TW_TZ = ZoneInfo("Asia/Taipei")


async def _hourly_checkpoint_loop() -> None:
    while True:
        now = datetime.now(TW_TZ)
        next_hour = (now + timedelta(hours=1)).replace(minute=0, second=0, microsecond=0)
        await asyncio.sleep((next_hour - now).total_seconds())
        logger.info(
            "BACKEND_HOURLY_CHECKPOINT tw_time={} note=hourly_log_written retention=3h",
            datetime.now(TW_TZ).strftime("%Y-%m-%d %H:%M:%S"),
        )


@asynccontextmanager
async def lifespan(app: FastAPI):
    setup_logger()
    logger.info("backend 啟動，初始化 PostgreSQL 連線池...")
    await init_pool()
    hourly_task = asyncio.create_task(_hourly_checkpoint_loop())
    yield
    hourly_task.cancel()
    try:
        await hourly_task
    except asyncio.CancelledError:
        pass
    await close_pool()
    logger.info("backend 關閉")


app = FastAPI(
    title="Recipe AI - Backend Data Service",
    version="1.0.0",
    lifespan=lifespan,
)

# CORS（僅允許 control 服務）
app.add_middleware(
    CORSMiddleware,
    allow_origins=["http://localhost:8000"],
    allow_methods=["*"],
    allow_headers=["*"],
)

app.add_middleware(LoggingMiddleware)


@app.middleware("http")
async def limit_request_body(request: Request, call_next):
    """限制請求 body 大小為 1MB"""
    content_length = request.headers.get("content-length")
    if content_length and int(content_length) > 2_097_152:
        return JSONResponse(status_code=413, content={"detail": "請求過大，上限 2MB"})
    return await call_next(request)


app.include_router(food.router)
app.include_router(recipe.router)
app.include_router(user.router)
app.include_router(diet.router)
app.include_router(health.router)
app.include_router(calendar.router)
app.include_router(conversation.router)
app.include_router(memory_tree.router)
app.include_router(cognitive.router)


@app.get("/healthz")
async def health():
    return {"status": "ok", "service": "backend"}
