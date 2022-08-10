import pytest
from hitl.hitl import Hitl
from hitl.utils import build_pin
from hitl.iocontroller import PinMode, PinType


@pytest.fixture
def hitl(bspd, dbc):
    hitl = Hitl(bspd, dbc)
    yield hitl

    hitl.close()


@pytest.fixture
def dbc():
    return "tests/mkv.dbc"


@pytest.fixture
def bspd():
    return {
        "SHUTDOWN_SENSE_BSPD": build_pin(0, 0, PinType.DIGITAL, PinMode.BOTH, 0, 1),
        "BSPD_CURRENT_SENSE": build_pin(0, 1, PinType.DIGITAL, PinMode.BOTH, 0, 1),
        "BRAKELIGHT_GATE": build_pin(0, 2, PinType.DIGITAL, PinMode.BOTH, 0, 1),
        "COOLING_PUMP_LSD": build_pin(0, 3, PinType.DIGITAL, PinMode.BOTH, 0, 1),
    }
