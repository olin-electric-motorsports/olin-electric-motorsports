#pragma once

#include <stdint.h>
#include "vehicle/mkv/software/bms/ltc6811/ltc6811.h"
#include "vehicle/mkv/software/bms/bsp/mux.h"
#include "vehicle/mkv/software/bms/bsp/can.h"

#define OVERVOLTAGE  (1)
#define UNDERVOLTAGE (2)

#define OVERTEMPERATURE  (1)
#define UNDERTEMPERATURE (2)

/*
 * Read all cell voltages
 */
int read_voltages(uint8_t num_ics, cell_asic ics[]);

/*
 * Checks for undertemperature or overtemperature conditions
 *
 * Returns
 *   0: OK
 *   1: Overvoltage
 *   2: Undervoltage
 */
int check_voltages(cell_asic ICS[]);

/*
 * Read all temperatures
 */
int read_temperatures(cell_asic ICS[]);

/*
 * Checks for undervoltage or overvoltage conditions
 *
 * Returns
 *   0: OK
 *   1: Overtemperature
 *   2: Undertemperature
 */
int check_temperatures(cell_asic ICS[]);
