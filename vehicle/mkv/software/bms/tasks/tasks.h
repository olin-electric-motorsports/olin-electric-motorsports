#pragma once

#include <stdint.h>

/*
 * Task to read the voltages from the battery pack
 *
 * This function will start the ADC conversion, wait until it completes, and
 * then read the voltages of all the cells. Cell data will be stored in the ICS
 * array.
 *
 * @param pack_voltage Pointer to a 16-bit number where the pack voltage will
 * be stored
 *
 * @param ov Overvoltage flagset. Each bit represents whether or not a cell is
 * over the upper-voltage threshold (4.2V)
 *
 * @param uv Undervoltage flagset. Each bit represents whether or not a cell is
 * under the low-voltage threshold (3.0V)
 *
 * @return
 *   0 if no error
 *   1 if PEC occurred when communicating with LTC6811 chips
 */
int voltage_task(uint16_t* pack_voltage, uint32_t* ov, uint32_t* uv);

/*
 * Task to read the temperature from the battery pack
 *
 * This function handles communication with multiplexers, ADC reading, and
 * temperature accumulating
 */
int temperature_task(uint32_t* ot, uint32_t* ut, int16_t* min_temp, int16_t* max_temp);

/*
 * Task to check for open-wires between the BMS peipherals and the cells
 *
 * Returns 1 if there was an open wire, and 0 if not
 */
int openwire_task(void);

/*
 * Task to read current from current sensor
 */
void current_task(int16_t* current);
