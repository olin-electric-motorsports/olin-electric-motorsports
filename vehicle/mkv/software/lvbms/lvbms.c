/* 
* lvbms fimrware image
* author: adi ramachandran
* AVR libs courtesy of Jack G & rest of OEM FSAE team
* 
* 

Code tests: 
can we exist in IDLE and just flash an LED accordingly. 
can we time out of IDLE into STANDBY
can we wakeup from IDLE to STANDBY 


* todo: 
* complete CAN setup
* complete LTC impl
* PWM 
* entire state machine and transitions
* differentiating between cooling / GLV  
* continue testing on real HW lmao 
* reset ms_counter on every switch back to idle
*/

#include "lvbms_config.h"
#include "libs/adc/api.h"
#include "libs/gpio/api.h"
#include "libs/timer/api.h"
#include "vehicle/mkv/software/lvbms/can_api.h" // TODO: why?? 
#include "avr/interrupt.h"

volatile lvbms_state SYSTEM_STATE = IDLE; 
volatile uint8_t    adc_ptr     = 0; 
uint16_t            adc_data[7] = { 0 }; // todo used to be voltatile
uint64_t            ms_counter         = 0; 
volatile uint8_t    fault_flag  = 0x00; 
uint8_t             one_second_passed = true; 

/* 
* FAULT FLAGS (TODO: is it ok to have more than 8 flags)
* 0x01:6   thermistor error 
* 0x07     OV error
* 0x08     UV error
* 0x09     OC error
* 0x0A     comp error 
*/

void system_ON(void); 
void system_OFF(void); 


void wake(){
    // clear the SE bit in sleep mode reg
    SMCR &= 0x00; // clear SE bit 
}

/* pg 71 atmega datasheet*/
void enable_external_interrupts(){
    EICRA &= 0x00; // set that low level of INT1,2,3 generates an interrupt request
    EIMSK |= 0b000000110; // enable interrupt INT2 and INT1 
} // peek the EIFR to check which INT triggered your wakeup 


// Do gpios stay set and cleared in STBY?? 
// does code still run in STBY? 
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
    ms_counter = (ms_counter + 1)%6000; // resets after 1 min
    // ms_counter ++; 
}

void adc_callback(void){
    // read value
    adc_poll_complete(&adc_data[adc_ptr]); 

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
    system_ON(); 
   
}


/* interrupt handler for COMP 1 (DISCHARGING) 
 * should be called on wakeup 

*/
ISR(INT1_vect){
    SYSTEM_STATE = IDLE; 
    system_ON(); 

}

/* 
* init LTC chip - SPI? 
* ref: 
* https://github.com/analogdevicesinc/Linduino/blob/master/LTSketchbook/libraries/LTC6810/LTC6810.h
* 
*/
// void LTC_init(){
    
//     LTC6810_init_cfg(); 
//     // set config reg bits in LTC 
//     LTC6810_set_cfgr(
//         0, 
//         0, 
//     ); 

//     // selftests? 
//     LTC6810_adstatd(MD_7KHZ_3KHZ, ); 

//     // muting / unmuting discharge transistors? 
//     LTC6810_mute(); 

// }


/* Request & poll ADC voltages & check those voltages - Jack's BMS code heavily referenced*/
void LTC_voltage_task(){

    wakeup_sleep(NUM_ICS); 

    // start ADC conversion on LTC chip for cells 1-6, & SoC 
    LTC6810_adcvsc(MD_7KHZ_3KHZ, DCP_DISABLED); 
    
    (void)LTC6810_pollAdc(); 

    uint8_t num_pec_errors = LTC6810_rdcv(REG_ALL, NUM_ICS, ICS); // ensure ICS are initialized to store data

    lvbms.pec_error_count += num_pec_errors; 

    uint16_t pack_voltage = 0;
    uint32_t uv = 0;
    uint32_t ov = 0;

    pack_voltage += ICS[ic].stat.stat_codes[0]
            - ICS[ic].cells.c_codes[4]
            - ICS[ic].cells.c_codes[5]

    uv = (ICS[ic].stat.flags[0] & 0x55) | (ICS[ic].stat.flags[1] & 0x55)
            | (ICS[ic].stat.flags[2] & 0x55);

    // Even bits of the ST register are used for overvoltage flags
    ov = (ICS[ic].stat.flags[0] & 0xAA) | (ICS[ic].stat.flags[1] & 0xAA)
            | (ICS[ic].stat.flags[2] & 0xAA);

    if (uv > 0) {
        enter_fault_state(UV_FAULT);
    } else if (ov > 0) {
        enter_fault_state(OV_FAULT);
    }

    lvbms.pack_soc = pack_voltage; 

/* TODO: look into datasheet on balancing code? something discharge registers */    
}

