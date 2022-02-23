#pragma once

#include "vehicle/mkv/software/bms/ltc6811/ltc6811.h"
#include <stdint.h>

/*
 * Sends all BMS cell voltage CAN data
 */
void can_send_bms_voltages(uint8_t num_ics, cell_asic ics[]);

/*
 * Sends all BMS cell temperature CAN data
 */
void can_send_bms_temperatures(uint8_t num_ics, uint16_t** temperatures);
