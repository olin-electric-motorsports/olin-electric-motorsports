#pragma once

#include "libs/adc/api.h"
#include "libs/can/api.h"
#include "libs/gpio/api.h"
#include "libs/gpio/pin_defs.h"
#include "libs/spi/api.h"
#include "libs/timer/api.h"
#include "vehicle/mkv/software/bms/ltc6811/ltc6811.h"

#include <stdint.h>

/*
 * Macros
 */
#define NUM_ICS             (2)
#define NUM_TEMPERATURE_ICS (1) // Only half the ICs monitor temperatures

// Number of cells that can be measured
#define NUM_CELLS (12)

// Number of multiplexers
#define NUM_MUXES (3)

#define NUM_MUX_CHANNELS (8)

// TODO verify over/under voltage/temperature thresholds
#define OVERVOLTAGE_THRESHOLD          (42000) // 4.2V
#define UNDERVOLTAGE_THRESHOLD         (30000) // 3.0V
#define OVERTEMPERATURE_THRESHOLD      (728) // 60 degC
#define SOFT_OVERTEMPERATURE_THRESHOLD (1255) // 45 degC
#define SOFT_OVERTEMPERATURE_THRESHOLD_LOW \
    (SOFT_OVERTEMPERATURE_THRESHOLD + 500) // TODO degC
#define UNDERTEMPERATURE_THRESHOLD (7384) // 0 degC

// Globals
extern cell_asic ICS[NUM_ICS];
/* extern uint16_t TEMPERATURES[NUM_TEMPERATURE_ICS][NUM_MUXES * NUM_MUX_CHANNELS]; */

extern gpio_t BMS_RELAY_LSD;
extern gpio_t RJ45_LEDG;
extern gpio_t RJ45_LEDO;
extern gpio_t CHARGE_ENABLE1;
extern gpio_t CHARGE_ENABLE2;
extern gpio_t GENERAL_LED;
extern gpio_t FAULT_LED;
extern gpio_t SPI_CS;
extern gpio_t nOCD;
extern gpio_t BSPD_CURRENT_SENSE;

extern adc_pin_e CURRENT_SENSE_VREF;
extern adc_pin_e CURRENT_SENSE_VOUT;

extern spi_cfg_s spi_cfg;

void timer0_isr(void);
extern timer_cfg_s timer0_cfg;
extern timer_cfg_s timer1_fan_cfg;
