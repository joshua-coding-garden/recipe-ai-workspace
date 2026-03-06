"""cognitive.py - 認知事實路由"""
from fastapi import APIRouter, HTTPException
from pydantic import BaseModel
from repositories import cognitive_repository

router = APIRouter(prefix="/cognitive", tags=["cognitive"])


class FactIn(BaseModel):
    subject: str
    predicate: str
    object: str
    confidence: float = 1.0
    source_session: str | None = None


class BatchFactsIn(BaseModel):
    user_id: int
    facts: list[FactIn]


@router.post("/facts", status_code=201)
async def batch_upsert(body: BatchFactsIn):
    results = []
    for f in body.facts:
        r = await cognitive_repository.upsert_fact(
            user_id=body.user_id,
            subject=f.subject,
            predicate=f.predicate,
            obj=f.object,
            confidence=f.confidence,
            source_session=f.source_session,
        )
        results.append(r)
    return results


@router.get("/facts")
async def list_facts(user_id: int, predicate: str | None = None, limit: int = 100):
    return await cognitive_repository.get_active_facts(user_id, predicate, limit)


@router.delete("/facts/{fact_id}")
async def deactivate(fact_id: int, user_id: int):
    ok = await cognitive_repository.deactivate_fact(fact_id, user_id)
    if not ok:
        raise HTTPException(status_code=404, detail="事實不存在或無權限")
    return {"message": "已停用"}


@router.get("/profile")
async def get_profile(user_id: int):
    facts = await cognitive_repository.get_profile(user_id)
    return {"user_id": user_id, "facts": facts}
