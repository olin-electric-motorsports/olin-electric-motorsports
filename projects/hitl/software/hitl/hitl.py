# Base python imports
import os
import logging

# Project imports
from .utils import get_logging_config, root_path, artifacts_path
from .iocontroller import IOController
from .cancontroller import CANController

class Hitl:
    """Class to represent the entire tester

    `Confluence <https://docs.olinelectricmotorsports.com/display/AE/Roadkill+Harness>`_

    This class makes it easy to bring-up an entire tester with one line of python::

        harness = RoadkillHarness()

    Notice that this object isn't parameterized at all; it looks in the ``config.ini`` file
    for information. It exposes all the functionality you need to write and run tests with
    this system.
    """

    def __init__(self, pin_info, can_spec_path="vehicle/mkv/mkv.dbc"):
        # Create logger
        get_logging_config()
        self.log = logging.getLogger(name=__name__)

        # Create IOController
        self.log.info("Creating IOController...")
        self.io = IOController(
            pin_info=pin_info,
        )

        # Create CANController
        self.log.info("Creating CANController...")
        self.can = CANController(
            can_spec_path="vehicle/mkv/mkv.dbc",
            channel="vcan0",
            bitrate=500000
        )

    def close():
        self.can.close()
        self.io.close()
