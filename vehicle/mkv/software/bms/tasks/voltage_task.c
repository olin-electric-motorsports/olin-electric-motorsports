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

// uint16_t cell_voltages[NUM_ICS][NUM_CELLS_PER_IC];

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
            uint16_t data_counter = ic * NUM_RX_BYT;

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

            for (uint8_t cell_counter = 0; cell_counter < NUM_CELLS_IN_REG;
                 cell_counter++) {
                if (((cell_reg == 1) || (cell_reg == 3))
                    && (cell_counter >= 1)) {
                    data_counter += 2;
                    continue;
                }

                // Parse cell voltage
                uint16_t cell_voltage = raw_data[data_counter]
                                        + (raw_data[data_counter + 1] << 8);

                reg_voltages[cell_counter] = cell_voltage;

                // Accumulate!
                *pack_voltage += cell_voltage >> 8;

                // Check under/over voltage
                if (cell_voltage >= OVERVOLTAGE_THRESHOLD) {
                    *ov += 1;
                } else if (cell_voltage <= UNDERVOLTAGE_THRESHOLD) {
                    *uv += 1;
                }

                data_counter += 2;
            }

            can_send(&voltage_frame);

            /*
             * The received PEC for the current_ic
             * is transmitted as the 7th and 8th
             * after the 6 cell voltage data bytes
             */
            uint16_t received_pec
                = (raw_data[data_counter] << 8) | raw_data[data_counter + 1];

            uint16_t data_pec
                = pec15_calc(NUM_BYTES_IN_REG, &raw_data[(ic)*NUM_RX_BYT]);

            if (received_pec != data_pec) {
                pec_errors++;
            }
            data_counter = data_counter + 2;
        } // end foreach ltc6811
    } // end foreach cell reg (A, B, C, D)

    return pec_errors;
}

// void can_send_bms_voltages(void) {
//     can_frame_t voltage_frame = {
//         //
//         // .id = CAN_TOOLS_BMS_VOLTAGE_0_FRAME_ID,
//         .mob = 0,
//         .dlc = 8,
//     };
//
//     for (uint8_t ic = 0; ic < NUM_ICS; ic++) {
//         // For every chip, send the lower and upper cell voltages in CAN
//         frames
//
//         /*
//          * Trick: instead of creating our own data array, we just set the
//          * pointer to the array to be the pointer to the cell voltages in
//          giant
//          * array with some offset. That way, we can reuse memory and avoid
//          * memcpy-ing.
//          */
//         voltage_frame.data
//             = (uint8_t*)(cell_voltages[ic] + CELL_GROUP_1_OFFSET);
//         can_send(&voltage_frame);
//         voltage_frame.id++;
//
//         voltage_frame.data
//             = (uint8_t*)(cell_voltages[ic] + CELL_GROUP_2_OFFSET);
//         can_send(&voltage_frame);
//         voltage_frame.id++;
//     }
// }
