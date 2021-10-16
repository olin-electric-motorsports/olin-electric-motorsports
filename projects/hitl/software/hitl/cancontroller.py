# Base python
import os
import sys
import time
import threading
from typing import Callable, Tuple
import logging

# Extended python
import cantools
import can


class CANController:
    """High level python object to interface with hardware.

    The CANController works **passively** for reading signals; you create one with a path to a DBC, and it keeps track of all states automatically

    `Confluence <https://docs.olinelectricmotorsports.com/display/AE/CAN+Controller>`_

    :param str can_spec_path: The path to the can spec. For now, we only support ``.dbc`` files. Should be
        stored in ``artifacts``.

    :param str channel: The name of the can channel to use. If using a virtual can bus, use ``vcan0`` or similar;
        if using a real CAN bus, use ``can0`` or similar. You can use ``$ ip link show`` to view options.

    :param int bitrate: The bitrate of the can bus. Defaults to 500K. If using a virtual bus, you can ignore this.
    """

    def __init__(self, can_spec_path: str, channel: str, bitrate: int = 500000):
        # Create logger (all config should already be set by RoadkillHarness)
        self.log = logging.getLogger(name=__name__)

        # Get config

        if "linux" in sys.platform:
            # Bring CAN hardware online
            if "vcan" in channel:
                os.system(f"sudo ip link add dev {channel} type vcan")
                os.system(f"sudo ip link set {channel} up")  # virtual hardware
            else:
                os.system(f"sudo ip link set {channel} up type can bitrate {bitrate} restart-ms 100")  # real hardware
        else:
            self.log.error("Cannot bring up real or fake can hardware; must be on linux.")

        self.message_of_signal, self.signals = self._create_state_dictionary(can_spec_path)

        # Start listening
        bus_type = "socketcan"
        if "linux" in sys.platform:
            can_bus = can.interface.Bus(channel=channel, bustype=bus_type, bitrate=bitrate)
            self.kill_threads = threading.Event()
            listener = threading.Thread(
                target=self._listen,
                name="listener",
                kwargs={
                    "can_bus": can_bus,
                    "callback": self._parse_frame,
                    "kill_threads": self.kill_threads,
                },
            )
            listener.start()
        else:
            can_bus = None
            self.log.error("Not on linux; initializing self.can to None")

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

        NOTE: This module does not yet support CAN injection, so setting
        the state of a signal only updates an internal lookup dictionary
        """
        try:
            msg = self.message_of_signal[signal]
            self.signals[msg][signal] = value
        except KeyError:
            raise Exception(f"Cannot set state of signal '{signal}'. It wasn't found.")

    def _create_state_dictionary(self, path: str) -> None:
        """Generate self.message_of_signal and self.signals

        :param str path: Path the the CAN spec file
        """
        # Create database that has all the messages in the dbc file in type message
        self.db = cantools.database.load_file(path)

        # Iterates through messages to create state dictionaries
        message_of_signal = {}
        signals = {}
        for msg in self.db.messages:
            if msg.name not in message_of_signal:
                signals[msg.name] = {}
            for sig in msg.signals:
                signals[msg.name][sig.name] = 0
                message_of_signal[sig.name] = msg.name

        return message_of_signal, signals

    def _parse_frame(self, msg):
        """
        Callback function to the listener thread.
        
        Parses through a CAN frame and updates the self.states dictionary
        """
        # Get the message name
        msg_name = self.db.get_message_by_frame_id(msg.arbitration_id)
        # Decode the data
        data = self.db.decode_message(msg.arbitration_id, msg.data)
        # Update the state dictionary
        self.signals[msg_name].update(data)

    def __del__(self):
        """Destructor (called when the program ends)

        End the listener thread for clean teardown
        """
        if hasattr(self, "kill_threads"):
            self.kill_threads.set()

    def _listen(self, can_bus: can.Bus, callback: Callable, kill_threads: threading.Event) -> None:
        """Thread that runs all the time to listen to CAN messages

        References:
          - https://python-can.readthedocs.io/en/master/interfaces/socketcan.html
          - https://python-can.readthedocs.io/en/master/
        """
        while not kill_threads.isSet():
            msg = can_bus.recv(1)  # 1 second receive timeout
            if msg:
                callback(msg)
        can_bus.shutdown()
