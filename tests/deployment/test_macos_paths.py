"""Deployment tests: verify all path handling is macOS-compatible."""

from __future__ import annotations

import os
import sys
from pathlib import Path

import pytest


PROJECT_ROOT = Path(__file__).resolve().parent.parent.parent


@pytest.mark.deployment
class TestMacOSPaths:
    def test_project_root_exists(self):
        assert PROJECT_ROOT.exists()
        assert PROJECT_ROOT.is_dir()

    def test_no_hardcoded_windows_paths_in_python(self):
        """Scan all .py files for hardcoded Windows-specific paths."""
        windows_patterns = [
            "C:\\Users\\",
            "C:/Users/",
            "%LOCALAPPDATA%",
            "%APPDATA%",
            "\\Scripts\\",
        ]
        allowlist = {"test_", "conftest", ".spec"}
        violations = []
        for py_file in PROJECT_ROOT.rglob("*.py"):
            if ".venv" in str(py_file) or "node_modules" in str(py_file):
                continue
            if any(a in py_file.name for a in allowlist):
                continue
            try:
                content = py_file.read_text(encoding="utf-8", errors="ignore")
            except Exception:
                continue
            for pattern in windows_patterns:
                for i, line in enumerate(content.splitlines(), 1):
                    stripped = line.strip()
                    if stripped.startswith("#") or stripped.startswith('"""'):
                        continue
                    if pattern in line:
                        violations.append(f"{py_file}:{i}: {stripped}")
        assert violations == [], (
            "Hardcoded Windows paths found:\n" + "\n".join(violations[:20])
        )

    def test_no_windows_process_flags_in_python(self):
        """Ensure no CREATE_NEW_PROCESS_GROUP or other Windows-only subprocess flags."""
        violations = []
        windows_flags = ["CREATE_NEW_PROCESS_GROUP", "CREATE_NO_WINDOW", "DETACHED_PROCESS"]
        for py_file in PROJECT_ROOT.rglob("*.py"):
            if ".venv" in str(py_file) or "node_modules" in str(py_file):
                continue
            if "test_" in py_file.name:
                continue
            try:
                content = py_file.read_text(encoding="utf-8", errors="ignore")
            except Exception:
                continue
            for flag in windows_flags:
                for i, line in enumerate(content.splitlines(), 1):
                    if flag in line and not line.strip().startswith("#"):
                        violations.append(f"{py_file}:{i}: {line.strip()}")
        assert violations == [], (
            "Windows-only process flags found:\n" + "\n".join(violations[:20])
        )

    def test_pathlib_used_for_file_operations(self):
        """Verify key modules use pathlib.Path instead of os.path.join."""
        key_modules = [
            PROJECT_ROOT / "backend" / "main.py",
            PROJECT_ROOT / "backend" / "database" / "models.py",
            PROJECT_ROOT / "backend" / "workflows" / "loader.py",
            PROJECT_ROOT / "backend" / "workflows" / "engine.py",
        ]
        for mod_path in key_modules:
            if not mod_path.exists():
                continue
            content = mod_path.read_text(encoding="utf-8")
            if "os.path.join" in content:
                pytest.fail(f"{mod_path.name} uses os.path.join instead of pathlib.Path")

    def test_scripts_are_bash(self):
        """Verify all scripts in scripts/ are Bash, not PowerShell."""
        scripts_dir = PROJECT_ROOT / "scripts"
        if not scripts_dir.exists():
            pytest.skip("scripts/ directory not found")
        shell_scripts = list(scripts_dir.glob("*.sh"))
        ps_scripts = list(scripts_dir.glob("*.ps1"))
        assert len(shell_scripts) > 0, "No .sh scripts found in scripts/"
        assert len(ps_scripts) == 0, f"PowerShell scripts found in Mac project: {ps_scripts}"
        for script in shell_scripts:
            first_line = script.read_text(encoding="utf-8").split("\n", 1)[0]
            assert "bash" in first_line or "sh" in first_line, (
                f"{script.name} does not have a proper bash shebang: {first_line}"
            )

    def test_start_new_session_used_for_child_processes(self):
        """Verify backend/main.py uses start_new_session for subprocess management."""
        main_py = PROJECT_ROOT / "backend" / "main.py"
        if not main_py.exists():
            pytest.skip("backend/main.py not found")
        content = main_py.read_text(encoding="utf-8")
        assert "start_new_session=True" in content, (
            "backend/main.py should use start_new_session=True for child processes on macOS"
        )

    def test_data_directory_creation(self, tmp_path, monkeypatch):
        """Verify the database module can create data directories on macOS."""
        monkeypatch.setenv("DATABASE_URL", "")
        monkeypatch.chdir(tmp_path)

        import backend.database.models as db
        db._engine = None
        db._SessionLocal = None
        engine = db.get_engine()
        assert engine is not None

    def test_workflow_yaml_paths_resolve(self):
        """Verify workflow directory glob works on macOS."""
        wf_dir = PROJECT_ROOT / "backend" / "workflows"
        if wf_dir.exists():
            yamls = list(wf_dir.glob("*.yaml"))
            assert len(yamls) > 0, "No YAML files found in workflows/"

    def test_config_yaml_path(self):
        config_path = PROJECT_ROOT / "config" / "config.yaml"
        if config_path.exists():
            import yaml
            data = yaml.safe_load(config_path.read_text(encoding="utf-8"))
            assert isinstance(data, dict)

    def test_launcher_uses_library_application_support(self):
        """Verify the packaged launcher falls back to ~/Library/Application Support."""
        launcher_path = PROJECT_ROOT / "packaging" / "launcher.py"
        if not launcher_path.exists():
            pytest.skip("packaging/launcher.py not found")
        content = launcher_path.read_text(encoding="utf-8")
        assert "Library" in content and "Application Support" in content, (
            "launcher.py should fall back to ~/Library/Application Support on macOS"
        )
        assert "LOCALAPPDATA" not in content, (
            "launcher.py should not reference Windows LOCALAPPDATA"
        )
