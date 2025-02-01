"""
Modified version of canviewer.py to work with telemetry. Callback function when receiving a CAN message, launch and update GUI
"""
from telemetry_server import init_telemetry
import cantools

from gui.gui import Window
from utils import *

import argparse
import sys
import yaml

from PyQt5.QtWidgets import QApplication
from PyQt5.QtCore import QTimer

REFRESH_RATE = 100  # GUI refresh rate in ms

with open("projects/telemetry/telemetry_core/config.yml", "r") as config_file:
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


# from dataclasses import dataclass
# from enum import Enum
# from typing import Dict

# @dataclass
# class ThermistorReading:
#     ic: int
#     da_board: int
#     channel: int

#     def __str__(self):
#         return f"{self.ic}:{self.da_board}:{self.channel}"

# # 1 indexing because of how _rdcv_reg is written

# class VoltageRegister(Enum):
#     REG_A = 0
#     REG_B = 1
#     REG_C = 2
#     REG_D = 3
#     REG_E = 4
#     REG_F = 5

# @dataclass
# class VoltageReading:
#     ic: int
#     cell: VoltageRegister
#     adc: int

#     def __str__(self):
#         cell_number = str((int(self.cell) * 3 + self.adc))
#         if len(cell_number) == 1:
#           cell_number = f"0{cell_number}"
#         return f"{self.ic}:{cell_number}"

# debug_temp: bool = False
# debug_voltage: bool = True
# temp_readings: Dict[ThermistorReading, float] = {}
# voltage_readings: Dict[VoltageReading, float] = {}

def rx_callback(msg):
    """
    Callback when a CAN message is received, updates appropriate vehicle dictionaries

    Args:
        msg (can.Message): CAN message that was received
    """
    try:
        message = db.decode_message(msg.arbitration_id, msg.data)
    except Exception as e:
        print(e)
        return       

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
        "-p",
        "--path",
        default="/dev/ttyUSB0",
        help="Path to USB serial device",
    )
    parser.add_argument(
        "-d",
        "--dbc",
        default="vehicle/mkvi/mkvi.dbc",
        help="Path to the DBC file to use for decoding CAN messages; default is the MKVI DBC",
    )

    args = parser.parse_args()

    # Create CAN database from DBC
    db = cantools.database.load_file(args.dbc)

    # Initialize telemetry
    kill_flag = init_telemetry(
        usb_path=args.path, baudrate=9600, timeout=10, rx_callback=rx_callback
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
