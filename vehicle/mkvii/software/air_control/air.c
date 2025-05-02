#include <avr/interrupt.h>
#include <stdbool.h>
#include <stdlib.h>
#include <util/delay.h>

// #include "libs/adc/api.h"
#include "libs/can/api.h"
#include "libs/gpio/api.h"
#include "libs/timer/api.h"

#include "air_config.h"
#include "utils/timer.h"
#include "utils/utils.h"
#include "vehicle/mkvii/software/air_control/can_api.h"

// question: wtf does the bootloader do?
#include "projects/btldr/btldr_lib.h"
#include "projects/btldr/git_sha.h"
#include "projects/btldr/libs/image/api.h"

#include "projects/can_print/can_print.h"

/*
main updates:
- update gpio pins
- condense prev 2 precharge states into 1
- listen to g meter
- change order of initial checks


Tasks
* Hear CAN from G-meter
* Hear CAN from BMS
* Read shutdown node status
* Actuate AIR+
* monitor welding
* monitor IMD status
* Precharge control

State Machine
* Idle - nothing
* Precherge start
  * air closed within 200ms
  * Close precharge realy
  * make sure we hit votlage and time target
* TS active
  * read for shutdown node fault
* Discharge
  * open AIR+ lsd
  * monitor TS voltage
* Error
  * clear all LSDs
  * merge precharge; 200ms, make sure relay is actually closed; after 5 seconds
  * precharge: reaches 90% voltage or times out (then error state)

Keep track these events:
* BMS CAN
* G-meter CAN
* precharge start time
* discharge start time
- also: timer
*/

/*
running list of changes from mkvi airs firmware:
- got rid of set_charger_connected
*/

/*
 * Required for btldr
 */
image_hdr_t image_hdr __attribute__((section(".image_hdr"))) = {
    .image_magic = IMAGE_MAGIC,
    .git_sha = STABLE_GIT_COMMIT,
};

volatile bool send_can = false;

static bool set_fault(enum air_fault_e the_fault) {
    // dual purpose: update CAN fault + return true for fault
    gpio_set_pin(ERROR_LED);

    if (air_control_critical.air_fault == AIR_FAULT_NONE) {
        // Only update fault state for the first fault to occur
        air_control_critical.air_fault = the_fault;
    }
    return true; // returning true for fault state checking
}

void timer0_isr(void) {
    send_can = true;
}

// interrupts for various gpio pins (for ss nodes and errors)
void pcint0_callback(void) {
    air_control_critical.ss_tsms = !gpio_get_pin(SS_TSMS);
    air_control_critical.ss_imd = !gpio_get_pin(SS_IMD_LATCH);
    air_control_critical.ss_mpc = !gpio_get_pin(SS_MPC);
    air_control_critical.ss_tsmp = !gpio_get_pin(SS_TSMP);
    air_control_critical.ss_emeter = !gpio_get_pin(SS_EMETER);
}

void pcint1_callback(void) {
    air_control_critical.air_p_status = !!gpio_get_pin(AIR_P_WELD_DETECT);
    air_control_critical.air_n_status = !!gpio_get_pin(AIR_N_WELD_DETECT);
    air_control_critical.ss_bms = !gpio_get_pin(SS_BMS);
}

void pcint2_callback(void) {
    air_control_critical.ss_hvd = !gpio_get_pin(SS_HVD);
    air_control_critical.imd_status = !!gpio_get_pin(IMD_SENSE);
    if (!air_control_critical.imd_status) {
        set_fault(AIR_FAULT_IMD_STATUS);
    }
}



