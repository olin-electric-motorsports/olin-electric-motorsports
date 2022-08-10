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
    yield out

    out.close()


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
    assert io.ft4222.dev
