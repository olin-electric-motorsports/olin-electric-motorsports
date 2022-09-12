#pragma once
#include <stdint.h>

/*
 * Initializes the updater to use a specific, fixed,  message object, or MOb
 */
void updater_init(uint16_t ecu_id, uint8_t mob);

/*
 * Function to check for and handle requests to the ECU. Will return quickly if
 * no requests are made. Should be called at the top of the superloop.
 *
 * May not return, instead issuing a `jmp` instruction to reset the device and
 * jump to the bootloader
 */
void updater_loop(void);
