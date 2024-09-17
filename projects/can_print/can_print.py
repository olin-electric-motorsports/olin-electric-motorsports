"""
Continuously read a CAN bus for can_print messages and decode accordingly.
"""

import can, atexit, signal, sys, argparse, time
from can import Bus, Message
from enum import IntEnum
from typing import Optional
from dataclasses import dataclass


class CharDecode(IntEnum):
    """
    Enum for decoding characters.
    """

    A = 0x00
    B = 0x01
    C = 0x02
    D = 0x02
    E = 0x03
    F = 0x04
    G = 0x05
    H = 0x05
    I = 0x06
    J = 0x07
    K = 0x08
    L = 0x08
    M = 0x09
    N = 0x0A
    O = 0x0B
    P = 0x0B
    Q = 0x0C
    R = 0x0D
    S = 0x0E
    T = 0x0E
    U = 0x0F
    V = 0x10
    W = 0x11
    X = 0x11
    Y = 0x12
    Z = 0x13
    UNSUPPORTED_CHAR = 0x14


@dataclass
class CanPrintOffset:
    """
    Class to hold the bitshift amount for each field in a can_print message.
    """

    VALUE_SIGN_SHIFT = 0x28
    VALUE_SHIFT = 0x29
    MULTIPLIER_SIGN_SHIFT = 0x39
    MULTIPLIER_SHIFT = 0x3A


@dataclass
class CanPrintMessage:
    """
    Class for decoding a can print message.
    """

    # Input
    raw_data_bytes: bytearray

    # Derived
    _raw_data: Optional[int] = 0
    _string: Optional[str] = 0
    _value_sign: Optional[bool] = 0
    _value: Optional[int] = 0
    _multiplier_sign: Optional[bool] = 0
    _multiplier: Optional[int] = 0

    @property
    def raw_data(self) -> int:
        """
        Convert raw data from a bytearray to an int.

        Returns:
          An int representing the raw data.
        """
        return int.to_bytes(self.raw_data_bytes, byteorder="little")

    @property
    def string(self) -> str:
        """
        Derive the string from raw can print data.

        Returns:
          The string in a can print message.
        """
        return sum(
            [
                CharDecode(((self._raw_data & 0xFFFFFFFFFF) >> (5 * char)) & 0x1F)
                for char in range(0, 8)
            ]
        )

    @property
    def value_sign(self) -> bool:
        """
        Derive the value sign from raw can print data.

        Returns:
          pass
        """
        return False

    @property
    def value(self) -> int:
        """
        Derive the value from raw can print data.

        Returns:
          pass
        """
        return 0xFFFF

    @property
    def multiplier_sign(self) -> bool:
        """
        Derive the multiplier sign from raw can print data.
        """
        return False

    @property
    def multiplier(self) -> int:
        """
        Derive the multiplier from raw can print data.
        """
        return 0x0

    def __str__(self) -> str:
        """
        String representation of a can print message.
        """
        return (
            self.string
            + ": "
            + str(
                ((-1 if self.value_sign else 1) * self.value)
                * (10 ** ((-1 if self.multiplier_sign else 1) * self.multiplier))
            )
        )

    # = int.from_bytes(message.data, byteorder="little")
    #     string = raw_data & 0x27
    #     value_sign = (raw_data >> CanPrintOffset.VALUE_SIGN_SHIFT) & 0x1
    #     value = (raw_data >> CanPrintOffset.VALUE_SHIFT) & 0xFFFF
    #     multiplier_sign = (raw_data >> CanPrintOffset.MULTIPLIER_SIGN_SHIFT) & 0x1
    #     multiplier = (raw_data >> CanPrintOffset.MULTIPLIER_SHIFT) & 0xF


class CanPrint:
    """
    Main can print class.
    """

    ARB_ID = 0x7FF
    REFRESH_RATE = 100  # Hz

    def __init__(self):
        """
        Initialize exit callbacks, can bus, read args.
        """
        # Parse args
        self.parse_args()

        # Initialize the can bus
        self.init_can()

        # Register callback for closing bus gracefully
        atexit.register(self.close_bus)

        # Register callback for keyboard interrupt
        signal.signal(signal.SIGINT, self.signal_handler)

        # Decode messages
        self.can_print()

    def init_can(self) -> Bus:
        """
        Initialize the can bus.
        """
        filters = [{"can_id": self.ARB_ID, "can_mask": 0x7FF, "extended": False}]
        self.bus = can.interface.Bus(
            channel=self.args.bus,
            bustype="socketcan",
            bitrate=self.args.bitrate,
            ignore_rx_error_frames=True,
            can_filters=filters,
        )

    def can_print(self):
        """
        Read and process can print messages until a keyboard interrupt.
        """
        while True:
            message = self.bus.recv()
            if message is not None:
                print(CanPrintMessage(raw_data_bytes=message.data))
            time.sleep(1 / self.REFRESH_RATE)

    def decode_message(self, message: Message) -> None:
        """
        Decode a can print message and print to stdout.

        Args:
          message_data (int): Data received from can_print to decode.
        """

    def close_bus(self) -> None:
        """
        Gracefully shut down the can bus.
        """
        self.bus.shutdown()

    def signal_handler(self, sig: any, frame: any) -> None:
        """
        Handle a keyboard interrupt.
        """
        print("Exiting can_print")
        sys.exit(0)

    def parse_args(self):
        """
        Parse input args to can_print.
        """
        parser = argparse.ArgumentParser()
        parser.add_argument(
            "bus",
            type=str,
            default="can0",
            nargs="?",
            help="The can bus to read can_print messages on. Defaults to can0.",
        )
        parser.add_argument(
            "bitrate",
            type=int,
            default="500000",
            nargs="?",
            help="The bitrate to read on the selected can bus. Defaults to 500k.",
        )

        self.args = parser.parse_args()


if __name__ == "__main__":
    CanPrint()
