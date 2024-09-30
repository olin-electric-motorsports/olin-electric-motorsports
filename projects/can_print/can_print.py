"""
Continuously read a CAN bus for can_print messages and decode accordingly.
"""

import can, atexit, signal, sys, argparse, time, os, subprocess, re
from can import Bus, Message
from enum import IntEnum, Enum
from typing import Optional
from dataclasses import dataclass

INT16_MAX = 32767
BUS_DEFAULT = "can0"
BITRATE_DEFAULT = 500000


def singleton(cls):
    """
    Singleton design pattern.
    """
    instances = {}

    def get_instance(*args, **kwargs):
        if cls not in instances:
            instances[cls] = cls(*args, **kwargs)
        return instances[cls]

    return get_instance


class CharDecode(IntEnum):
    """
    DecodeChar input options.
    """

    NULL = 0x0
    A = 0x01
    B = 0x02
    C = 0x03
    D = 0x04
    E = 0x05
    F = 0x06
    G = 0x07
    H = 0x08
    I = 0x09
    J = 0x0A
    K = 0x0B
    L = 0x0C
    M = 0x0D
    N = 0x0E
    O = 0x0F
    P = 0x10
    Q = 0x11
    R = 0x12
    S = 0x13
    T = 0x14
    U = 0x15
    V = 0x16
    W = 0x17
    X = 0x18
    Y = 0x19
    Z = 0x1A
    DASH = 0x1B
    UNDERSCORE = 0x1C
    UNSUPPORTED_CHAR = 0x1F


class TargetMCUs(Enum):
    ATMEGA16M1 = ("16m1",)
    ATMEGA64M1 = ("64m1",)
    ATMEGA328P = ("328p",)


@singleton
class DecodeChar:
    """
    Class for decoding characters.
    """

    @staticmethod
    def decode(num: int) -> str:
        """
        Return the decoded char as a string.

        Args:
          num (int): The number to decode.
        """
        character = CharDecode(num)
        if character == CharDecode.NULL:
            return "\0"
        elif character == CharDecode.DASH:
            return "-"
        elif character == CharDecode.UNDERSCORE:
            return "_"
        elif character == CharDecode.UNSUPPORTED_CHAR:
            return repr("\uFFFd")[1:2]
        else:
            return character.name.lower()


@dataclass
class CanPrintOffset:
    """
    Class to hold the bitshift amount for each field in a can_print message.
    """

    VALUE_SHIFT = 0x28
    MULTIPLIER_SHIFT = 0x38


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
    _value: Optional[int] = 0
    _multiplier: Optional[int] = 0

    @property
    def raw_data(self) -> int:
        """
        Convert raw data from a bytearray to an int.

        Returns:
          An int representing the raw data.
        """
        return int.from_bytes(self.raw_data_bytes, byteorder="little")

    @property
    def string(self) -> str:
        """
        Derive the string from raw can print data.

        Returns:
          The string in a can print message.
        """
        # print(bin(self.raw_data))
        return "".join(
            [
                DecodeChar().decode(
                    ((self.raw_data & 0xFFFFFFFFFF) >> (5 * char)) & 0x1F
                )
                for char in range(0, 8)
            ]
        )

    @property
    def value(self) -> int:
        """
        Derive the value from raw can print data.

        Returns:
          The value associated with a can print message.
        """
        raw_value = (self.raw_data >> CanPrintOffset.VALUE_SHIFT) & 0xFFFF
        if raw_value > 0x7FFF:
            return -((~(raw_value) & 0x7FFF) + 1)
        else:
            return raw_value

    @property
    def multiplier(self) -> int:
        """
        Derive the multiplier from raw can print data.
        """
        raw_multiplier = (self.raw_data >> CanPrintOffset.MULTIPLIER_SHIFT) & 0xF
        if raw_multiplier > 0x7:
            return -((~(raw_multiplier) & 0x7) + 1)
        else:
            return raw_multiplier

    def __str__(self) -> str:
        """
        String representation of a can print message.
        """
        if (self.value == INT16_MAX) and (self.multiplier == 0x7):
            return self.string
        return self.string + ": " + str((self.value) * (10 ** (self.multiplier)))


