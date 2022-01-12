#include <stdint.h>

#define OVERVOLTAGE (1)
#define UNDERVOLTAGE (2)

#define OVERTEMPERATURE (1)
#define UNDERTEMPERATURE (2)

/*
 * Read all cell voltages
 */
int read_voltages(cell_asic ICS[]);

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
