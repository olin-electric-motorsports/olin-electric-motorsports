# Imports
import logging
import datetime
import configparser
import os
import sys

# import usb.core
from typing import Tuple, Optional


# Constant definitions
root_path = os.path.abspath(
    os.path.join(os.path.dirname(__file__), os.pardir)
)  # to software
artifacts_path = os.path.join(root_path, "artifacts")


def get_logging_config(filename=None) -> None:
    """
    Return logging config used for HitL
    """
    logging.basicConfig(
        format="%(asctime)s - %(name)s - %(levelname)s - %(message)s",
        level="INFO",
        filename=filename,
    )


def pad_with_zeros(s: str, length: int) -> str:
    """Given a string, add 0s to the front until it reaches the specified length

    :param str s: The input string
    :param int length: The desired length

    :rtype: str
    :returns: a 0-padded string

    Example::

        >>> utils.pad_with_zeros("45", 4)
        0045

    """
    out = s
    while len(out) < length:
        out = "0" + out

    return out


def map_to_machine(value: float, low: float, high: float) -> Tuple[int, int]:
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


def map_to_human(value: bytes, low: float, high: float) -> float:
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
        raise Exception(
            f"Value {mapped} not in range [{low}-{high}]! Invalid response received."
        )
    if (value[0] & 0b10000000 == 0) and low > 0:
        raise Exception(
            f"Return value from ADC of {value} indicates the voltage was negative. See https://www.analog.com/media/en/technical-documentation/data-sheets/2489fb.pdf for details."
        )
    if value[0] & 0b01000000 == 1:
        raise Exception(
            f"Return value from ADC of {value} indicates the voltage measurement was clipped. See https://www.analog.com/media/en/technical-documentation/data-sheets/2489fb.pdf for details."
        )

    return mapped


def build_pin(address, num, type, visibility, min, max):
    """
    Wrapper to build a dictionary representing a pin.

    Args:
        address (int): I2C address of the board the pin is on
        pin (int): Pin number
        type (hitl.iocontroller.PinType): ANALOG or DIGITAL
        read_write (hitl.iocontroller.PinMode): READ, WRITE, or BOTH
        min (int): Minimum value. Usually 0 for both analog and digital
        max (int): Maximum value. Usually 5 for analog and 1 for digital
    """
    return {
        "address": address,
        "pin": num,
        "type": type,
        "read_write": visibility,
        "min": min,
        "max": max,
    }

