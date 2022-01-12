/*
 *  2019 BMS code
 *
 * @author Alex Hoppe '19
 * @author Vienna Scheyer '21
 * @author Corey Cochran-Lepiz '21
 */

#include <avr/io.h>
#include <util/delay.h>
#include <stdio.h>
#include <string.h>
#include "can_api.h"
#include "log_uart.h"
#include "ltc6811.h"

// BMS core hardware defines
#define LED1_PIN    PD5
#define LED2_PIN    PD6
#define LED3_PIN    PD7

#define LED_PORT    PORTD
#define LED_DDR     DDRD

#define RELAY_PIN   PC7
#define RELAY_PORT  PORTC
#define RELAY_DDR   DDRC

#define EXT_LED1_PIN    PB3
#define EXT_LED2_PIN    PB4
#define EXT_LED_PORT    PORTB

// gFlag register pre-defines
#define TRANSMIT_STATUS     0b00000001
#define UNDER_VOLTAGE       0b00000010
#define OVER_VOLTAGE        0b00000100
#define UNDER_TEMP          0b00001000
#define OVER_TEMP           0b00010000
#define SOFT_OVER_TEMP      0b00100000

// controls whether or not we UART anything
#define VERBOSE 1  // this will print PEC error count each cycle, any temperature and voltage cells that fault, 
//                    the voltages of a whole segment if it has an overvoltage fault
#define PRINT_TEMPS 0 // this will UART all temperatures

volatile uint8_t gFlag = 0;
uint8_t gStatusMessage[7];

//global BMS status indicator
uint8_t gBMSStatus = 0;

// Timer prescale vars and constants
uint8_t gCounterTransmit = 0;
const uint8_t transmit_match =100;

// UART buffer
char temp_msg[6*20+4+5] = "";

//Under Voltage and Over Voltage Thresholds
// TODO: Verify these numbers
const uint16_t OV_THRESHOLD = 42000;//35900; // Over voltage threshold ADC Code
const uint16_t UV_THRESHOLD = 30000; //20000;// Under voltage threshold ADC Code

//Temperature sensor voltage thresholds
const uint16_t OT_THRESHOLD = 728; // 60 deg. C
const uint16_t SOFT_OT_THRESHOLD = 1255; //45 deg. C
const uint16_t UT_THRESHOLD = 7384; //0 deg. C TODO: Confirm this is the case

// I2C MUX addresses from peripheral board
const uint8_t MUX1_ADDR = 0x90;
const uint8_t MUX2_ADDR = 0x92;
const uint8_t MUX3_ADDR = 0x94;

// BMS comms error gCounterTransmit
uint8_t missed_cycle_count = 0;
const uint8_t MAX_MISSED_CYCLES = 3;

// Scale down transmit task
ISR(TIMER0_COMPA_vect) {
    if (gCounterTransmit == transmit_match) {
        gCounterTransmit = 0;

        gFlag |= TRANSMIT_STATUS;
        LED_PORT ^= _BV(LED1_PIN);
        LED_PORT ^= _BV(LED2_PIN);

        // Set EXT LED1 high for start of cycle
        EXT_LED_PORT |= _BV(EXT_LED1_PIN);

    } else {
        gCounterTransmit++;
    }
}

void setup_timer_100Hz(void) {
    /* Set up TC0 in ctc mode, with OCR0A interrupt enabled and at 2 Hz */
    TCCR0A |= _BV(WGM01);       /* Set WGM[2:0] to 0b010: CTC mode (WGM2 is
                                 * TCCR0B) */
    TCCR0B |= _BV(CS02) | _BV(CS00);    /* Set up prescaler for TC0 to clk_io
                                         * divided by 1024:
                                         * 4MHz/1024 = 3.90625 kHz
                                         * CS0[2:0] = 0b101
                                         * (table 15-10) in datasheet */
    TIMSK0 |= _BV(OCIE0A);      /* Set interrupt enable for output channel A
                                 * interrupt on compare match */
    OCR0A = 39;                /* Set the match register to 195 (maximum
                                 * period), 3.90625 kHz / 39 = 100.16 Hz */
}

