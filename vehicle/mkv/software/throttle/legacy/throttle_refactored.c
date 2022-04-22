#include "libs/adc/api.h"
#include "libs/can/api.h"
#include "libs/timer/api.h"
#include <avr/interrupt.h>

#include "libs/gpio/api.h"
#include "throttle_config.h"

#include <stdbool.h>
#include <stdint.h>

// Port Macros
#define THROTTLE_PORT   PORTC
#define DRIVE_MODE_PORT PORTD
#define PLED1_PORT      PORTC
#define PLED2_PORT      PORTB
#define PLED3_PORT      PORTB
#define EXT_LED_PORT    PORTB

// CAN Macros
#define CAN_THROTTLE 0
#define CAN_BOTS     1
#define CAN_IS       2
#define CAN_ESTOP    3

// Mailbox Macros
// Input
#define MOB_BRAKELIGHT 0
#define MOB_DASHBOARD  1
#define MOB_PANIC      2
// Output
#define MOB_BROADCAST       3
#define MOB_MOTORCONTROLLER 4

// Flags
#define FLAG_BRAKE          0
#define FLAG_THROTTLE_BRAKE 1
#define FLAG_ESTOP          2
#define FLAG_IS             3
#define FLAG_BOTS           4
#define FLAG_MOTOR_ON       5
#define FLAG_THROTTLE_10    6
#define FLAG_PANIC          7

// Voltage Reference for Drive Mode Select
#define STANDARD_LOWER_BOUND     0
#define ACCELERATION_LOWER_BOUND 0
#define SKIDPAD_LOWER_BOUND      0
#define AUTOCROSS_LOWER_BOUND    0
#define ENDURANCE_LOWER_BOUND    0

#define ROLLING_AVG_SIZE 8

#define UPDATE_STATUS 1

#define ADC_ERROR 6
#define DEAD_ZONE 64

//********************Global variables***************
uint8_t gFlag = 0; // Global Flag. Tells us that gFlag will change and to assign
                   // it to an unsigned 8bit integer
uint8_t gTimerFlag = 0;

uint16_t gDriveModeVoltage = 0;
uint8_t gDriveMode = 0;
/* Drive modes:
   0 = error (no signal recieved, default to standard)
   1 = standard (linear torque request)
   2 = acceleration
   3 = skid pad
   4 = autocross
   5 = endurance
 */
char uart_buf[64];
uint8_t gError = 0b00000000;
/* Error definitions:
   0 = No errors
   1 = Drive mode error
 */

uint16_t gThrottle1Voltage = 0;
uint16_t gThrottle2Voltage = 0;
uint16_t gThrottle1In = 0; // throttle position mapped from 0 to 255
uint16_t gThrottle2In = 0; // throttle position mapped from 0 to 255
uint8_t gThrottle1Out = 0; // basically same as g throttle ins
uint8_t gThrottle2Out = 0;

uint8_t gThrottleArrayIndex = 0;
// uint8_t gAverageSize = 8;
uint8_t gThrottleArray[ROLLING_AVG_SIZE];
uint16_t gRollingSum = 0;
uint8_t gThrottleOut
    = 0; // Rolling average of throttle outputs. (i.e. rolling sum of both
         // throttle outputs over time divided by size of rolling sum)
volatile uint8_t msg;

// Throttle mapping values
// Throttle values are capped to this range
// Values set last on Oct 12 by Alex Wenstrup
const uint16_t throttle1_HIGH = 654;
const uint16_t throttle1_LOW = 154 + DEAD_ZONE;
const uint16_t throttle2_HIGH = 1016;
const uint16_t throttle2_LOW = 234 + DEAD_ZONE;

uint8_t throttle10Counter = 0;
const uint8_t throttle10Ticks
    = 6; // number of measurements that corespond to an implausibility error

uint8_t gCANMessage[4] = { 0, 0, 0, 0 };
uint8_t gCANMotorController[8] = { 0, 0, 0, 0, 0, 0, 0, 0 };

uint8_t gBrakeLightCan[7] = { 0, 0, 0, 0, 0, 0, 0 };

uint8_t clock_prescale = 0;

uint8_t timer_max = 0; // SET TO 0 BEFORE GOING HV

volatile bool send_can = false;

//********************Functions*************************
//*************ISRs*****************

