#include "libs/adc/api.h"
#include "tasks.h"
#include "vehicle/mkvi/software/bms/bms_config.h"
#include <stdint.h>

// // Defines maximum current range (-125 to 125A)
// #define MAX_CURRENT_RANGE (250)
#define MAX_ADC_COUNT 1024

void current_task(int16_t* current, uint16_t* vref, uint16_t* vout) {
    *vref = adc_read(MAX_ADC_COUNT / 2); // vref isn't connected to micro?
    *vout = adc_read(CURRENT_SENSE_VOUT);

    *current = (*vout - *vref);
}