class CanPrint:
    """
    Main can print class.
    """

    ARB_ID = 0x7FF
    REFRESH_RATE = 100  # Hz, upper bound

    def __init__(self):
        """
        Initialize exit callbacks, can bus, read args.
        """
        # Parse args
        self.parse_args()

        # Resolve input variables
        self.resolve_variables()

        # Flash target
        if self.flash:
            self.flash_mcu()

        # Initialize the can bus
        self.init_can()

        # Register callback for closing bus gracefully
        atexit.register(self.close_bus)

        # Register callback for keyboard interrupt
        signal.signal(signal.SIGINT, self.signal_handler)

        # Signal beginning of can print stdout
        print("_" * 10 + "begin can print output" + "_" * 10)

        # Decode messages
        self.can_print()

    def init_can(self) -> Bus:
        """
        Initialize the can bus.
        """
        filters = [{"can_id": self.ARB_ID, "can_mask": 0x7FF, "extended": False}]
        self.bus = can.interface.Bus(
            channel=self.bus,
            bustype="socketcan",
            bitrate=self.bitrate,
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
            nargs="?",
            help="The can bus to read can_print messages on. Defaults to can0.",
        )
        parser.add_argument(
            "bitrate",
            type=int,
            nargs="?",
            help="The bitrate to read on the selected can bus. Defaults to 500k.",
        )

        self.args = parser.parse_args()

    def resolve_variables(self):
        """
        Resolve variables from cli or env.
        """
        if self.args.bus:
            self.bus = self.args.bus
        else:
            try:
                self.bus = os.environ["CAN_BUS"]
            except:
                # Use default
                self.bus = BUS_DEFAULT

        if self.args.bitrate:
            self.bitrate = self.args.bitrate
        else:
            try:
                self.bitrate = int(os.environ["BITRATE"])
            except:
                # Use default
                self.bitrate = BITRATE_DEFAULT

        try:
            self.flash = True if os.environ["FLASH"] == "True" else False
        except:
            # Use default
            self.flash = False

        try:
            self._flash_target = os.environ["FLASH_TARGET"]
        except:
            self._flash_target = None

        try:
            self.flash_isp = os.environ["FLASH_ISP"]
        except:
            self.flash_isp = None

        try:
            self._target_mcu = os.environ["TARGET_MCU"]
        except:
            self._target_mcu = None

    @property
    def flash_target(self):
        """
        Process the flash target input.
        """
        if self._flash_target is None:
            return None
        target_split = ((self._flash_target).removesuffix(".sh")).split("/")
        return "//" + target_split[0] + "/" + target_split[1] + ":" + target_split[2]

    @property
    def target_mcu(self):
        """
        Process the target mcu input.
        """
        if self._target_mcu is None:
            return None
        for mcu in TargetMCUs:
            if mcu.value[0] in self._target_mcu:
                return mcu.value[0]
        return None

    @property
    def repo_root_dir(self):
        """
        Find the root directory of the repo.

        # Janky.
        """
        output = subprocess.run(  # Trick Bazel into giving absolute dir of OEM repo.
            ["bazel", "info", "workspace"],
            stdout=subprocess.PIPE,
            stderr=subprocess.STDOUT,
            text=True,
        ).stdout
        match = re.search(r"'(.*?)'", output)
        return match.group(1) if match else None

    def flash_mcu(self):
        """
        Flash the target.

        This is a janky way of flashing the target and running the can print
        decoder directly after, all in one Bazel rule. Due to a lack of Bazel
        knowledge, this is the best I can do at this point. Hopefully this can
        be updated in the future to properly leverage Bazel. Ideally, with a
        single Bazel command, an image would be built, flashed, and the
        can print py_binary would be initialized, all in one Bazel rule and
        completely within Bazel. Instead, the firmware is built, and the can
        print binary is initialized, which flashes the image if the proper
        environment variables are provided via env.
        """
        command = [
            "bazel",
            "run",
            f"--config={self.target_mcu}",
            "-c",
            "opt",
            self.flash_target,
            "--",
            "-c",
            self.flash_isp,
        ]
        # Hacky at best, will definitely break in the future at worst!
        os.chdir(self.repo_root_dir)
        output = subprocess.Popen(
            command, stdout=subprocess.PIPE, stderr=subprocess.STDOUT, text=True
        )

        for line in output.stdout:
            print(line, end="")


if __name__ == "__main__":
    CanPrint()
