# Base/extended python imports
import pytest
import os
import time
import logging
from configparser import ConfigParser

# Project Imports
from hitl.iocontroller import IOController
from hitl.utils import get_logging_config, artifacts_path

config = ConfigParser(interpolation=None)
config.read(os.path.join(artifacts_path, "config.ini"))


@pytest.fixture(scope="session")
def io():
    path = os.path.abspath(os.path.dirname(__file__) + "/sample_io_addresses.csv")
    out = IOController(pin_info_path=path)
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


@pytest.mark.soft
@pytest.mark.unit
def test_read_io_file(io, logger):
    logger.info("Testing pin_info parser...")

    analog = io.pin_info["EXAMPLE_ANALOG_SIGNAL"]
    assert analog["type"] == "ANALOG"
    assert analog["max"] == 5

    digital = io.pin_info["EXAMPLE_DIGITAL_SIGNAL"]
    assert digital["min"] == 0
    assert digital["pin"] == 0


@pytest.mark.soft
@pytest.mark.unit
def test_encoder(io, logger):
    logger.info("Testing encoder (_map_to_machine())...")

    byte0, byte1 = io._map_to_machine(3.0, 2.5, 5)
    assert byte0 == 0x33
    assert byte1 == 0x33

    byte2, byte3 = io._map_to_machine(2.5, 0, 5)
    assert byte2 == 0x7F
    assert byte3 == 0xFF


@pytest.mark.soft
@pytest.mark.unit
def test_decoder(io, logger):
    logger.info("Testing decoder (_map_to_human())...")

    v1 = io._map_to_human(bytes([0x80, 0x33, 0x33]), 2.5, 5)
    assert v1 == pytest.approx(3.0, abs=0.01)

    v2 = io._map_to_human(bytes([0x80, 0x7F, 0xFF]), 0, 5)
    assert v2 == pytest.approx(2.5, abs=0.01)
