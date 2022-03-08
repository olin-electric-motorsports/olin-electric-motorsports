#pragma once

enum FaultCode {
    BMS_FAULT_NONE = 0x00,
    BMS_FAULT_UNDERVOLTAGE, // Maybe this fault can be clear-able
    BMS_FAULT_OVERVOLTAGE,
    BMS_FAULT_UNDERTEMPERATURE,
    BMS_FAULT_OVERTEMPERATURE,
    BMS_FAULT_DIAGNOSTICS_FAIL,
    BMS_FAULT_OPEN_WIRE,
    BMS_FAULT_OVERCURRENT,
};

void set_fault(enum FaultCode the_fault);
