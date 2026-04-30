"""
dri_gap_service.py - DRI 缺口分析 (HPA 第八版,2022 修訂)

資料來源:control/resources/hpa_dri_v8.json (single source of truth)
所有營養素鍵、中文名稱、單位、目標值皆從該 JSON 載入。前端也讀相同內容。
"""
from __future__ import annotations

import json
from functools import lru_cache
from pathlib import Path
from typing import Any

import httpx
from loguru import logger

from app.config import settings

_TIMEOUT = httpx.Timeout(30.0)

_HPA_JSON_PATH = Path(__file__).resolve().parents[2] / "resources" / "hpa_dri_v8.json"


@lru_cache(maxsize=1)
def _load_hpa() -> dict[str, Any]:
    """載入 HPA 第八版 canonical JSON (cached)。"""
    data = json.loads(_HPA_JSON_PATH.read_text(encoding="utf-8"))
    logger.info(
        "hpa_dri_v8 loaded: version={} fields={} targets_profiles={}",
        data.get("version"),
        len(data.get("fields", [])),
        sum(len(v) for v in data.get("targets", {}).values() if isinstance(v, list)),
    )
    return data


def _build_field_meta() -> dict[str, dict[str, Any]]:
    """{ key: {label_zh, unit, supported, db_field, ...} }"""
    return {f["key"]: f for f in _load_hpa().get("fields", [])}


def _build_dri_table() -> dict[str, list[dict[str, Any]]]:
    """還原舊有 DRI_TABLE 結構供既有呼叫端沿用。"""
    raw = _load_hpa().get("targets", {})
    out: dict[str, list[dict[str, Any]]] = {"male": [], "female": []}
    for sex in ("male", "female"):
        for prof in raw.get(sex, []):
            out[sex].append(
                {
                    "min_age": prof["min_age"],
                    "max_age": prof["max_age"],
                    "label": prof["label"],
                    "targets": dict(prof["values"]),
                }
            )
    return out


DRI_TABLE = _build_dri_table()
FIELD_META = _build_field_meta()

# 中文名稱 map (給既有呼叫端用)
_NUTRIENT_ZH_MAP: dict[str, str] = {k: v["label_zh"] for k, v in FIELD_META.items()}

# key → FooDB 營養素英文名 (只對 DB 有欄位、且 FooDB 有對應欄的項目有效)
_NUTRIENT_SEARCH_MAP: dict[str, str | None] = {
    "protein_per_100g": "Protein",
    "dietary_fiber_per_100g": "Fiber",
    "iron_per_100g": "Iron",
    "zinc_per_100g": "Zinc",
    "calcium_per_100g": "Calcium",
    "magnesium_per_100g": "Magnesium",
    "phosphorus_per_100g": "Phosphorus",
    "potassium_per_100g": "Potassium",
    "sodium_per_100g": "Sodium",
    "vitamin_b1_mg": "Thiamin",
    "vitamin_b2_mg": "Riboflavin",
    "niacin_mg": "Niacin",
    "vitamin_b6_mg": "Vitamin B6",
    "vitamin_b12_ug": "Vitamin B12",
    "vitamin_c_mg": "Vitamin C",
    "vitamin_d_total_ug": "Vitamin D",
    "vitamin_k_ug": "Vitamin K",
    "folate_ug": "Folate",
    "retinol_equivalent_ug": "Vitamin A",
    "alpha_vitamin_e_te_mg": "Vitamin E",
}


def _get_dri_targets(age: int, sex: str) -> dict[str, Any] | None:
    """根據年齡與性別取得 DRI 建議量。"""
    sex_key = sex.lower()
    if sex_key not in DRI_TABLE:
        return None
    for entry in DRI_TABLE[sex_key]:
        if entry["min_age"] <= age <= entry["max_age"]:
            return {"label": entry["label"], "targets": entry["targets"]}
    return None


def _get_dri_upper_limits(age: int, sex: str) -> dict[str, float]:
    """根據年齡與性別取得 HPA 第八版上限攝取量 (UL),回傳 { nutrient_key: ul_value }。"""
    sex_key = sex.lower()
    raw = _load_hpa().get("upper_limits", {})
    bands = raw.get(sex_key) or raw.get("male") or []
    for entry in bands:
        if entry["min_age"] <= age <= entry["max_age"]:
            return dict(entry.get("values", {}))
    return {}


def _get_anthropometry(age: int, sex: str) -> dict[str, Any] | None:
    """取得對應年齡段 HPA 參考身高/體重備註。"""
    sex_key = sex.lower()
    raw = _load_hpa().get("anthropometry", {})
    bands = raw.get(sex_key) or []
    for entry in bands:
        if entry["min_age"] <= age <= entry["max_age"]:
            return {
                "label": entry.get("label"),
                "height_cm": entry.get("height_cm"),
                "weight_kg": entry.get("weight_kg"),
            }
    return None


