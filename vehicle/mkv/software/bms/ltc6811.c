/*
 * OEM LTC6811 library
 *
 * Contains functions for abstracting out the LTC6811 interface
 * Much of this is pulled from the Linear Technology Arduino example code found
 * in the LTSketchbook, available online.
 * The sketch in question is the DC2259_test.ino sketch.
 *
 * @author Alex Hoppe '19
 * @author Vienna Scheyer '21
 */

#include "ltc6811.h"

// LTC6811 uses half-duplex SPI:
// Here's a helper function for that
void SPI_write_then_read(uint8_t *tx_data, uint8_t tx_len,
                        uint8_t* rx_data, uint8_t rx_len) {
    // Throw away initial data
    uint8_t tmp;

    SPI_start();
    for (uint8_t i = 0; i < tx_len; i++) {
        SPI_transfer(tx_data[i], &tmp);
    }
    for (uint8_t i = 0; i < rx_len; i++) {
        SPI_transfer(0x00, &rx_data[i]);
    }
}


void ltc6811_init(volatile uint8_t* cs_port, uint8_t cs_pin) {
    SPI_init(SPI_FOSC_DIV_4, SPI_MODE_1_1, cs_port, cs_pin);
}

//Generic wakeup command to wake the ltc6813 from sleep
void wakeup_sleep(uint8_t total_ic) {
    for (int i =0; i<total_ic+1; i++) {
        SPI_start(); // chip select
        _delay_us(300); // Guarantees the ltc6813 will be in standby
        SPI_end();
    }
}

void wakeup_idle(uint8_t total_ic) {
    for (int i =0; i<total_ic+1; i++) {
        SPI_start();
        _delay_us(2); //Guarantees the isoSPI will be in ready mode
        SPI_end();
    }
}

//This function starts a cell voltage conversion
void ltc6811_adcv(
        uint8_t MD, //ADC Mode
        uint8_t DCP, //Discharge Permit
        uint8_t CH //Cell Channels to be measured
        )
{
    uint8_t cmd[4];
    uint16_t cmd_pec;
    uint8_t md_bits;

    md_bits = (MD & 0x02) >> 1;
    cmd[0] = md_bits + 0x02;
    md_bits = (MD & 0x01) << 7;
    cmd[1] =  md_bits + 0x60 + (DCP<<4) + CH;
    cmd_pec = pec15_calc(2, cmd);
    cmd[2] = (uint8_t)(cmd_pec >> 8);
    cmd[3] = (uint8_t)(cmd_pec);

    SPI_start();
    uint8_t null;
    SPI_write_then_read(cmd, 4, &null, 0);

    _delay_us(4); //For up to 15 boards in series. See pg 69 in the ltc6804 datasheet.
    SPI_end();
    _delay_us(4);
}

// THIS FUNCTION DOES NOT WORK ON LTC6804 *************************************
//This function will block operation until the ADC has finished it's conversion
uint32_t ltc6811_pollAdc(void)
{
    uint32_t counter = 0;
    uint8_t finished = 0;
    uint8_t current_time = 0;
    uint8_t cmd[4];
    uint16_t cmd_pec;


    cmd[0] = 0x07;
    cmd[1] = 0x14;
    cmd_pec = pec15_calc(2, cmd);
    cmd[2] = (uint8_t)(cmd_pec >> 8);
    cmd[3] = (uint8_t)(cmd_pec);

    // Need something to pass to SPI_write_then_read
    uint8_t null;

    SPI_start();
    SPI_write_then_read(cmd, 4, &null, 0);

    while ((counter<200000)&&(finished == 0)) //Timeout of 200000
    {
        SPI_transfer(0xFF, &current_time);
        if (current_time>0)
        {
            finished = 1;
        }
        else
        {
            counter = counter + 10;
        }
    }

    _delay_us(4); //For up to 15 boards in series. See pg 69 in the ltc6804 datasheet.
    SPI_end();
    _delay_us(4);

    return counter;
}

/*
 * Reads and parses the ltc6811 cell voltage registers.
 */
