
#pragma once

#include <stdint.h>

/*
 * Task to read the voltages from the battery pack
 *
 * This function will start the ADC conversion, wait until it completes, and
 * then read the voltages of all the cells.
 *
 * @param pack_voltage Pointer to a 16-bit number where the pack voltage will
 * be stored
 *
 * @param ov Overvoltage flagset. Each bit represents whether or not a cell is
 * over the upper-voltage threshold (3.9V)
 *
 * @param uv Undervoltage flagset. Each bit represents whether or not a cell is
 * under the low-voltage threshold (3.0V)
 *
 * @return
 *   Number of PEC errors that occurred when communicating with the ADBMS1818
 *   0 if no errors
 */
int voltage_task(uint16_t* pack_voltage, uint32_t* ov, uint32_t* uv);

/*
 * Task to read the temperature from the battery pack
 *
 * This function handles communication with multiplexers, ADC reading, and
 * temperature accumulating
 *
 * @param ot Overtemperature flagset. Each bit represents whether or not a cell
 * is over the upper-temperature threshold
 *
 * @param ut Undertemperature flagset. Each bit represents whether or not a cell
 * is under the low-temperature threshold
 *
 * @param min_temp Pointer to a 16-bit number where the minimum temperature will
 * be stored
 *
 * @param max_temp Pointer to a 16-bit number where the maximum temperature will
 * be stored
 *
 * @return
 *  Number of PEC errors that occurred when communicating with the ADBMS1818
 *  0 if no errors
 */
int temperature_task(uint32_t* ot, uint32_t* ut, int16_t* min_temp,
                     int16_t* max_temp);

void current_task(int16_t* current, uint16_t* vref, uint16_t* vout);

int openwire_task(void);
