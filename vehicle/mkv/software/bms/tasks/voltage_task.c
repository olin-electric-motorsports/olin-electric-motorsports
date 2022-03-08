#include "tasks.h"

#include "vehicle/mkv/software/bms/bms_config.h"
#include "vehicle/mkv/software/bms/can_api.h"
#include "vehicle/mkv/software/bms/ltc6811/ltc6811.h"
// #include "vehicle/mkv/software/bms/utils/fault.h"

#define UNDERVOLTAGE_MASK (0x55)
#define OVERVOLTAGE_MASK  (0xAA)

int voltage_task(uint16_t* pack_voltage, uint32_t* ov, uint32_t* uv) {
    wakeup_sleep(NUM_ICS);

    // Start cell voltage ADC conversions PLUS Sum of Cells Conversion
    LTC6811_adcvsc(MD_7KHZ_3KHZ, DCP_ENABLED);

    // Blocks until all ADCs are done being read
    (void)LTC6811_pollAdc(); // Ignore return value because we don't care how
                             // long it took

    wakeup_idle(NUM_ICS);

    // Stores the voltages in the c_codes variable
    int error = LTC6811_rdcv(REG_ALL, NUM_ICS, ICS);

    if (error == -1) {
        bms_metrics.voltage_pec_error_count++;
        return 1;
    }

    /*
     * Sum together all the voltages of the cells and check over/under voltage
     * conditions
     */
    for (uint8_t ic = 0; ic < NUM_ICS; ic++) {
        /*
         * Sum of cells for a single IC
         *
         * The pins C5, C6, C11, and C12 are not connected to their own
         * cells, so we subtract them off
         *
         * stat.stat_codes[0] contains the sum-of-cells measurement
         * cells.c_codes[n] contains the nth cell voltage
         */
        *pack_voltage += ICS[ic].stat.stat_codes[0] - ICS[ic].cells.c_codes[4]
                         - ICS[ic].cells.c_codes[5] - ICS[ic].cells.c_codes[10]
                         - ICS[ic].cells.c_codes[11];

        // Odd bits of the ST register are used for undervoltage flags
        uint32_t _uv = (ICS[ic].stat.flags[0] & UNDERVOLTAGE_MASK)
                       | (ICS[ic].stat.flags[1] & UNDERVOLTAGE_MASK)
                       | (ICS[ic].stat.flags[2] & UNDERVOLTAGE_MASK);

        // Even bits of the ST register are used for overvoltage flags
        uint32_t _ov = (ICS[ic].stat.flags[0] & OVERVOLTAGE_MASK)
                       | (ICS[ic].stat.flags[1] & OVERVOLTAGE_MASK)
                       | (ICS[ic].stat.flags[2] & OVERVOLTAGE_MASK);

        /*
         * If we detect any under/overvoltage cells, we add one to the uv
         * variable. This doesn't tell us _how many_ cells were
         * under/overvoltage, but we don't need that information (and it will be
         * accessible through the cell voltage CAN messages), so this method
         * suffices.
         */
        if (_uv) {
            (*uv)++;
        }
        if (_ov) {
            (*ov)++;
        }
    }

    return 0;
}
