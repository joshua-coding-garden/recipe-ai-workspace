"""
health_repository.py - FooDB 健康效果查詢 + 營養素食物排名
症狀 → 健康效果 → 化合物 → 食物含量排名
營養素欄位 → 台灣食品 / FooDB 雙 DB 食物排名
"""
import json
from pathlib import Path
from typing import Any
from loguru import logger
from database import get_pool

# ── 營養素欄位對照表（啟動時載入一次）─────────────────────────────
_FIELD_MAP_PATH = Path(__file__).resolve().parent.parent / "resources" / "nutrient_field_map.json"
_nutrient_field_map: dict[str, dict[str, Any]] | None = None


def _load_field_map() -> dict[str, dict[str, Any]]:
    """載入 nutrient_field_map.json，快取於模組層級"""
    global _nutrient_field_map
    if _nutrient_field_map is None:
        with open(_FIELD_MAP_PATH, "r", encoding="utf-8") as f:
            _nutrient_field_map = json.load(f)
        logger.info("nutrient_field_map loaded entries={}", len(_nutrient_field_map))
    return _nutrient_field_map


def _valid_field(field: str) -> bool:
    """白名單驗證：field 必須存在於 map keys 中"""
    return field in _load_field_map()


async def search_health_effects(keyword: str, limit: int = 20) -> list[dict]:
    """搜尋健康效果名稱（英文 name + 中文 name_zh）：先精確，再 ILIKE，再 trigram"""
    pool = get_pool()
    async with pool.acquire() as conn:
        # 優先精確匹配（英文或中文）
        rows = await conn.fetch("""
            SELECT id, name, name_zh, description
            FROM foodb_health_effects
            WHERE LOWER(name) = LOWER($1) OR name_zh = $1
            LIMIT $2
        """, keyword, limit)
        if rows:
            return [dict(r) for r in rows]

        # ILIKE 包含匹配（英文和中文）
        rows = await conn.fetch("""
            SELECT id, name, name_zh, description
            FROM foodb_health_effects
            WHERE name ILIKE '%' || $1 || '%' OR name_zh LIKE '%' || $1 || '%'
            ORDER BY LENGTH(name) ASC
            LIMIT $2
        """, keyword, limit)
        if rows:
            return [dict(r) for r in rows]

        # trigram 模糊匹配（英文 name + 中文 name_zh）
        await conn.execute("SET pg_trgm.similarity_threshold = 0.3")
        rows = await conn.fetch("""
            SELECT id, name, name_zh, description
            FROM foodb_health_effects
            WHERE name % $1 OR name_zh % $1
            ORDER BY GREATEST(similarity(name, $1), similarity(COALESCE(name_zh,''), $1)) DESC
            LIMIT $2
        """, keyword, limit)
    return [dict(r) for r in rows]


async def get_compounds_for_effects(effect_ids: list[int], limit: int = 50) -> list[dict]:
    """查詢與指定健康效果相關的化合物"""
    pool = get_pool()
    async with pool.acquire() as conn:
        rows = await conn.fetch("""
            SELECT DISTINCT c.id, c.name, c.description,
                   che.citation, che.citation_type,
                   he.name as health_effect_name
            FROM foodb_compounds_health_effects che
            JOIN foodb_compounds c ON c.id = che.compound_id
            JOIN foodb_health_effects he ON he.id = che.health_effect_id
            WHERE che.health_effect_id = ANY($1::int[])
            ORDER BY c.name
            LIMIT $2
        """, effect_ids, limit)
    return [dict(r) for r in rows]


async def get_top_foods_for_compound(compound_id: int, limit: int = 20) -> list[dict]:
    """查詢含指定化合物含量最高的食物"""
    pool = get_pool()
    async with pool.acquire() as conn:
        rows = await conn.fetch("""
            SELECT f.id, f.name, f.food_group,
                   ct.standard_content, ct.orig_unit,
                   ct.preparation_type,
                   ct.citation, ct.citation_type
            FROM foodb_contents ct
            JOIN foodb_foods f ON f.id = ct.food_id
            WHERE ct.source_id = $1
              AND ct.source_type = 'Compound'
              AND ct.standard_content IS NOT NULL
              AND ct.standard_content > 0
            ORDER BY ct.standard_content DESC
            LIMIT $2
        """, compound_id, limit)
    return [dict(r) for r in rows]


