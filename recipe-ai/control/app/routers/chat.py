"""chat.py - AI 問答路由（已停用）"""
from fastapi import APIRouter, Depends
from pydantic import BaseModel
from loguru import logger
from app.middleware.auth_middleware import require_auth

router = APIRouter(prefix="/chat", tags=["chat"])


class ChatRequest(BaseModel):
    question: str
    history: list[dict] | None = None


@router.post("/ask")
async def ask(body: ChatRequest, user: dict = Depends(require_auth)):
    logger.info("chat_ask user_id={} question_len={}", user["sub"], len(body.question))
    return {"answer": "AI 功能已停用"}
