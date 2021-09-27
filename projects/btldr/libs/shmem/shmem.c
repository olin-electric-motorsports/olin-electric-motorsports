#include "projects/btldr/libs/shmem/api.h"

#include <avr/eeprom.h>

/*
 * Bootloader version is defined as 8-bit number
 * MMMM.mmmm
 *
 * M := Major Revision
 * m := Minor revision
 *
 * CURRENT VERSION: 0.1
 */
#define BOOTLOADER_VERSION_MAJ (0)
#define BOOTLOADER_VERSION_MIN (1)

// TODO: Reset to bootflags 0 after testing
// uint32_t bootflags __attribute__((section(".eeprom"))) = UPDATE_REQUESTED;
uint32_t bootflags __attribute__((section(".eeprom"))) = IMAGE_IS_VALID;

uint8_t updater_version __attribute__((section(".eeprom")))
= (BOOTLOADER_VERSION_MAJ << 4) | (BOOTLOADER_VERSION_MIN & 0xF);

void bootflag_set(uint8_t flag) {
    uint32_t flags = eeprom_read_dword(&bootflags);
    flags |= (1 << flag);
    eeprom_update_dword(&bootflags, flags);
}

void bootflag_clear(uint8_t flag) {
    uint32_t flags = eeprom_read_dword(&bootflags);
    flags &= ~(1 << flag);
    eeprom_update_dword(&bootflags, flags);
}

bool bootflag_get(uint32_t flag) {
    eeprom_busy_wait();
    uint32_t flags = eeprom_read_dword(&bootflags);

    return ((flags & flag) != 0);
}

uint32_t get_bootflags(void) {
    return eeprom_read_dword(&bootflags);
}

uint8_t updater_get_version(void) {
    return eeprom_read_byte(&updater_version);
}
