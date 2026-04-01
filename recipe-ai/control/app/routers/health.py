"""health.py - 健康效果查詢路由（代理到 backend/ + 症狀服務）"""
import httpx
from fastapi import APIRouter, Query
from pydantic import BaseModel, Field
from app.config import settings

router = APIRouter(prefix="/health", tags=["health"])
_TIMEOUT = httpx.Timeout(30.0)


class SymptomSearchIn(BaseModel):
    symptom: str = ""
    keyword: str = ""


class DriGapIn(BaseModel):
    age: int = Field(30, ge=1, le=120)
    sex: str = ""
    gender: str = ""
    daily_intake: dict = {}


@router.get("/effects/search")
async def search_effects(q: str = Query(...), limit: int = Query(20)):
    """搜尋健康效果（直接代理 backend）"""
    async with httpx.AsyncClient(timeout=_TIMEOUT) as client:
        resp = await client.get(
            f"{settings.backend_url}/health/effects/search",
            params={"q": q, "limit": limit},
        )
        resp.raise_for_status()
    return resp.json()


@router.get("/effects/{effect_id}/compounds")
async def get_compounds(effect_id: int, limit: int = Query(50)):
    """查詢效果相關化合物（代理 backend）"""
    async with httpx.AsyncClient(timeout=_TIMEOUT) as client:
        resp = await client.get(
            f"{settings.backend_url}/health/effects/{effect_id}/compounds",
            params={"limit": limit},
        )
        resp.raise_for_status()
    return resp.json()


@router.get("/compounds/{compound_id}/foods")
async def get_foods(compound_id: int, limit: int = Query(20)):
    """查詢化合物 top 食物（代理 backend）"""
    async with httpx.AsyncClient(timeout=_TIMEOUT) as client:
        resp = await client.get(
            f"{settings.backend_url}/health/compounds/{compound_id}/foods",
            params={"limit": limit},
        )
        resp.raise_for_status()
    return resp.json()


@router.get("/nutrients/list")
async def list_nutrients():
    """列出所有可查詢營養素（代理 backend）"""
    async with httpx.AsyncClient(timeout=_TIMEOUT) as client:
        resp = await client.get(f"{settings.backend_url}/health/nutrients/list")
        resp.raise_for_status()
    return resp.json()


@router.get("/nutrients/search")
async def search_nutrients(q: str = Query(...)):
    """搜尋營養素（代理 backend）"""
    async with httpx.AsyncClient(timeout=_TIMEOUT) as client:
        resp = await client.get(
            f"{settings.backend_url}/health/nutrients/search",
            params={"q": q},
        )
        resp.raise_for_status()
    return resp.json()


@router.get("/nutrients/{field}/top-foods")
async def get_nutrient_top_foods(field: str, limit: int = Query(20)):
    """按營養素排名取 Top N 食物（代理 backend，雙 DB）"""
    async with httpx.AsyncClient(timeout=_TIMEOUT) as client:
        resp = await client.get(
            f"{settings.backend_url}/health/nutrients/{field}/top-foods",
            params={"limit": limit},
        )
        resp.raise_for_status()
    return resp.json()


@router.get("/nutrients/{nutrient_name}/foods")
async def get_nutrient_foods(nutrient_name: str, limit: int = Query(20)):
    """查詢營養素 top 食物（舊端點，代理 backend）"""
    async with httpx.AsyncClient(timeout=_TIMEOUT) as client:
        resp = await client.get(
            f"{settings.backend_url}/health/nutrients/{nutrient_name}/foods",
            params={"limit": limit},
        )
        resp.raise_for_status()
    return resp.json()


@router.post("/symptom-lookup")
async def symptom_lookup(body: dict):
    """整合查詢：症狀 → 效果 → 化合物 → 食物（代理 backend）"""
    async with httpx.AsyncClient(timeout=_TIMEOUT) as client:
        resp = await client.post(
            f"{settings.backend_url}/health/symptom-lookup",
            json=body,
        )
        resp.raise_for_status()
    return resp.json()


@router.post("/symptom-search")
async def symptom_search(body: SymptomSearchIn):
    """中文症狀搜尋（透過症狀對照表翻譯後查詢）"""
    from app.services.symptom_service import search_by_symptom
    keyword = body.symptom or body.keyword
    return await search_by_symptom(keyword)


@router.post("/dri-gap")
async def dri_gap_analysis(body: DriGapIn):
    """DRI 缺口分析"""
    from app.services.dri_gap_service import analyze_dri_gap
    return await analyze_dri_gap(
        age=body.age,
        sex=body.gender or body.sex or "male",
        daily_intake=body.daily_intake,
    )
