"""cognitive_repository.py - 認知事實三元組 CRUD"""
import json
from database import get_pool


async def upsert_fact(user_id: int, subject: str, predicate: str, obj: str,
                      confidence: float = 1.0, source_session: str | None = None) -> dict:
    pool = get_pool()
    sid = source_session if source_session else None
    async with pool.acquire() as conn:
        existing = await conn.fetchrow(
            """SELECT id FROM cognitive_facts
               WHERE user_id=$1 AND subject=$2 AND predicate=$3 AND is_active=TRUE""",
            user_id, subject, predicate,
        )
        if existing:
            old_id = existing["id"]
            await conn.execute(
                "UPDATE cognitive_facts SET is_active=FALSE, superseded_by=NULL WHERE id=$1",
                old_id,
            )
            row = await conn.fetchrow(
                """INSERT INTO cognitive_facts
                       (user_id, subject, predicate, object, confidence, source_session)
                   VALUES ($1, $2, $3, $4, $5, $6::uuid)
                   RETURNING *""",
                user_id, subject, predicate, obj, confidence, sid,
            )
            await conn.execute(
                "UPDATE cognitive_facts SET superseded_by=$1 WHERE id=$2",
                row["id"], old_id,
            )
        else:
            row = await conn.fetchrow(
                """INSERT INTO cognitive_facts
                       (user_id, subject, predicate, object, confidence, source_session)
                   VALUES ($1, $2, $3, $4, $5, $6::uuid)
                   RETURNING *""",
                user_id, subject, predicate, obj, confidence, sid,
            )
    return _to_dict(row)


async def get_active_facts(user_id: int, predicate_filter: str | None = None,
                           limit: int = 100) -> list[dict]:
    pool = get_pool()
    async with pool.acquire() as conn:
        if predicate_filter:
            rows = await conn.fetch(
                """SELECT * FROM cognitive_facts
                   WHERE user_id=$1 AND is_active=TRUE AND predicate=$2
                   ORDER BY confidence DESC, updated_at DESC LIMIT $3""",
                user_id, predicate_filter, limit,
            )
        else:
            rows = await conn.fetch(
                """SELECT * FROM cognitive_facts
                   WHERE user_id=$1 AND is_active=TRUE
                   ORDER BY confidence DESC, updated_at DESC LIMIT $2""",
                user_id, limit,
            )
    return [_to_dict(r) for r in rows]


async def deactivate_fact(fact_id: int, user_id: int) -> bool:
    pool = get_pool()
    async with pool.acquire() as conn:
        result = await conn.execute(
            "UPDATE cognitive_facts SET is_active=FALSE WHERE id=$1 AND user_id=$2",
            fact_id, user_id,
        )
    return result.split()[-1] != "0"


async def get_profile(user_id: int) -> list[dict]:
    return await get_active_facts(user_id)


def _to_dict(row) -> dict:
    d = dict(row)
    for k in ("created_at", "updated_at"):
        if k in d and d[k]:
            d[k] = d[k].isoformat()
    if "source_session" in d and d["source_session"]:
        d["source_session"] = str(d["source_session"])
    return d
