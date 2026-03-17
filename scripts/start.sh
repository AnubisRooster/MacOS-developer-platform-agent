#!/usr/bin/env bash
# Claw Agent — Start Services on macOS
# Run from the project root: ./scripts/start.sh
# Starts IronClaw first, then backend + frontend.

set -euo pipefail

BACKEND_ONLY=false
FRONTEND_ONLY=false
SKIP_IRONCLAW=false
BACKEND_HOST="127.0.0.1"
PORT=8080
FRONTEND_PORT=3001

while [[ $# -gt 0 ]]; do
    case "$1" in
        --backend-only)  BACKEND_ONLY=true; shift ;;
        --frontend-only) FRONTEND_ONLY=true; shift ;;
        --skip-ironclaw) SKIP_IRONCLAW=true; shift ;;
        --host)          BACKEND_HOST="$2"; shift 2 ;;
        --port)          PORT="$2"; shift 2 ;;
        --frontend-port) FRONTEND_PORT="$2"; shift 2 ;;
        *) echo "Unknown option: $1"; exit 1 ;;
    esac
done

PROJECT_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
PIDS_FILE="$PROJECT_ROOT/data/.service_pids"

echo ""
echo "=== Claw Agent — Starting Services ==="

# Activate venv
VENV_ACTIVATE="$PROJECT_ROOT/.venv/bin/activate"
if [ -f "$VENV_ACTIVATE" ]; then
    source "$VENV_ACTIVATE"
    echo "  Virtual environment activated"
else
    echo "  WARNING: .venv not found. Run ./scripts/setup.sh first."
fi

mkdir -p "$PROJECT_ROOT/data"
> "$PIDS_FILE"

cleanup() {
    echo ""
    echo "Stopping services..."
    while IFS= read -r pid; do
        if kill -0 "$pid" 2>/dev/null; then
            kill "$pid" 2>/dev/null || true
            echo "  Stopped PID $pid"
        fi
    done < "$PIDS_FILE"
    rm -f "$PIDS_FILE"
    echo "Services stopped."
}
trap cleanup EXIT INT TERM

IRONCLAW_PID=""

# 1. Start IronClaw
if [ "$SKIP_IRONCLAW" = false ]; then
    IRONCLAW_EXE=""
    if command -v ironclaw &>/dev/null; then
        IRONCLAW_EXE="$(command -v ironclaw)"
    elif [ -f "$PROJECT_ROOT/dist/ironclaw" ]; then
        IRONCLAW_EXE="$PROJECT_ROOT/dist/ironclaw"
    fi

    if [ -n "$IRONCLAW_EXE" ]; then
        echo ""
        echo "[IronClaw] Starting AI engine on port 3000..."
        LIBSQL_PATH="$PROJECT_ROOT/data/ironclaw.db"
        export DATABASE_BACKEND=libsql
        export LIBSQL_PATH

        "$IRONCLAW_EXE" run >> "$PROJECT_ROOT/data/ironclaw.log" 2>&1 &
        IRONCLAW_PID=$!
        echo "$IRONCLAW_PID" >> "$PIDS_FILE"
        echo "  IronClaw started (PID: $IRONCLAW_PID)"

        echo "  Waiting for IronClaw to be ready..."
        MAX_ATTEMPTS=30
        ATTEMPT=0
        READY=false
        while [ $ATTEMPT -lt $MAX_ATTEMPTS ]; do
            if curl -sf http://127.0.0.1:3000/api/health >/dev/null 2>&1; then
                READY=true
                break
            fi
            ATTEMPT=$((ATTEMPT + 1))
            sleep 2
        done
        if [ "$READY" = true ]; then
            echo "  IronClaw is ready."
        else
            echo "  WARNING: IronClaw may not be ready (timeout). Continuing anyway."
        fi
    else
        echo ""
        echo "  WARNING: IronClaw not found. Install via: brew install ironclaw, or run build.sh."
        echo "  AI features may use OpenRouter fallback."
    fi
fi

# 2. Start backend
if [ "$FRONTEND_ONLY" = false ]; then
    echo ""
    echo "[Backend] Starting on ${BACKEND_HOST}:${PORT}..."
    python3 -m uvicorn webhooks.server:app \
        --host "$BACKEND_HOST" --port "$PORT" \
        >> "$PROJECT_ROOT/data/backend.log" 2>&1 &
    BACKEND_PID=$!
    echo "$BACKEND_PID" >> "$PIDS_FILE"
    echo "  Backend started (PID: $BACKEND_PID)"
fi

# 3. Start frontend
if [ "$BACKEND_ONLY" = false ]; then
    echo ""
    echo "[Frontend] Starting on port ${FRONTEND_PORT}..."
    cd "$PROJECT_ROOT/frontend"
    npm run dev -- --port "$FRONTEND_PORT" >> "$PROJECT_ROOT/data/frontend.log" 2>&1 &
    FRONTEND_PID=$!
    echo "$FRONTEND_PID" >> "$PIDS_FILE"
    echo "  Frontend started (PID: $FRONTEND_PID)"
    cd "$PROJECT_ROOT"
fi

echo ""
echo "=== Services Running ==="
if [ -n "$IRONCLAW_PID" ]; then
    echo "  IronClaw:  http://127.0.0.1:3000"
fi
if [ "$FRONTEND_ONLY" = false ]; then
    echo "  Backend:   http://${BACKEND_HOST}:${PORT}"
    echo "  Health:    http://${BACKEND_HOST}:${PORT}/health"
fi
if [ "$BACKEND_ONLY" = false ]; then
    echo "  Dashboard: http://localhost:${FRONTEND_PORT}"
fi
echo ""
echo "Press Ctrl+C to stop all services."
echo ""

wait
