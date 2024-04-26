#include "libs/adc/api.h"
#include "tasks.h"
#include "vehicle/mkvi/software/bms/bms_config.h"
#include <stdint.h>

void current_task(int16_t* current) {
    *current = adc_read(CURRENT_SENSE_VOUT);
}
