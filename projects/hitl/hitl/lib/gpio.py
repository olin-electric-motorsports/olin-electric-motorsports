from enum import Enum, auto
from ft4222.I2CMaster import Flag as I2C_Flag
import time


class PinMode(Enum):
    INPUT = auto()
    OUTPUT = auto()


class MAX7300(object):
    def __init__(self, i2c, address=0b1000000):
        self.i2c = i2c
        self.address = address

        self.i2c.i2cMaster_Write(self.address, bytes([0x4, 0b1]))

    def set_mode(self, pin, mode):
        # self.log.debug("Setting GPIO{} to mode {}".format(pin, mode))
        assert (pin >= 4) and (pin <= 31)

        # Datasheet Table 5.
        cmd = 0b00001000  # Base address for "Port Configuration"
        cmd |= ((pin - 4) // 4) + 1  # Convert from the pin number to
        # which port configuration register it resides in

        self.i2c.i2cMaster_Write(self.address, bytes([cmd]))
        data = int.from_bytes(self.i2c.i2cMaster_Read(self.address, 1), "little")

        if mode == PinMode.INPUT:
            # This bit of math converts the pin number into the offset used for
            # the mode. Datasheet Table 2.
            data &= ~((0b11) << (((pin - 4) % 4) * 2))
            data |= 0b10 << (((pin - 4) % 4) * 2)
        elif mode == PinMode.OUTPUT:
            data &= ~((0b11) << (((pin - 4) % 4) * 2))
            data |= 0b01 << (((pin - 4) % 4) * 2)
        else:
            raise Exception("Unknown/unsupported pintype: {}".format(mode))

        self.i2c.i2cMaster_Write(self.address, bytes([cmd, data]))

        # self.i2c.i2cMaster_Write(self.address, bytes([cmd]))
        # print("READBACK: ", self.i2c.i2cMaster_Read(self.address, 1))

    def set(self, pin, value):
        assert (pin >= 4) and (pin <= 31)
        cmd = 0b00100000 | pin
        data = value  # This should be 0 or 1

        self.i2c.i2cMaster_Write(self.address, bytes([cmd, data]))

    def get(self, pin):
        assert (pin >= 4) and (pin <= 31)
        cmd = 0b00100000 | pin

        # First write to set the register we want to read from
        self.i2c.i2cMaster_Write(self.address, bytes([cmd]))

        return int.from_bytes(self.i2c.i2cMaster_Read(self.address, 1), "little")
