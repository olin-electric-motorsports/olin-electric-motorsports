import numpy as np
from canviewer import PROCESSING_FUNCTIONS


def convertVtoT(
    x, Vin=3, R1=100000, R2=100000, T2=298.15, beta=4100,
):  # Unsure if beta is 4100 or 4300
    """
    converts voltage drop data to temperature
    x: array containing only the voltages
    """
    Vout = float(x)
    thermistor_R1 = (Vout * R1) / (Vin - Vout)
    temperature = 1 / ((np.log(thermistor_R1 / R2) / beta) + (1 / T2)) - 273.15
    temperature = 9 / 5 * (temperature) + 32
    t = str(round(temperature, 5))
    # if temperature < 76:
    #     t = "0.0"
    if len(t) < 8:
        t += "0" * (8 - len(t))
    return t


def get_val(signal, data, rounding=2):
    """
    Retrieves signal from the message data and applies a processing function if
    one is found in the PROCESSING_FUNCTIONS dictionary

    Args:
        signal (str): signal name to retrieve
        message (dict): message data returned by cantools.database.decode_message
        rounding (int): number of decimal points to round floats

    Returns:
        str: value of the signal
    """

    if val := data.get(signal):
        if func := PROCESSING_FUNCTIONS.get(signal):
            val = globals()[func](val)
        if isinstance(val, float):
            val = round(val, rounding)
        return str(val)


def get_message_name(msg, db):
    """Given a can.Message and a cantools.database, return the message name"""
    return db.get_message_by_frame_id(msg.arbitration_id).name
