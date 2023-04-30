import pytest
import math
import time

# Time constant for motor controller precharge circuit
MC_TAU = 0.2
NOMINAL_PACK_VOLTAGE = 350.0


@pytest.fixture(autouse=True)
def initialize_to_idle(hitl):
    """
    Sets up initial conditions to get ECU into IDLE mode
    """
    hitl.can.set_state("pack_voltage", NOMINAL_PACK_VOLTAGE)
    hitl.can.set_periodic("bms_core", 0.1)
    hitl.can.set_state("D1_DC_Bus_Voltage", 0)
    hitl.can.set_periodic("M167_Voltage_Info", 0.1)

    hitl.air_p_aux.set(0)
    hitl.air_n_aux.set(0)
    hitl.ss_tsms.set(1)  # Not closed
    hitl.ss_imd_latch.set(0)
    hitl.ss_mpc.set(0)
    hitl.ss_hvd.set(0)
    hitl.ss_tsmp.set(0)
    hitl.ss_bms.set(0)
    hitl.imd_status.set(1)

    hitl.reset.set(1)
    hitl.reset.set(0)
    time.sleep(4.5)


"""
Tests
"""


def test_idle_imd_fault(hitl):
    """
    Set IMD pin low in IDLE state to simulate IMD fault
    """
    assert hitl.can.get_state("air_state") == "IDLE"

    # IMD FAULT
    hitl.imd_status.set(0)
    time.sleep(0.2)
    assert hitl.can.get_state("air_state") == "FAULT"
    assert hitl.can.get_state("air_fault") == "IMD_STATUS"


def test_transition_idle_ss_closed(hitl):
    """
    Simulate closing shutdown circuit by setting SS_TSMS low to test the
    IDLE->SS_CLOSED transition
    """
    assert hitl.can.get_state("air_state") == "IDLE"

    hitl.ss_tsms.set(0)

    time.sleep(0.05)
    assert "SHUTDOWN_CIRCUIT_CLOSED" == hitl.can.get_state("air_state")


def test_ss_closed_implausibility(hitl):
    """
    Test fault where closing the shutdown circuit does NOT lead to
    AIR_N_WELD_DETECT detecting the AIR_N closing.
    """
    time.sleep(0.5)
    assert hitl.can.get_state("air_state") == "IDLE"

    hitl.ss_tsms.set(0)

    time.sleep(0.05)
    assert "SHUTDOWN_CIRCUIT_CLOSED" == hitl.can.get_state("air_state")

    # Do not close AIR_N_WELD_DETECT
    time.sleep(0.3)

    assert "FAULT" == hitl.can.get_state("air_state")
    assert "SHUTDOWN_IMPLAUSIBILITY" == hitl.can.get_state("air_fault")


def test_transition_ss_closed_precharge(hitl):
    """
    Tests transition from SS_CLOSED to PRECHARGE by entering SS_CLOSED with
    SS_TSMS being low and AIR_N_WELD_DETECT detecting the AIR_N being closed.
    """
    assert hitl.can.get_state("air_state") == "IDLE"

    hitl.ss_tsms.set(0)
    hitl.air_p_aux.set(1)
    time.sleep(0.10)

    assert "PRECHARGE" == hitl.can.get_state("air_state")
    assert hitl.precharge_ctl.get() == 1


def test_precharge_charge_failure(hitl):
    """
    ECU should fault if the motor controller voltage fails to reach the pack
    voltage during precharge. We simulate this by not changing the motor
    controller voltage during the 2-second duration of precharge.
    """
    assert hitl.can.get_state("air_state") == "IDLE"

    hitl.ss_tsms.set(0)
    hitl.air_p_aux.set(1)

    time.sleep(0.10)

    assert "PRECHARGE" == hitl.can.get_state("air_state")
    assert 1 == hitl.precharge_ctl.get()

    time.sleep(3.5)

    assert "PRECHARGE_FAIL" == hitl.can.get_state("air_fault")
    assert "FAULT" == hitl.can.get_state("air_state")
    assert 0 == hitl.precharge_ctl.get()


def test_precharge_motor_controller_timeout(hitl):
    """
    ECU should fault during PRECHARGE if it fails to receive a motor controller
    CAN message for more than 1 second.
    """
    assert hitl.can.get_state("air_state") == "IDLE"

    hitl.ss_tsms.set(0)
    hitl.air_p_aux.set(1)

    # Stop MC CAN messages

    hitl.can.stop_periodic("M167_Voltage_Info")

    time.sleep(0.2)

    assert "PRECHARGE" == hitl.can.get_state("air_state")
    assert 1 == hitl.precharge_ctl.get()

    time.sleep(4.0)

    assert "CAN_MC_TIMEOUT" == hitl.can.get_state("air_fault")
    assert "FAULT" == hitl.can.get_state("air_state")
    assert 0 == hitl.precharge_ctl.get()


