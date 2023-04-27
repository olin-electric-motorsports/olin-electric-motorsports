import pytest
from projects.hitl.lib.hitl import HitL, PinType, PinMode


@pytest.fixture
def hitl():
    hitl = HitL(
        can_network = "can0",
        vbus = 5.0,
        pins = [
            {
                "name": "led0",
                "pintype": PinType.DIGITAL,
                "number": 8,
                "dir": PinMode.OUTPUT,
            }
        ]
    )

    yield hitl

    print("Called")

    hitl.close()


def test_leds(hitl):
    hitl.led0.set(1)
