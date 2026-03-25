"""recipe.py - 食譜分析路由（核心）"""
import httpx
from fastapi import APIRouter, Depends, HTTPException
from pydantic import BaseModel
from loguru import logger
from app.config import settings
from app.middleware.auth_middleware import require_auth
from app.services import recipe_analyzer, ai_service
from app.services.reverse_search_service import reverse_search
from app.services.nutrition_service import calculate_recipe_nutrition
from app.services import gemma_client, gemma_extraction_service, gemma_verification_service
from app.services import llm_match_service

router = APIRouter(prefix="/recipe", tags=["recipe"])

_TIMEOUT = httpx.Timeout(connect=3.0, read=60.0, write=5.0, pool=3.0)


class AnalyzeRequest(BaseModel):
    recipe_text: str
    servings: int = 1


class ExtractRequest(BaseModel):
    recipe_text: str


class LookupRequest(BaseModel):
    ingredients: list[str]
    top_n: int = 3


class CalculateNutritionItem(BaseModel):
    food_id: int
    source: str
    food_name: str = ""
    amount: str = ""
    grams: float | None = None


class CalculateNutritionRequest(BaseModel):
    ingredients: list[CalculateNutritionItem]


class ExtractWithAmountsRequest(BaseModel):
    recipe_text: str


class LLMSelectCandidate(BaseModel):
    id: int | None = None
    name: str = ""
    food_name: str = ""
    source: str = ""
    category: str = ""
    score: float | None = None

class LLMSelectItem(BaseModel):
    ingredient: str
    amount: str = ""
    candidates: list[dict] = []

class LLMSelectRequest(BaseModel):
    ingredients: list[LLMSelectItem]
    recipe_context: str = ""


class ReverseSearchRequest(BaseModel):
    recipe_text: str


class SaveRequest(BaseModel):
    recipe_name: str
    recipe_content: str
    servings: int = 1
    nutrition: dict = {}
    nutrition_detail: dict = {}
    ingredients: list[dict] = []


class UpdateRequest(BaseModel):
    recipe_name: str
    servings: int = 1
    nutrition: dict = {}
    nutrition_detail: dict = {}


@router.get("/gemma/status")
async def gemma_status():
    """Gemma LLM 連線狀態（前端用）。"""
    available = await gemma_client.is_available()
    return {"available": available, "enabled": settings.gemma_enabled}


@router.post("/analyze")
async def analyze_recipe(
    body: AnalyzeRequest,
    user: dict = Depends(require_auth),
):
    """7 步食譜分析管道（舊版，保留相容）。"""
    logger.info("analyze_recipe user_id={} text_len={}", user["sub"], len(body.recipe_text))
    return await recipe_analyzer.analyze(body.recipe_text, body.servings)


@router.post("/extract")
async def extract_ingredients(
    body: ExtractRequest,
    user: dict = Depends(require_auth),
):
    """步驟 1：AI 提取食材關鍵字。"""
    logger.info("extract_start user_id={} text_len={}", user["sub"], len(body.recipe_text or ""))
    keywords = await ai_service.extract_keywords(body.recipe_text)
    logger.info("extract_done user_id={} keyword_count={} keywords={}", user["sub"], len(keywords), keywords)
    return {"keywords": keywords}


@router.post("/lookup")
async def lookup_ingredients(
    body: LookupRequest,
    user: dict = Depends(require_auth),
):
    """步驟 3：對每個食材查詢前 N 筆匹配（台灣+FooDB 分別列出）+ Gemma 搜尋前驗證。"""
    logger.info(
        "lookup_start user_id={} ingredient_count={} top_n={} ingredients={}",
        user["sub"],
        len(body.ingredients),
        body.top_n,
        body.ingredients,
    )

    # 整合點 2：Gemma 搜尋前驗證（預設關閉，llama-server 單線程呼叫太慢）
    if settings.gemma_lookup_enhance:
        verification = await gemma_verification_service.verify_ingredient_list(body.ingredients)
        verified = verification["verified"]
        warnings = verification["warnings"]
        logger.info(
            "gemma_verify_done user_id={} warnings={} gemma_available={}",
            user["sub"], len(warnings), verification["gemma_available"],
        )
    else:
        verified = body.ingredients
        warnings = []

    results = []
    for ingredient in verified:
        matches = await recipe_analyzer.lookup_ingredient(ingredient, top_n=body.top_n)
        logger.debug(
            "lookup_item user_id={} ingredient={} pair_count={} first_pair={}",
            user["sub"],
            ingredient,
            len(matches),
            matches[0] if matches else None,
        )
        results.append({"ingredient": ingredient, "matches": matches})
    logger.info("lookup_done user_id={} result_count={}", user["sub"], len(results))
    gemma_avail = verification["gemma_available"] if settings.gemma_lookup_enhance else False
    return {"results": results, "warnings": warnings, "gemma_available": gemma_avail}


