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

    The CANController works **passively** for reading signals; you create one with a dictionary of ECUs, and it
    will automatically keep all of their CAN states updated according to the CAN traffic it reads.

    `Confluence <https://docs.olinelectricmotorsports.com/display/AE/CAN+Controller>`_

    :param dict ecus: A dictionary of ``str : ECU`` pairs. The CANController needs this to automatically
        update the states of those ECUs. The keys in this dictionary should match the names of the senders in your
        can spec file.

    :param str can_spec_path: The path to the can spec. For now, we only support ``.dbc`` files. Should be
        stored in ``artifacts``.

    :param str channel: The name of the can channel to use. If using a virtual can bus, use ``vcan0`` or similar;
        if using a real CAN bus, use ``can0`` or similar. You can use ``$ ip link show`` to view options.

    :param int bitrate: The bitrate of the can bus. Defaults to 500K. If using a virtual bus, you can ignore this.
    """

    def __init__(self, ecus: dict, can_spec_path: str, channel: str, bitrate: int = 500000):
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

        self.ecus = ecus
        self.read_dict = {}  # Dictionary to help translate raw can to useful signals
        self._get_states(can_spec_path)

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
                    "callback": self._update_ecu,
                    "kill_threads": self.kill_threads,
                },
            )
            listener.start()
        else:
            can_bus = None
            self.log.error("Not on linux; initializing self.can to None")

    def _update_ecu(self, message: can.Message) -> None:
        """Update an ECUs states

        :param can.Message message: The `can message <https://python-can.readthedocs.io/en/master/message.html#can.Message>`_ that was received.
        """
        ecus = self.db.get_message_by_frame_id(message.arbitration_id).senders
        values = self.db.decode_message(message.arbitration_id, message.data)

        for ecu in ecus:
            self.ecus[ecu].update(values)

    def _get_states(self, path: str) -> None:
        """Populate each ECUs ``states`` dictionary, and self.read_dict

        :param str path: Path the the CAN spec file
        """
        ##create database that has all the messages in the dbc file in type message
        self.db = cantools.database.load_file(path)

        ##Iterates through messages to create ECUS
        for msg in self.db.messages:
            for signal in msg.signals:
                for sender in msg.senders:
                    try:
                        self.ecus[sender].states[signal.name] = None  # TODO Idk what to use for default values...
                    except Exception as e:
                        self.log.error(e)
                        self.log.error(f"Could not add signal {signal} to sender {sender}")

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
