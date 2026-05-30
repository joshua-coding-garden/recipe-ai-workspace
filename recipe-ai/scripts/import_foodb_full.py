#!/usr/bin/env python3
"""
import_foodb_full.py - 將 FooDB MySQL dump 完整轉換並匯入 PostgreSQL

用法：
  python3 import_foodb_full.py                    # 生成 SQL 檔案
  python3 import_foodb_full.py --execute           # 生成並直接執行
  python3 import_foodb_full.py --tables-only       # 只建表不匯資料
  python3 import_foodb_full.py --table contents    # 只匯入指定表
  python3 import_foodb_full.py --dry-run           # 只解析，不寫檔不執行

45 張 FooDB 表全部匯入，表名加 foodb_ 前綴避免與現有表衝突。
串流處理 2.3GB SQL 檔，不會全部載入記憶體。
"""

import re
import sys
import os
import argparse
import subprocess
import time
from pathlib import Path

FOODB_SQL = Path(__file__).parent.parent / "backend" / "database" / "foodb.sql"
OUTPUT_DIR = Path(__file__).parent.parent / "backend" / "migrations"
TABLE_PREFIX = "foodb_"

# PostgreSQL 保留字，需要用雙引號包裹
PG_RESERVED_WORDS = {
    'type', 'text', 'references', 'user', 'order', 'group', 'key',
    'check', 'column', 'table', 'index', 'comment', 'number', 'export',
    'state', 'source', 'link', 'name', 'sequence', 'version',
}

# 所有 45 張 FooDB 表名（原始名 → foodb_ 前綴名）
TABLE_MAP = {}  # 將在解析時自動填充


# ============================================================
# MySQL → PostgreSQL 型別轉換
# ============================================================

def convert_column_type(col_def):
    """轉換 MySQL 欄位定義為 PostgreSQL 語法"""
    s = col_def
    s = re.sub(r"\s+COLLATE\s+\w+", "", s)
    s = re.sub(r"\s+CHARACTER\s+SET\s+\w+", "", s)

    s = re.sub(r"\bint\(\d+\)", "INTEGER", s)
    s = re.sub(r"\bbigint\(\d+\)", "BIGINT", s)
    s = re.sub(r"\btinyint\(1\)", "SMALLINT", s)
    s = re.sub(r"\btinyint\(\d+\)", "SMALLINT", s)
    s = re.sub(r"\bsmallint\(\d+\)", "SMALLINT", s)
    s = re.sub(r"\bmediumint\(\d+\)", "INTEGER", s)
    s = re.sub(r"\bmediumtext\b", "TEXT", s)
    s = re.sub(r"\blongtext\b", "TEXT", s)
    s = re.sub(r"\bdatetime\b", "TIMESTAMP", s)
    s = re.sub(r"\bdouble\b", "DOUBLE PRECISION", s)
    s = re.sub(r"\bfloat\b", "REAL", s)

    # tinyint(1) is now SMALLINT, no boolean conversion needed
    # s = re.sub(r"\bBOOLEAN\b(.*)DEFAULT\s+0\b", r"BOOLEAN\1DEFAULT FALSE", s)
    # s = re.sub(r"\bBOOLEAN\b(.*)DEFAULT\s+1\b", r"BOOLEAN\1DEFAULT TRUE", s)

    return s


def quote_column_name(name):
    """如果是 PostgreSQL 保留字，加雙引號"""
    if name.lower() in PG_RESERVED_WORDS:
        return f'"{name}"'
    return name


# ============================================================
# 解析 CREATE TABLE
# ============================================================

