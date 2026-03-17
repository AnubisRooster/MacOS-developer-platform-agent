"""Unit tests for EventSource and AgentEvent."""

from __future__ import annotations

import pytest

from events.types import AgentEvent, EventSource


class TestEventSource:
    def test_all_sources_exist(self):
        expected = {"github", "jira", "jenkins", "slack", "internal"}
        actual = {e.value for e in EventSource}
        assert expected == actual

    def test_string_enum(self):
        assert EventSource.GITHUB == "github"
        assert isinstance(EventSource.SLACK, str)


class TestAgentEvent:
    def test_creation(self):
        evt = AgentEvent(source=EventSource.GITHUB, event_type="push", payload={"ref": "main"})
        assert evt.source == EventSource.GITHUB
        assert evt.event_type == "push"
        assert evt.payload == {"ref": "main"}

    def test_default_payload(self):
        evt = AgentEvent(source=EventSource.SLACK, event_type="message", payload={})
        assert evt.payload == {}

    def test_metadata_default(self):
        evt = AgentEvent(source=EventSource.JIRA, event_type="created", payload={})
        assert evt.metadata == {}