ISR(CAN_INT_vect) {
    /*
       CAN Interupt
       Listens for CAN messages from the brakes,
       start button (through the dashboard), and panic
     */

    // Brakelight
    CANPAGE = (MOB_BRAKELIGHT << MOBNB0);
    if (bit_is_set(CANSTMOB, RXOK)) {
        // Gets the third value of of the message
        gBrakeLightCan[0] = CANMSG;
        gBrakeLightCan[1] = CANMSG;
        gBrakeLightCan[2] = CANMSG;
        gBrakeLightCan[3] = CANMSG;
        gBrakeLightCan[4] = CANMSG;
        gBrakeLightCan[5] = CANMSG;
        gBrakeLightCan[6] = CANMSG;

        if (gBrakeLightCan[2] == 0xFF) { // if true, brake is activated
            gFlag |= _BV(FLAG_BRAKE); // _BV(thing) = (1 << thing) 00000001
        }

        else if ((gThrottle1Out == 0x00 || gThrottle2Out == 0x00)
                 && gBrakeLightCan[2] == 0x00) {
            gFlag &= ~_BV(FLAG_BRAKE);
        }

        CANSTMOB = 0x00;
        CAN_wait_on_receive(MOB_BRAKELIGHT, CAN_ID_BRAKE_LIGHT,
                            CAN_LEN_BRAKE_LIGHT, 0xFF);
    }

    // Start button
    CANPAGE = (MOB_DASHBOARD << MOBNB0);
    if (bit_is_set(CANSTMOB, RXOK)) {
        volatile uint8_t msg = CANMSG;

        if (msg == 0xFF) {
            gFlag |= _BV(FLAG_MOTOR_ON);
            // PLED1_PORT |= _BV(PLED1);
            PLED2_PORT ^= _BV(PLED2);
        } else {
            gFlag &= ~_BV(FLAG_MOTOR_ON);
            PLED1_PORT ^= _BV(PLED1);
        }

        CANSTMOB = 0x00;
        CAN_wait_on_receive(MOB_DASHBOARD, CAN_ID_DASHBOARD, CAN_LEN_DASHBOARD,
                            0xFF);
    }

    // Panic
    CANPAGE = (MOB_PANIC << MOBNB0);
    if (bit_is_set(CANSTMOB, RXOK)) {
        volatile uint8_t msg = CANMSG;

        if (msg == 0xFF) {
            gFlag |= _BV(FLAG_PANIC);

        } else {
            gFlag &= ~_BV(FLAG_PANIC);
        }

        CANSTMOB = 0x00;
        CAN_wait_on_receive(MOB_PANIC, CAN_ID_PANIC, CAN_LEN_PANIC, 0xFF);
    }
}

ISR(PCINT0_vect) {
    /*
       Checks if the shutdown circuit
       nodes are open or closed, and sets flags accordingly
     */
    if (bit_is_clear(PINB, SS_IS)) {
        gFlag |= _BV(FLAG_IS);
    } else {
        gFlag &= ~_BV(FLAG_IS);
    }

    if (bit_is_clear(PINB, SS_ESTOP)) {
        gFlag |= _BV(FLAG_ESTOP);
    } else {
        gFlag &= ~_BV(FLAG_ESTOP);
    }

    if (bit_is_clear(PINB, SS_BOTS)) {
        gFlag |= _BV(FLAG_BOTS);
    } else {
        gFlag &= ~_BV(FLAG_BOTS);
    }
}
void timer0_callback(void) {
    send_can = true;
}

void initMC(void) {
    gCANMotorController[0] = 0;
    gCANMotorController[1] = 0;
    gCANMotorController[2] = 0;
    gCANMotorController[3] = 0;
    gCANMotorController[4] = 1; // anticlockwise
    gCANMotorController[5] = 0;
    gCANMotorController[6] = 0;
    gCANMotorController[7] = 0;

    mc_msg.data = gCANMotorController;

    can_send(&mc_msg)
}