int8_t ltc6811_rdcv(
        uint8_t total_ic, // the number of ICs in the system
        uint16_t cell_codes[][NUM_CELLS] // Array of the parsed cell codes
        )
{
    const uint8_t NUM_RX_BYT = 8; // Number of bytes per RDCV_REG command per IC
    const uint8_t BYT_IN_REG = 6; // Number of bytes in each CV register group
    const uint8_t CELL_IN_REG = 3; // Number of cells represented by CV register group
    const uint8_t NUM_CV_REG = 4; // CV register groups: 1-3, 4-6, 7-9, 10-12

    uint8_t pec_error = 0;
    uint16_t parsed_cell;
    uint16_t received_pec;
    uint16_t data_pec;
    uint8_t data_counter = 0;
    uint8_t rx_data[NUM_RX_BYT * TOTAL_IC]; // Single received data stream from all ICs on isoSPI bus

    // executes once for each of the ltc6811 cell voltage register groups
    for (uint8_t cell_reg = 1; cell_reg < (NUM_CV_REG + 1); cell_reg++)
    {
        data_counter = 0;

    // Reads a single Cell voltage register
        _ltc6811_rdcv_reg(cell_reg, total_ic, rx_data );

    // Parses data stream into actual cell voltages, organized by IC number

        // executes for every ltc6811 in the daisy chain
        for (uint8_t current_ic = 0 ; current_ic < total_ic; current_ic++)
        {
            // current_ic is used as the IC counter

            // This loop parses the read back data into cell voltages, it
            // loops once for each of the 3 cell voltage codes in the register
            for (uint8_t current_cell = 0; current_cell<CELL_IN_REG; current_cell++)
            {

                //Each cell code is received as two bytes and is combined to
                parsed_cell = rx_data[data_counter] + (rx_data[data_counter + 1] << 8);
                // create the parsed cell voltage code

                cell_codes[current_ic][current_cell  + ((cell_reg - 1) * CELL_IN_REG)] = parsed_cell;
                // Because cell voltage codes are two bytes the data counter
                // must increment by two for each parsed cell code
                data_counter = data_counter + 2;

            }

            //The received PEC for the current_ic is transmitted as the 7th and 8th
            received_pec = (rx_data[data_counter] << 8) + rx_data[data_counter+1]; //TODO << 8?

            //after the 6 cell voltage data bytes
            data_pec = pec15_calc(BYT_IN_REG, &rx_data[current_ic * NUM_RX_BYT]);
            if (received_pec != data_pec)
            {
                //The pec_error variable is simply set negative if any PEC errors
                //are detected in the serial data
                pec_error = -1;

            }

            //Because the transmitted PEC code is 2 bytes long the data_counter
            //must be incremented by 2 bytes to point to the next ICs cell
            //voltage data
            data_counter=data_counter+2;
        }
    }

    return pec_error;
}

//Read the raw data from the ltc6811 cell voltage register
void _ltc6811_rdcv_reg(uint8_t reg, //Determines which cell voltage register is read back
        uint8_t total_ic, //the number of ICs in the daisy chain
        uint8_t *data //An array of the unparsed cell codes
        )
{
    const uint8_t REG_LEN = 8; //number of bytes in each CV register group + 2 bytes for the PEC
    uint8_t cmd[4];
    uint16_t cmd_pec;

    if (reg == 1)     //1: RDCVA
    {
        cmd[1] = 0x04;
        cmd[0] = 0x00;
    }
    else if (reg == 2) //2: RDCVB
    {
        cmd[1] = 0x06;
        cmd[0] = 0x00;
    }
    else if (reg == 3) //3: RDCVC
    {
        cmd[1] = 0x08;
        cmd[0] = 0x00;
    }
    else if (reg == 4) //4: RDCVD
    {
        cmd[1] = 0x0A;
        cmd[0] = 0x00;
    }


    cmd_pec = pec15_calc(2, cmd);
    cmd[2] = (uint8_t)(cmd_pec >> 8);
    cmd[3] = (uint8_t)(cmd_pec);


    SPI_start();
    SPI_write_then_read(cmd, 4, data, (REG_LEN * total_ic));

    _delay_us(4); //For up to 15 boards in series. See pg 69 in the ltc6804 datasheet.
    SPI_end();
    _delay_us(4);
}

