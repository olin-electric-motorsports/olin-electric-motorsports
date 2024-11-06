#include <stdbool.h>

#include "cell_balancing.h"
#include "projects/can_print/can_print.h"
#include "vehicle/common/ltc6811/ltc681x.h"
#include "vehicle/mkvi/software/bms/bms_config.h"
#include "vehicle/mkvi/software/bms/can_api.h"
#include "vehicle/mkvi/software/bms/utils/fault.h"

#define ADBMS_CMD_LEN (6)

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
    can_print("Max IC", max_ic_temp);
    // can_print("Max IC", (max_ic_temp < CELL_TJ_ITMP_MAX));
    if (max_ic_temp < CELL_TJ_ITMP_MAX) {
        return true;
    }
    return false;
}

void cell_balancing_task(uint32_t (*cells_to_balance)[NUM_ICS]) {
    can_print("cell_bh", (*cells_to_balance)[0] >> 16);
    can_print("cell_bl", (*cells_to_balance)[0] && 0xFF);
    // for (uint8_t segment = 0; segment < NUM_ICS; segment++) {
    //     can_print("seg_b", segment);
    //     can_print("cell_b", *cells_to_balance[segment]);
    // }

    // Manual cell balancing
    // To use: little endian, so 0x1 would discharge only cell 1. Find the
    // lowest cell and discharge all but the lowest cell. Ex: 0x1FFBF to
    // discharge all but cell seven.
    // cells_to_balance[0] = 0x1FFFF;
    // cells_to_balance[1] = 0x1FFFF;
    // cells_to_balance[2] = 0x1FFFF;
    // cells_to_balance[3] = 0x1FFFF;
    // cells_to_balance[4] = 0x1FFFF;
    // cells_to_balance[5] = 0x1FFFF;

    // // Automatic cell balancing
    // for (uint8_t segment = 0; segment < NUM_ICS; segment++) {
    //     // can_print("segment", segment);
    //     if (lv_seg_index == segment) {
    //         cells_to_balance[segment] = 0x1FFFF & ~(1 << lv_cell_index);
    //     } else {
    //         cells_to_balance[segment] = 0x1FFFF;
    //     }
    //     can_print("s_pins", cells_to_balance[segment]);
    // }

    // Set discharge timer duration to zero to disable watchdog and set
    // discharge cells in cfg register A
    uint8_t wrcfga_cmd[2] = { 0x00, 0x01 };
    uint8_t wrcfga_data[ADBMS_CMD_LEN * NUM_ICS];

    for (uint8_t ic = 0; ic < NUM_ICS; ic++) {
        wrcfga_data[ic * ADBMS_CMD_LEN + 0]
            = 0xFC; // GPIO pull-downs off, REFON 0, DTEN x, ADC 0
        wrcfga_data[ic * ADBMS_CMD_LEN + 1] = 0x0; // VUV 0x000
        wrcfga_data[ic * ADBMS_CMD_LEN + 2] = 0x0; // VOV, VUV 0x000default
        wrcfga_data[ic * ADBMS_CMD_LEN + 3] = 0x0; // VOV 0x000default
        wrcfga_data[ic * ADBMS_CMD_LEN + 4]
            = (*cells_to_balance)[ic] & 0xFF; // Discharge cells 1-8
        wrcfga_data[ic * ADBMS_CMD_LEN + 5]
            = ((*cells_to_balance)[ic] >> 8)
              & 0xF; // Discharge timer off, discharge cells 9-12
    }

    wakeup_sleep(NUM_ICS);

    write_68(NUM_ICS, wrcfga_cmd, wrcfga_data);

    // Set remaining discharge cells in cfg register B
    uint8_t wrcfgb_cmd[2] = { 0x0, 0x24 };
    uint8_t wrcfgb_data[ADBMS_CMD_LEN * NUM_ICS];

    for (uint8_t ic = 0; ic < NUM_ICS; ic++) {
        wrcfgb_data[ic * ADBMS_CMD_LEN + 0]
            = ((*cells_to_balance)[ic] >> 8)
              | 0xF; // Discharge cells 13-16, GPIO pull-downs off
        wrcfgb_data[ic * ADBMS_CMD_LEN + 1]
            = (((*cells_to_balance)[ic] >> 16) & 0x1)
              + 2; // Mute x, FDRF off, defualt PS, DTMEN off, GPIO
                   // 9 pull-down off, discharge cell 17 conditionally and
                   // cell 18 always
        wrcfgb_data[ic * ADBMS_CMD_LEN + 2] = 0x0; // Reserved bits
        wrcfgb_data[ic * ADBMS_CMD_LEN + 3] = 0x0; // Reserved bits
        wrcfgb_data[ic * ADBMS_CMD_LEN + 4] = 0x0; // Reserved bits
        wrcfgb_data[ic * ADBMS_CMD_LEN + 5] = 0x0; // Reserved bits
    }

    wakeup_sleep(NUM_ICS);

    write_68(NUM_ICS, wrcfgb_cmd, wrcfgb_data);
};

void enable_cell_balancing(void) {
    // bms_ctrl.cell_balancing_status = true;
    // can_send_bms_ctrl(); // TODO: Remove when running low on mem
    uint8_t unmute_data[NUM_ICS] = { 0 };
    wakeup_sleep(NUM_ICS);
    uint8_t unmute_cmd[2] = { 0x0, 0x29 };
    write_68(NUM_ICS, unmute_cmd, unmute_data);
};

void disable_cell_balancing(void) {
    // bms_ctrl.cell_balancing_status = false;
    // can_send_bms_ctrl(); // TODO: Remove when running low on mem
    uint8_t mute_data[NUM_ICS] = { 1 }; // TODO: Update for six segments
    // = { 1, 1, 1, 1, 1, 1 }; // TODO: Update for six segments
    wakeup_sleep(NUM_ICS);
    uint8_t mute_cmd[2] = { 0x0, 0x28 };
    write_68(NUM_ICS, mute_cmd, mute_data);
};
