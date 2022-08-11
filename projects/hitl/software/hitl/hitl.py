# Base python imports
import os
import logging

# Project imports
from utils import get_logging_config, root_path, artifacts_path
from iocontroller import IOController
from cancontroller import CANController


class Hitl:
    """Class to represent the entire tester

    This class makes it easy to bring-up a Hitl tester with a very short pytest fixture, for example:

        @pytest.fixture(scope="session")
        def hitl(pin_dict):
            hitl = Hitl(pin_dict, "vehicle/mkv/mkv/dbc", can_channel="can0")
            yield hitl
            hitl.close()
    """

    def __init__(
        self,
        pin_info,
        can_spec_path="vehicle/mkv/mkv.dbc",
        can_channel="vcan0",
        can_bustype="socketcan",
        can_bitrate=500000,
    ):
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
            can_spec_path=can_spec_path,
            bustype=can_bustype,
            channel=can_channel,
            bitrate=can_bitrate,
        )

    def close():
        self.can.close()
        self.io.close()
