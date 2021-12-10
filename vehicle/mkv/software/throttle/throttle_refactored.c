#include "libs/adc/api.h"
#include "libs/can/api.h"
#include "libs/timer/api.h"
#include <avr/interrupt.h>

#include "throttle_config.h"
#include "libs/gpio/api.h"

#include <stdbool.h>
#include <stdint.h>

// Port Macros
#define THROTTLE_PORT PORTC
#define DRIVE_MODE_PORT PORTD
#define PLED1_PORT PORTC
#define PLED2_PORT PORTB
#define PLED3_PORT PORTB
#define EXT_LED_PORT PORTB

//CAN Macros
#define CAN_THROTTLE 0
#define CAN_BOTS 1
#define CAN_IS 2
#define CAN_ESTOP 3

//Mailbox Macros
//Input
#define MOB_BRAKELIGHT 0
#define MOB_DASHBOARD 1
#define MOB_PANIC 2
//Output
#define MOB_BROADCAST 3
#define MOB_MOTORCONTROLLER 4

//Flags
#define FLAG_BRAKE 0
#define FLAG_THROTTLE_BRAKE 1
#define FLAG_ESTOP 2
#define FLAG_IS 3
#define FLAG_BOTS 4
#define FLAG_MOTOR_ON 5
#define FLAG_THROTTLE_10 6
#define FLAG_PANIC 7

//Voltage Reference for Drive Mode Select
#define STANDARD_LOWER_BOUND 0
#define ACCELERATION_LOWER_BOUND 0
#define SKIDPAD_LOWER_BOUND 0
#define AUTOCROSS_LOWER_BOUND 0
#define ENDURANCE_LOWER_BOUND 0

#define ROLLING_AVG_SIZE 8

#define UPDATE_STATUS 1

#define ADC_ERROR 6
#define DEAD_ZONE 64 

//********************Global variables***************
uint8_t gFlag = 0; // Global Flag. Tells us that gFlag will change and to assign it to an unsigned 8bit integer
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
//uint8_t gAverageSize = 8;
uint8_t gThrottleArray[ROLLING_AVG_SIZE];
uint16_t gRollingSum = 0;
uint8_t gThrottleOut = 0; // Rolling average of throttle outputs. (i.e. rolling sum of both 
								//throttle outputs over time divided by size of rolling sum)
volatile uint8_t msg;

// Throttle mapping values
// Throttle values are capped to this range
//Values set last on Oct 12 by Alex Wenstrup
const uint16_t throttle1_HIGH = 654;
const uint16_t throttle1_LOW = 154 + DEAD_ZONE;
const uint16_t throttle2_HIGH = 1016;
const uint16_t throttle2_LOW = 234 + DEAD_ZONE;

uint8_t throttle10Counter = 0;
const uint8_t throttle10Ticks = 6; //number of measurements that corespond to an implausibility error

uint8_t gCANMessage[4] = {0, 0, 0, 0};
uint8_t gCANMotorController[8] = {0, 0, 0, 0, 0, 0, 0, 0};

uint8_t gBrakeLightCan[7] = {0, 0, 0, 0, 0, 0, 0};

uint8_t clock_prescale = 0;

uint8_t timer_max = 0; //SET TO 0 BEFORE GOING HV

volatile bool send_can = false;



//********************Functions*************************
void timer0_callback(void) {
    send_can = true;
}