def parse_create_table(lines):
    """
    解析多行 CREATE TABLE 語句，回傳：
    - pg_create: PostgreSQL CREATE TABLE SQL
    - pg_indexes: 額外的 CREATE INDEX SQL 列表
    - table_name: 原始表名
    """
    first_line = lines[0]
    m = re.match(r"CREATE TABLE `(\w+)`", first_line)
    if not m:
        return None, [], None
    table_name = m.group(1)
    pg_table_name = TABLE_PREFIX + table_name
    TABLE_MAP[table_name] = pg_table_name

    columns = []
    pk_col = None
    indexes = []

    for line in lines[1:]:
        stripped = line.strip().rstrip(',')

        if stripped.startswith(')'):
            break

        # PRIMARY KEY
        m_pk = re.match(r"PRIMARY KEY \(`(\w+)`\)", stripped)
        if m_pk:
            pk_col = m_pk.group(1)
            continue

        # UNIQUE KEY
        m_uk = re.match(r"UNIQUE KEY `(\w+)` \((.+)\)", stripped)
        if m_uk:
            idx_name = m_uk.group(1)
            idx_cols = m_uk.group(2)
            idx_cols_clean = format_index_columns(idx_cols)
            pg_idx_name = (TABLE_PREFIX + idx_name)[:63]
            indexes.append(
                f"CREATE UNIQUE INDEX IF NOT EXISTS {pg_idx_name} ON {pg_table_name} ({idx_cols_clean});"
            )
            continue

        # KEY (non-unique index)
        m_key = re.match(r"KEY `(\w+)` \((.+)\)", stripped)
        if m_key:
            idx_name = m_key.group(1)
            idx_cols = m_key.group(2)
            idx_cols_clean = format_index_columns(idx_cols)
            pg_idx_name = (TABLE_PREFIX + idx_name)[:63]
            indexes.append(
                f"CREATE INDEX IF NOT EXISTS {pg_idx_name} ON {pg_table_name} ({idx_cols_clean});"
            )
            continue

        # 一般欄位定義
        m_col = re.match(r"`(\w+)`\s+(.*)", stripped)
        if m_col:
            col_name = m_col.group(1)
            col_rest = m_col.group(2)

            is_auto = 'AUTO_INCREMENT' in col_rest
            if is_auto:
                col_rest = col_rest.replace('AUTO_INCREMENT', '').strip()
                col_rest = col_rest.replace('NOT NULL', '').strip()

            col_rest = convert_column_type(col_rest)

            if is_auto:
                col_rest = re.sub(r"\bINTEGER\b", "SERIAL", col_rest)
                col_rest = re.sub(r"\bBIGINT\b", "BIGSERIAL", col_rest)
                col_rest = re.sub(r"\s+DEFAULT\s+NULL\b", "", col_rest)

            pg_col_name = quote_column_name(col_name)
            columns.append(f"  {pg_col_name} {col_rest.strip()}")

    col_defs = ",\n".join(columns)
    pk_clause = ""
    if pk_col:
        pk_clause = f",\n  PRIMARY KEY ({quote_column_name(pk_col)})"

    create_sql = f"CREATE TABLE IF NOT EXISTS {pg_table_name} (\n{col_defs}{pk_clause}\n);\n"
    return create_sql, indexes, table_name


def format_index_columns(idx_cols_raw):
    """把 `col1`,`col2` 轉換為 col1, col2（保留字加引號）"""
    cols = re.findall(r"`(\w+)`", idx_cols_raw)
    return ", ".join(quote_column_name(c) for c in cols)


# ============================================================
# 解析 INSERT VALUES — 將大型 INSERT 拆分為批次
# ============================================================

def parse_insert_values_streaming(line, batch_size=1000):
    """
    解析 MySQL INSERT INTO `table` VALUES (...),(...),... 語句
    產生器：逐批 yield (sql, record_count)

    不會累積所有批次到記憶體。
    """
    m = re.match(r"INSERT INTO `(\w+)`\s+VALUES\s*", line)
    if not m:
        return

    table_name = m.group(1)
    pg_table_name = TABLE_PREFIX + table_name
    values_start = m.end()

    current_batch = []
    pos = values_start
    line_len = len(line)

    while pos < line_len:
        if line[pos] != '(':
            pos += 1
            continue

        record, end_pos = extract_record(line, pos)
        if record is None:
            break

        record_pg = convert_values(record)
        current_batch.append(record_pg)

        if len(current_batch) >= batch_size:
            sql = f"INSERT INTO {pg_table_name} VALUES\n" + ",\n".join(current_batch) + ";\n"
            yield sql, len(current_batch)
            current_batch = []

        pos = end_pos
        while pos < line_len and line[pos] in (',', ' ', '\r', '\n'):
            pos += 1
        if pos < line_len and line[pos] == ';':
            break

    if current_batch:
        sql = f"INSERT INTO {pg_table_name} VALUES\n" + ",\n".join(current_batch) + ";\n"
        yield sql, len(current_batch)


