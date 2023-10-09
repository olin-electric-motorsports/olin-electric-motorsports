"""
Author: Hwei-Shin Harriman, Jack Greenberg
Olin Electric Motorsports

Functionality to process mini-YAML files, autogenerate mini-YAMLS with ID
assignments and RX messages definitions, and create DBCs
"""
import yaml
import math
from cantools.database.can import Message as CANMessage, Signal as MessageSignal, Node

# ----------- DEFAULTS and CONSTANTS -----------
VALID_PRIORITIES = ["LO", "MED", "HI"]


class YamlParser:
    """
    Handles parsing of YAML file

    Usage:

        parser = YamlHandler("path/to/yaml_file.yml")
    """

    def __init__(self, yml):
        with open(yml, "r") as f:
            self.data = yaml.load(f, Loader=yaml.FullLoader)

        self.name = self.data["name"]
        self.messages = self._parse_messages()

    """
    Parses messages from the YAML file. Internally it will pull the frequency
    and message IDs, and then call _parse_signals to get the list of signals
    """

    def _parse_messages(self):
        messages = []
        if "publish" not in self.data.keys():
            return []

        for raw in self.data["publish"]:
            if raw.get("id"):
                # Must check for "id" because there are cases where we are
                # publishing a message defined elsewhere, like the motor
                # controller message
                id = raw["id"]
                signals, length = self._parse_signals(raw)
                cycle_time = (1 / raw["freq_hz"]) * 1000  # Milliseconds

                m = CANMessage(
                    id,
                    raw["name"],
                    length,
                    signals,
                    senders=[self.name],
                    cycle_time=cycle_time,
                )

                messages.append(m)
            else:
                pass

        return messages

    """
    Parses signals from the YAML file. The possible types are currently: enum,
    int8_t, int16_t, uint8_t, uint16_t, and bool.
    """

    def _parse_signals(self, msg):
        signals = []
        message_length = 0

        if "signals" not in msg.keys():
            return [], 0

        for sig in msg["signals"]:
            name = sig["name"]
            start, length = sig["slice"].split(" + ")

            scale = 1
            offset = 0

            sig_type = sig["unit"]["type"]

            unit = None
            is_signed = False
            choices = None

            if sig_type == "enum":
                choices = dict(enumerate(sig["unit"]["values"]))
            elif (
                sig_type == "uint8_t"
                or sig_type == "uint16_t"
                or sig_type == "uint64_t"
            ):
                unit = sig["unit"]["name"]
                offset = eval(str(sig["unit"]["offset"]))
                scale = eval(str(sig["unit"]["scale"]))
            elif (
                sig_type == "int8_t" or sig_type == "int16_t" or sig_type == "uint64_t"
            ):
                is_signed = True
                unit = sig["unit"]["name"]
                offset = eval(str(sig["unit"]["offset"]))
                scale = eval(str(sig["unit"]["scale"]))
            elif sig_type == "bool":
                unit = "bool"
                choices = {0: sig["unit"]["values"]["f"], 1: sig["unit"]["values"]["t"]}
            else:
                raise Exception("Unknown type: {}".format(sig_type))

            s = MessageSignal(
                name,
                int(start),
                int(length),
                is_signed=is_signed,
                scale=scale,
                offset=offset,
                unit=unit,
                choices=choices,
            )

            signals.append(s)
            message_length += int(length) / 8

        return signals, math.ceil(message_length)
