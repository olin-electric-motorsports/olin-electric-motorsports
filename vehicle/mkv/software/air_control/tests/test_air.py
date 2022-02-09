import pytest
import math
import time
from formula.projects.microhitl import Values as PinValue

# Time constant for motor controller precharge circuit
MC_TAU = 0.2

def reset(iocontroller, pins):
    iocontroller.write_pin(pins["RESET"][0], PinValue.LOW)
    time.sleep(0.5)
    iocontroller.write_pin(pins["RESET"][0], PinValue.HIGH)

def initialize_to_idle(canbus, iocontroller, pins):
    canbus.set_state("pack_voltage", 350)
    canbus.set_periodic("bms_core", 0.1)
    canbus.set_state("D1_DC_Bus_Voltage", 0)
    canbus.set_periodic("M167_Voltage_Info", 0.1)

    iocontroller.write_pin(pins["AIR_P_WELD_DETECT"][0], PinValue.LOW)
    iocontroller.write_pin(pins["AIR_N_WELD_DETECT"][0], PinValue.LOW)
    iocontroller.write_pin(pins["SS_TSMS"][0], PinValue.HIGH)
    iocontroller.write_pin(pins["IMD_SENSE"][0], PinValue.HIGH)
    iocontroller.write_pin(pins["BMS_SENSE"][0], PinValue.HIGH)

"""
Tests
"""

def test_idle_bms_fault(canbus, iocontroller, pins):
    initialize_to_idle(canbus, iocontroller, pins)
    reset(iocontroller, pins)
    time.sleep(.5)
    assert(canbus.get_state("air_state") == "IDLE")

    # IMD FAULT
    iocontroller.write_pin(pins["IMD_SENSE"][0], PinValue.LOW)
    time.sleep(0.1)
    assert(canbus.get_state("air_state") == "FAULT")
    assert(canbus.get_state("air_fault") == "IMD_STATUS")

def test_idle_imd_fault(canbus, iocontroller, pins):
    initialize_to_idle(canbus, iocontroller, pins)
    reset(iocontroller, pins)
    time.sleep(.5)
    assert(canbus.get_state("air_state") == "IDLE")

    # IMD FAULT
    iocontroller.write_pin(pins["BMS_SENSE"][0], PinValue.LOW)
    time.sleep(0.1)
    assert(canbus.get_state("air_state") == "FAULT")
    assert(canbus.get_state("air_fault") == "BMS_STATUS")

def test_transition_idle_ss_closed(canbus, iocontroller, pins):
    initialize_to_idle(canbus, iocontroller, pins)
    reset(iocontroller, pins)
    time.sleep(.5)
    assert(canbus.get_state("air_state") == "IDLE")

    iocontroller.write_pin(pins["SS_TSMS"][0], PinValue.LOW)

    time.sleep(0.05)
    assert("SHUTDOWN_CIRCUIT_CLOSED" == canbus.get_state("air_state"))

def test_ss_closed_implausibility(canbus, iocontroller, pins):
    initialize_to_idle(canbus, iocontroller, pins)
    reset(iocontroller, pins)
    time.sleep(.5)
    assert(canbus.get_state("air_state") == "IDLE")

    iocontroller.write_pin(pins["SS_TSMS"][0], PinValue.LOW)

    time.sleep(0.05)
    assert("SHUTDOWN_CIRCUIT_CLOSED" == canbus.get_state("air_state"))

    # Do not close AIR_N_WELD_DETECT
    time.sleep(0.3)

    assert("FAULT" == canbus.get_state("air_state"))
    assert("SHUTDOWN_IMPLAUSIBILITY" == canbus.get_state("air_fault"))

def test_transition_ss_closed_precharge(canbus, iocontroller, pins):
    initialize_to_idle(canbus, iocontroller, pins)
    reset(iocontroller, pins)
    time.sleep(.5)
    assert(canbus.get_state("air_state") == "IDLE")

    iocontroller.write_pin(pins["SS_TSMS"][0], PinValue.LOW)
    iocontroller.write_pin(pins["AIR_N_WELD_DETECT"][0], PinValue.HIGH)

    time.sleep(0.05)
    assert("SHUTDOWN_CIRCUIT_CLOSED" == canbus.get_state("air_state"))
    time.sleep(0.25)

    assert("PRECHARGE" == canbus.get_state("air_state"))
    assert(True == iocontroller.read_pin(pins["PRECHARGE_CTL"][0]))

