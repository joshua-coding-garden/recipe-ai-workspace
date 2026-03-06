"""conversation.py - 對話會話 + 檢查點路由"""
from fastapi import APIRouter, HTTPException
from pydantic import BaseModel
from repositories import conversation_repository

router = APIRouter(prefix="/conversations", tags=["conversations"])


class SessionCreateIn(BaseModel):
    user_id: int
    title: str = ""


class CheckpointCreateIn(BaseModel):
    session_id: str
    user_id: int
    turn_index: int = 0
    phase: str = "idle"
    workflow_state: dict = {}
    pending_tool_calls: list = []
    completed_results: list = []
    narrative_memory: str = ""
    structured_store: dict = {}
    message_history: list = []


# ── Sessions ──

@router.post("/sessions", status_code=201)
async def create_session(body: SessionCreateIn):
    return await conversation_repository.create_session(
        user_id=body.user_id, title=body.title,
    )


@router.get("/sessions")
async def list_sessions(user_id: int, limit: int = 20):
    return await conversation_repository.list_sessions(user_id, limit)


@router.get("/sessions/{session_id}")
async def get_session(session_id: str, user_id: int):
    s = await conversation_repository.get_session(session_id, user_id)
    if not s:
        raise HTTPException(status_code=404, detail="會話不存在")
    return s


@router.delete("/sessions/{session_id}")
async def close_session(session_id: str, user_id: int):
    ok = await conversation_repository.close_session(session_id, user_id)
    if not ok:
        raise HTTPException(status_code=404, detail="會話不存在或無權限")
    return {"message": "會話已關閉"}


# ── Checkpoints ──

@router.post("/checkpoints", status_code=201)
async def save_checkpoint(body: CheckpointCreateIn):
    return await conversation_repository.save_checkpoint(
        session_id=body.session_id,
        user_id=body.user_id,
        data={
            "turn_index": body.turn_index,
            "phase": body.phase,
            "workflow_state": body.workflow_state,
            "pending_tool_calls": body.pending_tool_calls,
            "completed_results": body.completed_results,
            "narrative_memory": body.narrative_memory,
            "structured_store": body.structured_store,
            "message_history": body.message_history,
        },
    )


@router.get("/checkpoints/latest")
async def get_latest_checkpoint(session_id: str, user_id: int):
    cp = await conversation_repository.get_latest_checkpoint(session_id, user_id)
    if not cp:
        raise HTTPException(status_code=404, detail="無檢查點")
    return cp


@router.delete("/checkpoints")
async def delete_checkpoints(session_id: str, user_id: int):
    count = await conversation_repository.delete_session_checkpoints(session_id, user_id)
    return {"deleted_count": count}
