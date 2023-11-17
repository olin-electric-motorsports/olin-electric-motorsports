"""
Callback function when receiving a CAN message, launch and update GUI
"""
from canserver import init_can
from gui.gui import Window
from utils import *

import argparse
import sys
import time
import yaml
import cantools

from PyQt5.QtWidgets import QApplication
from PyQt5.QtCore import QTimer

REFRESH_RATE = 100  # GUI refresh rate in ms

with open("projects/canviewer/config.yml", "r") as config_file:
    (
        SHUTDOWN_NODES,
        VEHICLE_VALUES,
        VEHICLE_STATES,
    ) = yaml.safe_load_all(config_file)

# Messages that correspond to vehicle states/faults
VEHICLE_STATE_SIGNALS = [
    signal for message in VEHICLE_STATES.values() for signal in message.keys()
]

# Build dictionary of processing functions
PROCESSING_FUNCTIONS = {}
for signal, value in VEHICLE_VALUES.items():
    if isinstance(value, dict):
        if func := value.get("processing_function"):
            PROCESSING_FUNCTIONS[signal] = func
            VEHICLE_VALUES[signal] = None


from dataclasses import dataclass
from typing import Dict


@dataclass
class ThermistorReading:
    ic: int
    da_board: int
    channel: int

    def __str__(self):
        return f"{self.da_board}:{self.channel}"


readings: Dict[ThermistorReading, float] = {}
import numpy as np


def rx_callback(msg, db):
    """
    Callback when a CAN message is received, updates appropriate vehicle dictionaries

    Args:
        msg (can.Message): CAN message that was received
        db (cantools.database): Database generated from our DBC
    """
    try:
        message = db.decode_message(msg.arbitration_id, msg.data)
    except Exception as e:
        return

    if "da_boards" in message.keys():
        channel = str(message["channel"])
        if len(channel) == 1:
            channel = f"0{channel}"
        if message["da_boards"] == "DA_BOARDS_34":
            reading1 = ThermistorReading(ic=message["ic"], da_board=3, channel=channel)
            readings[str(reading1)] = message["temperature_1"]
            if message["channel"] >= 4:
                reading2 = ThermistorReading(
                    ic=message["ic"], da_board=4, channel=channel
                )
                readings[str(reading2)] = message["temperature_2"]
        else:
            if message["channel"] >= 7:
                reading1 = ThermistorReading(
                    ic=message["ic"], da_board=1, channel=channel
                )
                readings[str(reading1)] = message["temperature_1"]
            reading2 = ThermistorReading(ic=message["ic"], da_board=2, channel=channel)
            readings[str(reading2)] = message["temperature_2"]
        txt = "_____________start______________\n"
        channels = list(readings.keys())
        vals = list(readings.values())
        num_high = sum(np.array([float(convertVtoT(x)) for x in vals]) > 76)
        zipped = list(zip(channels, vals))
        zipped.sort(key=lambda a: a[0])
        i = 0
        print
        while i < len(channels):
            txt += (
                "\t".join(
                    [
                        str(z[0] + "\t" + str(convertVtoT(z[1])))
                        for z in zipped[i : i + 4]
                    ]
                )
                + "\n"
            )
            i += 4
        txt += "min:\t" + str(convertVtoT(max(readings.values()))) + "\n"
        txt += "max:\t" + str(convertVtoT(min(readings.values()))) + "\n"
        txt += "high:\t" + str(num_high) + "\n"
        txt += "______________end_______________"
        print(txt)

    for signal_name in message:
        if signal_name in SHUTDOWN_NODES:
            SHUTDOWN_NODES[signal_name] = get_val(signal_name, message)
        elif signal_name in VEHICLE_VALUES:
            VEHICLE_VALUES[signal_name] = get_val(signal_name, message)
        elif signal_name in VEHICLE_STATE_SIGNALS:
            VEHICLE_STATES[get_message_name(msg, db)][signal_name] = get_val(
                signal_name, message
            )


if __name__ == "__main__":
    parser = argparse.ArgumentParser(
        description="Monitor CAN Bus",
        formatter_class=argparse.ArgumentDefaultsHelpFormatter,
    )

    parser.add_argument(
        "-b",
        "--bustype",
        default="socketcan",
        help="Typically either 'socketcan' or 'seeedstudio' on our team",
    )
    parser.add_argument(
        "-c",
        "--canbus",
        default="vcan0",
        help="Either a network interface name for socketcan, or the path of the USB device for seeedstudio",
    )
    parser.add_argument(
        "-d",
        "--dbc",
        default="vehicle/mkvi/mkvi.dbc",
        help="Path to the DBC file to use for decoding CAN messages; default is the MKVI DBC",
    )

    args = parser.parse_args()

    can_bus, db, kill_flag = init_can(
        args.canbus, args.bustype, 500000, rx_callback, args.dbc
    )

    def update_ui():
        try:
            window.setData(SHUTDOWN_NODES, VEHICLE_VALUES, VEHICLE_STATES)
        except KeyboardInterrupt:
            sys.exit()

    app = QApplication([])
    window = Window()
    window.show()

    timer = QTimer()
    timer.timeout.connect(update_ui)
    timer.setInterval(REFRESH_RATE)
    timer.start()

    run = app.exec_()
    kill_flag.set()
    sys.exit(run)
