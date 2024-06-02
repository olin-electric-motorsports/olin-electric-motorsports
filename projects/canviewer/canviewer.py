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
    REG_A = 0
    REG_B = 1
    REG_C = 2
    REG_D = 3
    REG_E = 4
    REG_F = 5

@dataclass
class VoltageReading:
    ic: int
    cell: VoltageRegister
    adc: int

    def __str__(self):
        cell_number = str((int(self.cell) * 3 + self.adc))
        if len(cell_number) == 1:
          cell_number = f"0{cell_number}"
        return f"{self.ic}:{cell_number}"

debug_temp: bool = False
debug_voltage: bool = True
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
          cellHeader = 0;
          daChCount = 0;
          seg = 0;
          chPerDa = 24;
          daCount = 0;
          cellInRow = chPerDa;

          txt += "\nSeg : DA |"
          while(cellHeader < chPerDa):
            txt += str(cellHeader).rjust(6, " ")
            cellHeader += 1

          txt += "\n"
          print
          while i < len(channels):
              if(daCount % 4 != 3):
                cellInRow = chPerDa
              else:
                cellInRow = 13
              
              txt += "  " + str(int(daCount / 4)) + " :  " + str(daCount % 4) + " | " 
              # if(daCount % 4 == 3):
              #   txt += "\n"
              txt += (
                  " ".join(
                      [
                          str(str(round(float(convertVtoT(z[1])), 1))).rjust(5, " ")
                          for z in zipped[i : i + cellInRow]
                      ]
                  )
                  + "\n"
              )
              if(daCount % 4 == 3):
                txt += "\n"
              i += cellInRow #DAs per segment
              daCount += 1;
          txt += "min:\t" + str(convertVtoT(max(temp_readings.values()))) + "\n"
          txt += "max:\t" + str(convertVtoT(min(temp_readings.values()))) + "\n"
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
          if (int(reading3.cell) * 3 + reading3.adc) != 17:
            voltage_readings[str(reading3)] = message["voltage_3"]

          txt = "\n___________________________________________________Start___________________________________________________\n"
          cells = list(voltage_readings.keys())
          voltages = list(voltage_readings.values())
          highest_voltage = max(voltages)
          lowest_voltage = min(voltages)
          zipped_readings = list(zip(cells, voltages))
          zipped_readings.sort(key = lambda a: a[0])
          i = 0
          seg = 0
          cellHeader = 0
          cellsPerSeg = 17
          txt += "\nSeg |"
          while(cellHeader < cellsPerSeg):
            txt += str(cellHeader).rjust(6, " ")
            cellHeader += 1

          txt += "\n"

          while i < len(cells):
              txt += "  " + str(seg) + " |  "
              txt += (
                  " ".join(
                      [
                          str(str(round(b[1], 2)).ljust(4, "0") + " ")
                          for b in zipped_readings[i : i + 17]
                          # str(b[0] + "\t" + str(round(b[1], 2)))
                          # for b in zipped_readings[i : i + 4]
                      ]
                  )
                  + "\n"
              )
              i += cellsPerSeg
              seg += 1
          txt += "Min: \t" + str(round(lowest_voltage,3)) + "\n"
          txt += "Max: \t" + str(round(highest_voltage,3)) + "\n"
          txt += "____________________________________________________End____________________________________________________\n\n"
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
