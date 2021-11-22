/*
    Header:
    Contains code for the dashboard board
    Function: Responsible for AMS and IMD LED Indicators
                -listening for CAN messages and controlling LED appropriately
            : Start button + LED
                - based on input off of the physical start button before entering R2D
            : Interface with LED Bars Boards
                - listening for CAN messages and outputting over I2C
            : Implement debugging LEDs (brake, LV, HV)
                - CAN
            : Implement power cycle logic
*/

#include 

ISR(CAN_INT_vect){
    CANPAGE = (BRAKELIGHT_MBOX << MOBNB0);
    if  (!can_poll_receive(BRAKELIGHT_CAN_FRAME)){
        can_receive(BRAKELIGHT_CAN_FRAME, FILTER);
    }
    
    CANPAGE = (BMS_CORE_MBOX << MOBNB0);
    if (!can_poll_receive(BMS_CORE_MBOX)){
        can_receive(BMS_CORE_CAN_FRAME, FILTER)
    }

    CANPAGE = (AIRCTRL_CRITICAL_MBOX << MOBNB0);
    if (!can_poll_receive(AIRCTRL_CRITICAL_MBOX){
        can_receive(AIRCTRL_CRITICAL_FRAME, FILTER)
    }

    CANPAGE = (AIRCTRL_SENSE_MBOX << MOBNB0);
    if (!can_poll_receive((AIRCTRL_SENSE_MBOX)){
        can_receive((AIRCTRL_SENSE_FRAME, FILTER)
    }

    CANPAGE = (THROTTLE_MBOX << MOBNB0);
    if (!can_poll_receive(THROTTLE_MBOX)){
        can_receive(THROTTLE__FRAME, FILTER)
    }
}