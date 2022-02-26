/* 
* lvbms fimrware image
* author: adi ramachandran
* AVR libs courtesy of Jack G & rest of OEM FSAE team
* 
* todo: 
* fault checking
* PWM 
* fault state LED timing
* LTC 
* entire state machine and transitions
* CAN interface + message setup
* differentiating between cooling / GLV  
* testing on real HW lmao 
* reset seconds_counter on every switch back to idle
*/

#include "lvbms_config.h"
#include "libs/adc/api.h"
#include "libs/gpio/api.h"
#include "libs/timer/api.h"
#include "vehicle/mkv/software/lvbms/can_api.h" // TODO: why?? 
#include "avr/interrupt.h"

volatile lvbms_state SYSTEM_STATE = IDLE; 
volatile uint8_t    adc_ptr     = 0; 
volatile uint16_t   adc_data[7] = { 0 }; 
uint32_t            seconds_counter         = 0; 
volatile uint8_t    fault_flag  = 0x00; 

/* 
* FAULT FLAGS (TODO: is it ok to have more than 8 flags)
* 0x01:6   thermistor error 
* 0x07     OV error
* 0x08     UV error
* 0x09     OC error
* 0x0A     comp error 
*/

void wake(){
    // clear the SE bit in sleep mode reg
    SMCR &= 0x00; // clear SE bit 
}

/* pg 71 atmega datasheet*/
void enable_external_interrupts(){
    EICRA &= 0x00; // set that low level of INT1,2,3 generates an interrupt request
    EIMSK |= 0b000000110; // enable interrupt INT2 and INT1 
} // peek the EIFR to check which INT triggered your wakeup 


void enable_STANDBY_mode(){
    SMCR |= 0x01; // set SE the bit 
    SMCR |= 0x0D; // sets Atmega into STANDBY mode
}



void gpio_init(){
    gpio_set_mode(LED_0,            OUTPUT); 
    gpio_set_mode(LED_1,            OUTPUT); 
    gpio_set_mode(LED_2,            OUTPUT); 
    gpio_set_mode(CAN_STBY,         OUTPUT); 
    gpio_set_mode(ON_STATE_FET_DRV, OUTPUT);
    gpio_set_mode(LOAD_SW_FET_DRV,  OUTPUT); 
    // gpio_set_mode(SPI_CSB        OUTPUT); 

    gpio_set_mode(COMP_1_IN,        INPUT); 
    gpio_set_mode(COMP_1_IN,        INPUT); 
}

void timer0_IDLE_callback(void){
    collect_telem(); 
    // send_CAN(); // TODO filler 
    if (SYSTEM_STATE == IDLE){
        seconds_counter ++; 
    }
}

void adc_callback(void){
    // read value
    adc_poll_complete(adc_data[adc_ptr]); 

    // check adc_ptr & accordingly start next conversion 
    if (adc_ptr==6){
        adc_ptr = 0; // reset to 0
    } else {
        adc_ptr += 1; 
        adc_start_convert(adc_pins[adc_ptr]); 
    }
}

/* interrupt handler for COMP 2 (CHARGING) 
 * should be called on wakeup 

*/
ISR(INT2_vect){
    SYSTEM_STATE = IDLE;

    
}


/* interrupt handler for COMP 1 (DISCHARGING) 
 * should be called on wakeup 

*/
ISR(INT1_vect){
    SYSTEM_STATE = IDLE; 

}

/* 
* init LTC chip - SPI? 
* ref: 
* https://github.com/analogdevicesinc/Linduino/blob/master/LTSketchbook/libraries/LTC6810/LTC6810.h
* 
*/
void init_LTC(){
    
    LTC6810_init_cfg(); 
    // set config reg bits in LTC 
    LTC6810_set_cfgr(
        0, 
        0, 
    ); 

    // selftests? 
    LTC6810_adstatd(MD_7KHZ_3KHZ, ); 

    // muting / unmuting discharge transistors? 
    LTC6810_mute(); 


    
}

/* sample thermistor ADC's, sample current sensor ADC, !LTC! */
void collect_telem(){
    // begin lvbms ADC conversion chain 
    adc_start_convert(adc_pins[adc_ptr]); 

    // start ADC conversion on LTC chip for cells 1-4
    LTC6810_adcv(); 
    LTC6810_adcv();  
    LTC6810_adcv();  
    LTC6810_adcv();  
    LTC6810_check_pec(); 

/* 
// why not use LTC6810_adcvsc() w SoC conversion too? 
or LTC6810_pollAdc() blocking fn? 
TODO: 
look into datasheet + .cpp on ADC config setup & how we interface with polling
look into datasheet on balancing code? 
*/

    


}

/* check for OT, UT, OV, UV, comparator error */ 
void fault_check(){
    // OT checks 
    for (int i = 0; i < 6; i++){
        if (adc_data[i]>OT_THRESHOLD){
            fault_flag |= (i+1); 
        }
    }

    // OV checks 

    // UV checks 

    // OC checks 
    if (adc_data[7] > OC_THRESHOLD) {
        fault_flag |= OC_FAULT; 
    }   

    // comperator error check 
    if (gpio_get_pin(COMP_1_IN) == 0 && gpio_get_pin(COMP_2_IN) == 0){
        fault_flag |= COMPARATOR_FAULT; 
    }

    if (fault_flag ~= 0){
        SYSTEM_STATE = FAULT; 
    }
}

/* set LEDs based on system state & fault state */
void drive_leds(){
    // always drive LED_0 on
    gpio_set_pin(LED_0); 
    // drive LED_1 based on charge / discharge 
    if (SYSTEM_STATE == CHARGING || SYSTEM_STATE == DISCHARING){
        gpio_set_pin(LED_1); 
    }else {
        gpio_clear_pin(LED_1); 
    }
    // drive LED_2 based on fault state  
    if (SYSTEM_STATE == FAULT){
        gpio_set_pin(LED_2); 
    }
}

// TODO: is this semantically correct? 
void check_state_transition(){

}

void drive_fan(){}


void prepare_CAN_msg(){

}

/* needs better name */
void system_ON(){
    // set CANTRx into normal mode 
    gpio_clear_pin(CAN_STBY); 
    // enable onstate cmpnts
    gpio_set_pin(ON_STATE_FET_DRV); 
}

void system_OFF(){
    // set CANTRx into STBY
    gpio_set_pin(CAN_STBY); 
    // disable onstate cmpnts
    gpio_clear_pin(ON_STATE_FET_DRV); 

}


int main(void){

    // SYSTEM_STATE should be IDLE
    // this code is called only on first power up
    sei(); 
    adc_init(); 
    adc_interrupt_enable(adc_callback); 
    gpio_init(); 
    enable_external_interrupts(); 

    while(1){

        // regardless of state, always: 
        drive_leds(); 


        switch(SYSTEM_STATE){
            case STANDBY: 
                enable_STANDBY_mode(); 
                break; 
            case IDLE:
                if (seconds_counter > 59){
                    // once CTC IDLE timer has completed 60 times, send system from IDLE into STANDBY state
                    SYSTEM_STATE = STANDBY; 
                }
                
                break; 
            case CHARGING: 
                
                break; 
            case DISCHARING: 
                break; 
            default: 
                break; 
        }
    }
}