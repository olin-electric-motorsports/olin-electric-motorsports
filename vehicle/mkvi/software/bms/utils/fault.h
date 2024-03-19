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

enum csc_mia {
    CSC_0_MIA,
    CSC_1_MIA,
    CSC_2_MIA,
    CSC_3_MIA,
    CSC_4_MIA,
    CSC_5_MIA,
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
 *
 * @return An int representing if there are faults present. 0 for no faults, 1
 * for at least one fault present.
 */
int check_fault_state(void);

/**
 * Set the status of a CSC as MIA.
 */
void set_csc_mia(enum csc_mia the_csc);

/**
 * Clear the status of a CSC as MIA.
 */
void clear_csc_mia(enum csc_mia the_csc);

/**
 * Check if any CSCs are MIA.
 *
 * @return An int representing if there are any CSCs MIA. 0 for no CSCs MIA, 1
 * for at least one CSC MIA.
 */
int check_csc_state(void);
