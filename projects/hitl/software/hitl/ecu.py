from typing import Union, Optional


class ECU:
    """Class to store the state of each ECU

    `Confluence <https://docs.olinelectricmotorsports.com/display/AE/ECUs>`_

    The ECU object allows easy access to an ECU's states. CAN states are updated automatically if the
    ECU is passed to a CANController, I/O states can be monitored if the ECU is provided an IOController.

    :param str name: The name of the ECU.
    :param hitl.IOController io: An IOController for the HitL system. This optional parameter allows
        you to check hard
    """

    def __init__(self, name: str, io=None):
        self.name = name  # ALL_CAPS
        self.io = io  # Link to IOController for hardware state lookups
        self.states = {}  # This is populated by the CANController

    def get_state(self, state: str):
        """Get a state (CAN or I/O)

        This function allows you to monitor all of the ECU's states. It first checks its own CAN ``self.states`` dictionary,
        return the correct if it finds one. Next, it tries to use the ``IOController`` to get an I/O state from the ECU. If the
        state is not in the CAN ``states`` dictionary and the ``ECU`` doesn't have an ``IOController``, it will raise an
        exception.

        :param str state: The name of the state you want. This should match the name of the state from the can spec file or the
            pin config file.

        :returns: The value of the requested state.
        """
        if state in self.states:
            return self.states[state]
        else:
            if self.io:
                return self.io.get_state(pin=state)
            else:
                raise Exception(
                    f"Couldn't get state {state}. It was not found in the CAN states dictionary, and the {self.name} ECU doesn't have an IOController."
                )

    def update(self, signals: dict) -> None:
        """Update the state of an ECU

        For now, we are not simulating ECUs, so this is only ever called
        by a CANController when a new CAN message is read.

        :param dict signals: a dictionary of singal-value pairs.

        :rtype: None
        """
        self.states.update(signals)
