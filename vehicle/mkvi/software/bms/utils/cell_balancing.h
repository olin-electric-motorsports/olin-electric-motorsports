#pragma once

#include <stdint.h>

#include "vehicle/mkvi/software/bms/bms_config.h"

// ADBMS1818 junction max for lowest spec is 85C
// Pg. 69: ITMP × 100μV/7.6mV/°C − 276°C
// @60C, ITMP = 25536
#define CELL_TJ_ITMP_MAX (25536)
// #define CELL_TJ_ITMP_MAX (24000)
#define BALANCED_MARGIN (100) // 0.1V

/**
 * Check the internal die temps of all ICs.
 *
 * @returns True if temperatures are under CELL_TJ_ITMP_MAX, False if above
 */
bool check_ic_temps(void);

/**
 * Write necessary register configurations for cell balancing based on the cell
 * balancing config in bms_config.h. Leaves cell balancing disabled. Should be
 * run on hardware init. TODO: Update docstring
 */
void cell_balancing_task(uint32_t (*cells_to_balance)[NUM_ICS]);

/**
 * Enable cell balancing via S pin unmuting.
 */
void enable_cell_balancing(void);

/**
 * Disable cell balancing via S pin muting.
 */
void disable_cell_balancing(void);
