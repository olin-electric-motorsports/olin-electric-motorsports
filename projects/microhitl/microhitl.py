import serial
from enum import Enum

class PinTypes(Enum):
    INPUT = "INPUT"
    OUTPUT = "OUTPUT"


class Values(Enum):
    HIGH = "HIGH"
    LOW = "LOW"

class MicroHitl():
    def __init__(self, port='/dev/ttyACM0', baudrate=9600, timeout=.1):
        self.arduino = serial.Serial(
            port=port, baudrate=baudrate, timeout=timeout)

    def write_pin(self, pin: int, output_value: Values):
        '''Writes to pin with Value of HIGH or LOW'''

        self.arduino.write(
            f"gpio_write {pin} {output_value.value}\r\n".encode())

    def read_pin(self, pin: int):
        '''Reads from pin and return true if output contains read:HIGH and 
        false if output contains read:LOW. Raises exception if neither is 
        present'''

        self.arduino.write(f"gpio_read {pin}\r\n".encode())
        output = self.arduino.readline().decode("utf-8").strip()

        if (output == 'read:HIGH'):
            return True
        elif (output == 'read:LOW'):
            return False
        else:
            raise Exception(
                f"Read from pin \"{pin}\" resulted in invalid output \"{output}\"")

    def configure_pin(self, pin: int, pin_type: PinTypes):
        '''Configures arduino pins as INPUT or OUTPUT'''

        self.arduino.write(
            f"gpio_mode {pin} {pin_type.value}\r\n".encode())