def test_precharge_charge_failure(canbus, iocontroller, pins):
    initialize_to_idle(canbus, iocontroller, pins)
    reset(iocontroller, pins)
    time.sleep(.5)
    assert(canbus.get_state("air_state") == "IDLE")

    iocontroller.write_pin(pins["SS_TSMS"][0], PinValue.LOW)
    iocontroller.write_pin(pins["AIR_N_WELD_DETECT"][0], PinValue.HIGH)

    time.sleep(0.05)
    assert("SHUTDOWN_CIRCUIT_CLOSED" == canbus.get_state("air_state"))
    time.sleep(0.3)

    assert("PRECHARGE" == canbus.get_state("air_state"))
    assert(True == iocontroller.read_pin(pins["PRECHARGE_CTL"][0]))

    time.sleep(2.1)

    assert("PRECHARGE_FAIL" == canbus.get_state("air_fault"))
    assert("FAULT" == canbus.get_state("air_state"))
    assert(False == iocontroller.read_pin(pins["PRECHARGE_CTL"][0]))

def test_precharge_motor_controller_timeout(canbus, iocontroller, pins):
    initialize_to_idle(canbus, iocontroller, pins)
    reset(iocontroller, pins)
    time.sleep(.5)
    assert(canbus.get_state("air_state") == "IDLE")

    iocontroller.write_pin(pins["SS_TSMS"][0], PinValue.LOW)
    iocontroller.write_pin(pins["AIR_N_WELD_DETECT"][0], PinValue.HIGH)

    # Stop MC CAN messages
    time.sleep(0.05)
    assert("SHUTDOWN_CIRCUIT_CLOSED" == canbus.get_state("air_state"))
    time.sleep(0.3)

    canbus.periodic_messages["bms_core"].stop()
    del canbus.periodic_messages["bms_core"]

    assert("PRECHARGE" == canbus.get_state("air_state"))
    assert(True == iocontroller.read_pin(pins["PRECHARGE_CTL"][0]))

    time.sleep(1.1)

    assert("CAN_BMS_TIMEOUT" == canbus.get_state("air_fault"))
    assert("FAULT" == canbus.get_state("air_state"))
    assert(False == iocontroller.read_pin(pins["PRECHARGE_CTL"][0]))

def test_precharge_bms_timeout(canbus, iocontroller, pins):
    initialize_to_idle(canbus, iocontroller, pins)
    reset(iocontroller, pins)
    time.sleep(.5)
    assert(canbus.get_state("air_state") == "IDLE")

    iocontroller.write_pin(pins["SS_TSMS"][0], PinValue.LOW)
    iocontroller.write_pin(pins["AIR_N_WELD_DETECT"][0], PinValue.HIGH)

    # Stop MC CAN messages
    time.sleep(0.05)
    assert("SHUTDOWN_CIRCUIT_CLOSED" == canbus.get_state("air_state"))
    time.sleep(0.3)

    canbus.periodic_messages["M167_Voltage_Info"].stop()
    del canbus.periodic_messages["M167_Voltage_Info"]

    assert("PRECHARGE" == canbus.get_state("air_state"))
    assert(True == iocontroller.read_pin(pins["PRECHARGE_CTL"][0]))

    time.sleep(1.1)

    assert("CAN_MC_TIMEOUT" == canbus.get_state("air_fault"))
    assert("FAULT" == canbus.get_state("air_state"))
    assert(False == iocontroller.read_pin(pins["PRECHARGE_CTL"][0]))

def test_precharge_success(canbus, iocontroller, pins):
    initialize_to_idle(canbus, iocontroller, pins)
    reset(iocontroller, pins)
    time.sleep(.5)
    assert(canbus.get_state("air_state") == "IDLE")

    iocontroller.write_pin(pins["SS_TSMS"][0], PinValue.LOW)
    iocontroller.write_pin(pins["AIR_N_WELD_DETECT"][0], PinValue.HIGH)

    time.sleep(0.05)
    assert("SHUTDOWN_CIRCUIT_CLOSED" == canbus.get_state("air_state"))
    time.sleep(0.25)

    assert("PRECHARGE" == canbus.get_state("air_state"))
    assert(True == iocontroller.read_pin(pins["PRECHARGE_CTL"][0]))

    # In PRECHARGE

    bms_voltage = canbus.get_state("pack_voltage")

    t_0 = time.time()
    end = t_0 + 1.5 # 1.5 seconds long
    while time.time() < end:
        t = time.time() - t_0
        mc_voltage = bms_voltage * (1 - math.exp(-t / MC_TAU))
        canbus.set_state("D1_DC_Bus_Voltage", mc_voltage)
        time.sleep(0.01)

    time.sleep(0.5)

    iocontroller.write_pin(pins["AIR_P_WELD_DETECT"][0], PinValue.HIGH)
    assert("NONE" == canbus.get_state("air_fault"))
    assert("TS_ACTIVE" == canbus.get_state("air_state"))
    assert(False == iocontroller.read_pin(pins["PRECHARGE_CTL"][0]))
    assert(True == iocontroller.read_pin(pins["AIR_N_LSD"][0]))

