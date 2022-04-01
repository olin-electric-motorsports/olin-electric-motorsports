import os
import pytest
import time
from formula.projects.hitl.software.hitl import CANController
from formula.projects.hitl.software.hitl import IOController

# Allow passing in arguments
def pytest_addoption(parser):
    parser.addoption("--canbus", action="store", default="can0")
    parser.addoption("--hitl-port", action="store", default="/dev/ttyACM0")


@pytest.fixture
def candevice(request):
    return request.config.getoption("--canbus")


@pytest.fixture
def iocontroller():
    ioctrl = IOController()
    return ioctrl


@pytest.fixture
def canbus(candevice):
    busname = candevice or "can0"

    can = CANController("vehicle/mkv/mkv.dbc", busname, 500000)

    yield can

    can.stop_periodic()
