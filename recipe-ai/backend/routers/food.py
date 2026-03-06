"""
food.py - 食物搜尋路由（供 control/ 呼叫）
  GET  /foods/search/zh?terms=雞胸肉,雞柳&limit=20
  GET  /foods/search/en?terms=chicken,poultry&limit=20
  GET  /foods/{id}?source=taiwan_foods|foodb
  GET  /foods/{id}/nutrition?source=taiwan_foods
  POST /foods/aggregate-nutrition
  GET  /foods/taiwan/browse?page=1&limit=24&search=&category=
  GET  /foods/taiwan/categories
  GET  /foods/taiwan/stats
"""
from fastapi import APIRouter, Query, HTTPException
from pydantic import BaseModel
from repositories.food_repository import (
    search_zh,
    search_en,
    search_exact_zh,
    search_exact_en,
    get_food_detail,
    get_all_food_names,
    get_foodb_food_full,
)
from repositories.nutrition_repository import get_full_nutrition, aggregate_nutrition
from repositories.taiwan_food_browse_repository import (
    browse_taiwan_foods,
    get_taiwan_food_categories,
    get_taiwan_food_stats,
)

router = APIRouter(prefix="/foods", tags=["foods"])


class BatchSearchRequest(BaseModel):
    zh_terms: list[str] = []
    en_terms: list[str] = []
    limit: int = 20


@router.post("/search/batch")
async def search_batch_endpoint(req: BatchSearchRequest):
    """批次回傳中英文候選，減少 control->backend round-trip。"""
    limit = min(max(req.limit, 1), 50)
    zh_terms = [t.strip() for t in req.zh_terms if t and t.strip()]
    en_terms = [t.strip() for t in req.en_terms if t and t.strip()]

    zh_candidates = await search_zh(zh_terms, limit) if zh_terms else []
    en_candidates = await search_en(en_terms, limit) if en_terms else []
    return {
        "zh_candidates": zh_candidates,
        "en_candidates": en_candidates,
    }


@router.get("/search/zh")
async def search_zh_endpoint(
    terms: str = Query(..., description="逗號分隔的中文搜尋詞"),
    limit: int = Query(20, ge=1, le=50),
):
    term_list = [t.strip() for t in terms.split(",") if t.strip()]
    return {"candidates": await search_zh(term_list, limit)}


@router.get("/search/zh/exact")
async def search_exact_zh_endpoint(
    terms: str = Query(..., description="逗號分隔的中文搜尋詞（精確匹配）"),
    limit: int = Query(20, ge=1, le=50),
):
    term_list = [t.strip() for t in terms.split(",") if t.strip()]
    return {"candidates": await search_exact_zh(term_list, limit)}


@router.get("/search/en")
async def search_en_endpoint(
    terms: str = Query(..., description="逗號分隔的英文搜尋詞"),
    limit: int = Query(20, ge=1, le=50),
):
    term_list = [t.strip() for t in terms.split(",") if t.strip()]
    return {"candidates": await search_en(term_list, limit)}


@router.get("/search/en/exact")
async def search_exact_en_endpoint(
    terms: str = Query(..., description="逗號分隔的英文搜尋詞（精確匹配）"),
    limit: int = Query(20, ge=1, le=50),
):
    term_list = [t.strip() for t in terms.split(",") if t.strip()]
    return {"candidates": await search_exact_en(term_list, limit)}


@router.get("/names/all")
async def get_all_names():
    """回傳所有食物名稱（供反向搜尋快取）。"""
    return await get_all_food_names()


@router.get("/taiwan/browse")
async def browse_taiwan_endpoint(
    page: int = Query(1, ge=1),
    limit: int = Query(24, ge=1, le=100),
    search: str = Query(""),
    category: str = Query(""),
):
    return await browse_taiwan_foods(page, limit, search, category)


@router.get("/taiwan/categories")
async def taiwan_categories_endpoint():
    categories = await get_taiwan_food_categories()
    return {"categories": categories}


@router.get("/taiwan/stats")
async def taiwan_stats_endpoint():
    stats = await get_taiwan_food_stats()
    return {"stats": stats}


class NutritionItem(BaseModel):
    food_id: int
    source: str
    grams: float
    input_food_name: str | None = None
    raw_amount: str | None = None
    parsed_unit: str | None = None
    estimated: bool | None = None


class AggregateNutritionRequest(BaseModel):
    items: list[NutritionItem]


@router.post("/aggregate-nutrition")
async def aggregate_nutrition_endpoint(req: AggregateNutritionRequest):
    """批次結算多食物的完整營養素總量。"""
    if not req.items:
        raise HTTPException(status_code=400, detail="items 不可為空")
    result = await aggregate_nutrition([it.model_dump() for it in req.items])
    return result


@router.get("/foodb/{food_id}")
async def get_foodb_food_detail(
    food_id: int,
    compound_limit: int = Query(50, ge=1, le=200, description="化合物上限"),
):
    """取得 FooDB 食物的完整詳情（基本資訊 + 化合物 + 營養素）。"""
    detail = await get_foodb_food_full(food_id, compound_limit)
    if not detail:
        raise HTTPException(status_code=404, detail="食物不存在")
    return detail


@router.get("/{food_id}/nutrition")
async def get_food_nutrition(
    food_id: int,
    source: str = Query("taiwan_foods", description="taiwan_foods | foodb"),
):
    """取得單一食物的完整營養素（僅非 null 值）。"""
    nutrients = await get_full_nutrition(food_id, source)
    if not nutrients:
        raise HTTPException(status_code=404, detail="食物不存在")
    from nutrient_registry import get_nutrient_meta
    return {
        "food_id": food_id,
        "source": source,
        "nutrition": nutrients,
        "nutrient_meta": get_nutrient_meta(nutrients.keys()),
    }


@router.get("/{food_id}")
async def get_food(
    food_id: int,
    source: str = Query("taiwan_foods", description="taiwan_foods | foodb"),
):
    detail = await get_food_detail(food_id, source)
    if not detail:
        raise HTTPException(status_code=404, detail="食物不存在")
    return detail
