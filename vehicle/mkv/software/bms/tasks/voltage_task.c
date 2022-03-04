#include "tasks.h"

#include "vehicle/mkv/software/bms/bms_config.h"
#include "vehicle/mkv/software/bms/ltc6811/ltc6811.h"
#include "vehicle/mkv/software/bms/can_api.h"
#include "vehicle/mkv/software/bms/utils/mux.h"
#include "vehicle/mkv/software/bms/utils/fault.h"

void voltage_task(void) {
    wakeup_sleep(NUM_ICS);

    // Start cell voltage ADC conversions PLUS Sum of Cells Conversion
    LTC6811_adcvsc(MD_7KHZ_3KHZ, DCP_ENABLED);

    // Blocks until all ADCs are done being read
    (void)LTC6811_pollAdc(); // Ignore return value because we don't care how
                             // long it took

    wakeup_idle(NUM_ICS);

    // Stores the voltages in the c_codes variable
    uint8_t error = LTC6811_rdcv(REG_ALL, NUM_ICS, ICS);

    if (error) {
        bms_metrics.voltage_pec_error_count += error;
        return;
    }

    uint16_t pack_voltage = 0;
    uint32_t uv = 0;
    uint32_t ov = 0;

    // Sum together all the voltages of the cells and check over/under voltage
    // conditions
    for (uint8_t ic = 0; ic < NUM_ICS; ic++) {
        /*
         * Sum of cells for a single IC
         *
         * The pins C5, C6, C11, and C12 are not connected to their own
         * cells, so we subtract them off
         */
        pack_voltage += ICS[ic].stat.stat_codes[0]
            - ICS[ic].cells.c_codes[4]
            - ICS[ic].cells.c_codes[5]
            - ICS[ic].cells.c_codes[10]
            - ICS[ic].cells.c_codes[11];

        // Odd bits of the ST register are used for undervoltage flags
        uv = (ICS[ic].stat.flags[0] & 0x55) | (ICS[ic].stat.flags[1] & 0x55)
             | (ICS[ic].stat.flags[2] & 0x55);

        // Even bits of the ST register are used for overvoltage flags
        ov = (ICS[ic].stat.flags[0] & 0xAA) | (ICS[ic].stat.flags[1] & 0xAA)
             | (ICS[ic].stat.flags[2] & 0xAA);

        if (uv > 0) {
            set_fault(BMS_FAULT_UNDERVOLTAGE);
        } else if (ov > 0) {
            set_fault(BMS_FAULT_OVERVOLTAGE);
        }
    }

    bms_core.pack_voltage = pack_voltage;
}
