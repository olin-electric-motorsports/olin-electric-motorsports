#include <avr/interrupt.h>
#include <stdlib.h>
#include <string.h> // memcpy

#include "config.h"
#include "libs/can/api.h"
#include "libs/gpio/api.h"
#include "libs/timer/api.h"

enum State {
    IDLE,
    SHUTDOWN_CIRCUIT_CLOSED,
    PRECHARGE,
    TS_ACTIVE,
    DISCHARGE,
    FAULT,
};

enum FaultCode {
    FAULT_NONE = 0x00,
    FAULT_AIR_N_WELD,
    FAULT_AIR_P_WELD,
    FAULT_BOTH_AIRS_WELD,
    FAULT_PRECHARGE_FAIL,
    FAULT_DISCHARGE_FAIL,
    FAULT_PRECHARGE_FAIL_RELAY_WELDED, // voltage divider
    FAULT_CAN_ERROR,
    FAULT_CAN_BMS_TIMEOUT,
    FAULT_CAN_MC_TIMEOUT,
    FAULT_SHUTDOWN_IMPLAUSIBILITY,
    FAULT_MOTOR_CONTROLLER_VOLTAGE,
    FAULT_BMS_VOLTAGE,
    FAULT_IMD_FAULT,
};

volatile enum State* current_state; // = IDLE;
volatile enum FaultCode* fault_state; // = FAULT_NONE;

void can_isr(void) {
    if (can_mob_has_interrupt(MOB_MOTOR_CONTROLLER)) {
        can_poll_receive(
            &motor_controller_msg); // Retrieves the CAN message from the MOb
    }

    if (can_mob_has_interrupt(MOB_BMS)) {
        can_poll_receive(&bms_msg); // Retrieves the CAN message from the MOb
    }
}

