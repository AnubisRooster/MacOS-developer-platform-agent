#!/usr/bin/env bash
# Claw Agent — Stop Services on macOS
# Run from the project root: ./scripts/stop.sh
# Stops IronClaw (3000), Backend (8080), Frontend (3001)

echo ""
echo "=== Claw Agent — Stopping Services ==="

PROJECT_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
PIDS_FILE="$PROJECT_ROOT/data/.service_pids"
STOPPED=0

# Stop by PID file if available
if [ -f "$PIDS_FILE" ]; then
    while IFS= read -r pid; do
        if [ -n "$pid" ] && kill -0 "$pid" 2>/dev/null; then
            kill "$pid" 2>/dev/null || true
            echo "  Stopped process PID $pid"
            STOPPED=$((STOPPED + 1))
        fi
    done < "$PIDS_FILE"
    rm -f "$PIDS_FILE"
fi

# Also stop by port (lsof) as a fallback
for PORT in 3000 8080 3001; do
    PID=$(lsof -ti ":$PORT" 2>/dev/null || true)
    if [ -n "$PID" ]; then
        kill "$PID" 2>/dev/null || true
        echo "  Stopped process on port $PORT (PID $PID)"
        STOPPED=$((STOPPED + 1))
    fi
done

if [ "$STOPPED" -eq 0 ]; then
    echo "  No Claw Agent processes found on ports 3000, 8080, 3001."
fi

echo ""
echo "=== Done ==="
