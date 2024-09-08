#include "imu_config.h"
#include "libs/gpio/api.h"
#include "libs/gpio/pin_defs.h"
#include "libs/timer/api.h"
#include "vehicle/mkvi/software/imu/can_api.h"

#include <avr/interrupt.h>
#include <avr/io.h>
#include <stdint.h>
#include <util/delay.h>

#include "projects/btldr/btldr_lib.h"
#include "projects/btldr/git_sha.h"
#include "projects/btldr/libs/image/api.h"
#include "projects/can_print/can_print.h"

// /*
//  * Required for btldr
//  */
// image_hdr_t image_hdr __attribute__((section(".image_hdr"))) = {
//     .image_magic = IMAGE_MAGIC,
//     .git_sha = STABLE_GIT_COMMIT,
// };

volatile bool can_send_imu_data = true;

void timer_0_isr(void) {
    can_send_imu_data = true;
}

int main(void) {
    gpio_set_mode(debug_led, OUTPUT);
    can_init_imu();
    sei();
    timer_init(&timer_0_cfg);
    spi_init(&imu_spi_cfg);
    // _can_print(SPCR);

    // spi_cs_low();
    // uint8_t tx_data[2] = { 0x20, 0x00 };
    // spi_transceive(tx_data, NULL, 2);
    // spi_cs_high();

    for (;;) {
        if (can_send_imu_data) {
            gpio_toggle_pin(debug_led);
            // can_print("oem", 65535, -3);
            // _can_print(0xEA);
            uint8_t tx_data[2] = { 0x80, 0x00 };
            uint8_t rx_data[2];
            // _can_print(SPCR);
            spi_cs_low();
            spi_transceive(tx_data, rx_data, 2);
            spi_cs_high();
            _can_print(rx_data[0]);
            _can_print(rx_data[1]);
            // if (rx_data == 0) {
            //     for (;;) {
            //         ;
            //     }
            // }

            // gpio_toggle_pin(debug_led);

            can_send_imu_data = false;
        }
        // can_print("test", -65535);
        // can_send_can_print_debug();
        // can_send_imu_debug();
    }
}
