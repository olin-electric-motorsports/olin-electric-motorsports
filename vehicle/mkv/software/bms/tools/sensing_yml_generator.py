"""
This file generatres a YAML file that details all of the voltage and temperature
sensing data for the BMS, which is then fed into the DBC generator so that we
can decode the data received over CAN.
"""

import yaml
from yaml import dump
from yaml import Dumper
import argparse

"""
HexInt and representer allow the yaml to represent numbers as hex, like

  id: 0x410

instead of strings

  id: '0x410'

https://stackoverflow.com/questions/18666816/using-python-to-dump-hexadecimals-into-yaml
"""


class HexInt(int):
    pass


def representer(dumper, data):
    return yaml.ScalarNode("tag:yaml.org,2002:int", hex(data))


yaml.add_representer(HexInt, representer)

# Top of the YAML file
HEADER = {
    "name": "bms_sensing",
    "subscribe": [],
    "publish": [],
}

# Creates a template for the voltage message
def VOLTAGE_MESSAGE_TEMPLATE():
    return {
        "name": "bms_voltage_{message_index}",
        "id": 0,
        "freq_hz": 4,
        "signals": [],
    }


def VOLTAGE_SIGNAL_TEMPLATE():
    return {
        "name": "segment{segment_index}_cell{cell_index}",
        "slice": "{slice_start} + 16",
        "unit": {"name": "volts", "type": "uint16_t", "offset": 0, "scale": 0.0001,},
    }


# Creates a template for the temperature message
def TEMPERATURE_MESSAGE_TEMPLATE():
    return {
        "name": "bms_segment{segment}_temperature{message_index}",
        "id": 0,
        "freq_hz": 4,
        "signals": [],
    }


def TEMPERATURE_SIGNAL_TEMPLATE():
    return {
        "name": "C{cell}_T{temp}",
        "slice": "{slice_start} + 16",
        "unit": {"name": "volts", "type": "uint16_t", "offset": 0, "scale": 0.0001,},
    }


VOLTAGE_ID_START = 0x410
TEMPERATURE_ID_START = 0x430

if __name__ == "__main__":
    parser = argparse.ArgumentParser(
        description="Generate DBC from YAML and DBC files",
        formatter_class=argparse.ArgumentDefaultsHelpFormatter,
    )

    parser.add_argument(
        "-c", "--config", default="bms_config.h", help="BMS config file with macros"
    )

    parser.add_argument("-o", "--output", default="bms_sensing.yml", help="Output file")

    args = parser.parse_args()

    config = args.config

    # Pull out the number of LTC6811s and the number of temperature-reading ICs
    num_ics = 0
    num_temperature_ics = 0
    with open(config, "r") as f:
        for line in f:
            if line.startswith("#define NUM_ICS"):
                num_ics = int(line[line.find("(") + 1 : line.find(")")])
            if line.startswith("#define NUM_TEMPERATURE_ICS"):
                num_temperature_ics = int(line[line.find("(") + 1 : line.find(")")])

    if num_ics % 2 != 0:
        raise Exception("NUM_ICS must be EVEN")

    num_segments = num_ics >> 1
    num_voltage_messages_per_segment = 4
    num_temperature_messages_per_segment = 6

    messages = []

    # Voltages
    for segment in range(num_segments):
        for msg_number in range(num_voltage_messages_per_segment):
            msg = VOLTAGE_MESSAGE_TEMPLATE()
            msg_idx = segment * num_voltage_messages_per_segment + msg_number
            msg["id"] = HexInt(VOLTAGE_ID_START + msg_idx)

            msg["name"] = VOLTAGE_MESSAGE_TEMPLATE()["name"].format(
                message_index=msg_idx
            )

            for sig in range(4):
                s = VOLTAGE_SIGNAL_TEMPLATE()
                s["name"] = VOLTAGE_SIGNAL_TEMPLATE()["name"].format(
                    segment_index=segment + 1, cell_index=(msg_number * 4) + sig + 1,
                )

                s["slice"] = VOLTAGE_SIGNAL_TEMPLATE()["slice"].format(
                    slice_start=sig * 16
                )

                msg["signals"].append(s)
            HEADER["publish"].append(msg)

    # Temperatures
    for segment in range(num_segments):
        cell = 14
        temperature = 2

        for msg_number in range(num_temperature_messages_per_segment):
            msg = TEMPERATURE_MESSAGE_TEMPLATE()
            msg_idx = segment * num_temperature_messages_per_segment + msg_number
            msg["id"] = HexInt(TEMPERATURE_ID_START + msg_idx)
            msg["name"] = TEMPERATURE_MESSAGE_TEMPLATE()["name"].format(
                segment=segment + 1, message_index=msg_number + 1,
            )

            for sig in range(4):
                s = TEMPERATURE_SIGNAL_TEMPLATE()
                s["name"] = TEMPERATURE_SIGNAL_TEMPLATE()["name"].format(
                    cell=cell + 1, temp=temperature + 1,
                )

                temperature = (temperature - 1) % 3
                if temperature == 2:
                    cell = cell - 2

                s["slice"] = TEMPERATURE_SIGNAL_TEMPLATE()["slice"].format(
                    slice_start=sig * 16
                )

                msg["signals"].append(s)
            HEADER["publish"].append(msg)

    yml = dump(HEADER, Dumper=Dumper, sort_keys=False)
    f = open(args.output, "w")
    f.write(yml)
    f.close()
