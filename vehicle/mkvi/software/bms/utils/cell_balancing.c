#include "cell_balancing.h"
#include "vehicle/common/ltc6811/ltc681x.h"
#include "vehicle/mkvi/software/bms/bms_config.h"
#include "vehicle/mkvi/software/bms/can_api.h"
#include "vehicle/mkvi/software/bms/utils/fault.h"

#define ADBMS_CMD_LEN (6)

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

    // For each segment, check internal die temp
    for (uint8_t ic = 0; ic < NUM_ICS; ic++) {
        // reg = 1, read back status group A
        LTC681x_rdstat_reg(1, NUM_ICS, raw_data);

        // Index for the raw data array
        uint8_t raw_idx = ic * NUM_RX_BYT;

        bms_debug.internal_die_temp
            = raw_data[raw_idx + 2] + (raw_data[raw_idx + 3] << 8);

        can_send_bms_debug();

        if (bms_debug.internal_die_temp > DIE_OVERTEMPERATURE_THRESHOLD) {
            set_fault(BMS_FAULT_DIE_OVERTEMPERATURE);
        }
    }

    // Mute cell balancing by default
    disable_cell_balancing();

    // Set discharge timer duration to zero to disable watchdog and set
    // discharge cells in cfg register A
    uint8_t wrcfga_cmd[2] = { 0x00, 0x01 };
    uint8_t wrcfga_data[ADBMS_CMD_LEN * NUM_ICS];

    for (uint8_t ic = 0; ic < NUM_ICS; ic++) {
        wrcfga_data[ic * ADBMS_CMD_LEN + 0]
            = 0xFC; // GPIO pull-downs off, REFON 0, DTEN x, ADC 0
        wrcfga_data[ic * ADBMS_CMD_LEN + 1] = 0x0; // VUV 0x000
        wrcfga_data[ic * ADBMS_CMD_LEN + 2] = 0x0; // VOV, VUV 0x000
        wrcfga_data[ic * ADBMS_CMD_LEN + 3] = 0x0; // VOV 0x000
        wrcfga_data[ic * ADBMS_CMD_LEN + 4] = 0xFF; // Discharge cells 1-8
        wrcfga_data[ic * ADBMS_CMD_LEN + 5]
            = 0xF; // Discharge timer off, discharge cells 9-12
    }

    wakeup_sleep(NUM_ICS);

    write_68(NUM_ICS, wrcfga_cmd, wrcfga_data);

    // Set remaining discharge cells in cfg register B
    uint8_t wrcfgb_cmd[2] = { 0x0, 0x24 };
    uint8_t wrcfgb_data[ADBMS_CMD_LEN * NUM_ICS];

    for (uint8_t ic = 0; ic < NUM_ICS; ic++) {
        wrcfga_data[ic * ADBMS_CMD_LEN + 0]
            = 0xFF; // Discharge cells 13-16, GPIO pull-downs off
        wrcfga_data[ic * ADBMS_CMD_LEN + 1]
            = 0x81; // Mute x, FDRF off, defualt PS, DTMEN off, GPIO
                    // 9 pull-down off, discharge cell 17 but not 18
        wrcfga_data[ic * ADBMS_CMD_LEN + 2] = 0x0; // Reserved bits
        wrcfga_data[ic * ADBMS_CMD_LEN + 3] = 0x0; // Reserved bits
        wrcfga_data[ic * ADBMS_CMD_LEN + 4] = 0x0; // Reserved bits
        wrcfga_data[ic * ADBMS_CMD_LEN + 5] = 0x0; // Reserved bits
    }

    wakeup_sleep(NUM_ICS);

    write_68(NUM_ICS, wrcfgb_cmd, wrcfgb_data);
};

void enable_cell_balancing(void) {
    uint8_t unmute_data[NUM_ICS] = { 0, 0, 0, 0, 0, 0 }; // Hacky, please fix
    wakeup_sleep(NUM_ICS);
    uint8_t unmute_cmd[2] = { 0x0, 0x29 };
    write_68(NUM_ICS, unmute_cmd, unmute_data);
};

void disable_cell_balancing(void) {
    uint8_t mute_data[NUM_ICS] = { 1, 1, 1, 1, 1, 1 }; // Hacky, please fix
    wakeup_sleep(NUM_ICS);
    uint8_t mute_cmd[2] = { 0x0, 0x28 };
    write_68(NUM_ICS, mute_cmd, mute_data);
};
