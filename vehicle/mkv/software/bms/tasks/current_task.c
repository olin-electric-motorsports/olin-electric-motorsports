#include <stdint.h>
#include "libs/adc/api.h"
#include "vehicle/mkv/software/bms/bms_config.h"

// Defines maximum current range (-125 to 125A)
#define MAX_CURRENT_RANGE (250)

void current_task(int16_t* current) {
    uint16_t vref = adc_read(CURRENT_SENSE_VREF);
    uint16_t vout = adc_read(CURRENT_SENSE_VOUT);

    *current = (vout - vref) / MAX_CURRENT_RANGE;
}
