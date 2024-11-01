#include <stdbool.h>

#include "cell_balancing.h"
#include "projects/can_print/can_print.h"
#include "vehicle/common/ltc6811/ltc681x.h"
#include "vehicle/mkvi/software/bms/bms_config.h"
#include "vehicle/mkvi/software/bms/can_api.h"
#include "vehicle/mkvi/software/bms/utils/fault.h"

// ADBMS1818 junction max for lowest spec is 85C
// Pg. 69: ITMP × 100μV/7.6mV/°C − 276°C
// @60C, ITMP = 25536
#define CELL_TJ_ITMP_MAX (25536)

bool check_ic_temps(void) {
    // Check internal die temperatures
    wakeup_sleep(NUM_ICS);

    // Start and wait for ADC conversion for internal temp
    LTC681x_adstat(MD_7KHZ_3KHZ, STAT_CH_ITEMP);
    LTC681x_pollAdc();
    wakeup_sleep(NUM_ICS);

    // Buffers for reading data
    uint8_t raw_data[NUM_RX_BYT * NUM_ICS] = { 0 };

    // Max temperature
    uint16_t max_ic_temp = 0;
    uint16_t ic_temp = 0;

    // reg = 1, read back status group A
    LTC681x_rdstat_reg(1, NUM_ICS, raw_data);
    for (uint8_t ic = 0; ic < NUM_ICS; ic++) {
        // Index for the raw data array
        uint8_t raw_idx = ic * NUM_RX_BYT;
        ic_temp = raw_data[raw_idx + 2] + (raw_data[raw_idx + 3] << 8);
        // can_print("IC temp", ic_temp);
        max_ic_temp = (ic_temp > max_ic_temp ? ic_temp : max_ic_temp);
    }
    // can_print("Max IC", max_ic_temp);
    // can_print("Max IC", (max_ic_temp < CELL_TJ_ITMP_MAX));
    if (max_ic_temp < CELL_TJ_ITMP_MAX) {
        return true;
    }
    return false;
}

void cell_balancing_init(void) {
    ;
};

void enable_cell_balancing(void) {
    ;
};

void disable_cell_balancing(void) {
    ;
};
