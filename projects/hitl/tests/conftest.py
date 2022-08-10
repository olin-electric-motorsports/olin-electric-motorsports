import pytest
from formula.projects.hitl.software.hitl.roadkillharness import RoadkillHarness


@pytest.fixture
def harness():
    h = RoadkillHarness(bspd)
    return h


@pytest.fixture
def bspd():
    return {
        "SHUTDOWN_SENSE_BSPD": build_pin(0, 0, "DIGITAL", "BOTH", 0, 1),
        "BSPD_CURRENT_SENSE": build_pin(0, 1, "DIGITAL", "BOTH", 0, 1),
        "BRAKELIGHT_GATE": build_pin(0, 2, "DIGITAL", "BOTH", 0, 1),
        "COOLING_PUMP_LSD": build_pin(0, 3, "DIGITAL", "BOTH", 0, 1),
    }
