"""conversation_repository.py - 對話會話 + 檢查點 CRUD"""
import json
from uuid import UUID
from database import get_pool


async def create_session(user_id: int, title: str = "") -> dict:
    pool = get_pool()
    async with pool.acquire() as conn:
        row = await conn.fetchrow(
            """INSERT INTO conversation_sessions (user_id, title)
               VALUES ($1, $2)
               RETURNING id, user_id, title, is_active, created_at, updated_at""",
            user_id, title,
        )
    return _session_to_dict(row)


async def list_sessions(user_id: int, limit: int = 20) -> list[dict]:
    pool = get_pool()
    async with pool.acquire() as conn:
        rows = await conn.fetch(
            """SELECT id, user_id, title, is_active, created_at, updated_at
               FROM conversation_sessions
               WHERE user_id = $1 AND is_active = TRUE
               ORDER BY updated_at DESC
               LIMIT $2""",
            user_id, limit,
        )
    return [_session_to_dict(r) for r in rows]


async def get_session(session_id: str, user_id: int) -> dict | None:
    pool = get_pool()
    async with pool.acquire() as conn:
        row = await conn.fetchrow(
            """SELECT id, user_id, title, is_active, created_at, updated_at
               FROM conversation_sessions
               WHERE id = $1 AND user_id = $2""",
            UUID(session_id), user_id,
        )
    return _session_to_dict(row) if row else None


async def close_session(session_id: str, user_id: int) -> bool:
    pool = get_pool()
    async with pool.acquire() as conn:
        result = await conn.execute(
            """UPDATE conversation_sessions
               SET is_active = FALSE
               WHERE id = $1 AND user_id = $2""",
            UUID(session_id), user_id,
        )
    return result == "UPDATE 1"


async def save_checkpoint(session_id: str, user_id: int, data: dict) -> dict:
    pool = get_pool()
    async with pool.acquire() as conn:
        await conn.execute(
            """UPDATE conversation_sessions SET updated_at = NOW()
               WHERE id = $1""",
            UUID(session_id),
        )
        row = await conn.fetchrow(
            """INSERT INTO conversation_checkpoints
               (session_id, user_id, turn_index, phase,
                workflow_state, pending_tool_calls, completed_results,
                narrative_memory, structured_store, message_history)
               VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10)
               RETURNING id, session_id, user_id, turn_index, phase, created_at""",
            UUID(session_id),
            user_id,
            data.get("turn_index", 0),
            data.get("phase", "idle"),
            json.dumps(data.get("workflow_state", {}), ensure_ascii=False),
            json.dumps(data.get("pending_tool_calls", []), ensure_ascii=False),
            json.dumps(data.get("completed_results", []), ensure_ascii=False),
            data.get("narrative_memory", ""),
            json.dumps(data.get("structured_store", {}), ensure_ascii=False),
            json.dumps(data.get("message_history", []), ensure_ascii=False),
        )
    return _checkpoint_to_dict(row)


async def get_latest_checkpoint(session_id: str, user_id: int) -> dict | None:
    pool = get_pool()
    async with pool.acquire() as conn:
        row = await conn.fetchrow(
            """SELECT id, session_id, user_id, turn_index, phase,
                      workflow_state, pending_tool_calls, completed_results,
                      narrative_memory, structured_store, message_history,
                      created_at
               FROM conversation_checkpoints
               WHERE session_id = $1 AND user_id = $2
               ORDER BY turn_index DESC
               LIMIT 1""",
            UUID(session_id), user_id,
        )
    return _checkpoint_full_to_dict(row) if row else None


async def delete_session_checkpoints(session_id: str, user_id: int) -> int:
    pool = get_pool()
    async with pool.acquire() as conn:
        result = await conn.execute(
            """DELETE FROM conversation_checkpoints
               WHERE session_id = $1 AND user_id = $2""",
            UUID(session_id), user_id,
        )
    count_str = result.split()[-1] if result else "0"
    try:
        return int(count_str)
    except ValueError:
        return 0


def _session_to_dict(row) -> dict:
    d = dict(row)
    if d.get("id") is not None:
        d["id"] = str(d["id"])
    for k in ("created_at", "updated_at"):
        if d.get(k) is not None:
            d[k] = d[k].isoformat()
    return d


def _checkpoint_to_dict(row) -> dict:
    d = dict(row)
    if d.get("session_id") is not None:
        d["session_id"] = str(d["session_id"])
    if d.get("created_at") is not None:
        d["created_at"] = d["created_at"].isoformat()
    return d


def _checkpoint_full_to_dict(row) -> dict:
    d = dict(row)
    if d.get("session_id") is not None:
        d["session_id"] = str(d["session_id"])
    if d.get("created_at") is not None:
        d["created_at"] = d["created_at"].isoformat()
    for k in ("workflow_state", "pending_tool_calls", "completed_results",
              "structured_store", "message_history"):
        val = d.get(k)
        if isinstance(val, str):
            try:
                d[k] = json.loads(val)
            except (json.JSONDecodeError, TypeError):
                pass
    return d