//Start a GPIO and Vref2 Conversion
// Just write the ADAX command
void ltc6811_adax(
        uint8_t MD, //ADC Mode
        uint8_t CHG //GPIO Channels to be measured)
    )
{
    uint8_t cmd[4];
    uint16_t cmd_pec;
    uint8_t md_bits;

    md_bits = (MD & 0x02) >> 1;
    cmd[0] = md_bits + 0x04;
    md_bits = (MD & 0x01) << 7;
    cmd[1] = md_bits + 0x60 + CHG ;

    cmd_pec = pec15_calc(2, cmd);
    cmd[2] = (uint8_t)(cmd_pec >> 8);
    cmd[3] = (uint8_t)(cmd_pec);

    //wakeup_idle (); //This will guarantee that the ltc6811 isoSPI port is awake. This command can be removed.
    SPI_start();
    uint8_t null;
    SPI_write_then_read(cmd, 4, &null, 0);

    _delay_us(4); //For up to 15 boards in series. See pg 69 in the ltc6804 datasheet.
    SPI_end();
    _delay_us(4);
}

/*
   The function is used to parse the AUX responses from the LTC6811. This function will send the requested
   read commands parse the data and store the gpio voltages in aux_voltages variable
   */
int8_t ltc6811_rdaux(uint8_t reg, //Determines which GPIO voltage register is read back.
        uint8_t total_ic,//the number of ICs in the system
        uint16_t aux_voltages[][NUM_AUX_CH]//A two dimensional array of the gpio voltages.
        )
{
    const uint8_t NUM_RX_BYT = 8;
    const uint8_t BYT_IN_REG = 6;
    const uint8_t GPIO_IN_REG = 3;
    const uint8_t NUM_GPIO_REG = 2;

    uint8_t data_counter = 0;
    int8_t pec_error = 0;
    uint16_t parsed_aux;
    uint16_t received_pec;
    uint16_t data_pec;

    uint8_t data[NUM_RX_BYT*total_ic];

    // If 0, read all of em.
    if (reg == 0) {

        for (uint8_t gpio_reg = 1; gpio_reg<NUM_GPIO_REG+1; gpio_reg++) {                //executes once for each of the ltc6811 aux voltage registers
            data_counter = 0;
            _ltc6811_rdaux_reg(gpio_reg, total_ic,data);                 //Reads the raw auxiliary register data into the data[] array

            for (uint8_t current_ic = 0 ; current_ic < total_ic; current_ic++){      // executes for every ltc6811 in the daisy chain
            // current_ic is used as the IC counter

                for (uint8_t current_gpio = 0; current_gpio< GPIO_IN_REG; current_gpio++){ // This loop parses the read back data into GPIO voltages, it
                    // loops once for each of the 3 gpio voltage codes in the register

                    parsed_aux = data[data_counter] + (data[data_counter+1]<<8);              //Each gpio codes is received as two bytes and is combined to
                    // create the parsed gpio voltage code

                    aux_voltages[current_ic][current_gpio +((gpio_reg-1)*GPIO_IN_REG)] = parsed_aux;
                    data_counter=data_counter+2;    //Because gpio voltage codes are two bytes the data counter
                                                    //must increment by two for each parsed gpio voltage code
                }

                //The received PEC for the current_ic is transmitted as the 7th and 8th after the 6 gpio voltage data bytes
                received_pec = (data[data_counter]<<8)+ data[data_counter+1];

                data_pec = pec15_calc(BYT_IN_REG, &data[current_ic*NUM_RX_BYT]);
                if (received_pec != data_pec) {
                    pec_error = -1;     //The pec_error variable is simply set negative if any PEC errors
                                        //are detected in the received serial data
                }

                data_counter=data_counter+2;                        //Because the transmitted PEC code is 2 bytes long the data_counter
                //must be incremented by 2 bytes to point to the next ICs gpio voltage data
            }
        }
    }
    else
    {
        _ltc6811_rdaux_reg(reg, total_ic, data);
        for (int current_ic = 0 ; current_ic < total_ic; current_ic++)            // executes for every ltc6811 in the daisy chain
        {
            // current_ic is used as an IC counter

            for (int current_gpio = 0; current_gpio<GPIO_IN_REG; current_gpio++)    // This loop parses the read back data. Loops
            {
                // once for each aux voltage in the register

                parsed_aux = (data[data_counter] + (data[data_counter+1]<<8));        //Each gpio codes is received as two bytes and is combined to
                // create the parsed gpio voltage code
                aux_voltages[current_ic][current_gpio +((reg-1)*GPIO_IN_REG)] = parsed_aux;
                data_counter=data_counter+2;                      //Because gpio voltage codes are two bytes the data counter
                //must increment by two for each parsed gpio voltage code
            }

            received_pec = (data[data_counter]<<8) + data[data_counter+1];         //The received PEC for the current_ic is transmitted as the 7th and 8th
            //after the 6 gpio voltage data bytes
            data_pec = pec15_calc(BYT_IN_REG, &data[current_ic*NUM_RX_BYT]);
            if (received_pec != data_pec)
            {
                pec_error = -1;                               //The pec_error variable is simply set negative if any PEC errors
                //are detected in the received serial data
            }

            data_counter=data_counter+2;                        //Because the transmitted PEC code is 2 bytes long the data_counter
            //must be incremented by 2 bytes to point to the next ICs gpio voltage data
        }
    }
    return (pec_error);
}

