# General
from functools import partial
import random
from typing import Union
from enum import Enum, auto
import logging
import time

# Specific
import ft4222
from can.interface import Bus

# Project
from projects.hitl.lib.can_controller import CANController
from projects.hitl.lib.gpio import MAX7300, PinMode
from projects.hitl.lib.adc import (
    AD7091R,
    AdcPin,
    PINS as ADC_PINS,
    Channel as AdcChannel,
)
from projects.hitl.lib.dac import AD5675


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

    def get(self):
        return self.getter()


class HitL(object):
    """
    This class represents the HitL board which contains a GPIO, DAC, and ADC
    that can be interfaced with using USB/I2C. It also contains helpful
    functions for dealing with CAN communications.
    """

    def __init__(self, canbus: Bus, can_dbc: str, vbus: float = 5.0, pins=[]):
        self.log = logging.getLogger(name="hitl")

        if not canbus and not can_dbc:
            self.log.warning("Not operating with CAN")
        else:
            self.can = CANController(can_dbc, canbus, bitrate=500000)

        i2c = ft4222.openByDescription("FT4222 A")
        i2c.i2cMaster_Init(400000)

        self.i2c = i2c

        self.gpio = MAX7300(i2c)
        self.dac = AD5675(i2c, vref=5.0)
        self.adc = AD7091R(i2c, self.gpio, vref=5.0)  # Pass GPIO to use for mux

        self.vbus = vbus

        assert self.gpio.address != self.dac.address
        assert self.gpio.address != self.adc.address
        assert self.dac.address != self.adc.address

        self.log.info("Running initialization self-test...")
        self.self_test()
        self.log.info("Passed self-test.")

        v_usb = self.adc.read(ADC_PINS[AdcChannel.USB_5V])
        v_barrel = self.adc.read(ADC_PINS[AdcChannel.BARREL_JACK])
        v_bus = self.adc.read(ADC_PINS[AdcChannel.VBUS])

        self.log.info("Measured v_usb = {}".format(v_usb))
        self.log.info("Measured v_barrel = {}".format(v_barrel))
        self.log.info("Measured v_bus = {}".format(v_bus))

        for pin in pins:
            self.register_pin(pin["name"], pin["pintype"], pin["number"], pin["dir"])

        self.log.info("HitL initialization complete.")

    def close(self):
        self.i2c.close()

        if getattr(self, can):
            self.can.close()

    def register_pin(
        self, name: str, pintype: PinType, number: Union[int, AdcPin], pindir: PinMode
    ):
        if pintype == PinType.ANALOG:
            if pindir == PinMode.INPUT:
                getter = partial(self.adc.read, number)
                setter = None
            elif pindir == PinMode.OUTPUT:
                setter = partial(self.dac.write, number)
                getter = None
        elif pintype == PinType.DIGITAL:
            getter = partial(self.gpio.get, number)
            setter = partial(self.gpio.set, number)

            if pindir == PinMode.INPUT:
                self.gpio.set_mode(number, PinMode.INPUT)
            elif pindir == PinMode.OUTPUT:
                self.gpio.set_mode(number, PinMode.OUTPUT)
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

    def self_test(self):
        # GPIO
        self.gpio.set_mode(19, PinMode.OUTPUT)
        self.gpio.set_mode(18, PinMode.INPUT)
        self.gpio.set(19, 1)
        assert self.gpio.get(18) == 1

        # DAC/ADC
        test_val = random.uniform(0.0, self.vbus)
        self.dac.write(channel=7, value=test_val)
        result = self.adc.read(ADC_PINS[AdcChannel.SELF_TEST])
        assert abs(result - test_val) < 0.05  # Assert result within 50mV
