#!/usr/bin/env python3
"""
從 FooDB MySQL dump 解析營養資料，更新 PostgreSQL foods 表。

nutrients 表中的關鍵 ID：
  1 = Fat (mg/100g)
  2 = Proteins (mg/100g)
  3 = Carbohydrate (mg/100g)
  38 = Energy (kcal? 需確認單位)

contents 表格式：
  (id, source_id, source_type, food_id, ..., standard_content, ...)
  source_id 對應 nutrients.id, food_id 對應 foods.id
  standard_content 欄位(第24欄, 0-indexed) 為 mg/100g
"""

import re
import sys
import subprocess
import json
import os
import tempfile
from collections import defaultdict

FOODB_SQL = os.getenv(
    "RECIPE_AI_FOODB_SQL",
    os.path.join(os.getenv("RECIPE_AI_OLD_DB", "/home/aiiauser/JM/new/database"), "foodb.sql"),
)

def parse_insert_values(line):
    """解析 MySQL INSERT INTO ... VALUES (...),(...); 格式"""
    # 找到 VALUES 後的部分
    m = re.search(r'VALUES\s*', line)
    if not m:
        return []

    rest = line[m.end():]
    rows = []
    current = []
    in_string = False
    escape = False
    depth = 0

    for ch in rest:
        if escape:
            current.append(ch)
            escape = False
            continue
        if ch == '\\':
            current.append(ch)
            escape = True
            continue
        if ch == "'" and not in_string:
            in_string = True
            current.append(ch)
            continue
        if ch == "'" and in_string:
            in_string = False
            current.append(ch)
            continue
        if in_string:
            current.append(ch)
            continue
        if ch == '(':
            depth += 1
            if depth == 1:
                current = []
                continue
        elif ch == ')':
            depth -= 1
            if depth == 0:
                rows.append(''.join(current))
                continue
        elif ch == ';':
            break
        if depth > 0:
            current.append(ch)

    return rows


def parse_row_fields(row_str):
    """解析單行 VALUES 中的欄位"""
    fields = []
    current = []
    in_string = False
    escape = False

    for ch in row_str:
        if escape:
            current.append(ch)
            escape = False
            continue
        if ch == '\\':
            escape = True
            current.append(ch)
            continue
        if ch == "'" and not in_string:
            in_string = True
            continue
        if ch == "'" and in_string:
            in_string = False
            continue
        if in_string:
            current.append(ch)
            continue
        if ch == ',':
            fields.append(''.join(current).strip())
            current = []
            continue
        current.append(ch)

    if current:
        fields.append(''.join(current).strip())

    return fields


