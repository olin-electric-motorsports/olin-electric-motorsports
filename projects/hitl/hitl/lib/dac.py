from math import floor
from ft4222.GPIO import Dir, Port


class AD5675(object):
    def __init__(self, i2c, vref: float, address=0b0001100):
        self.i2c = i2c
        self.address = address
        self.vref = vref

        # LDAC pin initialization
        self.i2c.setSuspendOut(False)  # Use GPIO 2 as a pin
        self.i2c.gpio_Init(gpio2=Dir.OUTPUT)
        self.i2c.gpio_Write(Port.P2, True)

    def write(self, channel: int, value: float):
        """Value should be passed in as number from 0 to VDD"""
        assert channel < 8

        cmd = 0b00110000 | channel

        data = value / self.vref * 65535.0
        data = floor(data)
        data_high = (data & 0xFF00) >> 8
        data_low = data & 0x00FF

        self.i2c.i2cMaster_Write(self.address, bytes([cmd, data_high, data_low]))

    def load(self, channel: int, value: float):
        assert channel < 8

        cmd = 0b00010000 | channel

        data = floor(value / self.vref) * 65535
        data_high = (data & 0xFF00) >> 8
        data_low = data & 0x00FF

        self.i2c.i2cMaster_Write(self.address, bytes([cmd, data_high, data_low]))

    def trigger(self):
        self._ldac_enable()
        self._ldac_disable()
        self._ldac_enable()

    def _ldac_disable(self):
        self.i2c.gpio_Write(Port.P2, True)

    def _ldac_enable(self):
        self.i2c.gpio_Write(Port.P2, False)
