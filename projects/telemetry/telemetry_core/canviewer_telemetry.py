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
