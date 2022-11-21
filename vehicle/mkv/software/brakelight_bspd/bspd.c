#include "bspd_config.h"

#include "libs/adc/api.h"
#include "libs/gpio/api.h"
#include "libs/timer/api.h"
#include "vehicle/mkv/software/brakelight_bspd/can_api.h"

#include <avr/interrupt.h>

#include <stdbool.h>
#include <stdint.h>

#include "projects/btldr/btldr_lib.h"
#include "projects/btldr/git_sha.h"
#include "projects/btldr/libs/image/api.h"

/*
 * Required for btldr
 */
image_hdr_t image_hdr __attribute__((section(".image_hdr"))) = {
    .image_magic = IMAGE_MAGIC,
    .git_sha = STABLE_GIT_COMMIT,
};

#define AIR_STATE_TS_ACTIVE (4)

volatile uint16_t brake_pressure = 0;
volatile bool send_can = false;

void timer0_callback(void) {
    send_can = true;
}

void pcint1_callback(void) {
    brakelight.brake_gate = !!gpio_get_pin(BRAKELIGHT_GATE);
    brakelight.bspd_current_sense = !!gpio_get_pin(BSPD_CURRENT_SENSE);
    brakelight.ss_bspd = !gpio_get_pin(SHUTDOWN_SENSE_BSPD);

    if (brakelight.brake_gate) {
        gpio_set_pin(DEBUG_LED_1);
    } else {
        gpio_clear_pin(DEBUG_LED_1);
    }
}

int main(void) {
    sei();
    can_init_brakelight_bspd();
    adc_init();
    updater_init(BTLDR_ID, 5);
    timer_init(&timer0_cfg);

    gpio_set_mode(DEBUG_LED_1, OUTPUT);
    gpio_set_mode(DEBUG_LED_2, OUTPUT);
    gpio_set_mode(DEBUG_LED_3, OUTPUT);
    gpio_set_mode(RJ45_LED_G, OUTPUT);
    gpio_set_mode(COOLING_PUMP_LSD, OUTPUT);
    gpio_set_mode(BSPD_CURRENT_SENSE, INPUT);
    gpio_set_mode(SHUTDOWN_SENSE_BSPD, INPUT);

    gpio_enable_interrupt(BRAKELIGHT_GATE);
    gpio_enable_interrupt(SHUTDOWN_SENSE_BSPD);
    gpio_enable_interrupt(BSPD_CURRENT_SENSE);

    pcint1_callback();

    can_receive_air_control_critical();

    for (;;) {
        updater_loop();

        if (can_poll_receive_air_control_critical() == 0) {
            if (air_control_critical.air_n_status == AIR_STATE_TS_ACTIVE) {
                gpio_set_pin(COOLING_PUMP_LSD);
            }
            can_receive_air_control_critical();
        }

        if (send_can) {
            brake_pressure = adc_read(BRAKE_PRESSURE_SENSE);
            brakelight.brake_pressure = brake_pressure;
            can_send_brakelight();
            send_can = false;
        }
    }
}
