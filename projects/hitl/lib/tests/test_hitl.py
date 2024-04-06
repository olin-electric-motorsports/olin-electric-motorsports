import pytest
from projects.hitl.lib.hitl import HitL, PinType, PinMode
from projects.hitl.lib.adc import PINS, Channel


@pytest.fixture
def hitl():
    hitl = HitL(
        canbus=None,
        can_dbc=None,
        vbus=5.0,
        pins=[
            {
                "name": "led0",
                "pintype": PinType.DIGITAL,
                "number": 8,
                "dir": PinMode.OUTPUT,
            },
            {
                "name": "led1",
                "pintype": PinType.DIGITAL,
                "number": 12,
                "dir": PinMode.OUTPUT,
            },
            {
                "name": "test_in",
                "pintype": PinType.DIGITAL,
                "number": 18,
                "dir": PinMode.INPUT,
            },
            {
                "name": "test_out",
                "pintype": PinType.DIGITAL,
                "number": 19,
                "dir": PinMode.OUTPUT,
            },
            {
                "name": "dac0",
                "pintype": PinType.ANALOG,
                "number": 7,
                "dir": PinMode.OUTPUT,
            },
            {
                "name": "adc0",
                "pintype": PinType.ANALOG,
                "number": PINS[Channel.SELF_TEST],
                "dir": PinMode.INPUT,
            },
        ],
    )

    yield hitl

    hitl.close()


def test_leds(hitl):
    hitl.led0.set(0)
    hitl.led1.set(1)


def test_analog_feedback(hitl):
    analog_write = 1.25
    hitl.dac0.set(analog_write)
    analog_read = hitl.adc0.get()
    assert abs(analog_write - analog_read) < 0.05


def test_gpio_feedback(hitl):
    hitl.test_out.set(1)
    assert hitl.test_in.get() == 1
