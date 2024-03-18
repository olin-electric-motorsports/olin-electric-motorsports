import numpy as np
from canviewer import PROCESSING_FUNCTIONS


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
    """
    Retrieves signal from the message data and applies a processing function if
    one is found in the PROCESSING_FUNCTIONS dictionary

    Args:
        signal (str): signal name to retrieve
        message (dict): message data returned by cantools.database.decode_message

    Returns:
        str: value of the signal
    """

    if val := data.get(signal):
        if func := PROCESSING_FUNCTIONS.get(signal):
            val = globals()[func](val)

        return str(val)


def get_message_name(msg, db):
    """Given a can.Message and a cantools.database, return the message name"""
    return db.get_message_by_frame_id(msg.arbitration_id).name


# BMS faults, see fault.h for full list of faults
bms_faults_decoded = ["UV", "OV", "UT", "OT", "DF", "OW",
                    "OC", "PEC", "CF", "SM", "CSC", "DA"]

def decode_bms_fault_msg(fault_msg):
    """Decode the bms fault message"""
    msg = "{0:b}".format(int(fault_msg))
    decoded_msg = ""
    for index, error in enumerate(msg[::-1]):
        if error == "1":
          decoded_msg += bms_faults_decoded[index]
          decoded_msg += ", "
    return decoded_msg[0:-2]
