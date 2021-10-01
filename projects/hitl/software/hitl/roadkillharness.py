# Base python imports
import os
import logging
import configparser
from typing import Optional

# Project imports
from hitl.utils import get_logging_config, root_path, artifacts_path
from hitl.iocontroller import IOController
from hitl.cancontroller import CANController


class RoadkillHarness:
    """Class to represent the entire tester

    `Confluence <https://docs.olinelectricmotorsports.com/display/AE/Roadkill+Harness>`_

    This class makes it easy to bring-up an entire tester with one line of python::

        harness = RoadkillHarness()

    Notice that this object isn't parameterized at all; it looks in the ``config.ini`` file
    for information. It exposes all the functionality you need to write and run tests with
    this system.
    """

    def __init__(self):
        # Read config
        config = configparser.ConfigParser(interpolation=None)
        config.read(os.path.join(artifacts_path, "config.ini"))

        # Create logger
        get_logging_config()
        self.log = logging.getLogger(name=__name__)

        # Create IOController
        self.log.info("Creating IOController...")
        self.io = IOController(
            pin_info_path=os.path.join(
                artifacts_path,
                config.get("PATHS", "pin_config", fallback="pin_info.csv"),
            )
        )

        # Create CANController
        self.log.info("Creating CANController...")
        self.can = CANController(
            can_spec_path=os.path.join(artifacts_path, config.get("PATHS", "dbc_path")),
            channel=config.get("HARDWARE", "can_channel", fallback="vcan0"),
            bitrate=config.get("HARDWARE", "can_bitrate", fallback="500000"),
        )
