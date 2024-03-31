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
from enum import Enum
from typing import Dict

@dataclass
class ThermistorReading:
    ic: int
    da_board: int
    channel: int

    def __str__(self):
        return f"{self.ic}:{self.da_board}:{self.channel}"

# 1 indexing because of how _rdcv_reg is written

class VoltageRegister(Enum):
    REG_A = 1
    REG_B = 2
    REG_C = 3
    REG_D = 4
    REG_E = 5
    REG_F = 6

@dataclass
class VoltageReading:
    ic: int
    cell: VoltageRegister
    adc: int

    def __str__(self):
        cell_number = str(((int(self.cell) -1) * 3 + self.adc))
        if len(cell_number) == 1:
          cell_number = f"0{cell_number}"
        return f"{self.ic}:{cell_number}"

debug_temp: bool = True
debug_voltage: bool = False
temp_readings: Dict[ThermistorReading, float] = {}
voltage_readings: Dict[VoltageReading, float] = {}
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

    if debug_temp:
      if "da_boards" in message.keys():
          channel = str(message["channel"])
          if len(channel) == 1:
              channel = f"0{channel}"
          if message["da_boards"] == "DA_BOARDS_34":
              reading1 = ThermistorReading(ic=message["ic"], da_board=3, channel=channel)
              temp_readings[str(reading1)] = message["temperature_1"]
              if message["channel"] >= 4:
                  reading2 = ThermistorReading(
                      ic=message["ic"], da_board=4, channel=channel
                  )
                  temp_readings[str(reading2)] = message["temperature_2"]
          else:
              if message["channel"] >= 7:
                  reading1 = ThermistorReading(
                      ic=message["ic"], da_board=1, channel=channel
                  )
                  temp_readings[str(reading1)] = message["temperature_1"]
              reading2 = ThermistorReading(ic=message["ic"], da_board=2, channel=channel)
              temp_readings[str(reading2)] = message["temperature_2"]
          txt = "_____________start______________\n"
          channels = list(temp_readings.keys())
          vals = list(temp_readings.values())
          try:
            num_high = sum(np.array([float(convertVtoT(x)) for x in vals]) > 76)
          except:
            num_high = -1
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
          txt += "min:\t" + str((max(temp_readings.values()))) + "\n"
          txt += "max:\t" + str((min(temp_readings.values()))) + "\n"
          txt += "high:\t" + str(num_high) + "\n"
          txt += "______________end_______________"
          print(txt)

    if debug_voltage:
        if "cell" in message.keys():
          cell_number = VoltageRegister[str(message["cell"])].value
          reading1 = VoltageReading(ic = message["ic"], cell = cell_number, adc = 0)
          reading2 = VoltageReading(ic = message["ic"], cell = cell_number, adc = 1)
          reading3 = VoltageReading(ic = message["ic"], cell = cell_number, adc = 2)
          voltage_readings[str(reading1)] = message["voltage_1"]
          voltage_readings[str(reading2)] = message["voltage_2"]
          if (int(reading3.cell) + 6 * reading3.adc) - 1 != 17:
            voltage_readings[str(reading3)] = message["voltage_3"]
          txt = "_____________start______________\n"
          cells = list(voltage_readings.keys())
          voltages = list(voltage_readings.values())
          highest_voltage = max(voltages)
          lowest_voltage = min(voltages)
          zipped_readings = list(zip(cells, voltages))
          zipped_readings.sort(key = lambda a: a[0])
          i = 0
          print
          while i < len(cells):
              txt += (
                  "\t".join(
                      [
                          str(b[0] + "\t" + str(round(b[1], 5)))
                          for b in zipped_readings[i : i + 4]
                      ]
                  )
                  + "\n"
              )
              i += 4
          txt += "min: \t" + str(round(lowest_voltage,5)) + "\n"
          txt += "max: \t" + str(round(highest_voltage,5)) + "\n"
          txt += "______________end_______________"
          print(txt)

          # adc = message[""]
          # print(str(message["cell"]))

          

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