/* sample thermistor ADC's, sample current sensor ADC, !LTC! */
void collect_telem(){
    // begin lvbms ADC conversion chain 
    adc_start_convert(adc_pins[adc_ptr]); 
    // ltc_voltage_task(); 
}




/* check for OT, UT, OV, UV, comparator error */ 
// void fault_check(){
//     // OT checks 
//     for (int i = 0; i < 6; i++){
//         if (adc_data[i]>OT_THRESHOLD){
//             enter_fault_state(i+1); 
//         }
//     }

//     // OV checks 

//     // UV checks 

//     // OC checks 
//     if (adc_data[7] > OC_THRESHOLD) {
//         enter_fault_state(OC_FAULT); 
//     }   

//     // comperator error check 
//     if (gpio_get_pin(COMP_1_IN) == 0 && gpio_get_pin(COMP_2_IN) == 0){
//         enter_fault_state(COMPARATOR_FAULT); 
//     }
// }

/* fault handling */
void enter_fault_state(fault_flags fault){
    SYSTEM_STATE = FAULT; 
    lvbms.fault_code |= fault; 
}

/* set LEDs based on system state & fault state */
void drive_leds(){
    // always flash LED_0
    if ((ms_counter / 50)%2 == 0){
        gpio_clear_pin(LED_0); 
    } else {
        gpio_set_pin(LED_0); 
    }

    // drive LED_1 based on charge / discharge 
    if (SYSTEM_STATE == CHARGING || SYSTEM_STATE == DISCHARING){
        gpio_set_pin(LED_1); 
    }else {
        gpio_clear_pin(LED_1); 
    }

    // drive LED_2 based on fault state  
    if (SYSTEM_STATE == FAULT){
        gpio_set_pin(LED_2); 
    } else {
        gpio_clear_pin(LED_2); 
    }
}

// TODO: is this semantically correct? 
/* contains comparator logic */
void check_state_transition(){
    uint8_t comp_1 = gpio_get_pin(COMP_1_IN); 
    uint8_t comp_2 = gpio_get_pin(COMP_2_IN); // TODO is return uint8_t 

    if (comp_1 & comp_2){
        // both comparators high, remain in IDLE
    } else if (comp_1 & ~comp_2){
        // transition to CHARGING

    } else if (comp_2 & ~comp_1){
        // transition to DISCHARGING

    } else if (~comp_1 & ~comp_2){
        enter_fault_state(COMPARATOR_FAULT); 
    }
}

void drive_fan(){}



/* called on transition from STANDBY to IDLE */
void system_ON(){
    
    wake(); 
    // set CANTRx into normal mode 
    gpio_clear_pin(CAN_STBY); 
    // enable onstate cmpnts
    gpio_set_pin(ON_STATE_FET_DRV); 
}

/* called on transition to STANDBY */
void system_OFF(){
    // set CANTRx into STBY
    gpio_set_pin(CAN_STBY); 
    // disable onstate cmpnts
    gpio_clear_pin(ON_STATE_FET_DRV); 
    // ensure all LED's are off
    gpio_clear_pin(LED_0); 
    gpio_clear_pin(LED_1); 
    gpio_clear_pin(LED_2); 
    // enter STANDBY
    enable_STANDBY_mode(); 
}


int main(void){

    // SYSTEM_STATE should be IDLE
    // this code is called only on first power up
    sei(); 
    // adc_init(); 
    // adc_interrupt_enable(adc_callback); 
    gpio_init(); 
    timer_init(&timer0_IDLE_ctc_cfg); 
    enable_external_interrupts(); 
    // can_init(BAUD_500KBPS);
    system_ON();

    while(1){

        // regardless of state, always: 
        drive_leds(); 

        // 1 second task 
        if ((ms_counter / 100)%2 != one_second_passed) {
            send_can_lvbms(); 
            collect_telem(); 
            one_second_passed = (ms_counter / 100)%2; 
        }


        switch(SYSTEM_STATE){
            case STANDBY: 
                system_OFF(); 
                break; 
            case IDLE:
                if (ms_counter > IDLE_TIMEOUT){ 
                    // once 59 seconds have passed in IDLE mode, send system from IDLE into STANDBY state
                    SYSTEM_STATE = STANDBY; 
                }
                
                
                
                break; 
            case CHARGING: 
                
                break; 
            case DISCHARING: 
                break; 
            case FAULT: 
                break; 
            default: 
                break; 
        }
    }
}