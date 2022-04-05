from random import random
import pytest
import math
import time



def reset(iocontroller):
    iocontroller.set_state("RESET", 0)
    time.sleep(0.5)
    iocontroller.set_state("RESET", 1)


"""
Tests
"""


def test_LV_led(canbus, iocontroller):
    """
    Reset board and verify LV LED on
    """
    reset(iocontroller)
    time.sleep(0.5)

    assert True == iocontroller.get_state("LV_LED")

def test_start_button_led(canbus, iocontroller):
    """
    Set start button pin and verify start button led is set
    """
    reset(iocontroller)
    time.sleep(0.5)
    iocontroller.set_state("START_BTN", 1)
    assert True == canbus.get_state("start_button_state")

    iocontroller.set_state("START_BTN", 0)
    assert False == canbus.get_state("start_button_state")


def test_bms_fault(canbus, iocontroller):
    """
    Set BMS status and fault BMS, verify BMS_LED value
    """
    reset(iocontroller)
    time.sleep(0.5)
    canbus.set_state("bms_ok", 1)
    assert True == iocontroller.get_state("BMS_LED")
    canbus.set_state("bms_ok", 0)
    assert False == iocontroller.get_state("BMS_LED")

def test_imd_fault(canbus, iocontroller):
    """
    Set IMD status and fault IMD, verify IMD_LED value
    """
    reset(iocontroller)
    time.sleep(0.5)
    canbus.set_state("imd_status", 1)
    assert True == iocontroller.get_state("IMD_LED")
    canbus.set_state("imd_status", 0)
    assert False == iocontroller.get_state("IMD_LED")


def test_brake_gate(canbus, iocontroller):
    """
    Send brake gate message and verify BRAKE_LED
    """
    reset(iocontroller)
    time.sleep(0.5)
    canbus.set_state("brake_gate", 1)
    assert True == iocontroller.get_state("BRAKE_LED")
    canbus.set_state("brake_gate", 0)
    assert False == iocontroller.get_state("BRAKE_LED")


def test_air_p_air_n(canbus, iocontroller):
    """
    Test AIR P and N and verify HV LED is set
    """
    reset(iocontroller)
    time.sleep(0.5)
    canbus.set_state("air_p_status", 1)
    canbus.set_state("air_n_status", 1)
    assert True == iocontroller.get_state("HV_LED")
    canbus.set_state("air_p_status", 1)
    canbus.set_state("air_n_status", 0)
    assert False == iocontroller.get_state("HV_LED")
    canbus.set_state("air_p_status", 0)
    canbus.set_state("air_n_status", 1)
    assert False == iocontroller.get_state("HV_LED")
    canbus.set_state("air_p_status", 0)
    canbus.set_state("air_n_status", 0)
    assert False == iocontroller.get_state("HV_LED")


def test_enter_drive_mode(canbus, iocontroller):
    """
    Test setting HV, Brake, start button and verify RTD message sent and buzzer on for 4 seconds
    """
    reset(iocontroller)
    time.sleep(0.5)
    iocontroller.set_state("START_BTN", 1)
    canbus.set_state("air_p_status", 1)
    canbus.set_state("air_n_status", 1)
    canbus.set_state("brake_gate", 1)
    assert True == canbus.get_state("ready_to_drive")
    assert True == iocontroller.get_state("START_LED")
    start = time.time()
    while(iocontroller.get_state("RTD_BUZZER_LSD") and time.time()-start < 10):
        pass
    assert 4 == pytest.approx(time.time() - start)


def test_exit_rtd(canbus, iocontroller):
    """
    Test HV turning off causing RTD to send false
    """
    test_enter_drive_mode(canbus, iocontroller)
    canbus.set_state("air_p_status", 0)
    assert False == canbus.get_state("ready_to_drive")
    assert False == iocontroller.get_state("START_LED")
    assert False == iocontroller.get_state("HV_LED")

def test_rtd_reenter(canbus, iocontroller):
    """
    Test reentering RTD after 
    """
    test_enter_drive_mode(canbus, iocontroller)
    test_exit_rtd(canbus, iocontroller)
    test_enter_drive_mode(canbus, iocontroller)

def test_steering(canbus, iocontroller):
    positions = [0,90,180]
    for _ in range(10):
        positions.append(random.uniform(0, 180)) # TODO find real steering range
    for deg in positions:
        iocontroller.set_state("STEERING_POS", deg)
        assert deg == pytest.approx(canbus.get_state("steering_position"))