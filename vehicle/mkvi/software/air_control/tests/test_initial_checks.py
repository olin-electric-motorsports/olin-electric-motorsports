import pytest
import time


# def test_bms_can_timeout(hitl):
#     """
#     Fault during init if BMS message takes longer than 1 second to receive
#     """
#     time.sleep(0.5)
#     assert hitl.can.get_state("air_state") == "INIT"
#     assert hitl.can.get_state("air_fault") == "CAN_BMS_TIMEOUT"


def test_bms_voltage_low(hitl):
    """
    Fault during init if BMS voltage is less than 200V
    """
    hitl.can.set_state("pack_voltage", 100)
    hitl.can.set_periodic("bms_core", 0.1)

    time.sleep(0.5)
    assert hitl.can.get_state("air_state") == "INIT"
    assert hitl.can.get_state("air_fault") == "BMS_VOLTAGE"


def test_motor_controller_timeout(hitl):
    """
    Fault during init if motor controller voltage message takes longer than 1
    second to receive
    """
    hitl.can.set_state("pack_voltage", 350)
    hitl.can.set_periodic("bms_core", 0.30)

    time.sleep(0.5)
    assert hitl.can.get_state("air_state") == "INIT"
    assert hitl.can.get_state("air_fault") == "CAN_MC_TIMEOUT"


def test_motor_controller_voltage_high(hitl):
    """
    Faults during init if the motor controller voltage is reported as too high
    (the test reports the voltage as 350V)
    """
    hitl.can.set_state("pack_voltage", 350)
    hitl.can.set_state("D1_DC_Bus_Voltage", 10)
    hitl.can.set_periodic("bms_core", 0.1)
    hitl.can.set_periodic("M167_Voltage_Info", 0.1)

    time.sleep(0.5)
    assert hitl.can.get_state("air_state") == "INIT"
    assert hitl.can.get_state("air_fault") == "MOTOR_CONTROLLER_VOLTAGE"


def test_air_p_weld(hitl):
    """
    Faults during init if an AIR_P weld is detected    
    """
    hitl.can.periodic_messages = {}
    hitl.can.set_state("pack_voltage", 350)
    hitl.can.set_state("D1_DC_Bus_Voltage", 0)
    hitl.can.set_periodic("bms_core", 0.1)
    hitl.can.set_periodic("M167_Voltage_Info", 0.1)

    hitl.air_p_aux.set(0)

    time.sleep(0.5)
    assert hitl.can.get_state("air_state") == "INIT"
    assert hitl.can.get_state("air_fault") == "AIR_P_WELD"


def test_air_n_weld(hitl):
    """
    Faults during init if an AIR_N weld is detected    
    """
    hitl.can.set_periodic("bms_core", 0.1)
    hitl.can.set_state("pack_voltage", 350)
    hitl.can.set_periodic("M167_Voltage_Info", 0.1)
    hitl.can.set_state("D1_DC_Bus_Voltage", 0)

    iocontroller.write_pin(pins["AIR_P_WELD_DETECT"][0], PinValue.LOW)
    iocontroller.write_pin(pins["AIR_N_WELD_DETECT"][0], PinValue.HIGH)

    time.sleep(0.5)
    assert hitl.can.get_state("air_state") == "FAULT"
    assert hitl.can.get_state("air_fault") == "AIR_N_WELD"


def test_shutdown_circuit_closed(hitl):
    """
    Faults during init if the shutdown circuit is closed (SS_TSMS reads HIGH)
    """
    hitl.can.set_state("pack_voltage", 350)
    hitl.can.set_periodic("bms_core", 0.1)
    hitl.can.set_state("D1_DC_Bus_Voltage", 0)
    hitl.can.set_periodic("M167_Voltage_Info", 0.1)

    hitl.air_p_aux.set(0)
    hitl.air_n_aux.set(0)
    hitl.ss_tsms.set(0)

    time.sleep(0.5)
    assert hitl.can.get_state("air_state") == "FAULT"
    assert hitl.can.get_state("air_fault") == "SHUTDOWN_IMPLAUSIBILITY"


def test_imd_implausibility(hitl):
    """
    Faults during init if the IMD_SENSE GPIO pin on the microcontroller is LOW
    """
    hitl.can.set_state("pack_voltage", 350)
    hitl.can.set_periodic("bms_core", 0.1)
    hitl.can.set_state("D1_DC_Bus_Voltage", 0)
    hitl.can.set_periodic("M167_Voltage_Info", 0.1)

    hitl.air_p_aux.set(0)
    hitl.air_n_aux.set(0)
    hitl.ss_tsms.set(1)
    hitl.imd_sense.set(0)

    time.sleep(0.5)
    assert hitl.can.get_state("air_state") == "FAULT"
    assert hitl.can.get_state("air_fault") == "IMD_STATUS"


def test_initial_checks_success(hitl):
    """
    State should be IDLE after INIT when all initial conditions are satisfied
    """
    hitl.can.set_state("pack_voltage", 350)
    hitl.can.set_periodic("bms_core", 0.1)
    hitl.can.set_state("D1_DC_Bus_Voltage", 0)
    hitl.can.set_periodic("M167_Voltage_Info", 0.1)

    hitl.air_p_aux.set(0)
    hitl.air_n_aux.set(0)
    hitl.ss_tsms.set(0)
    hitl.imd_sense.set(0)

    time.sleep(0.5)
    assert hitl.can.get_state("air_fault") == "NONE"
    assert hitl.can.get_state("air_state") == "IDLE"