// READ VOLTAGES /////////////////////////////////////////////////////////////////////////////////////////
int8_t read_all_voltages(void) // Start Cell ADC Measurement
{
    int8_t error = 0;

    wakeup_sleep(TOTAL_IC);
    // Start a cell conversion on all cells
    ltc6811_adcv(MD_7KHZ_3KHZ, DCP_ENABLED, CELL_CH_ALL);
    // wait until ADC is finished(SEE LTC 6804 Datasheet Pg. 24)
    // Trefup is 4.4 mS max, plus 2.3mS conversion time for 7kHz mode

    //_delay_ms(7);
    ltc6811_pollAdc();

    //Read back and parse out ADC measurements
    wakeup_idle(TOTAL_IC); // Wake up the LTC6804 from idle after the delay
    error = ltc6811_rdcv(TOTAL_IC, cell_voltages);

    if (error == 0) {
        // Do value checking
        gFlag &= ~(OVER_VOLTAGE | UNDER_VOLTAGE);



        for (uint8_t ic = 0; ic < TOTAL_IC; ic++) {
            for (uint8_t cell = 0; cell < NUM_CELLS; cell++) {

                //Skip cells that are 0, i.e. cell 5,6 and 11,12
                if ((cell == 4) || (cell == 5) || (cell == 10) || (cell == 11)) continue;

                uint16_t cell_value = cell_voltages[ic][cell];

                if (cell_value > OV_THRESHOLD) {
                    gFlag |= OVER_VOLTAGE; // left out for now to prevent shutdown on overvolted cell
                    #if(VERBOSE==1)
                    sprintf( temp_msg, "OV ic: %u cell: %u v: %u", ic, cell, cell_value);
                    LOG_println(temp_msg, strlen(temp_msg));
                    #endif
                }
                else if (cell_value < UV_THRESHOLD) {
                    gFlag |= UNDER_VOLTAGE;
                    #if(VERBOSE==1)
                    sprintf( temp_msg, "UV ic: %u cell: %u v: %u", ic, cell, cell_value);
                    LOG_println(temp_msg, strlen(temp_msg));
                    #endif
                }
            }
        }
    }

    #if(VERBOSE==1)
        for (int i = 0; i < TOTAL_IC; i++) {
        sprintf(temp_msg, "v%d,%3d,%u,%u,%u,%u,"
                            "%u,%u,"
                            "%u,%u",
                                i,
                                error,
                                cell_voltages[i][0],
                                cell_voltages[i][1],
                                cell_voltages[i][2],
                                cell_voltages[i][3],
                                cell_voltages[i][6],
                                cell_voltages[i][7],
                                cell_voltages[i][8],
                                cell_voltages[i][9]);

        LOG_println(temp_msg, strlen(temp_msg));
        }
    #endif

    return error;
}

/* On each peripheral board, this function sets the MUX channel over I2C, then
 * starts an ADC conversion for aux voltage 1, GPIO1.
 * Then it reads back the aux voltage data for all of the boards
 * Then it parses those into the temp_sensor_voltages array.
 */
