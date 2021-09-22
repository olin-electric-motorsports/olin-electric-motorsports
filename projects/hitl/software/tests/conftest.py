import pytest
from hitl.roadkillharness import RoadkillHarness


@pytest.fixture
def harness():
    h = RoadkillHarness()
    return h
