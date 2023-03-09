#include "bspd.h"

#include "libs/adc/api.h"
#include "libs/gpio/api.h"
#include "libs/timer/api.h"
#include "vehicle/mkv/software/bspd/can_api.h"

#include <avr/interrupt.h>

#include <stdbool.h>
#include <stdint.h>

#include "projects/btldr/btldr_lib.h"
#include "projects/btldr/git_sha.h"
#include "projects/btldr/libs/image/api.h"


//Required for btldr
image_hdr_t image_hdr __attribute__((section(".image_hdr"))) = {
    .image_magic = IMAGE_MAGIC,
    .git_sha = STABLE_GIT_COMMIT,
};

//CAN interrupt + callback function
volatile bool send_can = false;
void timer0_callback(void) {
    send_can = true;
}

volatile uint16_t brake_pressure = 0;


void pcint1_callback(void) {

    //Update CAN struct with new board logic values
    bspd.brake_gate = !!gpio_get_pin(BRAKELIGHT_LL);
    bspd.bspd_5kw = !!gpio_get_pin(MOTOR_CURRENT_SENSE);
    bspd.ss_bspd = !gpio_get_pin(BSPD_LL);

    //Update Brake Light LED on the PCB
    if (bspd.brake_gate) {
        gpio_set_pin(BRAKE_LL_LED);
    } else {
        gpio_clear_pin(BRAKE_LL_LED);
    }

    //Update 5kW LED on the PCB
    if (bspd.bspd_5kw) {
        gpio_set_pin(MOTOR_5KW_LED);
    } else {
        gpio_clear_pin(MOTOR_5KW_LED);
    }

    //Update Shutdown LED on the PCB
    if (bspd.ss_bspd) {
        gpio_set_pin(BSPD_TRIP_LED);
    } else {
        gpio_clear_pin(BSPD_TRIP_LED);
    }
}

int main(void) {
    //Not sure what this does
    sei();

    //Auto-generated
    can_init_bspd();

    //Set up the internal ADC on the Arduino - configure it to read analog brake pressure values
    adc_init();

    //Begin bootloader update function
    updater_init(BTLDR_ID, 5);

    //Start 100Hz CAN update timer
    timer_init(&timer0_cfg);

    //Connect Digital output pins to high-current IO logic
    gpio_set_mode(MOTOR_5KW_LED, OUTPUT);
    gpio_set_mode(BRAKE_LL_LED, OUTPUT);
    gpio_set_mode(BSPD_TRIP_LED, OUTPUT);

    //Enable digital inputs
    gpio_set_mode(MOTOR_CURRENT_SENSE, INPUT);
    gpio_set_mode(BSPD_LL, INPUT);

    //Attach Pins to interrupt handler (assuming on rising/falling edge)
    gpio_enable_interrupt(BRAKELIGHT_LL);
    gpio_enable_interrupt(MOTOR_CURRENT_SENSE);
    gpio_enable_interrupt(BSPD_LL);

    pcint1_callback();

    for (;;) {
        updater_loop();

        if (send_can) {
            bspd.brake_pressure = adc_read(BRAKE_PRESSURE_SENSE);
            can_send_bspd();
            send_can = false;
        }
    }
}