/*
   The function reads a single GPIO voltage register and stores thre read data
   in the *data point as a byte array. This function is rarely used outside of
   the ltc6811_rdaux() command.
   */
void _ltc6811_rdaux_reg(uint8_t reg, //Determines which GPIO voltage register is read back
        uint8_t total_ic, //The number of ICs in the system
        uint8_t *data //Array of the unparsed auxiliary codes
        )
{
    const uint8_t REG_LEN = 8; // number of bytes in the register + 2 bytes for the PEC
    uint8_t cmd[4];
    uint16_t cmd_pec;

    if (reg == 1)     //Read back auxiliary group A
    {
        cmd[1] = 0x0C;
        cmd[0] = 0x00;
    }
    else if (reg == 2)  //Read back auxiliary group B
    {
        cmd[1] = 0x0e;
        cmd[0] = 0x00;
    }

    cmd_pec = pec15_calc(2, cmd);
    cmd[2] = (uint8_t)(cmd_pec >> 8);
    cmd[3] = (uint8_t)(cmd_pec);

    SPI_start(); //set CS low
    SPI_write_then_read(cmd,4,data,(REG_LEN*total_ic));

    _delay_us(4); //For up to 15 boards in series. See pg 69 in the ltc6804 datasheet.
    SPI_end();
    _delay_us(4);
}

/*
   Writes the COMM registers of a ltc6811 daisy chain
   */
void wrcomm(uint8_t total_ic, //The number of ICs being written to
        uint8_t comm[][6] //A two dimensional array of the comm data that will be written
        )
{
    const uint8_t BYTES_IN_REG = 6;
    const uint8_t CMD_LEN = 4+(8*total_ic);
    uint16_t comm_pec;
    uint16_t cmd_pec;
    uint8_t cmd_index; //command counter
    uint8_t cmd[CMD_LEN];

    cmd[0] = 0x07;
    cmd[1] = 0x21;
    cmd_pec = pec15_calc(2, cmd);
    cmd[2] = (uint8_t)(cmd_pec >> 8);
    cmd[3] = (uint8_t)(cmd_pec);

    cmd_index = 4;
    for (uint8_t current_ic = total_ic; current_ic > 0; current_ic--)       // executes for each ltc6811 in daisy chain, this loops starts with
    {
        // the last IC on the stack. The first configuration written is
        // received by the last IC in the daisy chain

        for (uint8_t current_byte = 0; current_byte < BYTES_IN_REG; current_byte++) // executes for each of the 6 bytes in the CFGR register
        {
            // current_byte is the byte counter

            cmd[cmd_index] = comm[current_ic-1][current_byte];            //adding the config data to the array to be sent
            cmd_index = cmd_index + 1;
        }
        comm_pec = (uint16_t)pec15_calc(BYTES_IN_REG, &comm[current_ic-1][0]);    // calculating the PEC for each ICs configuration register data
        cmd[cmd_index] = (uint8_t)(comm_pec >> 8);
        cmd[cmd_index + 1] = (uint8_t)comm_pec;
        cmd_index = cmd_index + 2;
    }

    SPI_start();
    uint8_t null;
    SPI_write_then_read(cmd, CMD_LEN, &null, 0);

    _delay_us(4); //For up to 15 boards in series. See pg 69 in the ltc6804 datasheet.
    SPI_end();
    _delay_us(4);
}

/*
   Shifts data in COMM register out over ltc6811 SPI/I2C port
   */