int8_t read_all_temperatures(void)
{
    int8_t error = 0;

    const uint8_t MUX_CHANNELS = 8;

    wakeup_sleep(TOTAL_IC);

    // Disable all MUXes
    mux_disable(TOTAL_IC, MUX1_ADDR);
    _delay_us(10);
    mux_disable(TOTAL_IC, MUX2_ADDR);
    _delay_us(10);
    mux_disable(TOTAL_IC, MUX3_ADDR);
    _delay_us(10);

    // First four thermistors are in MUX3
    for (uint8_t i = 0; i < 4; i++) {

        mux_set_channel(TOTAL_IC, MUX3_ADDR, i);
        _delay_us(10);                             //Spec is 1600ns from stop cond.
        ltc6811_adax(MD_7KHZ_3KHZ, AUX_CH_GPIO1); //start ADC measurement for GPIO CH 1
        ltc6811_pollAdc();
        error = ltc6811_rdaux(0,TOTAL_IC, _aux_voltages); //Parse all ADC measurements back

        // Grab aux voltages into the temp voltages array
        for (uint8_t ic = 0; ic < TOTAL_IC; ic++) {
            //First four are out of order, 0123 are 2_2, 2_1, 1_2, and 1_1 respectively
            temp_sensor_voltages[ic][3-i] = _aux_voltages[ic][0]; //Store temperatures
        }

    }

    // Disable MUX3, now iterate through MUX2 (for modules 3-6)
    mux_disable(TOTAL_IC, MUX3_ADDR);
    _delay_us(10);

    for (uint8_t i = 0; i < MUX_CHANNELS; i++) {

        mux_set_channel(TOTAL_IC, MUX2_ADDR, i);
        _delay_us(10);                             //Spec is 1600ns from stop cond.
        ltc6811_adax(MD_7KHZ_3KHZ, AUX_CH_GPIO1); //start ADC measurement for GPIO CH 1
        ltc6811_pollAdc();//only need to delay 500uS for GPIO1 conversion
        error = ltc6811_rdaux(0, TOTAL_IC, _aux_voltages); //Parse all ADC measurements back

        // Grab aux voltages into the temp voltages array
        for (uint8_t ic = 0; ic < TOTAL_IC; ic++) {
            //Sensors are in reverse order
            temp_sensor_voltages[ic][NUM_TEMPS-9-i] = _aux_voltages[ic][0]; //Store temperatures
        }

    }
    // Disable MUX2, now iterate through MUX1 (for modules 7-10)
    mux_disable(TOTAL_IC, MUX2_ADDR);
    _delay_us(10);

    for (uint8_t i = 0; i < MUX_CHANNELS; i++) {

        mux_set_channel(TOTAL_IC, MUX1_ADDR, i);
        _delay_us(10);                             //Spec is 1600ns from stop cond.
        ltc6811_adax(MD_7KHZ_3KHZ, AUX_CH_GPIO1); //start ADC measurement for GPIO CH 1
        ltc6811_pollAdc();                           //only need to delay 500uS for GPIO1 conversion
        error = ltc6811_rdaux(0, TOTAL_IC, _aux_voltages); //Parse all ADC measurements back

        // Grab aux voltages into the temp voltages array
        for (uint8_t ic = 0; ic < TOTAL_IC; ic++) {
            //Sensors are in reverse order, 0123 are 2_2, 2_1, 1_2, and 1_1 respectively
            temp_sensor_voltages[ic][NUM_TEMPS-1-i] = _aux_voltages[ic][0]; //Store temperatures
        }
    }

    mux_disable(TOTAL_IC, MUX1_ADDR);
    _delay_us(10);

    #if(PRINT_TEMPS==1)
    for(int ic = 0; ic < TOTAL_IC; ic++) {
        sprintf(temp_msg, "t%d,%3d,%5u,%5u,%5u,%5u,%5u,%5u,%5u,%5u,%5u,%5u,%5u,%5u,%5u,%5u,%5u,%5u,%5u,%5u,%5u,%5u", ic, error,
                        temp_sensor_voltages[ic][0],
                        temp_sensor_voltages[ic][1],
                        temp_sensor_voltages[ic][2],
                        temp_sensor_voltages[ic][3],
                        temp_sensor_voltages[ic][4],
                        temp_sensor_voltages[ic][5],
                        temp_sensor_voltages[ic][6],
                        temp_sensor_voltages[ic][7],
                        temp_sensor_voltages[ic][8],
                        temp_sensor_voltages[ic][9],
                        temp_sensor_voltages[ic][10],
                        temp_sensor_voltages[ic][11],
                        temp_sensor_voltages[ic][12],
                        temp_sensor_voltages[ic][13],
                        temp_sensor_voltages[ic][14],
                        temp_sensor_voltages[ic][15],
                        temp_sensor_voltages[ic][16],
                        temp_sensor_voltages[ic][17],
                        temp_sensor_voltages[ic][18],
                        temp_sensor_voltages[ic][19]
                        );

        LOG_println(temp_msg, strlen(temp_msg));
    }
    #endif

    if (error == 0) {
        // Check temperature values for in-range ness
        gFlag &= ~(OVER_TEMP | SOFT_OVER_TEMP | UNDER_TEMP);

        for (uint8_t ic = 0; ic < TOTAL_IC; ic ++) {
            for (uint8_t sensor = 0; sensor < NUM_TEMPS; sensor ++) {
                uint16_t sensor_value = temp_sensor_voltages[ic][sensor];
                if (sensor_value < SOFT_OT_THRESHOLD) {
                    gFlag |= SOFT_OVER_TEMP;
                    #if(VERBOSE==2)
                    sprintf( temp_msg, "SOT ic: %u cell: %u v: %u", ic, sensor, sensor_value);
                    LOG_println(temp_msg, strlen(temp_msg));
                    #endif
                }
                else if (sensor_value < OT_THRESHOLD) {
                    gFlag |= OVER_TEMP;
                    #if(VERBOSE==2)
                    sprintf( temp_msg, "OT ic: %u cell: %u v: %u", ic, sensor, sensor_value);
                    LOG_println(temp_msg, strlen(temp_msg));
                    #endif
                }
                else if (sensor_value > UT_THRESHOLD) {
                    gFlag |= UNDER_TEMP;
                    #if(VERBOSE==2)
                    sprintf( temp_msg, "UT ic: %u cell: %u t: %u", ic, sensor, sensor_value);
                    LOG_println(temp_msg, strlen(temp_msg));
                    #endif
                }
            }
        }
    }

    return error;
}

