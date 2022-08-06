# Base python
import os
import sys
import threading
from typing import Callable, Tuple
import logging
from configparser import ConfigParser
from collections import defaultdict

# Extended python
import cantools
import can

# Project Imports
from .utils import artifacts_path

config = ConfigParser(interpolation=None)
config.read(os.path.join(artifacts_path, "config.ini"))


class CANController:
    """High level python object to interface with hardware.

    The CANController works **passively** for reading signals; you create one with a path to a DBC, and it keeps track of all states automatically

    Args:
        can_spec_path (str): Path to CAN spec. Should be a ``.dbc`` file.
        bustype (str): CAN bustype to use. Dependant on hardware - see OEM CAN documentation for more info
        channel (str): CAN channel to use. Dependant on hardware - see OEM CAN documentation for more info
        bitrate (int): Bitrate of CAN bus. Defaults to 500Kbps, which shouldn't change for most work on our team

    Args are pulled from artifacts/config.ini but can be manually specified as well
    """

    def __init__(
        self,
        can_spec_path: str = config.get(
            "PATH", "dbc_path", fallback="vehicle/mkv/mkv.dbc"
        ),
        bustype: str = config.get("HARDWARE", "can_bustype", fallback="socketcan"),
        channel: str = config.get("HARDWARE", "can_channel", fallback="vcan0"),
        bitrate: int = config.get("HARDWARE", "can_bitrate", fallback=500000),
    ):
        # Create logger (all config should already be set by RoadkillHarness)
        self.log = logging.getLogger(name=__name__)

        # Create empty list of periodic messages
        self.periodic_messages = {}

        # Set up dictionary of messages
        self.message_of_signal, self.signals = self._create_state_dictionary(
            can_spec_path
        )

        if "linux" in sys.platform:
            self.can_bus = can.interface.Bus(
                channel=channel, bustype=bus_type, bitrate=bitrate
            )
            kill_flag = threading.Event()
            listener = threading.Thread(
                target=self._listen,
                name="listener",
                kwargs={"can_bus": self.can_bus, "callback": self._rx_callback, "kill_flag": kill_flag},
            )
            listener.start()
        else:
            self.log.error("Invalid operating system detected. Please use Linux")
            raise Exception("Not on Linux")

    def get_state(self, signal):
        """
        Get the state of a can signal on the car
        """
        try:
            msg = self.message_of_signal[signal]
            return self.signals[msg][signal]
        except KeyError:
            raise Exception(f"Cannot get state of signal '{signal}'. It wasn't found.")

    def set_state(self, signal, value):
        """
        Set the state of a can signal on the car
        """
        try:
            msg_name = self.message_of_signal[signal]
            msg = self.db.get_message_by_name(msg_name)

            # Update internal dictionary
            self.signals[msg_name][signal] = value

            # Encode data and create message
            data = msg.encode(self.signals[msg_name])
            message = can.Message(
                arbitration_id=msg.frame_id, data=data, is_extended_id=False
            )

            # Send message
            if msg_name in self.periodic_messages:
                self.periodic_messages[msg_name].modify_data(message)
            else:
                self.can_bus.send(message)

            self.log.info(f"Set signal {signal} to {value}")
        except KeyError:
            raise Exception(f"Cannot set state of signal '{signal}'. It wasn't found.")

    def set_periodic(self, msg_name, period):
        """
        Set a message to be send periodically, at a specified period in ms

        All states in the message should be set before starting a periodic broadcast,
        though they can be changed without interrupting the periodic broadcast.
        """
        if msg_name not in self.signals:
            raise Exception(f"Message {msg_name} not found in messages.")

        if msg_name in self.periodic_messages:
            raise Exception(f"Message {msg_name} is already being sent periodically.")

        msg = self.db.get_message_by_name(msg_name)

        # Encode message data and create message
        data = msg.encode(self.signals[msg_name])
        message = can.Message(
            arbitration_id=msg.frame_id, data=data, is_extended_id=False
        )

        # Send message
        send_task = self.can_bus.send_periodic(message, period)
        self.periodic_messages[msg_name] = send_task

        self.log.info(f"Set {msg_name} to be sent periodically every {period} ms")

    def stop_periodic(msg_name: str):
        """
        Stop a periodic message task
        """
        self.periodic_messages[msg_name].stop()
        del self.periodic_messages[msg_name]


    def stop_all_periodic(self):
        """
        Stop all periodic message tasks
        """
        self.can_bus.stop_all_periodic_tasks()


    def _create_state_dictionary(self, path: str):
        """Generate self.message_of_signal and self.signals

        Args:
            path (str): Path to CAN spec file (DBC)
        """
        # Create database that has all the messages in the dbc file in type message
        self.db = cantools.database.load_file(path)

        # Iterates through messages to create state dictionaries
        message_of_signal = {}
        signals = defaultdict(lambda: dict()) # doublecheck this
        for msg in self.db.messages:
            for sig in msg.signals:
                signals[msg.name][sig.name] = 0
                message_of_signal[sig.name] = msg.name

        return message_of_signal, signals

    def _rx_callback(self, msg):
        """
        Callback function to the listener thread.

        Parses through a CAN frame and updates the self.states dictionary
        """
        # Get the message name
        msg_name = self.db.get_message_by_frame_id(msg.arbitration_id).name
        # Decode the data
        data = self.db.decode_message(msg.arbitration_id, msg.data)
        # Update the state dictionary
        self.signals[msg_name].update(data)

    def _listen(self, can_bus: can.Bus, callback: Callable) -> None:
        """Thread that runs all the time to listen to CAN messages

        References:
          - https://python-can.readthedocs.io/en/master/interfaces/socketcan.html
          - https://python-can.readthedocs.io/en/master/
        """
        while not kill_flag.is_set():
            msg = can_bus.recv(1)  # 1 second receive timeout
            if msg:
                callback(msg)

        can_bus.shutdown()
        self.log.info('Shut down CAN hardware gracefully')

