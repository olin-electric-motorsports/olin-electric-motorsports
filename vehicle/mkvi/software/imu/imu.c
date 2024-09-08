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

    uint8_t tx_data[2] = { 0x86, 0x00 };
    uint8_t rx_data[2];
    // _can_print(SPCR);
    spi_cs_low();
    spi_transceive(tx_data, rx_data, 2);
    spi_cs_high();
    _can_print(rx_data[0]);
    _can_print(rx_data[1]);

    spi_cs_low();
    uint8_t tx_data_0[2] = { 0x06, 0x01 };
    spi_transceive(tx_data_0, NULL, 2);
    spi_cs_high();

    uint8_t tx_data_1[2] = { 0x86, 0x00 };
    uint8_t rx_data_1[2];
    // _can_print(SPCR);
    spi_cs_low();
    spi_transceive(tx_data_1, rx_data_1, 2);
    spi_cs_high();
    _can_print(rx_data_1[0]);
    _can_print(rx_data_1[1]);

    for (;;) {
        if (can_send_imu_data) {
            gpio_toggle_pin(debug_led);
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
            _can_print(rx_data_2[0]);
            _can_print(rx_data_2[1]);

            can_send_imu_data = false;
        }
        // can_print("test", -65535);
        // can_send_can_print_debug();
        // can_send_imu_debug();
    }
}
