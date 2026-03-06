import { getNutrientMeta } from "./driReferences";
import categoryDefaults from "./foodServingDict.json";

/**
 * Build a flat array of DRI nutrient rows from targets (+ optional upperLimits).
 * Each row: { field, nutrient (display name), rda, ul, unit, supported }
 *
 * targets 原則上已等同 HPA v8 FIELD_META 裡的 key (hpa_dri_v8.json/targets[sex][*].values)
 */
export function buildDriRows(targets, upperLimits = {}) {
  return Object.entries(targets || {}).map(([field, rda]) => {
    const meta = getNutrientMeta(field);
    return {
      field,
      nutrient: meta.label || field,
      rda,
      ul: upperLimits[field] ?? null,
      unit: meta.unit || "",
      supported: meta.supported !== false, // 預設 true,僅 HPA v8 內顯式 false 才算
    };
  });
}

/**
 * Calculate DRI gaps for all nutrients.
 * @param {Object} intake  - { field: actualAmount, ... }
 * @param {Array}  driRows - [{ field, nutrient, rda, ul, unit, supported }, ...]
 * @returns {Array} [{ field, nutrient, unit, target, ul, actual, gap, gapPercent, status, supported }, ...]
 */
export function calculateDriGap(intake, driRows) {
  return driRows.map(({ field, nutrient, rda, ul, unit, supported = true }) => {
    const actual = intake[field] || 0;
    const target = rda || 0;
    const gap = target - actual;
    const gapPercent = target > 0 ? Math.round((actual / target) * 100) : null;

    // supported=false (膽素/生物素/泛酸/碘/硒/氟) 在 taiwan_foods 沒欄位,
    // 只顯示目標值、不做缺口判斷 — 不過 UL 警示仍要看 (萬一外部 intake 超標)。
    let status = "adequate";
    const hasUl = ul != null && ul > 0;
    if (hasUl && actual > ul) {
      status = "excess"; // 超過上限優先
    } else if (supported && gapPercent !== null) {
      if (gapPercent < 70) status = "deficient";
      else if (gapPercent < 100) status = "low";
      else if (hasUl && actual >= ul * 0.85) status = "near_limit";
    } else if (hasUl && actual >= ul * 0.85) {
      status = "near_limit"; // unsupported 也標接近上限
    }

    return {
      field,
      nutrient,
      unit,
      target,
      ul,
      actual: Math.round(actual * 100) / 100,
      gap: Math.round(gap * 100) / 100,
      gapPercent,
      status,
      supported,
    };
  });
}

/**
 * 根據 DRI 缺口倒推建議份數，以自然語言表達（依食物代換表 2019.5）
 */
export function suggestedServing(gap, contentPer100g, food) {
  if (gap <= 0) return "-";
  if (!contentPer100g || contentPer100g <= 0) return "—";

  const neededGrams = (gap / contentPer100g) * 100;
  if (!Number.isFinite(neededGrams) || neededGrams <= 0) return "—";

  const unit = food.serving_unit || categoryDefaults[food.category]?.unit;
  const unitGrams =
    food.serving_grams || categoryDefaults[food.category]?.grams;

  if (!unit || !unitGrams) {
    if (neededGrams < 5) return "少量";
    return `約${Math.round(neededGrams)}g`;
  }

  const units = neededGrams / unitGrams;

  if (units < 0.2) return "少量";
  if (units < 0.4) return `約1/4${unit}`;
  if (units < 0.7) return `約半${unit}`;
  if (units < 1.2) return `約1${unit}`;
  if (units < 1.7) return `約1.5${unit}`;
  if (units < 2.3) return `約2${unit}`;
  if (units < 2.7) return `約2.5${unit}`;
  if (units < 3.3) return `約3${unit}`;
  const rounded = Math.round(units);
  if (rounded <= 10) return `約${rounded}${unit}`;
  return `約${rounded}${unit}（建議搭配多種食物）`;
}

export const STATUS_COLORS = {
  deficient: { bg: "#fce4e4", text: "#d32f2f", label: "嚴重不足" },
  low: { bg: "#fff3e0", text: "#e65100", label: "略低" },
  adequate: { bg: "#e8f5e9", text: "#2e7d32", label: "充足" },
  near_limit: { bg: "#fff8e1", text: "#ff8f00", label: "接近上限" },
  excess: { bg: "#ffebee", text: "#c62828", label: "超過上限" },
};
