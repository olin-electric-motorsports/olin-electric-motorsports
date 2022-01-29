/*
    Header:
    Contains code for the dashboard board
    Function: Responsible for AMS and IMD LED Indicators - DONE
                -listening for CAN messages and controlling LED appropriately
            : Start button + LED - DONE
                - based on input off of the physical start button before
   entering RTD : Interface with LED Bars Boards - TODO
                - listening for CAN messages and outputting over I2C
            : Implement other LEDs (brake, LV, HV) - DONE
                - CAN
            : Implement power cycle logic - DONE
            : Implement RTD Buzzer - DONE
    Questions:
        Air control message location for IMD
*/

#include "dashboard_config.h"
#include "libs/adc/api.h"
#include "libs/gpio/api.h"
#include "libs/timer/api.h"
#include "vehicle/mkv/software/dashboard/can_api.h"

volatile bool START_BUTTON_STATE;
volatile bool HV_STATE;
volatile bool BRAKE_PRESSED;
volatile bool READYTODRIVE;

volatile bool send_can;
volatile int buzzer_counter = 0;

// Start Button interrupt & final ReadyToDrive check
void pcint1_callback(void) {
    if (gpio_get_pin(START_BTN)) {
        START_BUTTON_STATE = true;
        if (HV_STATE && BRAKE_PRESSED) {
            gpio_set_pin(START_LED);
            READYTODRIVE = true;
            gpio_set_pin(RTD_BUZZER_LSD); // turn on RTD Buzzer
        }
    }
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
    gpio_set_mode(AMS_LED, OUTPUT);
    gpio_set_mode(START_LED, OUTPUT);
    gpio_set_mode(HV_LED, OUTPUT);
    gpio_set_mode(LV_LED, OUTPUT);
    gpio_set_mode(BRAKE_LED, OUTPUT);
    gpio_set_mode(RTD_BUZZER_LSD, OUTPUT);

    gpio_set_mode(START_BTN, INPUT);

    // Enable interrupts
    sei();

    // Turn on LV LED
    gpio_set_pin(LV_LED);

    uint16_t steering_pos;

    for (;;) {
        steering_pos = adc_read(STEERING_POS);

        // Brakelight message for Brakelight LED and
        // check
        if (can_receive_brakelight_bspd() == 0) {
            if (brakelight_bspd.brake_gate == 0xFF) {
                BRAKE_PRESSED = true;
                gpio_set_pin(BRAKE_LED);
            } else {
                BRAKE_PRESSED = false;
                gpio_clear_pin(BRAKE_LED);
            }
        }

        // BMS Core message for BMS Status LED
        if (can_receive_bms_core() == 0) {
            if (bms_core.bms_ok == true) { // check BMS status
                gpio_set_pin(AMS_LED); // set BMS light high
            } else {
                gpio_clear_pin(AMS_LED); // clear BMS light
            }
        }

        // AIR Control Critical message for HV LED and disabling ReadyToDrive if
        // HV goes down
        if (can_receive_air_control_critical() == 0) {
            if (air_control_critical.air_p_status == false
                && air_control_critical.air_n_status == false) {
                HV_STATE = true;
                gpio_set_pin(HV_LED); // set HV LED
            } else {
                HV_STATE = false;
                READYTODRIVE = false; // Disable RTD
                gpio_clear_pin(HV_LED); // clear HV LED
                buzzer_counter = 0; // reset counter for next RTD cycle
            }
        }

        // Is this now under Air Control Critical?
        if (can_receive_air_control_critical() == 0) {
            if (air_control_critical.imd_status == false) {
                gpio_set_pin(IMD_LED); // set IMD light high
            } else {
                gpio_clear_pin(IMD_LED); // set IMD light low
            }
        }

        // Throttle message for interfacing with LED Bars Board - TODO (SPI
        // library)
        if (can_receive_throttle() == 0) {
            // do some stuff here
        }

        if (send_can) {
            dashboard.fault_code = 0;
            dashboard.steering_position = steering_pos & 0xFF;
            dashboard.ready_to_drive = READYTODRIVE ? 0xFF : 0x00;
            dashboard.start_button_state = START_BUTTON_STATE ? 0xFF : 0x00;
            can_send_dashboard();
            send_can = false;

            // Uses timer to measure the 4 seconds to activate the RTD buzzer
            if (READYTODRIVE && buzzer_counter < RTD_BUZZ_TIME) {
                buzzer_counter++;
            }
            if (buzzer_counter > RTD_BUZZ_TIME) {
                gpio_clear_pin(RTD_BUZZER_LSD);
            }
        }
    }
}
