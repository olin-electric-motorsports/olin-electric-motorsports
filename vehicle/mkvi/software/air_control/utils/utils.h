#include "vehicle/mkvi/software/air_control/can_api.h"
#include <stdint.h>

#define MOTOR_CONTROLLER false
#define CHARGER true

/*
 * Polls for CAN message from the motor controller.
 *
 * Returns:
 *   - 0: No error, value is in *voltage
 *   - 1: CAN error, go into fault
 *   - 2: CAN timeout, go into fault
 */
int get_tractive_voltage(int16_t* voltage, bool sys,
                         uint32_t timeout);

/*
 * Polls for CAN message from the BMS
 *
 * Returns:
 *   - 0: No error, value is in *voltage
 *   - 1: Fatal error, go into fault
 */
int get_bms_voltage(int16_t* voltage);
