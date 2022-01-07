#include <avr/interrupt.h>
#include <stdlib.h>
#include <string.h> // memcpy

#include "libs/gpio/api.h"
#include "libs/timer/api.h"

#include "air_config.h"
#include "bsp/timer.h"
#include "bsp/bsp.h"
#include "vehicle/mkv/software/air_control/can_api.h"

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

static void set_fault(enum FaultCode the_fault) {
    air_control_critical.state = FAULT;
    air_control_critical.fault_state = the_fault;
}

// TODO: start as 1 or 0?
// volatile uint8_t imd_st = 1;
// volatile uint8_t bms_st = 1;

/*
 * Interrupts
 */
// void can_isr(void) {
//     if (can_mob_has_interrupt(MOB_MOTOR_CONTROLLER)) {
//         can_poll_receive(
//             &motor_controller_msg); // Retrieves the CAN message from the MOb
//     }
// 
//     if (can_mob_has_interrupt(MOB_BMS)) {
//         can_poll_receive(&bms_msg); // Retrieves the CAN message from the MOb
//     }
// }

void timer0_isr(void) {
    can_send_air_control_critical();
    // can_send(&air_ctrl_critical_msg);
    // can_send(&air_ctrl_sense_msg);
}

void pcint0_callback(void) {
    uint8_t ss_tsms = !!gpio_get_pin(SS_TSMS);
    uint8_t ss_imd_latch = !!gpio_get_pin(SS_IMD_LATCH);
    uint8_t ss_mpc = !!gpio_get_pin(SS_MPC);
    uint8_t ss_hvd_conn = !!gpio_get_pin(SS_HVD_CONN);
    uint8_t ss_hvd = !!gpio_get_pin(SS_HVD);

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
 * Run through initial checks to ensure safe operation. Checks are:
 *  - BMS voltage is close to zero
 *  - Motor controller voltage is close to 0
 *  - Both AIRs are open
 *  - Shutdown circuit is open (SS_TSMS is open)
 *  - IMD is OK
 */
static int initial_checks(void) {
    int rc = 0;

    /*
     * Get MC and BMS voltages
     *
     * Will poll for 1 second and if the CAN message isn't received, will fault
     */
    int16_t bms_voltage = 0;
    rc = get_bms_voltage(&bms_voltage);

    if (rc == 1){
        set_fault(FAULT_CAN_ERROR);
        goto bail;
    } else if (rc == 2) {
        set_fault(FAULT_CAN_BMS_TIMEOUT);
        rc = 1; goto bail;
    }

    if (bms_voltage > BMS_VOLTAGE_THRESHOLD_LOW) {
        set_fault(FAULT_BMS_VOLTAGE);
        rc = 1; goto bail;
    }

    int16_t mc_voltage = 0;
    rc = get_motor_controller_voltage(&mc_voltage);

    if (rc == 1){
        set_fault(FAULT_CAN_ERROR);
        goto bail;
    } else if (rc == 2) {
        set_fault(FAULT_CAN_MC_TIMEOUT);
        rc = 1; goto bail;
    }

    if (mc_voltage > MOTOR_CONTROLLER_THRESHOLD_LOW) {
        set_fault(FAULT_MOTOR_CONTROLLER_VOLTAGE);
        rc = 1; goto bail;
    }

    // The following checks ensure that the hardware is in the correct initial
    // state.
    if (gpio_get_pin(AIR_P_WELD_DETECT)) {
        // AIR_P_WELD_DETECT should start low
        air_control_critical.air_p_status = false;
        set_fault(FAULT_AIR_P_WELD);
        rc = 1; goto bail;
    } else if (gpio_get_pin(AIR_N_WELD_DETECT)) {
        // AIR_N_WELD_DETECT should start low
        air_control_critical.air_n_status = false;
        set_fault(FAULT_AIR_N_WELD);
        rc = 1; goto bail;
    } else if (!gpio_get_pin(SS_TSMS)) {
        // SS_TSMS should start high
        air_control_critical.ss_tsms = true;
        set_fault(FAULT_SHUTDOWN_IMPLAUSIBILITY);
        rc = 1; goto bail;
    } else if (gpio_get_pin(IMD_SENSE)) {
        // IMD_SENSE pin should start low
        air_control_critical.imd_status = false;
        set_fault(FAULT_IMD_FAULT);
        rc = 1; goto bail;
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
            // if (air_ctrl_sense_data[0] & 0x1) {
            //     *current_state = SHUTDOWN_CIRCUIT_CLOSED;
            // }
        } break;
        case SHUTDOWN_CIRCUIT_CLOSED: {
//             uint32_t now = get_time();
// 
//             do {
//                 // nothing--state will be changed in an interrupt
//             } while (get_time() - now < 200); // Wait 200ms
// 
//             if (*current_state == SHUTDOWN_CIRCUIT_CLOSED) {
//                 *current_state = FAULT;
//             }
        } break;
        case PRECHARGE: {
            gpio_set_pin(PRECHARGE_CTL);

            // Get BMS and MC CAN messages
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
    air_control_can_init();
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
    // *current_state = air_ctrl_critical_msg + 1;
    // *fault_state = air_ctrl_critical_msg;

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
