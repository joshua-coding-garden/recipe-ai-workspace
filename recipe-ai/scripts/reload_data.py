#!/usr/bin/env python3
"""
從舊系統的 MySQL dump 重新載入 foods 和 taiwan_foods 資料到 PostgreSQL。
然後執行 FooDB 營養資料補全。
"""

import re
import subprocess
import sys
import os
from pathlib import Path

PROJECT_ROOT = Path(__file__).resolve().parents[1]
OLD_DB = os.getenv("RECIPE_AI_OLD_DB", "/home/aiiauser/JM/new/database")
MAPPING_SQL = PROJECT_ROOT / "backend" / "migrations" / "003_food_mapping.sql"


def read_text_with_fallback(path: Path) -> str:
    """讀取文字檔，依序嘗試常見編碼。"""
    encodings = ["utf-8", "cp950", "big5", "latin1"]
    last_error = None
    for enc in encodings:
        try:
            with open(path, "r", encoding=enc) as f:
                text = f.read()
            print(f"  讀取 {path.name} 使用編碼: {enc}")
            return text
        except Exception as e:
            last_error = e
    raise RuntimeError(f"無法讀取 {path}: {last_error}")


def extract_insert_statements(content: str, table_name: str) -> list[str]:
    """擷取指定資料表的 INSERT 語句，忽略字串內分號。"""
    lower = content.lower()
    marker = f"insert into {table_name.lower()}"
    statements: list[str] = []
    i = 0

    while True:
        start = lower.find(marker, i)
        if start < 0:
            break

        j = start
        in_string = False
        escape = False

        while j < len(content):
            ch = content[j]
            if escape:
                escape = False
            elif ch == "\\":
                escape = True
            elif ch == "'":
                in_string = not in_string
            elif ch == ";" and not in_string:
                statements.append(content[start:j + 1])
                j += 1
                break
            j += 1

        i = j

    return statements


def run_sql(sql, desc=""):
    """執行 SQL 到 PostgreSQL"""
    result = subprocess.run(
        [
            "docker", "exec", "-i", "recipe_ai_db",
            "psql", "-v", "ON_ERROR_STOP=1", "-U", "postgres", "-d", "recipe_ai"
        ],
        input=sql.encode("utf-8"), capture_output=True, text=False
    )
    if result.returncode != 0:
        stderr = result.stderr.decode("utf-8", errors="replace") if result.stderr else ""
        print(f"  ERROR ({desc}): {stderr[:300]}")
        return False
    return True


def mysql_to_pg_value(val):
    """轉換 MySQL 值為 PostgreSQL 相容格式"""
    if val == 'NULL':
        return 'NULL'
    # 已經是字串（帶引號）
    if val.startswith("'"):
        # MySQL 的 \\' 在 PostgreSQL 中也可用，但要注意 E'' 語法
        return val
    return val


def load_foods():
    """從 foodb.sql 載入 foods 表"""
    print("\n=== 載入 foods 表 ===")

    from fix_foodb_nutrition import parse_insert_values, parse_row_fields

    foodb_file = Path(OLD_DB) / "foodb.sql"
    if not foodb_file.exists():
        print(f"  ERROR: 找不到 foodb.sql: {foodb_file}")
        return

    foodb_text = read_text_with_fallback(foodb_file)
    for line in foodb_text.splitlines():
        if not line.startswith("INSERT INTO `foods`"):
            continue

        rows = parse_insert_values(line)
        print(f"  找到 {len(rows)} 筆 foods 記錄")

        # foods 表結構 (MySQL):
            # id, name, name_scientific, description, itis_id, wikipedia_id,
            # picture_file_name, picture_content_type, picture_file_size,
            # picture_updated_at, legacy_id, food_group, food_subgroup,
            # food_type, created_at, updated_at, creator_id, updater_id,
            # export_to_afcdb, category, ncbi_taxonomy_id, export_to_foodb,
            # public_id

            # PostgreSQL foods 表:
            # id, name, portion_size_per_day, cal_per_100g, carbon_per_100g,
            # protein_per_100g, fats_per_100g, flavor, category, description, created_at

        sql_parts = ["DELETE FROM foods;"]
        count = 0
        for row_str in rows:
            fields = parse_row_fields(row_str)
            if len(fields) < 13:
                continue

            food_id = fields[0]
            name = fields[1]
            description = fields[3] if fields[3] != 'NULL' else ''
            food_group = fields[11] if len(fields) > 11 and fields[11] != 'NULL' else ''

            # 截斷過長的描述
            if len(description) > 500:
                description = description[:500]

            # 用 dollar-quoting 避免引號問題
            tag_n = f"$n{food_id}$"
            tag_c = f"$c{food_id}$"
            tag_d = f"$d{food_id}$"

            sql_parts.append(
                f"INSERT INTO foods (id, name, category, description) "
                f"VALUES ({food_id}, {tag_n}{name}{tag_n}, {tag_c}{food_group}{tag_c}, {tag_d}{description}{tag_d}) "
                f"ON CONFLICT (id) DO NOTHING;"
            )
            count += 1

        # 重設 sequence
        sql_parts.append("SELECT setval('foods_id_seq', (SELECT COALESCE(MAX(id), 1) FROM foods));")

        sql = "\n".join(sql_parts)
        print(f"  生成 {count} 條 INSERT 語句")

        if run_sql(sql, "foods"):
            # 驗證
            result = subprocess.run(
                ["docker", "exec", "recipe_ai_db", "psql", "-U", "postgres", "-d", "recipe_ai",
                 "-c", "SELECT COUNT(*) FROM foods;"],
                capture_output=True, text=True
            )
            print(f"  載入結果: {result.stdout.strip()}")
        break


