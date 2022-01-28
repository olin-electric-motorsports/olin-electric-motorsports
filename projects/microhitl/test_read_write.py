from projects.microhitl.microhitl import MicroHitl, Values, PinTypes
import time
import os

'''Script to test the read and write of the MicroHitl python wrapper'''


if __name__ == "__main__":
    port = os.getenv("ARDUINO_PORT") or "/dev/ttyACM0"
    arduino = MicroHitl(port=port) # Wait 2 seconds for the device to boot up
    time.sleep(2)
    arduino.configure_pin(5, PinTypes.OUTPUT)
    arduino.configure_pin(6, PinTypes.INPUT)
    while True:
        arduino.write_pin(5, Values.HIGH)
        time.sleep(0.25)
        arduino.write_pin(5, Values.LOW)
        time.sleep(0.25)
        print(arduino.read_pin(6))
