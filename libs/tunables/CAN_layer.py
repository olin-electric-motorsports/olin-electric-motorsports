# Uses can to communicate via CAN from computer to car
import can
from pprint import pprint


# CAN section


class TunablesCAN:
    def __init__(self, channel_para="can0", bitrate_para=500000):
        self.bus = can.Bus(
            bustype="socketcan", channel=channel_para, bitrate=bitrate_para
        )

    # Sending CAN msgs
    def send(self, funcType, parameter_id, new_value=0):
        parameter_id = int(parameter_id)
        # Format for message sent is [get/set, parameter Id, new value/0 if get function]

        # Getter
        if funcType == 0:
            message = [funcType, parameter_id]

        # Setter
        elif funcType == 1:
            message = [funcType, parameter_id, new_value]

        msg = can.Message(arbitration_id=0x6E1, data=message, is_extended_id=False)
        self.bus.send(msg)

    # Receives CAN msgs
    def receive(self):

        # Wait 10 seconds to receive message before closing
        message = self.bus.recv(10)

        # Timeout Problem
        if message is None:
            return "Timeout Occurred. No message"

        # Returns message
        return message