void mapThrottle(void) {
    // Map ADC to 0-255
    uint32_t map1;
    uint32_t map2;

    uint16_t v1 = gThrottle1Voltage >> 2;
    uint16_t v2 = gThrottle2Voltage >> 2;

    uint16_t t1h = throttle1_HIGH >> 2;
    uint16_t t1l = throttle1_LOW >> 2;
    uint16_t t2h = throttle2_HIGH >> 2;
    uint16_t t2l = throttle2_LOW >> 2;

    // If the voltage is out of range, set to min or max
    if (v1 < t1l) {
        v1 = t1l;
    } else if (v1 > t1h) {
        v1 = t1h;
    }

    if (v2 < t2l) {
        v2 = t2l;
    } else if (v2 > t2h) {
        v2 = t2h;
    }

    // Map from 0-255
    map1 = ((v1 - t1l) * 255) / (t1h - t1l);
    map2 = ((v2 - t2l) * 255) / (t2h - t2l);
    gThrottle1In = map1;
    gThrottle2In = map2;

    gThrottle1Out = gThrottle1In;
    gThrottle2Out = gThrottle2In;

    /*
       //---------Map based on drive mode------------
       if (gDriveMode == 0) { //error, default to standard
       gThrottle1Out = gThrottle1In;
       gThrottle2Out = gThrottle2In;
       }
       else if (gDriveMode == 1) { //standard
       gThrottle1Out = gThrottle1In;
       gThrottle2Out = gThrottle2In;
       }
       else if (gDriveMode == 2) { //acceleration
       gThrottle1Out = gThrottle1In;
       gThrottle2Out = gThrottle2In;
       }
       else if (gDriveMode == 3) { //skid pad
       if (gThrottle1In < 128) {
        gThrottle1Out = gThrottle1In;
        gThrottle2Out = gThrottle2In;
       }
       else {
        gThrottle1Out = 128 + ((gThrottle1In - 128) >> 1);
        gThrottle2Out = 128 + ((gThrottle2In - 128) >> 1);
       }
       }
       else if (gDriveMode == 4) { //autocross
       gThrottle1Out = gThrottle1In;
       gThrottle2Out = gThrottle2In;
       }
       else if (gDriveMode == 5) { //endurance
       gThrottle1Out = gThrottle1In;
       gThrottle2Out = gThrottle2In;
       }
     */
}

void checkPlausibility(void) {
    // compares the mapping of the two voltages
    if (gThrottle1Voltage * 50 > gThrottle2Voltage * 35
        || gThrottle1Voltage * 55 < gThrottle2Voltage * 32) {
        throttle10Counter += 1;
    }
    // else if ((gThrottle1Voltage > (throttle1_HIGH + ADC_ERROR)) ||
    // gThrottle1Voltage < throttle1_LOW - ADC_ERROR) {
    else if (gThrottle1Voltage > 1022 || gThrottle1Voltage < 16) {
        throttle10Counter += 1;
    }
    // else if ((gThrottle2Voltage > (throttle2_HIGH + ADC_ERROR)) ||
    // gThrottle2Voltage < throttle2_LOW - ADC_ERROR) {
    else if (gThrottle2Voltage > 1022 || gThrottle2Voltage < 16) {
        throttle10Counter += 1;
    } else {
        throttle10Counter = 0;
    }

    if (throttle10Counter > throttle10Ticks) {
        gFlag |= _BV(FLAG_THROTTLE_10);
    } else {
        gFlag &= ~_BV(FLAG_THROTTLE_10);
    }
}

void storeThrottle(void) {
    // Reads potentiometers, maps voltage for them from 0 to 255,
    // Stores rolling sum value into array.

    gThrottle1Voltage = adc_read(THROTTLE1_SENSE);
    gThrottle2Voltage = adc_read(THROTTLE2_SENSE);
    mapThrottle();
    checkPlausibility();

    uint16_t new = (gThrottle1Out + gThrottle2Out) >> 1;
    uint8_t old = gThrottleArray[gThrottleArrayIndex];

    gRollingSum -= old;
    gRollingSum += new;

    gThrottleArray[gThrottleArrayIndex] = new;

    gThrottleArrayIndex = gThrottleArrayIndex + 1;

    if (gThrottleArrayIndex == ROLLING_AVG_SIZE) {
        gThrottleArrayIndex = 0;
    }

    // sprintf(uart_buf, "NEW: %u", new);
    // LOG_println(uart_buf, strlen(uart_buf));
    // sprintf(uart_buf, "OLD: %u", old);
    // LOG_println(uart_buf, strlen(uart_buf));
}

void getAverage(void) {
    uint32_t temp = gRollingSum;
    temp /= ROLLING_AVG_SIZE;
    gThrottleOut = temp;
}

// QUESTION: Is there a way to replace this with something?
void checkPanic(void) {
    if (bit_is_set(gFlag, FLAG_PANIC)) {
        gThrottle1Out = 0;
        gThrottle2Out = 0;
        gThrottleOut = 0;
        // PLED1_PORT ^= _BV(PLED1);
        // PLED2_PORT ^= _BV(PLED2);
        // PLED3_PORT ^= _BV(PLED3);
    }
}

void printThrottle1(void) {
    char uart_buf[64];
    sprintf(uart_buf, "tout: %d", gThrottleOut);
    LOG_println(uart_buf, strlen(uart_buf));

    sprintf(uart_buf, "v1: %d", gThrottle1Voltage);
    LOG_println(uart_buf, strlen(uart_buf));

    sprintf(uart_buf, "v2: %d", gThrottle2Voltage);
    LOG_println(uart_buf, strlen(uart_buf));

    sprintf(uart_buf, " ");
    LOG_println(uart_buf, strlen(uart_buf));
}

