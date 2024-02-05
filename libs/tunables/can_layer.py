"""Handles all CAN-related functions in tunables through TunablesCAN class """
import can


# CAN section
class TunablesCAN:
    """A class used in tunables that all all CAN related tasks
    which tunable uses to communicate between the host computer and the car.

    Attributes:
        bus: A can.Bus instance which is sets the settings for
        which channel and bitrate we will be sending CAN messages
        from.
    """

    def __init__(self, channel="can0", bitrate=500000):
        """Initialization Function which just creates a can.Bus
        instance given parameters

        Args:

            channel: Indicates which parameter we'll be using
            for sending our messages. By default it is set to can0.
            bitrate: Sets the bitrate of our CAN messages. By default
            it is 50,000
        """
        self.bus = can.Bus(bustype="socketcan", channel=channel, bitrate=bitrate)

    # Sending CAN msgs
    def send(self, func_type, parameter_id, arbit_id, new_value=None):
        """Sends a CAN message to the CAR in the tunables format

        Args:
            func_type: An int which defines what type
            of function we'll be sending in the tunables library.
                0: A getter function
                1: A setter function
                2: A measure function
            parameter_id: A hex/int which is the parameter/ecu id
            we're specifically targeting.

            new_value: An optional list with only int/hex which
            contains the new value of the tunable parameter.
            Should only be relevant if our func_type is 1."""
        parameter_id = int(parameter_id)
        # Format for message sent is [get/set, parameter Id, new value/0 if get function]

        # Basic Format
        message = [func_type, parameter_id]

        # Setter
        if func_type == 1:
            # new_value's inital input will be an string of an int.
            # Convert first into hex
            hex_val = int(new_value).to_bytes(6, "big").hex()
            # Format into a list
            hex_list = [int(hex_val[i : i + 2], 16) for i in range(0, len(hex_val), 2)]

            message = message + hex_list

        msg = can.Message(arbitration_id=arbit_id, data=message, is_extended_id=False)
        self.bus.send(msg)

    # Receives CAN msgs
    def receive(self, can_id, can_mask):
        """Receives A can message. Will wait 10
        seconds before timing out.

        Args:
            can_id: A can_id to be used for our filters.
            can_mask: our mask value for our filter.

        Return:
            A string message it received or a string timeout
            message"""

        # Set filters
        self.bus.set_filters([{"can_id": can_id, "can_mask": can_mask}])

        # Wait 10 seconds to receive message before closing
        message = self.bus.recv(10)

        # Timeout Problem
        if message is None:
            raise TimeoutError("Timeout Occurred. No message")

        # Returns message
        return message
