#include "imu_config.h"
#include "libs/gpio/api.h"
#include "libs/gpio/pin_defs.h"
#include "libs/timer/api.h"
#include "vehicle/mkvi/software/imu/can_api.h"

#include <avr/interrupt.h>
#include <avr/io.h>
#include <stdint.h>
#include <util/delay.h>

// #include "projects/btldr/btldr_lib.h"
// #include "projects/btldr/git_sha.h"
// #include "projects/btldr/libs/image/api.h"
#include "projects/can_print/can_print.h"

// /*
//  * Required for btldr
//  */
// image_hdr_t image_hdr __attribute__((section(".image_hdr"))) = {
//     .image_magic = IMAGE_MAGIC,
//     .git_sha = STABLE_GIT_COMMIT,
// };

/**
 * Timer 0 for sending IMU data over CAN
 */
volatile bool can_send_imu_data = true;
void timer_0_isr(void) {
    can_send_imu_data = true;
}

/**
 * Timer 1 for the LED heartbeat
 */
volatile bool led_heartbeat = true;
void timer_1_isr(void) {
    led_heartbeat = true;
}

uint8_t test = 0;
/**
 * Update the arb id of an IMU based on soldered pull up jumpers.
 *
 * Allows for multiple IMUs running the same firmware on the same CAN bus.
 */
void update_can_arb_id(void) {
    // Pull up inputs
    gpio_set_mode(bin_id_0, INPUT);
    gpio_set_mode(bin_id_1, INPUT);
    gpio_set_mode(bin_id_2, INPUT);

    // Update ids
    imu_accel_msg.id
        += (0x10
            * (!gpio_get_pin(bin_id_0) + (!gpio_get_pin(bin_id_1) << 1)
               + (!gpio_get_pin(bin_id_2) << 2)));
    imu_gyro_msg.id
        += (0x10
            * (!gpio_get_pin(bin_id_0) + (!gpio_get_pin(bin_id_1) << 1)
               + (!gpio_get_pin(bin_id_2) << 2)));
    imu_magnet_msg.id
        += (0x10
            * (!gpio_get_pin(bin_id_0) + (!gpio_get_pin(bin_id_1) << 1)
               + (!gpio_get_pin(bin_id_2) << 2)));
}

/**
 * Initialize 16m1 hardware peripherals
 */
void init_peripherals(void) {
    gpio_set_mode(debug_led, OUTPUT); // Heartbeat LED
    update_can_arb_id(); // Update arb based on IMU id
    can_init_imu(); // CAN
    sei(); // Interrupts
    timer_init(&timer_0_cfg); // Timer 0
    timer_init(&timer_1_cfg); // Timer 1
    spi_init(&imu_spi_cfg); // SPI
}

/**
 * Initialize ICM20948 for full 9-axis readings
 */
void init_imu(void) {
    // Wake from sleep
    uint8_t tx_data_0[2] = { 0x06, 0x01 };
    spi_transceive_cs(tx_data_0, NULL, 2);
}

int main(void) {
    init_peripherals();
    // _can_print(imu_accel_msg.id);
    // _can_print(imu_gyro_msg.id);
    // _can_print(imu_magnet_msg.id);

    init_imu();

    for (;;) {
        ;
    }

    for (;;) {
        if (led_heartbeat) {
            gpio_toggle_pin(debug_led);
            led_heartbeat = false;
        }

        if (can_send_imu_data) {
            // can_print("oem", 65535, -3);
            // _can_print(0xEA);
            // if (rx_data == 0) {
            //     for (;;) {
            //         ;
            //     }
            // }

            // gpio_toggle_pin(debug_led);
            uint8_t tx_data_2[2] = { 0xAE, 0x00 };
            uint8_t rx_data_2[2];
            // _can_print(SPCR);
            spi_cs_low();
            spi_transceive(tx_data_2, rx_data_2, 2);
            spi_cs_high();
            // _can_print(rx_data_2[0]);
            _can_print(rx_data_2[1]);

            can_send_imu_data = false;
        }
        // can_print("test", -65535);
        // can_send_can_print_debug();
        // can_send_imu_debug();
    }
}