async def get_top_foods_for_compounds_batch(
    compound_ids: list[int], limit_per_compound: int = 10
) -> dict[int, list[dict]]:
    """批次查詢多個化合物的 top 食物（避免 N+1）"""
    if not compound_ids:
        return {}
    pool = get_pool()
    async with pool.acquire() as conn:
        rows = await conn.fetch("""
            SELECT * FROM (
                SELECT f.id, f.name, f.food_group,
                       ct.standard_content, ct.orig_unit,
                       ct.preparation_type,
                       ct.citation, ct.citation_type,
                       ct.source_id AS compound_id,
                       ROW_NUMBER() OVER (
                           PARTITION BY ct.source_id
                           ORDER BY ct.standard_content DESC
                       ) AS rn
                FROM foodb_contents ct
                JOIN foodb_foods f ON f.id = ct.food_id
                WHERE ct.source_id = ANY($1::int[])
                  AND ct.source_type = 'Compound'
                  AND ct.standard_content IS NOT NULL
                  AND ct.standard_content > 0
            ) ranked
            WHERE rn <= $2
            ORDER BY compound_id, rn
        """, compound_ids, limit_per_compound)

    result: dict[int, list[dict]] = {cid: [] for cid in compound_ids}
    for row in rows:
        r = dict(row)
        cid = r.pop("compound_id")
        r.pop("rn", None)
        result[cid].append(r)
    return result


async def get_top_foods_for_nutrient(nutrient_name: str, limit: int = 20) -> list[dict]:
    """查詢含指定營養素含量最高的食物（用於 DRI 缺口推薦）

    支援兩種輸入：
    1. DB 欄位名（如 vitamin_b1_mg）→ 走 field map 查雙 DB
    2. FooDB 營養素英文名（如 Thiamin）→ 走舊邏輯查 FooDB
    """
    # 如果傳入的是 DB 欄位名，走新的雙 DB 查詢
    fmap = _load_field_map()
    if nutrient_name in fmap:
        return await get_top_foods_by_nutrient(nutrient_name, limit)

    # 否則嘗試用 foodb_name 反查 field
    for field_key, meta in fmap.items():
        if meta.get("foodb_name") and meta["foodb_name"].lower() == nutrient_name.lower():
            return await get_top_foods_by_nutrient(field_key, limit)

    # fallback：原始 FooDB ILIKE 查詢
    pool = get_pool()
    async with pool.acquire() as conn:
        rows = await conn.fetch("""
            SELECT f.id, f.name, f.food_group,
                   ct.standard_content, ct.orig_unit,
                   ct.preparation_type
            FROM foodb_contents ct
            JOIN foodb_foods f ON f.id = ct.food_id
            JOIN foodb_nutrients n ON n.id = ct.source_id
            WHERE ct.source_type = 'Nutrient'
              AND n.name ILIKE '%' || $1 || '%'
              AND ct.standard_content IS NOT NULL
              AND ct.standard_content > 0
            ORDER BY ct.standard_content DESC
            LIMIT $2
        """, nutrient_name, limit)
    return [dict(r) for r in rows]


async def get_top_foods_by_nutrient(field: str, limit: int = 20) -> list[dict]:
    """
    按營養素欄位名查詢含量最高的食物（雙 DB：taiwan_foods + FooDB）

    1. 驗證 field 是白名單欄位（防 SQL injection）
    2. 查 taiwan_foods 表
    3. 若有 foodb_name 則同時查 FooDB
    4. 合併排序取 Top N
    """
    fmap = _load_field_map()
    if field not in fmap:
        logger.warning("nutrient_field_not_found field={}", field)
        return []

    meta = fmap[field]
    unit = meta["unit"]
    foodb_name = meta.get("foodb_name")
    # 支援「合計欄位」:meta 可用 taiwan_cols 列多個 col 做 COALESCE 加總 (e.g. 維生素 K 需合計 k1+k2mk4+k2mk7)
    cols = meta.get("taiwan_cols") or [meta.get("taiwan_col")]
    cols = [c for c in cols if c]
    if not cols:
        logger.warning("nutrient_field_has_no_taiwan_col field={}", field)
        return []
    # col 全部通過白名單驗證 (從 map value 來),安全地拼 SQL
    content_expr = " + ".join(f"COALESCE({c}, 0)" for c in cols)
    where_expr = " OR ".join(f"({c} IS NOT NULL AND {c} > 0)" for c in cols)
    results: list[dict] = []

    pool = get_pool()
    async with pool.acquire() as conn:
        # ── 查 taiwan_foods ──────────────────────────────────────
        taiwan_sql = f"""
            SELECT id, food_name AS name, category,
                   ({content_expr}) AS content_per_100g,
                   'taiwan_foods' AS source,
                   serving_unit, serving_grams
            FROM taiwan_foods
            WHERE ({where_expr})
              AND ({content_expr}) > 0
            ORDER BY ({content_expr}) DESC
            LIMIT $1
        """
        tw_rows = await conn.fetch(taiwan_sql, limit)
        for r in tw_rows:
            results.append({
                "id": r["id"],
                "name": r["name"],
                "category": r["category"],
                "content_per_100g": float(r["content_per_100g"]),
                "source": "taiwan_foods",
                "unit": unit,
                "serving_unit": r["serving_unit"],
                "serving_grams": float(r["serving_grams"]) if r["serving_grams"] else None,
            })

        # ── 查 FooDB（如果有對應名稱）────────────────────────────
        if foodb_name:
            foodb_rows = await conn.fetch("""
                SELECT f.id, f.name, f.food_group AS category,
                       ct.standard_content AS content_per_100g,
                       'foodb' AS source
                FROM foodb_contents ct
                JOIN foodb_foods f ON f.id = ct.food_id
                JOIN foodb_nutrients n ON n.id = ct.source_id
                WHERE ct.source_type = 'Nutrient'
                  AND n.name ILIKE '%' || $1 || '%'
                  AND ct.standard_content IS NOT NULL
                  AND ct.standard_content > 0
                ORDER BY ct.standard_content DESC
                LIMIT $2
            """, foodb_name, limit)
            for r in foodb_rows:
                results.append({
                    "id": r["id"],
                    "name": r["name"],
                    "category": r["category"],
                    "content_per_100g": float(r["content_per_100g"]) if r["content_per_100g"] else 0.0,
                    "source": "foodb",
                    "unit": unit,
                })

    # 合併排序，取 Top N
    results.sort(key=lambda x: x["content_per_100g"], reverse=True)
    return results[:limit]


