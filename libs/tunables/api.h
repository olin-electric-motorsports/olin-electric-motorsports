/*
 * Copyright 2023 Olin Electric Motorsports
 */
#pragma once
#include <stdbool.h>
#include <stdint.h>
#include <string.h>

/*
 * tunables_init
 *
 * Initializes ECU ids locally and allows us to bring EEPROM into RAM for easy
 * reading
 *
 * Parameters:
 *  - (uint16_t) ecu_id: the ECU id
 *  - (void*) tunables_data: A pointer to the tunable parameter data
 *  - (size_t) num_tunables: Total number of tunable parameters
 * */
void tunables_init(uint16_t ecu_id, void* tunables_data, size_t num_tunables);

/*
 * tunables_loop
 *
 * Goes into the super loop and read/writes to EEPROM if CAN msg was received
 *
 * Parameters:
 *  - (void*) tunables_data: A pointer to the tunable parameter data
 *  - (size_t) num_tunables: Total number of tunable parameters
 */
void tunables_loop(void* tunables_data, size_t num_tunables);
