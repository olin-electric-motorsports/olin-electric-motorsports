"""
Proxy to access FT4222 Hardware. In normal use, these functions shouldn't be
accessed directly, but instead through the IOController
"""
import logging
import os

from utils import map_to_human, map_to_machine

try:
    import ft4222
except ModuleNotFoundError:
    # We haven't setup the ft4222 library yet...
    # See https://awenstrup.github.io/setup.html
    ft4222 = None

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


class FT4222Proxy:
    """
    Proxy class to intergace with FT4222 chip
    """

    def __init__(self, device_description):

        self.log = logging.getLogger(name=__name__)

        if ft4222:
            try:
                self.dev = ft4222.openByDescription(device_description)
                self.dev.i2cMaster_Init(400_000)
            except ft4222.FT2XXDeviceError as e:
                self.log.error(f"Failed to connect to device {device_description}")
                self.log.error(e)
                self.dev = None
        else:
            self.log.warning("ft4222 could not be imported, cannot connect to hardware")
            self.dev = None

    def set_analog(address, pin_number, value, min=0, max=5):
        """
        Set the value of an analog pin in the HitL system

        Args:
            address (int): I2C address of DAC
            pin_number (int): Pin number to set
            value (float): Value to set pin to
            min (int): minimum voltage value
            max (int): maximum voltage value

        DAC command message format (3 bytes):

            * bits 0-3: Operation type (see datasheet)
            * bits 4-7: DAC number
            * bits 8-23: Value to write
        """
        if not self.dev:
            self.log.error("Could not set state; no hardware connection")
            return

        byte1 = DAC_COMMANDS["output_now"] & DAC_CHANNEL_TO_ADD_BITS[pin_number]
        byte2, byte3 = map_to_machine(
            value=value,
            low=min,
            high=max,
        )
        data = bytes([byte1, byte2, byte3])

        self.dev.i2cMaster_Write(address, data)
        self.log.debug(f"Set state of {name} to {value}")

    def set_digital(address, pin_number, value):
        """
        Set the value of a digital pin in the HitL system

        Args:
            address (int): I2C address of GPIO
            pin_number (int): Pin number to set
            value (int): Value to set pin to


        GPIO command message format (2 bytes):
            * bits 0-2: Command type (see datasheet)
            * bits 3-7: Pin number
            * bits 8-14: Ignored
            * bit 15: Value to write
        """
        if not self.dev:
            self.log.error("Could not set state; no hardware connection")
            return

        byte1 = GPIO_COMMANDS["single port"] & GPIO_CHANNEL_TO_ADD_BITS[pin_number]
        byte2 = 1 if value else 0
        data = bytes([byte1, byte2])

        self.dev.i2cMaster_Write(address, data)
        self.log.debug(f"Set state of {name} to {value}")

    def get_analog(address, pin_number, min, max):
        """
        Get the value of an analog pin in the HitL system

        Args:
            address (int): I2C address of ADC
            pin_number (int): Pin number to get
            min (int): minimum voltage value
            max (int): maximum voltage value

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
        """
        if not self.dev:
            self.log.error("Could not get state; no hardware connection")
            return

        # Request data
        data = ADC_PREFIX & ADC_CHANNEL_TO_ADD_BITS[pin_number]
        self.dev.i2cMaster_Write(address, data)

        # Wait for response
        response = self.dev.i2cMaster_Read(address, ADC_RETURN_SIZE_BYTES)
        self.log.debug(f"Received {response}")
        out = map_to_human(
            response, self.pin_info[name]["min"], self.pin_info[name]["max"]
        )

        return out

    def get_digital(address, pin_number):
        """
        Get the value of a digital pin in the HitL system

        Args:
            address (int): I2C address of GPIO
            pin_number (int): Pin number to get


        GPIO command message format (2 bytes):
            * bits 0-2: Command type (see datasheet)
            * bits 3-7: Pin number
            * bits 8-14: Ignored
            * bit 15: Value to write
        """
        if not self.dev:
            self.log.error("Could not get state; no hardware connection")
            return

        # Request data
        data = (
            GPIO_COMMANDS["single port"]
            & GPIO_CHANNEL_TO_ADD_BITS[self.pin.pin_info[name]["pin"]]
        )
        self.dev.i2cMaster_Write(address, data)

        # Wait for response
        response = self.dev.i2cMaster_Read(address, GPIO_RETURN_SIZE_BYTES)
        self.log.debug(f"Received {response}")
        out = 1 if response else 0

        return out
