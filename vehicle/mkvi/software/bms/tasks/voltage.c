#include "tasks.h"

#include "projects/can_print/can_print.h"
#include "vehicle/common/ltc6811/ltc681x.h"
#include "vehicle/mkvi/software/bms/bms_config.h"
#include "vehicle/mkvi/software/bms/can_api.h"
#include "vehicle/mkvi/software/bms/utils/cell_balancing.h"
#include "vehicle/mkvi/software/bms/utils/fault.h"

#define NUM_CELLS_IN_REG (3)
#define NUM_CELL_REG     (6)
#define NUM_BYTES_IN_REG (6)
#define NUM_CELLS_PER_IC (17)

void voltage_task(uint16_t* pack_voltage, uint32_t* ov, uint32_t* uv,
                  uint16_t* lowest_voltage, uint16_t* last_lowest_voltage,
                  uint32_t (*cells_to_balance)[NUM_ICS], uint16_t* pec_errors) {
    *pack_voltage = 0;

    wakeup_sleep(NUM_ICS);

    disable_cell_balancing();
    // Start cell voltage ADC conversions
    LTC681x_adcv(MD_7KHZ_3KHZ, DCP_ENABLED, CELL_CH_ALL);

    // Blocks until all ADCs are done being read
    LTC681x_pollAdc(); // Ignore return value because we don't care how long it
                       // took
    if (bms_core.cell_balancing_status) {
        enable_cell_balancing();
    }

    wakeup_idle(NUM_ICS);

    /*
     * Read Cell Group Register A for all ICS,
     * then the Register B, etc.
     */
    uint8_t raw_data[NUM_RX_BYT * NUM_ICS] = { 0 };
    // uint32_t pack_voltages[NUM_ICS] = { 0 };

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
            if (cell_1 < *lowest_voltage) {
                *lowest_voltage = cell_1;
            }
            if (cell_1 > *last_lowest_voltage + BALANCED_MARGIN) {
                *cells_to_balance[ic] |= 1 << (cell_reg * 3);
            }
            uint16_t cell_2
                = raw_data[raw_idx + 2] + (raw_data[raw_idx + 3] << 8);
            if (cell_2 < *lowest_voltage) {
                *lowest_voltage = cell_2;
            }
            if (cell_2 > *last_lowest_voltage + BALANCED_MARGIN) {
                if (cell_reg == 5) {
                    *cells_to_balance[ic] |= 0b00000000000000010000000000000000;
                } else {
                    *cells_to_balance[ic] |= 1 << (cell_reg * 3 + 1);
                }
                can_send_bms_debug();
            }
            uint16_t cell_3
                = raw_data[raw_idx + 4] + (raw_data[raw_idx + 5] << 8);
            if (cell_reg != 5) { // Exclude last cell
                if (cell_3 < *lowest_voltage) {
                    *lowest_voltage = cell_3;
                }
                if (cell_3 > *last_lowest_voltage + BALANCED_MARGIN) {
                    *cells_to_balance[ic] |= 1 << (cell_reg * 3 + 2);
                }
            }

            // Core receives all 1s when the CSC is MIA
            if ((cell_1 == UINT16_MAX) && (cell_2 == UINT16_MAX)
                && (cell_3 == UINT16_MAX)) {
                set_csc_mia(ic);
            } else {
                clear_csc_mia(ic);
                // Accumulate voltage (only append if valid SPI response)
                *pack_voltage += cell_1 >> 8;
                *pack_voltage += cell_2 >> 8;
                *pack_voltage += cell_3 >> 8;
            }

            // Set CSC fault based on status of all CSCs
            if (!check_csc_state()) {
                clear_fault(BMS_FAULT_CSC_MIA);
            } else {
                set_fault(BMS_FAULT_CSC_MIA);
            }

            // Put cell voltages in CAN message
            bms_voltage.voltage_1 = cell_1;
            bms_voltage.voltage_2 = cell_2;
            bms_voltage.voltage_3 = cell_3;

            // // Average cell voltages on segment 1
            // if (ic == 1) {
            //     // pack_voltages[ic] += (cell_1 + cell_2 + cell_3);
            //     pack_voltages[ic] += cell_1;
            //     pack_voltages[ic] += cell_2;
            //     pack_voltages[ic] += cell_3;
            // } else {
            // Check under/overvoltage thresholds
            if (cell_1 >= OVERVOLTAGE_THRESHOLD) {
                *ov += 1;
            } else if (cell_1 <= UNDERVOLTAGE_THRESHOLD) {
                *uv += 1;
            }

            if (cell_2 >= OVERVOLTAGE_THRESHOLD) {
                *ov += 1;
            } else if (cell_2 <= UNDERVOLTAGE_THRESHOLD) {
                *uv += 1;
            }

            if (cell_3 >= OVERVOLTAGE_THRESHOLD) {
                *ov += 1;
            } else if (cell_3 <= UNDERVOLTAGE_THRESHOLD) {
                *uv += 1;
            }
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
                *pec_errors += 1;
            }

            // can_print("cell1", cell_1);
            // can_print("cell2", cell_2);
            // can_print("cell3", cell_3);
            // can_print("lv", *last_lowest_voltage);
        } // end foreach ltc6811
    } // end foreach cell reg (A, B, C, D, E, F)

    // // Fault handling for cell voltage average on segment 1
    // if (pack_voltages[1] > SEGMENT_OVERVOLTAGE_THRESHOLD) {
    //     set_fault(BMS_FAULT_OVERVOLTAGE);
    // } else if (pack_voltages[1] < SEGMENT_UNDERVOLTAGE_THRESHOLD) {
    //     set_fault(BMS_FAULT_UNDERVOLTAGE);
    // }
    *last_lowest_voltage = *lowest_voltage;
    // can_print("lv", *last_lowest_voltage);
}
