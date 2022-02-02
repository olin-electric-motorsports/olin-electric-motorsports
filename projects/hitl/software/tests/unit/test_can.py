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
    path = os.path.abspath(os.path.dirname(__file__) + "/veh.dbc")

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
    start_time = time.time_ns()
    can.playback(path)
    end_time = (time.time_ns() - start_time)/1000000
    time.sleep(1)
    assert can2.get_state('StartButton') == 33
    assert can2.get_state('Temperature') == 145
    assert end_time == pytest.approx(109, rel=.01)

@pytest.mark.soft
@pytest.mark.unit
def test_periodic_sending(can, can2, logger):
    logger.info('Testing periodic sending of CAN messages')

    #Setting to 1 and adding message to periodic sending with period = 1, then asserting that it was set to 1  
    can.set_state('InertiaSwitchSense', 1)
    can.set_periodic('Throttle', 1)
    time.sleep(.1)
    assert can2.get_state('InertiaSwitchSense') == 1

    #Setting signal to 0 and making sure it is still 1 after .5 seconds
    can.set_state('InertiaSwitchSense', 0)
    time.sleep(.5)
    assert can2.get_state('InertiaSwitchSense') == 1

    #Let the periodic message send and verify that it changed to 0
    time.sleep(2)
    assert can2.get_state('InertiaSwitchSense') == 0
