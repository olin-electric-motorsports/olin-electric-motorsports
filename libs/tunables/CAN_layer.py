# Cantools used to read DBC files


# Uses can to communicate via CAN from computer to car
import can
from pprint import pprint


# CAN section


class TunablesCAN:
    def __init__(self):
        self.bus = can.Bus(bustype="socketcan", channel="can0", bitrate=500000)

    def send(self, funcType, parameter_id, new_value=0):

        message = [funcType, parameter_id, 0, 0, new_value]

        msg = can.Message(arbitration_id=0x6E1, data=message, is_extended_id=False)

        self.bus.send(msg)

    def recieve(self):
        message = self.bus.recv()
        return self.bus.decode_message(message.arbitration_id, message.data)