def search_nutrients(query: str) -> list[dict]:
    """搜尋營養素：依 label、label_en 或 key 模糊匹配"""
    fmap = _load_field_map()
    query_lower = query.lower()
    matches = []
    for key, meta in fmap.items():
        if (query_lower in key.lower()
                or query_lower in meta["label"].lower()
                or query_lower in meta["label_en"].lower()):
            matches.append({"field": key, **meta})
    return matches


def list_nutrients() -> list[dict]:
    """列出所有可查詢營養素"""
    fmap = _load_field_map()
    return [{"field": key, **meta} for key, meta in fmap.items()]


async def effects_to_foods(effect_ids: list[int], limit_compounds: int = 20, limit_foods: int = 10) -> dict:
    """直接用 effect IDs 查 compound → food pipeline"""
    log = logger.bind(flow="effects_to_foods")

    pool = get_pool()
    async with pool.acquire() as conn:
        effects = await conn.fetch("""
            SELECT id, name, name_zh, description
            FROM foodb_health_effects
            WHERE id = ANY($1::int[])
        """, effect_ids)

    effects_list = [dict(r) for r in effects]
    log.info("effects_found count={}", len(effects_list))
    if not effects_list:
        return {"effects": [], "recommendations": []}

    compounds = await get_compounds_for_effects(effect_ids, limit_compounds)
    log.info("compounds_found count={}", len(compounds))

    compound_ids = [c["id"] for c in compounds]
    foods_by_compound = await get_top_foods_for_compounds_batch(compound_ids, limit_foods)

    recommendations = []
    for compound in compounds:
        foods = foods_by_compound.get(compound["id"], [])
        if foods:
            recommendations.append({
                "compound": {"id": compound["id"], "name": compound["name"], "description": compound.get("description")},
                "health_effect": compound.get("health_effect_name"),
                "citation": compound.get("citation"),
                "citation_type": compound.get("citation_type"),
                "top_foods": foods,
            })

    log.info("effects_to_foods_done recommendations={}", len(recommendations))
    return {
        "effects": effects_list,
        "recommendations": recommendations,
    }


async def symptom_lookup(keyword: str, limit_effects: int = 10, limit_compounds: int = 20, limit_foods: int = 10) -> dict:
    """整合查詢：症狀 → 效果 → 化合物 → 食物"""
    log = logger.bind(flow="symptom_lookup", keyword=keyword)

    # Step 1: 搜尋健康效果
    effects = await search_health_effects(keyword, limit_effects)
    log.info("health_effects_found count={}", len(effects))
    if not effects:
        return {"keyword": keyword, "effects": [], "recommendations": []}

    # Step 2: 查詢化合物
    effect_ids = [e["id"] for e in effects]
    compounds = await get_compounds_for_effects(effect_ids, limit_compounds)
    log.info("compounds_found count={}", len(compounds))

    # Step 3: 批次查詢所有化合物的 top 食物（避免 N+1）
    compound_ids = [c["id"] for c in compounds]
    foods_by_compound = await get_top_foods_for_compounds_batch(compound_ids, limit_foods)

    recommendations = []
    for compound in compounds:
        foods = foods_by_compound.get(compound["id"], [])
        if foods:
            recommendations.append({
                "compound": {"id": compound["id"], "name": compound["name"], "description": compound.get("description")},
                "health_effect": compound.get("health_effect_name"),
                "citation": compound.get("citation"),
                "citation_type": compound.get("citation_type"),
                "top_foods": foods,
            })

    log.info("symptom_lookup_done recommendations={}", len(recommendations))
    return {
        "keyword": keyword,
        "effects": effects,
        "recommendations": recommendations,
    }
