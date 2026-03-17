# Architecture Decision Records

This document captures key architectural decisions for the **macOS edition** of the Developer AI Platform. Each decision records context, the chosen approach, and trade-offs considered.

---

## ADR-001: Separate Platform-Specific Editions (Mac vs Windows)

**Date:** 2026-03-16  
**Status:** Accepted

### Context

The Developer AI Platform was originally built as a Windows-specific project with PowerShell scripts, Windows process management (`CREATE_NEW_PROCESS_GROUP`), and Windows-specific packaging (`ClawAgent.exe` via PyInstaller). We need to support macOS developers with equivalent functionality.

### Decision

Maintain **separate project directories** for each platform edition (`Windows-developer-platform-agent`, `Mac-developer-platform-agent`) rather than a single cross-platform codebase with conditional logic.

### Rationale

- **Scripts are fundamentally different.** PowerShell and Bash are not translatable by abstraction layers; each platform needs idiomatic scripts.
- **Packaging differs.** Windows uses `.exe` via PyInstaller with `%LOCALAPPDATA%` fallback; macOS uses Unix binaries with `~/Library/Application Support` fallback.
- **Process management differs.** Windows uses `CREATE_NEW_PROCESS_GROUP`; macOS uses `start_new_session` + `os.killpg` with POSIX signals.
- **Deployment tests are platform-specific.** Each edition validates its own path conventions, binary formats, and platform assumptions.
- **Core Python backend and frontend are shared.** The application logic (FastAPI, SQLAlchemy, integrations, workflows, knowledge graph) uses `pathlib` and is platform-agnostic.

### Trade-offs

- **Duplication:** Core backend/frontend code is copied, not symlinked. Changes to shared logic must be applied to both editions.
- **Alternative considered:** A single repo with platform-conditional scripts and a thin platform abstraction layer. Rejected because it adds complexity to the build and test pipeline with minimal benefit at this scale.

---

## ADR-002: POSIX Process Group Management on macOS

**Date:** 2026-03-16  
**Status:** Accepted

### Context

The platform manages child processes (IronClaw, cloudflared) that must be reliably stopped when the backend exits. On Windows, `CREATE_NEW_PROCESS_GROUP` isolates child processes. macOS needs an equivalent mechanism.

### Decision

Use `start_new_session=True` in `subprocess.Popen` and `os.killpg(os.getpgid(pid), signal.SIGTERM)` for cleanup.

### Rationale

- `start_new_session=True` calls `os.setsid()` in the child, creating a new process group. This is the POSIX equivalent of Windows `CREATE_NEW_PROCESS_GROUP`.
- `os.killpg` sends signals to the entire process group, ensuring child processes spawned by IronClaw or cloudflared are also cleaned up.
- Graceful shutdown uses `SIGTERM` first, then `SIGKILL` after a 5-second timeout.

### Trade-offs

- On Linux (if the codebase is ever used there), `start_new_session=True` works identically. This is more portable than the Windows approach.
- If `os.getpgid` fails (process already exited), we fall back to `proc.kill()`.

---

## ADR-003: Bash Scripts for macOS Automation

**Date:** 2026-03-16  
**Status:** Accepted

### Context

The Windows edition uses PowerShell scripts (`.ps1`) for setup, start, stop, test, and build automation. macOS needs equivalent automation.

### Decision

Provide Bash scripts (`.sh`) in the `scripts/` directory with `set -euo pipefail` for safety and argument parsing via `while/case` for flags.

### Scripts

| Script | Purpose | Key Flags |
|--------|---------|-----------|
| `setup.sh` | Create venv, install deps, copy `.env`, install frontend | — |
| `start.sh` | Start IronClaw + backend + frontend | `--backend-only`, `--frontend-only`, `--skip-ironclaw`, `--host`, `--port` |
| `stop.sh` | Stop all services by PID file or port scan | — |
| `test.sh` | Run pytest with category and coverage flags | `--unit`, `--integration`, `--deployment`, `--coverage`, `--verbose` |
| `build.sh` | Build frontend, download IronClaw, PyInstaller, assemble portable | `--skip-frontend`, `--skip-ironclaw`, `--ironclaw-version` |

### Rationale

