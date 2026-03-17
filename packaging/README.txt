================================================================================
  Claw Agent - macOS Developer Platform
================================================================================

QUICK START
-----------
1. Open Terminal, cd to this folder, and run: ./ClawAgent
2. Open http://localhost:8080 in your browser
3. For AI features (IronClaw), run "ironclaw run" in a separate terminal (see below)


IRONCLAW (AI ENGINE)
--------------------
IronClaw powers the AI assistant. It is included in this package.

To start IronClaw:
  1. Open Terminal
  2. cd to this folder
  3. Run: ./ironclaw run

  Or add the folder to PATH and run "ironclaw run" from anywhere.

On first run, IronClaw may prompt for setup (database, model). Use the default
options or follow the wizard.

Alternative: Add OPENROUTER_API_KEY to a .env file in this folder for
cloud-based AI fallback when IronClaw is not running.


MANUAL IRONCLAW INSTALL (optional)
----------------------------------
If you prefer the official IronClaw installer or a newer version:

  curl -fsSL https://github.com/nearai/ironclaw/releases/download/v0.18.0/ironclaw-installer.sh | bash

Or download from: https://github.com/nearai/ironclaw/releases


UPDATING IRONCLAW
-----------------
To upgrade IronClaw:
  - Re-run the installer command above, or
  - Replace the ironclaw binary in this folder with the new build from GitHub releases


DATA & CONFIGURATION
--------------------
- Data (database, model config) is stored in the "data" folder
- If the data folder is not writable, data falls back to ~/Library/Application Support/ClawAgent
- To use a custom location, set CLAW_DATA_DIR before starting
- Model configuration can be changed in the dashboard at http://localhost:8080


PORTS
-----
- Claw Agent: http://127.0.0.1:8080
- IronClaw (when running): http://127.0.0.1:3000


TROUBLESHOOTING
---------------
- Port 8080 in use: Set CLAW_PORT=8081 (or another port) before starting
- IronClaw not found: Ensure the ironclaw binary is in this folder or in your PATH
- Dashboard not loading: Check that ClawAgent started without errors
- Permission denied: Run "chmod +x ClawAgent ironclaw" to make the binaries executable
- Apple Silicon: This package includes a universal or arm64 binary; if you see
  architecture errors, download the correct build from GitHub releases
