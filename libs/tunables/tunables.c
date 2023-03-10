
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

// Can't I just declare send_can in tunables_init??????????????????????????
void timer0_callback(void) {
    send_can = true;
}

uint8_t can_get_data[2] = { 0, 0 }; // Data that we received???????????????????

void tunables_init(uint8_t ecu_id) {
    // Manually making the CAN frame & filter

    // We put the can filters in the _init right????
    //  CAN frame can_get
    can_frame_t can_get = {
        .id = ecu_id,
        .dlc = 2,
        .data = can_get_data,
        .mob = 4,
    };

    // can filter can_get_filter
    can_filter_t can_get_filter = {
        .id = ecu_id,
        .mask = 0x7FF,
    };
}

void tunables_loop() {
    // Is rc going to be a local variable??????????????????????????????
    int rc = can_poll_receive(&can_get);

    // If there was a can message
    if (rc == 0) {
        // Just to clarify, tunable_id is declared in the tunables.yaml
        // file??????????

        // can_get
        if (data[0] == 0) {
            eeprom_read_dword(&TUNABLES_MEM + (4 * tunable_id))
        };

        // can_set
        if (data[0] == 1) {
            eeprom_write_dword(&TUNABLES_MEM + (4 * tunable_id), data[2])
        };

        can_receive(&can_get, can_get_filter);
    }

    // Start listening again!
    if (send_can) {
        can_send_test_msg(); // what does this do???????????????????
        send_can = false;
    }
}