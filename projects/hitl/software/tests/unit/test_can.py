# Base/extended python imports
import pytest
import os
import time
import logging
from configparser import ConfigParser
from can import Message

# Project Imports
from hitl.cancontroller import CANController
from hitl.ecu import ECU
from hitl.utils import get_logging_config, artifacts_path

config = ConfigParser(interpolation=None)
config.read(os.path.join(artifacts_path, "config.ini"))


@pytest.fixture
def can():
    path = os.path.abspath(os.path.dirname(__file__) + "/dash.dbc")

    ecus = {}
    ecus["throttle"] = ECU(name="throttle")
    ecus["dashboard"] = ECU(name="dashboard")
    ecus["air_ctrl"] = ECU(name="air_ctrl")
    ecus["bms_core"] = ECU(name="bms_core")
    ecus["brakelight_bspd"] = ECU(name="brakelight_bspd")

    out = CANController(
        ecus=ecus,
        can_spec_path=path,
        channel=config.get("HARDWARE", "can_channel", fallback="vcan0"),
        bitrate=config.get("HARDWARE", "can_bitrate", fallback="500000"),
    )

    return out


@pytest.fixture
def logger():
    get_logging_config()
    l = logging.getLogger(name=__name__)
    return l


@pytest.mark.soft
@pytest.mark.unit
def test_get_states(can, logger):
    logger.info("Testing get_states...")
    assert "ThrottlePos" in can.ecus["throttle"].states
    assert "SteeringPos" in can.ecus["dashboard"].states


@pytest.mark.soft
@pytest.mark.unit
def test_update_ecu(can, logger):
    logger.info("Testing update_ecu...")

    test1 = Message(arbitration_id=12, data=[0, 128, 255, 0, 0])
    can._update_ecu(test1)
    assert can.ecus["throttle"].get_state("ThrottlePos") == 128
    assert can.ecus["throttle"].get_state("BotsSense") == 255

    test2 = Message(arbitration_id=12, data=[0, 255, 0, 0, 0])
    can._update_ecu(test2)
    assert can.ecus["throttle"].get_state("ThrottlePos") == 255