def extract_record(line, start):
    """
    從 start 位置（即 '('）提取一筆完整的 VALUES 記錄。
    正確處理字串中的括號、反斜線轉義等。
    """
    assert line[start] == '('
    pos = start + 1
    depth = 1
    line_len = len(line)

    while pos < line_len and depth > 0:
        ch = line[pos]
        if ch == '(':
            depth += 1
        elif ch == ')':
            depth -= 1
        elif ch == "'":
            pos += 1
            while pos < line_len:
                ch2 = line[pos]
                if ch2 == '\\':
                    pos += 2
                    continue
                if ch2 == "'":
                    break
                pos += 1
        elif ch == '\\':
            pos += 1
        pos += 1

    if depth != 0:
        return None, pos

    return line[start:pos], pos


def convert_values(record):
    """轉換單筆 VALUES 記錄中的 MySQL 語法為 PostgreSQL 語法。"""
    result = []
    i = 1  # 跳過開頭的 '('
    end = len(record) - 1  # 跳過結尾的 ')'

    while i < end:
        ch = record[i]
        if ch == "'":
            s, new_i = parse_mysql_string(record, i)
            # MySQL 的 '0000-00-00' 和 '0000-00-00 00:00:00' 在 PostgreSQL 不合法
            if s in ("'0000-00-00 00:00:00'", "'0000-00-00'"):
                result.append("'1970-01-01 00:00:00'")
            else:
                result.append(s)
            i = new_i
        elif ch == ',':
            result.append(',')
            i += 1
        elif ch == ' ':
            result.append(' ')
            i += 1
        else:
            j = i
            while j < end and record[j] not in (',',):
                j += 1
            result.append(record[i:j])
            i = j

    return '(' + ''.join(result) + ')'


def parse_mysql_string(record, start):
    """解析 MySQL 字串 'xxx'，轉換轉義為 PostgreSQL 格式。"""
    assert record[start] == "'"
    parts = ["'"]
    i = start + 1
    end = len(record)

    while i < end:
        ch = record[i]
        if ch == '\\':
            if i + 1 < end:
                next_ch = record[i + 1]
                if next_ch == "'":
                    parts.append("''")
                    i += 2
                elif next_ch == '"':
                    parts.append('"')
                    i += 2
                elif next_ch == '\\':
                    parts.append('\\\\')
                    i += 2
                elif next_ch == 'n':
                    parts.append('\n')
                    i += 2
                elif next_ch == 'r':
                    parts.append('\r')
                    i += 2
                elif next_ch == 't':
                    parts.append('\t')
                    i += 2
                elif next_ch == '0':
                    parts.append('')
                    i += 2
                elif next_ch == 'Z':
                    parts.append('')
                    i += 2
                else:
                    parts.append(next_ch)
                    i += 2
            else:
                parts.append('\\')
                i += 1
        elif ch == "'":
            if i + 1 < end and record[i + 1] == "'":
                parts.append("''")
                i += 2
            else:
                parts.append("'")
                i += 1
                break
        else:
            parts.append(ch)
            i += 1

    return ''.join(parts), i


# ============================================================
# SQL 直接執行到 PostgreSQL
# ============================================================

def execute_sql_to_pg(sql_content, description=""):
    """透過 docker exec 執行 SQL 到 PostgreSQL"""
    container = os.environ.get("DB_CONTAINER", "recipe_ai_db")
    db_name = os.environ.get("DB_NAME", "recipe_ai")
    db_user = os.environ.get("DB_USER", "postgres")

    cmd = [
        "docker", "exec", "-i", container,
        "psql", "-U", db_user, "-d", db_name,
        "-v", "ON_ERROR_STOP=0",
    ]

    if description:
        print(f"  [EXEC] {description}")

    proc = subprocess.run(
        cmd, input=sql_content, capture_output=True, text=True, timeout=600
    )

    if proc.returncode != 0 and proc.stderr:
        errors = [l for l in proc.stderr.strip().split('\n')
                  if l and 'NOTICE' not in l and 'already exists' not in l]
        if errors:
            print(f"    [WARN] {'; '.join(errors[:3])}")

    return proc.returncode


