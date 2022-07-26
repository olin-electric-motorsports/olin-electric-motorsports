import numpy as np


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
