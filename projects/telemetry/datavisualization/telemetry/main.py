"""
Entrypoint app file

Objective: initialize and run telemetry software pipeline
"""

from library import (
    RadioSerialIn,
    LogFile,
    RedisDataSender,
)

import decoder


def run():
    """
    Run the data pipeline
    """
    # decoder.decode_live("data/dash.dbc")
    decoder.decode_csv("data/dash.dbc", "data/can5.csv")
    stream = LogFile(
        "data/decoded_can.txt",
        [
            "brake_analog_voltage_msb",
            "brake_analog_voltage_lsb",
            "cf",
            "bspdsense",
            "tsmssense",
            "left_e_stop_sense",
            "glvmssense",
        ],
    )
    # stream = RadioSerialIn("data/nextmessage.txt", ["brake_analog_voltage_msb", "brake_analog_voltage_lsb", "cf", "bspdsense", "tsmssense", "left_e_stop_sense", "glvmssense"])
    print("testing...")
    parser = RedisDataSender(stream)
    parser.grab_serial_data()


if __name__ == "__main__":
    run()
