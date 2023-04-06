#include "bspd.h"

#include "can_api.h"
#include "libs/adc/api.h"
#include "libs/gpio/api.h"
#include "libs/timer/api.h"

#include <avr/interrupt.h>

#include <stdbool.h>
#include <stdint.h>

#include "projects/btldr/btldr_lib.h"
#include "projects/btldr/git_sha.h"
#include "projects/btldr/libs/image/api.h"

// Required for btldr
image_hdr_t image_hdr __attribute__((section(".image_hdr"))) = {
    .image_magic = IMAGE_MAGIC,
    .git_sha = STABLE_GIT_COMMIT,
};

// CAN interrupt + callback function
volatile bool send_can = false;
void timer0_callback(void) {
    send_can = true;
}

// Code to run when a digital sense pin changes state (High->Low or Low->High)
volatile bool update_LED_trigger = false;
void pcint0_callback(void) {
    // Update CAN struct with new board logic values
    bspd.brake_gate = !!gpio_get_pin(BRAKELIGHT_LL);
    bspd.bspd_5kw = !!gpio_get_pin(MOTOR_CURRENT_SENSE);
    bspd.ss_bspd = !gpio_get_pin(BSPD_LL);

    update_LED_trigger = true;
}

// Check whether an LED needs updating, and if so, change its state
void update_LEDs(void) {
    if (update_LED_trigger == true) {
        // Update Brake Light LED on the PCB
        if (bspd.brake_gate) {
            gpio_set_pin(BRAKE_LL_LED);
        } else {
            gpio_clear_pin(BRAKE_LL_LED);
        }

        // Update 5kW LED on the PCB
        if (bspd.bspd_5kw) {
            gpio_set_pin(MOTOR_5KW_LED);
        } else {
            gpio_clear_pin(MOTOR_5KW_LED);
        }

        // Update Shutdown LED on the PCB
        if (bspd.ss_bspd) {
            gpio_set_pin(BSPD_TRIP_LED);
        } else {
            gpio_clear_pin(BSPD_TRIP_LED);
        }
        update_LED_trigger = false;
    }
}

int main(void) {
    /////////////////////////////// BSPD STARTUP ///////////////////////////////
    // Interrupt Enable
    sei();

    // Auto-generated CAN feature - sets up software CAN service
    can_init_bspd();

    // Set up the internal ADC on the 16M1 - configure it to read analog brake
    // pressure values
    adc_init();

    // Begin bootloader update function
    // updater_init(BTLDR_ID, 5);

    // Start 100Hz CAN update timer (print results to can 100 times / sec)
    timer_init(&timer0_cfg);

    // Connect Digital output pins to high-current IO logic
    gpio_set_mode(MOTOR_5KW_LED, OUTPUT);
    gpio_set_mode(BRAKE_LL_LED, OUTPUT);
    gpio_set_mode(BSPD_TRIP_LED, OUTPUT);

    // Enable digital inputs
    gpio_set_mode(MOTOR_CURRENT_SENSE, INPUT);
    gpio_set_mode(BSPD_LL, INPUT);
    gpio_set_mode(BRAKELIGHT_LL, INPUT);

    // Attach Pins to interrupt handler (assuming on rising/falling edge)
    // These are all PB registers which are mapped to the pcint0_callback
    // function
    gpio_enable_interrupt(BRAKELIGHT_LL);
    gpio_enable_interrupt(MOTOR_CURRENT_SENSE);
    gpio_enable_interrupt(BSPD_LL);

    pcint0_callback();

    ////////////////////////////// BSPD LOOP /////////////////////////////
    for (;;) {
        // BLTDR loop poll function
        // updater_loop();

        if (send_can) {
            bspd.brake_pressure = adc_read(BRAKE_PRESSURE_SENSE);
            can_send_bspd();
            send_can = false;
        }

        // Check whether an LED needs updating, and if so, change its state
        update_LEDs();
    }
}