int main (void) {

    /* Set the data direction register so the led pin is output */
    LED_DDR |= _BV(LED1_PIN) | _BV(LED2_PIN) | _BV(LED3_PIN);
    DDRB |= _BV(EXT_LED1_PIN) | _BV(EXT_LED2_PIN);

    LED_PORT ^= _BV(LED3_PIN);

    sei();
    /* Initialize CAN */
    CAN_init(CAN_ENABLED);

    setup_timer_100Hz();

    LOG_init();

    SPI_init(SPI_FOSC_DIV_4, SPI_MODE_1_1, &PORTB, PB6);
    // MISO_iso pin is input because of SPI module. Write high for pull-up
    PORTB |= _BV(PB0);

    //Perform an initial check before we set the relay
    RELAY_DDR |= _BV(RELAY_PIN);
    read_all_voltages();
    read_all_temperatures();
    // If we've got no faults
    if (!(gFlag & (OVER_TEMP | UNDER_TEMP | OVER_VOLTAGE | UNDER_VOLTAGE))) {
        RELAY_PORT |= _BV(RELAY_PIN);
        gBMSStatus = 0xFF;
        LED_PORT |= _BV(LED3_PIN);
        EXT_LED_PORT |= _BV(EXT_LED2_PIN);
    }

    while (1) {
        // LED_PORT ^= _BV(LED3_PIN);
        // Transmit status task
        if (gFlag & TRANSMIT_STATUS) {
            gFlag &= ~TRANSMIT_STATUS;

            int8_t error = 0;
            error += read_all_voltages();
            error += read_all_temperatures();

            #if(VERBOSE==1)
            sprintf( temp_msg, "e %d", error);
            LOG_println(temp_msg, strlen(temp_msg));
            #endif

            // If we got a PEC error from any of those
            if (error != 0) {
                missed_cycle_count += 1;
            } else {
                missed_cycle_count = 0;
            }

            LED_PORT ^= _BV(LED2_PIN);
            EXT_LED_PORT &= ~_BV(EXT_LED1_PIN);

            // Actually build up a CAN message
            //Report relay status
            gStatusMessage[0] = bit_is_set(RELAY_PORT, RELAY_PIN) ? 0xFF : 0;
            // TODO: temperature
            gStatusMessage[1] = 100;
            // TODO: state of charge
            gStatusMessage[2] = 12;
            // Report BMS ok for BMS light
            gStatusMessage[3] = gBMSStatus;
            // Report regen status
            gStatusMessage[4] = 0;
            // Report current limiting
            gStatusMessage[5] = 0;
            // Report cell balancing status
            gStatusMessage[6] = 0;
            for(int j=0;j<32;j++){
                CAN_transmit(0, CAN_ID_BMS_CORE, CAN_LEN_BMS_CORE, gStatusMessage);
            }
            

        

            if ((gFlag & OVER_VOLTAGE) || (gFlag & UNDER_VOLTAGE) ||
                        (gFlag & OVER_TEMP) || (gFlag & UNDER_TEMP) ||
                        (missed_cycle_count >= MAX_MISSED_CYCLES)) {

                RELAY_PORT &= ~_BV(RELAY_PIN);// Commented out to prevent Shutdown of car.
                gBMSStatus = 0x00;
                LED_PORT &= ~_BV(LED3_PIN);
                EXT_LED_PORT &= ~_BV(EXT_LED2_PIN);

                // if (gFlag & OVER_VOLTAGE) {char flagmsg[]= "Over Voltage"; LOG_println(flagmsg, strlen(flagmsg));}
                // if (gFlag & UNDER_VOLTAGE) {char flagmsg[] = "Under Voltage"; LOG_println(flagmsg, strlen(flagmsg));}
                // if (gFlag & OVER_TEMP) {char flagmsg[] = "Over Temp"; LOG_println(flagmsg, strlen(flagmsg));}
                // if (gFlag & UNDER_TEMP) {char flagmsg[] = "Under Temp"; LOG_println(flagmsg, strlen(flagmsg));}
                // if (missed_cycle_count >= MAX_MISSED_CYCLES) {char flagmsg[] = "Missed more than `MAX_MISSED_CYCLES`"; LOG_println(flagmsg, strlen(flagmsg));}

            }
        }

    }
}
