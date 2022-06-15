#include "charging_can.h"

#define CHARGING_CMD_DLC (8)
#define CHARGING_MOB (2)

static uint8_t charging_cmd_data[CHARGING_CMD_DLC];

static can_frame_t charging_cmd = {
    .id = 0x1806e5f4,
    .dlc = CHARGING_CMD_DLC,
    .data = charging_cmd_data,
    .mob = 0,
};

static uint8_t charging_fbk_data[CHARGING_CMD_DLC];
static can_frame_t charging_fbk = {
    .mob = 2,
    .data = charging_fbk_data,
};

static can_filter_t charging_fbk_filter = {
    .id = 0x18ff50e5,
    .mask = 0x3FFFFFFF,
};

void charging_set_max_voltage(uint16_t max_voltage_V) {
    max_voltage_V = max_voltage_V * 10;
    charging_cmd_data[0] = (max_voltage_V >> 8) & 0xF;
    charging_cmd_data[1] = (max_voltage_V) & 0xF;
}

void charging_set_max_current(uint16_t max_current_A) {
    max_current_A = max_current_A * 10;
    charging_cmd_data[2] = (max_current_A >> 8) & 0xF;
    charging_cmd_data[3] = (max_current_A) & 0xF;
}

void charging_set_enable(bool enable) {
    charging_cmd_data[4] = enable & 0x1;
}

void charging_send_command(void) {
    charging_cmd.data = charging_cmd_data;

    (void)can_send(&charging_cmd);
}

int charging_poll_recv_feedback(void) {
    return can_receive(&charging_fbk, charging_fbk_filter);
}

int charging_recv_feedback(void) {
    return can_poll_receive(&charging_fbk);
}

uint16_t charging_get_voltage(void) {
    uint16_t voltage = (charging_fbk_data[0] << 8) | (charging_fbk_data[1]);

    return voltage * 0.1;
}

uint16_t charging_get_current(void) {
    uint16_t current = (charging_fbk_data[2] << 8) | (charging_fbk_data[3]);

    return current * 0.1;
}

uint16_t charging_get_status_flags(void) {
    return charging_fbk_data[4];
}
