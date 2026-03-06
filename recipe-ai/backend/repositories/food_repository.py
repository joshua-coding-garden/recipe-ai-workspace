"""
food_repository.py
食物相似度搜尋（pg_trgm）
  - search_zh : 中文詞 → taiwan_foods
  - search_en : 英文詞 → foodb.foods（foodb schema）
"""
from typing import Any
from loguru import logger
from database import get_pool


async def search_exact_zh(terms: list[str], limit: int = 20) -> list[dict[str, Any]]:
    """中文精確匹配（完全相等，忽略前後空白）。"""
    if not terms:
        return []

    normalized_terms = [t.strip() for t in terms if t and t.strip()]
    if not normalized_terms:
        return []

    pool = get_pool()
    query = """
        SELECT
            id,
            food_name,
            category,
            cal_per_100g,
            protein_per_100g,
            carbon_per_100g,
            fats_per_100g,
            dietary_fiber_per_100g
        FROM taiwan_foods
        WHERE food_name = ANY($1::text[])
        LIMIT $2
    """
    async with pool.acquire() as conn:
        rows = await conn.fetch(query, normalized_terms, limit)

    results = []
    for row in rows:
        results.append({
            "id": row["id"],
            "name": row["food_name"],
            "category": row["category"],
            "source": "taiwan_foods",
            "score": 1.0,
            "score_parts": {"exact": 1.0, "formula": "exact_match"},
            "nutrition": {
                "calories": float(row["cal_per_100g"] or 0),
                "protein": float(row["protein_per_100g"] or 0),
                "carbs": float(row["carbon_per_100g"] or 0),
                "fat": float(row["fats_per_100g"] or 0),
                "fiber": float(row["dietary_fiber_per_100g"] or 0),
            },
        })
    logger.debug(f"search_exact_zh({normalized_terms[:2]}...) → {len(results)} 筆候選")
    return results[:limit]


async def search_exact_en(terms: list[str], limit: int = 20) -> list[dict[str, Any]]:
    """英文精確匹配（大小寫不敏感）。"""
    if not terms:
        return []

    normalized_terms = [t.strip().lower() for t in terms if t and t.strip()]
    if not normalized_terms:
        return []

    pool = get_pool()
    query = """
        SELECT
            id,
            name,
            category,
            cal_per_100g,
            protein_per_100g,
            carbon_per_100g,
            fats_per_100g
        FROM foods
        WHERE LOWER(name) = ANY($1::text[])
        LIMIT $2
    """
    async with pool.acquire() as conn:
        rows = await conn.fetch(query, normalized_terms, limit)

    results = []
    for row in rows:
        results.append({
            "id": row["id"],
            "name": row["name"],
            "category": row["category"],
            "source": "foodb",
            "score": 1.0,
            "score_parts": {"exact": 1.0, "formula": "exact_match"},
            "nutrition": {
                "calories": float(row["cal_per_100g"] or 0),
                "protein": float(row["protein_per_100g"] or 0),
                "carbs": float(row["carbon_per_100g"] or 0),
                "fat": float(row["fats_per_100g"] or 0),
                "fiber": 0.0,
            } if row["cal_per_100g"] is not None else None,
        })
    logger.debug(f"search_exact_en({normalized_terms[:2]}...) → {len(results)} 筆候選")
    return results[:limit]


