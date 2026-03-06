"""health.py - FooDB 健康效果查詢路由 + 營養素食物排名"""
from fastapi import APIRouter, Query, HTTPException
from pydantic import BaseModel, Field
from repositories import health_repository

router = APIRouter(prefix="/health", tags=["health"])


class SymptomLookupIn(BaseModel):
    keyword: str = Field(..., min_length=1, max_length=200)


class EffectsToFoodsIn(BaseModel):
    effect_ids: list[int] = Field(..., min_length=1, max_length=50)


# ── 營養素查詢端點（放在 path parameter 路由之前，避免被吃掉）────────

@router.get("/nutrients/list")
async def list_nutrients():
    """列出所有可查詢營養素"""
    return health_repository.list_nutrients()


@router.get("/nutrients/search")
async def search_nutrients(q: str = Query(..., min_length=1)):
    """搜尋營養素（中英文模糊匹配）"""
    return health_repository.search_nutrients(q)


@router.get("/nutrients/{field}/top-foods")
async def get_top_foods(field: str, limit: int = Query(20, ge=1, le=100)):
    """按營養素欄位排名取 Top N 食物（雙 DB：taiwan_foods + FooDB）"""
    results = await health_repository.get_top_foods_by_nutrient(field, limit)
    if results is None:
        raise HTTPException(status_code=404, detail=f"未知的營養素欄位: {field}")
    return results


# ── 原有端點 ──────────────────────────────────────────────────────

@router.get("/effects/search")
async def search_effects(q: str = Query(...), limit: int = Query(20)):
    return await health_repository.search_health_effects(q, limit)


@router.get("/effects/{effect_id}/compounds")
async def get_compounds(effect_id: int, limit: int = Query(50)):
    return await health_repository.get_compounds_for_effects([effect_id], limit)


@router.get("/compounds/{compound_id}/foods")
async def get_foods(compound_id: int, limit: int = Query(20)):
    return await health_repository.get_top_foods_for_compound(compound_id, limit)


@router.get("/nutrients/{nutrient_name}/foods")
async def get_nutrient_foods(nutrient_name: str, limit: int = Query(20)):
    """查詢含指定營養素的食物（支援 DB 欄位名或 FooDB 英文名）"""
    return await health_repository.get_top_foods_for_nutrient(nutrient_name, limit)


@router.post("/symptom-lookup")
async def symptom_lookup(body: SymptomLookupIn):
    return await health_repository.symptom_lookup(body.keyword)


@router.post("/effects-to-foods")
async def effects_to_foods(body: EffectsToFoodsIn):
    """直接用 effect IDs 查 compound → food pipeline（跳過 name 搜尋步驟）"""
    return await health_repository.effects_to_foods(body.effect_ids)
