"""
Single-Component HITL Tests for MKVI Throttle Board
"""

# Base/Extended Python Imports
import pytest
from typing import Dict, Tuple, Callable
import time

import numpy as np

# Project Imports
from projects.hitl.software.hitl.iocontroller import IOController
from projects.hitl.software.hitl.cancontroller import CANController
from projects.hitl.software.hitl.utils import build_pin
from projects.hitl.software.hitl.iocontroller import PinMode, PinType

IS_PIN_NAME = "SHUTDOWN_SENSE_INERTIA_SWITCH"
THROTTLE_L_PIN_NAME = "THROTTLE_L"
THROTTLE_R_PIN_NAME = "THROTTLE_R"
ADC_REF_V = 5.0
ADC_MAX_COUNTS = 1024
ADC_COUNT_ABS_ERROR = 20  # arbitrary error threshold


@pytest.fixture
def throttle() -> Dict:
    # TODO: board number and pin numbers are currently arbitrary, correct them before
    # running any tests
    return {
        IS_PIN_NAME: build_pin(0, 0, PinType.DIGITAL, PinMode.BOTH, 0, 1),
        THROTTLE_L_PIN_NAME: build_pin(0, 1, PinType.ANALOG, PinMode.BOTH, 0, 1),
        THROTTLE_R_PIN_NAME: build_pin(0, 2, PinType.ANALOG, PinMode.BOTH, 0, 1),
    }


@pytest.fixture(scope="session")
def io_controller(throttle: Dict) -> None:
    out = IOController(throttle)
    time.sleep(2)
    yield out
    out.close()


@pytest.fixture(scope="session")
def can_controller() -> CANController:
    can = CANController()
    yield can
    can.close()


@pytest.fixture
def set_throttle_voltages(
    io_controller: IOController,
) -> Callable[[float, float], None]:
    def _inner(left_v: float, right_v: float):
        io_controller.set_state(THROTTLE_L_PIN_NAME, left_v)
        io_controller.set_state(THROTTLE_R_PIN_NAME, right_v)

    return _inner


@pytest.fixture
def set_inertia_switch_voltage(io_controller: IOController) -> Callable[[int], None]:
    def _inner(switch_mode: int):
        io_controller.set_state(IS_PIN_NAME, switch_mode)

    return _inner


@pytest.fixture
def voltage_to_adc_count() -> Callable[[float], int]:
    def _inner(voltage: float):
        return int(voltage / ADC_REF_V * ADC_MAX_COUNTS)

    return _inner


@pytest.fixture
def check_can_torque_request(can_controller: CANController) -> Callable[[int], None]:
    def _inner(torque_request: int):
        assert can_controller.get_state("torque_command") == torque_request

    return _inner


@pytest.fixture
def check_throttle_counts_can(
    can_controller: CANController,
    voltage_to_adc_count: Callable[[float], int],
) -> Callable[[float, float], bool]:
    def _inner(left_v, right_v) -> bool:
        left_counts_expected = voltage_to_adc_count(left_v)
        right_counts_expected = voltage_to_adc_count(right_v)
        # TODO: update CAN signals to L and R when firmware is updated
        left_counts_actual = can_controller.get_state("throttle_1_raw")
        right_counts_actual = can_controller.get_state("throttle_2_raw")

        left_channel_within_tol = (
            left_counts_expected - ADC_COUNT_ABS_ERROR
            < left_counts_actual
            < left_counts_expected + ADC_COUNT_ABS_ERROR
        )
        right_channel_within_tol = (
            right_counts_expected - ADC_COUNT_ABS_ERROR
            < right_counts_actual
            < right_counts_expected + ADC_COUNT_ABS_ERROR
        )

        return left_channel_within_tol and right_channel_within_tol

    return _inner


@pytest.fixture
def check_throttle_out_of_range_can(
    can_controller: CANController,
) -> Callable[[None], bool]:
    def _inner() -> bool:
        """
        Check that throttle debug messages say that both pots are out
        of range and throttle status is is THROTTLE_2_OUT_OF_RANGE
        """
        # this is gross
        return (
            can_controller.get_state("throttle_1_out_of_range")
            and can_controller.get_state("throttle_2_out_of_range")
            # TODO: verify that is this the right message to check
            and can_controller.get_state("throttle_brake_implaus")
            and can_controller.get_state("throttle_state") == "THROTTLE_2_OUT_OF_RANGE"
        )

    return _inner


@pytest.fixture
def set_rtd_signal(can_controller: CANController) -> Callable[[bool], None]:
    def _inner(motor_enable: bool) -> bool:
        can_controller.set_state("ready_to_drive", motor_enable)

    return _inner