@router.post("/llm-select-matches")
async def llm_select_matches(
    body: LLMSelectRequest,
    user: dict = Depends(require_auth),
):
    """用 LLM 為每種食材從候選中選出最佳匹配。"""
    logger.info(
        "llm_select_matches user_id={} ingredient_count={}",
        user["sub"], len(body.ingredients),
    )
    items = [item.model_dump() for item in body.ingredients]
    results = await llm_match_service.select_matches(items, body.recipe_context)
    logger.info(
        "llm_select_matches_done user_id={} results={}",
        user["sub"], len(results),
    )
    return {"selections": results}


@router.post("/extract-with-amounts")
async def extract_ingredients_with_amounts(
    body: ExtractWithAmountsRequest,
    user: dict = Depends(require_auth),
):
    """步驟 1（增強版）：AI 提取食材關鍵字 + 用量 + Gemma 校正。"""
    logger.info("extract_with_amounts_start user_id={} text_len={}", user["sub"], len(body.recipe_text or ""))

    # Track A: regex 提取（即時）
    items = await ai_service.extract_keywords_with_amounts(body.recipe_text)
    logger.info("regex_extract_done user_id={} item_count={}", user["sub"], len(items))

    # Track B: Gemma 校正（有 timeout + fallback）
    refined = await gemma_extraction_service.refine_extraction(body.recipe_text, items)
    logger.info(
        "gemma_refine_done user_id={} refined_count={} corrections={} gemma_available={}",
        user["sub"], len(refined["refined"]), len(refined["corrections"]), refined["gemma_available"],
    )

    return {
        "ingredients": refined["refined"],
        "corrections": refined["corrections"],
        "gemma_available": refined["gemma_available"],
    }


@router.post("/reverse-search")
async def reverse_search_recipe(
    body: ReverseSearchRequest,
    user: dict = Depends(require_auth),
):
    """
    反向搜尋：用資料庫內容比對食譜，未匹配部分做 jieba 斷詞後逐一查詢。
    回傳直接匹配結果 + 斷詞匹配結果。
    """
    logger.info(
        "reverse_search_start user_id={} text_len={}",
        user["sub"], len(body.recipe_text),
    )
    result = await reverse_search(body.recipe_text)
    logger.info(
        "reverse_search_done user_id={} direct={} token_matched={}",
        user["sub"],
        result["summary"]["direct_count"],
        result["summary"]["token_count"],
    )
    return result


@router.post("/calculate-nutrition")
async def calculate_nutrition(
    body: CalculateNutritionRequest,
    user: dict = Depends(require_auth),
):
    """計算食材清單的完整營養素結算。"""
    ingredients = [item.model_dump() for item in body.ingredients]
    logger.info(
        "calculate_nutrition_start user_id={} item_count={} items={}",
        user["sub"],
        len(ingredients),
        ingredients,
    )
    result = await calculate_recipe_nutrition(ingredients)
    logger.info(
        "calculate_nutrition_done user_id={} per_item_count={} total_keys={} total_preview={}",
        user["sub"],
        len(result.get("items", [])),
        len((result.get("total") or {}).keys()),
        dict(list((result.get("total") or {}).items())[:5]),
    )
    return result


