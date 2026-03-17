#!/usr/bin/env bash
# Claw Agent — macOS Setup Script
# Run from the project root: ./scripts/setup.sh

set -euo pipefail

PROJECT_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

echo ""
echo "=== Claw Agent macOS Setup ==="
echo ""

# 1. Check Python
echo "[1/6] Checking Python..."
if command -v python3 &>/dev/null; then
    PY_VERSION=$(python3 --version 2>&1)
    echo "  Found: $PY_VERSION"
else
    echo "  Python 3 not found. Install with:"
    echo "    brew install python@3.13"
    echo "  Or download from https://www.python.org/downloads/"
    exit 1
fi

# 2. Check Node.js
echo ""
echo "[2/6] Checking Node.js..."
if command -v node &>/dev/null; then
    NODE_VERSION=$(node --version 2>&1)
    echo "  Found: Node.js $NODE_VERSION"
else
    echo "  Node.js not found. Install with:"
    echo "    brew install node@20"
    echo "  Or download from https://nodejs.org/"
    exit 1
fi

# 3. Create virtual environment
echo ""
echo "[3/6] Creating Python virtual environment..."
cd "$PROJECT_ROOT"
if [ ! -d ".venv" ]; then
    python3 -m venv .venv
    echo "  Created .venv"
else
    echo "  .venv already exists"
fi

# 4. Install Python dependencies
echo ""
echo "[4/6] Installing Python dependencies..."
.venv/bin/pip install --upgrade pip
.venv/bin/pip install -r requirements.txt
.venv/bin/pip install -r requirements-dev.txt
echo "  Dependencies installed"

# 5. Set up .env
echo ""
echo "[5/6] Setting up .env file..."
if [ ! -f ".env" ]; then
    cp .env.example .env
    echo "  Copied .env.example -> .env"
    echo "  IMPORTANT: Edit .env with your API keys and tokens"
else
    echo "  .env already exists"
fi

# 6. Install frontend dependencies
echo ""
echo "[6/6] Installing frontend dependencies..."
cd frontend
npm install
cd "$PROJECT_ROOT"
echo "  Frontend dependencies installed"

echo ""
echo "=== Setup Complete ==="
echo ""
echo "Next steps:"
echo "  1. Edit .env with your API keys"
echo "  2. (Optional) Install PostgreSQL: brew install postgresql@16"
echo "  3. Run: ./scripts/start.sh"
echo "  4. Run tests: ./scripts/test.sh"
echo ""
