import pytest
import math
import time

# Time constant for motor controller precharge circuit
MC_TAU = 0.2


def reset(iocontroller, pins):
    iocontroller.set_state("RESET", 0)
    time.sleep(0.5)
    iocontroller.set_state("RESET", 1)


def initialize_to_idle(canbus, iocontroller, pins):
    """
    Sets up initial conditions to get ECU into IDLE mode
    """
    canbus.set_state("pack_voltage", NOMINAL_PACK_VOLTAGE)
    canbus.set_periodic("bms_core", 0.1)
    canbus.set_state("D1_DC_Bus_Voltage", 0)
    canbus.set_periodic("M167_Voltage_Info", 0.1)

    iocontroller.set_state("AIR_P_WELD_DETECT", 0)
    iocontroller.set_state("AIR_N_WELD_DETECT", 0)
    iocontroller.set_state("SS_TSMS", 1)
    iocontroller.set_state("IMD_SENSE", 1)
    iocontroller.set_state("BMS_SENSE", 1)


"""
Tests
"""


def test_idle_imd_fault(canbus, iocontroller, pins):
    """
    Set IMD pin low in IDLE state to simulate IMD fault
    """
    initialize_to_idle(canbus, iocontroller, pins)
    reset(iocontroller, pins)
    time.sleep(0.5)
    assert canbus.get_state("air_state") == "IDLE"

    # IMD FAULT
    iocontroller.set_state("IMD_SENSE", 0)
    time.sleep(0.1)
    assert canbus.get_state("air_state") == "FAULT"
    assert canbus.get_state("air_fault") == "IMD_STATUS"


def test_idle_bms_fault(canbus, iocontroller, pins):
    """
    Set BMS_SENSE pin low to simulate BMS fault during IDLE state
    """
    initialize_to_idle(canbus, iocontroller, pins)
    reset(iocontroller, pins)
    time.sleep(0.5)
    assert canbus.get_state("air_state") == "IDLE"

    # IMD FAULT
    iocontroller.set_state("BMS_SENSE", 0)
    time.sleep(0.1)
    assert canbus.get_state("air_state") == "FAULT"
    assert canbus.get_state("air_fault") == "BMS_STATUS"


def test_transition_idle_ss_closed(canbus, iocontroller, pins):
    """
    Simulate closing shutdown circuit by setting SS_TSMS low to test the
    IDLE->SS_CLOSED transition
    """
    initialize_to_idle(canbus, iocontroller, pins)
    reset(iocontroller, pins)
    time.sleep(0.5)
    assert canbus.get_state("air_state") == "IDLE"

    iocontroller.set_state("SS_TSMS", 0)

    time.sleep(0.05)
    assert "SHUTDOWN_CIRCUIT_CLOSED" == canbus.get_state("air_state")


def test_ss_closed_implausibility(canbus, iocontroller, pins):
    """
    Test fault where closing the shutdown circuit does NOT lead to
    AIR_N_WELD_DETECT detecting the AIR_N closing.
    """
    initialize_to_idle(canbus, iocontroller, pins)
    reset(iocontroller, pins)
    time.sleep(0.5)
    assert canbus.get_state("air_state") == "IDLE"

    iocontroller.set_state("SS_TSMS", 0)

    time.sleep(0.05)
    assert "SHUTDOWN_CIRCUIT_CLOSED" == canbus.get_state("air_state")

    # Do not close AIR_N_WELD_DETECT
    time.sleep(0.3)

    assert "FAULT" == canbus.get_state("air_state")
    assert "SHUTDOWN_IMPLAUSIBILITY" == canbus.get_state("air_fault")


def test_transition_ss_closed_precharge(canbus, iocontroller, pins):
    """
    Tests transition from SS_CLOSED to PRECHARGE by entering SS_CLOSED with
    SS_TSMS being low and AIR_N_WELD_DETECT detecting the AIR_N being closed.
    """
    initialize_to_idle(canbus, iocontroller, pins)
    reset(iocontroller, pins)
    time.sleep(0.5)
    assert canbus.get_state("air_state") == "IDLE"

    iocontroller.set_state("SS_TSMS", 0)
    iocontroller.set_state("AIR_N_WELD_DETECT", 1)

    time.sleep(0.05)
    assert "SHUTDOWN_CIRCUIT_CLOSED" == canbus.get_state("air_state")
    time.sleep(0.25)

    assert "PRECHARGE" == canbus.get_state("air_state")
    assert True == iocontroller.get_state("PRECHARGE_CTL")


