import os
import pytest
import time
from formula.projects.hitl.software.hitl import CANController, IOController
# from formula.projects.microhitl import MicroHitl, Values as PinValue, PinTypes

# Allow passing in arguments
def pytest_addoption(parser):
    parser.addoption("--canbus", action="store", default="can0")
    parser.addoption("--hitl-port", action="store", default="/dev/ttyACM0")


@pytest.fixture
def candevice(request):
    return request.config.getoption("--canbus")


@pytest.fixture
def hitl_port(request):
    return request.config.getoption("--hitl-port")


@pytest.fixture
def pins():
    return {
        "PRECHARGE_CTL": [3, PinTypes.INPUT],  # PB2
        "AIR_N_LSD": [5, PinTypes.INPUT],  # PC6
        "FAULT_LED": [10, PinTypes.OUTPUT],  # PB7
        "SS_TSMS": [6, PinTypes.OUTPUT],  # PB3
        "SS_IMD_LATCH": [7, PinTypes.OUTPUT],  # PB4
        "SS_MPC": [12, PinTypes.OUTPUT],  # PB5
        "SS_TSMP": [11, PinTypes.OUTPUT],  # PB6
        "RESET": [2, PinTypes.OUTPUT],
        "BMS_SENSE": [8, PinTypes.OUTPUT],  # PC0
        "AIR_P_WELD_DETECT": [4, PinTypes.OUTPUT],  # PC4
        "AIR_N_WELD_DETECT": [13, PinTypes.OUTPUT],  # PC7
        "IMD_SENSE": [9, PinTypes.OUTPUT],  # PD0
    }


@pytest.fixture
def iocontroller(hitl_port, pins):
    ioctrl = IOController(pins)
    time.sleep(2)

    for idx, (name, info) in enumerate(pins.items()):
        ioctrl.configure_pin(info[0], info[1])

    ioctrl.write_pin(pins["RESET"][0], PinValue.HIGH)

    return ioctrl


@pytest.fixture
def canbus(candevice):
    busname = candevice or "can0"

    can = CANController("vehicle/mkvi/mkvi.dbc", busname, 500000)

    yield can

    can.stop_periodic()
