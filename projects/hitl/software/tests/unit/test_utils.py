# Base/extended python imports
import pytest
import os
import time
import logging
from configparser import ConfigParser

# Project Imports
from hitl.iocontroller import IOController
from hitl.utils import get_logging_config, pad_with_zeros, find_arduino, artifacts_path

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
