#include "tasks.h"

#include "vehicle/common/ltc6811/ltc681x.h"
#include "vehicle/mkvii/software/bms/bms_config.h"
#include "vehicle/mkvii/software/bms/can_api.h"
#include "vehicle/mkvii/software/bms/utils/fault.h"

#define NUM_CELLS_IN_REG (3)
#define NUM_CELL_REG     (6)
#define NUM_BYTES_IN_REG (6)
#define NUM_CELLS_PER_IC (17)

void openwire_task(uint32_t* ow) {
    // Clear any previous open_wire flags
    *ow = 0;

    // Make sure IC's are in the right state. 
    wakeup_sleep(NUM_ICS);

    for (int i = 0; i < 1, i++){        // Start the ADC conversion for the openwire function. 
        LTC681x_adow(MD_7KHZ_3KHZ, i, CELL_CH_ALL, DCP_ENABLED);

        // Poll until ADC conversions are complete (make sure conversion is happening)
        LTC681x_pollAdc();

        //Read open wire data.
        uint16_t raw_data[NUM_RX_BYT * NUM_ICS] = { 0 };

        //Loop through the cell registers to collect the data.
            for (uint8_t cell_reg = 0; cell_reg < NUM_CELL_REG; cell_reg++) {
            // Ensure the chips are awake before each read.
            wakeup_idle(NUM_ICS);

            // Read one register at a time for all chips.
            LTC681x_run_openwire_single(NUM_ICS, raw_data);

            // Process the raw_data for this register to check for open wires.
    }
            for (int chip = 0; chip < NUM_ICS; chip++) {
                for (int cell = 0; cell < NUM_CELLS_PER_IC; cell++) {
                // Calculate the index into your raw_data array.
                int index = chip * NUM_CELLS_PER_IC + cell;

                // Check if the measured value indicates an open wire.
                if (raw_data[index] < THRESHOLD) {
                    // Set the corresponding bit in the open-wire status bitfield.
                    *ow |= (1 << index);
            }
        }
    }
    }
}
}