void stcomm(void)
{

    uint8_t cmd[4];
    uint16_t cmd_pec;

    cmd[0] = 0x07;
    cmd[1] = 0x23;
    cmd_pec = pec15_calc(2, cmd);
    cmd[2] = (uint8_t)(cmd_pec >> 8);
    cmd[3] = (uint8_t)(cmd_pec);

    //wakeup_idle (); //This will guarantee that the ltc6811 isoSPI port is awake. This command can be removed.
    SPI_start();

    uint8_t null[4];
    SPI_transfer_array(cmd, null, 4);         //Read the configuration data of all ICs on the daisy chain into

    for (int i = 0; i<9; i++)
    {
        SPI_transfer(0xFF, &null[0]);
    }

    _delay_us(4); //For up to 15 boards in series. See pg 69 in the ltc6804 datasheet.
    SPI_end();
    _delay_us(4);
}

/*
   Reads COMM registers of a ltc6811 daisy chain
   */
int8_t rdcomm(uint8_t total_ic, //Number of ICs in the system
        uint8_t r_comm[][8] //A two dimensional array that the function stores the read configuration data.
        )
{
    const uint8_t BYTES_IN_REG = 8;

    uint8_t cmd[4];
    int8_t pec_error = 0;
    uint16_t cmd_pec;
    uint16_t data_pec;
    uint16_t received_pec;

    uint8_t rx_data[BYTES_IN_REG*total_ic];

    cmd[0] = 0x07;
    cmd[1] = 0x22;
    cmd_pec = pec15_calc(2, cmd);
    cmd[2] = (uint8_t)(cmd_pec >> 8);
    cmd[3] = (uint8_t)(cmd_pec);

    //wakeup_idle (); //This will guarantee that the ltc6811 isoSPI port is awake. This command can be removed.
    SPI_start();
    SPI_write_then_read(cmd, 4, rx_data, (BYTES_IN_REG*total_ic));         //Read the configuration data of all ICs on the daisy chain into

    _delay_us(4); //For up to 15 boards in series. See pg 69 in the ltc6804 datasheet.
    SPI_end();
    _delay_us(4);

    for (uint8_t current_ic = 0; current_ic < total_ic; current_ic++)       //executes for each ltc6811 in the daisy chain and packs the data
    {
        //into the r_comm array as well as check the received Config data
        //for any bit errors
        for (uint8_t current_byte = 0; current_byte < BYTES_IN_REG; current_byte++)
        {
            r_comm[current_ic][current_byte] = rx_data[current_byte + (current_ic*BYTES_IN_REG)];
        }
        received_pec = (r_comm[current_ic][6]<<8) + r_comm[current_ic][7];
        data_pec = pec15_calc(6, &r_comm[current_ic][0]);
        if (received_pec != data_pec)
        {
            pec_error = -1;
        }
    }

    return(pec_error);
}

