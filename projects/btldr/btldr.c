/*
 * @file btldr.c
 * @brief Main CAN Bootloader
 */
#include <avr/eeprom.h>
#include <avr/interrupt.h>
#include <avr/io.h>
#include <stdbool.h>
#include <stdint.h>
#include <stdlib.h>
#include <util/delay.h>

#include "can_isp.h"
#include "libs/can/api.h"
#include "libs/uart/api.h"
#include "projects/btldr/libs/image/api.h"
#include "projects/btldr/libs/shmem/api.h"

int main(void) {
    cli(); // Disable interrupts in the btldr
           //
    DDRD |= _BV(PD5);
    PORTD |= _BV(PD5);

    asm("jmp %0" ::"I"(sizeof(image_hdr_t)));

    uart_init(9600);
    uart_puts("-- BOOTLOADER --\n");

    bool image_is_valid = bootflag_get(IMAGE_IS_VALID);
    bool update_requested = bootflag_get(UPDATE_REQUESTED);

    if (!update_requested) {
        if (image_is_valid) {
            // Jump to application with offset of image header size
            asm("jmp %0" ::"I"(sizeof(image_hdr_t)));

            uart_puts("FATAL: Jump failed, entering loop\n");
            while (1)
                continue;
        } else {
            // log_uart("Image is corrupted or invalid, going into updater");
            uart_puts(
                "ERROR: Image is corrupted or invalid, going into updater\n");
        }
    }

    uart_puts("-- UPDATER --\n");

    // Updater
    can_init(BAUD_500KBPS);

    while (1) {
        (void)can_isp_task(BTLDR_ID);
    }
}
