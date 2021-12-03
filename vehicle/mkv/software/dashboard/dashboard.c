/*
    Header:
    Contains code for the dashboard board
    Function: Responsible for AMS and IMD LED Indicators - DONE
                -listening for CAN messages and controlling LED appropriately
            : Start button + LED - DONE
                - based on input off of the physical start button before entering R2D
            : Interface with LED Bars Boards
                - listening for CAN messages and outputting over I2C
            : Implement debugging LEDs (brake, LV, HV) - DONE
                - CAN
            : Implement power cycle logic - Done?
            : CAN Sending

    Questions
*/

#include "dashboard.h"
#include "libs/can/api.h"
#include "libs/gpio/api.h"
#include "libs/timer/api.h"

volatile global bool START_BUTTON_STATE;
volatile global bool HV_STATE;
volatile global bool BRAKE_PRESSED;
volatile global bool READY2DRIVE;

ISR(CAN_INT_vect){
    CANPAGE = (BRAKELIGHT_MBOX << MOBNB0);
    if  (!can_poll_receive(BRAKELIGHT_CAN_FRAME)){
        can_receive(BRAKELIGHT_CAN_FRAME, BRAKELIGHT_FILTER);
        if (BRAKELIGHT_CAN_FRAME.data[4] == 0xFF) {
            BRAKE_PRESSED = true;
            gpio_set_pin(BRAKE_LED);
        }
        else{
            BRAKE_PRESSED = false;
            gpio_clear_pin(BRAKE_LED);
        }

    }
    
    CANPAGE = (BMS_CORE_MBOX << MOBNB0);
    if (!can_poll_receive(BMS_CORE_MBOX)){
        can_receive(BMS_CORE_CAN_FRAME, BMS_CORE_FILTER);
        if (BMS_CORE_CAN_FRAME.data[4] == 0x0){ // check BMS status
            gpio_set_pin(AMS_LED); // set BMS light high
        }
        else{
            gpio_clear_pin(AMS_LED); // clear BMS light
        }
    }

    CANPAGE = (AIRCTRL_CRITICAL_MBOX << MOBNB0);
    if (!can_poll_receive(AIRCTRL_CRITICAL_MBOX){
        can_receive(AIRCTRL_CRITICAL_FRAME, AIRCTRL_CRITICAL_FILTER);
        if (AIRCTRL_CRITICAL_FRAME.data[4] == 0xFF && AIRCTRL_CRITICAL_FRAME.data[5] == 0xFF){
            HV_STATE = true;
            gpio_set_pin(HV_LED); // set HV LED
        }
        else {
            HV_STATE = false;
            READY2DRIVE = false;
            gpio_clear_pin(HV_LED); //clear HV LED
        }
    }

    CANPAGE = (AIRCTRL_SENSE_MBOX << MOBNB0);
    if (!can_poll_receive((AIRCTRL_SENSE_MBOX)){
        can_receive((AIRCTRL_SENSE_FRAME, AIRCTRL_SENSE_FILTER);
        if (AIRCTRL_SENSE_FRAME.data[6] == 0x0) { // check IMD Status
            gpio_set_pin(IMD_LED); // set IMD light high
        }
        else{
            gpio_clear_pin(IMD_LED); // set IMD light low
        }
    }

    CANPAGE = (THROTTLE_MBOX << MOBNB0);
    if (!can_poll_receive(THROTTLE_MBOX)){
        can_receive(THROTTLE__FRAME, THROTTLE_FILTER);
    }
}

void pcint14_callback(void) {
    if (gpio_get_pin(START_BTN){
        START_BUTTON_STATE = true;
        if (HV_STATE && BRAKE_PRESSED) {
            gpio_set_pin(START_LED);
            READY2DRIVE = true;
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

    gpio_set_mode(START_BTN, INPUT);

    //Turn on LV LED
    gpio_set_pin(LV_LED);

    for (;;) {
        steering_pos = adc_read(STEERING_POS);

        if (send_can) {
            can_data[1] = READY2DRIVE ? 0xFF : 0x00;
            can_data[2] = steering_pos;
            can_data[3] = START_BUTTON_STATE ? 0xFF : 0x00;
            can_data[0] = 0;
            dashboard_msg.data = can_data;
            can_send(&dashboard_msg);
            send_can = false;
        }
    }    
}