void write_i2c(uint8_t total_ic, uint8_t address, uint8_t command, uint8_t *data, uint8_t data_len)
{

    // Definitions for LTC6804 comm registers for I2C actions
    // const uint8_t STOP = 0x01;
    const uint8_t START = 0x60;
    // const uint8_t ACK = 0x00;
    const uint8_t NACK = 0x08;
    const uint8_t BLANK = 0x00;
    const uint8_t NO_TRANSMIT = 0x70;
    const uint8_t NACK_STOP = 0x09;

    uint8_t comm[total_ic][6];

    // Since the device only has 6 COMM registers and needs extra space for other
    // I2C actions, we can only send 3 bytes at a time over I2C. For more, we need
    // to loop through the I2C send process a couple of times, hence loop_count.
    uint8_t loop_count;
    uint8_t remainder = 0;

    uint8_t transmitted_bytes = 0;
    uint8_t data_counter = 0;

    if (((data_len)%3) == 0)
    {
        loop_count = ((data_len)/3);
    }
    else
    {
        loop_count = ((data_len)/3);
        remainder = data_len - (loop_count*3);
        loop_count++;
    }

    // Fill in comm registers for the address and command
    for(uint8_t i=0; i < TOTAL_IC; i++) {
        comm[i][0] = START;//NO_TRANSMIT; //
        comm[i][1] = NACK_STOP;//BLANK ; //
        comm[i][2] = START | (address >> 4); //
        comm[i][3] = (address << 4) | NACK ; //
        comm[i][4] = BLANK | (command >> 4);
        comm[i][5] = (command << 4) | NACK;
    }

    if (loop_count == 0) { // if there is no data, free up the bus
        for(uint8_t i=0; i < TOTAL_IC; i++){
            comm[i][5] = (command << 4) | NACK_STOP;
        }
    }

    // Send out the address and command
    wrcomm(total_ic,comm);
    // Start COMM
    stcomm();

    // If there's data to send as well, divide it into chunks of 3 (WRITE)
    transmitted_bytes = 0;
    for (uint8_t i=0; i < loop_count; i++)
    {
        if ((i == (loop_count-1)) && (remainder != 0)) //need to pad becuase we don't have multiple of 3 data bytes
        {
            for (uint8_t k=0; k<remainder; k++)
            {
                comm[0][transmitted_bytes] = BLANK + (data[data_counter] >> 4); //
                if (k!=(remainder - 1))
                {
                    comm[0][transmitted_bytes + 1] = \
                        (data[data_counter] << 4) | NACK;
                }
                else
                {
                    comm[0][transmitted_bytes+1] = (data[data_counter] << 4) | NACK_STOP;
                }

                data_counter++;
                transmitted_bytes = transmitted_bytes +2;
            }
            for (uint8_t k=0; k<(3-remainder); k++)
            {
                comm[0][transmitted_bytes] = NO_TRANSMIT; //
                comm[0][transmitted_bytes+1] =  BLANK ; //
                transmitted_bytes = transmitted_bytes + 2;
            }
            for(uint8_t i=1; i<total_ic; i++){
                for(uint8_t j=0; j<6; j++){
                    comm[i][j] = comm[0][j];
                }
            }
            wrcomm(1,comm);
            stcomm();
        }
        // don't need to pad because we have a multiple of 3 data bytes
        else
        {
            for (uint8_t k=0; k<3; k++)
            {
                comm[0][k*2] = BLANK + (data[data_counter] >> 4); //
                if (k!=2){comm[0][(k*2)+1] = (data[data_counter]<<4) | NACK ;} //
                else if(remainder!=0){ comm[0][(k*2)+1] = (data[data_counter]<<4) | NACK ;}
                else { comm[0][(k*2)+1] = (data[data_counter]<<4) | NACK_STOP ;}
                data_counter++;
            }
            for(uint8_t i=1; i<total_ic; i++){
                for(uint8_t j=0; j<6; j++){
                    comm[i][j] = comm[0][j];
                }
            }
            wrcomm(1,comm);
            stcomm();
        }
    }
}

void mux_disable(uint8_t total_ic, uint8_t i2c_address) {
    uint8_t command = 0x00;
    write_i2c(total_ic, i2c_address, command, 0, 0);
}

void mux_set_channel(uint8_t total_ic, uint8_t i2c_address, uint8_t channel) {
    uint8_t command = 0x08 | channel;
    write_i2c(total_ic, i2c_address, command, 0, 0); //(total_ic, address, command, data, data_length)
}


