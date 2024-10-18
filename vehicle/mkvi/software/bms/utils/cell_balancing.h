#pragma once

/**
 * Write necessary register configurations for cell balancing based on the cell
 * balancing config in bms_config.h. Leaves cell balancing disabled. Should be
 * run on hardware init.
 */
void cell_balancing_init(void);

/**
 * Enable cell balancing via S pin unmuting.
 */
void enable_cell_balancing(void);

/**
 * Disable cell balancing via S pin muting.
 */
void disable_cell_balancing(void);
