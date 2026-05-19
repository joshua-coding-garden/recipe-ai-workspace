"""food.py - 食物搜尋路由（代理到 backend/）"""
import httpx
from fastapi import APIRouter, Query, Path
from app.config import settings

router = APIRouter(prefix="/food", tags=["food"])
_TIMEOUT = httpx.Timeout(15.0)


@router.get("/search")
async def search_food(
    q: str = Query(..., description="搜尋詞"),
    lang: str = Query("auto", description="zh | en | auto"),
    limit: int = Query(20, ge=1),
):
    from app.services.language_detector import detect
    if lang == "auto":
        lang = detect(q)

    endpoint = "/foods/search/zh" if lang == "zh" else "/foods/search/en"
    async with httpx.AsyncClient(timeout=_TIMEOUT) as client:
        resp = await client.get(
            f"{settings.backend_url}{endpoint}",
            params={"terms": q, "limit": limit},
        )
        resp.raise_for_status()
    return resp.json()


@router.get("/taiwan/browse")
async def browse_taiwan(
    page: int = Query(1, ge=1),
    limit: int = Query(24, ge=1),
    search: str = Query(""),
    category: str = Query(""),
):
    async with httpx.AsyncClient(timeout=_TIMEOUT) as client:
        resp = await client.get(
            f"{settings.backend_url}/foods/taiwan/browse",
            params={"page": page, "limit": limit, "search": search, "category": category},
        )
        resp.raise_for_status()
    return resp.json()


@router.get("/taiwan/categories")
async def taiwan_categories():
    async with httpx.AsyncClient(timeout=_TIMEOUT) as client:
        resp = await client.get(f"{settings.backend_url}/foods/taiwan/categories")
        resp.raise_for_status()
    return resp.json()


@router.get("/taiwan/stats")
async def taiwan_stats():
    async with httpx.AsyncClient(timeout=_TIMEOUT) as client:
        resp = await client.get(f"{settings.backend_url}/foods/taiwan/stats")
        resp.raise_for_status()
    return resp.json()


@router.get("/taiwan/{food_id}")
async def taiwan_detail(food_id: int = Path(...)):
    async with httpx.AsyncClient(timeout=_TIMEOUT) as client:
        resp = await client.get(
            f"{settings.backend_url}/foods/{food_id}",
            params={"source": "taiwan_foods"},
        )
        resp.raise_for_status()
    return resp.json()


@router.get("/foodb/{food_id}")
async def foodb_detail(
    food_id: int = Path(...),
    compound_limit: int = Query(50, ge=1, le=200),
):
    async with httpx.AsyncClient(timeout=_TIMEOUT) as client:
        resp = await client.get(
            f"{settings.backend_url}/foods/foodb/{food_id}",
            params={"compound_limit": compound_limit},
        )
        resp.raise_for_status()
    return resp.json()
