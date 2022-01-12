#include "bsp.h"
#include "vehicle/mkv/software/bms/ltc6811/ltc6811.h"

int read_voltages(cell_asic ICS[]) {
    int rc = 0;

    wakeup_sleep(NUM_ICS);

    // Start cell voltage ADC conversions PLUS Sum of Cells Conversion
    LTC6811_adcvsc(MD_7KHZ_3KHZ, DCP_ENABLED);

    (void)LTC6811_pollAdc();

    wakeup_idle(TOTAL_IC);
    rc = LTC6811_rdcv(TOTAL_IC, ICS);

    return rc;
}

int check_voltages(cell_asic ICS[]) {
    int rc;
}

int read_temperatures(cell_asic ICS[]) {
    int rc = 0;
}

uint16_t get_pack_voltage(uint8_t num_ics, cell_asic ics[]) {
    uint16_t accumulator = 0;
    for (uint8_t ic = 0; ic < num_ics; ic++) {
        accumulator += ics[ic].stat.stat_codes[0];
    }
    return (accumulator * 0.0001 * 20)
}

uint16_t get_pack_temperature(uint8_t num_ics, cell_asic ics[]) {
    uint16_t temperature;

    return temperature * 100 / 1000000;
}
