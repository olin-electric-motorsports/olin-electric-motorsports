#include "libs/adc/api.h"
#include "tasks.h"
#include "vehicle/mkvi/software/bms/bms_config.h"
#include <stdint.h>

void current_task(int16_t* current) {
    float tempCurrent = 0;
    for(uint8_t averageNum = 0; averageNum < 100; averageNum++) {
        tempCurrent += (float)adc_read(CURRENT_SENSE_VOUT);
    }
    //Average
    tempCurrent /= 100;

    //Remove offset (2.5V from sensor)
    tempCurrent -= 568;

    //Convert to current (20mV/A, ADC is 10 bit and runs @ 5V)
    tempCurrent = tempCurrent * 5 / 1024 / 0.02;

    //Return in cA (centiAmps)
    *current = (uint16_t)(tempCurrent * 100);
}
