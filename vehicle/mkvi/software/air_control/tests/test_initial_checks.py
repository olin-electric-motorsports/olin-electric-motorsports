import pytest
import time
from formula.projects.microhitl import Values as PinValue


def reset(iocontroller, pins):
    iocontroller.write_pin(pins["RESET"][0], PinValue.LOW)
    time.sleep(0.5)
    iocontroller.write_pin(pins["RESET"][0], PinValue.HIGH)


def test_bms_can_timeout(canbus, iocontroller, pins):
    """
    Fault during init if BMS message takes longer than 1 second to receive
    """
    reset(iocontroller, pins)
    assert canbus.get_state("air_fault") == "NONE"
    time.sleep(1.1)
    assert canbus.get_state("air_state") == "FAULT"
    assert canbus.get_state("air_fault") == "CAN_BMS_TIMEOUT"


def test_bms_voltage_low(canbus, iocontroller, pins):
    """
    Fault during init if BMS voltage is less than 200V
    """
    canbus.set_state("pack_voltage", 100)
    canbus.set_periodic("bms_core", 0.3)

    reset(iocontroller, pins)
    assert canbus.get_state("air_fault") == "NONE"
    time.sleep(1)
    assert canbus.get_state("air_state") == "FAULT"
    assert canbus.get_state("air_fault") == "BMS_VOLTAGE"


def test_motor_controller_timeout(canbus, iocontroller, pins):
    """
    Fault during init if motor controller voltage message takes longer than 1
    second to receive
    """
    canbus.set_state("pack_voltage", 350)
    canbus.set_periodic("bms_core", 0.30)

    reset(iocontroller, pins)
    time.sleep(1.1)
    assert canbus.get_state("air_state") == "FAULT"
    assert canbus.get_state("air_fault") == "CAN_MC_TIMEOUT"


def test_motor_controller_voltage_high(canbus, iocontroller, pins):
    """
    Faults during init if the motor controller voltage is reported as too high
    (the test reports the voltage as 350V)
    """
    canbus.set_state("pack_voltage", 350)
    canbus.set_state("D1_DC_Bus_Voltage", 10)
    canbus.set_periodic("bms_core", 0.1)
    canbus.set_periodic("M167_Voltage_Info", 0.1)

    reset(iocontroller, pins)
    time.sleep(1)
    assert canbus.get_state("air_state") == "FAULT"
    assert canbus.get_state("air_fault") == "MOTOR_CONTROLLER_VOLTAGE"


def test_air_p_weld(canbus, iocontroller, pins):
    """
    Faults during init if an AIR_P weld is detected    
    """
    canbus.periodic_messages = {}
    canbus.set_state("pack_voltage", 350)
    canbus.set_state("D1_DC_Bus_Voltage", 0)
    canbus.set_periodic("bms_core", 0.1)
    canbus.set_periodic("M167_Voltage_Info", 0.1)

    iocontroller.write_pin(pins["AIR_P_WELD_DETECT"][0], PinValue.HIGH)

    reset(iocontroller, pins)
    time.sleep(1)
    assert canbus.get_state("air_state") == "FAULT"
    assert canbus.get_state("air_fault") == "AIR_P_WELD"


def test_air_n_weld(canbus, iocontroller, pins):
    """
    Faults during init if an AIR_N weld is detected    
    """
    canbus.set_periodic("bms_core", 0.1)
    canbus.set_state("pack_voltage", 350)
    canbus.set_periodic("M167_Voltage_Info", 0.1)
    canbus.set_state("D1_DC_Bus_Voltage", 0)

    iocontroller.write_pin(pins["AIR_P_WELD_DETECT"][0], PinValue.LOW)
    iocontroller.write_pin(pins["AIR_N_WELD_DETECT"][0], PinValue.HIGH)

    reset(iocontroller, pins)
    time.sleep(1)
    assert canbus.get_state("air_state") == "FAULT"
    assert canbus.get_state("air_fault") == "AIR_N_WELD"


def test_shutdown_circuit_closed(canbus, iocontroller, pins):
    """
    Faults during init if the shutdown circuit is closed (SS_TSMS reads HIGH)
    """
    canbus.set_state("pack_voltage", 350)
    canbus.set_periodic("bms_core", 0.1)
    canbus.set_state("D1_DC_Bus_Voltage", 0)
    canbus.set_periodic("M167_Voltage_Info", 0.1)

    iocontroller.write_pin(pins["AIR_P_WELD_DETECT"][0], PinValue.LOW)
    iocontroller.write_pin(pins["AIR_N_WELD_DETECT"][0], PinValue.LOW)
    iocontroller.write_pin(pins["SS_TSMS"][0], PinValue.LOW)

    reset(iocontroller, pins)
    time.sleep(1)
    assert canbus.get_state("air_state") == "FAULT"
    assert canbus.get_state("air_fault") == "SHUTDOWN_IMPLAUSIBILITY"


def test_imd_implausibility(canbus, iocontroller, pins):
    """
    Faults during init if the IMD_SENSE GPIO pin on the microcontroller is LOW
    """
    canbus.set_state("pack_voltage", 350)
    canbus.set_periodic("bms_core", 0.1)
    canbus.set_state("D1_DC_Bus_Voltage", 0)
    canbus.set_periodic("M167_Voltage_Info", 0.1)

    iocontroller.write_pin(pins["AIR_P_WELD_DETECT"][0], PinValue.LOW)
    iocontroller.write_pin(pins["AIR_N_WELD_DETECT"][0], PinValue.LOW)
    iocontroller.write_pin(pins["SS_TSMS"][0], PinValue.HIGH)
    iocontroller.write_pin(pins["IMD_SENSE"][0], PinValue.LOW)

    reset(iocontroller, pins)
    time.sleep(1)
    assert canbus.get_state("air_state") == "FAULT"
    assert canbus.get_state("air_fault") == "IMD_STATUS"


def test_initial_checks_success(canbus, iocontroller, pins):
    """
    State should be IDLE after INIT when all initial conditions are satisfied
    """
    canbus.set_state("pack_voltage", 350)
    canbus.set_periodic("bms_core", 0.1)
    canbus.set_state("D1_DC_Bus_Voltage", 0)
    canbus.set_periodic("M167_Voltage_Info", 0.1)

    iocontroller.write_pin(pins["AIR_P_WELD_DETECT"][0], PinValue.LOW)
    iocontroller.write_pin(pins["AIR_N_WELD_DETECT"][0], PinValue.LOW)
    iocontroller.write_pin(pins["SS_TSMS"][0], PinValue.HIGH)
    iocontroller.write_pin(pins["IMD_SENSE"][0], PinValue.HIGH)
    iocontroller.write_pin(pins["BMS_SENSE"][0], PinValue.HIGH)

    reset(iocontroller, pins)
    time.sleep(1.1)
    assert canbus.get_state("air_fault") == "NONE"
    assert canbus.get_state("air_state") == "IDLE"