def test_precharge_charge_failure(canbus, iocontroller, pins):
    """
    ECU should fault if the motor controller voltage fails to reach the pack
    voltage during precharge. We simulate this by not changing the motor
    controller voltage during the 2-second duration of precharge.
    """
    initialize_to_idle(canbus, iocontroller, pins)
    reset(iocontroller, pins)
    time.sleep(0.5)
    assert canbus.get_state("air_state") == "IDLE"

    iocontroller.set_state("SS_TSMS", 0)
    iocontroller.set_state("AIR_N_WELD_DETECT", 1)

    time.sleep(0.05)
    assert "SHUTDOWN_CIRCUIT_CLOSED" == canbus.get_state("air_state")
    time.sleep(0.3)

    assert "PRECHARGE" == canbus.get_state("air_state")
    assert True == iocontroller.get_state("PRECHARGE_CTL")

    time.sleep(2.1)

    assert "PRECHARGE_FAIL" == canbus.get_state("air_fault")
    assert "FAULT" == canbus.get_state("air_state")
    assert False == iocontroller.get_state("PRECHARGE_CTL")


def test_precharge_motor_controller_timeout(canbus, iocontroller, pins):
    """
    ECU should fault during PRECHARGE if it fails to receive a motor controller
    CAN message for more than 1 second.
    """
    initialize_to_idle(canbus, iocontroller, pins)
    reset(iocontroller, pins)
    time.sleep(0.5)
    assert canbus.get_state("air_state") == "IDLE"

    iocontroller.set_state("SS_TSMS", 0)
    iocontroller.set_state("AIR_N_WELD_DETECT", 1)

    # Stop MC CAN messages
    time.sleep(0.05)
    assert "SHUTDOWN_CIRCUIT_CLOSED" == canbus.get_state("air_state")
    time.sleep(0.3)

    canbus.periodic_messages["bms_core"].stop()
    del canbus.periodic_messages["bms_core"]

    assert "PRECHARGE" == canbus.get_state("air_state")
    assert True == iocontroller.get_state("PRECHARGE_CTL")

    time.sleep(1.1)

    assert "CAN_BMS_TIMEOUT" == canbus.get_state("air_fault")
    assert "FAULT" == canbus.get_state("air_state")
    assert False == iocontroller.get_state("PRECHARGE_CTL")


def test_precharge_bms_timeout(canbus, iocontroller, pins):
    """
    ECU should fault if it fails to receive BMS message for more than one second
    during precharge.
    """
    initialize_to_idle(canbus, iocontroller, pins)
    reset(iocontroller, pins)
    time.sleep(0.5)
    assert canbus.get_state("air_state") == "IDLE"

    iocontroller.set_state("SS_TSMS", 0)
    iocontroller.set_state("AIR_N_WELD_DETECT", 1)

    # Stop MC CAN messages
    time.sleep(0.05)
    assert "SHUTDOWN_CIRCUIT_CLOSED" == canbus.get_state("air_state")
    time.sleep(0.3)

    canbus.periodic_messages["M167_Voltage_Info"].stop()
    del canbus.periodic_messages["M167_Voltage_Info"]

    assert "PRECHARGE" == canbus.get_state("air_state")
    assert True == iocontroller.get_state("PRECHARGE_CTL")

    time.sleep(1.1)

    assert "CAN_MC_TIMEOUT" == canbus.get_state("air_fault")
    assert "FAULT" == canbus.get_state("air_state")
    assert False == iocontroller.get_state("PRECHARGE_CTL")


def test_precharge_success(canbus, iocontroller, pins):
    """
    ECU should enter TS_ACTIVE if motor controller voltage reaches pack voltage
    within two seconds of PRECHARGE beginning.
    """
    initialize_to_idle(canbus, iocontroller, pins)
    reset(iocontroller, pins)
    time.sleep(0.5)
    assert canbus.get_state("air_state") == "IDLE"

    iocontroller.set_state("SS_TSMS", 0)
    iocontroller.set_state("AIR_N_WELD_DETECT", 1)

    time.sleep(0.05)
    assert "SHUTDOWN_CIRCUIT_CLOSED" == canbus.get_state("air_state")
    time.sleep(0.25)

    assert "PRECHARGE" == canbus.get_state("air_state")
    assert True == iocontroller.get_state("PRECHARGE_CTL")

    # In PRECHARGE

    bms_voltage = canbus.get_state("pack_voltage")

    t_0 = time.time()
    end = t_0 + 1.5  # 1.5 seconds long
    while time.time() < end:
        t = time.time() - t_0
        mc_voltage = bms_voltage * (1 - math.exp(-t / MC_TAU))
        canbus.set_state("D1_DC_Bus_Voltage", mc_voltage)
        time.sleep(0.01)

    time.sleep(0.5)

    iocontroller.set_state("AIR_P_WELD_DETECT", 1)
    assert "NONE" == canbus.get_state("air_fault")
    assert "TS_ACTIVE" == canbus.get_state("air_state")
    assert False == iocontroller.get_state("PRECHARGE_CTL")
    assert True == iocontroller.get_state("AIR_N_LSD")


