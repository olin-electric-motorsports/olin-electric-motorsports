#include <avr/interrupt.h>
#include <stdlib.h>
#include <util/delay.h>

#include "libs/gpio/api.h"
#include "libs/timer/api.h"

#include "air_config.h"
#include "utils/timer.h"
#include "utils/utils.h"
#include "vehicle/mkv/software/air_control/can_api.h"

#include "projects/btldr/btldr_lib.h"
#include "projects/btldr/git_sha.h"
#include "projects/btldr/libs/image/api.h"

/*
 * Required for btldr
 */
image_hdr_t image_hdr __attribute__((section(".image_hdr"))) = {
    .image_magic = IMAGE_MAGIC,
    .git_sha = STABLE_GIT_COMMIT,
};

enum State {
    INIT = 0,
    IDLE,
    SHDN_CLOSED,
    PRECHARGE,
    TS_ACTIVE,
    DISCHARGE,
    FAULT,

    CHARGING_IDLE,
    CHARGING_SHDN_CLOSED,
    CHARGING_ACTIVE,
};

enum FaultCode {
    AIR_FAULT_NONE = 0x00,
    AIR_FAULT_AIR_N_WELD,
    AIR_FAULT_AIR_P_WELD,
    AIR_FAULT_BOTH_AIRS_WELD,
    AIR_FAULT_PRECHARGE_FAIL,
    AIR_FAULT_DISCHARGE_FAIL,
    AIR_FAULT_PRECHARGE_FAIL_RELAY_WELDED, // TODO?
    AIR_FAULT_CAN_ERROR,
    AIR_FAULT_CAN_BMS_TIMEOUT,
    AIR_FAULT_CAN_MC_TIMEOUT,
    AIR_FAULT_SHUTDOWN_IMPLAUSIBILITY,
    AIR_FAULT_MOTOR_CONTROLLER_VOLTAGE,
    AIR_FAULT_BMS_VOLTAGE,
    AIR_FAULT_IMD_STATUS,
};

static void set_fault(enum FaultCode the_fault) {
    gpio_set_pin(FAULT_LED);

    if (air_control_critical.air_fault == AIR_FAULT_NONE) {
        // Only update fault state for the first fault to occur
        air_control_critical.air_fault = the_fault;
    }
}

/*
 * Interrupts
 */
volatile bool send_can = false;

void timer0_isr(void) {
    send_can = true;
}

void pcint0_callback(void) {
    air_control_critical.ss_tsms = !gpio_get_pin(SS_TSMS);
    air_control_critical.ss_imd = !gpio_get_pin(SS_IMD_LATCH);
    air_control_critical.ss_mpc = !gpio_get_pin(SS_MPC);
    air_control_critical.ss_hvd_conn = !gpio_get_pin(SS_HVD_CONN);
    air_control_critical.ss_hvd = !gpio_get_pin(SS_HVD);
}

void pcint1_callback(void) {
    air_control_critical.ss_bms = !gpio_get_pin(SS_BMS);
    air_control_critical.air_p_status = !!gpio_get_pin(AIR_P_WELD_DETECT);
    air_control_critical.air_n_status = !!gpio_get_pin(AIR_N_WELD_DETECT);
}

void pcint2_callback(void) {
    if (!gpio_get_pin(IMD_SENSE)) {
        set_fault(AIR_FAULT_IMD_STATUS);
        air_control_critical.imd_status = false;
    }
}

