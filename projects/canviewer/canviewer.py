from canserver import init_can
from gui.gui import Window

import argparse
import sys
import time
import signal
import numpy as np
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
VEHICLE_STATE_SIGNALS = [
    signal for message in VEHICLE_STATES.values() for signal in message.keys()
]
print(VEHICLE_STATE_SIGNALS)


def sigint(signal_received, frame):
    exit(0)


def convertVtoT(x, Vin=3, R1=10000, R2=100000, T2=348.15, beta=3988):
    """
    converts voltage drop data to temperature
    x: array containing only the voltages
    """
    Vout = float(x)
    thermistor_R1 = (Vout * R1) / (Vin - Vout)
    temperature = 1 / ((np.log(thermistor_R1 / R2) / beta) + (1 / T2)) - 273.15

    return temperature


def get_val(signal, data):
    val = data.get(signal)

    if val is not None:
        return str(val)


def rx_callback(msg, db):
    global SHUTDOWN_NODES
    global VEHICLE_VALUES

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
        description="Monitor shutdown nodes",
        formatter_class=argparse.ArgumentDefaultsHelpFormatter,
    )

    parser.add_argument("-c", "--canbus", default="vcan0")
    parser.add_argument("-b", "--bustype", default="socketcan")

    args = parser.parse_args()

    signal.signal(signal.SIGINT, sigint)

    can_bus, db = init_can(
        args.canbus, args.bustype, 500000, rx_callback, "vehicle/mkv/mkv.dbc"
    )

    MESSAGE_IDS = {}
    for message in VEHICLE_STATES:
        msg_obj = db.get_message_by_name(message)
        MESSAGE_IDS[message] = msg_obj.frame_id

    def update_ui():
        window.setData(SHUTDOWN_NODES, VEHICLE_VALUES, VEHICLE_STATES)

    app = QApplication([])
    window = Window()
    window.show()

    timer = QTimer()
    timer.timeout.connect(update_ui)
    timer.setInterval(100)
    timer.start()

    sys.exit(app.exec_())