void sendCanMessages(int viewCan) {
    // FOR TESTING ONLY
    // gFlag |= _BV(FLAG_MOTOR_ON);

    gCANMessage[0] = bit_is_set(gFlag, FLAG_MOTOR_ON) ? gThrottleOut : 0;
    gCANMessage[1] = bit_is_set(gFlag, FLAG_BOTS) ? 0xFF : 0x00;
    gCANMessage[2] = bit_is_set(gFlag, FLAG_IS) ? 0xFF : 0x00;
    gCANMessage[3] = bit_is_set(gFlag, FLAG_ESTOP) ? 0xFF : 0x00;

    if (bit_is_set(gFlag, FLAG_THROTTLE_10) || bit_is_set(gFlag, FLAG_BRAKE)) {
        gCANMessage[0] = 0;
    }

    throttle_msg.data = gCANMessage;
    can_send(&throttle_msg);

    // Send out Motor controller info
    // REMAP

    uint16_t thrott
        = bit_is_clear(gFlag, FLAG_THROTTLE_10) ? (uint16_t)gThrottleOut : 0;
    uint16_t mc_remap = (uint16_t)(thrott * 9);
    gCANMotorController[0] = mc_remap; // torque command
    gCANMotorController[1] = mc_remap >> 8; // torque command
    gCANMotorController[2] = 0x00; // speed command (unused)
    gCANMotorController[3] = 0x00; // speed command (unused)
    gCANMotorController[4] = 0x00; // direction command (0=reverse,,,1=forward)
    gCANMotorController[5]
        = bit_is_set(gFlag, FLAG_MOTOR_ON) ? 0x01 : 0x00; // inverter on or off
    gCANMotorController[6]
        = 0x00; // commanded torque limit, if 0, uses EEPROM set value
    gCANMotorController[7] = 0x00; // commanded torque limit, ^

    if (bit_is_set(gFlag, FLAG_THROTTLE_10) || bit_is_set(gFlag, FLAG_BRAKE)
        || bit_is_clear(gFlag, FLAG_MOTOR_ON)) {
        gCANMotorController[0] = 0x00;
        gCANMotorController[1] = 0x00;
        gCANMotorController[5] = 0x00;
    }

    mc_msg.data = gCANMotorController;
    can_send(&mc_msg);

    if (viewCan) {
        // char msg1[128];
        // char msg2[128];
        // sprintf(msg1,"CAN message one to
        // all:\nThrottle:%d\nSteering:%d\nBOTS:%d\nInertia:%d\nEstop:%d",
        //         gCANMessage[0],gCANMessage[1],gCANMessage[2],gCANMessage[3],gCANMessage[4]);
        // LOG_println(msg1,strlen(msg1));
        // sprintf(msg2,"CAN message to
        // motorcontroller:\n%d\n%d\n%d\n%d\n%d\n%d\n%d\n%d",
        //         gCANMotorController[0],gCANMotorController[1],gCANMotorController[2],gCANMotorController[3],
        //         gCANMotorController[4],gCANMotorController[5],gCANMotorController[6],gCANMotorController[7]);
        // LOG_println(msg2,strlen(msg2));
    }
}

int main(void) {
    sei();
    can_init(BAUD_500KBPS);
    adc_init();
    timer_init(&timer0_cfg);

    gpio_set_mode(DEBUG_LED1, OUTPUT);
    gpio_set_mode(DEBUG_LED2, OUTPUT);
    gpio_set_mode(DEBUG_LED3, OUTPUT);
    gpio_set_mode(LED1, OUTPUT);
    gpio_set_mode(LED2, OUTPUT);

    gpio_set_mode(SS_ESTOP, INPUT);
    gpio_set_mode(SS_IS, INPUT);
    gpio_set_mode(SS_BOTS, INPUT);

    gpio_enable_interrupt(SS_ESTOP);
    gpio_enable_interrupt(SS_IS);
    gpio_enable_interrupt(SS_BOTS);

    initMC();

    CAN_wait_on_receive(MOB_DASHBOARD, CAN_ID_DASHBOARD, CAN_LEN_DASHBOARD,
                        0xFF);

    CAN_wait_on_receive(MOB_BRAKELIGHT, CAN_ID_BRAKE_LIGHT, CAN_LEN_BRAKE_LIGHT,
                        0xFF);

    CAN_wait_on_receive(MOB_PANIC, CAN_ID_PANIC, CAN_LEN_PANIC, 0xFF);
    for (;;) {
        if (send_can) {
            storeThrottle(); // Stores rolling sum of throttle outputs into
                             // array.
            getAverage(); // gets average of throttle through rolling sum and
                          // rolling size.
            checkPanic();

            printThrottle1();
            sendCanMessages(0);

            send_can = false;
        }
    }
}