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

#define BMS_FAULT_NONE (0)

volatile bool START_BUTTON_STATE;
volatile bool HV_STATE;
volatile bool BRAKE_PRESSED;
volatile bool READYTODRIVE;

volatile bool send_can;
volatile int buzzer_counter = 0;

// Start Button interrupt & final ReadyToDrive check
void pcint1_callback(void) {
    START_BUTTON_STATE = !!gpio_get_pin(START_BTN);
    dashboard.start_button_state = START_BUTTON_STATE;
}

void timer0_callback(void) {
    send_can = true;
}

int main(void) {
    // Initialization
    can_init(BAUD_500KBPS);
    timer_init(&timer0_cfg);
    adc_init();

    // Set pin modes
    gpio_set_mode(IMD_LED, OUTPUT);
    gpio_set_mode(BMS_LED, OUTPUT);
    gpio_set_mode(START_LED, OUTPUT);
    gpio_set_mode(HV_LED, OUTPUT);
    gpio_set_mode(LV_LED, OUTPUT);
    gpio_set_mode(BRAKE_LED, OUTPUT);
    gpio_set_mode(RTD_BUZZER_LSD, OUTPUT);

    gpio_set_mode(START_BTN, INPUT);

    // Enable interrupts
    sei();
    gpio_enable_interrupt(START_BTN);

    // Turn on LV LED
    gpio_set_pin(LV_LED);

    // Set Error Code
    dashboard.fault_code = 0;

    // Receive CAN Messages
    can_receive_brakelight();
    can_receive_bms_core();
    can_receive_air_control_critical();
    for (;;) {
        dashboard.steering_position = adc_read(STEERING_POS);

        // Brakelight message for Brakelight LED and
        // check
        if (can_poll_receive_brakelight() == 0) {
            if (brakelight.brake_gate) {
                BRAKE_PRESSED = true;
                gpio_set_pin(BRAKE_LED);
            } else {
                BRAKE_PRESSED = false;
                gpio_clear_pin(BRAKE_LED);
            }
            can_receive_brakelight();
        }

        // BMS Core message for BMS Status LED
        if (can_poll_receive_bms_core() == 0) {
            if (bms_core.fault_state == BMS_FAULT_NONE) { // check BMS status
                gpio_set_pin(BMS_LED); // set BMS light high
            } else {
                gpio_clear_pin(BMS_LED); // clear BMS light
            }
            can_receive_bms_core();
        }

        // AIR Control Critical message for HV LED and disabling ReadyToDrive if
        // HV goes down and IMD Status LED
        if (can_poll_receive_air_control_critical() == 0) {
            if (!air_control_critical.air_p_status
                && !air_control_critical.air_n_status) {
                HV_STATE = true;
                gpio_set_pin(HV_LED); // set HV LED
            } else {
                HV_STATE = false;
                READYTODRIVE = false; // Disable RTD
                dashboard.ready_to_drive = false;
                gpio_clear_pin(HV_LED); // clear HV LED
                gpio_clear_pin(START_LED); // clear Start LED
                buzzer_counter = 0; // reset counter for next RTD cycle
            }

            if (!air_control_critical.imd_status) {
                gpio_set_pin(IMD_LED); // set IMD light high
            } else {
                gpio_clear_pin(IMD_LED); // set IMD light low
            }
            can_receive_air_control_critical();
        }

        // Throttle message for interfacing with LED Bars Board - TODO (SPI
        // library)
        // if (can_receive_throttle() == 0) {
        // do some stuff here
        // }

        if (START_BUTTON_STATE && HV_STATE && BRAKE_PRESSED) {
            gpio_set_pin(START_LED);
            READYTODRIVE = true;
            dashboard.ready_to_drive = true;
            gpio_set_pin(RTD_BUZZER_LSD); // turn on RTD Buzzer
        }

        if (send_can) {
            can_send_dashboard();
            send_can = false;

            // Uses timer to measure the 4 seconds to activate the RTD buzzer
            if (READYTODRIVE && (buzzer_counter < RTD_BUZZ_TIME)) {
                buzzer_counter++;
            }
            if (buzzer_counter >= RTD_BUZZ_TIME) {
                gpio_clear_pin(RTD_BUZZER_LSD);
            }
        }
    }
}
