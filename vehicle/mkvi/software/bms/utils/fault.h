#pragma once
#include "vehicle/mkvi/software/bms/can_api.h"

/**
 * The list of possible BMS faults.
 *
 * Used for bitwise operations on the unit16_t bms_fault variable defined in
 * bms.yml.
 *
 * BMS_FAULT_UNDERVOLTAGE: Cell undervoltage fault, set when any cell voltage
 *   is below the UNDERVOLTAGE_THRESHOLD, as defined in bms_config.h.
 *
 * BMS_FAULT_OVERVOLTAGE: Cell overvoltage fault, set when any cell voltage
 *   is above the OVERVOLTAGE_THRESHOLD, as defined in bms_config.h.
 *
 * BMS_FAULT_UNDERTEMPERATURE: Cell undertemperature fault, set when any cell
 *   temperature is below the UNDERTEMPERATURE_THRESHOLD, as defined in
 *   bms_config.h.
 *
 * BMS_FAULT_OVERTEMPERATURE: Cell overtemperature fault, set when any cell
 *   temperature is above the OVERTEMPERATURE_THRESHOLD, as defined in
 *   bms_config.h.
 *
 * BMS_FAULT_DIAGNOSTICS_FAIL: Currently unused.
 *
 * BMS_FAULT_OPEN_WIRE: Currently unused.
 *
 * BMS_FAULT_OVERCURRENT: Currently unused.
 *
 * BMS_FAULT_PEC: Fault set if the number of PEC errors is above
 *   MAX_PEC_ERROR_COUNT, as defined in bms_config.h
 *
 * BMS_FAULT_CHARGER_FAULT: Currently unused.
 *
 * BMS_FAULT_STATE_MACHINE: Currently unused.
 *
 * BMS_FAULT_CSC_MIA: Fault set if any CSC is MIA. Only the number of CSCs as
 *   defined in bms_config.h are checked.
 *   NOTE: MIA refers to receiving all 1s from the CSC,
 *   This either means that there is a communication error
 *   (ex: CSC is not powered) or a register on the CSC was
 *   initialized to all 1s and the appropriate command was
 *   not given to update the value (ex: the cell voltage readings
 *   are initialized to all 1s until an ADC conversion is
 *   requested)
 *
 * BMS_FAULT_DA_MIA: Currently unused.
 */
enum bms_fault {
    BMS_FAULT_UNDERVOLTAGE, // UV
    BMS_FAULT_OVERVOLTAGE, // OV
    BMS_FAULT_UNDERTEMPERATURE, // UT
    BMS_FAULT_OVERTEMPERATURE, // OT
    BMS_FAULT_DIAGNOSTICS_FAIL, // DF
    BMS_FAULT_OPEN_WIRE, // OW
    BMS_FAULT_OVERCURRENT, // OC
    BMS_FAULT_PEC, // PEC
    BMS_FAULT_CHARGER_FAULT, // CF
    BMS_FAULT_STATE_MACHINE, // SM
    BMS_FAULT_CSC_MIA, // CSC
    BMS_FAULT_DA_MIA, // DA
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

void clear_all_faults(void);

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
