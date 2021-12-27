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
 *
 * TODO: Move to a config.h file?
 */
#define BOOTLOADER_VERSION_MAJ (0)
#define BOOTLOADER_VERSION_MIN (1)

/*
 * Bootflags are a set of flags that can be set, cleared, and read by both the
 * application and the bootloader.
 *
 * The `__attribute__((section(".eeprom")))` tells the compiler to place this
 * memory location into the `.eeprom` section. When we generate a .hex file to
 * flash, we _exclude_ the .eeprom section because the .hex file goes into
 * _flash_, not _eeprom_. We separately generate a .eep file that has all of our
 * eeprom variables and use the flashing tool to write it to EEPROM memory
 */
static uint32_t bootflags __attribute__((section(".eeprom"))) = 0;
// static uint32_t bootflags __attribute__((section(".eeprom"))) = UPDATE_REQUESTED;
// static uint32_t bootflags __attribute__((section(".eeprom"))) = IMAGE_IS_VALID;

static uint8_t updater_version __attribute__((section(".eeprom")))
= (BOOTLOADER_VERSION_MAJ << 4) | (BOOTLOADER_VERSION_MIN & 0xF);

void bootflag_set(uint8_t flag) {
    eeprom_busy_wait();
    uint32_t flags = eeprom_read_dword(&bootflags);
    flags |= (1 << flag);
    eeprom_update_dword(&bootflags, flags);
}

void bootflag_clear(uint8_t flag) {
    eeprom_busy_wait();
    uint32_t flags = eeprom_read_dword(&bootflags);
    flags &= ~(1 << flag);
    eeprom_update_dword(&bootflags, flags);
}

bool bootflag_get(uint8_t flag) {
    eeprom_busy_wait();
    uint32_t flags = eeprom_read_dword(&bootflags);

    return ((flags & (1 << flag)) != 0);
}

uint8_t shmem_get_version(void) {
    eeprom_busy_wait();
    return eeprom_read_byte(&updater_version);
}