static bool initial_checks(void) {
    /*
     * INitial Checks -- make sure all nodes are fine
      1) BMS can talk to + battery voltage
      2) TSMS check
      3) G-meter readings
      4) AIR weld check (check if AIR+ or AIR- can't open)
      5) IMD latch check
    */

    bool fault = false;
    ////////////////////////////////////////////////////////////////////////////////////////////////
    ///////////////////////////////////////// 1) BMS check /////////////////////////////////////////
    ////////////////////////////////////////////////////////////////////////////////////////////////
    int16_t bms_voltage = 0;
    int rc = 0;
    // Will poll for 1 second, if the CAN msg not received, will fault
    rc = get_bms_voltage(&bms_voltage);

    if (rc == 1) {
        fault = set_fault(AIR_FAULT_CAN_ERROR);
        can_send_air_control_critical();
        return fault;
    } else if (rc == 2) {
        fault = set_fault(AIR_FAULT_CAN_BMS_TIMEOUT);
        can_send_air_control_critical();
        return fault;
    }

    if (bms_voltage * 4 < BMS_VOLTAGE_THRESHOLD_LOW) {
        fault = set_fault(AIR_FAULT_BMS_VOLTAGE);
        can_send_air_control_critical();
        return fault;
    }

    can_send_air_control_critical();

    ////////////////////////////////////////////////////////////////////////////////////////////////
    //////////////////////////////////////// 2) TSMP check /////////////////////////////////////////
    ////////////////////////////////////////////////////////////////////////////////////////////////
    if (!gpio_get_pin(SS_TSMS)) {
        // SS_TSMS should start high
        air_control_critical.ss_tsms = true;
        fault = set_fault(AIR_FAULT_SHUTDOWN_IMPLAUSIBILITY);
        can_send_air_control_critical();
        return fault;
    }
    can_send_air_control_critical();

    ////////////////////////////////////////////////////////////////////////////////////////////////
    //////////////////////////////////////// 3) GMETER check ///////////////////////////////////////
    ////////////////////////////////////////////////////////////////////////////////////////////////
    int16_t gmeter_voltage = 0;
    rc = get_tractive_voltage(&gmeter_voltage, 1000);

    if (rc == 1) {
        fault = set_fault(AIR_FAULT_CAN_ERROR);
        return fault;
    } else if (rc == 2) {
        fault = set_fault(AIR_FAULT_CAN_GMETER_TIMEOUT);
        fault = true;
        return fault;
    }

    if (gmeter_voltage > TRACTIVE_THRESHOLD_LOW_dV) {
        fault = set_fault(AIR_FAULT_TRACTIVE_VOLTAGE);
        fault = true;
        return fault;
    }

    can_send_air_control_critical();


    ////////////////////////////////////////////////////////////////////////////////////////////////
    /////////////////////////////////////// 4) AIR Weld Check //////////////////////////////////////
    ////////////////////////////////////////////////////////////////////////////////////////////////
    air_control_critical.air_p_status = !!gpio_get_pin(AIR_P_WELD_DETECT);
    air_control_critical.air_n_status = !!gpio_get_pin(AIR_N_WELD_DETECT);

    if (air_control_critical.air_p_status) {
        fault = set_fault(AIR_FAULT_AIR_P_WELD);
        can_send_air_control_critical();
        return fault;
    }
    can_send_air_control_critical();
    if (air_control_critical.air_n_status) {
        fault = set_fault(AIR_FAULT_AIR_N_WELD);
        can_send_air_control_critical();
        return fault;
    }
    can_send_air_control_critical();


    ////////////////////////////////////////////////////////////////////////////////////////////////
    /////////////////////////////////////// 5) IMD latch check /////////////////////////////////////
    ////////////////////////////////////////////////////////////////////////////////////////////////
    // Wait for IMD to stabilize
    _delay_ms(IMD_STABILITY_CHECK_DELAY_MS);

    if (air_control_critical.imd_status) {
        fault = set_fault(AIR_FAULT_IMD_STATUS);
        can_send_air_control_critical();
        return fault;
    }

    can_send_air_control_critical();
    return fault;
}

