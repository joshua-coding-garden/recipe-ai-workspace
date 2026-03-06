"""
control/main.py - 業務邏輯層入口（Port 8000）
"""
from contextlib import asynccontextmanager
import httpx
from fastapi import FastAPI, Request
from fastapi.middleware.cors import CORSMiddleware
from fastapi.responses import JSONResponse

from app.logger import setup_logger, logger
from app.config import settings
from app.middleware.logging_middleware import LoggingMiddleware
from app.services.translate_service import init_translator
from app.routers import recipe, auth, food, diet, chat, profile, health, synonym_dict, stopwords, dri, calendar, advisor
from app.services.seed_stopwords import run_startup_seed


@asynccontextmanager
async def lifespan(app: FastAPI):
    setup_logger()
    logger.info("control 服務啟動，預載翻譯語言包...")
    init_translator()
    run_startup_seed()
    logger.info("control 服務就緒")
    yield
    logger.info("control 服務關閉")


app = FastAPI(
    title="Recipe AI - Control Service",
    version="1.0.0",
    lifespan=lifespan,
)

# CORS（從設定檔讀取允許的來源）
app.add_middleware(
    CORSMiddleware,
    allow_origins=[o.strip() for o in settings.cors_origins.split(",") if o.strip()],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)


@app.exception_handler(httpx.HTTPStatusError)
async def httpx_status_error_handler(request: Request, exc: httpx.HTTPStatusError):
    """將 backend 回傳的 HTTP 錯誤轉為乾淨的 JSON 回應"""
    try:
        detail = exc.response.json().get("detail", exc.response.text)
    except Exception:
        detail = exc.response.text
    return JSONResponse(
        status_code=exc.response.status_code,
        content={"detail": detail},
    )

# 請求/回應 Log
app.add_middleware(LoggingMiddleware)

# 路由
app.include_router(auth.router)
app.include_router(recipe.router)
app.include_router(food.router)
app.include_router(diet.router)
app.include_router(chat.router)
app.include_router(profile.router)
app.include_router(health.router)
app.include_router(synonym_dict.router)
app.include_router(dri.router)
app.include_router(stopwords.router)
app.include_router(calendar.router)
app.include_router(advisor.router)


@app.get("/healthz")
async def health():
    return {"status": "ok", "service": "control"}