/*
 * Run through initial checks to ensure safe operation. Checks are:
 *  - BMS voltage is above minimum
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

    if (rc == 1) {
        set_fault(AIR_FAULT_CAN_ERROR);
        goto bail;
    } else if (rc == 2) {
        set_fault(AIR_FAULT_CAN_BMS_TIMEOUT);
        rc = 1;
        goto bail;
    }

    if (bms_voltage < BMS_VOLTAGE_THRESHOLD_LOW) {
        set_fault(AIR_FAULT_BMS_VOLTAGE);
        rc = 1;
        goto bail;
    }

    int16_t mc_voltage = 0;
    rc = get_motor_controller_voltage(&mc_voltage);

    if (rc == 1) {
        set_fault(AIR_FAULT_CAN_ERROR);
        goto bail;
    } else if (rc == 2) {
        set_fault(AIR_FAULT_CAN_MC_TIMEOUT);
        rc = 1;
        goto bail;
    }

    if (mc_voltage > MOTOR_CONTROLLER_THRESHOLD_LOW_dV) {
        set_fault(AIR_FAULT_MOTOR_CONTROLLER_VOLTAGE);
        rc = 1;
        goto bail;
    }

    // The following checks ensure that the hardware is in the correct initial
    // state.
    air_control_critical.air_p_status = !!gpio_get_pin(AIR_P_WELD_DETECT);
    air_control_critical.air_n_status = !!gpio_get_pin(AIR_N_WELD_DETECT);

    if (air_control_critical.air_p_status) {
        set_fault(AIR_FAULT_AIR_P_WELD);
        rc = 1;
        goto bail;
    }

    if (air_control_critical.air_n_status) {
        set_fault(AIR_FAULT_AIR_N_WELD);
        rc = 1;
        goto bail;
    }

    if (!gpio_get_pin(SS_TSMS)) {
        // SS_TSMS should start high
        air_control_critical.ss_tsms = true;
        set_fault(AIR_FAULT_SHUTDOWN_IMPLAUSIBILITY);
        rc = 1;
        goto bail;
    }

    // Wait for IMD to stabilize
    _delay_ms(IMD_STABILITY_CHECK_DELAY_MS);

    if (!gpio_get_pin(IMD_SENSE)) {
        // IMD_SENSE pin should start high
        air_control_critical.imd_status = false;
        set_fault(AIR_FAULT_IMD_STATUS);
        rc = 1;
        goto bail;
    } else {
        air_control_critical.imd_status = true;
    }

bail:
    return rc;
}

static void state_machine_run(void) {
    if (air_control_critical.air_fault != AIR_FAULT_NONE) {
        air_control_critical.air_state = FAULT;
    }

    switch (air_control_critical.air_state) {
        case IDLE: {
            // Idle until shutdown circuit is closed
            if (air_control_critical.ss_tsms) {
                air_control_critical.air_state = SHDN_CLOSED;
            }

            /*
             * BMS emits a "charger_connected" signal that instructs the AIR
             * controller to go into charging
             */
            if (can_poll_receive_bms_charging() == 0) {
                if (bms_charging.charger_connected) {
                    air_control_critical.air_state = CHARGING_IDLE;
                }
                can_receive_bms_charging();
            }
        } break;
        case SHDN_CLOSED: {
            /*
             * This pattern ensures that we only call get_time() once because we
             * only want to capture the time that PRECHARGE starts
             */
            static bool once = true;

            if (once) {
                start_time = get_time();
                once = false;
            }

            if (get_time() - start_time < 200) {
                if (air_control_critical.air_p_status) {
                    air_control_critical.air_state = PRECHARGE;
                    once = true;
                }
            } else {
                set_fault(AIR_FAULT_SHUTDOWN_IMPLAUSIBILITY);
                once = true;
            }
            return;
        } break;
        case PRECHARGE: {
            // Start precharge
            gpio_set_pin(PRECHARGE_CTL);

            // Get pack voltage to compare with MC voltage
            int16_t pack_voltage = 0;
            int16_t motor_controller_voltage = 0;
            int rc;

            rc = get_bms_voltage(&pack_voltage);

            if (rc != 0) {
                set_fault(AIR_FAULT_CAN_BMS_TIMEOUT);
                return;
            }

            // Set correct scale for pack voltage
            pack_voltage = (pack_voltage << 8) * 0.0001; // (x << 8 == x * 256)

            /*
             * This pattern ensures that we only call get_time() once because we
             * only want to capture the time that PRECHARGE starts
             */
            static bool once = true;
            if (once) {
                start_time = get_time();
                once = false;
            }

            if (get_time() - start_time >= PRECHARGE_DELAY_MS) {
                rc = get_motor_controller_voltage(&motor_controller_voltage);
                if (rc != 0) {
                    set_fault(AIR_FAULT_CAN_MC_TIMEOUT);
                    once = true;
                    return;
                }

                // Set correct scale for MC voltage
                motor_controller_voltage = motor_controller_voltage * 0.1;

                if (motor_controller_voltage
                    > (PRECHARGE_THRESHOLD * pack_voltage)) {
                    gpio_set_pin(AIR_N_LSD); // Close AIR_N
                    gpio_clear_pin(PRECHARGE_CTL); // Close precharge relay
                    once = true;
                    air_control_critical.air_state = TS_ACTIVE;
                    return;
                } else {
                    once = true;
                    set_fault(AIR_FAULT_PRECHARGE_FAIL);
                    return;
                }
            } else {
                // Yield for timer to complete
                return;
            }
        } break;
        case TS_ACTIVE: {
            // If any of the shutdown nodes open, the SS_TSMS will trigger as
            // well, so we can just read that one (it is the last node in the
            // shutdown circuit.
            if (!air_control_critical.ss_tsms) {
                air_control_critical.air_state = DISCHARGE;
            }
        } break;
        case DISCHARGE: {
            gpio_clear_pin(AIR_N_LSD);

            /*
             * This pattern ensures that we only call get_time() once because we
             * only want to capture the time that PRECHARGE starts
             */
            static bool once = true;

            if (once) {
                start_time = get_time();
                once = false;
            }

            if (get_time() - start_time > 100) {
                if (air_control_critical.air_p_status
                    && air_control_critical.air_n_status) {
                    air_control_critical.air_state = FAULT;
                    set_fault(AIR_FAULT_BOTH_AIRS_WELD);
                    once = true;
                    return;
                } else if (air_control_critical.air_p_status) {
                    air_control_critical.air_state = FAULT;
                    set_fault(AIR_FAULT_AIR_P_WELD);
                    once = true;
                    return;
                } else if (air_control_critical.air_n_status) {
                    air_control_critical.air_state = FAULT;
                    set_fault(AIR_FAULT_AIR_N_WELD);
                    once = true;
                    return;
                }
            }

            int16_t motor_controller_voltage = 0;

            // Wait for 10 seconds while the motor controller discharges
            if (get_time() - start_time < DISCHARGE_TIMEOUT) {
                int rc
                    = get_motor_controller_voltage(&motor_controller_voltage);

                if (rc == 2) {
                    // Timeout
                    set_fault(AIR_FAULT_CAN_MC_TIMEOUT);
                    once = true;
                }
                return;
            }

            int rc = get_motor_controller_voltage(&motor_controller_voltage);

            if (rc != 0) {
                set_fault(AIR_FAULT_CAN_MC_TIMEOUT);
                once = true;
                return;
            }

            if (motor_controller_voltage < MOTOR_CONTROLLER_THRESHOLD_LOW_dV) {
                once = true;
                air_control_critical.air_state = IDLE;
                return;
            } else {
                set_fault(AIR_FAULT_DISCHARGE_FAIL);
                once = true;
                return;
            }
        } break;
        case FAULT: {
            gpio_set_pin(FAULT_LED);
            gpio_clear_pin(PRECHARGE_CTL);
            gpio_clear_pin(AIR_N_LSD);
        } break;

        /// CHARGING

        case CHARGING_IDLE: {
            if (air_control_critical.ss_tsms) {
                air_control_critical.air_state = CHARGING_SHDN_CLOSED;
            }

            return;
        } break;
        case CHARGING_SHDN_CLOSED: {
            static bool once = true;

            if (once) {
                start_time = get_time();
                once = false;
            }

            if (get_time() - start_time < 200) {
                if (air_control_critical.air_p_status) {
                    air_control_critical.air_state = CHARGING_ACTIVE;
                    once = true;
                }
            } else {
                set_fault(AIR_FAULT_SHUTDOWN_IMPLAUSIBILITY);
                once = true;
            }
            return;
        } break;
        case CHARGING_ACTIVE: {
            gpio_set_pin(AIR_N_LSD);

            if (can_poll_receive_bms_charging() == 0) {
                if (bms_charging.charger_connected == false) {
                    gpio_clear_pin(AIR_N_LSD);
                    air_control_critical.air_state = CHARGING_IDLE;
                }
            }

            // If charger disconnected, back to CHARGING_IDLE
            return;
        } break;
        default: {
            // Shouldn't happen, but just in case
            air_control_critical.air_state = FAULT;
        } break;
    }
}

