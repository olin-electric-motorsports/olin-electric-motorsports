import pytest


def close_tsms(hitl):
    hitl.shdn_tsms.set(1)


def close_air_p(hitl):
    hitl.air_p_weld_detect.set(1)


def test_rtd(hitl):
    close_tsms(hitl)
    close_air_p(hitl)

    hitl.can.set_state("pack_voltage", NOMINAL_PACK_VOLTAGE)
    hitl.can.set_periodic("bms_core", 0.1)
    hitl.can.set_state("D1_DC_Bus_Voltage", 0)
    hitl.can.set_periodic("M167_Voltage_Info", 0.1)