def _hpa_to_legacy_nutrition(nutrition: dict) -> tuple[dict, dict]:
    """
    HPA v8 key (cal_per_100g / protein_per_100g / ...) → backend 舊 5 欄 (calories/protein/carbs/fat/fiber)。
    原始 nutrition 全部併入 nutrition_detail 不丟失,讓 DB 的 nutrition_detail jsonb 保留完整 HPA v8 資料。
    """
    n = nutrition or {}
    # 支援新 (HPA v8) 與舊 key 同時出現的情況,前者優先
    legacy = {
        "calories": float(n.get("cal_per_100g") or n.get("modified_cal_per_100g") or n.get("calories") or 0),
        "protein": float(n.get("protein_per_100g") or n.get("protein") or 0),
        "carbs": float(n.get("carbon_per_100g") or n.get("carbs") or 0),
        "fat": float(n.get("fats_per_100g") or n.get("fat") or 0),
        "fiber": float(n.get("dietary_fiber_per_100g") or n.get("fiber") or 0),
    }
    return legacy, n


def _normalize_ingredient(item: dict) -> dict:
    """
    相容兩種前端 payload 格式:
    - 舊 (RecipeAnalyzerPage): { name, amount }
    - 新 (UnifiedAnalysisPage): { name, food_id, source, food_name, amount }
    backend IngredientIn 只收 name + amount,其他欄位安全忽略。
    另外吃掉歷史上可能的 `ingredient` key。
    """
    name = item.get("name") or item.get("ingredient") or item.get("food_name") or ""
    return {"name": name, "amount": item.get("amount")}


@router.post("/save", status_code=201)
async def save_recipe(
    body: SaveRequest,
    user: dict = Depends(require_auth),
):
    legacy_nutrition, full_nutrition = _hpa_to_legacy_nutrition(body.nutrition)
    merged_detail = {**full_nutrition, **(body.nutrition_detail or {})}
    norm_ingredients = [_normalize_ingredient(x) for x in (body.ingredients or []) if x]

    logger.info(
        "save_recipe user_id={} legacy_cal={} ingredients={} detail_keys={}",
        user["sub"], legacy_nutrition["calories"], len(norm_ingredients), len(merged_detail),
    )

    async with httpx.AsyncClient(timeout=_TIMEOUT) as client:
        resp = await client.post(
            f"{settings.backend_url}/recipes",
            json={
                "user_id": int(user["sub"]),
                "name": body.recipe_name,
                "content": body.recipe_content,
                "servings": body.servings,
                "nutrition": legacy_nutrition,
                "nutrition_detail": merged_detail,
                "ingredients": norm_ingredients,
            },
        )
        resp.raise_for_status()
    return resp.json()


@router.get("/list")
async def list_recipes(user: dict = Depends(require_auth)):
    async with httpx.AsyncClient(timeout=_TIMEOUT) as client:
        resp = await client.get(
            f"{settings.backend_url}/recipes",
            params={"user_id": user["sub"]},
        )
        resp.raise_for_status()
    return resp.json()


@router.delete("/{recipe_id}")
async def delete_recipe(recipe_id: int, user: dict = Depends(require_auth)):
    async with httpx.AsyncClient(timeout=_TIMEOUT) as client:
        resp = await client.delete(
            f"{settings.backend_url}/recipes/{recipe_id}",
            params={"user_id": user["sub"]},
        )
        resp.raise_for_status()
    return resp.json()


@router.put("/{recipe_id}")
async def update_recipe(recipe_id: int, body: UpdateRequest, user: dict = Depends(require_auth)):
    legacy_nutrition, full_nutrition = _hpa_to_legacy_nutrition(body.nutrition)
    merged_detail = {**full_nutrition, **(body.nutrition_detail or {})}
    async with httpx.AsyncClient(timeout=_TIMEOUT) as client:
        resp = await client.put(
            f"{settings.backend_url}/recipes/{recipe_id}",
            json={
                "user_id": int(user["sub"]),
                "name": body.recipe_name,
                "servings": body.servings,
                "nutrition": legacy_nutrition,
                "nutrition_detail": merged_detail,
            },
        )
        resp.raise_for_status()
    return resp.json()
