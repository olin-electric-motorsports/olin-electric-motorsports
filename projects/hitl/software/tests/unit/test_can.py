# Base/extended python imports
import pytest
import os
import time
from configparser import ConfigParser
from can import Message

# Project Imports
from projects.hitl.software.hitl.cancontroller import CANController

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

    can.set_state("air_state", "IDLE")
    time.sleep(0.1)
    assert can2.get_state("air_state") == "IDLE"


@pytest.mark.soft
@pytest.mark.unit
def test_periodic_sending(can, can2, logger):
    logger.info("Testing periodic sending of CAN messages")

    # Setting to 1 and adding message to periodic sending with period = 1, then asserting that it was set to 1
    can.set_state("ss_bots", "CLOSED")
    can.set_periodic("throttle", 1)
    time.sleep(0.1)
    assert can2.get_state("ss_bots") == "CLOSED"

    # Setting signal to 0 and making sure it is still 1 after .5 seconds
    can.set_state("ss_bots", "OPEN")
    time.sleep(0.5)
    assert can2.get_state("ss_bots") == "CLOSED"

    # Let the periodic message send and verify that it changed to 0
    time.sleep(1)
    assert can2.get_state("ss_bots") == "OPEN"
