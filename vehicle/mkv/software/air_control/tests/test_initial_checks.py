def assert_fault(the_fault):
    assert(air_control_critical.fault_state == the_fault)

def test_bms_can_timeout():
    # stop BMS_CORE message
    air_control.run()
    assert_fault(FAULT_CAN_BMS_TIMEOUT)
    # air_control.halt() # This should be done in a fixture

def test_bms_voltage_low():
    # periodic BMS_CORE messages
    # set BMS_CORE CAN message to be too low
    air_control.run()
    assert_fault(FAULT_BMS_VOLTAGE)

def test_motor_controller_timeout():
    # turn off motor controller CAN message
    assert_fault(FAULT_CAN_MC_TIMEOUT)

def test_motor_controller_voltage_high():
    # set motor controller voltage message too high
    assert_fault(FAULT_MOTOR_CONTROLLER_VOLTAGE)

def test_air_p_weld():
    # set air_p_weld_detect HIGH
    assert_fault(FAULT_AIR_P_WELD)

def test_air_n_weld():
    # set air_n_weld_detect HIGH
    assert_fault(FAULT_AIR_N_WELD)

def test_shutdown_circuit_closed():
    # set all SS pins
    assert_fault(FAULT_SHUTDOWN_IMPLAUSIBILITY)

def test_imd_implausibility():
    # aset IMD_SENSE pin high
    assert_fault(FAULT_IMD_STATUS)

def test_initial_checks_success():
    # set CAN messages correctly, set correct configuration
    assert(state == IDLE)
