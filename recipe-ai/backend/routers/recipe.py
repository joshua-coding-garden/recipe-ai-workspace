"""recipe.py - 食譜 CRUD 路由"""
from fastapi import APIRouter, HTTPException, Header
from pydantic import BaseModel
from repositories import recipe_repository

router = APIRouter(prefix="/recipes", tags=["recipes"])


class NutritionIn(BaseModel):
    calories: float = 0
    protein: float = 0
    carbs: float = 0
    fat: float = 0
    fiber: float = 0


class IngredientIn(BaseModel):
    name: str
    amount: str | None = None


class RecipeCreateIn(BaseModel):
    user_id: int
    name: str
    content: str
    servings: int = 1
    nutrition: NutritionIn = NutritionIn()
    nutrition_detail: dict = {}
    ingredients: list[IngredientIn] = []


class RecipeUpdateIn(BaseModel):
    user_id: int
    name: str
    servings: int = 1
    nutrition: NutritionIn = NutritionIn()
    nutrition_detail: dict = {}


@router.get("")
async def list_recipes(user_id: int):
    return await recipe_repository.list_by_user(user_id)


@router.get("/{recipe_id}")
async def get_recipe(recipe_id: int, user_id: int):
    recipe = await recipe_repository.get_by_id(recipe_id, user_id)
    if not recipe:
        raise HTTPException(status_code=404, detail="食譜不存在")
    return recipe


@router.post("", status_code=201)
async def create_recipe(body: RecipeCreateIn):
    return await recipe_repository.create(
        user_id=body.user_id,
        name=body.name,
        content=body.content,
        servings=body.servings,
        nutrition=body.nutrition.model_dump(),
        ingredients=[i.model_dump() for i in body.ingredients],
        nutrition_detail=body.nutrition_detail,
    )


@router.delete("/{recipe_id}")
async def delete_recipe(recipe_id: int, user_id: int):
    ok = await recipe_repository.delete(recipe_id, user_id)
    if not ok:
        raise HTTPException(status_code=404, detail="食譜不存在或無權限刪除")
    return {"message": "已刪除"}


@router.put("/{recipe_id}")
async def update_recipe(recipe_id: int, body: RecipeUpdateIn):
    updated = await recipe_repository.update(
        recipe_id=recipe_id,
        user_id=body.user_id,
        name=body.name,
        servings=body.servings,
        nutrition=body.nutrition.model_dump(),
        nutrition_detail=body.nutrition_detail,
    )
    if not updated:
        raise HTTPException(status_code=404, detail="食譜不存在或無權限編輯")
    return updated