- Bash is the default shell on macOS (via `/bin/bash` or Homebrew's `bash`).
- `set -euo pipefail` catches errors early without silent failures.
- PID tracking in `start.sh` allows `stop.sh` to reliably terminate services even if port-based detection fails.
- `build.sh` auto-detects Apple Silicon (`arm64`) vs Intel (`x86_64`) via `uname -m` to download the correct IronClaw binary.

### Trade-offs

- zsh is the default login shell on modern macOS, but Bash scripts work via the shebang (`#!/usr/bin/env bash`).
- Alternative considered: Makefile. Rejected because the scripts require conditional logic and user-facing output that are cleaner in Bash.

---

## ADR-004: Application Data Fallback Path

**Date:** 2026-03-16  
**Status:** Accepted

### Context

The packaged launcher needs a writable directory for data (database, logs, config). It should work both in a user-writable directory (portable mode) and when running from a read-only location.

### Decision

Try `./data` (adjacent to the executable) first. If not writable, fall back to `~/Library/Application Support/ClawAgent`.

### Rationale

- `~/Library/Application Support` is the macOS convention for per-user application data (equivalent to Windows `%LOCALAPPDATA%`).
- Portable mode (data next to executable) is preferred for development and self-contained distribution.
- The write-test approach (create + delete a temp file) is used to detect writability without depending on file permission checks that may be unreliable on network volumes.

### Trade-offs

- Alternative considered: Always use `~/Library/Application Support`. Rejected because portable mode is more convenient for development and testing.
- Alternative considered: XDG directories (`~/.local/share`). Rejected because macOS does not follow XDG conventions; `~/Library/Application Support` is idiomatic.

---

## ADR-005: IronClaw Binary Architecture Detection

**Date:** 2026-03-16  
**Status:** Accepted

### Context

Apple transitioned from Intel (`x86_64`) to Apple Silicon (`aarch64`/`arm64`). The build script must download the correct IronClaw binary.

### Decision

Use `uname -m` at build time to detect the architecture and download the matching release artifact.

### Mapping

| `uname -m` | IronClaw Target |
|-------------|----------------|
| `arm64` | `ironclaw-aarch64-apple-darwin` |
| `x86_64` | `ironclaw-x86_64-apple-darwin` |

### Rationale

- `uname -m` is reliable on macOS for detecting the native architecture.
- Rosetta 2 compatibility: if a user runs a terminal under Rosetta, `uname -m` reports `x86_64` and the Intel binary is correct for that context.

### Trade-offs

- Universal binaries were considered but are not available for IronClaw.
- If IronClaw adds a universal binary in the future, the script can be simplified.

---

## ADR-006: pathlib for All File System Operations

**Date:** 2026-03-16  
**Status:** Accepted (inherited from Windows edition)

### Context

Cross-platform file system operations can break when using string concatenation or `os.path.join` with platform-specific separators.

### Decision

Use `pathlib.Path` exclusively for all file system operations in the Python backend. The deployment test suite (`test_macos_paths.py`) verifies this.

### Rationale

- `pathlib.Path` handles path separators, home directory expansion, and path joining correctly on all platforms.
- Enables shared backend code between Windows and macOS editions.
- Deployment tests scan for `os.path.join` in key modules and flag violations.

---

## ADR-007: Deployment Test Strategy for macOS

**Date:** 2026-03-16  
**Status:** Accepted

### Context

The Windows edition has `test_windows_paths.py` that scans for hardcoded Unix paths and verifies Windows compatibility. The macOS edition needs equivalent guards.

### Decision

Replace `test_windows_paths.py` with `test_macos_paths.py` that:

1. Scans for hardcoded Windows paths (`C:\Users\`, `%LOCALAPPDATA%`, `.exe`, `\Scripts\`).
2. Scans for Windows-only subprocess flags (`CREATE_NEW_PROCESS_GROUP`).
3. Verifies scripts are Bash (`.sh`), not PowerShell (`.ps1`).
4. Verifies `start_new_session=True` is used for child processes.
5. Verifies the launcher falls back to `~/Library/Application Support`.
6. Validates `pathlib` usage and config file parsing (inherited from Windows tests).

### Rationale

- Platform-specific deployment tests catch regressions that general unit/integration tests miss.
- Scanning source code for platform-specific patterns is a lightweight but effective guard.
- These tests run in the `deployment` marker category and can be included in CI for the macOS build.

---

## ADR-008: Homebrew as the Primary Package Manager

**Date:** 2026-03-16  
**Status:** Accepted

### Context

The Windows edition recommends `winget` for installing prerequisites. macOS needs an equivalent recommendation.

### Decision

Recommend [Homebrew](https://brew.sh) as the primary package manager for installing Python, Node.js, PostgreSQL, Redis, and cloudflared.

### Rationale

- Homebrew is the de facto standard package manager on macOS.
- All platform prerequisites are available via Homebrew formulae.
- `cloudflared` is available via the `cloudflare/cloudflare` tap.

### Trade-offs

- MacPorts is an alternative but has significantly lower adoption among developers.
- Direct downloads from official sites are always an option and are documented as alternatives.

---

## Decision Log Summary

| ADR | Decision | Status |
|-----|----------|--------|
| 001 | Separate platform-specific editions | Accepted |
| 002 | POSIX process group management | Accepted |
| 003 | Bash scripts for automation | Accepted |
| 004 | `~/Library/Application Support` fallback | Accepted |
| 005 | `uname -m` architecture detection | Accepted |
| 006 | `pathlib` for all file operations | Accepted |
| 007 | macOS-specific deployment tests | Accepted |
| 008 | Homebrew as package manager | Accepted |
