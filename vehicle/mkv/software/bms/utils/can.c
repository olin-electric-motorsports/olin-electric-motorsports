#include "can.h"

#include "libs/can/api.h"
#include "vehicle/mkv/software/bms/bms_config.h"

#define CAN_ID_VOLTAGE_BASE     (0x410)
#define CAN_ID_TEMPERATURE_BASE (0x430)
#define CAN_ID_OPEN_WIRE_BASE   (CAN_ID_VOLTAGE_BASE + 64)

#define CELL_GROUP_1_OFFSET (0) // Cells 1-4
#define CELL_GROUP_2_OFFSET (6) // Cells 7-10

#define NUM_TEMPS_PER_MESSAGE (4)
#define NUM_CAN_TEMP_MSG_PER_IC \
    (NUM_MUX_CHANNELS * NUM_MUXES / NUM_TEMPS_PER_MESSAGE)

void can_send_bms_voltages(uint8_t num_ics, cell_asic ics[]) {
    can_frame_t voltage_frame = {
        .id = CAN_ID_VOLTAGE_BASE,
        .mob = 0,
        .dlc = 8,
    };

    for (uint8_t ic = 0; ic < num_ics; ic++) {
        // For every chip, send the lower and upper cell voltages in CAN frames

        /*
         * Trick: instead of creating our own data array, we just set the
         * pointer to the array to be the pointer to the cell voltages in
         * the ICS object with some offset. That way, we can reuse memory
         * and avoid memcpy-ing.
         */
        voltage_frame.data
            = (uint8_t*)(ics[ic].cells.c_codes) + CELL_GROUP_1_OFFSET;
        can_send(&voltage_frame);
        voltage_frame.id++;

        voltage_frame.data
            = (uint8_t*)(ics[ic].cells.c_codes) + CELL_GROUP_2_OFFSET;
        can_send(&voltage_frame);
        voltage_frame.id++;
    }
}

// void can_send_bms_temperatures(uint8_t num_ics, uint16_t** temperatures) {
//     can_frame_t temperature_frame = {
//         .id = CAN_ID_TEMPERATURE_BASE,
//         .mob = 0,
//         .dlc = 8,
//     };
//
//     for (uint8_t ic = 1; ic < num_ics; ic += 2) {
//         // Every second chip (index = 1, 3, 5, etc) measures temperatures
//
//         /*
//          * NUM_MUXES = 3
//          * NUM_MUX_CHANNELS = 8
//          * 3 * 8 = 24 total channels per peripheral board
//          *
//          * Each CAN message can send 8 bytes, or 4 temperatures (each temp is
//          2
//          *     bytes)
//          *
//          * Need 6 CAN messages per board (per iteration of ic)
//          */
//         for (uint8_t temp_group = 0; temp_group < NUM_CAN_TEMP_MSG_PER_IC;
//              temp_group++) {
//             // For each group of temperatures
//
//             /*
//              * Trick: instead of creating our own data array, we just set the
//              * pointer to the array to be the pointer to the cell temps in
//              * the ICS object with some offset. That way, we can reuse memory
//              * and avoid memcpy-ing.
//              */
//             temperature_frame.data
//                 = (uint8_t*)(temperatures[ic]
//                              + temp_group
//                                    * NUM_TEMPS_PER_MESSAGE); // TODO: Verify
//                                                              // logic
//
//             can_send(&temperature_frame);
//             temperature_frame.id++;
//         }
//     }
// }

void can_send_open_wires(uint8_t num_ics, cell_asic ics[]) {
    can_frame_t open_wire_frame = {
        .id = CAN_ID_OPEN_WIRE_BASE,
        .mob = 0,
        .dlc = 2,
    };

    for (uint8_t ic = 0; ic < num_ics; ic++) {
        // For every chip, send the open wires

        /*
         * Trick: instead of creating our own data array, we just set the
         * pointer to the array to be the pointer to the cell open_wires in
         * the ICS object with some offset. That way, we can reuse memory
         * and avoid memcpy-ing.
         */
        open_wire_frame.data = (uint8_t*)&(ics[ic].system_open_wire);
        can_send(&open_wire_frame);
        open_wire_frame.id++;
    }
}