def _compute_gaps(
    targets: dict[str, float],
    intake: dict[str, float],
    upper_limits: dict[str, float] | None = None,
    threshold: float = 0.8,
) -> list[dict]:
    """回報三類:1) supported=true 且 intake 低於 threshold 的缺口;2) 任何超過 UL 的項目;3) 接近 UL (≥85%) 的警示。"""
    ul = upper_limits or {}
    gaps: list[dict] = []
    seen: set[str] = set()
    for nutrient, target_val in targets.items():
        meta = FIELD_META.get(nutrient, {})
        actual = intake.get(nutrient, 0.0)
        ul_val = ul.get(nutrient)
        ratio = (actual / target_val) if target_val and target_val > 0 else 0

        is_excess = ul_val is not None and actual > ul_val
        is_near = ul_val is not None and not is_excess and actual >= ul_val * 0.85
        is_deficit = (
            meta.get("supported", True)
            and target_val
            and target_val > 0
            and ratio < threshold
        )

        if not (is_excess or is_near or is_deficit):
            continue

        status = (
            "excess" if is_excess else ("near_limit" if is_near else "deficient")
        )
        gaps.append(
            {
                "nutrient": nutrient,
                "nutrient_zh": meta.get("label_zh", nutrient),
                "unit": meta.get("unit", ""),
                "target": target_val,
                "actual": round(actual, 2),
                "ratio": round(ratio, 3),
                "deficit": round((target_val or 0) - actual, 2),
                "upper_limit": ul_val,
                "status": status,
            }
        )
        seen.add(nutrient)

    # 額外掃 supported=false 但有 UL 且超標的項目 (例如膽素/碘/硒/氟)
    for nutrient, ul_val in ul.items():
        if nutrient in seen or ul_val is None:
            continue
        actual = intake.get(nutrient, 0.0)
        if actual > ul_val:
            meta = FIELD_META.get(nutrient, {})
            gaps.append(
                {
                    "nutrient": nutrient,
                    "nutrient_zh": meta.get("label_zh", nutrient),
                    "unit": meta.get("unit", ""),
                    "target": targets.get(nutrient),
                    "actual": round(actual, 2),
                    "ratio": None,
                    "deficit": None,
                    "upper_limit": ul_val,
                    "status": "excess",
                }
            )

    # 排序:excess 最前面、再 near_limit、最後 deficient (用 ratio 排序)
    status_order = {"excess": 0, "near_limit": 1, "deficient": 2}
    gaps.sort(key=lambda x: (status_order.get(x["status"], 9), x.get("ratio") or 0))
    return gaps


async def _get_food_recommendations(nutrient_key: str, limit: int = 5) -> list[dict]:
    """對缺乏的營養素,從 FooDB 查詢含量最高的食物。"""
    search_name = _NUTRIENT_SEARCH_MAP.get(nutrient_key)
    if not search_name:
        return []

    try:
        async with httpx.AsyncClient(timeout=_TIMEOUT) as client:
            resp = await client.get(
                f"{settings.backend_url}/health/nutrients/{search_name}/foods",
                params={"limit": limit},
            )
            resp.raise_for_status()
            return resp.json()
    except Exception as e:
        logger.warning("nutrient_food_lookup_failed nutrient={} error={}", search_name, e)
        return []


async def analyze_dri_gap(
    age: int = 30,
    sex: str = "male",
    daily_intake: dict[str, float] | None = None,
) -> dict[str, Any]:
    """DRI 缺口分析主流程。"""
    log = logger.bind(flow="dri_gap", age=age, sex=sex)
    dri = _get_dri_targets(age, sex)
    if not dri:
        log.warning("dri_profile_not_found age={} sex={}", age, sex)
        return {"error": f"找不到 age={age}, sex={sex} 的 DRI 資料"}

    intake = daily_intake or {}
    upper_limits = _get_dri_upper_limits(age, sex)
    anthropometry = _get_anthropometry(age, sex)
    gaps = _compute_gaps(dri["targets"], intake, upper_limits=upper_limits)
    log.info(
        "dri_gaps_found count={} excess={} near={} deficient={}",
        len(gaps),
        sum(1 for g in gaps if g["status"] == "excess"),
        sum(1 for g in gaps if g["status"] == "near_limit"),
        sum(1 for g in gaps if g["status"] == "deficient"),
    )

    recommendations = []
    # 推薦食物只給 deficient (缺口);excess/near_limit 不需要「補食物」推薦
    for gap in gaps[:10]:
        if gap["status"] == "deficient":
            foods = await _get_food_recommendations(gap["nutrient"], limit=5)
            recommendations.append({**gap, "recommended_foods": foods})
        else:
            recommendations.append({**gap, "recommended_foods": []})

    log.info(
        "dri_gap_analysis_done gaps={} with_recommendations={}",
        len(gaps),
        len([r for r in recommendations if r.get("recommended_foods")]),
    )
    return {
        "profile": dri["label"],
        "age": age,
        "sex": sex,
        "gaps": recommendations,
        "all_targets": dri["targets"],
        "upper_limits": upper_limits,
        "anthropometry": anthropometry,
        "intake": intake,
    }


def get_fields_for_frontend() -> list[dict[str, Any]]:
    """對外公開:前端可透過 /dri/fields API 拿這份 meta。"""
    return [dict(f) for f in _load_hpa().get("fields", [])]


def get_extras_for_frontend() -> dict[str, Any]:
    """提供 /dri/fields?include=upper_limits,anthropometry,activity_levels 資料。"""
    hpa = _load_hpa()
    return {
        "upper_limits": hpa.get("upper_limits", {}),
        "anthropometry": hpa.get("anthropometry", {}),
        "activity_levels": hpa.get("activity_levels", {}),
    }
