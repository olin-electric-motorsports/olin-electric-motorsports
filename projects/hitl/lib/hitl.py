from projects.hitl.lib.gpio import MAX7300, PinMode
import ft4222
from functools import partial


class PinType(Enum):
    ANALOG = auto()
    DIGITAL = auto()


class Pin(object):
    def __init__(self, name: str, pintype: PinType, channel: int, getter, setter):
        self.name = name
        self.pintype = pintype
        self.channel = channel
        self.getter = getter
        self.setter = setter

    def set(self, value):
        self.setter(value)

    def get(self, value):
        return self.getter()


class AdcPin(Enum):
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


# def hitl_pin_to_channel(pin_num: int, pintype: PinType, pinmode):
#     if pintype == PinType.ANALO


class HitL(object):
    """
    This class represents the HitL board which contains a GPIO, DAC, and ADC
    that can be interfaced with using USB/I2C. It also contains helpful
    functions for dealing with CAN communications.
    """

    def __init__(self, device, can_network, pins=[]):
        i2c_proxy = ft4222.openByDescription("FT4222 A")
        i2c_proxy.i2cMaster_Init(400000)
        # openByLocation("/dev/ttyUSB...")

        self.gpio = MAX7300(i2c_proxy)
        self.dac = AD5675(i2c_proxy, vref=5.0)
        self.adc = Adc(i2c_proxy, self.gpio, vref=2.5)  # Pass GPIO to use for mux
        self.can = CanController(can_network, baudrate=500000)

        assert self.gpio.address != self.dac.address
        assert self.gpio.address != self.adc.address
        assert self.dac.address != self.adc.address

        self.log = logging.getLogger(name="hitl")

        self.log.info("Running initialization self-test...")
        self.self_test()
        self.log.info("Passed self-test.")

        v_usb = self.adc_read(AdcPin.USB_5V)
        v_barrel = self.adc_read(AdcPin.BARREL_JACK)
        v_bus = self.adc_read(AdcPin.VBUS)

        self.log.info("Measured v_usb = {}".format(v_usb))
        self.log.info("Measured v_barrel = {}".format(v_barrel))
        self.log.info("Measured v_bus = {}".format(v_bus))

        for pin in pins:
            self.register_pin(pin["name"], pin["pintype"], pin["number"], pin["dir"])

        self.log.info("HitL initialization complete.")

    def register_pin(self, name: str, pintype: PinType, number: int):
        if pintype == PinType.ANALOG:
            getter = self.read_adc
            setter = partial(self.dac.write, number)
        elif pintype == PinType.DIGITAL:
            getter = partial(self.gpio.get, number)
            setter = partial(self.gpio.set, number)
        else:
            raise Exception(
                "Invalid pin type: {}. Must use PinType.ANALOG or PinType.DIGITAL".format(
                    pintype
                )
            )

        setattr(
            self,
            name,
            Pin(
                name=name,
                pintype=pintype,
                channel=number,
                getter=getter,
                setter=setter,
            ),
        )

    def read_adc(self, hitl_pin: AdcPin, scalar: float):
        if hitl_pin in [AdcPin.ADC1, AdcPin.ADC2]:
            pass
        elif hitl_pin in [
            AdcPin.ADC3,
            AdcPin.ADC4,
            AdcPin.ADC5,
            AdcPin.ADC6,
            AdcPin.VBUS,
            AdcPin.BARREL_JACK,
            AdcPin.USB_5V,
        ]:
            # Set mux and read channel 2
            pass
        else:
            raise Exception("Invalid ADC type")

    def self_test(self):
        # GPIO
        self.gpio.set_mode(18, PinMode.OUTPUT)
        assert self.gpio.get(19) == 1

        # DAC/ADC
        test_val = 1.5
        self.dac.write(channel=8, value=test_val)
        result = self.adc.read(channel=3)
        assert abs(result - test_val) < 0.05  # Assert result within 50mV
