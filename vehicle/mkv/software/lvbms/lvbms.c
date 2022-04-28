#include "lvbms_config.h"
#include "libs/adc/api.h"
#include "libs/gpio/api.h"
#include "libs/timer/api.h"
#include "libs/spi/api.h"
#include "vehicle/mkv/software/lvbms/can_api.h" // TODO: why?? 
#include "avr/interrupt.h"
#include "vehicle/mkv/software/lvbms/LTC6810/ltc6810.h"
#include <util/delay.h>

#define LEN 1

cell_asic ICS[NUM_ICS]; 

uint8_t txdata = 0xFF; 
uint8_t rxdata; 




int main(void){

    sei(); 

    can_init(BAUD_500KBPS);
    spi_init(&spi_cfg);     
    
    gpio_set_mode(LED2, OUTPUT);
    
    
    while(1){

        // test 0 
        gpio_toggle_pin(LED2);
        // _delay_ms(500); 
        

        // // test 1
        spi_transceive(&txdata, &rxdata, LEN);


        // // test 2
        // wakeup_sleep(NUM_ICS); 
        // LTC6810_adcv(MD_7KHZ_3KHZ, DCP_DISABLED, CELL_CH_ALL); 

        _delay_ms(50); 

    }
}

