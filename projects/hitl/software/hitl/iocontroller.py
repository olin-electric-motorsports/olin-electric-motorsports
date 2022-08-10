# Base Python
import os
import logging
from typing import Tuple, Union
from enum import Enum, auto

# Project Imports
from .utils import artifacts_path
from .ft4222_proxy import FT4222Proxy


class PinType(Enum):
    ANALOG = auto()
    DIGITAL = auto()


class PinMode(Enum):
    READ = auto()
    WRITE = auto()
    BOTH = auto()


class IOController:
    """High level python object to interface with hardware.

    The ``IOController`` is used to set analog and digital pins for simulation. It
    is configured using a dictionary, described below. It allows a user to interact
    with our custom hardware by getting and setting digital and analog states.

    Args:
        pin_info (dict): Dicionary defining all of the pin info, normally defined in a
            pytest file and passed in to the HitL object as a ficture
        device_description (str): The description of the device; used to connect
    """

    def __init__(
        self,
        pin_info: dict,
        device_description: str = "FT4222 A",
    ):
        # Create logger (all config should already be set by RoadkillHarness)
        self.log = logging.getLogger(name=__name__)

        self.pin_info = pin_info

        self.ft4222 = FT4222Proxy(device_description)

    def set_state(self, name: str, value) -> None:
        """Set the value of an IO pin in the HitL system

        Args:
            pin (str): the name of the pin to update (e.x. THROTTLE_PEDAL_1)
            value (int/float): the value to set the pin to
                Use 0 or 1 for digital, or float for analog
        """
        # Raise an exception if the signal is read only
        if self.pin_info[name]["read_write"] == PinMode.READ:
            raise Exception(f"{name} is a read-only signal, you cannot set it!")

        address = self.pin_info[name]["address"]
        pin_number = self.pin_info[name]["pin"]

        if self.pin_info[name]["type"] == PinType.ANALOG:
            min = self.pin_info[name]["min"]
            max = self.pin_info[name]["max"]
            self.ft4222.set_analog(address, pin_number, value, min, max)
        else:
            self.ft4222.set_digital(address, pin_number, value)

        self.log.info(f"Set state of {name} to {value}")

    def get_state(self, name: str) -> Union[int, float]:
        """Request a hardware state from the HitL system.

        Args:
            name (str): The name of the state to fetch (ex. "throttle_l_pos")

        Returns:
            (int/float): Value of the requested state - float for an analog, either
                0 or 1 for digital

        """
        # Raise an exception if the signal is write only
        if self.pin[name]["read_write"] == PinMode.WRITE:
            raise Exception(f"{name} is a write-only signal, you cannot read it!")

        address = self.pin_info[name]["address"]
        pin_number = self.pin_info[name]["pin"]

        if self.pin_info[name]["type"] == PinType.ANALOG:
            min = self.pin_info[name]["min"]
            max = self.pin_info[name]["max"]
            out = self.ft4222.get_analog(address, pin_number, min, max)
        else:
            out = self.ft4222.get_digital(address, pin_number)

        self.log.info(f"Got state of {name}: {out}")
        return out

    def __enter__(self) -> None:
        """Enter and exit functions allow signals to be set simultaneously with hardware

        Send 0xFF byte to system interface

        Example: When we write:

            ```
            io.set_state("STATE_1", "1")
            io.set_state("STATE_2", "1")
            ```

        the states are set one after another. If these states are, say,
        throttle potentiometers, the delay between these two could cause
        problems, like an implausibility error. Now, we can use the syntax:

            ```
            with io:
                io.set_state("STATE_1", "1")
                io.set_state("STATE_2", "1")
            ```

        to let the hardware know we want to set these state at the same exact time,
        minimizing any delay introduced by the serial communication/sequential
        function calls.
        """
        raise Exception("Not implemented")

    def __exit__(self) -> None:
        """See docstring for __enter__ above

        Send 0xFF byte to system interface
        """
        raise Exception("Not implemented")

    def close(self) -> None:
        """Destructor (called when the program ends)

        Close the serial port for a clean teardown
        """
        if self.ft4222.dev:
            self.ft4222.dev.close()
        self.log.info("Shutdown IO gracefully")
