#!/bin/bash
# 載入所有 FooDB 資料到 PostgreSQL
# 用法: ./load_all.sh

DB_CONTAINER="${DB_CONTAINER:-recipe_ai_db}"
DB_NAME="${DB_NAME:-recipe_ai}"
DB_USER="${DB_USER:-postgres}"

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

echo "Loading foodb_nutrients_data.sql (0.0 MB)..."
docker exec -i "$DB_CONTAINER" psql -U "$DB_USER" -d "$DB_NAME" < "$SCRIPT_DIR/foodb_nutrients_data.sql"
echo "  done."

echo "All FooDB data loaded successfully!"
