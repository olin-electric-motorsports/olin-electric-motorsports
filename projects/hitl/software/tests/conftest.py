import pytest
from RoadkillHarness import RoadkillHarness


@pytest.fixture
def harness():
    h = RoadkillHarness(real = False)
    return h
