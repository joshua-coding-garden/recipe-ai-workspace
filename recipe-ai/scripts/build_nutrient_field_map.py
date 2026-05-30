"""
build_nutrient_field_map.py — 從 nutrient_registry + FooDB 自動生成營養素映射字典

用法：
  docker exec recipe-control python /app/scripts/build_nutrient_field_map.py
  # 或
  cd /home/aiiauser/JM/0325new/recipe-ai
  PYTHONPATH=backend python scripts/build_nutrient_field_map.py
"""
from __future__ import annotations

import asyncio
import json
import os
import sys
from pathlib import Path

# ── 路徑設定 ──
_SCRIPT_DIR = Path(__file__).resolve().parent
_PROJECT_ROOT = _SCRIPT_DIR.parent
_BACKEND_DIR = _PROJECT_ROOT / "backend"
if str(_BACKEND_DIR) not in sys.path:
    sys.path.insert(0, str(_BACKEND_DIR))

from nutrient_registry import NUTRIENT_REGISTRY  # noqa: E402

# ── 輸出路徑 ──
OUTPUT_PATH = _BACKEND_DIR / "resources" / "nutrient_field_map.json"

# ── 已知 FooDB 營養素名稱對照（來自 dri_gap_service.py _NUTRIENT_SEARCH_MAP） ──
_KNOWN_FOODB_MAP: dict[str, str] = {
    "protein_per_100g": "Protein",
    "dietary_fiber_per_100g": "Fiber",
    "iron_per_100g": "Iron",
    "zinc_per_100g": "Zinc",
    "calcium_per_100g": "Calcium",
    "magnesium_per_100g": "Magnesium",
    "phosphorus_per_100g": "Phosphorus",
    "potassium_per_100g": "Potassium",
    "sodium_per_100g": "Sodium",
    "copper_per_100g": "Copper",
    "manganese_per_100g": "Manganese",
    "vitamin_b1_mg": "Thiamin",
    "vitamin_b2_mg": "Riboflavin",
    "niacin_mg": "Niacin",
    "vitamin_b6_mg": "Vitamin B6",
    "vitamin_b12_ug": "Vitamin B12",
    "vitamin_c_mg": "Vitamin C",
    "vitamin_d_total_ug": "Vitamin D",
    "folate_ug": "Folate",
    "retinol_equivalent_ug": "Vitamin A",
    "alpha_vitamin_e_te_mg": "Vitamin E",
    # 額外補充常見映射
    "retinol_ug": "Retinol",
    "alpha_carotene_ug": "Alpha-Carotene",
    "beta_carotene_ug": "Beta-Carotene",
    "cholesterol_mg": "Cholesterol",
    "water_per_100g": "Water",
    # 胺基酸
    "aspartic_acid_mg": "Aspartic acid",
    "threonine_mg": "Threonine",
    "serine_mg": "Serine",
    "glutamic_acid_mg": "Glutamic acid",
    "proline_mg": "Proline",
    "glycine_mg": "Glycine",
    "alanine_mg": "Alanine",
    "cystine_mg": "Cystine",
    "valine_mg": "Valine",
    "methionine_mg": "Methionine",
    "isoleucine_mg": "Isoleucine",
    "leucine_mg": "Leucine",
    "tyrosine_mg": "Tyrosine",
    "phenylalanine_mg": "Phenylalanine",
    "lysine_mg": "Lysine",
    "histidine_mg": "Histidine",
    "arginine_mg": "Arginine",
    "tryptophan_mg": "Tryptophan",
    # 糖類
    "glucose_per_100g": "Glucose",
    "fructose_per_100g": "Fructose",
    "galactose_per_100g": "Galactose",
    "maltose_per_100g": "Maltose",
    "sucrose_per_100g": "Sucrose",
    "lactose_per_100g": "Lactose",
    # 脂肪酸
    "oleic_acid_18_1_mg": "Oleic acid",
    "linoleic_acid_18_2_mg": "Linoleic acid",
    "linolenic_acid_18_3_mg": "Linolenic acid",
    "arachidonic_acid_20_4_mg": "Arachidonic acid",
    "epa_20_5_mg": "EPA",
    "dha_22_6_mg": "DHA",
    "palmitic_acid_16_0_mg": "Palmitic acid",
    "stearic_acid_18_0_mg": "Stearic acid",
    "myristic_acid_14_0_mg": "Myristic acid",
    "lauric_acid_12_0_mg": "Lauric acid",
}


def _get_db_dsn() -> str:
    """從環境變數取得 DB DSN。"""
    return os.environ.get(
        "DATABASE_URL",
        "postgresql://postgres:postgres@localhost:5432/recipe_ai",
    )


