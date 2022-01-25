from microhitl.microhitl import MicroHitl, Values, PinTypes
import time
import asyncio

if __name__ == "__main__":
    arduino = MicroHitl()
    arduino.configure_pin(6, PinTypes.OUTPUT)
    arduino.configure_pin(5, PinTypes.INPUT)
    arduino.write_pin(5, Values.HIGH)
    while True:
        print(arduino.read_pin(5))