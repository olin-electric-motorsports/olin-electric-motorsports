# Base Python
import os
import logging
from typing import Tuple, Union
from configparser import ConfigParser

# Extended Python
try:
    import ft4222
except ModuleNotFoundError:
    # We haven't setup the ft4222 library yet...
    # See https://awenstrup.github.io/setup.html
    ft4222 = None

# Project Imports 
from hitl.utils import artifacts_path

# CONSTANTS
# ADC parameters
ADC_CHANNEL_TO_ADD_BITS = {
    0: 0b00000000,
    1: 0b00001000,
    2: 0b00000001,
    3: 0b00001001,
}
ADC_PREFIX = 0b10110000
ADC_RETURN_SIZE_BYTES = 3

# DAC parameters
DAC_CHANNEL_TO_ADD_BITS = {i: i for i in range(8)}
DAC_COMMANDS = {
    "output now": 0b00110000,
    "load but don't output": 0b00010000,
    "output loaded values": 0b10110000,
}

# GPIO parameters
GPIO_CHANNEL_TO_ADD_BITS = {i: i for i in range(4, 32)}
GPIO_COMMANDS = {"single port": 0b00100000}
GPIO_RETURN_SIZE_BYTES = 1

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

    def __init__(self, 
    pin_info_path: str = config.get("PATH", "pin_info_path", fallback=os.path.join(artifacts_path, "pin_info.csv")),
     device_description: str = "FT4222 A"
    ):
        # Create logger (all config should already be set by RoadkillHarness)
        self.log = logging.getLogger(name=__name__)

        self.pin_info = self._read_pin_info(path=pin_info_path)

        if ft4222:
            try:
                self.dev = ft4222.openByDescription(device_description)
                self.dev.i2cMaster_Init(400_000)
            except ft4222.FT2XXDeviceError as e:
                # Couldn't open the specified port; initialize w/o hardware for testing
                self.log.error(f"Failed to connect to device {device_description}")
                self.log.error(e)
                self.dev = None
        else:
            self.log.warning("ft4222 could not be imported, cannot connect to hardware")
            self.dev = None

    def set_state(self, name: str, value) -> None:
        """Set the value of an IO pin in the HitL system

        :param str pin: The name of the pin to update (e.x. THROTTLE_PEDAL_1)
        :param Union[int,float] value: The value to set the pin to (e.x. 2.5).
            Use 0 or 1 for digital, floating point voltage number for analog

        :returns: None

        DAC command message format (3 bytes):

            * bits 0-3: Operation type (see datasheet)
            * bits 4-7: DAC number
            * bits 8-23: Value to write

        GPIO command message format (2 bytes):
            * bits 0-2: Command type (see datasheet)
            * bits 3-7: Pin number
            * bits 8-14: Ignored
            * bit 15: Value to write

        DAC Datasheet: https://www.analog.com/media/en/technical-documentation/data-sheets/AD5675.pdf
        GPIO Datasheet: https://datasheets.maximintegrated.com/en/ds/MAX7300.pdf
        """
        # Raise an exception if the signal is read only
        if self.pin[name]["read_write"] == "READ":
            raise Exception(f"{name} is a read-only signal, you cannot set it!")

        # If no hardware, log an error
        if not self.dev:
            self.log.error("Could not set state; no hardware connection")
            return

        address = self.pin_info[name]["address"]

        if self.pin_info[name]["type"] == "ANALOG":
            byte1 = DAC_COMMANDS["output_now"] & DAC_CHANNEL_TO_ADD_BITS[self.pin_info[name]["pin"]]
            byte2, byte3 = self._map_to_machine(
                value=value,
                low=self.pin_info[name]["min"],
                high=self.pin_info[name]["max"],
            )
            data = bytes([byte1, byte2, byte3])
        else:
            byte1 = GPIO_COMMANDS["single port"] & GPIO_CHANNEL_TO_ADD_BITS[self.pin.pin_info[name]["pin"]]
            byte2 = 1 if value else 0
            data = bytes([byte1, byte2])

        self.dev.i2cMaster_Write(address, data)

        self.log.info(f"Set state of {name} to {value}")

    def get_state(self, name: str) -> Union[int, float]:
        """Request a hardware state from the HitL system.

        :param str name: The name of the state we want to get (e.x. "THROTTLE_POT_1", NOT 11)

        :rtype:  Union[int, float]
        :returns: The value of the requested state. If the signal is analog, returns a ``float``, otherwise an ``int``.

        Getting an analog state is a 2 step process: we first write a command to the ADC to
        start a conversion, then read the converted voltage back.

        ADC command message format (1 byte):

            * bits 0-2
                * 101 (enable setting a new input channel, we always do this)
            * bit 3:
                * 1 (single-ended comparison, not differential)
            * bits 4-7
                * 0000 for channel 0
                * 1000 for channel 1
                * 0001 for channel 2
                * 1001 for channel 3

        ADC data returned message format (3 bytes):

            * bit 0: 1 if voltage was positive (relative to ground)
            * bit 1: 1 if reading was out of bounds
            * bits 2-7: 0
            * bits 8-23: 16 bit voltage reading


        ADC datasheet: https://www.analog.com/media/en/technical-documentation/data-sheets/2489fb.pdf
        """
        # Raise an exception if the signal is write only
        if self.pin[name]["read_write"] == "WRITE":
            raise Exception(f"{name} is a write-only signal, you cannot read it!")

        # If no hardware, log an error
        if not self.dev:
            raise Exception("Could not get state, no hardware connection.")

        # Create and send request
        out = 0
        address = self.pin_info[name]["address"]

        if self.pin_info[name]["type"] == "ANALOG":
            # Request data
            data = ADC_PREFIX & ADC_CHANNEL_TO_ADD_BITS[self.pin_info[name]["pin"]]
            self.dev.i2cMaster_Write(address, data)

            # Wait for response
            response = self.dev.i2cMaster_Read(address, ADC_RETURN_SIZE_BYTES)
            self.log.debug(f"Received {response}")
            out = self._map_to_human(response, self.pin_info[name]["min"], self.pin_info[name]["max"])
        else:
            # Request data
            data = GPIO_COMMANDS["single port"] & GPIO_CHANNEL_TO_ADD_BITS[self.pin.pin_info[name]["pin"]]
            self.dev.i2cMaster_Write(address, data)

            # Wait for response
            response = self.dev.i2cMaster_Read(address, GPIO_RETURN_SIZE_BYTES)
            self.log.debug(f"Received {response}")
            out = 1 if response else 0

        self.log.info(f"Got state of {name}: {out}")
        return out

    def _read_pin_info(self, path: str) -> dict:
        """Read in the pin address information, given a path to a .csv file

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
                    raise Exception(f"I2C address of {address} for signal {name} is invalid!")
                if type not in ["ANALOG", "DIGITAL"]:
                    raise Exception(f"Type {type} of signal {name} is invalid! Please use ANALOG or DIGITAL")
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

    def _map_to_machine(self, value: float, low: float, high: float) -> Tuple[int, int]:
        """Map from a floating point value to a 16 bit precision value, from min to max

        Args:
            value (float): The value (usually a voltage) requested
            low, high (floats): The min and max acceptable voltages

            Example: _map_to_machine(3.0, 2.5, 5) -> (0x33, 0x33)

        Returns:
            Tuple[int, int]: the two int values (0-255) that represent the scaled value
        """
        if not (low < value < high):
            raise Exception(f"Value {value} not in range [{low}-{high}]! Cannot set value.")
        mapped = int((value - low) * (0xFFFF - 0x0000) / (high - low))
        byte0 = mapped >> 8
        byte1 = mapped & 0x00FF
        return byte0, byte1

    def _map_to_human(self, value: bytes, low: float, high: float) -> float:
        """Convert from 2 bytes returned from an ADC to a float (voltage)

        Args:
            value (float): The bytes received
            low, high (floats): The voltages of the high and low rails of the ADC

            Example: _map_to_human(b'\x00\xff', 0, 5) -> 2.5

        Returns:
            float: The voltage of the pin
        """
        response = int.from_bytes(value[1:], "big")  # first byte is special

        mapped = (response - 0x0000) * (high - low) / (0xFFFF - 0x0000) + low

        if not (low < mapped < high):
            raise Exception(f"Value {mapped} not in range [{low}-{high}]! Invalid response received.")
        if (value[0] & 0b10000000 == 0) and low > 0:
            raise Exception(
                f"Return value from ADC of {value} indicates the voltage was negative. See https://www.analog.com/media/en/technical-documentation/data-sheets/2489fb.pdf for details."
            )
        if value[0] & 0b01000000 == 1:
            raise Exception(
                f"Return value from ADC of {value} indicates the voltage measurement was clipped. See https://www.analog.com/media/en/technical-documentation/data-sheets/2489fb.pdf for details."
            )

        return mapped

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
        if self.dev:
            self.dev.close()
