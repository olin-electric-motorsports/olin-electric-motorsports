import pytest
import logging

from can.interface import Bus

from projects.btldr.py_client.btldr import BtldrManager
from projects.hitl.lib.hitl import HitL, PinType
from projects.hitl.lib.gpio import PinMode


@pytest.fixture(scope = "session")
def dbc():
    return "vehicle/mkvi/mkvi.dbc"


@pytest.fixture(scope = "session")
def canbus():
    bus = Bus(
        channel = "can0",
        bustype = "socketcan",
        bitrate = 500000
    )

    yield bus

    bus.shutdown()


ECUS = [
    {
        "name": "air_control",
        "btldr_id": 0x700,
        "tunable_id": 0x6e0,
        "binary": "vehicle/mkvi/software/air_control/air_control_patched.bin",
    },
    {
        "name": "bms",
        "btldr_id": 0x708,
        "tunable_id": 0x6e2,
        "binary": "vehicle/mkvi/software/bms/bms_patched.bin",
    },
    {
        "name": "throttle",
        "btldr_id": 0x728,
        "tunable_id": 0x6ea,
        "binary": "vehicle/mkvi/software/throttle/throttle_patched.bin",
    },
    {
        "name": "brakes",
        "btldr_id": 0x718,
        "tunable_id": 0x6e6,
        "binary": "vehicle/mkvi/software/brakes/brakes_patched.bin",
    },
]


@pytest.fixture(autouse = True)
def log():
    l = logging.getLogger()
    return l


@pytest.fixture(scope = "session")
def btldr(canbus):
    btldr = BtldrManager()
    btldr.canbus = canbus

    # Flash
    for ecu in ECUS:
        resp = btldr.ping(ecu["btldr_id"], 1)

        if resp:
            log.info("Found {}, flashing.".format(ecu["name"]))
        else:
            log.warning("Unable to ping {}. Is it connected?".format(ecu["name"]))

    return btldr


@pytest.fixture(scope = "session")
def rkh_pins():
    return [
        {
            "name": "start_btn",
            "pintype": PinType.DIGITAL,
            "number": 10,
            "dir": PinMode.OUTPUT,
        },
        {
            "name": "shdn_estop_driver",
            "pintype": PinType.DIGITAL,
            "number": 9,
            "dir": PinMode.OUTPUT,
        },
        {
            "name": "shdn_bots",
            "pintype": PinType.DIGITAL,
            "number": 13,
            "dir": PinMode.OUTPUT,
        },
        {
            "name": "shdn_is",
            "pintype": PinType.DIGITAL,
            "number": 14,
            "dir": PinMode.OUTPUT,
        },
        {
            "name": "brake_pressure",
            "pintype": PinType.ANALOG,
            "number": 2,
            "dir": PinMode.OUTPUT,
        },
        {
            "name": "apps_l",
            "pintype": PinType.ANALOG,
            "number": 1,
            "dir": PinMode.OUTPUT,
        },
        {
            "name": "apps_r",
            "pintype": PinType.ANALOG,
            "number": 3,
            "dir": PinMode.OUTPUT,
        },
        {
            "name": "brkpres_sel",
            "pintype": PinType.DIGITAL,
            "number": 11,
            "dir": PinMode.OUTPUT,
        },
        {
            "name": "apps_l_sel",
            "pintype": PinType.DIGITAL,
            "number": 16,
            "dir": PinMode.OUTPUT,
        },
        {
            "name": "apps_r_sel",
            "pintype": PinType.DIGITAL,
            "number": 15,
            "dir": PinMode.OUTPUT,
        },
        {
            "name": "shdn_tsms",
            "pintype": PinType.DIGITAL,
            "number": 27,
            "dir": PinMode.OUTPUT,
        },
        {
            "name": "air_n_lsd",
            "pintype": PinType.DIGITAL,
            "number": 22,
            "dir": PinMode.INPUT,
        },
        {
            "name": "imd_output",
            "pintype": PinType.DIGITAL,
            "number": 23,
            "dir": PinMode.OUTPUT,
        },
        {
            "name": "shdn_interlocks",
            "pintype": PinType.DIGITAL,
            "number": 17,
            "dir": PinMode.OUTPUT,
        },
        {
            "name": "imd_latch_status",
            "pintype": PinType.DIGITAL,
            "number": 24,
            "dir": PinMode.INPUT,
        },
        {
            "name": "precharge_lsd",
            "pintype": PinType.DIGITAL,
            "number": 25,
            "dir": PinMode.INPUT,
        },
        {
            "name": "air_n_aux",
            "pintype": PinType.DIGITAL,
            "number": 26,
            "dir": PinMode.OUTPUT,
        },
        {
            "name": "air_p_aux",
            "pintype": PinType.DIGITAL,
            "number": 7,
            "dir": PinMode.OUTPUT,
        },
        {
            "name": "i_sense_sel",
            "pintype": PinType.DIGITAL,
            "number": 28,
            "dir": PinMode.OUTPUT,
        },
        {
            "name": "i_sense",
            "pintype": PinType.ANALOG,
            "number": 4,
            "dir": PinMode.OUTPUT,
        },
        {
            "name": "led0",
            "pintype": PinType.DIGITAL,
            "number": 8,
            "dir": PinMode.OUTPUT,
        },
        {
            "name": "led1",
            "pintype": PinType.DIGITAL,
            "number": 12,
            "dir": PinMode.OUTPUT,
        },
    ]


@pytest.fixture(scope = "session")
def hitl(canbus, dbc, rkh_pins):
    print("Called")
    hitl = HitL(canbus, dbc, vbus = 5.0, pins = rkh_pins)
    hitl.canbus = canbus

    # Set initial conditions
    ## Set analog muxes to use DAC
    hitl.brake_pressure_sel.set(1)
    hitl.apps_l_sel.set(1)
    hitl.apps_r_sel.set(1)
    hitl.i_sense_sel.set(1)

    # Put DACs in correct range
    hitl.brake_pressure.set(0.5)
    hitl.apps_l.set(0.5)
    hitl.apps_r.set(0.5)
    hitl.i_sense.set(2.5)

    # Initial GPIO states
    hitl.shdn_estop_driver.set(1)
    hitl.shdn_bots.set(1)
    hitl.shdn_is.set(1)
    hitl.shdn_interlocks.set(1)

    hitl.imd_output.set(1)

    yield hitl

    hitl.close()
