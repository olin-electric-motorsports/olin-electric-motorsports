#include "can_api.h"
#include "shutdown.h"

/* BOARD-SPECIFIC CAN FUNCTIONALITY.
 * THE FOLLOWING CODE IS AUTOMATICALLY GENERATED BASED ON THE MINI-YAML:
 * shutdown.yaml. Do not directly edit this file! */

// shutdown CAN init function declaration
void shutdown_CAN_init();

// shutdown CAN setter functions
// Update sig: error_code of msg: brakelight_bspd_shutdown
int set_brakelight_bspd_shutdown_error_code(uint8_t value);
// Update sig: brake_analog_voltage_msb of msg: brakelight_bspd_shutdown
int set_brakelight_bspd_shutdown_brake_analog_voltage_msb(uint8_t value);
// Update sig: brake_analog_voltage_lsb of msg: brakelight_bspd_shutdown
int set_brakelight_bspd_shutdown_brake_analog_voltage_lsb(uint8_t value);
// Update sig: brake_gate of msg: brakelight_bspd_shutdown
int set_brakelight_bspd_shutdown_brake_gate(uint8_t value);
// Update sig: bspdsense of msg: brakelight_bspd_shutdown
int set_brakelight_bspd_shutdown_bspdsense(uint8_t value);
