#include "bsp.h"
#include "vehicle/mkv/software/bms/ltc6811/ltc6811.h"

#define NUM_CELLS (12) // TODO, this should come from elsewhere

/*
 * TODO
 */

int read_voltages(uint8_t num_ics, cell_asic ics[]) {
    int rc = 0;

    wakeup_sleep(num_ics);

    // Start cell voltage ADC conversions PLUS Sum of Cells Conversion
    LTC6811_adcvsc(MD_7KHZ_3KHZ, DCP_ENABLED);

    (void)LTC6811_pollAdc();

    wakeup_idle(num_ics);

    for (uint8_t i = 0; i < NUM_CELLS; i++) {
        rc = LTC6811_rdcv(i, num_ics, ics);
    }

    return rc;
}

int check_voltages(cell_asic ICS[]) {
    // int rc;
    return 0;
}

int read_temperatures(cell_asic ICS[]) {
    // int rc = 0;
    return 0;
}

uint16_t get_pack_voltage(uint8_t num_ics, cell_asic ics[]) {
    uint16_t accumulator = 0;
    for (uint8_t ic = 0; ic < num_ics; ic++) {
        accumulator += ics[ic].stat.stat_codes[0];
    }
    return (accumulator * 0.0001 * 20);
}

uint16_t get_pack_temperature(uint8_t num_ics, cell_asic ics[]) {
    uint16_t temperature = 0;

    return temperature * 100 / 1000000;
}