int main(void) {
    can_init_air_control();
    timer_init(&timer0_cfg);
    timer_init(&timer1_cfg);
    updater_init(BTLDR_ID, 5);

    gpio_set_mode(PRECHARGE_CTL, OUTPUT);
    gpio_set_mode(AIR_N_LSD, OUTPUT);
    gpio_set_mode(GENERAL_LED, OUTPUT);
    gpio_set_mode(FAULT_LED, OUTPUT);

    gpio_set_mode(IMD_SENSE, INPUT);
    gpio_set_mode(SS_TSMS, INPUT);
    gpio_set_mode(SS_IMD_LATCH, INPUT);
    gpio_set_mode(SS_BMS, INPUT);
    gpio_set_mode(SS_MPC, INPUT);
    gpio_set_mode(SS_HVD_CONN, INPUT);
    gpio_set_mode(SS_HVD, INPUT);

    gpio_enable_interrupt(SS_TSMS);
    gpio_enable_interrupt(SS_IMD_LATCH);
    gpio_enable_interrupt(SS_BMS);
    gpio_enable_interrupt(SS_MPC);
    gpio_enable_interrupt(SS_HVD_CONN);
    gpio_enable_interrupt(SS_HVD);
    gpio_enable_interrupt(IMD_SENSE);
    gpio_enable_interrupt(AIR_N_WELD_DETECT);
    gpio_enable_interrupt(AIR_P_WELD_DETECT);

    // Ensure pull-ups are disabled
    gpio_clear_pin(SS_TSMS);
    gpio_clear_pin(SS_BMS);
    gpio_clear_pin(SS_IMD_LATCH);
    gpio_clear_pin(SS_MPC);
    gpio_clear_pin(SS_HVD_CONN);
    gpio_clear_pin(SS_HVD);

    updater_init(BTLDR_ID, 5);
    air_control_critical.air_state = INIT;

    // Initialize interrupts
    sei();

    // Set LED to indicate initial checks will be run
    gpio_set_pin(GENERAL_LED);

    // Send message once before checks
    can_send_air_control_critical();
    can_receive_bms_charging();

    if (initial_checks() == 1) {
        goto fault;
    }

    pcint0_callback();
    pcint1_callback();
    pcint2_callback();

    // Clear LED to indicate that initial checks passed
    gpio_clear_pin(GENERAL_LED);

    // Send message again after initial checks are run
    can_send_air_control_critical();

    air_control_critical.air_state = IDLE;

    while (1) {
        // Run state machine every 1ms
        if (run_1ms) {
            state_machine_run();
            run_1ms = false;
        }

        if (air_control_critical.air_state == IDLE) {
            updater_loop();
        }

        if (send_can) {
            can_send_air_control_critical();
            send_can = false;
        }
    }

fault:
    gpio_set_pin(FAULT_LED);

    while (1) {
        /*
         * Continue senging CAN messages
         */

        updater_loop();

        if (send_can) {
            can_send_air_control_critical();
            send_can = false;
        }
    };
}