# ============================================================
# 額外查詢優化索引
# ============================================================

EXTRA_INDEXES = """
-- 額外查詢優化索引
CREATE INDEX IF NOT EXISTS idx_foodb_health_effects_name ON foodb_health_effects(name);
CREATE INDEX IF NOT EXISTS idx_foodb_che_health_effect_id ON foodb_compounds_health_effects(health_effect_id);
CREATE INDEX IF NOT EXISTS idx_foodb_che_compound_id ON foodb_compounds_health_effects(compound_id);
CREATE INDEX IF NOT EXISTS idx_foodb_contents_source ON foodb_contents(source_id, source_type);
CREATE INDEX IF NOT EXISTS idx_foodb_contents_food ON foodb_contents(food_id);
CREATE INDEX IF NOT EXISTS idx_foodb_contents_compound_food ON foodb_contents(source_id, source_type, food_id);
CREATE INDEX IF NOT EXISTS idx_foodb_compounds_name ON foodb_compounds(name);
CREATE INDEX IF NOT EXISTS idx_foodb_foods_name ON foodb_foods(name);

-- trigram 索引（需要 pg_trgm 擴充，用於模糊搜尋）
-- CREATE INDEX IF NOT EXISTS idx_foodb_health_effects_name_trgm ON foodb_health_effects USING gin(name gin_trgm_ops);
"""


# ============================================================
# Phase 1: 快速掃描取得所有 CREATE TABLE 和索引
# ============================================================

def scan_schema(foodb_path, target_table=None):
    """快速掃描 foodb.sql 取得所有 CREATE TABLE 和索引定義"""
    creates = []
    all_indexes = []
    in_create = False
    create_lines = []
    tables_found = 0

    print(f"[Phase 1] 掃描 schema...")
    with open(foodb_path, 'r', encoding='utf-8', errors='replace') as f:
        for line in f:
            stripped = line.strip()
            if not stripped or stripped.startswith('--') or stripped.startswith('/*') or stripped.startswith('/*!'):
                continue

            if stripped.startswith('CREATE TABLE'):
                in_create = True
                create_lines = [stripped]
                continue

            if in_create:
                create_lines.append(stripped)
                if stripped.startswith(')'):
                    in_create = False
                    pg_create, pg_indexes, orig_name = parse_create_table(create_lines)
                    if pg_create and (target_table is None or target_table == orig_name):
                        creates.append(pg_create)
                        all_indexes.extend(pg_indexes)
                        tables_found += 1
                        print(f"  [TABLE {tables_found:02d}] {orig_name} → {TABLE_PREFIX}{orig_name}")
                    create_lines = []

    print(f"  共 {tables_found} 張表, {len(all_indexes)} 個索引")
    return creates, all_indexes


# ============================================================
# Phase 2: 串流處理 INSERT 語句（寫檔或執行，不累積記憶體）
# ============================================================

