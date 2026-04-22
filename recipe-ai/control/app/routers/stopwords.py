"""
stopwords.py - 停用詞 CRUD API

所有寫入操作都需要 JWT,並寫入審計日誌。
列表端點刻意不支援分頁 / 搜尋,前端一次顯示全部。
"""
from __future__ import annotations

from fastapi import APIRouter, Depends, HTTPException, Request
from pydantic import BaseModel, Field

from app.middleware.auth_middleware import require_auth
from app.services import audit_log_service
from app.services.stopword_store import stopword_store

router = APIRouter(prefix="/stopwords", tags=["stopwords"])


# ── Request Models ───────────────────────────────────────────────

class CreateStopwordRequest(BaseModel):
    word: str = Field(..., min_length=1, max_length=20)
    category: str = Field("custom", max_length=32)
    source_context: str | None = Field(None, max_length=64)


class BulkStopwordRequest(BaseModel):
    words: list[str] = Field(..., min_length=1, max_length=100)
    category: str = Field("user_flag", max_length=32)
    source_context: str | None = Field(None, max_length=64)


class UpdateStopwordRequest(BaseModel):
    new_word: str | None = Field(None, min_length=1, max_length=20)
    category: str | None = Field(None, max_length=32)


# ── Endpoints ────────────────────────────────────────────────────

@router.get("")
async def list_stopwords(_: dict = Depends(require_auth)):
    """一次列出全部停用詞 (按使用者要求:不分頁、不搜尋)。"""
    entries = stopword_store.list_all()
    return {"entries": entries, "count": len(entries), "stats": stopword_store.stats()}


@router.post("", status_code=201)
async def create_stopword(
    body: CreateStopwordRequest,
    request: Request,
    actor: dict = Depends(require_auth),
):
    try:
        entry = stopword_store.add(
            word=body.word,
            category=body.category,
            actor=actor,
            source_context=body.source_context,
        )
    except ValueError as e:
        raise HTTPException(status_code=409, detail=str(e))

    audit_log_service.log(
        action="stopword.create",
        actor=actor,
        target=entry["word"],
        before=None,
        after=entry,
        request=request,
    )
    return entry


@router.post("/bulk", status_code=201)
async def create_stopwords_bulk(
    body: BulkStopwordRequest,
    request: Request,
    actor: dict = Depends(require_auth),
):
    result = stopword_store.add_bulk(
        words=body.words,
        category=body.category,
        actor=actor,
        source_context=body.source_context,
    )
    audit_log_service.log(
        action="stopword.create_bulk",
        actor=actor,
        target=",".join([e["word"] for e in result["added"]]),
        before=None,
        after=result,
        request=request,
        extra={"source_context": body.source_context},
    )
    return result


@router.put("/{word}")
async def update_stopword(
    word: str,
    body: UpdateStopwordRequest,
    request: Request,
    actor: dict = Depends(require_auth),
):
    try:
        before, after = stopword_store.update(
            word=word,
            new_word=body.new_word,
            category=body.category,
            actor=actor,
        )
    except ValueError as e:
        raise HTTPException(status_code=409, detail=str(e))

    if before is None:
        raise HTTPException(status_code=404, detail=f"stopword not found: {word}")

    audit_log_service.log(
        action="stopword.update",
        actor=actor,
        target=word,
        before=before,
        after=after,
        request=request,
    )
    return after


@router.delete("/{word}")
async def delete_stopword(
    word: str,
    request: Request,
    actor: dict = Depends(require_auth),
):
    before = stopword_store.delete(word, actor=actor)
    if before is None:
        raise HTTPException(status_code=404, detail=f"stopword not found: {word}")

    audit_log_service.log(
        action="stopword.delete",
        actor=actor,
        target=word,
        before=before,
        after=None,
        request=request,
    )
    return {"message": f"deleted: {word}", "before": before}
