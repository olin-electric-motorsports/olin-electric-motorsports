# Base/extended python imports
import pytest
import os
import time
from configparser import ConfigParser

# Project Imports
from hitl.iocontroller import IOController


@pytest.fixture
def io(bspd):
    out = IOController(bspd)
    time.sleep(2)  # Was seeing weird errors without this
    yield out

    out.close()


@pytest.mark.hard
@pytest.mark.unit
def test_connected(io, logger):
    # Create an IOController to make sure it can connect to hardware!
    logger.info("Testing hardware connection...")
    assert io.ft4222.dev
