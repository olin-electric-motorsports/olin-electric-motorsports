#include "cell_balancing.h"
#include "vehicle/common/ltc6811/ltc681x.h"
#include "vehicle/mkvi/software/bms/bms_config.h"
#include "vehicle/mkvi/software/bms/can_api.h"
#include "vehicle/mkvi/software/bms/utils/fault.h"

void cell_balancing_init(void) {
    // Check internal die temperature
    wakeup_sleep(NUM_ICS);

    // Start and wait for ADC conversion for internal temp
    LTC681x_adstat(MD_7KHZ_3KHZ, STAT_CH_ITEMP);
    LTC681x_pollAdc();
    wakeup_sleep(NUM_ICS);

    // Buffers for reading data
    uint8_t raw_data[NUM_RX_BYT * NUM_ICS] = { 0 };
    // uint16_t die_temperatures[NUM_ICS] = { 0 };

    for (uint8_t ic = 0; ic < NUM_ICS; ic++) {
        // reg = 1, read back status group A
        LTC681x_rdstat_reg(1, NUM_ICS, raw_data);

        // Index for the raw data array
        uint8_t raw_idx = ic * NUM_RX_BYT;

        bms_debug.internal_die_temp
            = raw_data[raw_idx + 2] + (raw_data[raw_idx + 3] << 8);

        can_send_bms_debug();
    }
};

void enable_cell_balancing(void) {
    ;
};

void disable_cell_balancing(void) {
    ;
};
