from canserver import init_can
from ui import render_dashboard

import argparse
import time
import signal
import numpy as np

from rich.layout import Layout
from rich.live import Live

db = None

SHUTDOWN_NODES = {
    "ss_bspd": None,  # BSPD
    "ss_is": None,  # THROTTLE
    "ss_bots": None,  # THROTTLE
    "ss_estop_driver": None,  # THROTTLE
    "ss_hvd": None,  # AIR
    "ss_hvd_conn": None,  # AIR
    "ss_mpc": None,  # AIR
    "ss_bms": None,  # AIR
    "ss_imd": None,  # AIR
    "ss_tsms": None,  # AIR
}

VEHICLE_VALUES = {
    "air_p_status": None,
    "air_n_status": None,
    "ready_to_drive": None,
    "pack_voltage": None,
    "max_temperature": None,
    "min_temperature": None,
    "D1_DC_Bus_Voltage": None,
}

VEHICLE_STATES = {
    "AIR Control": [None, None],
    "BMS": [None, None],
    "Throttle": [None, None],
}

VEHICLE_STATE_SIGNALS = { "state", "air_state", "air_fault", "bms_state", "bms_fault" }

MESSAGE_IDS = {
    0x00C: "THROTTLE",
    0x00D: "AIR",
    0x010: "BMS"
}


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


def get_ss_val(signal, data):
    val = data.get(signal)

    if val == "OPEN":
        return "[red]OPEN"
    elif val == "CLOSED":
        return "[green]CLOSED"


def rx_callback(msg, db):
    global SHUTDOWN_NODES
    global VEHICLE_VALUES

    try:
        message = db.decode_message(msg.arbitration_id, msg.data)
    except Exception as e:
        return

    for signal_name in message:
        if signal_name in SHUTDOWN_NODES:
            SHUTDOWN_NODES[signal_name] = get_ss_val(signal_name, message)
        elif signal_name in VEHICLE_VALUES:
            if signal_name in ['max_temperature', 'min_temperature']:
                temp = convertVtoT(get_val(signal_name, message)) - 273.15
                VEHICLE_VALUES[signal_name] =  str(temp)
            else:
                VEHICLE_VALUES[signal_name] = get_val(signal_name, message)
        elif signal_name in VEHICLE_STATE_SIGNALS:
            match MESSAGE_IDS[msg.arbitration_id]:
                case "THROTTLE":
                    VEHICLE_STATES["Throttle"][0] = get_val("state", message)
                case "AIR":
                    VEHICLE_STATES["AIR Control"][0] = get_val("air_state", message)
                    VEHICLE_STATES["AIR Control"][1] = get_val("air_fault", message)
                case "BMS":
                    VEHICLE_STATES["BMS"][0] = get_val("bms_state", message)
                    VEHICLE_STATES["BMS"][1] = get_val("bms_fault_state", message)


if __name__ == "__main__":
    parser = argparse.ArgumentParser(
        description="Monitor shutdown nodes",
        formatter_class=argparse.ArgumentDefaultsHelpFormatter,
    )

    parser.add_argument("-c", "--canbus", default="vcan0")

    args = parser.parse_args()

    signal.signal(signal.SIGINT, sigint)

    can_bus, db = init_can(
        args.canbus, 500000, rx_callback, "vehicle/mkv/mkv.dbc" 
    )

    data = {
        "VEHICLE_VALUES": VEHICLE_VALUES,
        "SHUTDOWN_NODES": SHUTDOWN_NODES,
        "VEHICLE_STATES": VEHICLE_STATES,
    }

    with Live(render_dashboard(data), refresh_per_second=5, screen=False) as live:
        while True:
            time.sleep(0.1)
            data = {
                "VEHICLE_VALUES": VEHICLE_VALUES,
                "SHUTDOWN_NODES": SHUTDOWN_NODES,
                "VEHICLE_STATES": VEHICLE_STATES,
            }
            live.update(render_dashboard(data))
