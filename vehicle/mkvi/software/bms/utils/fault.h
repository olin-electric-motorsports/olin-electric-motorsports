#pragma once
#include "vehicle/mkvi/software/bms/can_api.h"

// Full list of faults available in bms.yml

void set_fault(enum bms_fault_e the_fault);