def test_precharge_bms_timeout(hitl):
    """
    ECU should fault if it fails to receive BMS message for more than one second
    during precharge.
    """
    assert hitl.can.get_state("air_state") == "IDLE"

    hitl.ss_tsms.set(0)
    hitl.air_p_aux.set(1)

    # Stop MC CAN messages
    hitl.can.stop_periodic("bms_core")

    time.sleep(1.2)

    assert "CAN_BMS_TIMEOUT" == hitl.can.get_state("air_fault")
    assert "FAULT" == hitl.can.get_state("air_state")
    assert 0 == hitl.precharge_ctl.get()


def test_precharge_success(hitl):
    """
    ECU should enter TS_ACTIVE if motor controller voltage reaches pack voltage
    within two seconds of PRECHARGE beginning.
    """
    assert hitl.can.get_state("air_state") == "IDLE"

    hitl.ss_tsms.set(0)
    hitl.air_p_aux.set(1)

    time.sleep(0.10)

    assert "PRECHARGE" == hitl.can.get_state("air_state")
    assert 1 == hitl.precharge_ctl.get()

    # In PRECHARGE
    bms_voltage = hitl.can.get_state("pack_voltage")

    t_0 = time.time()
    end = t_0 + 3.0  # 3.0 seconds long
    while time.time() < end:
        t = time.time() - t_0
        mc_voltage = bms_voltage * (1 - math.exp(-t / MC_TAU))
        hitl.can.set_state("D1_DC_Bus_Voltage", mc_voltage)
        time.sleep(0.01)

    time.sleep(0.5)

    hitl.air_n_aux.set(1)
    assert "NONE" == hitl.can.get_state("air_fault")
    assert "TS_ACTIVE" == hitl.can.get_state("air_state")
    assert 0 == hitl.precharge_ctl.get()
    assert 1 == hitl.air_n_lsd.get()


def test_ts_active_imd_fault(hitl):
    """
    ECU should fault if IMD fault occurs during TS_ACTIVE. We simulate this by
    setting the IMD_SENSE pin low during TS_ACTIVE
    """
    test_precharge_success(hitl)

    hitl.imd_status.set(0)

    time.sleep(0.2)

    assert hitl.can.get_state("air_state") == "FAULT"
    assert hitl.can.get_state("air_fault") == "IMD_STATUS"
    assert 0 == hitl.precharge_ctl.get()
    assert 0 == hitl.air_n_lsd.get()


def test_discharge_both_airs_weld(hitl):
    """
    ECU should fault during DISCHARGE if neither AIR_x_WELD_DETECT pin changes.
    We simulate entering DISCHARGE by setting SS_TSMS high during TS_ACTIVE.
    """
    test_precharge_success(hitl)
    hitl.ss_tsms.set(1)  # Open TSMS
    time.sleep(0.5)

    assert hitl.can.get_state("air_state") == "FAULT"
    assert hitl.can.get_state("air_fault") == "BOTH_AIRS_WELD"
    assert 0 == hitl.precharge_ctl.get()
    assert 0 == hitl.air_n_lsd.get()


def test_discharge_air_p_weld(hitl):
    """
    ECU should fault during DISCHARGE if AIR_P stays closed
    """
    test_precharge_success(hitl)
    hitl.ss_tsms.set(1)  # Open TSMS
    hitl.air_n_aux.set(0)
    time.sleep(0.5)

    assert hitl.can.get_state("air_state") == "FAULT"
    assert hitl.can.get_state("air_fault") == "AIR_P_WELD"
    assert 0 == hitl.precharge_ctl.get()
    assert 0 == hitl.air_n_lsd.get()


def test_discharge_air_n_weld(hitl):
    """
    ECU should fault during DISCHARGE if AIR_N stays closed
    """
    test_precharge_success(hitl)
    hitl.ss_tsms.set(1)  # Open TSMS
    hitl.air_p_aux.set(0)
    time.sleep(0.5)

    assert hitl.can.get_state("air_state") == "FAULT"
    assert hitl.can.get_state("air_fault") == "AIR_N_WELD"
    assert 0 == hitl.precharge_ctl.get()
    assert 0 == hitl.air_n_lsd.get()


