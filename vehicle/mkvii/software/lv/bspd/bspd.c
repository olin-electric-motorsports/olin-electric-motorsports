#include "bspd.h"

#include "libs/adc/api.h"
#include "libs/gpio/api.h"
#include "libs/timer/api.h"
#include "vehicle/mkvii/software/lv/bspd/can_api.h"

#include <avr/interrupt.h>

#include <stdbool.h>
#include <stdint.h>

#include "projects/btldr/btldr_lib.h"
#include "projects/btldr/git_sha.h"
#include "projects/btldr/libs/image/api.h"

//////////////////////// VARIABLE DECLARATIONS /////////////////
uint8_t heartbeat_counter = 0;

//////////////////////// FUNCTIONS /////////////////////////////
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

// Code to run when a digital sense pin changes state (High -> Low or Low -> High)
void pcint0_callback(void) {
    // Update CAN struct with new board logic values
    bspd.brake_gate = !!gpio_get_pin(BRAKELIGHT_LL);
    bspd.bspd_5kw = !!gpio_get_pin(MOTOR_CURRENT_SENSE);
    bspd.ss_bspd = !gpio_get_pin(BSPD_SHUTDOWN_SENSE);
}

// Check whether an LED needs updating, and if so, change its state
void update_LEDs(void) {
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

    // Update BSPD Status LED/BSPD Trip LED on the PCB
    if (!gpio_get_pin(BSPD_LL)) {
        gpio_set_pin(BSPD_TRIP_LED);
    }
    else {
        gpio_clear_pin(BSPD_TRIP_LED);
    }

}

// Triggers Heartbeat LED every 0.5 s (timing based on 100 Hz CAN Signal)
void update_heartbeat_LED(void) {
        heartbeat_counter += 1;
        // Update Heartbeat LED on the PCB
        if (heartbeat_counter == 50) {
            gpio_toggle_pin(HEARTBEAT_LED); // Change LED state
            bspd.heartbeat = !bspd.heartbeat; // Change CAN Signal
            heartbeat_counter = 0; // Reset Counter
        }
}  

//////////////////////// MAIN CODE /////////////////////////////
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
    updater_init(BTLDR_ID, 5);

    // Start 100Hz CAN update timer (print results to can 100 times / sec)
    timer_init(&timer0_cfg);

    // Connect Digital output pins to high-current IO logic
    gpio_set_mode(MOTOR_5KW_LED, OUTPUT);
    gpio_set_mode(BRAKE_LL_LED, OUTPUT);
    gpio_set_mode(BSPD_TRIP_LED, OUTPUT);
    gpio_set_mode(HEARTBEAT_LED, OUTPUT);

    // Enable digital inputs
    gpio_set_mode(MOTOR_CURRENT_SENSE, INPUT);
    gpio_set_mode(BSPD_LL, INPUT);
    gpio_set_mode(BSPD_SHUTDOWN_SENSE, INPUT);
    gpio_set_mode(BRAKELIGHT_LL, INPUT);

    // Attach Pins to interrupt handler (assuming on rising/falling edge)
    // These are all PB registers which are mapped to the pcint0_callback
    // function
    gpio_enable_interrupt(BRAKELIGHT_LL);
    gpio_enable_interrupt(MOTOR_CURRENT_SENSE);
    gpio_enable_interrupt(BSPD_SHUTDOWN_SENSE);

    // Gets initial analog inputs
    pcint0_callback();
    
    // Initial Predefined Heartbeat CAN Signal
    bspd.heartbeat = false;

    ////////////////////////////// BSPD LOOP /////////////////////////////
    for (;;) {
        // BLTDR loop poll function
        updater_loop();

        // Get updated analog inputs
        bspd.brake_pressure = adc_read(BRAKE_PRESSURE_SENSE);
        bspd.brake_pressure_filtered = adc_read(BRAKE_PRESSURE_SENSE_FILTERED);
        bspd.opamp_timer_rc_circuit_status = adc_read(RC_TIMER_STATUS);

        // Triggers Send Can Function 100 times per second
        if (send_can) {
            can_send_bspd();
            update_heartbeat_LED(); // This is here so it can be using the same "clock" as the CAN Signal
            send_can = false;
        }

        // Check whether an LED needs updating, and if so, change its state
        update_LEDs();

    }
}