def process_inserts_streaming(foodb_path, target_table=None,
                              write_files=False, execute=False,
                              output_dir=None, batch_size=1000):
    """
    串流讀取 foodb.sql 中的 INSERT 語句。
    每解析一批就立即寫檔 / 執行，不累積在記憶體中。

    回傳 insert_counts: {table_name: record_count}
    """
    insert_counts = {}
    total_records = 0
    data_files = {}   # table_name → file handle (僅 write_files 模式)
    file_list = []

    if write_files:
        data_dir = Path(output_dir) / "foodb_data"
        data_dir.mkdir(parents=True, exist_ok=True)

    print(f"\n[Phase 2] 串流處理 INSERT 語句...")
    start_time = time.time()

    with open(foodb_path, 'r', encoding='utf-8', errors='replace') as f:
        line_num = 0
        for line in f:
            line_num += 1
            if line_num % 500000 == 0:
                elapsed = time.time() - start_time
                print(f"  ... 已處理 {line_num:,} 行, {total_records:,} 筆 ({elapsed:.0f}s)")

            stripped = line.strip()
            if not stripped.startswith('INSERT INTO'):
                continue

            m = re.match(r"INSERT INTO `(\w+)`", stripped)
            if not m:
                continue

            orig_table = m.group(1)
            if target_table is not None and target_table != orig_table:
                continue

            pg_table_name = TABLE_PREFIX + orig_table

            # 串流解析並立即處理每一批
            for batch_sql, batch_count in parse_insert_values_streaming(stripped, batch_size):
                insert_counts[orig_table] = insert_counts.get(orig_table, 0) + batch_count
                total_records += batch_count

                if write_files:
                    if orig_table not in data_files:
                        filepath = data_dir / f"{pg_table_name}_data.sql"
                        data_files[orig_table] = open(filepath, 'w', encoding='utf-8')
                        data_files[orig_table].write(f"-- Data for {pg_table_name}\n")
                        data_files[orig_table].write(f"-- Source: FooDB MySQL dump\n\n")

                    data_files[orig_table].write(batch_sql)
                    data_files[orig_table].write("\n")

                if execute:
                    execute_sql_to_pg(batch_sql)

            # 進度報告（每張表結束時）
            if orig_table in insert_counts:
                count_so_far = insert_counts[orig_table]
                if count_so_far > 10000 and count_so_far % 100000 < batch_size * 2:
                    elapsed = time.time() - start_time
                    print(f"    {pg_table_name}: {count_so_far:,} 筆 ({elapsed:.0f}s)")

    # 關閉所有資料檔案
    for orig_table, fh in data_files.items():
        fh.close()
        pg_name = TABLE_PREFIX + orig_table
        filepath = Path(output_dir) / "foodb_data" / f"{pg_name}_data.sql"
        size_mb = filepath.stat().st_size / (1024 * 1024)
        file_list.append((f"{pg_name}_data.sql", size_mb))
        print(f"  [DATA] {pg_name}_data.sql ({size_mb:.1f} MB)")

    elapsed = time.time() - start_time
    print(f"\n  串流處理完成: {total_records:,} 筆, {elapsed:.1f}s")

    # 寫入 loader script
    if write_files and file_list:
        write_loader_script(file_list, output_dir)

    return insert_counts


def count_inserts_only(foodb_path, target_table=None):
    """快速計數模式（dry-run），只統計不解析值"""
    insert_counts = {}
    total = 0

    print(f"\n[Phase 2] 快速計數模式...")
    start_time = time.time()

    with open(foodb_path, 'r', encoding='utf-8', errors='replace') as f:
        for line in f:
            stripped = line.strip()
            if not stripped.startswith('INSERT INTO'):
                continue
            m = re.match(r"INSERT INTO `(\w+)`", stripped)
            if not m:
                continue
            orig_table = m.group(1)
            if target_table is not None and target_table != orig_table:
                continue

            count = stripped.count('),(') + 1
            insert_counts[orig_table] = insert_counts.get(orig_table, 0) + count
            total += count

    elapsed = time.time() - start_time
    print(f"  計數完成: {total:,} 筆, {elapsed:.1f}s")
    return insert_counts


# ============================================================
# 輸出檔案
# ============================================================

def write_schema_migration(creates, all_indexes, output_path):
    """寫入 CREATE TABLE + CREATE INDEX 的 migration 檔"""
    with open(output_path, 'w', encoding='utf-8') as f:
        f.write("-- ============================================================\n")
        f.write("-- FooDB Full Schema Migration\n")
        f.write("-- 自動由 import_foodb_full.py 生成\n")
        f.write("-- 45 張 FooDB 表，全部加 foodb_ 前綴\n")
        f.write("-- ============================================================\n\n")
        f.write("CREATE EXTENSION IF NOT EXISTS pg_trgm;\n\n")

        f.write("-- CREATE TABLE\n")
        f.write("-- ============================================================\n\n")
        for sql in creates:
            f.write(sql)
            f.write("\n")

        f.write("-- 原始 FooDB 索引\n")
        f.write("-- ============================================================\n\n")
        for sql in all_indexes:
            f.write(sql)
            f.write("\n")

        f.write("\n-- 額外查詢優化索引\n")
        f.write("-- ============================================================\n")
        f.write(EXTRA_INDEXES)
        f.write("\n")

    print(f"[INFO] Schema migration 已寫入: {output_path}")


