import pytest


def close_tsms(hitl):
    hitl.shdn_tsms.set(1)


def close_air_p(hitl):
    hitl.air_p_weld_detect.set(1)


def test_rtd(hitl):
    close_tsms(hitl)
    close_air_p(hitl)

# These should go elsewhere (board-specific tests)
# def test_estop_driver(hitl):
#     hitl.shdn_estop_driver.set(0)
#     assert(hitl.can.get_state("ss_estop") == "OPEN")
#
#     # Cleanup
#     hitl.shdn_estop_driver.set(1)
#     assert(hitl.can.get_state("ss_estop") == "CLOSED")
#
# def test_bots(hitl):
#     hitl.shdn_bots.set(0)
#     assert(hitl.can.get_state("ss_bots") == "OPEN")
#
#     # Cleanup
#     hitl.shdn_bots.set(1)
#     assert(hitl.can.get_state("ss_bots") == "CLOSED")
