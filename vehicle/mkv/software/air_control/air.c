#include <stdlib.h>
#include <avr/interrupt.h>
#include <string.h> // memcpy

#include "libs/can/api.h"
#include "libs/gpio/api.h"
#include "libs/timer/api.h"
#include "config.h"

enum State {
    IDLE,
    SHUTDOWN_CIRCUIT_CLOSED,
    PRECHARGE,
    TS_ACTIVE,
    DISCHARGE,
    FAULT,
};

enum FAULT_CODE {
    NO_FAULT = 0x00,
    AIR_N_WELD,
    AIR_P_WELD,
    BOTH_AIRS_WELD,
    PRECHARGE_FAIL,
    DISCHARGE_FAIL,
    PRECHARGE_FAIL_RELAY_WELDED, // voltage divider
    CAN_BMS_TIMEOUT,
    CAN_MC_TIMEOUT,
};

volatile enum State current_state = IDLE;

void timer0_isr(void) {
    air_ctrl_critical_data[AIR_STATE] = current_state;

    can_send(&air_ctrl_critical_msg);
    can_send(&air_ctrl_sense_msg);
}

void can_isr(void) {
    if (can_mob_has_interrupt(MOB_MOTOR_CONTROLLER)) {
        can_poll_receive(&motor_controller_msg); // Retrieves the CAN message from the MOb
    }

    if (can_mob_has_interrupt(MOB_BMS)) {
        can_poll_receive(&bms_msg); // Retrieves the CAN message from the MOb
    }
}

volatile uint32_t time;
volatile bool run_1ms;

static uint32_t get_time(void) {
    cli();
    uint32_t t = time;
    sei();
    return t;
}

void timer1_isr(void) {
    time++;
    run_1ms = true;
}

// TODO: start as 1 or 0?
volatile uint8_t imd_st = 1;
volatile uint8_t bms_st = 1;

// static enum State change_state(enum State new_state) {
//     bool ok = false;
// 
//     ok = ok && imd_st && bms_st;
// 
//     uint16_t pack_voltage, mc_voltage;
//     memcpy(&pack_voltage, (bms_data + 2), sizeof(uint16_t));
//     memcpy(&mc_voltage, motor_controller_data, sizeof(uint16_t));
// 
//     switch (current_state) {
//         case IDLE: {
//             ok = ok && (mc_voltage < 5);
//         } break;
//         case SHUTDOWN_CIRCUIT_CLOSED: {
// 
//         } break;
//         case PRECHARGE: {
// 
//         } break;
//         case TS_ACTIVE: {
// 
//         } break;
//         case DISCHARGE: {
// 
//         } break;
//         case FAULT: {
// 
//         } break;
//     }
// 
//     if (ok) {
//         current_state = new_state;
//     } else {
//         current_state = FAULT;
//     }
// 
//     return current_state;
// }

/*
 * Interrupts
 */
volatile bool shutdown_nodes = 0;

void pcint0_callback(void) {
    uint8_t ss_tsms = !!gpio_get_pin(SS_TSMS);
    uint8_t ss_imd_latch = !!gpio_get_pin(SS_IMD_LATCH);
    uint8_t ss_mpc = !!gpio_get_pin(SS_MPC);
    uint8_t ss_hvd_conn = !!gpio_get_pin(SS_HVD_CONN);
    uint8_t ss_hvd = !!gpio_get_pin(SS_HVD);

    shutdown_nodes = ss_tsms && ss_imd_latch && ss_mpc && ss_hvd_conn
        && ss_hvd;

    air_ctrl_critical_data[AIR_STATUS] |= (
        (ss_tsms << TSMS_SENSE) ||
        (ss_imd_latch << IMD_SENSE) ||
        (ss_mpc << MAIN_PACK_CONNECTOR_SENSE) ||
        (ss_hvd_conn << HVD_CONNECTOR_SENSE) ||
        (ss_hvd << HVC_SENSE)
    );
}

void pcint1_callback(void) {
    bms_st = !!gpio_get_pin(BMS_SENSE);

    air_ctrl_critical_data[AIR_STATUS] |= (
        (!!gpio_get_pin(AIR_P_WELD_DETECT) << AIR_POS_STATUS) ||
        (!!gpio_get_pin(AIR_N_WELD_DETECT) << AIR_NEG_STATUS) ||
        (bms_st << BMS_STATUS)
    );
}

