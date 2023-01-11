#pragma once
#include "vehicle/mkv/software/bms/can_api.h"

// enum FaultCode {
//     /*
//      * Normal operation
//      */
//     BMS_FAULT_NONE = 0x00,
//
//     /*
//      * Battery needs to be charged. Can be cleared by connecting the charger.
//      */
//     BMS_FAULT_UNDERVOLTAGE,
//
//     /*
//      * Over-voltage, occurs when batteries are charged above 4.2 volts. This
//      * shouldn't happen, but exists and can occur.
//      */
//     BMS_FAULT_OVERVOLTAGE,
//
//     /*
//      * Cell temperatures are too low
//      */
//     BMS_FAULT_UNDERTEMPERATURE,
//
//     /*
//      * Cell temperatures are too high
//      */
//     BMS_FAULT_OVERTEMPERATURE,
//
//     /*
//      * LTC6811 self-test fails
//      */
//     BMS_FAULT_DIAGNOSTICS_FAIL,
//
//     /*
//      * Open-wire exists between LTC6811 and cells
//      */
//     BMS_FAULT_OPEN_WIRE,
//
//     /*
//      * Too much current into/out of cells
//      */
//     BMS_FAULT_OVERCURRENT,
//
//     /*
//      * Received too many packet encoding errors from LTC6811s
//      */
//     BMS_FAULT_PEC,
// };

void set_fault(enum bms_fault_e the_fault);
