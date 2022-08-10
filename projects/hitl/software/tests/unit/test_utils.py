# Base/extended python imports
import pytest
import os
import time
import logging
from configparser import ConfigParser

# Project Imports
from hitl.iocontroller import IOController
from hitl.utils import (
    get_logging_config,
    pad_with_zeros,
    artifacts_path,
    map_to_machine,
    map_to_human,
)

config = ConfigParser(interpolation=None)
config.read(os.path.join(artifacts_path, "config.ini"))


@pytest.fixture
def logger():
    get_logging_config()
    l = logging.getLogger(name=__name__)
    return l


@pytest.mark.soft
@pytest.mark.unit
def test_pad_zeros(logger):
    logger.info("Testing pad_with_zeros...")

    assert pad_with_zeros("42", 4) == "0042"
    assert pad_with_zeros("1234", 4) == "1234"


@pytest.mark.soft
@pytest.mark.unit
def test_encoder(logger):
    logger.info("Testing encoder (_map_to_machine())...")

    byte0, byte1 = map_to_machine(3.0, 2.5, 5)
    assert byte0 == 0x33
    assert byte1 == 0x33

    byte2, byte3 = map_to_machine(2.5, 0, 5)
    assert byte2 == 0x7F
    assert byte3 == 0xFF


@pytest.mark.soft
@pytest.mark.unit
def test_decoder(logger):
    logger.info("Testing decoder (_map_to_human())...")

    v1 = map_to_human(bytes([0x80, 0x33, 0x33]), 2.5, 5)
    assert v1 == pytest.approx(3.0, abs=0.01)

    v2 = map_to_human(bytes([0x80, 0x7F, 0xFF]), 0, 5)
    assert v2 == pytest.approx(2.5, abs=0.01)
