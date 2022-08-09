# Base Python
import os
import logging
from typing import Tuple, Union
from configparser import ConfigParser

# Project Imports
from .utils import artifacts_path
from .ft4222_proxy import FT4222Proxy

config = ConfigParser(interpolation=None)
config.read(os.path.join(artifacts_path, "config.ini"))

class IOController:
    """High level python object to interface with hardware.

    The ``IOController`` is used to set analog and digital pins for simulation. It
    is configured using a ``.csv`` file, documented below. It allows a user to interact
    with our custom hardware by getting and setting digital and analog states.

    :param str pin_info_path: The path to the pin_info file (should be stored in ``artifacts``).
    :param str device_description: The description of the device; used to connect.
    """

    def __init__(
        self,
        pin_info: dict,
        device_description: str = "FT4222 A",
    ):
        # Create logger (all config should already be set by RoadkillHarness)
        self.log = logging.getLogger(name=__name__)

        self.pin_info =  pin_info

        self.ft4222 = FT4222Proxy(device_description)


    def set_state(self, name: str, value) -> None:
        """Set the value of an IO pin in the HitL system

        Args:
            pin (str): the name of the pin to update (e.x. THROTTLE_PEDAL_1)
            value (int/float): the value to set the pin to
                Use 0 or 1 for digital, or float for analog
        """
        # Raise an exception if the signal is read only
        if self.pin_info[name]["read_write"] == "READ":
            raise Exception(f"{name} is a read-only signal, you cannot set it!")

        address = self.pin_info[name]["address"]
        pin_number = self.pin_info[name]["pin"]

        if self.pin_info[name]["type"] == "ANALOG":
            min = self.pin_info[name]["min"]
            max = self.pin_info[name]["max"]
            self.ft4222.set_analog(address, pin_number, value, min, max)
        else:
            self.ft4222.set_digital(address, pin_number, value)

        self.log.info(f"Set state of {name} to {value}")

    def get_state(self, name: str) -> Union[int, float]:
        """Request a hardware state from the HitL system.

        :param str name: The name of the state we want to get (e.x. "THROTTLE_POT_1", NOT 11)

        :rtype:  Union[int, float]
        :returns: The value of the requested state. If the signal is analog, returns a ``float``, otherwise an ``int``.

        """
        # Raise an exception if the signal is write only
        if self.pin[name]["read_write"] == "WRITE":
            raise Exception(f"{name} is a write-only signal, you cannot read it!")

        address = self.pin_info[name]["address"]
        pin_number = self.pin_info[name]["pin"]

        if self.pin_info[name]["type"] == "ANALOG":
            min = self.pin_info[name]["min"]
            max = self.pin_info[name]["max"]
            out = self.ft4222.get_analog(address, pin_number, min, max)
        else:
            out = self.ft4222.get_digital(address, pin_number)

        self.log.info(f"Got state of {name}: {out}")
        return out

    def _read_pin_info(self, path: str) -> dict:
        """

        Read in the pin address information, given a path to a .csv file

        Args:
            path (str): The path to the .csv file containing pin information (see
            `software readme <https://github.com/olin-electric-motorsports/olin-electric-motorsports/tree/main/projects/hitl/software>`_

        Returns:
            dict: A dictionary of (str: dict) pairs
        """
        out = {}
        with open(path, "r") as f:
            line = f.readline()  # clear the header line
            line = f.readline()  # get the first data line ready
            while line != "":  # keep reading until we hit the end
                data = line.split(",")

                # Parse a line of data
                address = data[0].strip()  # i2c address
                pin = data[1].strip()  # channel/pin number on chip
                name = data[2].strip()  # human-readable name of signal
                type = data[3].strip()  # analog or digital
                read_write = data[4].strip()  # readable, writeable, or both
                sig_min = data[5].strip()  # min value of signal
                sig_max = data[6].strip()  # max value of signal

                # Check for typos
                if int(address) > 127 or int(address) < 0:
                    raise Exception(
                        f"I2C address of {address} for signal {name} is invalid!"
                    )
                if type not in ["ANALOG", "DIGITAL"]:
                    raise Exception(
                        f"Type {type} of signal {name} is invalid! Please use ANALOG or DIGITAL"
                    )
                if read_write not in ["READ", "WRITE", "BOTH"]:
                    raise Exception(
                        f"Read/write value {read_write} of signal {name} is invalid! Please use READ, WRITE, or BOTH"
                    )

                # Add data to dictionary
                sig_dict = {}

                sig_dict["address"] = int(address)
                sig_dict["pin"] = int(pin)
                sig_dict["type"] = type
                sig_dict["read_write"] = read_write
                sig_dict["min"] = float(sig_min)
                sig_dict["max"] = float(sig_max)

                out[name] = sig_dict

                # read new line
                line = f.readline()

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

    def __del__(self) -> None:
        """Destructor (called when the program ends)

        Close the serial port for a clean teardown
        """
        if self.ft4222.dev:
            self.ft4222.dev.close()
