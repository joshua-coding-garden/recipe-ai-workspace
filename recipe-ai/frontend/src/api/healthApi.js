import client from "./client";

export async function searchHealthEffects(query, limit = 20) {
  const res = await client.get("/health/effects/search", { params: { q: query, limit } });
  return res.data;
}

export async function getCompoundsForEffect(effectId, limit = 50) {
  const res = await client.get(`/health/effects/${effectId}/compounds`, { params: { limit } });
  return res.data;
}

export async function getFoodsForCompound(compoundId, limit = 20) {
  const res = await client.get(`/health/compounds/${compoundId}/foods`, { params: { limit } });
  return res.data;
}

export async function symptomLookup(keyword) {
  const res = await client.post("/health/symptom-lookup", { keyword });
  return res.data;
}

export async function symptomSearch(keyword) {
  const res = await client.post("/health/symptom-search", { keyword });
  return res.data;
}

export async function driGapAnalysis(age, sex, dailyIntake) {
  const res = await client.post("/health/dri-gap", { age, sex, daily_intake: dailyIntake });
  return res.data;
}

export async function getNutrientFoods(nutrientField, limit = 10) {
  const res = await client.get(`/health/nutrients/${encodeURIComponent(nutrientField)}/top-foods`, { params: { limit } });
  return res.data;
}
