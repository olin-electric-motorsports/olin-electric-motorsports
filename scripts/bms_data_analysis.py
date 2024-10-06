from pathlib import Path
import cantools
import re
from cycleascii import unhexlify
from typing import List
from dataclasses import dataclass
import numpy as np
import sys

MKVI_DBC = Path(__file__).parent / "data/mkvi.dbc"
CAN_DB = cantools.database.load_file(MKVI_DBC)
BMS_TEMP_ID = int("402", 16)


@dataclass
class RawCanData:
    timestamp: float
    id: int
    raw_data: str

    @property
    def data(self):
        return CAN_DB.decode_message(self.id, unhexlify(self.raw_data))

    def __eq__(self, other: "RawCanData") -> bool:
        return self.channel == other.channel and self.id == other.id


@dataclass
class ThermistorReading(RawCanData):
    channel: int
    da_boards: cantools.database.namedsignalvalue.NamedSignalValue
    temperature_1: float
    temperature_2: float
    ic: int

    def __eq__(self, other: "ThermistorReading") -> bool:
        return (
            self.channel == other.channel
            and self.da_boards == other.da_boards
            and self.ic == other.ic
        )


def filter_message_list(
    all_messages: List[RawCanData], desired_id: List[int]
) -> List[RawCanData]:
    return [msg for msg in all_messages if msg.id in desired_id]


def convertVtoT(
    x,
    Vin=3,
    R1=100000,
    R2=100000,
    T2=298.15,
    beta=4100,
):
    """
    converts voltage drop data to temperature
    x: array containing only the voltages
    """
    Vout = float(x)
    thermistor_R1 = (Vout * R1) / (Vin - Vout)
    temperature = 1 / ((np.log(thermistor_R1 / R2) / beta) + (1 / T2)) - 273.15
    # temperature = 9 / 5 * (temperature) + 32
    t = str(round(temperature, 5))
    # if temperature < 76:
    #     t = "0.0"
    if len(t) < 8:
        t += "0" * (8 - len(t))
    return float(t)


def get_avg_temp_by_timestamp(log_num):
    data_path = Path(__file__).parent / f"data/mk6_{log_num}.log"

    all_messages = []
    with open(data_path, "r") as file:
        for line in file.readlines():
            space_split = line.split(" ")
            all_messages.append(
                RawCanData(
                    timestamp=space_split[0].strip(")").strip("("),
                    id=int(space_split[2].split("#")[0], 16),
                    raw_data=space_split[2].split("#")[1],
                )
            )

    temperature_messages: List[ThermistorReading] = []
    for therm in filter_message_list(all_messages, [BMS_TEMP_ID]):
        args_dict = therm.__dict__
        args_dict.update(therm.data)
        temperature_messages.append(ThermistorReading(**args_dict))

    start_thermistor = temperature_messages[0]
    next_thermistor = temperature_messages[1]

    thermistor_cycles: List[List[ThermistorReading]] = [[start_thermistor]]
    start_times = [start_thermistor.timestamp]
    cycle_idx = 0
    therm_idx = 1

    while therm_idx < len(temperature_messages):
        next_thermistor = temperature_messages[therm_idx]
        if next_thermistor == start_thermistor:
            cycle_idx += 1
            thermistor_cycles.append([next_thermistor])
            start_times.append(next_thermistor.timestamp)
        else:
            thermistor_cycles[cycle_idx].append(next_thermistor)
        therm_idx += 1

    avg_temps_by_cycle = []
    med_temps_by_cycle = []
    stdev_temps_by_cycle = []
    for cycle in thermistor_cycles:
        temps = []
        for msg in cycle:
            temps.extend(
                [convertVtoT(msg.temperature_1), convertVtoT(msg.temperature_2)]
            )
        avg_temps_by_cycle.append(sum(temps) / len(temps))
        med_temps_by_cycle.append(sorted(temps)[len(temps) // 2])
        stdev_temps_by_cycle.append(np.std(temps))

    return list(
        zip(start_times, avg_temps_by_cycle, med_temps_by_cycle, stdev_temps_by_cycle)
    )


if __name__ == "__main__":
    data = []
    log_nums = [45, 46, 47, 48, 49, 51, 52, 52]

    for num in log_nums:
        data.extend(get_avg_temp_by_timestamp(num))

    print(
        "\n".join(
            [
                f"Timestamp: {x}, Avg Temp: {y:.3f}, Med Temp: {z:.3f}, Stdev: {w:.3f}"
                for x, y, z, w, in data
            ]
        )
    )
