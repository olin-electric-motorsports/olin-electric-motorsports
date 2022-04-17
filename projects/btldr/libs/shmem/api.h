#pragma once
#include <stdbool.h>
#include <stdint.h>

/*
 * Bootflags
 */
#define UPDATE_REQUESTED (uint32_t)(1 << 0x000U)
#define IMAGE_IS_VALID (uint32_t)(1 << 0x001U)

union updater_version {
    const uint8_t full;
    struct {
        const uint8_t upper : 4;
        const uint8_t lower : 4;
    };
};

/*
 * Used to set the bootflag to 1 in EEPROM
 */
void bootflag_set(uint8_t flag);

/*
 * Used to set the bootflag to 0 in EEPROM
 */
void bootflag_clear(uint8_t flag);

/*
 * Get the value of the specified bootflag
 */
bool bootflag_get(uint32_t flag);

/*
 * Used to get the 1-byte updater version from EEPROM
 */
uint8_t shmem_get_version(void);