void timer0_isr(void) {
    can_send(&air_ctrl_critical_msg);
    can_send(&air_ctrl_sense_msg);
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

/*
 * Interrupts
 */
volatile bool shutdown_nodes = 0;

void pcint0_callback(void) {
    //     uint8_t ss_tsms = !!gpio_get_pin(SS_TSMS);
    //     uint8_t ss_imd_latch = !!gpio_get_pin(SS_IMD_LATCH);
    //     uint8_t ss_mpc = !!gpio_get_pin(SS_MPC);
    //     uint8_t ss_hvd_conn = !!gpio_get_pin(SS_HVD_CONN);
    //     uint8_t ss_hvd = !!gpio_get_pin(SS_HVD);
    //
    //     shutdown_nodes = ss_tsms && ss_imd_latch && ss_mpc && ss_hvd_conn
    //         && ss_hvd;
    //
    //     air_ctrl_critical_data[AIR_STATUS] |= (
    //         (ss_tsms << TSMS_SENSE) ||
    //         (ss_imd_latch << IMD_SENSE) ||
    //         (ss_mpc << MAIN_PACK_CONNECTOR_SENSE) ||
    //         (ss_hvd_conn << HVD_CONNECTOR_SENSE) ||
    //         (ss_hvd << HVC_SENSE)
    //     );
}

void pcint1_callback(void) {
    //     bms_st = !!gpio_get_pin(BMS_SENSE);
    //
    //     air_ctrl_critical_data[AIR_STATUS] |= (
    //         (!!gpio_get_pin(AIR_P_WELD_DETECT) << AIR_POS_STATUS) ||
    //         (!!gpio_get_pin(AIR_N_WELD_DETECT) << AIR_NEG_STATUS) ||
    //         (bms_st << BMS_STATUS)
    //     );
}

void pcint2_callback(void) {
    // imd_st = !!gpio_get_pin(IMD_SENSE);
    // air_ctrl_critical_data[AIR_STATUS] |= imd_st << IMD_STATUS;
}

/*
 *
 */
static int initial_checks(void) {
    int rc = 0;

    /*
     * Get MC and BMS voltages
     *
     * Will poll for 1 second and if the CAN message isn't received, will fault
     */
    can_receive(&motor_controller_msg, motor_controller_filter);
    can_receive(&bms_msg, bms_filter);

    int rc_mc = 0, rc_bms = 0;
    uint32_t now = get_time();

    /*
     * This loop waits for up to 1 second (1000ms) to receive both a BMS and a
     * motor controller CAN message. If neither is received, fault_state is set
     * and the function exits.
     */
    do { 
        // If either receive has an error, go into fault
        if ((rc_mc = can_poll_receive(&motor_controller_msg)) == 1) {
            *fault_state = CAN_ERROR;
            rc = 1;
            goto bail;
        }

        if ((rc_mc = can_poll_receive(&bms_msg)) == 1) {
            *fault_state = CAN_ERROR;
            rc = 1;
            goto bail;
        }

        if (get_time() - now > 1000) {
            if (rc_mc == -1) {
                *fault_state = FAULT_CAN_MC_TIMEOUT;
            } else if (rc_bms == -1) {
                *fault_state = FAULT_CAN_BMS_TIMEOUT;
            }
            rc = 1;
            goto bail;
        }
    } while ((rc_mc == -1) || (rc_bms == -1));

    // The following checks ensure that the hardware is in the correct initial
    // state.

    if (gpio_get_pin(AIR_P_WELD_DETECT)) {
        // AIR_P_WELD_DETECT should start low
        *fault_state = FAULT_AIR_P_WELD;
        rc = 1;
        goto bail;
    } else if (gpio_get_pin(AIR_N_WELD_DETECT)) {
        // AIR_N_WELD_DETECT should start low
        *fault_state = FAULT_AIR_N_WELD;
        rc = 1;
        goto bail;
    } else if (!gpio_get_pin(SS_TSMS)) {
        // SS_TSMS should start high
        *fault_state = FAULT_SHUTDOWN_IMPLAUSIBILITY;
        rc = 1;
        goto bail;
    } else if (bms_data[PACK_VOLTAGE] > PACK_THRESHOLD_LOW) {
        // BMS pack voltage should start below the LOW threshold
        *fault_state = FAULT_BMS_VOLTAGE;
        rc = 1;
        goto bail;
    } else if ((motor_controller_data[MC_VOLTAGE_MSB] << 8)
               & (motor_controller_data[MC_VOLTAGE_LSB])
                     > MOTOR_CONTROLLER_THRESHOLD_LOW) {
        // Motor controller voltage should start below the LOW threshold
        *fault_state = FAULT_MOTOR_CONTROLLER_VOLTAGE;
        rc = 1;
        goto bail;
    } else if (gpio_get_pin(IMD_SENSE)) {
        // IMD_SENSE pin should start low
        *fault_state = FAULT_IMD_FAULT;
        rc = 1;
        goto bail;
    }

bail:
    return rc;
}

static void state_machine_run(void) {
    if (!imd_st || !bms_st) {
        *current_state = FAULT;
    }

    switch (*current_state) {
        case IDLE: {
            /*
             * Do nothing. The state will be updated in the pcint0_callback when
             * the TSMS shutdown sense is triggered.
             */
            if (air_ctrl_sense_data[0] & 0x1) {
                *current_state = SHUTDOWN_CIRCUIT_CLOSED;
            }
        } break;
        case SHUTDOWN_CIRCUIT_CLOSED: {
            uint32_t now = get_time();

            do {
                // nothing--state will be changed in an interrupt
            } while (get_time() - now < 200); // Wait 200ms

            if (current_state == SHUTDOWN_CIRCUIT_CLOSED) {
                *current_state = FAULT;
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
                *current_state = FAULT;
            } else {
                gpio_set_pin(AIR_N_LSD); // Close AIR-
                gpio_clear_pin(PRECHARGE_CTL);
                // change_state(TS_ACTIVE);
                *current_state = TS_ACTIVE;
            }

        } break;
        case TS_ACTIVE: {
            // CAN message is updated

            // wait for an interrupt from any of the shutdown sense pins
            if (!shutdown_nodes) {
                *current_state = DISCHARGE;
            }
        } break;
        case DISCHARGE: {
            gpio_clear_pin(AIR_N_LSD);

            uint8_t air_p_detect = gpio_get_pin(AIR_P_WELD_DETECT);
            uint8_t air_n_detect = gpio_get_pin(AIR_N_WELD_DETECT);

            if (air_p_detect && air_n_detect) {
                *current_state = FAULT;
                return;
            } else if (air_p_detect) {
                *current_state = FAULT;
                return;
            } else if (air_n_detect) {
                *current_state = FAULT;
                return;
            }

            uint32_t now = get_time();

            do {
                // nothing
            } while (get_time() - now < 2000); // Wait 2s

            uint16_t mc_voltage;
            memcpy(&mc_voltage, motor_controller_data, sizeof(uint16_t));

            if (mc_voltage < 10) {
                *current_state = IDLE;
            } else {
                *current_state = FAULT;
            }
        } break;
        case FAULT: {
            // cry
        } break;
        default: {
            // Shouldn't happen, but just in case
            *current_state = FAULT;
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

    // Set the fault state and current state address to be the same as the CAN
    // signal so that we don't have to set things twice. Now, setting the
    // fault_state or current_state will also update the CAN message data
    current_state = air_ctrl_critical_msg + 1;
    fault_state = air_ctrl_critical_msg;

    // Initialize states
    *current_state = IDLE;
    *fault_state = FAULT_NONE;

    int rc = initial_checks();
    if (rc == 1) {
        goto fault;
    }

    // Initialize interrupts
    sei();

    while (1) {
        if (run_1ms) {
            state_machine_run();
            run_1ms = false;
        }
    }

fault:
    while (1) {};
}
