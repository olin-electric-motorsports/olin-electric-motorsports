#include "libs/can/api.h"
#include "libs/adc/api.h"
#include "libs/gpio/api.h"
#include "libs/gpio/pin_defs.h"
#include "libs/timer/api.h"
#include "libs/spi/api.h"


#define NUM_ICS         1

gpio_t SPI_CS           = PD7; 
gpio_t LED2             = PB4; 



typedef enum {
    FAULT_NONE = 0x00, 
    THERM_0_FAULT, 
    THERM_1_FAULT, 
    THERM_2_FAULT, 
    THERM_3_FAULT, 
    THERM_4_FAULT, 
    THERM_5_FAULT, 
    OV_FAULT, 
    UV_FAULT, 
    OC_FAULT, 
    OPEN_CIRCUIT_FAULT, 
    PEC_FAULT, 
    COMPARATOR_FAULT, 
} fault_flags; 

spi_cfg_s spi_cfg = {
    .interrupt_enable = false,
    .data_order = MSB,
    .mode = MAIN,
    .polarity = FALLING_RISING,
    .phase = SETUP_SAMPLE,
    .clock_rate = F_OSC_DIV_4,
    .cs_pin = &SPI_CS,
};

uint8_t can_data[] = { 0xF };

can_frame_t msg = {
    .id = 0x70,
    .dlc = 1,
    .mob = 0,
    .data = can_data,
};