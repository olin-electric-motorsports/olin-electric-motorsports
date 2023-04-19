from projects.hitl.lib.gpio import PinMode
from ft4222.I2CMaster import Flag


class AD7091R(object):
    def __init__(self, i2c, gpio, vref: float = 2.5, address: int = 0b0100000):
        self.i2c = i2c
        self.gpio = gpio
        self.vref = vref
        self.address = address

        self.gpio.set_mode(19, PinMode.OUTPUT)
        self.gpio.set_mode(20, PinMode.OUTPUT)
        self.gpio.set_mode(21, PinMode.OUTPUT)

        cmd_configure = 0x02
        cfg_upper = 1 << 2
        cfg_lower = 0

        # Configures device in command mode
        self.i2c.i2cMaster_Write(
            self.address, bytes([cmd_configure, cfg_upper, cfg_lower])
        )

    def read_channel(self, channel: int):
        cmd = 0x01
        data = 1 << channel
        self.i2c.i2cMaster_Write(self.address, bytes([cmd, data]))

        cmd = 0x00
        self.i2c.i2cMaster_Write(self.address, bytes([cmd]))
        self.i2c.i2cMaster_WriteEx(self.address, Flag.REPEATED_START)

        results = self.i2c.i2cMaster_Read(self.address, 4)
        return ((results[2] & 0xF) << 8) | results[3]

    def read_channels(self, channels: list):
        pass

    # def set_mux(self, channel: int):
    #     self.gpio.set(19, channel & 0b001)
    #     self.gpio.set(20, channel & 0b010)
    #     self.gpio.set(21, channel & 0b100)
