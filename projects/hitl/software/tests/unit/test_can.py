# Base/extended python imports
import pytest
import os
import time
import logging
from configparser import ConfigParser
from can import Message

# Project Imports
from hitl.cancontroller import CANController
from hitl.utils import get_logging_config, artifacts_path

config = ConfigParser(interpolation=None)
config.read(os.path.join(artifacts_path, "config.ini"))


@pytest.fixture
def can():
    path = os.path.abspath(os.path.dirname(__file__) + "/dash.dbc")

    out = CANController(
        can_spec_path=path,
        channel=config.get("HARDWARE", "can_channel", fallback="vcan0"),
        bitrate=config.get("HARDWARE", "can_bitrate", fallback="500000"),
    )

    return out

can2 = can


@pytest.fixture
def logger():
    get_logging_config()
    l = logging.getLogger(name=__name__)
    return l


@pytest.mark.soft
@pytest.mark.unit
def test_create_state_dictionary(can, logger):
    logger.info("Testing create_state_dictionary...")
    # TODO
    pass


@pytest.mark.soft
@pytest.mark.unit
def test_set_and_get_state(can, can2, logger):
    logger.info("Testing set_state and get_state...")

    can.set_state("ThrottlePos", 50)
    time.sleep(.1)
    assert can2.get_state("ThrottlePos") == 50 

@pytest.mark.soft
@pytest.mark.unit
def test_playback(can, can2, logger):
    logger.info('Testing drive log playback')
    
    path = os.path.abspath(os.path.dirname(__file__) + "/can_test_log.csv")
    can.playback(path)
    assert can2.get_state('StartButton') == 33
    assert can2.get_state('Temperature') == 145
