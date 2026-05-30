import { useState } from "react";
import { analyzeRecipe, saveRecipe } from "../api/recipeApi";

export function useRecipeAnalysis() {
  const [result, setResult] = useState(null);
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState(null);
  const [saving, setSaving] = useState(false);
  const [savedId, setSavedId] = useState(null);

  async function analyze(text, servings = 1) {
    setLoading(true);
    setError(null);
    setResult(null);
    setSavedId(null);
    try {
      const data = await analyzeRecipe(text, servings);
      setResult(data);
    } catch (err) {
      setError(err.message || "分析失敗，請稍後再試");
    } finally {
      setLoading(false);
    }
  }

  async function save(title) {
    if (!result) return;
    setSaving(true);
    try {
      const matched = result.ingredients.filter((i) => i.status === "matched");
      const data = await saveRecipe({
        title,
        raw_text: result.raw_text,
        servings: result.servings,
        ingredient_ids: matched.map((i) => i.food_id),
      });
      setSavedId(data.id);
      return data;
    } catch (err) {
      setError(err.message || "儲存失敗");
    } finally {
      setSaving(false);
    }
  }

  function reset() {
    setResult(null);
    setError(null);
    setSavedId(null);
  }

  return { result, loading, error, saving, savedId, analyze, save, reset };
}
