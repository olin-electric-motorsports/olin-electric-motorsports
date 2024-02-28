#include "tasks.h"

#include "vehicle/common/ltc6811/ltc681x.h"
#include "vehicle/mkvi/software/bms/bms_config.h"
#include "vehicle/mkvi/software/bms/can_api.h"
#include "vehicle/mkvi/software/bms/utils/fault.h"
#include <string.h>

#define NO_OPEN_WIRES (65535)
#define NUM_CV_REG    (4)
#define NUM_CHANNELS  (18)

/*
Reads and parses the LTC681x cell voltage registers.
The function is used to read the parsed Cell voltages codes of the LTC681x.
This function will send the requested read commands parse the data
and store the cell voltages in c_codes variable.
*/
uint8_t LTC681x_rdcv_trunc(
    uint8_t reg, // Controls which cell voltage register is read back.
    uint8_t total_ic // The number of ICs in the system
) {
    int8_t pec_error = 0;
    uint8_t cell_data_buff[NUM_RX_BYT * total_ic];
    memset(cell_data_buff, 0x00, NUM_RX_BYT * total_ic);

    if (reg == 0) {
        for (uint8_t cell_reg = 1; cell_reg < NUM_CV_REG + 1;
             cell_reg++) // Executes once for each of the LTC681x cell voltage
                         // registers
        {
            LTC681x_rdcv_reg(cell_reg, total_ic, cell_data_buff);
            for (int current_ic = 0; current_ic < total_ic; current_ic++) {
                pec_error
                    = pec_error
                      + parse_cells(
                          current_ic, cell_reg, cell_data_buff,
                          &cell_data.cells[current_ic].cells.c_codes[0],
                          &cell_data.cells[current_ic].cells.pec_match[0]);
            }
        }
    }

    else {
        LTC681x_rdcv_reg(reg, total_ic, cell_data_buff);

        for (int current_ic = 0; current_ic < total_ic; current_ic++) {
            pec_error = pec_error
                        + parse_cells(
                            current_ic, reg, &cell_data_buff[8 * current_ic],
                            &cell_data.cells[current_ic].cells.c_codes[0],
                            &cell_data.cells[current_ic].cells.pec_match[0]);
        }
    }
    // LTC681x_check_pec(total_ic, CELL, ic);

    return (pec_error);
}

int openwire_task(void) {
    int ret = 0;

    uint16_t OPENWIRE_THRESHOLD = 4000;

    uint16_t pullUp[NUM_ICS][NUM_CHANNELS];
    uint16_t pullDwn[NUM_ICS][NUM_CHANNELS];
    int16_t openWire_delta[NUM_ICS][NUM_CHANNELS];

    int8_t i;

    wakeup_sleep(NUM_ICS);
    LTC681x_clrcell();

    // Pull Ups
    for (i = 0; i < 3; i++) {
        wakeup_idle(NUM_ICS);
        LTC681x_adow(MD_26HZ_2KHZ, PULL_UP_CURRENT, CELL_CH_ALL, DCP_DISABLED);
        LTC681x_pollAdc();
    }

    wakeup_idle(NUM_ICS);
    LTC681x_rdcv_trunc(0, NUM_ICS);

    for (int cic = 0; cic < NUM_ICS; cic++) {
        for (int cell = 0; cell < NUM_CHANNELS; cell++) {
            pullUp[cic][cell] = cell_data.cells[cic].cells.c_codes[cell];
        }
    }

    long open_wire;
    for (int cic = 0; cic < NUM_ICS; cic++) {
        open_wire = 0xFFFF;

        for (int cell = 0; cell < NUM_CHANNELS; cell++) {
            if (pullDwn[cic][cell] < pullUp[cic][cell]) {
                openWire_delta[cic][cell]
                    = (pullUp[cic][cell] - pullDwn[cic][cell]);
            } else {
                openWire_delta[cic][cell] = 0;
            }

            if (openWire_delta[cic][cell] > OPENWIRE_THRESHOLD) {
                open_wire = cell + 1;
            }
        }

        if (pullUp[cic][0] == 0) {
            open_wire = 0;
        }

        if (pullUp[cic][(NUM_CHANNELS - 1)]
            == 0) // checking the Pull up value of the top measured channel
        {
            open_wire = NUM_CHANNELS;
        }

        if (open_wire != NO_OPEN_WIRES) {
            set_fault(BMS_FAULT_OPEN_WIRE);
            ret = 1;
        }
    }

    return ret;
}
