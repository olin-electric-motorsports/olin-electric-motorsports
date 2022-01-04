#include "shutdown_generated.h"
/* This file is automatically generated. Do not directly modify this file!! */
/* RAW ARRAY DEFINITIONS */
uint8_t* BRAKELIGHT_BSPD_SHUTDOWN_RAW_ARR;

/* MESSAGE STRUCT DEFINITIONS */
// BRAKELIGHT_BSPD_SHUTDOWN_MSG
struct shutdown_brakelight_bspd_shutdown_t BRAKELIGHT_BSPD_SHUTDOWN_MSG = {
    .error_code = 0x00,
    .brake_analog_voltage_msb = 0x00,
    .brake_analog_voltage_lsb = 0x00,
    .brake_gate = 0x00,
    .bspdsense = 0x00,

};

/* BOARD-SPECIFIC CAN FUNCTIONALITY. */
void shutdown_CAN_init() {
    // Allocate array of structs that will be shared with can_api
    CAN_msg_array = malloc(sizeof(msg_info*) * 1);
    CAN_info_len = 1;

    // Add one struct per TX messsage
    // BRAKELIGHT_BSPD_SHUTDOWN struct initialization
    BRAKELIGHT_BSPD_SHUTDOWN_RAW_ARR = malloc(sizeof(uint8_t) * 8);
    struct can_msg_info MESSAGE = {
        .raw_arr = BRAKELIGHT_BSPD_SHUTDOWN_RAW_ARR,
        .countdown = 100,
        .cycle_time = 100,
        .mob = 0, // TODO?
        .ident = 11.0,
        .length = 5.0,
    };
    CAN_msg_array[0] = &MESSAGE;

    // Call can_api init
    CAN_init(0);

    initTimer();
}

/* BOARD-SPECIFIC MESSAGE SETTERS, ONE PER SIGNAL PER TX MESSAGE */
// Update sig: error_code of msg: brakelight_bspd_shutdown
int set_brakelight_bspd_shutdown_error_code(uint8_t value) {
    // check that it is a legal value
    if (shutdown_brakelight_bspd_shutdown_error_code_is_in_range(value) == 0) {
        return 0;
    }
    // update the struct and the raw array
    BRAKELIGHT_BSPD_SHUTDOWN_MSG.error_code = value;
    return shutdown_brakelight_bspd_shutdown_pack(
        BRAKELIGHT_BSPD_SHUTDOWN_RAW_ARR, &BRAKELIGHT_BSPD_SHUTDOWN_MSG, 8);
};
// Update sig: brake_analog_voltage_msb of msg: brakelight_bspd_shutdown
int set_brakelight_bspd_shutdown_brake_analog_voltage_msb(uint8_t value) {
    // check that it is a legal value
    if (shutdown_brakelight_bspd_shutdown_brake_analog_voltage_msb_is_in_range(
            value)
        == 0) {
        return 0;
    }
    // update the struct and the raw array
    BRAKELIGHT_BSPD_SHUTDOWN_MSG.brake_analog_voltage_msb = value;
    return shutdown_brakelight_bspd_shutdown_pack(
        BRAKELIGHT_BSPD_SHUTDOWN_RAW_ARR, &BRAKELIGHT_BSPD_SHUTDOWN_MSG, 8);
};
// Update sig: brake_analog_voltage_lsb of msg: brakelight_bspd_shutdown
int set_brakelight_bspd_shutdown_brake_analog_voltage_lsb(uint8_t value) {
    // check that it is a legal value
    if (shutdown_brakelight_bspd_shutdown_brake_analog_voltage_lsb_is_in_range(
            value)
        == 0) {
        return 0;
    }
    // update the struct and the raw array
    BRAKELIGHT_BSPD_SHUTDOWN_MSG.brake_analog_voltage_lsb = value;
    return shutdown_brakelight_bspd_shutdown_pack(
        BRAKELIGHT_BSPD_SHUTDOWN_RAW_ARR, &BRAKELIGHT_BSPD_SHUTDOWN_MSG, 8);
};
// Update sig: brake_gate of msg: brakelight_bspd_shutdown
int set_brakelight_bspd_shutdown_brake_gate(uint8_t value) {
    // check that it is a legal value
    if (shutdown_brakelight_bspd_shutdown_brake_gate_is_in_range(value) == 0) {
        return 0;
    }
    // update the struct and the raw array
    BRAKELIGHT_BSPD_SHUTDOWN_MSG.brake_gate = value;
    return shutdown_brakelight_bspd_shutdown_pack(
        BRAKELIGHT_BSPD_SHUTDOWN_RAW_ARR, &BRAKELIGHT_BSPD_SHUTDOWN_MSG, 8);
};
// Update sig: bspdsense of msg: brakelight_bspd_shutdown
int set_brakelight_bspd_shutdown_bspdsense(uint8_t value) {
    // check that it is a legal value
    if (shutdown_brakelight_bspd_shutdown_bspdsense_is_in_range(value) == 0) {
        return 0;
    }
    // update the struct and the raw array
    BRAKELIGHT_BSPD_SHUTDOWN_MSG.bspdsense = value;
    return shutdown_brakelight_bspd_shutdown_pack(
        BRAKELIGHT_BSPD_SHUTDOWN_RAW_ARR, &BRAKELIGHT_BSPD_SHUTDOWN_MSG, 8);
};
