#!/usr/bin/env bash
# Claw Agent — Run Tests on macOS
# Run from the project root: ./scripts/test.sh [--unit|--integration|--deployment] [--coverage] [--verbose]

set -euo pipefail

UNIT=false
INTEGRATION=false
DEPLOYMENT=false
COVERAGE=false
VERBOSE=false

while [[ $# -gt 0 ]]; do
    case "$1" in
        --unit)        UNIT=true; shift ;;
        --integration) INTEGRATION=true; shift ;;
        --deployment)  DEPLOYMENT=true; shift ;;
        --coverage)    COVERAGE=true; shift ;;
        --verbose|-v)  VERBOSE=true; shift ;;
        *) echo "Unknown option: $1"; exit 1 ;;
    esac
done

PROJECT_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

echo ""
echo "=== Claw Agent — Test Runner ==="

VENV_PYTHON="$PROJECT_ROOT/.venv/bin/python3"
if [ ! -f "$VENV_PYTHON" ]; then
    echo "  .venv not found. Using system Python."
    VENV_PYTHON="python3"
fi

cd "$PROJECT_ROOT"

PYTEST_ARGS=()

if [ "$VERBOSE" = true ]; then
    PYTEST_ARGS+=("-v")
fi

if [ "$COVERAGE" = true ]; then
    PYTEST_ARGS+=("--cov=." "--cov-report=html" "--cov-report=term-missing")
fi

if [ "$UNIT" = true ]; then
    echo ""
    echo "  Running UNIT tests..."
    "$VENV_PYTHON" -m pytest tests/unit "${PYTEST_ARGS[@]}" -m "not slow"
elif [ "$INTEGRATION" = true ]; then
    echo ""
    echo "  Running INTEGRATION tests..."
    "$VENV_PYTHON" -m pytest tests/integration "${PYTEST_ARGS[@]}"
elif [ "$DEPLOYMENT" = true ]; then
    echo ""
    echo "  Running DEPLOYMENT tests..."
    "$VENV_PYTHON" -m pytest tests/deployment "${PYTEST_ARGS[@]}" -m "deployment"
else
    echo ""
    echo "  Running ALL tests..."
    "$VENV_PYTHON" -m pytest tests/ "${PYTEST_ARGS[@]}"
fi

EXIT_CODE=$?

if [ $EXIT_CODE -eq 0 ]; then
    echo ""
    echo "=== All Tests Passed ==="
else
    echo ""
    echo "=== Some Tests Failed (exit code: $EXIT_CODE) ==="
fi

exit $EXIT_CODE
