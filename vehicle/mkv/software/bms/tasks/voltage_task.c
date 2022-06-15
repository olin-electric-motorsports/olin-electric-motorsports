#include "tasks.h"

#include "vehicle/mkv/software/bms/bms_config.h"
#include "vehicle/mkv/software/bms/can_api.h"
#include "vehicle/mkv/software/bms/ltc6811/ltc6811.h"

#define NUM_CELLS_IN_REG (3)
#define NUM_CELL_REG     (4)
#define NUM_BYTES_IN_REG (6)
#define NUM_CELLS_PER_IC (8)

#define CELL_GROUP_1_OFFSET (0) // Cells 1-4
#define CELL_GROUP_2_OFFSET (4) // Cells 7-10

int voltage_task(uint16_t* pack_voltage, uint32_t* ov, uint32_t* uv) {
    *pack_voltage = 0;
    int pec_errors = 0;

    wakeup_sleep(NUM_ICS);

    // Start cell voltage ADC conversions
    LTC6811_adcv(MD_7KHZ_3KHZ, DCP_ENABLED, CELL_CH_ALL);

    // Blocks until all ADCs are done being read
    LTC6811_pollAdc(); // Ignore return value because we don't care how long it
                       // took

    wakeup_idle(NUM_ICS);

    /*
     * Read Cell Group Register A for all ICS,
     * then the Register B, etc.
     */
    uint8_t raw_data[NUM_RX_BYT * NUM_ICS] = { 0 };

    for (uint8_t cell_reg = 0; cell_reg < NUM_CELL_REG; cell_reg++) {
        // Executes once for each of the LTC681x cell voltage

        // + 1 because of the way _rdcv_reg is written
        LTC681x_rdcv_reg(cell_reg + 1, NUM_ICS, raw_data);

        for (uint8_t ic = 0; ic < NUM_ICS; ic++) { // foreach LTC6811
            can_frame_t voltage_frame = {
                .id = CAN_TOOLS_BMS_VOLTAGE_FRAME_ID,
                .mob = 0,
                .dlc
                = CAN_TOOLS_BMS_VOLTAGE_LENGTH, // Only send 3 cells at a time
            };

            uint8_t can_data[8] = { 0 };
            can_data[0] = ic;
            can_data[1] = cell_reg;
            uint16_t* reg_voltages = (uint16_t*)&(can_data[2]);
            voltage_frame.data = (uint8_t*)can_data;

            uint8_t raw_idx = ic * NUM_RX_BYT;

            // Get cell voltages
            uint16_t cell_1
                = raw_data[raw_idx + 0] + (raw_data[raw_idx + 1] << 8);
            uint16_t cell_2
                = raw_data[raw_idx + 2] + (raw_data[raw_idx + 3] << 8);
            uint16_t cell_3
                = raw_data[raw_idx + 4] + (raw_data[raw_idx + 5] << 8);

            /*
             * HACK: There is a bad solder joint somewhere that makes one of our
             * voltage groups misbehave. Two of the cells read too high and one
             * reads too low. Until this is fixed, we just average them and
             * report the average instead
             */
            if ((cell_reg == 2) && (ic == 5)) {
                uint16_t average
                    = ((cell_1 >> 8) + (cell_2 >> 8) + (cell_3 >> 8)) / 3;
                average <<= 8;
                cell_1 = (uint16_t)average;
                cell_2 = (uint16_t)average;
                cell_3 = (uint16_t)average;
            }

            reg_voltages[0] = cell_1;
            *pack_voltage += cell_1 >> 8;

            /*
             * HACK: There is a hardware issue in the BMS where this cell reads
             * too high and the following cell reads too low, but their average
             * is correct. We aren't sure why, so for now we are just ignoring
             * the issue.
             */
            if ((cell_reg == 3) && (ic == 10)) {
                cell_1 = 35000;
            }

            if (cell_1 >= OVERVOLTAGE_THRESHOLD) {
                *ov += 1;
            } else if (cell_1 <= UNDERVOLTAGE_THRESHOLD) {
                *uv += 1;
            }

            // Skip REG_B and REG_D cells 2 and 3 since we don't use them on the
            // chip
            if (!((cell_reg == 1) || (cell_reg == 3))) {
                reg_voltages[1] = cell_2;
                *pack_voltage += cell_2 >> 8;

                if (cell_2 >= OVERVOLTAGE_THRESHOLD) {
                    *ov += 1;
                } else if (cell_2 <= UNDERVOLTAGE_THRESHOLD) {
                    *uv += 1;
                }

                if ((cell_reg == 2) && (ic == 10)) {
                    cell_3 = cell_2;
                }

                reg_voltages[2] = cell_3;
                *pack_voltage += cell_3 >> 8;

                if (cell_3 >= OVERVOLTAGE_THRESHOLD) {
                    *ov += 1;
                } else if (cell_3 <= UNDERVOLTAGE_THRESHOLD) {
                    *uv += 1;
                }
            }

            can_send(&voltage_frame);

            uint16_t received_pec
                = (raw_data[raw_idx + 6] << 8) + raw_data[raw_idx + 7];

            /*
             * The received PEC for the current_ic
             * is transmitted as the 7th and 8th
             * after the 6 cell voltage data bytes
             */
            uint16_t data_pec
                = pec15_calc(NUM_BYTES_IN_REG, &raw_data[(ic)*NUM_RX_BYT]);

            if (received_pec != data_pec) {
                pec_errors++;
            }
        } // end foreach ltc6811
    } // end foreach cell reg (A, B, C, D)

    return pec_errors;
}
