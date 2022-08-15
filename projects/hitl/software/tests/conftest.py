import pytest
import logging
from projects.hitl.software.hitl.hitl import Hitl
from projects.hitl.software.hitl.utils import build_pin, get_logging_config
from projects.hitl.software.hitl.iocontroller import PinMode, PinType


@pytest.fixture(scope="session")
def hitl(bspd, dbc):
    hitl = Hitl(bspd, dbc)
    yield hitl

    hitl.close()


@pytest.fixture
def dbc():
    return "vehicle/mkv/mkv.dbc"


@pytest.fixture
def bspd():
    return {
        "SHUTDOWN_SENSE_BSPD": build_pin(0, 0, PinType.DIGITAL, PinMode.BOTH, 0, 1),
        "BSPD_CURRENT_SENSE": build_pin(0, 1, PinType.DIGITAL, PinMode.BOTH, 0, 1),
        "BRAKELIGHT_GATE": build_pin(0, 2, PinType.DIGITAL, PinMode.BOTH, 0, 1),
        "COOLING_PUMP_LSD": build_pin(0, 3, PinType.DIGITAL, PinMode.BOTH, 0, 1),
    }


@pytest.fixture(scope="module")
def logger():
    get_logging_config()
    l = logging.getLogger(name=__name__)
    return l
