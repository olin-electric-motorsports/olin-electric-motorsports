#pragma once
#include "vehicle/mkvi/software/bms/can_api.h"

/**
 * The list of possible BMS faults.
 *
 * Used for bitwise operations on the unit16_t bms_fault variable defined in
 * bms.yml.
 */
enum bms_fault {
    BMS_FAULT_UNDERVOLTAGE,
    BMS_FAULT_OVERVOLTAGE,
    BMS_FAULT_UNDERTEMPERATURE,
    BMS_FAULT_OVERTEMPERATURE,
    BMS_FAULT_DIAGNOSTICS_FAIL,
    BMS_FAULT_OPEN_WIRE,
    BMS_FAULT_OVERCURRENT,
    BMS_FAULT_PEC,
    BMS_FAULT_CHARGER_FAULT,
    BMS_FAULT_STATE_MACHINE,
    BMS_FAULT_CSC_MIA,
    BMS_FAULT_DA_MIA,
};

/**
 * Set a BMS fault from the enum bms_fault.
 */
void set_fault(enum bms_fault the_fault);

/**
 * Clear a BMS fault from the enum bms_fault.
 */
void clear_fault(enum bms_fault the_fault);

/**
 * Based on bms_core.bms_fault_code, determine if the BMS is in a fault
 * state.
 */
int check_fault_state(void);

/**
 * Clear all BMS faults.
 *
 * Use with caution. However, any faults caused non-transient effects should
 * trigger faults again.
 */
void clear_all_faults(void);
