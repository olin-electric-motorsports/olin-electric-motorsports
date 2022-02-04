import pytest
import time


def test_throttle(harness):
    harness.io.set_state("THROTTLE_POT_1", 2.5)
    harness.io.set_state("THROTTLE_POT_2", 2.5)
    harness.can.set_state("fault_state", 9)
    assert harness.can.get_state("fault_state") == 9
