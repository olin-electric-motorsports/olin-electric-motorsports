#include <stdint.h>

/*
 * Polls for CAN message from the motor controller.
 *
 * Returns:
 *   - 0: No error, value is in *voltage
 *   - 1: CAN error, go into fault
 *   - 2: CAN timeout, go into fault
 */
int get_motor_controller_voltage(int16_t *voltage);

/*
 * Polls for CAN message from the BMS
 *
 * Returns:
 *   - 0: No error, value is in *voltage
 *   - 1: Fatal error, go into fault
 */
int get_bms_voltage(int16_t *voltage);
