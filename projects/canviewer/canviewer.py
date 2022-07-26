from canserver import init_can
from gui.gui import Window
from utils import convertVtoT, get_val

import argparse
import sys
import time
import yaml
import cantools

from PyQt5.QtWidgets import QApplication
from PyQt5.QtCore import QTimer
from rich.layout import Layout
from rich.live import Live

db = None

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

    for signal_name in message:
        if signal_name in SHUTDOWN_NODES:
            SHUTDOWN_NODES[signal_name] = get_val(signal_name, message)
        elif signal_name in VEHICLE_VALUES:
            if signal_name in ["max_temperature", "min_temperature"]:
                temp = convertVtoT(get_val(signal_name, message)) - 273.15
                VEHICLE_VALUES[signal_name] = str(temp)
            else:
                VEHICLE_VALUES[signal_name] = get_val(signal_name, message)
        elif signal_name in VEHICLE_STATE_SIGNALS:
            VEHICLE_STATES[db.get_message_by_frame_id(msg.arbitration_id).name][
                signal_name
            ] = get_val(signal_name, message)


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

    args = parser.parse_args()

    can_bus, db, kill_flag = init_can(
        args.canbus, args.bustype, 500000, rx_callback, "vehicle/mkv/mkv.dbc"
    )

    def update_ui():
        window.setData(SHUTDOWN_NODES, VEHICLE_VALUES, VEHICLE_STATES)

    app = QApplication([])
    window = Window()
    window.show()

    timer = QTimer()
    timer.timeout.connect(update_ui)
    timer.setInterval(100)  # Update GUI every 100ms, or 10hz
    timer.start()

    run = app.exec_()
    kill_flag.set()
    sys.exit(run)
