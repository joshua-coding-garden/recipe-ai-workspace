#!/bin/bash
# Recipe AI - Docker 開發啟動腳本
# 用法: ./start-dev.sh [build|stop|restart|logs|status]
#
# 因 docker-compose v1 有 ContainerConfig bug，
# 此腳本直接用 docker build + docker run 管理容器。

set -e
ROOT="$(cd "$(dirname "$0")" && pwd)"

# 顏色
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
NC='\033[0m'

# 容器與映像名稱
DB_CONTAINER="recipe_ai_db"
BACKEND_CONTAINER="recipe_ai_backend"
CONTROL_CONTAINER="recipe_ai_control"
FRONTEND_CONTAINER="recipe_ai_frontend"
NETWORK="recipe_ai_net"

log() { echo -e "${CYAN}[$1]${NC} $2"; }
ok()  { echo -e "${GREEN}[OK]${NC} $1"; }
err() { echo -e "${RED}[ERROR]${NC} $1"; }

# ──────────────────────────────────────────────────────────────
# 確保 Docker network 存在
# ──────────────────────────────────────────────────────────────
ensure_network() {
    docker network inspect "$NETWORK" >/dev/null 2>&1 || \
        docker network create "$NETWORK" >/dev/null 2>&1
}

# ──────────────────────────────────────────────────────────────
# 停止並移除容器（安全）
# ──────────────────────────────────────────────────────────────
stop_container() {
    local name=$1
    if docker ps -a --format '{{.Names}}' | grep -q "^${name}$"; then
        docker stop "$name" >/dev/null 2>&1 || true
        docker rm "$name" >/dev/null 2>&1 || true
        log "$name" "已停止"
    fi
}

# ──────────────────────────────────────────────────────────────
# 等待容器健康
# ──────────────────────────────────────────────────────────────
wait_healthy() {
    local name=$1 max=$2
    log "$name" "等待啟動..."
    for i in $(seq 1 "$max"); do
        if docker ps --format '{{.Names}} {{.Status}}' | grep "$name" | grep -q "healthy\|Up"; then
            ok "$name 已啟動"
            return 0
        fi
        sleep 1
    done
    err "$name 啟動超時"
    return 1
}

# ──────────────────────────────────────────────────────────────
# 1. PostgreSQL
# ──────────────────────────────────────────────────────────────
start_db() {
    if docker ps --format '{{.Names}}' | grep -q "^${DB_CONTAINER}$"; then
        ok "PostgreSQL 已在運行"
        return
    fi
    stop_container "$DB_CONTAINER"

    log "postgres" "啟動 PostgreSQL..."
    docker run -d \
        --name "$DB_CONTAINER" \
        --network "$NETWORK" \
        --restart unless-stopped \
        -e POSTGRES_DB=recipe_ai \
        -e POSTGRES_USER=postgres \
        -e POSTGRES_PASSWORD="${POSTGRES_PASSWORD:-recipe_ai_pass}" \
        -p 5432:5432 \
        -v recipe_ai_postgres_data:/var/lib/postgresql/data \
        -v "$ROOT/backend/migrations:/docker-entrypoint-initdb.d:ro" \
        --health-cmd "pg_isready -U postgres -d recipe_ai" \
        --health-interval 10s \
        --health-timeout 5s \
        --health-retries 5 \
        postgres:16-alpine >/dev/null

    # 等待 healthy
    log "postgres" "等待資料庫就緒..."
    for i in $(seq 1 30); do
        if docker inspect --format='{{.State.Health.Status}}' "$DB_CONTAINER" 2>/dev/null | grep -q "healthy"; then
            ok "PostgreSQL 就緒"
            return
        fi
        sleep 1
    done
    err "PostgreSQL 啟動超時"
}

# ──────────────────────────────────────────────────────────────
# 2. Backend
# ──────────────────────────────────────────────────────────────
start_backend() {
    if docker ps --format '{{.Names}}' | grep -q "^${BACKEND_CONTAINER}$"; then
        ok "Backend 已在運行"
        return
    fi
    stop_container "$BACKEND_CONTAINER"

    log "backend" "建構映像..."
    docker build -t recipe-ai_backend "$ROOT/backend/" -q >/dev/null

    log "backend" "啟動容器..."
    docker run -d \
        --name "$BACKEND_CONTAINER" \
        --network "$NETWORK" \
        --restart unless-stopped \
        -p 8001:8001 \
        -e BACKEND_DB_HOST=recipe_ai_db \
        -e BACKEND_DB_PORT=5432 \
        -e BACKEND_DB_NAME=recipe_ai \
        -e BACKEND_DB_USER=postgres \
        -e BACKEND_DB_PASSWORD="${POSTGRES_PASSWORD:-recipe_ai_pass}" \
        recipe-ai_backend >/dev/null

    wait_healthy "$BACKEND_CONTAINER" 15
}

# ──────────────────────────────────────────────────────────────
# 3. Control
# ──────────────────────────────────────────────────────────────
start_control() {
    if docker ps --format '{{.Names}}' | grep -q "^${CONTROL_CONTAINER}$"; then
        ok "Control 已在運行"
        return
    fi
    stop_container "$CONTROL_CONTAINER"

    log "control" "建構映像..."
    docker build -t recipe-ai_control "$ROOT/control/" -q >/dev/null

    log "control" "啟動容器（host network）..."
    docker run -d \
        --name "$CONTROL_CONTAINER" \
        --network host \
        --restart unless-stopped \
        --env-file "$ROOT/control/.env" \
        recipe-ai_control >/dev/null

    wait_healthy "$CONTROL_CONTAINER" 10
}

