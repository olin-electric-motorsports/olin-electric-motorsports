/*
 * Charging CAN support
 */
#include "libs/can/api.h"

/*
 * Set max voltage for charging (in CAN message)
 *
 * @param max_voltage_V: Max voltage in volts
 */
void charging_set_max_voltage(uint16_t max_voltage_V);

/*
 * Set the max current for charging (in CAN message)
 *
 * @param max_current_A: Max current in amps.
 */
void charging_set_max_current(uint16_t max_current_A);

/*
 * Set the enable bit for the charger
 */
void charging_set_enable(bool enable);

/*
 * Send CAN message for charger command
 */
void charging_send_command(void);

/*
 * Receives charger feedback message
 *
 * @returns
 *   0: Received successfully
 *  -1: Not received
 *   1: Error
 */
int charging_recv_feedback(void);

uint16_t charger_get_voltage(void);

uint16_t charger_get_current(void);

uint16_t charger_get_status_flags(void);