def main():
    print("=== FooDB 營養資料修復腳本 ===")

    if not os.path.exists(FOODB_SQL):
        print(f"ERROR: 找不到 foodb.sql: {FOODB_SQL}")
        return 1

    # 1. 解析 contents 表，提取營養資料
    # contents 欄位順序 (0-indexed):
    # 0:id, 1:source_id, 2:source_type, 3:food_id, 4:orig_food_id,
    # 5:orig_food_common_name, 6:orig_food_scientific_name, 7:orig_food_part,
    # 8:orig_source_id, 9:orig_source_name, 10:orig_content, 11:orig_min,
    # 12:orig_max, 13:orig_unit, 14:orig_citation, 15:citation, 16:citation_type,
    # 17:creator_id, 18:updater_id, 19:created_at, 20:updated_at,
    # 21:orig_method, 22:orig_unit_expression, 23:standard_content,
    # 24:preparation_type, 25:export

    # nutrient_id -> name mapping
    NUTRIENT_MAP = {
        '1': 'fat',      # Fat
        '2': 'protein',  # Proteins
        '3': 'carb',     # Carbohydrate
        '38': 'energy',  # Energy
    }

    # food_id -> {fat, protein, carb, energy} -> [values]
    food_nutrients = defaultdict(lambda: defaultdict(list))

    print("解析 contents 表...")
    content_count = 0

    with open(FOODB_SQL, 'r', encoding='utf-8', errors='replace') as f:
        for line in f:
            if not line.startswith("INSERT INTO `contents`"):
                continue

            rows = parse_insert_values(line)
            for row_str in rows:
                fields = parse_row_fields(row_str)
                if len(fields) < 24:
                    continue

                source_id = fields[1].strip()
                source_type = fields[2].strip()
                food_id = fields[3].strip()
                orig_content = fields[10].strip()
                standard_content = fields[23].strip()
                prep_type = fields[24].strip() if len(fields) > 24 else ''

                # 只要 Nutrient 類型且是我們關心的營養素
                if source_type != 'Nutrient':
                    continue
                if source_id not in NUTRIENT_MAP:
                    continue

                # 跳過明顯加工的 preparation（保留 raw、NULL、other、dried or powder）
                skip_preps = {'cooked', 'fried', 'baked', 'boiled', 'roasted', 'grilled', 'steamed', 'canned', 'frozen'}
                if prep_type and prep_type != 'NULL':
                    if any(s in prep_type.lower() for s in skip_preps):
                        continue

                nutrient_name = NUTRIENT_MAP[source_id]

                try:
                    if nutrient_name == 'energy':
                        # Energy: 用 orig_content (kcal/100g)
                        # 有些記錄的 orig_content 實際是 kJ，過濾掉異常高的值
                        # 純油脂最高 ~900 kcal/100g，超過的視為 kJ 單位錯誤
                        if orig_content == 'NULL' or not orig_content:
                            continue
                        value = float(orig_content)
                        if value > 920:
                            # 可能是 kJ，轉換為 kcal
                            value = value / 4.184
                    else:
                        # Fat/Protein/Carb: 用 standard_content (mg/100g)
                        if standard_content == 'NULL' or not standard_content:
                            continue
                        value = float(standard_content)

                    food_nutrients[food_id][nutrient_name].append(value)
                    content_count += 1
                except (ValueError, IndexError):
                    continue

    print(f"  解析到 {content_count} 筆營養記錄，涵蓋 {len(food_nutrients)} 個食物")

    # 2. 計算每個食物的平均營養值
    # contents 中的值是 mg/100g，需要轉換：
    #   - Fat: mg/100g -> g/100g (除以 1000)
    #   - Protein: mg/100g -> g/100g (除以 1000)
    #   - Carb: mg/100g -> g/100g (除以 1000)
    #   - Energy: 直接用（kcal/100g）

    updates = []
    for food_id, nutrients in food_nutrients.items():
        fat = None
        protein = None
        carb = None
        energy = None

        if 'fat' in nutrients:
            # mg/100g -> g/100g
            fat = sum(nutrients['fat']) / len(nutrients['fat']) / 1000.0
        if 'protein' in nutrients:
            protein = sum(nutrients['protein']) / len(nutrients['protein']) / 1000.0
        if 'carb' in nutrients:
            carb = sum(nutrients['carb']) / len(nutrients['carb']) / 1000.0
        # 優先用 4-4-9 公式計算 energy（FooDB energy 記錄單位混亂）
        if protein is not None and carb is not None:
            f = fat if fat is not None else 0
            energy = protein * 4 + carb * 4 + f * 9
        elif 'energy' in nutrients:
            # 沒有完整三大營養素時，才用 FooDB energy（已做 kJ 過濾）
            energy = sum(nutrients['energy']) / len(nutrients['energy'])

        updates.append({
            'food_id': int(food_id),
            'cal': round(energy, 2) if energy else None,
            'carb': round(carb, 2) if carb else None,
            'protein': round(protein, 2) if protein else None,
            'fat': round(fat, 2) if fat else None,
        })

    print(f"  計算完成，準備更新 {len(updates)} 個食物")

    # 統計
    has_cal = sum(1 for u in updates if u['cal'] is not None)
    has_protein = sum(1 for u in updates if u['protein'] is not None)
    has_fat = sum(1 for u in updates if u['fat'] is not None)
    has_carb = sum(1 for u in updates if u['carb'] is not None)
    print(f"  有熱量: {has_cal}, 蛋白質: {has_protein}, 脂肪: {has_fat}, 碳水: {has_carb}")

    # 3. 生成 SQL 更新語句
    sql_parts = []
    for u in updates:
        sets = []
        if u['cal'] is not None:
            sets.append(f"cal_per_100g = {u['cal']}")
        if u['carb'] is not None:
            sets.append(f"carbon_per_100g = {u['carb']}")
        if u['protein'] is not None:
            sets.append(f"protein_per_100g = {u['protein']}")
        if u['fat'] is not None:
            sets.append(f"fats_per_100g = {u['fat']}")

        if sets:
            sql_parts.append(f"UPDATE foods SET {', '.join(sets)} WHERE id = {u['food_id']};")

    print(f"  生成 {len(sql_parts)} 條 UPDATE 語句")

    # 4. 執行 SQL
    sql = "\n".join(sql_parts)
    sql_file = os.path.join(tempfile.gettempdir(), "foodb_nutrition_update.sql")
    with open(sql_file, 'w') as f:
        f.write(sql)

    print("執行 SQL 更新...")
    result = subprocess.run(
        ["docker", "exec", "-i", "recipe_ai_db", "psql", "-U", "postgres", "-d", "recipe_ai"],
        input=sql.encode("utf-8"),
        capture_output=True,
        text=False
    )

    if result.returncode != 0:
        stderr = result.stderr.decode("utf-8", errors="replace") if result.stderr else ""
        print(f"ERROR: {stderr[:500]}")
        return 1

    # 統計更新結果
    stdout = result.stdout.decode("utf-8", errors="replace") if result.stdout else ""
    update_count = stdout.count("UPDATE")
    print(f"  成功更新 {update_count} 筆記錄")

    # 5. 驗證
    verify_sql = """
    SELECT
        COUNT(*) as total,
        COUNT(cal_per_100g) as has_cal,
        COUNT(protein_per_100g) as has_protein,
        COUNT(fats_per_100g) as has_fat,
        COUNT(carbon_per_100g) as has_carb
    FROM foods;
    """
    result = subprocess.run(
        ["docker", "exec", "-i", "recipe_ai_db", "psql", "-U", "postgres", "-d", "recipe_ai", "-c", verify_sql],
        capture_output=True, text=True
    )
    print("\n驗證結果:")
    print(result.stdout)

    # 顯示幾筆範例
    sample_sql = "SELECT id, name, cal_per_100g, protein_per_100g, fats_per_100g, carbon_per_100g FROM foods WHERE cal_per_100g IS NOT NULL LIMIT 10;"
    result = subprocess.run(
        ["docker", "exec", "-i", "recipe_ai_db", "psql", "-U", "postgres", "-d", "recipe_ai", "-c", sample_sql],
        capture_output=True, text=True
    )
    print("範例資料:")
    print(result.stdout)

    return 0


if __name__ == "__main__":
    sys.exit(main())
