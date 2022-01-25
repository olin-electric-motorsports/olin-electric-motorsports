from traceback import print_tb
import serial
from enum import Enum
import time


class PinTypes(Enum):
    INPUT = "INPUT"
    OUTPUT = "OUTPUT"


class Values(Enum):
    HIGH = "HIGH"
    LOW = "LOW"


class Arduino():
    def __init__(self, port='/dev/ttyACM0', baudrate=9600, timeout=.1):
        self.arduino = serial.Serial(
            port=port, baudrate=baudrate, timeout=timeout)

    def write_pin(self, pin: int, output_value: Values):
        '''Writes to arduino pin with Value of HIGH or LOW'''
        self.arduino.write(
            f"ioctrl -p {pin} -w {output_value.value}\r".encode('utf-8'))

    def read_pin(self, pin: int):
        '''Reads from arduino pin and return true if output contains HIGH'''
        self.arduino.write(f"ioctrl -p {pin} -r \r".encode('utf-8'))
        self.arduino.readline()
        output = self.arduino.readline()
        print(output)
        return 'read:HIGH' in output.decode("utf-8")

    def configure_pin(self, pin: int, pin_type: PinTypes):
        '''Configures arduino pins as INPUT or OUTPUT'''
        self.arduino.write(
            f"ioctrl -p {pin} -m {pin_type.value}\r".encode('utf-8'))
        if (pin_type is PinTypes.INPUT):
            time.sleep(0.5)
            for i in range(10):
                self.read_pin(pin)
