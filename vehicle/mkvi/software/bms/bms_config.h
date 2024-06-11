#pragma once

#include "libs/adc/api.h"
#include "libs/gpio/api.h"
#include "libs/gpio/pin_defs.h"
#include "libs/spi/api.h"
#include "libs/timer/api.h"
#include "vehicle/common/ltc6811/ltc681x.h"

/*
 * Macros
 */
#define NUM_ICS          6
#define DA_BOARDS_PER_IC 4

#define MAX_EXTRANEOUS_TEMPERATURES 3 // ?
#define MAX_PEC_ERROR_COUNT \
    32 // copied from mkv where it still says arbitrary...

// copied from MKV - need to be updated
#define OVERTEMPERATURE_THRESHOLD          ((int16_t)5725) // 60 degC
#define SOFT_OVERTEMPERATURE_THRESHOLD     ((int16_t)8892) // 45 degC
#define SOFT_OVERTEMPERATURE_THRESHOLD_LOW ((int16_t)11708) // 35 degC
#define UNDERTEMPERATURE_THRESHOLD         ((int16_t)27605) // -20 degC

#define OVERVOLTAGE_THRESHOLD          (39500) // 3.95V (max pack voltage (402.9V / [17 * 6] cells))
#define UNDERVOLTAGE_THRESHOLD         (25000) // 2.5V (Li-ion chemistry minimum)
#define SEGMENT_OVERVOLTAGE_THRESHOLD  (714000) // 71.4V (4.2v * 17 cells)
#define SEGMENT_UNDERVOLTAGE_THRESHOLD (442000) // 44.2V (4.6 * 17 cells)

#define CURRENT_THRESH (12000) // 120A (peak current) * 100cA/A = 12,000 centiAmps

#define DIE_OVERTEMPERATURE_THRESHOLD (27436) // 85 degC

// Number (out of 18) voltage channels not used. Unused channels are bridged
// and read as 0V
#define NUM_UNUSED_VOLTAGE_CHANNELS 1

/*
 * PIN DEFINITIONS
 */

// Outputs
extern gpio_t BMS_RELAY_LSD;
extern gpio_t COOLING_PUMP_LSD;
extern gpio_t SPI_CS;
extern gpio_t CHARGE_ENABLE_IN;
extern gpio_t CHARGE_ENABLE_OUT;

extern gpio_t DEBUG_LED_1;
extern gpio_t DEBUG_LED_2;

// Inputs
extern gpio_t BSPD_CURRENT_THRESH;
extern adc_pin_e PRE_DIS_TEMP_1;
extern adc_pin_e PRE_DIS_TEMP_2;
extern adc_pin_e PRE_DIS_TEMP_3;
extern adc_pin_e CURRENT_SENSE_VOUT;

void timer0_isr(void);
extern timer_cfg_s timer0_cfg;
extern timer_cfg_s timer1_cfg;
extern spi_cfg_s spi_cfg;

// A little bit of a hacky, truncated version of the cell_asic
// struct defined by the LTC681X library
typedef struct {
    ic_register config;
    cv cells;
} cell_asic_trunc;

typedef struct {
    cell_asic_trunc cells[NUM_ICS];
} cell_data_s;

extern cell_data_s cell_data;
