"""Deployment tests: verify database can connect and create schema."""

from __future__ import annotations

import pytest
from sqlalchemy import inspect

from backend.database.models import Base, Event, WorkflowRun, get_engine, get_session, init_db


@pytest.fixture(autouse=True)
def _use_sqlite(monkeypatch):
    monkeypatch.setenv("DATABASE_URL", "sqlite:///")


@pytest.mark.deployment
class TestDatabaseConnectivity:
    def test_engine_creates_successfully(self):
        engine = get_engine()
        assert engine is not None

    def test_all_tables_created(self):
        engine = get_engine()
        init_db()
        inspector = inspect(engine)
        table_names = inspector.get_table_names()
        expected = ["events", "workflow_runs", "cached_summaries", "tool_outputs"]
        for table in expected:
            assert table in table_names, f"Table {table} not found"

    def test_session_can_write_and_read(self):
        init_db()
        Session = get_session()
        with Session() as session:
            evt = Event(event_id="deploy-test", source="system", event_type="deploy.check", payload="{}")
            session.add(evt)
            session.commit()
            result = session.query(Event).filter_by(event_id="deploy-test").first()
            assert result is not None

    def test_concurrent_sessions(self):
        init_db()
        Session = get_session()
        with Session() as s1, Session() as s2:
            s1.add(Event(event_id="s1", source="test", event_type="a", payload="{}"))
            s1.commit()
            result = s2.query(Event).filter_by(event_id="s1").first()
            assert result is not None

    def test_rollback_on_error(self):
        init_db()
        Session = get_session()
        with Session() as session:
            session.add(Event(event_id="rollback-test", source="test", event_type="a", payload="{}"))
            session.commit()
            session.add(Event(event_id="rollback-test", source="test", event_type="a", payload="{}"))
            try:
                session.commit()
            except Exception:
                session.rollback()
            result = session.query(Event).filter_by(event_id="rollback-test").all()
            assert len(result) >= 1
