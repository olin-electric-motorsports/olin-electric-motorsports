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
#include "libs/spi/api.h"
#include "vehicle/mkv/software/lvbms/can_api.h" // TODO: why?? 
#include "avr/interrupt.h"
#include "vehicle/mkv/software/lvbms/LTC6810/ltc6810.h"

volatile lvbms_state SYSTEM_STATE = IDLE; 
volatile uint8_t    adc_ptr     = 0; 
uint16_t            adc_data[7] = { 0 }; // todo used to be voltatile
uint64_t            ms_counter         = 0; 
volatile uint8_t    fault_flag  = 0x00; 
uint8_t             one_second_passed = true; 

cell_asic ICS[NUM_ICS]; 

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

void disable_external_interrupts(){
    EICRA &= 0x00; // set that low level of INT1,2,3 generates an interrupt request
    EIMSK &= 0x00; // enable interrupt INT2 and INT1 
}

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
    adc_read_results(&adc_data[adc_ptr]);
    lvbms.temp_0 = adc_data[adc_ptr];  
    
    /* TODO: FIX ADC CHAINING ISSUES */

    // // check adc_ptr & accordingly start next conversion 
    // if (adc_ptr==1){ // should be up to 6
    //     // reset ptr to 0
    //     adc_ptr = 0; 
    //     // write to CAN struct
    //     lvbms.temp_0 = adc_data[0]; 
    //     // lvbms_aux_1.TEMP_1 = adc_data[1]; 
    //     // todo populate rest of CAN struct writes

    // } else {
    //     adc_ptr += 1; 
    //     adc_start_convert(adc_pins[adc_ptr]); 
    // }
}

/* fault handling */
void enter_fault_state(fault_flags fault){
    SYSTEM_STATE = FAULT; 
    // prevent cascading fault reporting 
    if (lvbms.fault_code == FAULT_NONE){
        lvbms.fault_code |= fault; 
    }
}

/* interrupt handler for COMP 2 (CHARGING) 
 * should be called on wakeup 

*/
ISR(INT2_vect){
    system_ON(); 
   
}


/* interrupt handler for COMP 1 (DISCHARGING) 
 * should be called on wakeup 

*/
ISR(INT1_vect){
    system_ON(); 

}

/* 
* init LTC chip 
*/
void LTC_init(){
    
    // initialize cfgr data structures & populate with limits 
    LTC6810_init_cfg(NUM_ICS, ICS); 
    LTC6810_init_reg_limits(NUM_ICS, ICS); 

    // set config reg bits in LTC - for now we'll only enable vov and vuv limits  
    LTC6810_set_cfgr_uv(0, ICS, LTC_UV_THRESHOLD); 

    LTC6810_set_cfgr_ov(0, ICS, LTC_OV_THRESHOLD); 

    // write the configs over SPI 
    LTC6810_wrcfg(NUM_ICS, ICS); 

    /* adstatd checks: 
    * sum of all cells
    * internal die temperature  
    * Analog psu voltage 
    * Digital psu voltage  
    */
    LTC6810_adstatd(MD_7KHZ_3KHZ, STAT_CH_ALL); 

    LTC6810_rdstat(STAT_CH_ALL, NUM_ICS, ICS);

    // muting / unmuting discharge transistors? 
    LTC6810_mute(); 

}


/* Request & poll ADC voltages & check those voltages - Jack's BMS code heavily referenced*/
void LTC_voltage_task(){

    wakeup_sleep(NUM_ICS); 

    // wakeup_idle(NUM_ICS);



    // TESTING - simply read config and check PEC 

    LTC6810_rdcfg(NUM_ICS, ICS); 
    // int8_t pec_ct = LTC6810_rdcfg(NUM_ICS, ICS); 

    // lvbms.pec_error_count = pec_ct; 

    gpio_toggle_pin(LED_1); 
    // if (pec_ct == 0){
    // } 
    // else {
    //     gpio_set_pin(LED_2);
    // }
    // lvbms.pec = pec_ct; 





    // start ADC conversion on LTC chip for cells 1-6, & SoC 
    // LTC6810_adcvsc(MD_7KHZ_3KHZ, DCP_DISABLED); 
    

    // // blocks until ADC has finished conversions
    // LTC6810_pollAdc(); 

    // // reads cell voltage registers
    // uint8_t num_pec_errors = LTC6810_rdcv(REG_ALL, NUM_ICS, ICS); // ensure ICS are initialized to store data

    // lvbms.pec_error_count += num_pec_errors; 

    // num_pec_errors = LTC6810_rdstat(STAT_CH_SOC, NUM_ICS, ICS); // ensure ICS are initialized to store data

    // lvbms.pec_error_count += num_pec_errors; 

    // uint16_t pack_voltage = 0;
    // uint32_t uv = 0;
    // uint32_t ov = 0;

    // // data should be stored in mV 
    // pack_voltage += ICS[0].stat.stat_codes[0] //* 10 ** -6
    //         - ICS[0].cells.c_codes[4]
    //         - ICS[0].cells.c_codes[5]; 

    // uv = (ICS[0].stat.flags[0] & 0x55) | (ICS[0].stat.flags[1] & 0x55)
    //         | (ICS[0].stat.flags[2] & 0x55);

    // // Even bits of the ST register are used for overvoltage flags
    // ov = (ICS[0].stat.flags[0] & 0xAA) | (ICS[0].stat.flags[1] & 0xAA)
    //         | (ICS[0].stat.flags[2] & 0xAA);

    // if (uv > 0) {
    //     enter_fault_state(UV_FAULT);
    // } else if (ov > 0) {
    //     enter_fault_state(OV_FAULT);
    // }

    // lvbms.pack_soc = pack_voltage; 

/* TODO: look into datasheet on balancing code? something discharge registers */    
}

/* sample thermistor ADC's, sample current sensor ADC, !LTC! */
void collect_telem(){
    // begin lvbms ADC conversion chain 
    adc_start_convert(adc_pins[adc_ptr]);

    // step through all ADCs in a blocking fashion, doesn't chain async
    // for (int i = 0; i <7; i ++){
    //     adc_data[i] = adc_read(adc_pins[i]); 
    // }

    LTC_voltage_task(); 
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

/* uses PWM to drive fan at certain speed */
void drive_fan(){}



/* called on transition from STANDBY to IDLE */
void system_ON(){
    SYSTEM_STATE = IDLE;
    
    wake(); 
    // set CANTRx into normal mode 
    gpio_clear_pin(CAN_STBY); 
    // enable onstate cmpnts
    gpio_set_pin(ON_STATE_FET_DRV); 
    
    disable_external_interrupts(); 
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
    enable_external_interrupts(); // TODO TEST????  

    enable_STANDBY_mode(); 
}


int main(void){

    // SYSTEM_STATE should be IDLE
    // this code is called only on first power up
    sei(); 
    adc_init(); 
    adc_interrupt_enable(adc_callback); 
    gpio_init(); 





    timer_init(&timer0_IDLE_ctc_cfg); 


    can_init(BAUD_500KBPS);
    spi_init(&spi_cfg);     
    
    system_ON();
    
    while(1){

        // regardless of state, always: 
        drive_leds(); 

        // 1 second task 
        if ((ms_counter / 100)%2 != one_second_passed) {
            can_send_lvbms(); 
            collect_telem(); 
            // can_send_lvb ms_aux_1(); 
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