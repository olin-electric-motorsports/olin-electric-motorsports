from canserver import init_can
from ui import render_dashboard

import argparse
from os import listdir
import time
import signal
import sys
import numpy as np

from rich.layout import Layout
from rich.live import Live

db = None

FILTERS = [
    {
        "can_id": 0x000,
        "can_mask": 0x7E0,
        "extended": False,
    },
    {
        "can_id": 0x0A0,
        "can_mask": 0x7FF,
        "extended": False,
    },
]

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

VEHICLE_VALUES = {}

VEHICLE_STATES = {
    "AIR Control": [None, None],
    "BMS": [None, None],
    "Throttle": [None, None],
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

    if val != None:
        return str(val)
    else:
        return None


def get_ss_val(signal, data):
    val = data.get(signal)

    if val:
        if val == "OPEN":
            return "[red]OPEN"
        elif val == "CLOSED":
            return "[green]CLOSED"
        else:
            return None


def rx_callback(msg, db):
    global SHUTDOWN_NODES
    global VEHICLE_VALUES

    try:
        message = db.decode_message(msg.arbitration_id, msg.data)
    except Exception as e:
        return

    if msg.arbitration_id == 0x00B:  # BSPD
        SHUTDOWN_NODES["ss_bspd"] = get_ss_val("ss_bspd", message)
    elif msg.arbitration_id == 0x00C:  # Throttle
        SHUTDOWN_NODES["ss_is"] = get_ss_val("ss_is", message)
        SHUTDOWN_NODES["ss_bots"] = get_ss_val("ss_bots", message)
        SHUTDOWN_NODES["ss_estop_driver"] = get_ss_val("ss_estop_driver", message)
        VEHICLE_STATES["Throttle"][0] = get_val("state", message)
    elif msg.arbitration_id == 0x00D:  # AIR
        SHUTDOWN_NODES["ss_hvd"] = get_ss_val("ss_hvd", message)
        SHUTDOWN_NODES["ss_hvd_conn"] = get_ss_val("ss_hvd_conn", message)
        SHUTDOWN_NODES["ss_mpc"] = get_ss_val("ss_mpc", message)
        SHUTDOWN_NODES["ss_bms"] = get_ss_val("ss_bms", message)
        SHUTDOWN_NODES["ss_imd"] = get_ss_val("ss_imd", message)
        SHUTDOWN_NODES["ss_tsms"] = get_ss_val("ss_tsms", message)
        VEHICLE_STATES["AIR Control"][0] = get_val("air_state", message)
        VEHICLE_STATES["AIR Control"][1] = get_val("air_fault", message)
        VEHICLE_VALUES["AIR Plus"] = get_val("air_p_status", message)
        VEHICLE_VALUES["AIR Minus"] = get_val("air_n_status", message)
    elif msg.arbitration_id == 0x00F:  # Dashboard
        VEHICLE_VALUES["Ready to Drive"] = get_val("ready_to_drive", message)
    elif msg.arbitration_id == 0x010:  # BMS
        VEHICLE_VALUES["pack_voltage"] = get_val("pack_voltage", message)
        VEHICLE_STATES["BMS"][0] = get_val("bms_state", message)
        VEHICLE_STATES["BMS"][1] = get_val("bms_fault_state", message)
    elif msg.arbitration_id == 0x011:  # BMS sense
        max_temp = convertVtoT(get_val("max_temperature", message)) - 273.15
        min_temp = convertVtoT(get_val("min_temperature", message)) - 273.15

        VEHICLE_VALUES["pack_max_temp"] = str(max_temp)
        VEHICLE_VALUES["pack_min_temp"] = str(min_temp)
    elif msg.arbitration_id == 0x0A7:  # Motor controller voltage
        VEHICLE_VALUES["motor_controller_voltage"] = get_val(
            "D1_DC_Bus_Voltage", message
        )


if __name__ == "__main__":
    parser = argparse.ArgumentParser(
        description="Monitor shutdown nodes",
        formatter_class=argparse.ArgumentDefaultsHelpFormatter,
    )

    parser.add_argument("-c", "--canbus", default="vcan0")

    args = parser.parse_args()

    signal.signal(signal.SIGINT, sigint)

    can_bus, db = init_can(
        args.canbus, 500000, rx_callback, "vehicle/mkv/mkv.dbc", FILTERS
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
