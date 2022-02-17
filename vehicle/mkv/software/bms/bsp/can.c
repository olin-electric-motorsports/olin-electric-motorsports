#include "can.h"

#include "libs/can/api.h"

#define CAN_ID_VOLTAGE_BASE     (0x100)
#define CAN_ID_TEMPERATURE_BASE (0x100 + 24)

#define NUM_CELL_GROUPS       (3) // 3 groups of 4 cells, 4 cells per CAN msg
#define NUM_CELLS_PER_MESSAGE (4)

void can_send_bms_voltages(uint8_t num_ics, cell_asic ics[]) {
    can_frame_t voltage_frame = {
        .id = CAN_ID_VOLTAGE_BASE,
        .mob = 0,
        .dlc = 8,
    };

    for (uint8_t ic = 0; ic < num_ics; ic++) {
        // For every chip
        for (uint8_t cell_group = 0; cell_group < NUM_CELL_GROUPS;
             cell_group++) {
            // For every set of 4 cells (each IC monitors 12 cells, so 3 (loop
            // length) * 4 is 12

            /*
             * Trick: instead of creating our own data array, we just set the
             * pointer to the array to be the pointer to the cell voltages in
             * the ICS object with some offset. That way, we can reuse memory
             * and avoid memcpy-ing.
             */
            voltage_frame.data = (uint8_t*)(ics[ic].cells.c_codes)
                                 + (cell_group * NUM_CELLS_PER_MESSAGE);
        }

        can_send(&voltage_frame);

        voltage_frame.id += 1;
    }
}

void can_send_bms_temperatures(uint8_t num_ics, cell_asic ics[]) {
    can_frame_t temperature_frame = {
        .id = CAN_ID_TEMPERATURE_BASE,
        .mob = 0,
        .dlc = 8,
    };

    for (uint8_t ic = 0; ic < num_ics; ic++) {
        // For every chip
        for (uint8_t temp_group = 0; temp_group < 3; temp_group++) {
            /*
             * Trick: instead of creating our own data array, we just set the
             * pointer to the array to be the pointer to the cell temperatures
             * in the ICS object with some offset. That way, we can reuse memory
             * and avoid memcpy-ing.
             */
            // temperature_frame.data
            //     = (uint8_t*) (ics[ic].aux.a_codes) + (cell_group * 4);
        }

        can_send(&temperature_frame);

        temperature_frame.id += 1;
    }
}
