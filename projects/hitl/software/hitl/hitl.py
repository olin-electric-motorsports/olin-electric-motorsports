import os
import logging
from configparser import ConfigParser

from .utils import get_logging_config, root_path, artifacts_path
from .iocontroller import IOController
from .cancontroller import CANController

class Hitl:

    def __init__(self, pin_info):
        # Read config
        config = configparser.ConfigParser(interpolation=None)
        config.read(os.path.join(artifacts_path, "config.ini"))

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
            channel=config.get("HARDWARE", "can_channel", fallback="vcan0"),
            bitrate=config.get("HARDWARE", "can_bitrate", fallback="500000"),
            real=real,
        )

