# Base python
import threading
from typing import Callable
import logging
from collections import defaultdict

# Extended python
import cantools
import can


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
        dbc,
        bus: can.interface.Bus,
        bitrate: int = 500000,
    ):
        # Create logger
        self.log = logging.getLogger(name=__name__)

        # Create empty set of periodic messages
        self.periodic_messages = {}

        self.dbc = dbc

        # Set up dictionary of messages
        self.message_of_signal, self.signals = self._create_state_dictionary(self.dbc)

        self.can_bus = bus

        self.kill_flag = threading.Event()
        listener = threading.Thread(
            target=self._listen,
            daemon=True,
            name="listener",
            kwargs={
                "can_bus": self.can_bus,
                "callback": self._rx_callback,
                "kill_flag": self.kill_flag,
            },
        )
        listener.start()

    def get_state(self, signal):
        """
        Get the state of a can signal on the car

        Args:
            signal (str): signal name to get
        """
        msg = self.message_of_signal[signal]
        self.log.debug(f"Fetched signal {signal} as {self.signals[msg][signal]}")
        return self.signals[msg][signal]

    def set_state(self, signal, value):
        """
        Set the state of a can signal on the car

        Args:
            signal (str): Signal name to set
            value (varying types): Decoded value to set signal to

            Note: Decoded includes all of the decoding instructions in the DBC
            So any fault/state enum signals would use the actual name, like "PRECHARGE"
            Shutdown Sense signals would be "OPEN" or "CLOSED"
            Any values that have offsets or scales should have those applied,
                so for example for throttle potentiometers we would use the percentages,
                not the raw values
        """
        try:
            msg_name = self.message_of_signal[signal]
        except KeyError:
            raise KeyError(f"Cannot set state of signal '{signal}'. It wasn't found.")

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

        self.log.debug(f"Set signal {signal} to {value}")

    def set_periodic(self, msg_name, period):
        """
        Set a message to be send periodically, at a specified period in seconds

        All states in the message should be set before starting a periodic broadcast,
        though they can be changed without interrupting the periodic broadcast.

        Args:
            msg_name (str): The name of the message to send periodically
            period (float): Period of seconds between each message
        """
        if msg_name not in self.signals:
            raise KeyError(f"Message {msg_name} not found in messages.")

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

        self.log.warning(f"Set {msg_name} to be sent periodically every {period} ms")

        return send_task

    def stop_periodic(self, msg_name: str):
        """
        Stop a periodic message task
        """
        if msg_name in self.periodic_messages:
            self.periodic_messages[msg_name].stop()
            del self.periodic_messages[msg_name]
            self.log.debug(f"Stopped periodic sending of {msg_name}")
        else:
            self.log.error(f"Message {msg_name} is not being sent periodically")

    def stop_all_periodic(self):
        """
        Stop all periodic message tasks
        """
        self.periodic_messages = {}
        self.can_bus.stop_all_periodic_tasks()
        self.log.debug("Stopped all periodic tasks")

    def clear_states(self):
        self.message_of_signal, self.signals = self._create_state_dictionary(self.dbc)

    def _create_state_dictionary(self, path: str):
        """Generate self.message_of_signal and self.signals

        Args:
            path (str): Path to CAN spec file (DBC)
        """
        # Create database that has all the messages in the dbc file in type message
        self.db = cantools.database.load_file(path)

        # Iterates through messages to create state dictionaries
        message_of_signal = {}
        signals = defaultdict(dict)
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

    def _listen(
        self, can_bus: can.Bus, callback: Callable, kill_flag: threading.Event
    ) -> None:
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
        self.log.info("Shut down CAN hardware gracefully")

    def close(self):
        self.kill_flag.set()
