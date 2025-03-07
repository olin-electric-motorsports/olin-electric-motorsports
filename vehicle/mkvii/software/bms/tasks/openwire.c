#include "tasks.h"

#include "vehicle/common/ltc6811/ltc681x.h"
#include "vehicle/mkvii/software/bms/bms_config.h"
#include "vehicle/mkvii/software/bms/utils/fault.h"

#define NUM_CELL_REG     (6)
#define NUM_CELLS_IN_REG (3)
#define NUM_BYTES_IN_REG (6)
#define NUM_CELLS_PER_IC (17)

#define ITERATIONS (2) 

void openwire_task(void) {

    wakeup_sleep(NUM_ICS);

    uint16_t raw_pull_up_data[NUM_ICS][NUM_CELLS_PER_IC]; 
    uint16_t raw_pull_down_data[NUM_ICS][NUM_CELLS_PER_IC]; 
    int16_t differences[NUM_ICS][NUM_CELLS_PER_IC];

    uint8_t raw_row_data[NUM_RX_BYT * NUM_ICS] = { 0 };

    for (uint8_t i = 0; i < ITERATIONS; i++) {
        LTC681x_adow(MD_7KHZ_3KHZ, 1, AUX_CH_ALL, DCP_ENABLED);
        LTC681x_pollAdc();

        wakeup_idle(NUM_ICS);
    }
    
    for (uint8_t reg = 0; reg < NUM_CELL_REG; reg++) {
        wakeup_idle(NUM_ICS);

        LTC681x_rdcv_reg(reg + 1, NUM_ICS, raw_row_data);

        for (uint8_t ic; ic < NUM_ICS; ic++) {

            uint8_t data_index = ic * NUM_RX_BYT; 

            raw_pull_up_data[ic][data_index + 0] = raw_row_data[data_index + 0] + (raw_row_data[data_index + 1] << 8);
            raw_pull_up_data[ic][data_index + 1] = raw_row_data[data_index + 2] + (raw_row_data[data_index + 3] << 8);
            raw_pull_up_data[ic][data_index + 2] = raw_row_data[data_index + 4] + (raw_row_data[data_index + 5] << 8);
        }
    }
  
    for (uint8_t i = 0; i < ITERATIONS; i++) {
        LTC681x_adow(MD_7KHZ_3KHZ, 0, AUX_CH_ALL, DCP_ENABLED);
        LTC681x_pollAdc();

        wakeup_idle(NUM_ICS);
    }
    
    for (uint8_t reg = 0; reg < NUM_CELL_REG; reg++) {
        wakeup_idle(NUM_ICS);

        LTC681x_rdcv_reg(reg + 1, NUM_ICS, raw_row_data);

        for (uint8_t ic; ic < NUM_ICS; ic++) {

            uint8_t data_index = ic * NUM_RX_BYT;

            raw_pull_down_data[ic][data_index + 0] = raw_row_data[data_index + 0] + (raw_row_data[data_index + 1] << 8);
            raw_pull_down_data[ic][data_index + 1] = raw_row_data[data_index + 2] + (raw_row_data[data_index + 3] << 8);
            raw_pull_down_data[ic][data_index + 2] = raw_row_data[data_index + 4] + (raw_row_data[data_index + 5] << 8);
        }
    }

    for (uint8_t cell = 0; cell < NUM_CELLS_PER_IC; cell++) {
        for (uint8_t ic = 0; ic < NUM_ICS; ic++) {
            differences[ic][cell] = raw_pull_up_data[ic][cell] - raw_pull_down_data[ic][cell];

            if (cell > 0) {
                if (differences[ic][cell] < -400) {
                    set_fault(BMS_FAULT_OPEN_WIRE);
                } else {
                    clear_fault(BMS_FAULT_OPEN_WIRE);
                }
            }
        }
    }
}
