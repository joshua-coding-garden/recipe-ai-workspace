"""memory_tree_repository.py - 分層記憶樹 CRUD"""
import json
from database import get_pool


async def create_node(user_id: int, session_id: str | None, level: int,
                      parent_id: int | None, content: str,
                      metadata: dict | None = None, token_count: int = 0) -> dict:
    pool = get_pool()
    sid = session_id if session_id else None
    async with pool.acquire() as conn:
        row = await conn.fetchrow(
            """INSERT INTO memory_tree_nodes
                   (user_id, session_id, level, parent_id, content, metadata, token_count)
               VALUES ($1, $2::uuid, $3, $4, $5, $6::jsonb, $7)
               RETURNING *""",
            user_id, sid, level, parent_id, content,
            json.dumps(metadata or {}), token_count,
        )
    return _to_dict(row)


async def get_nodes_by_level(user_id: int, level: int, limit: int = 50) -> list[dict]:
    pool = get_pool()
    async with pool.acquire() as conn:
        rows = await conn.fetch(
            """SELECT * FROM memory_tree_nodes
               WHERE user_id = $1 AND level = $2
               ORDER BY created_at DESC LIMIT $3""",
            user_id, level, limit,
        )
    return [_to_dict(r) for r in rows]


async def get_children(parent_id: int) -> list[dict]:
    pool = get_pool()
    async with pool.acquire() as conn:
        rows = await conn.fetch(
            """SELECT * FROM memory_tree_nodes
               WHERE parent_id = $1 ORDER BY created_at ASC""",
            parent_id,
        )
    return [_to_dict(r) for r in rows]


async def update_node(node_id: int, content: str, token_count: int) -> dict | None:
    pool = get_pool()
    async with pool.acquire() as conn:
        row = await conn.fetchrow(
            """UPDATE memory_tree_nodes
               SET content = $2, token_count = $3
               WHERE id = $1 RETURNING *""",
            node_id, content, token_count,
        )
    return _to_dict(row) if row else None


async def get_session_leaf_count(user_id: int, session_id: str) -> int:
    pool = get_pool()
    async with pool.acquire() as conn:
        val = await conn.fetchval(
            """SELECT COUNT(*) FROM memory_tree_nodes
               WHERE user_id = $1 AND session_id = $2::uuid AND level = 0""",
            user_id, session_id,
        )
    return val or 0


async def get_context(user_id: int, max_tokens: int = 2000) -> str:
    """Token-budget-aware retrieval: profile → recent daily → recent session → recent leaf"""
    pool = get_pool()
    budget = max_tokens
    parts = []
    async with pool.acquire() as conn:
        profile = await conn.fetch(
            "SELECT content, token_count FROM memory_tree_nodes WHERE user_id=$1 AND level=4 ORDER BY updated_at DESC LIMIT 1",
            user_id,
        )
        for r in profile:
            if budget <= 0:
                break
            parts.append(r["content"])
            budget -= r["token_count"] or len(r["content"]) // 3

        daily = await conn.fetch(
            "SELECT content, token_count FROM memory_tree_nodes WHERE user_id=$1 AND level=2 ORDER BY created_at DESC LIMIT 3",
            user_id,
        )
        for r in daily:
            if budget <= 0:
                break
            parts.append(r["content"])
            budget -= r["token_count"] or len(r["content"]) // 3

        session = await conn.fetch(
            "SELECT content, token_count FROM memory_tree_nodes WHERE user_id=$1 AND level=1 ORDER BY created_at DESC LIMIT 3",
            user_id,
        )
        for r in session:
            if budget <= 0:
                break
            parts.append(r["content"])
            budget -= r["token_count"] or len(r["content"]) // 3

        leaves = await conn.fetch(
            "SELECT content, token_count FROM memory_tree_nodes WHERE user_id=$1 AND level=0 ORDER BY created_at DESC LIMIT 5",
            user_id,
        )
        for r in leaves:
            if budget <= 0:
                break
            parts.append(r["content"])
            budget -= r["token_count"] or len(r["content"]) // 3

    return "\n---\n".join(parts)


async def consolidate_children(parent_id: int, summary: str, token_count: int) -> dict | None:
    """Update parent node content from children consolidation."""
    return await update_node(parent_id, summary, token_count)


async def get_unconsolidated_leaves(user_id: int, session_id: str) -> list[dict]:
    pool = get_pool()
    async with pool.acquire() as conn:
        rows = await conn.fetch(
            """SELECT * FROM memory_tree_nodes
               WHERE user_id = $1 AND session_id = $2::uuid AND level = 0
                 AND parent_id IS NULL
               ORDER BY created_at ASC""",
            user_id, session_id,
        )
    return [_to_dict(r) for r in rows]


async def assign_parent(node_ids: list[int], parent_id: int) -> int:
    if not node_ids:
        return 0
    pool = get_pool()
    async with pool.acquire() as conn:
        result = await conn.execute(
            "UPDATE memory_tree_nodes SET parent_id = $1 WHERE id = ANY($2::int[])",
            parent_id, node_ids,
        )
    return int(result.split()[-1])


async def save_embedding(node_id: int, embedding: list[float]) -> None:
    pool = get_pool()
    vec_str = "[" + ",".join(str(x) for x in embedding) + "]"
    async with pool.acquire() as conn:
        await conn.execute(
            "UPDATE memory_tree_nodes SET embedding = $1::vector WHERE id = $2",
            vec_str, node_id,
        )


async def semantic_search(user_id: int, query_embedding: list[float],
                          level_min: int = 0, level_max: int = 3,
                          limit: int = 5) -> list[dict]:
    pool = get_pool()
    vec_str = "[" + ",".join(str(x) for x in query_embedding) + "]"
    async with pool.acquire() as conn:
        rows = await conn.fetch(
            """SELECT *, embedding <=> $1::vector AS distance
               FROM memory_tree_nodes
               WHERE user_id = $2 AND level >= $3 AND level <= $4
                 AND embedding IS NOT NULL
               ORDER BY embedding <=> $1::vector
               LIMIT $5""",
            vec_str, user_id, level_min, level_max, limit,
        )
    results = []
    for r in rows:
        d = _to_dict(r)
        d["distance"] = float(r["distance"])
        d.pop("embedding", None)
        results.append(d)
    return results


def _to_dict(row) -> dict:
    d = dict(row)
    for k in ("created_at", "updated_at"):
        if k in d and d[k]:
            d[k] = d[k].isoformat()
    if "session_id" in d and d["session_id"]:
        d["session_id"] = str(d["session_id"])
    if "metadata" in d and isinstance(d["metadata"], str):
        d["metadata"] = json.loads(d["metadata"])
    return d
