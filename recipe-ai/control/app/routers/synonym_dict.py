"""
synonym_dict.py - 食材同義詞辭典 CRUD + 管道控制 API
"""
from fastapi import APIRouter, Query, HTTPException
from pydantic import BaseModel
from loguru import logger

from app.services.food_synonym_store import food_synonym_store

router = APIRouter(prefix="/synonym-dict", tags=["synonym-dictionary"])


# ── Request Models ───────────────────────────────────────────────

class CreateEntryRequest(BaseModel):
    canonical: str
    language: str = "zh"
    synonyms: list[str] = []
    sources: list[str] = ["manual"]


class UpdateEntryRequest(BaseModel):
    add_synonyms: list[str] | None = None
    remove_synonyms: list[str] | None = None
    synonyms: list[str] | None = None
    sources: list[str] | None = None


class ExpandRequest(BaseModel):
    ingredient: str


class RunPipelineRequest(BaseModel):
    site_keys: list[str] | None = None
    max_recipes_per_site: int = 50


# ── CRUD Endpoints ───────────────────────────────────────────────

@router.post("/entries", status_code=201)
async def create_entry(body: CreateEntryRequest):
    """手動新增一筆同義詞條目。"""
    try:
        entry = food_synonym_store.create(
            canonical=body.canonical,
            language=body.language,
            synonyms=body.synonyms,
            sources=body.sources,
        )
        return entry
    except ValueError as e:
        raise HTTPException(status_code=409, detail=str(e))


@router.get("/entries/{canonical}")
async def read_entry(canonical: str):
    """查詢特定條目。"""
    entry = food_synonym_store.read(canonical)
    if not entry:
        raise HTTPException(status_code=404, detail=f"entry not found: {canonical}")
    return entry


@router.put("/entries/{canonical}")
async def update_entry(canonical: str, body: UpdateEntryRequest):
    """更新既有條目的同義詞。"""
    entry = food_synonym_store.update(
        canonical,
        synonyms=body.synonyms,
        add_synonyms=body.add_synonyms,
        remove_synonyms=body.remove_synonyms,
        sources=body.sources,
    )
    if not entry:
        raise HTTPException(status_code=404, detail=f"entry not found: {canonical}")
    return entry


@router.delete("/entries/{canonical}")
async def delete_entry(canonical: str):
    """刪除條目。"""
    deleted = food_synonym_store.delete(canonical)
    if not deleted:
        raise HTTPException(status_code=404, detail=f"entry not found: {canonical}")
    return {"message": f"deleted: {canonical}"}


# ── Search & Lookup ──────────────────────────────────────────────

@router.get("/lookup")
async def lookup(term: str = Query(..., description="食材名稱或同義詞")):
    """雙向查詢：依 canonical 或任一同義詞查找。"""
    entry = food_synonym_store.lookup_synonym(term)
    if not entry:
        raise HTTPException(status_code=404, detail=f"no match for: {term}")
    return entry


@router.get("/entries")
async def list_entries(
    language: str = Query(None, description="篩選語言: zh / en"),
    limit: int = Query(100, ge=1, le=1000),
    offset: int = Query(0, ge=0),
):
    """列出所有條目（分頁）。"""
    entries = food_synonym_store.list_all(language=language, limit=limit, offset=offset)
    return {"entries": entries, "count": len(entries)}


@router.get("/search")
async def search_entries(
    q: str = Query(..., description="搜尋關鍵字"),
    limit: int = Query(20, ge=1, le=100),
):
    """子字串搜尋。"""
    results = food_synonym_store.search(q, limit=limit)
    return {"results": results, "count": len(results)}


@router.get("/stats")
async def get_stats():
    """辭典統計。"""
    return food_synonym_store.stats()


# ── Expansion & Pipeline ─────────────────────────────────────────

@router.post("/expand")
async def expand_ingredient(body: ExpandRequest):
    """擴展單一食材並存入辭典。"""
    from app.services.synonym_pipeline import synonym_pipeline

    try:
        entry = await synonym_pipeline.expand_single(body.ingredient)
        return entry
    except Exception as e:
        logger.error("expand failed for '{}': {}", body.ingredient, e)
        raise HTTPException(status_code=500, detail=str(e))


@router.post("/pipeline/run")
async def run_pipeline(body: RunPipelineRequest):
    """觸發完整爬蟲→擴展→存儲管道。"""
    from app.services.synonym_pipeline import synonym_pipeline

    if synonym_pipeline.is_running:
        raise HTTPException(status_code=409, detail="pipeline is already running")

    try:
        stats = await synonym_pipeline.run_full(
            site_keys=body.site_keys,
            max_recipes_per_site=body.max_recipes_per_site,
        )
        return stats
    except Exception as e:
        logger.error("pipeline failed: {}", e)
        raise HTTPException(status_code=500, detail=str(e))


@router.get("/pipeline/status")
async def pipeline_status():
    """查詢管道執行狀態。"""
    from app.services.synonym_pipeline import synonym_pipeline

    return {"running": synonym_pipeline.is_running}
