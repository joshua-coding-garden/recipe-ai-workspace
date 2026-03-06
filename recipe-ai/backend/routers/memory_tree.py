"""memory_tree.py - 分層記憶樹路由"""
from fastapi import APIRouter, HTTPException
from pydantic import BaseModel
from repositories import memory_tree_repository

router = APIRouter(prefix="/memory", tags=["memory"])


class NodeCreateIn(BaseModel):
    user_id: int
    session_id: str | None = None
    level: int = 0
    parent_id: int | None = None
    content: str = ""
    metadata: dict = {}
    token_count: int = 0


class ConsolidateIn(BaseModel):
    parent_id: int
    summary: str
    token_count: int = 0
    child_ids: list[int] = []


class NodeUpdateIn(BaseModel):
    content: str
    token_count: int = 0


@router.post("/nodes", status_code=201)
async def create_node(body: NodeCreateIn):
    return await memory_tree_repository.create_node(
        user_id=body.user_id,
        session_id=body.session_id,
        level=body.level,
        parent_id=body.parent_id,
        content=body.content,
        metadata=body.metadata,
        token_count=body.token_count,
    )


@router.get("/nodes")
async def list_nodes(user_id: int, level: int = 0, limit: int = 50):
    return await memory_tree_repository.get_nodes_by_level(user_id, level, limit)


@router.get("/nodes/{node_id}/children")
async def get_children(node_id: int):
    return await memory_tree_repository.get_children(node_id)


@router.put("/nodes/{node_id}")
async def update_node(node_id: int, body: NodeUpdateIn):
    result = await memory_tree_repository.update_node(node_id, body.content, body.token_count)
    if not result:
        raise HTTPException(status_code=404, detail="節點不存在")
    return result


@router.post("/consolidate")
async def consolidate(body: ConsolidateIn):
    if body.child_ids:
        await memory_tree_repository.assign_parent(body.child_ids, body.parent_id)
    result = await memory_tree_repository.consolidate_children(
        body.parent_id, body.summary, body.token_count,
    )
    if not result:
        raise HTTPException(status_code=404, detail="父節點不存在")
    return result


@router.get("/context")
async def get_context(user_id: int, max_tokens: int = 2000):
    text = await memory_tree_repository.get_context(user_id, max_tokens)
    return {"context": text}


class EmbeddingSaveIn(BaseModel):
    node_id: int
    embedding: list[float]


class SemanticSearchIn(BaseModel):
    user_id: int
    query_embedding: list[float]
    level_min: int = 0
    level_max: int = 3
    limit: int = 5


@router.post("/embedding")
async def save_embedding(body: EmbeddingSaveIn):
    await memory_tree_repository.save_embedding(body.node_id, body.embedding)
    return {"status": "ok"}


@router.post("/search")
async def semantic_search(body: SemanticSearchIn):
    results = await memory_tree_repository.semantic_search(
        body.user_id, body.query_embedding,
        body.level_min, body.level_max, body.limit,
    )
    return results