// TODO: state machine to run through sequence
// --> thinking can pull from old state_machine_run
// --> architecture of old firmware decent
static void state_machine_run(void) {
    if (air_control_critical.air_fault != AIR_FAULT_NONE) {
        air_control_critical.air_state = AIR_STATE_FAULT;
    }

    switch (air_control_critical.air_state) {
        // 1) status idle
        case AIR_STATE_IDLE: {
            // Idle until shutdown circuit is closed
            if (air_control_critical.ss_tsms) {
                air_control_critical.air_state
                    = AIR_STATE_SHUTDOWN_CIRCUIT_CLOSED;
            }
        } break;
        // 2) status circuit closed
        case AIR_STATE_SHUTDOWN_CIRCUIT_CLOSED: {
            // if air negative is closed within 200 ms, proceed to precharge
            // (otherwise fault)

            // ensures that we only call get_time() once because we only want to
            // capture the time that PRECHARGE starts
            static bool once = true;
            if (once) {
                start_time = get_time();
                once = false;
            }

            if (get_time() - start_time < 200) {
                if (air_control_critical.air_n_status) {
                    air_control_critical.air_state = AIR_STATE_PRECHARGE;
                    once = true;
                }
            } else {
                set_fault(AIR_FAULT_SHUTDOWN_IMPLAUSIBILITY);
                air_control_critical.air_state = AIR_STATE_FAULT;
                once = true;
            }
        } break;
        // 3) status precharge
        case AIR_STATE_PRECHARGE: {
            // Start precharge
            gpio_set_pin(PRECHARGE_CTL);

            // Get pack voltage to compare with gmeter voltage
            int16_t pack_voltage = 0;
            int16_t tractive_voltage = 0;
            int rc;

            // thinking we alr check this, but oh well
            rc = get_bms_voltage(&pack_voltage);
            if (rc) { // if not 0
                set_fault(AIR_FAULT_CAN_BMS_TIMEOUT);
                return;
            }
            can_print("bms", pack_voltage);
            can_print("gmeter", tractive_voltage);
            
            /*
             * This pattern ensures that we only call get_time() once because we
             * only want to capture the time that PRECHARGE starts
             */
            static bool once = true;
            if (once) {
                start_time = get_time();
                once = false;
            }

            // if TS voltage above threshold in 5s, TS active; otherwise fault
            if (get_time() - start_time >= PRECHARGE_DELAY_MS) {
                rc = get_tractive_voltage(&tractive_voltage, 500); // 500ms
                                                                   // timeout
                if (rc) {
                    set_fault(AIR_FAULT_CAN_GMETER_TIMEOUT);
                    once = true;
                    return;
                }

                // Set correct scale for gmeter voltage
                can_print("gmeter", tractive_voltage);
                can_print("bms", pack_voltage);

                if (tractive_voltage > (PRECHARGE_THRESHOLD * pack_voltage / 4)) {
                    gpio_set_pin(AIR_P_LSD); // Close AIR positive
                    gpio_clear_pin(PRECHARGE_CTL); // Open precharge relay
                    once = true;
                    air_control_critical.air_state = AIR_STATE_TS_ACTIVE;
                    return;
                } else {
                    once = true;
                    set_fault(AIR_FAULT_PRECHARGE_FAIL);
                    air_control_critical.air_state = AIR_STATE_FAULT;
                    return;
                }
            } else {
                // Yield for timer to complete
                return;
            }
        } break;
        // 4) status TS active
        case AIR_STATE_TS_ACTIVE: {
            // if air positive is closed within 200 ms, stay in AIR_STATE_TS_ACTIVE
            // (otherwise fault)

            // ensures that we only call get_time() once because we only want to
            // capture the time that PRECHARGE starts
            static bool once = true;
            if (once) {
                start_time = get_time();
                once = false;
            }

            if (get_time() - start_time < 200) {
                if (air_control_critical.air_p_status) {
                    once = true;
                }
            } else {
                set_fault(AIR_FAULT_SHUTDOWN_IMPLAUSIBILITY);
                air_control_critical.air_state = AIR_STATE_FAULT;
                once = true;
            }

            // If any of the shutdown nodes open, the SS_TSMS will trigger as
            // well, so we can just read that one (it is the last node in the
            // shutdown circuit.
            if (!air_control_critical.ss_tsms) {
                air_control_critical.air_state = AIR_STATE_DISCHARGE;
            }
        } break;
        // 5) status discharge
        case AIR_STATE_DISCHARGE: {
            gpio_clear_pin(AIR_P_LSD);

            /*
             * This pattern ensures that we only call get_time() once because we
             * only want to capture the time that DISCHARGE starts
             */
            static bool once = true;
            if (once) {
                start_time = get_time();
                once = false;
            }

            // Wait 100ms and then check to make sure both AIRs are open
            if (get_time() - start_time > 100) {
                if (air_control_critical.air_p_status
                    && air_control_critical.air_n_status) {
                    air_control_critical.air_state = AIR_STATE_FAULT;
                    set_fault(AIR_FAULT_BOTH_AIRS_WELD);
                    once = true;
                    return;
                } else if (air_control_critical.air_p_status) {
                    air_control_critical.air_state = AIR_STATE_FAULT;
                    set_fault(AIR_FAULT_AIR_P_WELD);
                    once = true;
                    return;
                } else if (air_control_critical.air_n_status) {
                    air_control_critical.air_state = AIR_STATE_FAULT;
                    set_fault(AIR_FAULT_AIR_N_WELD);
                    once = true;
                    return;
                }
            } else {
                // Hasn't been 100ms yet, continue to the next loop
                return;
            }

            // Both AIRs should be open here

            // Monitor tractive voltage
            int16_t tractive_voltage = 0;

            if (get_time() - start_time < DISCHARGE_TIMEOUT) {
                int rc = get_tractive_voltage(&tractive_voltage, 500);

                if (rc == 1) {
                    set_fault(AIR_FAULT_CAN_ERROR);
                    once = true;
                    return;
                }
                if (rc == 2) {
                    set_fault(AIR_FAULT_CAN_GMETER_TIMEOUT);
                    once = true;
                    return;
                }
                if (rc == 0) {
                    if (tractive_voltage < TRACTIVE_THRESHOLD_LOW_dV) {
                        // Tractive system voltage has fallen below 5V
                        once = true;
                        air_control_critical.air_state = AIR_STATE_IDLE;
                        return;
                    }
                }
            } else {
                // 10 seconds have elapsed and we haven't fallen below the
                // threshold
                set_fault(AIR_FAULT_DISCHARGE_FAIL);
                once = true;
                return;
            }
        } break;
        // 6) status fault
        case AIR_STATE_FAULT: {
            gpio_set_pin(ERROR_LED);
            gpio_clear_pin(PRECHARGE_CTL);
            gpio_clear_pin(AIR_P_LSD);
        } break;
        default: {
            // Shouldn't happen, but just in case
            air_control_critical.air_state = AIR_STATE_FAULT;
        } break;
    }
}