async def search_zh(terms: list[str], limit: int = 20) -> list[dict[str, Any]]:
    """用中文詞組搜尋 taiwan_foods，回傳按相似度排序的候選清單。"""
    if not terms:
        return []

    pool = get_pool()
    results: dict[int, dict] = {}

    for term in terms:
        query = """
            SELECT
                id,
                food_name,
                category,
                cal_per_100g,
                protein_per_100g,
                carbon_per_100g,
                fats_per_100g,
                dietary_fiber_per_100g,
                similarity(food_name, $1) AS sim_score,
                CASE WHEN food_name ILIKE '%' || $1 || '%' THEN 1.0 ELSE 0.0 END AS contains_score,
                CASE WHEN food_name = $1 THEN 1.0 ELSE 0.0 END AS exact_score,
                (
                    0.5 * similarity(food_name, $1)
                    + 0.3 * CASE WHEN food_name ILIKE '%' || $1 || '%' THEN 1.0 ELSE 0.0 END
                    + 0.2 * CASE WHEN food_name = $1 THEN 1.0 ELSE 0.0 END
                ) AS score
            FROM taiwan_foods
            WHERE food_name % $1
               OR food_name ILIKE '%' || $1 || '%'
            ORDER BY score DESC
            LIMIT $2
        """
        async with pool.acquire() as conn:
            # 中文 trigram 需要較低的閾值
            await conn.execute("SET pg_trgm.similarity_threshold = 0.1")
            rows = await conn.fetch(query, term, limit)

        # 中文詞：額外搜尋每個字元（字元重疊法），補抓含相同字符的食物
        if len(term) >= 2 and all('\u4e00' <= c <= '\u9fff' for c in term):
            chars = list(dict.fromkeys(term))  # 去重保序
            used_chars = chars[:3]
            # 使用參數化查詢避免 SQL 注入
            char_conditions = " AND ".join(
                f"food_name ILIKE '%' || ${i + 1} || '%'" for i in range(len(used_chars))
            )
            char_score = len(chars) * 0.15
            limit_param = f"${len(used_chars) + 1}"
            char_query = f"""
                SELECT id, food_name, category,
                       cal_per_100g, protein_per_100g, carbon_per_100g,
                       fats_per_100g, dietary_fiber_per_100g,
                       {char_score} AS score
                FROM taiwan_foods
                WHERE {char_conditions}
                LIMIT {limit_param}
            """
            async with pool.acquire() as conn:
                char_rows = await conn.fetch(char_query, *used_chars, limit)
        else:
            char_rows = []

        for row in list(rows) + list(char_rows):
            food_id = row["id"]
            score = float(row["score"])
            if food_id not in results or results[food_id]["score"] < score:
                results[food_id] = {
                    "id": food_id,
                    "name": row["food_name"],
                    "category": row["category"],
                    "source": "taiwan_foods",
                    "score": score,
                    "score_parts": {
                        "sim": round(float(row.get("sim_score", 0) or 0), 4),
                        "contains": round(float(row.get("contains_score", 0) or 0), 4),
                        "exact": round(float(row.get("exact_score", 0) or 0), 4),
                        "formula": "0.5*sim + 0.3*contains + 0.2*exact",
                    },
                    "nutrition": {
                        "calories": float(row["cal_per_100g"] or 0),
                        "protein": float(row["protein_per_100g"] or 0),
                        "carbs": float(row["carbon_per_100g"] or 0),
                        "fat": float(row["fats_per_100g"] or 0),
                        "fiber": float(row["dietary_fiber_per_100g"] or 0),
                    },
                }

    sorted_results = sorted(results.values(), key=lambda x: x["score"], reverse=True)
    logger.debug(f"search_zh({terms[:2]}...) → {len(sorted_results)} 筆候選")
    logger.debug(
        "search_zh_top5 term={} top={} ",
        terms[0] if terms else "",
        [
            {
                "id": x["id"],
                "name": x["name"],
                "score": round(float(x.get("score", 0)), 4),
                "score_parts": x.get("score_parts", {}),
            }
            for x in sorted_results[:5]
        ],
    )
    return sorted_results[:limit]


async def search_en(terms: list[str], limit: int = 20) -> list[dict[str, Any]]:
    """用英文詞組搜尋 foodb.foods，回傳按相似度排序的候選清單。"""
    if not terms:
        return []

    pool = get_pool()
    results: dict[int, dict] = {}

    for term in terms:
        query = """
            SELECT
                f.id,
                f.name,
                f.category,
                f.cal_per_100g,
                f.protein_per_100g,
                f.carbon_per_100g,
                f.fats_per_100g,
                similarity(f.name, $1) AS sim_score,
                CASE WHEN f.name ILIKE '%' || $1 || '%' THEN 1.0 ELSE 0.0 END AS contains_score,
                CASE WHEN LOWER(f.name) = LOWER($1) THEN 1.0 ELSE 0.0 END AS exact_score,
                (
                    0.5 * similarity(f.name, $1)
                    + 0.3 * CASE WHEN f.name ILIKE '%' || $1 || '%' THEN 1.0 ELSE 0.0 END
                    + 0.2 * CASE WHEN LOWER(f.name) = LOWER($1) THEN 1.0 ELSE 0.0 END
                ) AS score
            FROM foods f
            WHERE f.name % $1
               OR f.name ILIKE '%' || $1 || '%'
            ORDER BY score DESC
            LIMIT $2
        """
        async with pool.acquire() as conn:
            await conn.execute("SET pg_trgm.similarity_threshold = 0.2")
            rows = await conn.fetch(query, term, limit)

        for row in rows:
            food_id = row["id"]
            score = float(row["score"])
            if food_id not in results or results[food_id]["score"] < score:
                results[food_id] = {
                    "id": food_id,
                    "name": row["name"],
                    "category": row["category"],
                    "source": "foodb",
                    "score": score,
                    "score_parts": {
                        "sim": round(float(row.get("sim_score", 0) or 0), 4),
                        "contains": round(float(row.get("contains_score", 0) or 0), 4),
                        "exact": round(float(row.get("exact_score", 0) or 0), 4),
                        "formula": "0.5*sim + 0.3*contains + 0.2*exact",
                    },
                    "nutrition": {
                        "calories": float(row["cal_per_100g"] or 0),
                        "protein": float(row["protein_per_100g"] or 0),
                        "carbs": float(row["carbon_per_100g"] or 0),
                        "fat": float(row["fats_per_100g"] or 0),
                        "fiber": 0.0,
                    } if row["cal_per_100g"] is not None else None,
                }

    sorted_results = sorted(results.values(), key=lambda x: x["score"], reverse=True)
    logger.debug(f"search_en({terms[:2]}...) → {len(sorted_results)} 筆候選")
    logger.debug(
        "search_en_top5 term={} top={} ",
        terms[0] if terms else "",
        [
            {
                "id": x["id"],
                "name": x["name"],
                "score": round(float(x.get("score", 0)), 4),
                "score_parts": x.get("score_parts", {}),
            }
            for x in sorted_results[:5]
        ],
    )
    return sorted_results[:limit]


