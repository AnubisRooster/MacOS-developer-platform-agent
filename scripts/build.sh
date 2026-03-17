#!/usr/bin/env bash
# Claw Agent — Build distributable package for macOS
# Run from project root: ./scripts/build.sh [--skip-frontend] [--skip-ironclaw]

set -euo pipefail

SKIP_FRONTEND=false
SKIP_IRONCLAW=false
IRONCLAW_VERSION="v0.18.0"

while [[ $# -gt 0 ]]; do
    case "$1" in
        --skip-frontend)  SKIP_FRONTEND=true; shift ;;
        --skip-ironclaw)  SKIP_IRONCLAW=true; shift ;;
        --ironclaw-version) IRONCLAW_VERSION="$2"; shift 2 ;;
        *) echo "Unknown option: $1"; exit 1 ;;
    esac
done

PROJECT_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

echo ""
echo "=== Claw Agent Build ==="
echo "Project root: $PROJECT_ROOT"

# 1. Build frontend
if [ "$SKIP_FRONTEND" = false ]; then
    echo ""
    echo "[1/4] Building frontend (Next.js static export)..."
    cd "$PROJECT_ROOT/frontend"
    npm run build
    if [ ! -d "out" ]; then
        echo "  ERROR: Frontend build did not produce 'out' directory"
        exit 1
    fi
    echo "  Frontend built successfully"
    cd "$PROJECT_ROOT"
else
    echo ""
    echo "[1/4] Skipping frontend build"
fi

# 2. Download IronClaw
DIST_DIR="$PROJECT_ROOT/dist"
IRONCLAW_BIN="$DIST_DIR/ironclaw"
if [ "$SKIP_IRONCLAW" = false ]; then
    echo ""
    echo "[2/4] Downloading IronClaw macOS binary..."
    mkdir -p "$DIST_DIR"

    ARCH=$(uname -m)
    if [ "$ARCH" = "arm64" ]; then
        IRONCLAW_TARGET="ironclaw-aarch64-apple-darwin"
    else
        IRONCLAW_TARGET="ironclaw-x86_64-apple-darwin"
    fi

    IRONCLAW_URL="https://github.com/nearai/ironclaw/releases/download/$IRONCLAW_VERSION/${IRONCLAW_TARGET}.tar.gz"
    TAR_PATH="$DIST_DIR/ironclaw.tar.gz"

    if curl -fSL "$IRONCLAW_URL" -o "$TAR_PATH"; then
        tar -xzf "$TAR_PATH" -C "$DIST_DIR"
        EXTRACTED=$(find "$DIST_DIR" -name "ironclaw" -type f -not -name "*.tar.gz" | head -1)
        if [ -n "$EXTRACTED" ] && [ "$EXTRACTED" != "$IRONCLAW_BIN" ]; then
            mv "$EXTRACTED" "$IRONCLAW_BIN"
        fi
        chmod +x "$IRONCLAW_BIN"
        rm -f "$TAR_PATH"
        find "$DIST_DIR" -name "ironclaw_extract" -type d -exec rm -rf {} + 2>/dev/null || true
        if [ -f "$IRONCLAW_BIN" ]; then
            echo "  IronClaw downloaded to dist/ironclaw ($ARCH)"
        else
            echo "  WARNING: Could not extract ironclaw from archive"
        fi
    else
        echo "  WARNING: Could not download IronClaw from $IRONCLAW_URL"
    fi
else
    echo ""
    echo "[2/4] Skipping IronClaw download"
fi

# 3. Build Python executable
echo ""
echo "[3/4] Building Python executable with PyInstaller..."
cd "$PROJECT_ROOT"
if ! command -v pyinstaller &>/dev/null; then
    pip install pyinstaller
fi
python3 -m PyInstaller packaging/ClawAgent.spec --noconfirm --clean
if [ ! -f "$DIST_DIR/ClawAgent" ]; then
    echo "  ERROR: PyInstaller did not produce ClawAgent"
    exit 1
fi
echo "  ClawAgent built successfully"

# 4. Assemble portable package
echo ""
echo "[4/4] Assembling portable package..."
PORTABLE_DIR="$DIST_DIR/ClawAgent-Portable"
mkdir -p "$PORTABLE_DIR/data"
cp "$DIST_DIR/ClawAgent" "$PORTABLE_DIR/ClawAgent"
chmod +x "$PORTABLE_DIR/ClawAgent"
if [ -f "$IRONCLAW_BIN" ]; then
    cp "$IRONCLAW_BIN" "$PORTABLE_DIR/ironclaw"
    chmod +x "$PORTABLE_DIR/ironclaw"
fi
cp "$PROJECT_ROOT/packaging/README.txt" "$PORTABLE_DIR/README.txt"

echo "  Portable package: dist/ClawAgent-Portable/"

echo ""
echo "=== Build Complete ==="
echo "  Executable: dist/ClawAgent"
echo "  Portable:   dist/ClawAgent-Portable/"
echo ""
echo "Run ./dist/ClawAgent and open http://localhost:8080 in your browser."
echo "For AI features, run 'ironclaw run' in a separate terminal (see README.txt)."
echo ""