def test_ts_active_imd_fault(canbus, iocontroller, pins):
    """
    ECU should fault if IMD fault occurs during TS_ACTIVE. We simulate this by
    setting the IMD_SENSE pin low during TS_ACTIVE
    """
    test_precharge_success(canbus, iocontroller, pins)

    iocontroller.set_state("IMD_SENSE", 0)

    time.sleep(0.1)

    assert canbus.get_state("air_state") == "FAULT"
    assert canbus.get_state("air_fault") == "IMD_STATUS"
    assert False == iocontroller.get_state("PRECHARGE_CTL")
    assert False == iocontroller.get_state("AIR_N_LSD")


def test_ts_active_bms_fault(canbus, iocontroller, pins):
    """
    ECU should fault if BMS fault occurs during TS_ACTIVE. We simulate this by
    setting the BMS_SENSE pin low during TS_ACTIVE
    """
    test_precharge_success(canbus, iocontroller, pins)

    iocontroller.set_state("BMS_SENSE", 0)

    time.sleep(0.1)

    assert canbus.get_state("air_state") == "FAULT"
    assert canbus.get_state("air_fault") == "BMS_STATUS"
    assert False == iocontroller.get_state("PRECHARGE_CTL")
    assert False == iocontroller.get_state("AIR_N_LSD")


def test_discharge_both_airs_weld(canbus, iocontroller, pins):
    """
    ECU should fault during DISCHARGE if neither AIR_x_WELD_DETECT pin changes.
    We simulate entering DISCHARGE by setting SS_TSMS high during TS_ACTIVE.
    """
    test_precharge_success(canbus, iocontroller, pins)
    iocontroller.set_state("SS_TSMS", 1)
    time.sleep(0.1)

    assert canbus.get_state("air_state") == "FAULT"
    assert canbus.get_state("air_fault") == "BOTH_AIRS_WELD"
    assert False == iocontroller.get_state("PRECHARGE_CTL")
    assert False == iocontroller.get_state("AIR_N_LSD")


def test_discharge_air_p_weld(canbus, iocontroller, pins):
    """
    ECU should fault during DISCHARGE if AIR_P stays closed
    """
    test_precharge_success(canbus, iocontroller, pins)
    iocontroller.set_state("AIR_N_WELD_DETECT", 0)
    iocontroller.set_state("SS_TSMS", 1)
    time.sleep(0.1)

    assert canbus.get_state("air_state") == "FAULT"
    assert canbus.get_state("air_fault") == "AIR_P_WELD"
    assert False == iocontroller.get_state("PRECHARGE_CTL")
    assert False == iocontroller.get_state("AIR_N_LSD")


def test_discharge_air_n_weld(canbus, iocontroller, pins):
    """
    ECU should fault during DISCHARGE if AIR_N stays closed
    """
    test_precharge_success(canbus, iocontroller, pins)
    iocontroller.set_state("AIR_P_WELD_DETECT", 0)
    iocontroller.set_state("SS_TSMS", 1)
    time.sleep(0.1)

    assert canbus.get_state("air_state") == "FAULT"
    assert canbus.get_state("air_fault") == "AIR_N_WELD"
    assert False == iocontroller.get_state("PRECHARGE_CTL")
    assert False == iocontroller.get_state("AIR_N_LSD")


def test_discharge_mc_timeout(canbus, iocontroller, pins):
    """
    ECU should fault during DISCHARGE if it fails to receive motor controller
    voltage CAN messages for more than a second
    """
    test_precharge_success(canbus, iocontroller, pins)

    canbus.periodic_messages["M167_Voltage_Info"].stop()
    del canbus.periodic_messages["M167_Voltage_Info"]

    iocontroller.set_state("AIR_P_WELD_DETECT", 0)
    iocontroller.set_state("AIR_N_WELD_DETECT", 0)
    iocontroller.set_state("SS_TSMS", 1)

    time.sleep(1.2)  # Wait for CAN_MC timeout

    assert canbus.get_state("air_fault") == "CAN_MC_TIMEOUT"
    assert canbus.get_state("air_state") == "FAULT"
    assert False == iocontroller.get_state("PRECHARGE_CTL")
    assert False == iocontroller.get_state("AIR_N_LSD")


def test_discharge_fail(canbus, iocontroller, pins):
    """
    ECU should fault during DISCHARGE if the motor controller voltage doesn't
    fall to ~zero within two seconds.
    """
    test_precharge_success(canbus, iocontroller, pins)

    iocontroller.set_state("AIR_P_WELD_DETECT", 0)
    iocontroller.set_state("AIR_N_WELD_DETECT", 0)
    iocontroller.set_state("SS_TSMS", 1)

    time.sleep(2.2)  # Wait for discharge timer

    assert canbus.get_state("air_state") == "FAULT"
    assert canbus.get_state("air_fault") == "DISCHARGE_FAIL"
    assert False == iocontroller.get_state("PRECHARGE_CTL")
    assert False == iocontroller.get_state("AIR_N_LSD")