@pytest.mark.parametrize("left_v", np.linspace(0, 5, 5))
@pytest.mark.parametrize("right_v", np.linspace(0, 5, 5))
def test_throttle_sanity(
    left_v: float,
    right_v: float,
    set_throttle_voltages: Callable[[float, float], None],
    check_throttle_counts_can: Callable[[float, float], bool],
):
    """
    Check to make sure throttle reports correct voltages being set
    """
    set_throttle_voltages(left_v, right_v)
    time.sleep(1)
    assert check_throttle_counts_can(left_v, right_v)


@pytest.mark.parametrize("voltages", [(0, 0), (5, 5)])
def test_throttle_out_of_range(
    voltages: Tuple[int, int],
    set_throttle_voltages: Callable[[float, float], None],
    check_throttle_out_of_range_can: Callable[[None], bool],
):
    set_throttle_voltages[voltages[0], voltages[1]]
    time.sleep(1)
    assert check_throttle_out_of_range_can()


@pytest.mark.parametrize("voltages", [(1.5, 2.5), ((2.5, 3.5))])
def test_throttle_deviation(
    voltages: Tuple[float, float],
    set_throttle_voltages: Callable[[float, float], None],
    can_controller: CANController,
    check_can_torque_request: Callable[[int], None],
):
    set_throttle_voltages(voltages[0], voltages[1])
    time.sleep(1)
    check_can_torque_request(0)
    assert can_controller.get_state("throttle_deviation")
    assert (
        can_controller.get_state("throttle_state") == "THROTTLE_POSITION_IMPLAUSIBILITY"
    )


def test_inertia_switch(
    can_controller: CANController, set_inertia_switch_voltage: Callable[[int], None]
):
    assert can_controller.get_state("ss_is") == False
    set_inertia_switch_voltage(1)
    time.sleep(1)
    assert can_controller.get_state("ss_is") == True
    set_inertia_switch_voltage(0)
    time.sleep(1)
    assert can_controller.get_state("ss_is") == False


def test_motor_enable(
    can_controller: CANController, set_rtd_signal: Callable[[bool], None]
):
    assert can_controller.get_state("inverter_enable") == False
    set_rtd_signal(True)
    time.sleep(1)
    assert can_controller.get_state("inverter_enable") == True
    set_rtd_signal(False)
    time.sleep(1)
    assert can_controller.get_state("inverter_enable") == False


@pytest.mark.parametrize(
    "voltages", np.reshape(np.tile(np.linspace(0, 5, 5), reps=2), [2, 5]).T
)
def test_brake_pressed(
    voltages: Tuple[float, float],
    can_controller: CANController,
    set_throttle_voltages: Callable[[float, float], None],
):
    can_controller.set_state("brake_gate", True)
    set_throttle_voltages(voltages[0], voltages[1])
    time.sleep(1)
    assert can_controller.get_state("thorttle_state") == "THROTTLE_BRAKE_PRESSED"


def test_full_state_machine(
    set_throttle_voltages: Callable[[float, float], None],
    check_can_torque_request: Callable[[int], None],
    can_controller: CANController,
    set_rtd_signal: Callable[[bool], None],
):
    check_can_torque_request(0)
    assert can_controller.get_state("inverter_enable") == False

    set_throttle_voltages(2.5, 2.5)
    time.sleep(1)
    check_can_torque_request(0)

    set_rtd_signal(True)
    time.sleep(1)
    assert can_controller.get_state("inverter_enable") == True
    assert can_controller.get_state("throttle_state") == "THROTTLE_RUN"
    # TODO: Check torque request

    can_controller.set_state("brake_gate", True)
    time.sleep(1)
    assert can_controller.get_state("throttle_state") == "THROTTLE_BRAKE_PRESSED"
    can_controller.set_state("brake_gate", False)

    set_throttle_voltages(0.0, 2.5)
    time.sleep(1)
    assert can_controller.get_state("throttle_1_out_of_range")
    assert can_controller.get_state("throttle_state") == "THROTTLE_1_OUT_OF_RANGE"
    check_can_torque_request(0)

    set_throttle_voltages(2.5, 2.5)
    time.sleep(1)
    assert can_controller.get_state("throttle_state") == "THROTTLE_RUN"
    # TODO: Check torque request

    set_throttle_voltages(1.0, 3.0)
    time.sleep(1)
    assert (
        can_controller.get_state("throttle_state") == "THROTTLE_POSITION_IMPLAUSIBILITY"
    )
    check_can_torque_request(0)

    set_throttle_voltages(1.0, 5.0)
    assert can_controller.get_state("throttle_2_out_of_range")
    assert can_controller.get_state("throttle_state") == "THROTTLE_2_OUT_OF_RANGE"
    check_can_torque_request(0)

    set_throttle_voltages(2.5, 2.5)
    can_controller.set_state("brake_gate", True)
    assert can_controller.get_state("throttle_state") == "THROTTLE_BRAKE_PRESSED"
    check_can_torque_request(0)

    can_controller.set_state("brake_gate", False)
    assert can_controller.get_state("throttle_state") == "THROTTLE_RUN"
    # TODO: Check torque request
