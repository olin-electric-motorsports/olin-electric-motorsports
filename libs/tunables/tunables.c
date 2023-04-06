#include <avr/eeprom.h>
#include <avr/io.h>
#include <util/delay.h>

#include <stdbool.h>
#include <stdint.h>

#include "libs/can/api.h"

#define MAX_NUM_PARAMS (16)

typedef enum { GET = 0, SET = 1, MEASURE = 2 } message_type_t;

// A global variable that gives each board maximum of 16 tunable parameters
uint32_t TUNABLES_MEM[MAX_NUM_PARAMS] __attribute__((section(".eeprom")))
= { 0 };

// This is a local/in-memory copy of the parameters. In the initialization, we
// will read the contents of the EEPROM into this variable so that we can read
// the data fast (think of this like a cache!). We do this because init can be
// as slow as it wants (within reason) but the looping application should be as
// fast as it can be
// static uint32_t TUNABLES_MEM_LOCAL[MAX_NUM_PARAMS] = { 0 };

// A place to store the ECU ID locally in this file
static uint16_t g_ecu_id = 0;

uint8_t request_message_data[2] = { 0 };
can_frame_t request_message = {
    // ID initialized in `tunables_init`
    .dlc = 2,
    .data = request_message_data,
    .mob = 4,
};

// This filter defines the messages that the tunables library receives
can_filter_t request_message_filter = {
    .mask = 0x7FF,
};

void tunables_init(uint16_t ecu_id, void* tunables_data, size_t num_tunables) {
    uint32_t* tunables_local = (uint32_t*)tunables_data;

    // Read in memory from EEPROM into RAM for quick reading
    for (size_t i = 0; i < num_tunables; i++) {
        eeprom_busy_wait();
        tunables_local[i] = eeprom_read_dword(&TUNABLES_MEM[i]);
        _delay_ms(2);
    }

    // Initialize the ECU_ID locally
    g_ecu_id = ecu_id;
    request_message.id = g_ecu_id;
    request_message_filter.id = g_ecu_id;

    can_receive(&request_message, request_message_filter);
}

void tunables_loop(void* tunables_data, size_t num_tunables) {
    // If there was a can message
    if (can_poll_receive(&request_message) == 0) {
        message_type_t type = (message_type_t)request_message_data[0];
        uint8_t tunable_id = request_message_data[1];

        uint8_t response_data[8] = { 0 };
        can_frame_t response = {
            .id = g_ecu_id + 1,
            .dlc = 5,
            .data = response_data,
            .mob = 0,
        };

        switch (type) {
            case GET: {
                // Read the tunable from the local memory (much faster than
                // reading from EEPROM)
                response_data[0] = tunable_id;
                *((uint32_t*)response_data + 1)
                    = ((uint32_t*)tunables_data)[tunable_id];
                can_send(&response);
            } break;
            case SET: {
                // Update in local memory
                uint32_t new_data = *(request_message_data + 1);
                ((uint32_t*) tunables_data)[tunable_id] = new_data;

                // Update EEPROM
                eeprom_busy_wait();
                eeprom_update_dword(&TUNABLES_MEM[tunable_id],
                                    ((uint32_t*)tunables_data)[tunable_id]);
                _delay_ms(2);

                // Send the data back to the host
                response_data[0] = tunable_id;
                *((uint32_t*)response_data + 1)
                    = ((uint32_t*)tunables_data)[tunable_id];
                can_send(&response);
            } break;
            case MEASURE: {
                // Unimplemented!
            } break;
            default: {
                // Unimplemented!
            } break;
        }

        can_receive(&request_message, request_message_filter);
    }
}
