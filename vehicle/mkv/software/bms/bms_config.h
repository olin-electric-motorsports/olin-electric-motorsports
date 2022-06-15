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
#define NUM_ICS             (12)
#define NUM_TEMPERATURE_ICS (6) // Only half the ICs monitor temperatures

// Number of cells that can be measured
#define NUM_CELLS (12)

#define OVERVOLTAGE_THRESHOLD  (41500) // 4.15V
#define UNDERVOLTAGE_THRESHOLD (30000) // 3.00V

#define MAX_CHARGING_VOLTAGE (400)
#define MAX_CHARGING_CURRENT (1)

/*
 * We can handle missing around 5 temperatures, since we know there will be some
 * temperatures that we can't read properly
 */
#define MAX_EXTRANEOUS_TEMPERATURES (5)

#define OVERTEMPERATURE_THRESHOLD          ((int16_t)714) // 60 degC
#define SOFT_OVERTEMPERATURE_THRESHOLD     ((int16_t)1233) // 45 degC
#define SOFT_OVERTEMPERATURE_THRESHOLD_LOW ((int16_t)1814) // 35 degC
#define UNDERTEMPERATURE_THRESHOLD         ((int16_t)15513) // -20 degC

#define MAX_PEC_RETRY    (10) // Arbitrary for now
#define MAX_PEC_IN_A_ROW (32) // Arbitrary for now

// Globals
extern gpio_t BMS_RELAY_LSD;
extern gpio_t RJ45_LEDG;
extern gpio_t RJ45_LEDO;
extern gpio_t CHARGER_DETECT_OUT;
extern gpio_t CHARGER_DETECT_IN;
extern gpio_t GENERAL_LED;
extern gpio_t FAULT_LED;
extern gpio_t SPI_CS;
extern gpio_t nOCD;
extern gpio_t BSPD_CURRENT_SENSE;
extern gpio_t FAN_PWM;

extern adc_pin_e CURRENT_SENSE_VREF;
extern adc_pin_e CURRENT_SENSE_VOUT;

extern spi_cfg_s spi_cfg;

void timer0_isr(void);
extern timer_cfg_s timer0_cfg;
extern timer_cfg_s timer1_fan_cfg;
