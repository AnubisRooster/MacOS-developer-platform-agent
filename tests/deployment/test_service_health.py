"""Deployment tests: verify services can start and respond to health checks."""

from __future__ import annotations

import pytest
from fastapi.testclient import TestClient

from webhooks.server import create_app


@pytest.mark.deployment
class TestServiceHealth:
    @pytest.fixture
    def app(self):
        return create_app(
            orchestrator=None,
            event_bus=None,
            workflow_engine=None,
            ironclaw_client=None,
        )

    def test_webhook_server_health(self, app):
        client = TestClient(app)
        resp = client.get("/health")
        assert resp.status_code == 200
        data = resp.json()
        assert data["status"] == "ok"

    def test_webhook_server_accepts_github_post(self, app):
        client = TestClient(app)
        resp = client.post(
            "/webhooks/github",
            json={"action": "ping"},
            headers={"X-GitHub-Event": "ping"},
        )
        assert resp.status_code in (200, 503)

    def test_all_webhook_endpoints_exist(self, app):
        client = TestClient(app)
        endpoints = ["/webhooks/github", "/webhooks/jira", "/webhooks/jenkins", "/webhooks/slack"]
        for ep in endpoints:
            resp = client.post(ep, json={})
            assert resp.status_code in (200, 503), f"{ep} returned {resp.status_code}"