def write_loader_script(file_list, output_dir):
    """生成匯入 shell 腳本"""
    loader_path = Path(output_dir) / "foodb_data" / "load_all.sh"
    with open(loader_path, 'w', encoding='utf-8') as f:
        f.write("#!/bin/bash\n")
        f.write("# 載入所有 FooDB 資料到 PostgreSQL\n")
        f.write("# 用法: ./load_all.sh\n\n")
        f.write('DB_CONTAINER="${DB_CONTAINER:-recipe_ai_db}"\n')
        f.write('DB_NAME="${DB_NAME:-recipe_ai}"\n')
        f.write('DB_USER="${DB_USER:-postgres}"\n\n')
        f.write('SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"\n\n')

        for filename, size_mb in sorted(file_list):
            f.write(f'echo "Loading {filename} ({size_mb:.1f} MB)..."\n')
            f.write(f'docker exec -i "$DB_CONTAINER" psql -U "$DB_USER" -d "$DB_NAME" < "$SCRIPT_DIR/{filename}"\n')
            f.write(f'echo "  done."\n\n')

        f.write('echo "All FooDB data loaded successfully!"\n')

    os.chmod(loader_path, 0o755)
    print(f"[INFO] Loader script: {loader_path}")


# ============================================================
# 執行 schema 到 PostgreSQL
# ============================================================

def execute_schema(creates, all_indexes):
    """執行 schema 建立"""
    print("\n[EXEC Phase 1] 建立資料表...")
    execute_sql_to_pg("CREATE EXTENSION IF NOT EXISTS pg_trgm;", "pg_trgm extension")

    for sql in creates:
        m = re.search(r"CREATE TABLE IF NOT EXISTS (\w+)", sql)
        desc = m.group(1) if m else "unknown"
        execute_sql_to_pg(sql, f"CREATE TABLE {desc}")

    print(f"\n[EXEC Phase 2] 建立索引 ({len(all_indexes)} 個原始索引)...")
    idx_batch = "\n".join(all_indexes)
    execute_sql_to_pg(idx_batch, "原始 FooDB 索引")

    print(f"\n[EXEC Phase 3] 建立額外查詢優化索引...")
    execute_sql_to_pg(EXTRA_INDEXES, "額外索引")


def update_sequences():
    """更新所有 foodb_ 表的 SERIAL 序列值"""
    print(f"\n[EXEC Phase 5] 更新序列值...")
    for table_name, pg_name in sorted(TABLE_MAP.items()):
        seq_sql = f"""
        DO $$
        BEGIN
            IF EXISTS (SELECT 1 FROM information_schema.columns
                       WHERE table_name = '{pg_name}' AND column_name = 'id') THEN
                PERFORM setval(pg_get_serial_sequence('{pg_name}', 'id'),
                               COALESCE((SELECT MAX(id) FROM {pg_name}), 1));
            END IF;
        END $$;
        """
        execute_sql_to_pg(seq_sql, f"sequence {pg_name}")


def verify_counts(insert_counts):
    """驗證各表記錄數"""
    print("\n[驗證] 檢查各表記錄數...")
    container = os.environ.get("DB_CONTAINER", "recipe_ai_db")
    db_name = os.environ.get("DB_NAME", "recipe_ai")
    db_user = os.environ.get("DB_USER", "postgres")

    for table_name in sorted(TABLE_MAP.keys()):
        pg_name = TABLE_PREFIX + table_name
        proc = subprocess.run(
            ["docker", "exec", "-i", container,
             "psql", "-U", db_user, "-d", db_name,
             "-t", "-A", "-c", f"SELECT COUNT(*) FROM {pg_name};"],
            capture_output=True, text=True, timeout=30
        )
        if proc.returncode == 0:
            actual = proc.stdout.strip()
            expected = insert_counts.get(table_name, 0)
            status = "OK" if int(actual) == expected else f"MISMATCH (expected {expected})"
            print(f"  {pg_name:45s} {actual:>12s} 筆  {status}")
        else:
            print(f"  {pg_name:45s} [查詢失敗]")


# ============================================================
# 統計輸出
# ============================================================

