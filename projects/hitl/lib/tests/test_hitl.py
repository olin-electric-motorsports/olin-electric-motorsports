from projects.hitl.lib.hitl import HitL, PinType, PinMode


def test_leds():
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

    # hitl.gpio.set_mode(8, PinMode.OUTPUT)
    hitl.led0.set(1)
    # hitl.dac.trigger()
