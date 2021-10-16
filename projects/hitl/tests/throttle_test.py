import pytest

def test_throttle(harness):
   harness.io.set_state("THROTTLE_POT_1", 2.5)
   harness.io.set_state("THROTTLE_POT_2", 2.5)

   time.sleep(1)  # We do this to give the hardware time to react

   torque = harness.throttle.get_state("mcTorqueRequest")
   assert 100 < torque < 150
