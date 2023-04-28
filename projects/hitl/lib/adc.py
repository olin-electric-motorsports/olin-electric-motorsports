from enum import Enum, auto
from projects.hitl.lib.gpio import PinMode
from ft4222.I2CMaster import Flag


class Cfg(Enum):
    DIRECT = auto()
    MUX = auto()


class AdcPin(object):
    def __init__(
        self, configuration, scalar: float, channel: int = None, offset: float = 0.0
    ):
        self.configuration = configuration
        self.scalar = scalar
        self.channel = channel
        self.offset = offset
        self.mux_channel = channel


class Channel(Enum):
    ADC1 = auto()
    ADC2 = auto()
    ADC3 = auto()
    ADC4 = auto()
    ADC5 = auto()
    ADC6 = auto()
    BARREL_JACK = auto()
    USB_5V = auto()
    VBUS = auto()
    SELF_TEST = auto()


PINS = {
    Channel.ADC1: AdcPin(Cfg.DIRECT, 1.0, 0),
    Channel.ADC2: AdcPin(Cfg.DIRECT, 1.0, 1),
    Channel.ADC3: AdcPin(Cfg.MUX, 1.0, 0),
    Channel.ADC4: AdcPin(Cfg.MUX, 1.0, 1),
    Channel.ADC5: AdcPin(Cfg.MUX, 1.0, 2),
    Channel.ADC6: AdcPin(Cfg.MUX, 1.0, 3),
    Channel.BARREL_JACK: AdcPin(Cfg.MUX, 0.2, 4),
    Channel.USB_5V: AdcPin(Cfg.MUX, 0.2, 5),
    Channel.VBUS: AdcPin(Cfg.MUX, 0.5, 7, offset=2.0),
    Channel.SELF_TEST: AdcPin(Cfg.DIRECT, 1.0, 3),
}


class AD7091R(object):
    def __init__(self, i2c, gpio, vref: float = 5.0, address: int = 0b0101111):
        self.i2c = i2c
        self.gpio = gpio
        self.vref = vref
        self.address = address

        # Configure mux pins
        self.gpio.set_mode(19, PinMode.OUTPUT)
        self.gpio.set_mode(20, PinMode.OUTPUT)
        self.gpio.set_mode(21, PinMode.OUTPUT)

        # Configures device in command mode
        cmd_configure = 0x02
        cfg_upper = 1 << 2
        cfg_lower = 0

        self.i2c.i2cMaster_Write(
            self.address, bytes([cmd_configure, cfg_upper, cfg_lower])
        )

    def read(self, pin: AdcPin):
        if pin.configuration == Cfg.DIRECT:
            raw = self.read_channel(pin.channel)
            raw_v = raw / 4096.0 * self.vref
            return (raw_v / pin.scalar) - pin.offset
        elif pin.configuration == Cfg.MUX:
            self.set_mux(pin.channel)
            raw = self.read_channel(2)
            raw_v = raw / 4096.0 * self.vref
            return (raw_v / pin.scalar) - pin.offset
        else:
            raise Exception("Invalid ADC type: {}".format(pin.configuration))

    def read_channel(self, channel: int):
        cmd = 0x01
        data = 1 << channel
        self.i2c.i2cMaster_Write(self.address, bytes([cmd, data]))

        cmd = 0x00
        self.i2c.i2cMaster_Write(self.address, bytes([cmd]))

        # TODO: WriteEx, Write, ReadEx, Read?
        self.i2c.i2cMaster_Write(self.address, bytes([cmd]))

        results = self.i2c.i2cMaster_Read(self.address, 4)
        return ((results[2] & 0xF) << 8) | results[3]

    def read_channels(self, channels: list):
        pass

    def set_mux(self, channel: int):
        self.gpio.set(19, int(bool(channel & 0b001)))
        self.gpio.set(20, int(bool(channel & 0b010)))
        self.gpio.set(21, int(bool(channel & 0b100)))
