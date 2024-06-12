#pragma once

/**
 * Write necessary register configurations for cell balancing. Config is
 * hard-coded to save on space. Leaves cell balancing disabled. Should be run on
 * hardware init.
 */
void cell_balancing_task(void);

/**
 * Enable cell balancing via S pin unmuting.
 */
void enable_cell_balancing(void);

/**
 * Disable cell balancing via S pin muting.
 */
void disable_cell_balancing(void);