def test_ts_active_imd_fault(canbus, iocontroller, pins):
    test_precharge_success(canbus, iocontroller, pins)

    iocontroller.write_pin(pins["IMD_SENSE"][0], PinValue.LOW)

    time.sleep(0.1)

    assert(canbus.get_state("air_state") == "FAULT")
    assert(canbus.get_state("air_fault") == "IMD_STATUS")
    assert(False == iocontroller.read_pin(pins["PRECHARGE_CTL"][0]))
    assert(False == iocontroller.read_pin(pins["AIR_N_LSD"][0]))

def test_ts_active_bms_fault(canbus, iocontroller, pins):
    test_precharge_success(canbus, iocontroller, pins)

    iocontroller.write_pin(pins["BMS_SENSE"][0], PinValue.LOW)

    time.sleep(0.1)

    assert(canbus.get_state("air_state") == "FAULT")
    assert(canbus.get_state("air_fault") == "BMS_STATUS")
    assert(False == iocontroller.read_pin(pins["PRECHARGE_CTL"][0]))
    assert(False == iocontroller.read_pin(pins["AIR_N_LSD"][0]))

def test_discharge_both_airs_weld(canbus, iocontroller, pins):
    # Move to TS_ACTIVE
    test_precharge_success(canbus, iocontroller, pins)
    iocontroller.write_pin(pins["SS_TSMS"][0], PinValue.HIGH)
    time.sleep(0.1)

    assert(canbus.get_state("air_state") == "FAULT")
    assert(canbus.get_state("air_fault") == "BOTH_AIRS_WELD")
    assert(False == iocontroller.read_pin(pins["PRECHARGE_CTL"][0]))
    assert(False == iocontroller.read_pin(pins["AIR_N_LSD"][0]))

def test_discharge_air_p_weld(canbus, iocontroller, pins):
    test_precharge_success(canbus, iocontroller, pins)
    iocontroller.write_pin(pins["AIR_N_WELD_DETECT"][0], PinValue.LOW)
    iocontroller.write_pin(pins["SS_TSMS"][0], PinValue.HIGH)
    time.sleep(0.1)

    assert(canbus.get_state("air_state") == "FAULT")
    assert(canbus.get_state("air_fault") == "AIR_P_WELD")
    assert(False == iocontroller.read_pin(pins["PRECHARGE_CTL"][0]))
    assert(False == iocontroller.read_pin(pins["AIR_N_LSD"][0]))

def test_discharge_air_n_weld(canbus, iocontroller, pins):
    test_precharge_success(canbus, iocontroller, pins)
    iocontroller.write_pin(pins["AIR_P_WELD_DETECT"][0], PinValue.LOW)
    iocontroller.write_pin(pins["SS_TSMS"][0], PinValue.HIGH)
    time.sleep(0.1)

    assert(canbus.get_state("air_state") == "FAULT")
    assert(canbus.get_state("air_fault") == "AIR_N_WELD")
    assert(False == iocontroller.read_pin(pins["PRECHARGE_CTL"][0]))
    assert(False == iocontroller.read_pin(pins["AIR_N_LSD"][0]))

def test_discharge_mc_timeout(canbus, iocontroller, pins):
    test_precharge_success(canbus, iocontroller, pins)

    canbus.periodic_messages["M167_Voltage_Info"].stop()
    del canbus.periodic_messages["M167_Voltage_Info"]

    iocontroller.write_pin(pins["AIR_P_WELD_DETECT"][0], PinValue.LOW)
    iocontroller.write_pin(pins["AIR_N_WELD_DETECT"][0], PinValue.LOW)
    iocontroller.write_pin(pins["SS_TSMS"][0], PinValue.HIGH)

    # TODO: This might be too long to wait
    time.sleep(2) # Wait for discharge timer
    time.sleep(1.5) # Wait for CAN_MC timeout

    assert(canbus.get_state("air_fault") == "CAN_MC_TIMEOUT")
    assert(canbus.get_state("air_state") == "FAULT")
    assert(False == iocontroller.read_pin(pins["PRECHARGE_CTL"][0]))
    assert(False == iocontroller.read_pin(pins["AIR_N_LSD"][0]))

def test_discharge_fail(canbus, iocontroller, pins):
    test_precharge_success(canbus, iocontroller, pins)

    iocontroller.write_pin(pins["AIR_P_WELD_DETECT"][0], PinValue.LOW)
    iocontroller.write_pin(pins["AIR_N_WELD_DETECT"][0], PinValue.LOW)
    iocontroller.write_pin(pins["SS_TSMS"][0], PinValue.HIGH)

    time.sleep(2.5) # Wait for discharge timer

    assert(canbus.get_state("air_state") == "FAULT")
    assert(canbus.get_state("air_fault") == "DISCHARGE_FAIL")
    assert(False == iocontroller.read_pin(pins["PRECHARGE_CTL"][0]))
    assert(False == iocontroller.read_pin(pins["AIR_N_LSD"][0]))