def load_taiwan_foods():
    """從 taiwan_foods_data.sql 載入 taiwan_foods 表"""
    print("\n=== 載入 taiwan_foods 表 ===")

    data_file = Path(OLD_DB) / "taiwan_foods_data.sql"
    if not data_file.exists():
        print(f"  ERROR: 找不到 taiwan_foods_data.sql: {data_file}")
        return

    content = read_text_with_fallback(data_file)

    # 只擷取 INSERT INTO taiwan_foods ... ; 避免 USE/LOCK/SET 等 MySQL 專用語法
    normalized = content.replace('`', '')
    insert_blocks = extract_insert_statements(normalized, "taiwan_foods")

    if not insert_blocks:
        print("  ERROR: 找不到 taiwan_foods 的 INSERT 語句")
        return

    sql = "DELETE FROM taiwan_foods;\n" + "\n".join(insert_blocks)
    print(f"  擷取到 {len(insert_blocks)} 個 INSERT 區塊，SQL 長度: {len(sql)} 字元")

    if run_sql(sql, "taiwan_foods"):
        result = subprocess.run(
            ["docker", "exec", "recipe_ai_db", "psql", "-U", "postgres", "-d", "recipe_ai",
             "-c", "SELECT COUNT(*) FROM taiwan_foods;"],
            capture_output=True, text=True
        )
        print(f"  載入結果: {result.stdout.strip()}")


def load_food_mapping():
    """重新載入 food_mapping"""
    print("\n=== 載入 food_mapping 表 ===")

    data_file = MAPPING_SQL
    if not data_file.exists():
        print(f"  ERROR: 找不到 003_food_mapping.sql: {data_file}")
        return

    sql = read_text_with_fallback(data_file)

    if run_sql(sql, "food_mapping"):
        result = subprocess.run(
            ["docker", "exec", "recipe_ai_db", "psql", "-U", "postgres", "-d", "recipe_ai",
             "-c", "SELECT COUNT(*) FROM food_mapping;"],
            capture_output=True, text=True
        )
        print(f"  載入結果: {result.stdout.strip()}")


def main():
    print("=== 重新載入資料庫資料 ===")

    # 確認資料庫可用
    result = subprocess.run(
        ["docker", "exec", "recipe_ai_db", "psql", "-U", "postgres", "-d", "recipe_ai",
         "-c", "SELECT 1;"],
        capture_output=True, text=True
    )
    if result.returncode != 0:
        print("ERROR: 無法連接資料庫")
        return 1

    load_foods()
    load_taiwan_foods()
    load_food_mapping()

    # 執行營養資料補全
    print("\n=== 補全 FooDB 營養資料 ===")
    import fix_foodb_nutrition
    fix_foodb_nutrition.main()

    # 最終驗證
    print("\n=== 最終驗證 ===")
    for table in ['foods', 'taiwan_foods', 'food_mapping', 'users']:
        result = subprocess.run(
            ["docker", "exec", "recipe_ai_db", "psql", "-U", "postgres", "-d", "recipe_ai",
             "-c", f"SELECT COUNT(*) as {table}_count FROM {table};"],
            capture_output=True, text=True
        )
        print(f"  {result.stdout.strip()}")

    return 0


if __name__ == "__main__":
    sys.exit(main())
