/*
 * OEM LTC6811 library header
 *
 * Contains function declarations for abstracting out the LTC6811 interface
 * Much of this is pulled from the Linear Technology Arduino example code found
 * in the LTSketchbook, available online.
 * The sketch in question is the DC2259_test.ino sketch.
 *
 * @author Alex Hoppe '19
 * @author Vienna Scheyer '21
 */

#ifndef LTC6811_H
#define LTC6811_H

#include <util/delay.h>
#include <avr/pgmspace.h>
#include "spi.h"
#include "ltc6811_defs.h"

#define TOTAL_IC    2
#define NUM_CELLS   12 //There are 10, but we need to read all 12 back.
#define NUM_TEMPS   20  //There are 20 temp sensors per segment
#define NUM_AUX_CH  6   // There are 10 AUX voltages

// Cell voltages read back from the peripheral board
// LSbit = 0.0001V, i.e. 65535 -> 6.5535V
// |  cell_voltages[0][0]| cell_voltages[0][1] |  cell_voltages[0][2]|    .....     |  cell_voltages[0][11]|  cell_voltages[1][0] | cell_voltages[1][1]|  .....   |
// |---------------------|---------------------|---------------------|--------------|----------------------|----------------------|--------------------|----------|
// |IC1 Cell 1           |IC1 Cell 2           |IC1 Cell 3           |    .....     |  IC1 Cell 12         |IC2 Cell 1            |IC2 Cell 2          | .....    |
uint16_t cell_voltages[TOTAL_IC][NUM_CELLS];

// AUX voltages read back from the peripheral board
// LSbit = 0.0001V
// Order is     |IC1 GPIO1 |IC1 GPIO2 |IC1 GPIO3 |IC1 GPIO4 |IC1 GPIO5 |IC1 Vref2 |
uint16_t _aux_voltages[TOTAL_IC][NUM_AUX_CH];

//Thermistor divider voltages read back from the peripheral board
// LSbit = 0.0001V, i.e. 65535 -> 6.5535V
// |  ts_voltages[0][0]  |  ts_voltages[0][1]  |  ts_voltages[0][2]  |    .....     |
// |---------------------|---------------------|---------------------|--------------|
// |IC1 module1 t1       |IC1 module1 t2       |IC1 module2 t1       |    .....     |
uint16_t temp_sensor_voltages[TOTAL_IC][NUM_TEMPS];

void ltc6811_init(volatile uint8_t* cs_port, uint8_t cs_pin);
// Half-duplex SPI write, then read
void SPI_write_then_read(uint8_t *tx_data, uint8_t tx_len, uint8_t* rx_data, uint8_t rx_len);

//Generic wakeup command to wake the ltc6813 from sleep
void wakeup_sleep(uint8_t total_ic);

void wakeup_idle(uint8_t total_ic);

void ltc6811_adcv(
        uint8_t MD, //ADC Mode
        uint8_t DCP, //Discharge Permit
        uint8_t CH //Cell Channels to be measured
        );

//This function will block operation until the ADC has finished it's conversion
uint32_t ltc6811_pollAdc(void);

/*
 * Reads and parses the ltc6811 cell voltage registers.
 */
int8_t ltc6811_rdcv(
        uint8_t total_ic, // the number of ICs in the system
        uint16_t cell_codes[][NUM_CELLS] // Array of the parsed cell codes
        //TODO should this be [TOTAL_IC][NUM_CELLS]
        );

void _ltc6811_rdcv_reg(uint8_t reg, //Determines which cell voltage register is read back
                        uint8_t total_ic, //the number of ICs in the daisy chain
                        uint8_t *data //An array of the unparsed cell codes
                    );


//Start a GPIO and Vref2 Conversion
// Just write the ADAX command
void ltc6811_adax(
        uint8_t MD, //ADC Mode
        uint8_t CHG //GPIO Channels to be measured)
    );

/*
   The function is used to parse the AUX responses from the LTC6811. This function will send the requested
   read commands parse the data and store the gpio voltages in aux_voltages variable
   */
int8_t ltc6811_rdaux(uint8_t reg, //Determines which GPIO voltage register is read back.
        uint8_t total_ic,//the number of ICs in the system
        uint16_t aux_voltages[][NUM_AUX_CH]//A two dimensional array of the gpio voltages.
    );

void _ltc6811_rdaux_reg(uint8_t reg, //Determines which GPIO voltage register is read back
        uint8_t total_ic, //The number of ICs in the system
        uint8_t *data //Array of the unparsed auxiliary codes
        );
/*
   Writes the COMM registers of a ltc6811 daisy chain
   */
void wrcomm(uint8_t total_ic, //The number of ICs being written to
            uint8_t comm[][6] //A two dimensional array of the comm data that will be written
            );

void stcomm(void);


void mux_disable(uint8_t total_ic, uint8_t i2c_address);

void mux_set_channel(uint8_t total_ic, uint8_t i2c_address, uint8_t channel);

uint16_t pec15_calc(uint8_t len,    //Number of bytes that will be used to calculate a PEC
                    uint8_t *data); //Array of data that will be used to calculate a PEC


#endif

/* What do we still have to do?
 *
 * In general:
 *  - Wakeup Sleep
 *
 * For voltage sensing:
 *  - adcv (start cell conversion)
 *  - pollADC (Wait for cell conversion to be done)
 *  - rdcv (read back cell voltages)
 *
 * For temp sensing:
 *  - I2C enable specific channels
 *  - I2C disable mux
 *  - adax (start aux voltage)
 *  - pollADC
 *  -
 */