# ──────────────────────────────────────────────────────────────
# 4. Frontend
# ──────────────────────────────────────────────────────────────
start_frontend() {
    if docker ps --format '{{.Names}}' | grep -q "^${FRONTEND_CONTAINER}$"; then
        ok "Frontend 已在運行"
        return
    fi
    stop_container "$FRONTEND_CONTAINER"

    log "frontend" "建構映像..."
    docker build -t recipe-ai_frontend "$ROOT/frontend/" -q >/dev/null

    log "frontend" "啟動容器（host network）..."
    docker run -d \
        --name "$FRONTEND_CONTAINER" \
        --network host \
        --restart unless-stopped \
        recipe-ai_frontend >/dev/null

    wait_healthy "$FRONTEND_CONTAINER" 10
}

# ──────────────────────────────────────────────────────────────
# 指令處理
# ──────────────────────────────────────────────────────────────
cmd_start() {
    echo -e "${YELLOW}========================================${NC}"
    echo -e "${YELLOW}  Recipe AI - 啟動所有服務${NC}"
    echo -e "${YELLOW}========================================${NC}"
    echo ""

    ensure_network
    start_db
    start_backend
    start_control
    start_frontend

    echo ""
    echo -e "${GREEN}========================================${NC}"
    echo -e "${GREEN}  所有服務已啟動${NC}"
    echo -e "${GREEN}========================================${NC}"
    echo -e "  Frontend  → ${CYAN}http://10.22.22.187:3001${NC}"
    echo -e "  Control   → ${CYAN}http://localhost:8000${NC}"
    echo -e "  Backend   → ${CYAN}http://localhost:8001${NC}"
    echo -e "  PostgreSQL→ ${CYAN}localhost:5432${NC}"
    echo ""
}

cmd_stop() {
    echo -e "${YELLOW}停止所有服務...${NC}"
    stop_container "$FRONTEND_CONTAINER"
    stop_container "$CONTROL_CONTAINER"
    stop_container "$BACKEND_CONTAINER"
    stop_container "$DB_CONTAINER"
    ok "所有服務已停止"
}

cmd_restart() {
    cmd_stop
    echo ""
    cmd_start
}

cmd_build() {
    echo -e "${YELLOW}重新建構所有映像...${NC}"
    ensure_network

    stop_container "$FRONTEND_CONTAINER"
    stop_container "$CONTROL_CONTAINER"
    stop_container "$BACKEND_CONTAINER"

    log "backend" "建構映像（no-cache）..."
    docker build --no-cache -t recipe-ai_backend "$ROOT/backend/" -q >/dev/null
    ok "Backend 映像已建構"

    log "control" "建構映像（no-cache）..."
    docker build --no-cache -t recipe-ai_control "$ROOT/control/" -q >/dev/null
    ok "Control 映像已建構"

    log "frontend" "建構映像（no-cache）..."
    docker build --no-cache -t recipe-ai_frontend "$ROOT/frontend/" -q >/dev/null
    ok "Frontend 映像已建構"

    # 重新啟動
    start_backend
    start_control
    start_frontend

    ok "所有服務已重建並啟動"
}

cmd_logs() {
    local svc=${1:-control}
    case $svc in
        db|postgres) docker logs -f "$DB_CONTAINER" ;;
        backend)     docker logs -f "$BACKEND_CONTAINER" ;;
        control)     docker logs -f "$CONTROL_CONTAINER" ;;
        frontend)    docker logs -f "$FRONTEND_CONTAINER" ;;
        all)
            echo "=== 最近日誌 ==="
            for c in $DB_CONTAINER $BACKEND_CONTAINER $CONTROL_CONTAINER $FRONTEND_CONTAINER; do
                echo -e "\n${CYAN}--- $c ---${NC}"
                docker logs --tail 10 "$c" 2>&1
            done
            ;;
        *) err "未知服務: $svc (可選: db backend control frontend all)" ;;
    esac
}

cmd_status() {
    echo -e "${YELLOW}服務狀態：${NC}"
    echo ""
    printf "%-22s %-15s %s\n" "容器" "狀態" "Port"
    echo "──────────────────────────────────────────────"
    for pair in "$DB_CONTAINER:5432" "$BACKEND_CONTAINER:8001" "$CONTROL_CONTAINER:8000" "$FRONTEND_CONTAINER:3001"; do
        name="${pair%%:*}"
        port="${pair##*:}"
        status=$(docker ps -a --filter "name=^${name}$" --format '{{.Status}}' 2>/dev/null || echo "未建立")
        [ -z "$status" ] && status="未建立"
        printf "%-22s %-15s %s\n" "$name" "$status" ":$port"
    done
    echo ""
}

# ──────────────────────────────────────────────────────────────
# Main
# ──────────────────────────────────────────────────────────────
case "${1:-start}" in
    start)   cmd_start ;;
    stop)    cmd_stop ;;
    restart) cmd_restart ;;
    build)   cmd_build ;;
    logs)    cmd_logs "$2" ;;
    status)  cmd_status ;;
    *)
        echo "用法: $0 [start|stop|restart|build|logs|status]"
        echo ""
        echo "  start    啟動所有服務（預設）"
        echo "  stop     停止所有服務"
        echo "  restart  重啟所有服務"
        echo "  build    重新建構映像並啟動（no-cache）"
        echo "  logs     查看日誌 (logs [db|backend|control|frontend|all])"
        echo "  status   顯示服務狀態"
        ;;
esac
