import client from "./client";

export const analyzeRecipe = (recipeText, servings = 1) =>
  client.post("/recipe/analyze", { recipe_text: recipeText, servings }).then((r) => r.data);

export const extractIngredients = (recipeText) =>
  client.post("/recipe/extract", { recipe_text: recipeText }).then((r) => r.data);

export const lookupIngredients = (ingredients, topN = 3) =>
  client.post("/recipe/lookup", { ingredients, top_n: topN }).then((r) => r.data);

export const extractIngredientsWithAmounts = (recipeText) =>
  client.post("/recipe/extract-with-amounts", { recipe_text: recipeText }).then((r) => r.data);

export const calculateNutrition = (ingredients) =>
  client.post("/recipe/calculate-nutrition", { ingredients }).then((r) => r.data);

export const saveRecipe = (data) =>
  client.post("/recipe/save", data).then((r) => r.data);

export const listRecipes = () =>
  client.get("/recipe/list").then((r) => r.data);

export const deleteRecipe = (id) =>
  client.delete(`/recipe/${id}`).then((r) => r.data);

export const updateRecipe = (id, data) =>
  client.put(`/recipe/${id}`, data).then((r) => r.data);

export const llmSelectMatches = (ingredients, recipeContext = "") =>
  client.post("/recipe/llm-select-matches", { ingredients, recipe_context: recipeContext }).then((r) => r.data);

export const getGemmaStatus = () =>
  client.get("/recipe/gemma/status").then((r) => r.data);