void pcint2_callback(void) {
    imd_st = !!gpio_get_pin(IMD_SENSE);
    air_ctrl_critical_data[AIR_STATUS] |= imd_st << IMD_STATUS;
}

static void state_machine_run(void) {
    if (!imd_st || !bms_st) {
        current_state = FAULT;
    }

    switch (current_state) {
        case IDLE: {
            /*
             * Do nothing. The state will be updated in the pcint0_callback when
             * the TSMS shutdown sense is triggered.
             */
            if (air_ctrl_sense_data[0] & 0x1) {
                current_state = SHUTDOWN_CIRCUIT_CLOSED;
            }
        } break;
        case SHUTDOWN_CIRCUIT_CLOSED: {
            uint32_t now = get_time();

            do {
                // nothing--state will be changed in an interrupt
            } while (get_time() - now < 200); // Wait 200ms

            if (current_state == SHUTDOWN_CIRCUIT_CLOSED) {
                current_state = FAULT;
            }
        } break;
        case PRECHARGE: {
            gpio_set_pin(PRECHARGE_CTL);

            uint32_t now = get_time();

            do {
                // nothing
            } while (get_time() - now < 2000); // Wait 2s

            uint16_t pack_voltage, mc_voltage;
            memcpy(&pack_voltage, (bms_data + 2), sizeof(uint16_t));
            memcpy(&mc_voltage, motor_controller_data, sizeof(uint16_t));

            if (pack_voltage - mc_voltage > (0.05 * pack_voltage)) {
                current_state = FAULT;
            } else {
                gpio_set_pin(AIR_N_LSD); // Close AIR-
                gpio_clear_pin(PRECHARGE_CTL);
                // change_state(TS_ACTIVE);
                current_state = TS_ACTIVE;
            }

        } break;
        case TS_ACTIVE: {
            // CAN message is updated

            // wait for an interrupt from any of the shutdown sense pins
            if (!shutdown_nodes) {
                current_state = DISCHARGE;
            }
        } break;
        case DISCHARGE: {
            gpio_clear_pin(AIR_N_LSD);

            uint8_t air_p_detect = gpio_get_pin(AIR_P_WELD_DETECT);
            uint8_t air_n_detect = gpio_get_pin(AIR_N_WELD_DETECT);

            if (air_p_detect && air_n_detect) {
                current_state = FAULT;
                return;
            } else if (air_p_detect) {
                current_state = FAULT;
                return;
            } else if (air_n_detect) {
                current_state = FAULT;
                return;
            }

            uint32_t now = get_time();

            do {
                // nothing
            } while (get_time() - now < 2000); // Wait 2s

            uint16_t mc_voltage;
            memcpy(&mc_voltage, motor_controller_data, sizeof(uint16_t));

            if (mc_voltage < 10) {
                current_state = IDLE;
            } else {
                current_state = FAULT;
            }
        } break;
        case FAULT: {
            // cry
        } break;
        default: {
            // Shouldn't happen, but just in case
            current_state = FAULT;
        } break;
    }
}

int main(void) {
    can_init(BAUD_500KBPS);
    timer_init(&timer0_cfg);
    timer_init(&timer1_cfg);

    gpio_set_mode(PRECHARGE_CTL, OUTPUT);
    gpio_set_mode(AIR_N_LSD, OUTPUT);

    gpio_enable_interrupt(SS_TSMS);
    gpio_enable_interrupt(SS_IMD_LATCH);
    gpio_enable_interrupt(SS_MPC);
    gpio_enable_interrupt(SS_HVD_CONN);
    gpio_enable_interrupt(SS_HVD);

    gpio_enable_interrupt(BMS_SENSE);
    gpio_enable_interrupt(IMD_SENSE);

    // Check plausibility
    // assert(AIR_SENSE_+ == LOW)
    // assert(AIR_SENSE_- == LOW)
    // assert(SS_TSMS- == HIGH)
    // assert(MC_VOLTAGE == 0V)
    // assert(BMS_VOLTAGE == PACK_VOLTAGE)
    // assert(IMD == TODO: Corey: IMD needs time to start up and calibrate)

    while (1) {
        if (run_1ms) {
            state_machine_run();
            run_1ms = false;
        }
    }
}
