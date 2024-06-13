#include "cell_balancing.h"
#include "vehicle/common/ltc6811/ltc681x.h"
#include "vehicle/mkvi/software/bms/bms_config.h"
#include "vehicle/mkvi/software/bms/can_api.h"
#include "vehicle/mkvi/software/bms/utils/fault.h"

#define ADBMS_CMD_LEN (6)

void cell_balancing_task(void) {
    uint32_t cells_to_balance[NUM_ICS] = { 0 };
    // To use: little endian, so 0x1 would discharge only cell 1. Find the
    // lowest cell and discharge all but the lowest cell. Ex: 0x1FFBF to
    // discharge only cell seven.
    cells_to_balance[0] = 0x1FFFF;
    cells_to_balance[1] = 0x1FFFF;
    cells_to_balance[2] = 0x1FFFF;
    cells_to_balance[3] = 0x1FFFF;
    cells_to_balance[4] = 0x1FFFF;
    cells_to_balance[5] = 0x1FFFF;

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
            = cells_to_balance[ic] & 0xFF; // Discharge cells 1-8
        wrcfga_data[ic * ADBMS_CMD_LEN + 5]
            = (cells_to_balance[ic] >> 8)
              | 0xF0; // Discharge timer off, discharge cells 9-12
    }

    wakeup_sleep(NUM_ICS);

    write_68(NUM_ICS, wrcfga_cmd, wrcfga_data);

    // Set remaining discharge cells in cfg register B
    uint8_t wrcfgb_cmd[2] = { 0x0, 0x24 };
    uint8_t wrcfgb_data[ADBMS_CMD_LEN * NUM_ICS];

    for (uint8_t ic = 0; ic < NUM_ICS; ic++) {
        wrcfga_data[ic * ADBMS_CMD_LEN + 0]
            = (cells_to_balance[ic] >> 8)
              | 0xF; // Discharge cells 13-16, GPIO pull-downs off
        wrcfga_data[ic * ADBMS_CMD_LEN + 1]
            = (cells_to_balance[ic] >> 15)
              & 0x2; // Mute x, FDRF off, defualt PS, DTMEN off, GPIO
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
    uint8_t mute_data[NUM_ICS]
        = { 1, 1, 1, 1, 1, 1 }; // TODO: Update for six segments
    wakeup_sleep(NUM_ICS);
    uint8_t mute_cmd[2] = { 0x0, 0x28 };
    write_68(NUM_ICS, mute_cmd, mute_data);
};