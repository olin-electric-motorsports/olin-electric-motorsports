
#include <avr/eeprom.h>
#include <avr/io.h>

enum function_type {
    GETTER = 0,
    SETTER = 1,
    MEASURE = 2
}

// A global variable that gives each board maximum of 16 tunable parameters
uint32_t TUNABLES_MEM[16] __attribute__((section(".eeprom")))
= { 0 };

uint8_t can_get_data[2] = { 0, 0 }; // Data that we received???????

void tunables_init(uint8_t ecu_id) {
    // Manually making the CAN frame & filter

    // Should we
    //  CAN frame can_get
    can_frame_t can_get = {
    .id = ecu_id,
    .dlc = 2,
    .data = can_get_data,
    .mob = 4,
    }

    //can filter can_get_filter
    can_filter_t can_get_filter = {
    .id = ecu_id,
    .mask = 0x7FF,
    }
}

void tunables_loop() {}