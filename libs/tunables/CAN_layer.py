# Cantools used to read DBC files


# Uses can to communicate via CAN from computer to car
import cantools
import can
from pprint import pprint


# CAN section


class TunablesCAN:
    def __init__(self):
        self.bus = can.Bus(bustype="slcan", channel="/dev/ttyACM0", bitrate=500000)

    def send(self, funcType, parameter_id, new_value=0):
        message = [funcType, parameter_id, 0, 0, new_value]

        msg = can.Message(arbitration_id=0x6E0, data=message, is_extended_id=False)

        try:
            self.bus.send(msg)
            print("Message sent on {}".format(bus.channel_info))
        except can.CanError:
            print("Error")

    def recieve(self):
        message = self.bus.recv()
        return self.bus.decode_message(message.arbitration_id, message.data)