def test_discharge_success(canbus, iocontroller, pins):
    test_precharge_success(canbus, iocontroller, pins)

    iocontroller.write_pin(pins["AIR_P_WELD_DETECT"][0], PinValue.LOW)
    iocontroller.write_pin(pins["AIR_N_WELD_DETECT"][0], PinValue.LOW)
    iocontroller.write_pin(pins["SS_TSMS"][0], PinValue.HIGH)

    v0 = canbus.get_state("D1_DC_Bus_Voltage")

    t_0 = time.time()

    end = t_0 + 1.5 # 1.5 seconds long
    while time.time() < end:
        t = time.time() - t_0
        mc_voltage = v0 * (-math.exp(-t / MC_TAU))
        canbus.set_state("D1_DC_Bus_Voltage", mc_voltage)
        time.sleep(0.01)

    time.sleep(1)

    assert(canbus.get_state("air_state") == "IDLE")
    assert(canbus.get_state("air_fault") == "NONE")
    assert(False == iocontroller.read_pin(pins["PRECHARGE_CTL"][0]))
    assert(False == iocontroller.read_pin(pins["AIR_N_LSD"][0]))

def test_state_machine_cycle_twice(canbus, iocontroller, pins):
    # Set up initial conditions
    canbus.set_state("pack_voltage", 350)
    canbus.set_periodic("bms_core", 0.1)
    canbus.set_state("D1_DC_Bus_Voltage", 0)
    canbus.set_periodic("M167_Voltage_Info", 0.1)

    iocontroller.write_pin(pins["AIR_P_WELD_DETECT"][0], PinValue.LOW)
    iocontroller.write_pin(pins["AIR_N_WELD_DETECT"][0], PinValue.LOW)
    iocontroller.write_pin(pins["SS_TSMS"][0], PinValue.HIGH)
    iocontroller.write_pin(pins["IMD_SENSE"][0], PinValue.HIGH)
    iocontroller.write_pin(pins["BMS_SENSE"][0], PinValue.HIGH)

    # Start device
    reset(iocontroller, pins)
    time.sleep(.5)
    assert(canbus.get_state("air_state") == "IDLE")

    for i in range(2):
        iocontroller.write_pin(pins["SS_TSMS"][0], PinValue.LOW)
        iocontroller.write_pin(pins["AIR_N_WELD_DETECT"][0], PinValue.HIGH)

        time.sleep(0.05)
        assert("SHUTDOWN_CIRCUIT_CLOSED" == canbus.get_state("air_state"))
        time.sleep(0.25)

        assert("PRECHARGE" == canbus.get_state("air_state"))
        assert(True == iocontroller.read_pin(pins["PRECHARGE_CTL"][0]))

        # In PRECHARGE

        bms_voltage = canbus.get_state("pack_voltage")

        t_0 = time.time()
        end = t_0 + 1.5 # 1.5 seconds long
        while time.time() < end:
            t = time.time() - t_0
            mc_voltage = bms_voltage * (1 - math.exp(-t / MC_TAU))
            canbus.set_state("D1_DC_Bus_Voltage", mc_voltage)
            time.sleep(0.01)

        time.sleep(0.5)

        iocontroller.write_pin(pins["AIR_P_WELD_DETECT"][0], PinValue.HIGH)
        assert("NONE" == canbus.get_state("air_fault"))
        assert("TS_ACTIVE" == canbus.get_state("air_state"))
        assert(False == iocontroller.read_pin(pins["PRECHARGE_CTL"][0]))
        assert(True == iocontroller.read_pin(pins["AIR_N_LSD"][0]))

        iocontroller.write_pin(pins["AIR_P_WELD_DETECT"][0], PinValue.LOW)
        iocontroller.write_pin(pins["AIR_N_WELD_DETECT"][0], PinValue.LOW)
        iocontroller.write_pin(pins["SS_TSMS"][0], PinValue.HIGH)

        v0 = canbus.get_state("D1_DC_Bus_Voltage")

        t_0 = time.time()

        end = t_0 + 1.5 # 1.5 seconds long
        while time.time() < end:
            t = time.time() - t_0
            mc_voltage = v0 * (-math.exp(-t / MC_TAU))
            canbus.set_state("D1_DC_Bus_Voltage", mc_voltage)
            time.sleep(0.01)

        time.sleep(1)

        assert(canbus.get_state("air_state") == "IDLE")
        assert(canbus.get_state("air_fault") == "NONE")
        assert(False == iocontroller.read_pin(pins["PRECHARGE_CTL"][0]))
        assert(False == iocontroller.read_pin(pins["AIR_N_LSD"][0]))

        time.sleep(0.5)
