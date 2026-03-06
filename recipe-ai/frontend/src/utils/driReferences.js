// HPA 第八版 DRI 前端元資料 / 目標值入口
//
// 所有 FIELD_META_MAP、DRI targets 均由 hpa_dri_v8.json (HPA v8 主表 33 欄)
// 驅動,與後端 control/app/services/dri_gap_service.py 共用同一份 canonical JSON。
// 兩份 JSON 為 copy,修改時必須同步 control/resources/hpa_dri_v8.json。

import hpaDri from "./hpa_dri_v8.json";

export const DRI_V8_SOURCE_URL =
  "https://www.hpa.gov.tw/Pages/ashx/GetFile.ashx?lang=c&type=1&sid=39051473d7c94d6ea1e34d55eba7fdd3";

// HPA v8 欄位展平列表 — 33 項
export const FIELD_META_LIST = hpaDri.fields.map((f) => ({
  field: f.key,
  name: f.label_zh,
  unit: f.unit,
  supported: f.supported,
  category: f.category,
  hpaOrder: f.hpa_order,
}));

// key → { label, unit, supported, category } 查詢表
export const FIELD_META_MAP = Object.fromEntries(
  hpaDri.fields.map((f) => [
    f.key,
    {
      label: f.label_zh,
      unit: f.unit,
      supported: f.supported,
      category: f.category,
    },
  ])
);

export function getNutrientMeta(field) {
  const meta = FIELD_META_MAP[field];
  if (meta) return meta;
  // 未在 HPA v8 主表的 raw key (如 taiwan_foods 原始欄位) 走 fallback,
  // 保留 dev 警告避免回頭又悄悄新增硬編碼。
  // eslint-disable-next-line no-console
  console.warn(`[driReferences] getNutrientMeta: unknown field "${field}" — falling back to raw key`);
  return { label: field, unit: "" };
}

// 取 DRI 目標值:HPA v8 所有 key 已在 FIELD_META_MAP 中,不需再做別名轉換。
export function resolveDriTarget(targets, key) {
  if (!targets) return null;
  return targets[key] ?? null;
}

// 取 HPA v8 上限攝取量 (UL):資料源於 hpa_dri_v8.json["upper_limits"][sex][band].values
export function resolveDriUpperLimit(upperLimits, key) {
  if (!upperLimits) return null;
  return upperLimits[key] ?? null;
}

// ── DRI targets (按年齡/性別切檔) ──────────────────────────────

function pickProfile(list, age) {
  return (
    (list || []).find((r) => age >= r.min_age && age <= r.max_age) ||
    list?.[0] ||
    null
  );
}

// 活動強度選項 (HPA Table 3 註(3))
export const ACTIVITY_LEVELS =
  hpaDri.activity_levels?._options || ["低", "稍低", "適度", "高"];
export const ACTIVITY_DEFAULT = hpaDri.activity_levels?._default || "稍低";
export const ACTIVITY_DESCRIPTIONS = hpaDri.activity_levels?._descriptions || {};

// 該年齡段是否提供「高」活動強度 (71+ HPA 沒給)
export function getAvailableActivityLevels(age, gender) {
  const sex = gender === "female" ? "female" : "male";
  const list = hpaDri.activity_levels?.[sex] || [];
  const band = pickProfile(list, Number(age || 30));
  if (!band?.values) return ACTIVITY_LEVELS;
  return ACTIVITY_LEVELS.filter((lvl) => band.values[lvl] != null);
}

// 隨熱量比例 scale 的營養素 key (HPA 用 % 總熱量定義)
const KCAL_SCALED_KEYS = [
  "carbon_per_100g",
  "fats_per_100g",
  "saturated_fat_per_100g",
  "linoleic_acid_18_2_mg",
  "n3_pufa_total_mg",
  "trans_fat_mg",
];

export function getDriTargets(profile) {
  const age = Number(profile?.age || 30);
  const gender = profile?.gender === "female" ? "female" : "male";
  const requestedActivity = profile?.activityLevel || ACTIVITY_DEFAULT;
  const isAdult = age >= 19;

  const genderList = hpaDri.targets?.[gender] || hpaDri.targets?.male || [];
  const selected = pickProfile(genderList, age);
  const baseTargets = selected?.values || {};

  // 套用活動強度:覆蓋 cal/fiber + 比例 scale 熱量衍生欄位
  const activityList = hpaDri.activity_levels?.[gender] || [];
  const activityBand = pickProfile(activityList, age);
  const activityValues = activityBand?.values || {};
  const chosen = activityValues[requestedActivity] || activityValues[ACTIVITY_DEFAULT];
  const baseline = activityValues[ACTIVITY_DEFAULT];

  let targets = { ...baseTargets };
  let appliedActivity = requestedActivity;
  if (chosen && baseline && chosen.cal_per_100g && baseline.cal_per_100g) {
    if (!activityValues[requestedActivity]) {
      // 該年齡段不支援所選強度 (例如 71+ 選「高」),回退預設
      appliedActivity = ACTIVITY_DEFAULT;
    }
    targets.cal_per_100g = chosen.cal_per_100g;
    if (chosen.dietary_fiber_per_100g != null) {
      targets.dietary_fiber_per_100g = chosen.dietary_fiber_per_100g;
    }
    const ratio = chosen.cal_per_100g / baseline.cal_per_100g;
    if (Math.abs(ratio - 1) > 1e-6) {
      for (const k of KCAL_SCALED_KEYS) {
        if (typeof baseTargets[k] === "number") {
          targets[k] = Math.round(baseTargets[k] * ratio * 100) / 100;
        }
      }
    }
  }

  // 上限攝取量 (UL):與 targets 對齊 sex × age band
  const ulList = hpaDri.upper_limits?.[gender] || [];
  const ulSelected = pickProfile(ulList, age);
  const upperLimits = ulSelected?.values || {};

  // 身高/體重備註 (anthropometry)
  const anthroList = hpaDri.anthropometry?.[gender] || [];
  const anthroSelected = pickProfile(anthroList, age);
  const anthropometry = anthroSelected
    ? {
        height_cm: anthroSelected.height_cm,
        weight_kg: anthroSelected.weight_kg,
        label: anthroSelected.label,
      }
    : null;

  return {
    isAdult,
    source: "國人膳食營養素參考攝取量第八版 (HPA v8)",
    sourceUrl: DRI_V8_SOURCE_URL,
    storageFormat: "hpa_dri_v8.json (canonical JSON)",
    ageBand: selected?.label || "未命中年齡層（使用預設）",
    activityLevel: appliedActivity,
    activityLevelRequested: requestedActivity,
    targets,
    upperLimits,
    anthropometry,
  };
}
