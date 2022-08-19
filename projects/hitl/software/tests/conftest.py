import pytest
import logging
from projects.hitl.software.hitl.cancontroller import CANController
from projects.hitl.software.hitl.iocontroller import IOController
from projects.hitl.software.hitl.utils import build_pin, get_logging_config
from projects.hitl.software.hitl.iocontroller import PinMode, PinType


@pytest.fixture(scope="session")
def can():
    can = CANController() 
    yield can
    can.close()

can2 = can

@pytest.fixture(scope="session")
def io():
    io = IOController() 
    yield io
    io.close()

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