def print_table_mapping():
    print("\n" + "=" * 60)
    print("FooDB 表名映射（原始名 → PostgreSQL 名）")
    print("=" * 60)
    for orig, pg in sorted(TABLE_MAP.items()):
        print(f"  {orig:45s} → {pg}")
    print(f"\n共 {len(TABLE_MAP)} 張表")


def print_counts(insert_counts):
    print("\n各表記錄數：")
    for table_name, count in sorted(insert_counts.items(), key=lambda x: -x[1]):
        print(f"  {TABLE_PREFIX + table_name:45s} {count:>12,} 筆")
    print(f"  {'合計':45s} {sum(insert_counts.values()):>12,} 筆")


# ============================================================
# main
# ============================================================

def main():
    parser = argparse.ArgumentParser(
        description="將 FooDB MySQL dump 完整轉換並匯入 PostgreSQL",
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog="""
範例：
  python3 import_foodb_full.py                    # 生成 SQL 檔案
  python3 import_foodb_full.py --execute           # 生成並直接執行到 DB
  python3 import_foodb_full.py --tables-only       # 只建表不匯資料
  python3 import_foodb_full.py --table contents    # 只處理指定表
  python3 import_foodb_full.py --dry-run           # 只統計，不寫檔
        """
    )
    parser.add_argument("--execute", action="store_true",
                        help="生成後直接執行到 PostgreSQL")
    parser.add_argument("--tables-only", action="store_true",
                        help="只建表和索引，不匯入資料")
    parser.add_argument("--table", type=str, default=None,
                        help="只處理指定表（原始 MySQL 表名）")
    parser.add_argument("--dry-run", action="store_true",
                        help="只解析統計，不寫檔不執行")
    parser.add_argument("--input", type=str, default=None,
                        help="指定 foodb.sql 路徑")
    parser.add_argument("--batch-size", type=int, default=1000,
                        help="INSERT 批次大小（預設 1000）")
    args = parser.parse_args()

    foodb_path = Path(args.input) if args.input else FOODB_SQL
    if not foodb_path.exists():
        print(f"[ERROR] 找不到 foodb.sql: {foodb_path}")
        sys.exit(1)

    print(f"[INFO] 來源: {foodb_path}")
    print(f"[INFO] 檔案大小: {foodb_path.stat().st_size / (1024*1024*1024):.2f} GB")

    # Phase 1: 掃描 schema
    creates, all_indexes = scan_schema(foodb_path, target_table=args.table)

    if not creates:
        print("[ERROR] 沒有找到任何 CREATE TABLE 語句")
        sys.exit(1)

    # 寫入 migration 檔（永遠生成，除了 dry-run）
    migration_path = OUTPUT_DIR / "006_foodb_full_schema.sql"
    if not args.dry_run:
        write_schema_migration(creates, all_indexes, migration_path)

    # 執行 schema（如果 --execute）
    if args.execute:
        execute_schema(creates, all_indexes)

    # Phase 2: 處理 INSERT 語句
    insert_counts = {}
    if not args.tables_only:
        if args.dry_run:
            insert_counts = count_inserts_only(foodb_path, target_table=args.table)
        else:
            insert_counts = process_inserts_streaming(
                foodb_path,
                target_table=args.table,
                write_files=not args.execute,  # 不執行時寫檔，執行時直接送 DB
                execute=args.execute,
                output_dir=str(OUTPUT_DIR),
                batch_size=args.batch_size,
            )

    # 更新序列和驗證
    if args.execute and not args.tables_only:
        update_sequences()
        verify_counts(insert_counts)

    # 輸出統計
    print_table_mapping()
    if insert_counts:
        print_counts(insert_counts)

    if args.dry_run:
        print("\n[DRY-RUN] 完成，未寫入任何檔案。")
    elif args.execute:
        print("\n" + "=" * 60)
        print("匯入完成！")
        print("=" * 60)
    else:
        print(f"\n[INFO] SQL 檔案已生成。")
        print(f"  Schema: {migration_path}")
        if not args.tables_only:
            print(f"  Data:   {OUTPUT_DIR / 'foodb_data/'}")
        print(f"\n要直接執行匯入，請加 --execute 參數。")


if __name__ == "__main__":
    main()
