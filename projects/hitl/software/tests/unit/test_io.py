# Base/extended python imports
import pytest
import os
import time
import logging
from configparser import ConfigParser

# Project Imports
from hitl.iocontroller import IOController
from hitl.utils import get_logging_config, artifacts_path, map_to_human, map_to_machine

config = ConfigParser(interpolation=None)
config.read(os.path.join(artifacts_path, "config.ini"))


@pytest.fixture
def io(bspd):
    out = IOController(bspd)
    time.sleep(2)  # Was seeing weird errors without this
    return out


@pytest.fixture
def logger():
    get_logging_config()
    l = logging.getLogger(name=__name__)
    return l


@pytest.mark.hard
@pytest.mark.unit
def test_connected(io, logger):
    # Create an IOController to make sure it can connect to hardware!
    logger.info("Testing hardware connection...")
    assert io.dev


# @pytest.mark.soft
# @pytest.mark.unit
# def test_read_io_file(io, logger):
#     logger.info("Testing pin_info parser...")
# 
#     analog = io.pin_info["EXAMPLE_ANALOG_SIGNAL"]
#     assert analog["type"] == "ANALOG"
#     assert analog["max"] == 5
# 
#     digital = io.pin_info["EXAMPLE_DIGITAL_SIGNAL"]
#     assert digital["min"] == 0
#     assert digital["pin"] == 0


