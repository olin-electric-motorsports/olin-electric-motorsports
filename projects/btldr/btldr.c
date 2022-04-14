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
#include "can_lib.h"
#include "debug.h"
#include "image.h"
#include "shmem.h"

/*
 * MCUSR := MCU Status Register
 */

// extern uint32_t bootflags;

int main(void) {
    cli();  // Disable interrupts in the btldr

    log_init();

    log_uart("-- Bootloader --");

    bool image_is_valid = bootflag_get(IMAGE_IS_VALID);
    bool update_requested = bootflag_get(UPDATE_REQUESTED);

    if (!update_requested) {
        if (image_is_valid) {
            // Jump to application with offset of image header size
            asm("jmp %0" ::"I"(sizeof(image_hdr_t)));

            log_uart("Jump failed, entering loop");
            while (1) continue;
        } else {
            log_uart("Image is corrupted or invalid, going into updater");
        }
    }

    // Updater
    can_init(BAUD_500KBPS);

    uint8_t data[CAN_MAX_MSG_LENGTH];
    can_frame_t msg = {
        .mob = 0,
        .data = data,
    };

    can_filter_t filter = {
        .mask = 0x7F0,
        .id = BTLDR_ID << 4,
    };

    // Receive CAN message. This shouldn't error because we always restore our
    // message objects
    (void)can_receive(&msg, filter);

    while (1) { (void)can_isp_task(); }
}
