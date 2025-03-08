/*
    Header:
    Contains code for the dashboard board
    Function: Responsible for BMS and IMD LED Indicators - DONE
                -listening for CAN messages and controlling LED appropriately
            : Start button + LED - DONE
                - based on input off of the physical start button before
   entering RTD : Interface with LED Bars Boards - TODO
                - listening for CAN messages and outputting over I2C
            : Implement other LEDs (brake, LV, HV) - DONE
                - CAN
            : Implement power cycle logic - DONE
            : Implement RTD Buzzer - DONE
*/

#include "dashboard_config.h"
#include "libs/adc/api.h"
#include "libs/gpio/api.h"
#include "libs/timer/api.h"
#include "vehicle/mkv/software/dashboard/can_api.h"
#include <util/delay.h>


#include "projects/btldr/btldr_lib.h"
#include "projects/btldr/git_sha.h"
#include "projects/btldr/libs/image/api.h"
#include <stdio.h>

/*
 * Required for btldr
 */
image_hdr_t image_hdr __attribute__((section(".image_hdr"))) = {
    .image_magic = IMAGE_MAGIC,
    .git_sha = STABLE_GIT_COMMIT,
};

#define BMS_FAULT_NONE (0)
#define AIR_STATE_TS_ACTIVE (4)

volatile bool START_BUTTON_STATE;
bool HV_STATE;
bool BRAKE_PRESSED;
bool THROTTLE_PRESSED;

volatile bool send_can;
volatile int buzzer_counter = 0;
int dashboard_counter = 0;

// Start Button interrupt & final ReadyToDrive check
void pcint1_callback(void) {
    START_BUTTON_STATE = !gpio_get_pin(START_BTN);
    dashboard.start_button_state = START_BUTTON_STATE;
}

/*
a few ways for heartbeat LED
- use the already used timer below, update a local counter variable for heartbeat blinking
   - would need counter varaible to slow down blinking rate; maybe some logic in main that switches heartbeat status when it his as certain number
      - remember to consider variable scope
- use the second timer peripheral, just for heartbeat LED (advantage, can set specific frequency directly)
- steal RTD_BUZZER_COUNTER logic (reference variable)
*/

void timer0_callback(void) {
    send_can = true; //add blinking timer
}

int main(void) {
    // Initialization
    can_init(BAUD_500KBPS);
    timer_init(&timer0_cfg);

    updater_init(BTLDR_ID, 5);

    // Set pin modes
    gpio_set_mode(IMD_LED, OUTPUT);
    gpio_set_mode(BMS_LED, OUTPUT);
    gpio_set_mode(HV_LED, OUTPUT);

    gpio_set_mode(HEARTBEAT_LED, OUTPUT);

    gpio_set_mode(RTD_BUZZER_LSD, OUTPUT);

    gpio_set_mode(START_BTN, INPUT);
    // gpio_set_pin(START_BTN); // Enable internal pull-up resistor

    gpio_set_mode(BOTS_SS, INPUT);
    gpio_set_mode(ESTOP_SS, INPUT);

    pcint1_callback(); // Set initial condition of hardware

    // Enable interrupts
    sei();
    gpio_enable_interrupt(START_BTN);

    // Turn on LV LED
    gpio_set_pin(HEARTBEAT_LED);

    // Receive CAN Messages
    can_receive_brakelight();
    can_receive_bms_core();
    can_receive_air_control_critical();
    can_receive_throttle();

    for (;;) {
    
        //var BRAKE_PRESSED = ?
        if (can_poll_receive_brakelight() == 0) {
            if (brakelight.brake_gate) {
                BRAKE_PRESSED = true;
            } else {
                BRAKE_PRESSED = false;
            }

            can_receive_brakelight();
        }

        //var THROTTLE_PRESSED = ?
        if (can_poll_receive_throttle() == 0) {
            if ((throttle.throttle_l_pos >= 12)
                || (throttle.throttle_r_pos >= 12)) {
                THROTTLE_PRESSED = true;
            } else {
                THROTTLE_PRESSED = false;
            }

            can_receive_throttle();
        }

        //var bms_core.bms_fault = ?
        if (can_poll_receive_bms_core() == 0) {
            // BMS Core message for BMS Status LED
            can_receive_bms_core();

            if (bms_core.bms_fault != BMS_FAULT_NONE) { // check BMS status
                gpio_set_pin(BMS_LED); // BMS ON means ERROR, we have LED
            } else {
                gpio_clear_pin(BMS_LED); // BMS OFF means OK
            }

            
        }

        //var bair_control_critical.imd_status = ?
        //Do we have HV??
        if (can_poll_receive_air_control_critical() == 0) {
            if (air_control_critical.air_state == AIR_STATE_TS_ACTIVE) {
                HV_STATE = true;
                gpio_set_pin(HV_LED); // set HV LED
            } else {
                HV_STATE = false;
                dashboard.ready_to_drive = false; // Disable RTD
                gpio_clear_pin(HV_LED); // clear HV LED, have LED
                buzzer_counter = 0; // reset counter for next RTD cycle
            }

            if (!air_control_critical.imd_status) {
                gpio_set_pin(IMD_LED); // set IMD light high, have LED
            } else {
                gpio_clear_pin(IMD_LED); // set IMD light low
            }
            can_receive_air_control_critical();
        }
        

        //Final check, BUZZER, and start the car
        if (START_BUTTON_STATE && HV_STATE && BRAKE_PRESSED
            && !THROTTLE_PRESSED) {
            dashboard.ready_to_drive = true;
            gpio_set_pin(RTD_BUZZER_LSD); // turn on RTD Buzzer
        }


        if (send_can) {
            send_can = false;
            can_send_dashboard();
            
            // Uses timer to measure the 4 seconds to activate the RTD buzzer
            if (dashboard.ready_to_drive && (buzzer_counter < RTD_BUZZ_TIME)) {
                buzzer_counter++;
            }
            if (buzzer_counter >= RTD_BUZZ_TIME) {
                gpio_clear_pin(RTD_BUZZER_LSD);
                // add RTD_BUZZ LED
            }

            //heartbeat blinking
            if (dashboard_counter >= DASHBOARD_TIME) {
            gpio_toggle_pin(HEARTBEAT_LED);
            dashboard_counter= 0;
            // _delay_ms(500);
    
        } else {
            dashboard_counter++;
        }
        }

        dashboard.driver_estop_ss = !!gpio_get_pin(ESTOP_SS);
        dashboard.bots_ss= !!gpio_get_pin(BOTS_SS);
    }



        //PRETTY SURE THIS IS WRONG - yap later
            updater_loop();

}