def test_discharge_success(canbus, iocontroller, pins):
    """
    ECU should return to IDLE after DISCHARGE if the motor controller
    voltage falls to ~zero volts within two seconds
    """
    test_precharge_success(canbus, iocontroller, pins)

    iocontroller.set_state("AIR_P_WELD_DETECT", 0)
    iocontroller.set_state("AIR_N_WELD_DETECT", 0)
    iocontroller.set_state("SS_TSMS", 1)

    v0 = canbus.get_state("D1_DC_Bus_Voltage")

    t_0 = time.time()

    end = t_0 + 1.5  # 1.5 seconds long
    while time.time() < end:
        t = time.time() - t_0
        mc_voltage = v0 * (-math.exp(-t / MC_TAU))
        canbus.set_state("D1_DC_Bus_Voltage", mc_voltage)
        time.sleep(0.01)

    time.sleep(1)

    assert canbus.get_state("air_state") == "IDLE"
    assert canbus.get_state("air_fault") == "NONE"
    assert False == iocontroller.get_state("PRECHARGE_CTL")
    assert False == iocontroller.get_state("AIR_N_LSD")


def test_state_machine_cycle_twice(canbus, iocontroller, pins):
    """
    Tests two cycles of the IDLE->PRECHARGE->TS_ACTIVE->DISCHARGE->IDLE to
    ensure that the firmware is able to complete the cycle without fault.
    """
    # Set up initial conditions
    canbus.set_state("pack_voltage", NOMINAL_PACK_VOLTAGE)
    canbus.set_periodic("bms_core", 0.1)
    canbus.set_state("D1_DC_Bus_Voltage", 0)
    canbus.set_periodic("M167_Voltage_Info", 0.1)

    iocontroller.set_state("AIR_P_WELD_DETECT", 0)
    iocontroller.set_state("AIR_N_WELD_DETECT", 0)
    iocontroller.set_state("SS_TSMS", 1)
    iocontroller.set_state("IMD_SENSE", 1)
    iocontroller.set_state("BMS_SENSE", 1)

    # Start device
    reset(iocontroller, pins)
    time.sleep(0.5)
    assert canbus.get_state("air_state") == "IDLE"

    for i in range(2):
        iocontroller.set_state("SS_TSMS", 0)
        iocontroller.set_state("AIR_N_WELD_DETECT", 1)

        time.sleep(0.05)
        assert "SHUTDOWN_CIRCUIT_CLOSED" == canbus.get_state("air_state")
        time.sleep(0.25)

        assert "PRECHARGE" == canbus.get_state("air_state")
        assert True == iocontroller.get_state("PRECHARGE_CTL")

        # In PRECHARGE

        bms_voltage = canbus.get_state("pack_voltage")

        t_0 = time.time()
        end = t_0 + 1.5  # 1.5 seconds long
        while time.time() < end:
            t = time.time() - t_0
            mc_voltage = bms_voltage * (1 - math.exp(-t / MC_TAU))
            canbus.set_state("D1_DC_Bus_Voltage", mc_voltage)
            time.sleep(0.01)

        time.sleep(0.5)

        iocontroller.set_state("AIR_P_WELD_DETECT", 1)
        assert "NONE" == canbus.get_state("air_fault")
        assert "TS_ACTIVE" == canbus.get_state("air_state")
        assert False == iocontroller.get_state("PRECHARGE_CTL")
        assert True == iocontroller.get_state("AIR_N_LSD")

        iocontroller.set_state("AIR_P_WELD_DETECT", 0)
        iocontroller.set_state("AIR_N_WELD_DETECT", 0)
        iocontroller.set_state("SS_TSMS", 1)

        v0 = canbus.get_state("D1_DC_Bus_Voltage")

        t_0 = time.time()

        end = t_0 + 1.5  # 1.5 seconds long
        while time.time() < end:
            t = time.time() - t_0
            mc_voltage = v0 * (-math.exp(-t / MC_TAU))
            canbus.set_state("D1_DC_Bus_Voltage", mc_voltage)
            time.sleep(0.01)

        time.sleep(1)

        assert canbus.get_state("air_state") == "IDLE"
        assert canbus.get_state("air_fault") == "NONE"
        assert False == iocontroller.get_state("PRECHARGE_CTL")
        assert False == iocontroller.get_state("AIR_N_LSD")

        time.sleep(0.5)
