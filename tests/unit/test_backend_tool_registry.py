"""Unit tests for backend tools/registry module."""

from __future__ import annotations

import pytest

from tools.registry import ToolEntry, ToolRegistry, ToolSchema


class TestToolSchema:
    def test_creation(self):
        schema = ToolSchema(name="test", description="A test tool", parameters={"type": "object"})
        assert schema.name == "test"
        assert schema.description == "A test tool"
        assert schema.parameters == {"type": "object"}

    def test_default_parameters(self):
        schema = ToolSchema(name="t", description="d")
        assert schema.parameters == {"type": "object", "properties": {}, "required": []}


class TestToolEntry:
    def test_creation(self):
        schema = ToolSchema(name="x", description="do x")
        handler = lambda: "done"
        entry = ToolEntry(name="x", handler=handler, schema=schema)
        assert entry.schema.name == "x"
        assert entry.handler() == "done"


class TestBackendToolRegistry:
    def test_register_and_get_handler(self):
        reg = ToolRegistry()
        handler = lambda: "result"
        schema = ToolSchema("my_tool", "My tool", {"type": "object"})
        reg.register("my_tool", handler, schema)
        assert reg.get_handler("my_tool") is handler

    def test_get_handler_unknown(self):
        reg = ToolRegistry()
        assert reg.get_handler("nope") is None

    def test_get_all_schemas(self):
        reg = ToolRegistry()
        reg.register("a", lambda: None, ToolSchema("a", "tool a"))
        reg.register("b", lambda: None, ToolSchema("b", "tool b", {"type": "object"}))
        schemas = reg.get_all_schemas()
        assert len(schemas) == 2
        names = [s["name"] for s in schemas]
        assert "a" in names
        assert "b" in names

    def test_overwrite_tool(self):
        reg = ToolRegistry()
        reg.register("x", lambda: 1, ToolSchema("x", "v1"))
        reg.register("x", lambda: 2, ToolSchema("x", "v2"))
        assert reg.get_handler("x")() == 2
        schemas = reg.get_all_schemas()
        assert len(schemas) == 1
        assert schemas[0]["description"] == "v2"