def test_discharge_mc_timeout(hitl):
    """
    ECU should fault during DISCHARGE if it fails to receive motor controller
    voltage CAN messages for more than a second
    """
    test_precharge_success(hitl)

    hitl.can.stop_periodic("M167_Voltage_Info")

    hitl.ss_tsms.set(1)  # Open TSMS
    hitl.air_p_aux.set(0)
    hitl.air_n_aux.set(0)

    time.sleep(1.2)  # Wait for CAN_MC timeout

    assert hitl.can.get_state("air_fault") == "CAN_MC_TIMEOUT"
    assert hitl.can.get_state("air_state") == "FAULT"
    assert 0 == hitl.precharge_ctl.get()
    assert 0 == hitl.air_n_lsd.get()


def test_discharge_fail(hitl):
    """
    ECU should fault during DISCHARGE if the motor controller voltage doesn't
    fall to ~zero within two seconds.
    """
    test_precharge_success(hitl)

    hitl.ss_tsms.set(1)  # Open TSMS
    hitl.air_p_aux.set(0)
    hitl.air_n_aux.set(0)

    time.sleep(10.2)  # Wait for discharge timer

    assert hitl.can.get_state("air_state") == "FAULT"
    assert hitl.can.get_state("air_fault") == "DISCHARGE_FAIL"
    assert 0 == hitl.precharge_ctl.get()
    assert 0 == hitl.air_n_lsd.get()


def test_discharge_success(hitl):
    """
    ECU should return to IDLE after DISCHARGE if the motor controller
    voltage falls to ~zero volts within two seconds
    """
    test_precharge_success(hitl)

    hitl.ss_tsms.set(1)  # Open TSMS
    hitl.air_p_aux.set(0)
    hitl.air_n_aux.set(0)

    v0 = hitl.can.get_state("D1_DC_Bus_Voltage")

    t_0 = time.time()

    end = t_0 + 5  # 5 seconds long
    while time.time() < end:
        t = time.time() - t_0
        mc_voltage = v0 * (math.exp(-t / MC_TAU))
        hitl.can.set_state("D1_DC_Bus_Voltage", mc_voltage)
        time.sleep(0.01)

    time.sleep(1)

    assert hitl.can.get_state("air_state") == "IDLE"
    assert hitl.can.get_state("air_fault") == "NONE"
    assert 0 == hitl.precharge_ctl.get()
    assert 0 == hitl.air_n_lsd.get()


def test_state_machine_cycle_twice(hitl):
    """
    Tests two cycles of the IDLE->PRECHARGE->TS_ACTIVE->DISCHARGE->IDLE to
    ensure that the firmware is able to complete the cycle without fault.
    """

    # Start device
    assert hitl.can.get_state("air_state") == "IDLE"

    for i in range(2):
        hitl.ss_tsms.set(0)
        hitl.air_p_aux.set(1)

        time.sleep(0.2)

        assert "PRECHARGE" == hitl.can.get_state("air_state")
        assert 1 == hitl.precharge_ctl.get()

        # In PRECHARGE

        bms_voltage = hitl.can.get_state("pack_voltage")

        t_0 = time.time()
        end = t_0 + 3.0  # 1.5 seconds long
        while time.time() < end:
            t = time.time() - t_0
            mc_voltage = bms_voltage * (1 - math.exp(-t / MC_TAU))
            hitl.can.set_state("D1_DC_Bus_Voltage", mc_voltage)
            time.sleep(0.01)

        time.sleep(0.5)

        hitl.air_n_aux.set(1)
        assert "NONE" == hitl.can.get_state("air_fault")
        assert "TS_ACTIVE" == hitl.can.get_state("air_state")
        assert 0 == hitl.precharge_ctl.get()
        assert 1 == hitl.air_n_lsd.get()

        hitl.air_p_aux.set(0)
        hitl.air_n_aux.set(0)
        hitl.ss_tsms.set(1)

        v0 = hitl.can.get_state("D1_DC_Bus_Voltage")

        t_0 = time.time()

        end = t_0 + 5.0  # 5 seconds long
        while time.time() < end:
            t = time.time() - t_0
            mc_voltage = v0 * (math.exp(-t / MC_TAU))
            hitl.can.set_state("D1_DC_Bus_Voltage", mc_voltage)
            time.sleep(0.01)

        time.sleep(1)

        assert hitl.can.get_state("air_state") == "IDLE"
        assert hitl.can.get_state("air_fault") == "NONE"
        assert 0 == hitl.precharge_ctl.get()
        assert 0 == hitl.air_n_lsd.get()

        time.sleep(0.5)