async def get_all_food_names() -> dict[str, list[dict]]:
    """取得所有食物名稱（供反向搜尋快取用）。"""
    pool = get_pool()
    async with pool.acquire() as conn:
        tw_rows = await conn.fetch(
            "SELECT id, food_name AS name FROM taiwan_foods ORDER BY id"
        )
        foodb_rows = await conn.fetch(
            "SELECT id, name FROM foodb_foods ORDER BY id"
        )
    return {
        "taiwan_foods": [dict(r) for r in tw_rows],
        "foodb": [dict(r) for r in foodb_rows],
    }


async def get_food_detail(food_id: int, source: str) -> dict[str, Any] | None:
    """取得單一食物的完整營養資料。"""
    pool = get_pool()
    async with pool.acquire() as conn:
        if source == "taiwan_foods":
            row = await conn.fetchrow(
                "SELECT * FROM taiwan_foods WHERE id = $1", food_id
            )
        else:
            row = await conn.fetchrow(
                "SELECT * FROM foods WHERE id = $1", food_id
            )
    return dict(row) if row else None


async def get_foodb_food_full(food_id: int, compound_limit: int = 50) -> dict | None:
    """取得 FooDB 食物的完整詳情：基本資訊 + 化合物 top-N + 營養素。

    使用既有的 foodb_foods、foodb_contents、foodb_compounds、foodb_nutrients 表。
    化合物按 standard_content DESC 取 top-N，同 compound 因 citation 重複時取最大值。

    回傳 None 表示 food_id 不存在於 foodb_foods。
    """
    pool = get_pool()
    async with pool.acquire() as conn:
        # 1) 主檔
        food_row = await conn.fetchrow(
            """
            SELECT id, name, name_scientific, food_group, food_subgroup,
                   food_type, description, public_id
            FROM foodb_foods
            WHERE id = $1
            """,
            food_id,
        )
        if not food_row:
            return None

        # 2) 化合物 top-N（DISTINCT ON 取每個 compound 最大含量，避免 citation 重複）
        compound_rows = await conn.fetch(
            """
            SELECT * FROM (
                SELECT DISTINCT ON (ct.source_id)
                    c.id, c.name, c.public_id, c.description,
                    ct.standard_content,
                    ct.orig_content, ct.orig_min, ct.orig_max,
                    ct.orig_unit, ct.orig_unit_expression,
                    ct.preparation_type, ct.orig_method, ct.orig_food_part,
                    ct.orig_source_name,
                    ct.citation, ct.citation_type, ct.orig_citation
                FROM foodb_contents ct
                JOIN foodb_compounds c ON c.id = ct.source_id
                WHERE ct.food_id = $1
                  AND ct.source_type = 'Compound'
                  AND ct.standard_content IS NOT NULL
                  AND ct.standard_content > 0
                ORDER BY ct.source_id, ct.standard_content DESC
            ) dedup
            ORDER BY standard_content DESC
            LIMIT $2
            """,
            food_id,
            compound_limit,
        )

        # 3) 營養素清單
        nutrient_rows = await conn.fetch(
            """
            SELECT * FROM (
                SELECT DISTINCT ON (ct.source_id)
                    n.id, n.name,
                    ct.standard_content,
                    ct.orig_content, ct.orig_min, ct.orig_max,
                    ct.orig_unit, ct.orig_unit_expression,
                    ct.preparation_type, ct.orig_method, ct.orig_food_part,
                    ct.orig_source_name,
                    ct.citation, ct.citation_type, ct.orig_citation
                FROM foodb_contents ct
                JOIN foodb_nutrients n ON n.id = ct.source_id
                WHERE ct.food_id = $1
                  AND ct.source_type = 'Nutrient'
                  AND ct.standard_content IS NOT NULL
                  AND ct.standard_content > 0
                ORDER BY ct.source_id, ct.standard_content DESC
            ) dedup
            ORDER BY standard_content DESC
            """,
            food_id,
        )

    _NUMERIC_FIELDS = ("standard_content", "orig_content", "orig_min", "orig_max")

    def to_serializable(row):
        d = dict(row)
        for k in _NUMERIC_FIELDS:
            if d.get(k) is not None:
                d[k] = float(d[k])
        return d

    return {
        "food": dict(food_row),
        "compounds": [to_serializable(r) for r in compound_rows],
        "nutrients": [to_serializable(r) for r in nutrient_rows],
        "stats": {
            "total_compounds": len(compound_rows),
            "total_nutrients": len(nutrient_rows),
        },
    }