async def _fetch_foodb_nutrient_names() -> set[str]:
    """嘗試從 FooDB 取得所有營養素名稱。"""
    dsn = _get_db_dsn()
    try:
        import asyncpg
        conn = await asyncpg.connect(dsn)
        try:
            # 先嘗試 foodb_nutrients 表
            try:
                rows = await conn.fetch("SELECT DISTINCT name FROM foodb_nutrients")
                names = {r["name"] for r in rows if r["name"]}
                if names:
                    print(f"從 foodb_nutrients 取得 {len(names)} 個營養素名稱")
                    return names
            except Exception:
                pass

            # fallback: foodb_compounds
            try:
                rows = await conn.fetch("SELECT DISTINCT name FROM foodb_compounds")
                names = {r["name"] for r in rows if r["name"]}
                if names:
                    print(f"從 foodb_compounds 取得 {len(names)} 個營養素名稱")
                    return names
            except Exception:
                pass

            print("警告：找不到 foodb_nutrients 或 foodb_compounds 表")
            return set()
        finally:
            await conn.close()
    except Exception as e:
        print(f"警告：無法連接資料庫 ({e})，將僅使用 registry 生成映射")
        return set()


def _try_auto_match(label_en: str, foodb_names: set[str]) -> str | None:
    """嘗試自動匹配 label_en 到 FooDB 營養素名稱。"""
    if not foodb_names:
        return None

    # 精確匹配
    if label_en in foodb_names:
        return label_en

    # 不含括號的部分匹配
    base_name = label_en.split("(")[0].strip()
    if base_name in foodb_names:
        return base_name

    # 小寫匹配
    lower_map = {n.lower(): n for n in foodb_names}
    if label_en.lower() in lower_map:
        return lower_map[label_en.lower()]
    if base_name.lower() in lower_map:
        return lower_map[base_name.lower()]

    return None


async def main():
    print("=" * 60)
    print("  build_nutrient_field_map.py")
    print("  從 NUTRIENT_REGISTRY + FooDB 生成營養素映射字典")
    print("=" * 60)

    # Step 1: 從 FooDB 取得營養素名稱
    foodb_names = await _fetch_foodb_nutrient_names()

    # Step 2: 為每個 registry 條目生成映射
    field_map: dict[str, dict] = {}
    matched_count = 0
    unmatched_count = 0

    for field_name, meta in NUTRIENT_REGISTRY.items():
        label = meta["label"]
        label_en = meta["label_en"]
        unit = meta["unit"]
        group = meta["group"]

        # 決定 foodb_name
        foodb_name = None

        # 先查已知映射
        if field_name in _KNOWN_FOODB_MAP:
            foodb_name = _KNOWN_FOODB_MAP[field_name]
        else:
            # 嘗試自動匹配
            foodb_name = _try_auto_match(label_en, foodb_names)

        # 驗證 FooDB 名稱是否存在於 DB 中
        if foodb_name and foodb_names and foodb_name not in foodb_names:
            # 已知映射可能使用不同大小寫，做 case-insensitive 檢查
            lower_map = {n.lower(): n for n in foodb_names}
            actual = lower_map.get(foodb_name.lower())
            if actual:
                foodb_name = actual
            # 如果在已知映射中，即使 DB 中沒有也保留
            elif field_name not in _KNOWN_FOODB_MAP:
                foodb_name = None

        if foodb_name:
            matched_count += 1
        else:
            unmatched_count += 1

        field_map[field_name] = {
            "label": label,
            "label_en": label_en,
            "foodb_name": foodb_name,
            "taiwan_col": field_name,
            "unit": unit,
            "group": group,
        }

    # Step 3: 儲存
    OUTPUT_PATH.parent.mkdir(parents=True, exist_ok=True)
    OUTPUT_PATH.write_text(
        json.dumps(field_map, ensure_ascii=False, indent=2),
        encoding="utf-8",
    )

    # Step 4: 統計
    print(f"\n  NUTRIENT_REGISTRY 總條目數：{len(NUTRIENT_REGISTRY)}")
    print(f"  FooDB 營養素名稱數量：{len(foodb_names)}")
    print(f"  已匹配 FooDB 名稱：{matched_count}")
    print(f"  未匹配（foodb_name=null）：{unmatched_count}")
    print(f"\n  輸出檔案：{OUTPUT_PATH}")
    print("=" * 60)

    # 列出未匹配項目
    if unmatched_count > 0:
        print("\n  未匹配項目：")
        for field_name, entry in field_map.items():
            if entry["foodb_name"] is None:
                print(f"    - {field_name} ({entry['label_en']})")
        print()


if __name__ == "__main__":
    asyncio.run(main())