const uint16_t crc15Table[256] PROGMEM = {0x0,0xc599, 0xceab, 0xb32, 0xd8cf, 0x1d56, 0x1664, 0xd3fd, 0xf407, 0x319e, 0x3aac,  //!<precomputed CRC15 Table
                               0xff35, 0x2cc8, 0xe951, 0xe263, 0x27fa, 0xad97, 0x680e, 0x633c, 0xa6a5, 0x7558, 0xb0c1,
                               0xbbf3, 0x7e6a, 0x5990, 0x9c09, 0x973b, 0x52a2, 0x815f, 0x44c6, 0x4ff4, 0x8a6d, 0x5b2e,
                               0x9eb7, 0x9585, 0x501c, 0x83e1, 0x4678, 0x4d4a, 0x88d3, 0xaf29, 0x6ab0, 0x6182, 0xa41b,
                               0x77e6, 0xb27f, 0xb94d, 0x7cd4, 0xf6b9, 0x3320, 0x3812, 0xfd8b, 0x2e76, 0xebef, 0xe0dd,
                               0x2544, 0x2be, 0xc727, 0xcc15, 0x98c, 0xda71, 0x1fe8, 0x14da, 0xd143, 0xf3c5, 0x365c,
                               0x3d6e, 0xf8f7,0x2b0a, 0xee93, 0xe5a1, 0x2038, 0x7c2, 0xc25b, 0xc969, 0xcf0, 0xdf0d,
                               0x1a94, 0x11a6, 0xd43f, 0x5e52, 0x9bcb, 0x90f9, 0x5560, 0x869d, 0x4304, 0x4836, 0x8daf,
                               0xaa55, 0x6fcc, 0x64fe, 0xa167, 0x729a, 0xb703, 0xbc31, 0x79a8, 0xa8eb, 0x6d72, 0x6640,
                               0xa3d9, 0x7024, 0xb5bd, 0xbe8f, 0x7b16, 0x5cec, 0x9975, 0x9247, 0x57de, 0x8423, 0x41ba,
                               0x4a88, 0x8f11, 0x57c, 0xc0e5, 0xcbd7, 0xe4e, 0xddb3, 0x182a, 0x1318, 0xd681, 0xf17b,
                               0x34e2, 0x3fd0, 0xfa49, 0x29b4, 0xec2d, 0xe71f, 0x2286, 0xa213, 0x678a, 0x6cb8, 0xa921,
                               0x7adc, 0xbf45, 0xb477, 0x71ee, 0x5614, 0x938d, 0x98bf, 0x5d26, 0x8edb, 0x4b42, 0x4070,
                               0x85e9, 0xf84, 0xca1d, 0xc12f, 0x4b6, 0xd74b, 0x12d2, 0x19e0, 0xdc79, 0xfb83, 0x3e1a, 0x3528,
                               0xf0b1, 0x234c, 0xe6d5, 0xede7, 0x287e, 0xf93d, 0x3ca4, 0x3796, 0xf20f, 0x21f2, 0xe46b, 0xef59,
                               0x2ac0, 0xd3a, 0xc8a3, 0xc391, 0x608, 0xd5f5, 0x106c, 0x1b5e, 0xdec7, 0x54aa, 0x9133, 0x9a01,
                               0x5f98, 0x8c65, 0x49fc, 0x42ce, 0x8757, 0xa0ad, 0x6534, 0x6e06, 0xab9f, 0x7862, 0xbdfb, 0xb6c9,
                               0x7350, 0x51d6, 0x944f, 0x9f7d, 0x5ae4, 0x8919, 0x4c80, 0x47b2, 0x822b, 0xa5d1, 0x6048, 0x6b7a,
                               0xaee3, 0x7d1e, 0xb887, 0xb3b5, 0x762c, 0xfc41, 0x39d8, 0x32ea, 0xf773, 0x248e, 0xe117, 0xea25,
                               0x2fbc, 0x846, 0xcddf, 0xc6ed, 0x374, 0xd089, 0x1510, 0x1e22, 0xdbbb, 0xaf8, 0xcf61, 0xc453,
                               0x1ca, 0xd237, 0x17ae, 0x1c9c, 0xd905, 0xfeff, 0x3b66, 0x3054, 0xf5cd, 0x2630, 0xe3a9, 0xe89b,
                               0x2d02, 0xa76f, 0x62f6, 0x69c4, 0xac5d, 0x7fa0, 0xba39, 0xb10b, 0x7492, 0x5368, 0x96f1, 0x9dc3,
                               0x585a, 0x8ba7, 0x4e3e, 0x450c, 0x8095
                                         };

uint16_t pec15_calc(uint8_t len,    //Number of bytes that will be used to calculate a PEC
                    uint8_t *data) //Array of data that will be used to calculate a PEC
{
    uint16_t remainder, addr;

    remainder = 16;//initialize the PEC
    for (uint8_t i = 0; i<len; i++) // loops for each byte in data array
    {
        addr = ((remainder>>7)^data[i])&0xff;//calculate PEC table address
        remainder = (remainder<<8)^pgm_read_word_near(crc15Table+addr);
    }
    return(remainder*2);//The CRC15 has a 0 in the LSB so the remainder must be multiplied by 2
}
/* What do we still have to do?
 *
 * In general:
 *  - Wakeup Sleep
 *
 * For voltage sensing:
 *x  - adcv (start cell conversion)
 *x  - pollADC (Wait for cell conversion to be done)
 *x  - rdcv (read back cell voltages)
 *
 * For temp sensing:
 *  - I2C enable specific channels
 *  - I2C disable mux
 *          - mux_disable
            - mux_set_channel
 *  - adax (start aux voltage)
 *  - pollADC
 *  -
 */
