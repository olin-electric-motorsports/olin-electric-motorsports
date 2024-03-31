#include "tasks.h"

#include "vehicle/common/ltc6811/ltc681x.h"
#include "vehicle/mkvi/software/bms/bms_config.h"
#include "vehicle/mkvi/software/bms/can_api.h"
#include "vehicle/mkvi/software/bms/utils/fault.h"

#define NUM_CELLS_IN_REG (3)
#define NUM_CELL_REG     (6)
#define NUM_BYTES_IN_REG (6)
#define NUM_CELLS_PER_IC (17)

int voltage_task(uint16_t* pack_voltage, uint32_t* ov, uint32_t* uv) {
    *pack_voltage = 0;
    int pec_errors = 0;

    wakeup_sleep(NUM_ICS);

    // Start cell voltage ADC conversions
    LTC681x_adcv(MD_7KHZ_3KHZ, DCP_ENABLED, CELL_CH_ALL);

    // Blocks until all ADCs are done being read
    LTC681x_pollAdc(); // Ignore return value because we don't care how long it
                       // took

    wakeup_idle(NUM_ICS);

    /*
     * Read Cell Group Register A for all ICS,
     * then the Register B, etc.
     */
    uint8_t raw_data[NUM_RX_BYT * NUM_ICS] = { 0 };
    uint16_t pack_voltages[NUM_ICS] = { 0 };

    for (uint8_t cell_reg = 0; cell_reg < NUM_CELL_REG; cell_reg++) {
        // Read one register at a time for all segments

        wakeup_idle(NUM_ICS);

        // + 1 because of the way _rdcv_reg is written
        LTC681x_rdcv_reg(cell_reg + 1, NUM_ICS, raw_data);

        for (uint8_t ic = 0; ic < NUM_ICS; ic++) { // foreach segment/chip
            bms_voltage.ic = ic;
            bms_voltage.cell = cell_reg;

            // Index for the raw data array
            uint8_t raw_idx = ic * NUM_RX_BYT;

            // Get cell voltages
            uint16_t cell_1
                = raw_data[raw_idx + 0] + (raw_data[raw_idx + 1] << 8);
            uint16_t cell_2
                = raw_data[raw_idx + 2] + (raw_data[raw_idx + 3] << 8);
            uint16_t cell_3
                = raw_data[raw_idx + 4] + (raw_data[raw_idx + 5] << 8);

            // Core receives all 1s when the CSC is MIA
            if ((cell_1 == UINT16_MAX) && (cell_2 == UINT16_MAX)
                && (cell_3 == UINT16_MAX)) {
                set_fault(BMS_FAULT_CSC_MIA);
            } else {
                clear_fault(BMS_FAULT_CSC_MIA);
                // Accumulate voltage (only append if valid SPI response)
                *pack_voltage += cell_1 >> 8;
                *pack_voltage += cell_2 >> 8;
                *pack_voltage += cell_3 >> 8;
            }

            // Put cell voltages in CAN message
            pack_voltages[ic] += cell_1;
            pack_voltages[ic] += cell_2;
            pack_voltages[ic] += cell_3;

            // Check under/overvoltage thresholds
            // if (cell_1 >= OVERVOLTAGE_THRESHOLD) {
            //     *ov += 1;
            // } else if (cell_1 <= UNDERVOLTAGE_THRESHOLD) {
            //     *uv += 1;
            // }

            // if (cell_2 >= OVERVOLTAGE_THRESHOLD) {
            //     *ov += 1;
            // } else if (cell_2 <= UNDERVOLTAGE_THRESHOLD) {
            //     *uv += 1;
            // }

            // if (cell_3 >= OVERVOLTAGE_THRESHOLD) {
            //     *ov += 1;
            // } else if (cell_3 <= UNDERVOLTAGE_THRESHOLD) {
            //     *uv += 1;
            // }

            can_send_bms_voltage();

            /*
             * The received PEC for the current_ic
             * is transmitted as the 7th and 8th
             * after the 6 cell voltage data bytes
             */
            uint16_t received_pec
                = (raw_data[raw_idx + 6] << 8) + raw_data[raw_idx + 7];

            uint16_t data_pec
                = pec15_calc(NUM_BYTES_IN_REG, &raw_data[(ic)*NUM_RX_BYT]);

            if (received_pec != data_pec) {
                pec_errors++;
            }
        } // end foreach ltc6811
    } // end foreach cell reg (A, B, C, D, E, F)

    for(uint8_t ic = 0; ic < NUM_ICS; ic++) {
        if (pack_voltages[ic] > SEGMENT_OVERVOLTAGE_THRESHOLD) {
            *ov += 1;
        }
        if (pack_voltages[ic] < SEGMENT_UNDERVOLTAGE_THRESHOLD) {
            *uv += 1;
        }
    }

    return pec_errors;
}
