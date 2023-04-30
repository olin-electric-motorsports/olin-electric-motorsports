import pytest
import logging
import time

from can.interface import Bus

from projects.btldr.py_client.btldr import BtldrManager
from projects.hitl.lib.hitl import HitL, PinType
from projects.hitl.lib.gpio import PinMode


@pytest.fixture(scope = "session")
def dbc():
    return "vehicle/mkvi/mkvi.dbc"


@pytest.fixture()
def canbus():
    bus = Bus(
        channel = "can0",
        bustype = "socketcan",
        bitrate = 500000
    )

    yield bus


@pytest.fixture()
def pins():
    return [
        {
            "name": "precharge_ctl",
            "pintype": PinType.DIGITAL,
            "number": 14,
            "dir": PinMode.INPUT,
        },
        {
            "name": "air_n_lsd",
            "pintype": PinType.DIGITAL,
            "number": 29,
            "dir": PinMode.INPUT,
        },
        {
            "name": "fault_led",
            "pintype": PinType.DIGITAL,
            "number": 24,
            "dir": PinMode.INPUT,
        },
        {
            "name": "ss_tsms",
            "pintype": PinType.DIGITAL,
            "number": 10,
            "dir": PinMode.OUTPUT,
        },
        {
            "name": "ss_imd_latch",
            "pintype": PinType.DIGITAL,
            "number": 15,
            "dir": PinMode.OUTPUT,
        },
        {
            "name": "ss_mpc",
            "pintype": PinType.DIGITAL,
            "number": 11,
            "dir": PinMode.OUTPUT,
        },
        {
            "name": "ss_hvd",
            "pintype": PinType.DIGITAL,
            "number": 16,
            "dir": PinMode.OUTPUT,
        },
        {
            "name": "reset",
            "pintype": PinType.DIGITAL,
            "number": 23,
            "dir": PinMode.OUTPUT,
        },
        {
            "name": "air_p_aux",
            "pintype": PinType.DIGITAL,
            "number": 30,
            "dir": PinMode.OUTPUT,
        },
        {
            "name": "air_n_aux",
            "pintype": PinType.DIGITAL,
            "number": 5,
            "dir": PinMode.OUTPUT,
        },
        {
            "name": "imd_status",
            "pintype": PinType.DIGITAL,
            "number": 28,
            "dir": PinMode.OUTPUT,
        },
        {
            "name": "ss_bms",
            "pintype": PinType.DIGITAL,
            "number": 6,
            "dir": PinMode.OUTPUT,
        },
        {
            "name": "ss_tsmp",
            "pintype": PinType.DIGITAL,
            "number": 17,
            "dir": PinMode.OUTPUT,
        },
    ]


@pytest.fixture()
def hitl(canbus, pins, dbc):
    hitl = HitL(canbus, dbc, vbus = 5.0, pins = pins)
    hitl.reset.set(1)

    yield hitl

    hitl.close()


@pytest.fixture(autouse = True)
def reset_test(hitl):
    hitl.reset.set(1)
    hitl.reset.set(0)
