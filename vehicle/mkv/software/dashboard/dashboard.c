/*
    Header:
    Contains code for the dashboard board
    Function: Responsible for AMS and IMD LED Indicators - DONE
                -listening for CAN messages and controlling LED appropriately
            : Start button + LED - DONE
                - based on input off of the physical start button before entering R2D
            : Interface with LED Bars Boards - TODO
                - listening for CAN messages and outputting over I2C
            : Implement other LEDs (brake, LV, HV) - DONE
                - CAN
            : Implement power cycle logic - DONE
            : Implement RTD Buzzer - DONE


    Questions
*/

#include "dashboard.h"
#include "libs/can/api.h"
#include "libs/gpio/api.h"
#include "libs/timer/api.h"
#include "libs/adc/api.h"

volatile bool START_BUTTON_STATE;
volatile bool HV_STATE;
volatile bool BRAKE_PRESSED;
volatile bool READY2DRIVE;

volatile bool send_can;

volatile int buzzer_counter = 0;
int steering_pos;


// CAN Interrupts
ISR(CAN_INT_vect){
    CANPAGE = (BRAKELIGHT_MBOX << MOBNB0);

    //Brakelight message for Brakelight LED and Brake status for Ready2Drive check
    if  (!can_poll_receive(&BRAKELIGHT_CAN_FRAME)){
        can_receive(&BRAKELIGHT_CAN_FRAME, BRAKELIGHT_FILTER);
        if (BRAKELIGHT_CAN_FRAME.data[4] == 0xFF) {
            BRAKE_PRESSED = true;
            gpio_set_pin(BRAKE_LED);
        }
        else{
            BRAKE_PRESSED = false;
            gpio_clear_pin(BRAKE_LED);
        }

    }
    
    // BMS Core message for BMS Status LED
    CANPAGE = (BMS_CORE_MBOX << MOBNB0);
    if (!can_poll_receive(&BMS_CORE_FRAME)){
        can_receive(&BMS_CORE_FRAME, BMS_CORE_FILTER);
        if (BMS_CORE_FRAME.data[4] == 0x0){ // check BMS status
            gpio_set_pin(AMS_LED); // set BMS light high
        }
        else{
            gpio_clear_pin(AMS_LED); // clear BMS light
        }
    }

    // AIR Control Critical message for HV LED and disabling Ready2Drive if HV goes down
    CANPAGE = (AIRCTRL_CRITICAL_MBOX << MOBNB0);
    if (!can_poll_receive(&AIRCTRL_CRITICAL_FRAME)){
        can_receive(&AIRCTRL_CRITICAL_FRAME, AIRCTRL_CRITICAL_FILTER);
        if (AIRCTRL_CRITICAL_FRAME.data[4] == 0xFF && AIRCTRL_CRITICAL_FRAME.data[5] == 0xFF){
            HV_STATE = true;
            gpio_set_pin(HV_LED); // set HV LED
        }
        else {
            HV_STATE = false;
            READY2DRIVE = false; // Disable RTD
            gpio_clear_pin(HV_LED); //clear HV LED
            buzzer_counter = 0; // reset counter for next RTD cycle
        }
    }

    //AIR Control Sense message for IMD LED
    CANPAGE = (AIRCTRL_SENSE_MBOX << MOBNB0);
    if (!can_poll_receive(&AIRCTRL_SENSE_FRAME)){
        can_receive(&AIRCTRL_SENSE_FRAME, AIRCTRL_SENSE_FILTER);
        if (AIRCTRL_SENSE_FRAME.data[6] == 0x0) { // check IMD Status
            gpio_set_pin(IMD_LED); // set IMD light high
        }
        else{
            gpio_clear_pin(IMD_LED); // set IMD light low
        }
    }

    //Throttle message for interfacing with LED Bars Board - TODO (SPI library)
    CANPAGE = (THROTTLE_MBOX << MOBNB0);
    if (!can_poll_receive(&THROTTLE_FRAME)){
        can_receive(&THROTTLE_FRAME, THROTTLE_FILTER);
    }
}

//Start Button interrupt & final Ready2Drive check
void pcint14_callback(void) {
    if (gpio_get_pin(START_BTN)){
        START_BUTTON_STATE = true;
        if (HV_STATE && BRAKE_PRESSED) {
            gpio_set_pin(START_LED);
            READY2DRIVE = true;
            gpio_set_pin(RTD_BUZZER_LSD); // turn on R2D Buzzer
        }
    }
}

void timer0_callback(void) {
    send_can = true;
}

int main(void) {
    //Initialize and enable interrupts
    sei();
    can_init(BAUD_500KBPS); 
    timer_init(&timer0_cfg);
    adc_init();

    //Set pin modes
    gpio_set_mode(IMD_LED, OUTPUT);
    gpio_set_mode(AMS_LED, OUTPUT);
    gpio_set_mode(START_LED, OUTPUT);
    gpio_set_mode(HV_LED, OUTPUT);
    gpio_set_mode(LV_LED, OUTPUT);
    gpio_set_mode(BRAKE_LED, OUTPUT);
    gpio_set_mode(RTD_BUZZER_LSD, OUTPUT);

    gpio_set_mode(START_BTN, INPUT);

    //Turn on LV LED
    gpio_set_pin(LV_LED);

    for (;;) {
        steering_pos = adc_read(STEERING_POS);

        if (send_can) {
            can_data[1] = READY2DRIVE ? 0xFF : 0x00; // Ready2Drive
            can_data[2] = steering_pos; // Steering Position
            can_data[3] = START_BUTTON_STATE ? 0xFF : 0x00; // Start Button State
            can_data[0] = 0; // Error code
            dashboard_msg.data = can_data;
            can_send(&dashboard_msg);
            send_can = false;

            // Uses timer to measure the 4 seconds to activate the RTD buzzer
            if (READY2DRIVE && buzzer_counter < RTD_BUZZ_TIME) {
               buzzer_counter ++;
            }
            if (buzzer_counter > RTD_BUZZ_TIME){
                gpio_clear_pin(RTD_BUZZER_LSD);
            }
        }
    }    
}