int main(void) {
    can_init_air_control();
    timer_init(&timer0_cfg);
    timer_init(&timer1_cfg);
    updater_init(BTLDR_ID, 5);

    gpio_set_mode(PRECHARGE_CTL, OUTPUT);
    gpio_set_mode(AIR_P_LSD, OUTPUT);
    gpio_set_mode(HEARTBEAT_LED, OUTPUT);
    gpio_set_mode(ERROR_LED, OUTPUT);
    gpio_set_mode(INIT_LED, OUTPUT);

    gpio_set_mode(IMD_SENSE, INPUT);
    gpio_set_mode(SS_TSMS, INPUT);
    gpio_set_mode(SS_IMD_LATCH, INPUT);
    gpio_set_mode(SS_MPC, INPUT);
    gpio_set_mode(SS_BMS, INPUT);
    gpio_set_mode(SS_TSMP, INPUT);
    gpio_set_mode(SS_HVD, INPUT);
    gpio_set_mode(SS_EMETER, INPUT);

    gpio_enable_interrupt(SS_TSMS);
    gpio_enable_interrupt(SS_IMD_LATCH);
    gpio_enable_interrupt(SS_BMS);
    gpio_enable_interrupt(SS_MPC);
    gpio_enable_interrupt(SS_TSMP);
    gpio_enable_interrupt(SS_HVD);
    gpio_enable_interrupt(SS_EMETER);

    gpio_enable_interrupt(IMD_SENSE);

    gpio_enable_interrupt(AIR_N_WELD_DETECT);
    gpio_enable_interrupt(AIR_P_WELD_DETECT);

    // Ensure pull-ups are disabled
    gpio_clear_pin(SS_TSMS);
    gpio_clear_pin(SS_BMS);
    gpio_clear_pin(SS_IMD_LATCH);
    gpio_clear_pin(SS_MPC);
    gpio_clear_pin(SS_TSMP);
    gpio_clear_pin(SS_HVD);
    gpio_clear_pin(SS_EMETER);

    sei();
    air_control_critical.air_state = AIR_STATE_INIT;

    can_send_air_control_critical();

    gpio_set_pin(INIT_LED);

    if (initial_checks()) {
        // copied this fault sequence
        gpio_set_pin(ERROR_LED);

        while (1) {
            // Allow updates in the event of a fault
            updater_loop();

            // Continue senging CAN messages
            if (send_can) {
                can_send_air_control_critical();
                send_can = false;
            }
        };
    }

    // Clear init LED to indicate that initialization has completed
    gpio_clear_pin(INIT_LED);

    // Get initial states of pins
    pcint0_callback();
    pcint1_callback();
    pcint2_callback();

    can_send_air_control_critical();

    air_control_critical.air_state = AIR_STATE_IDLE;

    while (1) {
        if (run_1ms) { // in utils.c
            state_machine_run();
            run_1ms = false;
        }
        // Updates can only occur when the AIR control state machine is in IDLE
        if (air_control_critical.air_state == AIR_STATE_IDLE) {
            updater_loop();
        }
        if (send_can) {
            can_send_air_control_critical();
            send_can = false;
        }
    }
}
