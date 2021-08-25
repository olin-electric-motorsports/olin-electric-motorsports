#ifndef CAN_API_H
#define CAN_API_H

#include <avr/interrupt.h>
#include <avr/io.h>
#include <inttypes.h>
#include <stdlib.h>

/* Message Identifiers */
#define CAN_ID_GLOBAL ((uint16_t)0x00)
#define CAN_ID_PANIC  ((uint16_t)0x01)

#define CAN_ID_BRAKE_LIGHT          ((uint16_t)0x0B)
#define CAN_ID_THROTTLE             ((uint16_t)0x0C)
#define CAN_ID_AIR_CONTROL_CRITICAL ((uint16_t)0x0D)
#define CAN_ID_AIR_CONTROL_SENSE    ((uint16_t)0x0E)
#define CAN_ID_DASHBOARD            ((uint16_t)0x0F)
#define CAN_ID_BMS_CORE             ((uint16_t)0x10)

#define CAN_ID_STEERING_WHEEL  ((uint16_t)0x12)
#define CAN_ID_MOTORCONTROLLER ((uint16_t)0x15)

//(0x\w*) +(\w*) +(\w*) +(\w*) +(\w*(?: )*)*

#define CAN_ID_WHEEL_SPEED_FL  ((uint16_t)0x16)
#define CAN_ID_WHEEL_SPEED_FR  ((uint16_t)0x17)
#define CAN_ID_WHEEL_SPEED_BL  ((uint16_t)0x18)
#define CAN_ID_WHEEL_SPEED_BR  ((uint16_t)0x19)
#define CAN_ID_SUS_TRAVEL_FL   ((uint16_t)0x1A)
#define CAN_ID_SUS_TRAVEL_FR   ((uint16_t)0x1B)
#define CAN_ID_SUS_TRAVEL_BL   ((uint16_t)0x1C)
#define CAN_ID_SUS_TRAVEL_BR   ((uint16_t)0x1D)
#define CAN_ID_SUS_STRAIN_FL_1 ((uint16_t)0x1E)
#define CAN_ID_SUS_STRAIN_FL_2 ((uint16_t)0x1F)
#define CAN_ID_SUS_STRAIN_FL_3 ((uint16_t)0x20)
#define CAN_ID_SUS_STRAIN_FR_1 ((uint16_t)0x21)
#define CAN_ID_SUS_STRAIN_FR_2 ((uint16_t)0x22)
#define CAN_ID_SUS_STRAIN_FR_3 ((uint16_t)0x23)
#define CAN_ID_SUS_STRAIN_BL_1 ((uint16_t)0x24)
#define CAN_ID_SUS_STRAIN_BL_2 ((uint16_t)0x25)
#define CAN_ID_SUS_STRAIN_BL_3 ((uint16_t)0x26)
#define CAN_ID_SUS_STRAIN_BR_1 ((uint16_t)0x27)
#define CAN_ID_SUS_STRAIN_BR_2 ((uint16_t)0x28)
#define CAN_ID_SUS_STRAIN_BR_3 ((uint16_t)0x29)
#define CAN_ID_TIRE_TEMP_FL_1  ((uint16_t)0x2A)
#define CAN_ID_TIRE_TEMP_FL_2  ((uint16_t)0x2B)
#define CAN_ID_TIRE_TEMP_FL_3  ((uint16_t)0x2C)
#define CAN_ID_TIRE_TEMP_FL_4  ((uint16_t)0x2D)
#define CAN_ID_TIRE_TEMP_FR_1  ((uint16_t)0x2E)
#define CAN_ID_TIRE_TEMP_FR_2  ((uint16_t)0x2F)
#define CAN_ID_TIRE_TEMP_FR_3  ((uint16_t)0x30)
#define CAN_ID_TIRE_TEMP_FR_4  ((uint16_t)0x31)
#define CAN_ID_TIRE_TEMP_BL_1  ((uint16_t)0x32)
#define CAN_ID_TIRE_TEMP_BL_2  ((uint16_t)0x33)
#define CAN_ID_TIRE_TEMP_BL_3  ((uint16_t)0x34)
#define CAN_ID_TIRE_TEMP_BL_4  ((uint16_t)0x35)
#define CAN_ID_TIRE_TEMP_BR_1  ((uint16_t)0x36)
#define CAN_ID_TIRE_TEMP_BR_2  ((uint16_t)0x37)
#define CAN_ID_TIRE_TEMP_BR_3  ((uint16_t)0x38)
#define CAN_ID_TIRE_TEMP_BR_4  ((uint16_t)0x39)

#define CAN_ID_BMS_VOLT_1_1 ((uint16_t)0x40)
#define CAN_ID_BMS_VOLT_1_2 ((uint16_t)0x41)
#define CAN_ID_BMS_VOLT_1_3 ((uint16_t)0x42)
#define CAN_ID_BMS_VOLT_1_4 ((uint16_t)0x43)
#define CAN_ID_BMS_VOLT_2_1 ((uint16_t)0x44)
#define CAN_ID_BMS_VOLT_2_2 ((uint16_t)0x45)
#define CAN_ID_BMS_VOLT_2_3 ((uint16_t)0x46)
#define CAN_ID_BMS_VOLT_2_4 ((uint16_t)0x47)
#define CAN_ID_BMS_VOLT_3_1 ((uint16_t)0x48)
#define CAN_ID_BMS_VOLT_3_2 ((uint16_t)0x49)
#define CAN_ID_BMS_VOLT_3_3 ((uint16_t)0x4A)
#define CAN_ID_BMS_VOLT_3_4 ((uint16_t)0x4B)
#define CAN_ID_BMS_VOLT_4_1 ((uint16_t)0x4C)
#define CAN_ID_BMS_VOLT_4_2 ((uint16_t)0x4D)
#define CAN_ID_BMS_VOLT_4_3 ((uint16_t)0x4E)
#define CAN_ID_BMS_VOLT_4_4 ((uint16_t)0x4F)
#define CAN_ID_BMS_VOLT_5_1 ((uint16_t)0x50)
#define CAN_ID_BMS_VOLT_5_2 ((uint16_t)0x51)
#define CAN_ID_BMS_VOLT_5_3 ((uint16_t)0x52)
#define CAN_ID_BMS_VOLT_5_4 ((uint16_t)0x53)
#define CAN_ID_BMS_VOLT_6_1 ((uint16_t)0x54)
#define CAN_ID_BMS_VOLT_6_2 ((uint16_t)0x55)
#define CAN_ID_BMS_VOLT_6_3 ((uint16_t)0x56)
#define CAN_ID_BMS_VOLT_6_4 ((uint16_t)0x57)
#define CAN_ID_BMS_TEMP_1   ((uint16_t)0x58)
#define CAN_ID_BMS_TEMP_2   ((uint16_t)0x59)
#define CAN_ID_BMS_TEMP_3   ((uint16_t)0x5A)
#define CAN_ID_BMS_TEMP_4   ((uint16_t)0x5B)
#define CAN_ID_BMS_TEMP_5   ((uint16_t)0x5C)
#define CAN_ID_BMS_TEMP_6   ((uint16_t)0x5D)
#define CAN_ID_BMS_TEMP_7   ((uint16_t)0x5E)
#define CAN_ID_BMS_TEMP_8   ((uint16_t)0x5F)
#define CAN_ID_BMS_TEMP_9   ((uint16_t)0x60)
#define CAN_ID_BMS_TEMP_10  ((uint16_t)0x61)
#define CAN_ID_BMS_TEMP_11  ((uint16_t)0x62)
#define CAN_ID_BMS_TEMP_12  ((uint16_t)0x63)

#define CAN_ID_MC_POSITION ((uint16_t)0xA5)
#define CAN_ID_MC_CURRENT  ((uint16_t)0xA6)
#define CAN_ID_MC_VOLTAGE  ((uint16_t)0xA7)
#define CAN_ID_MC_COMMAND  ((uint16_t)0xC0)

/* Message Lengths */
#define CAN_LEN_GLOBAL ((uint16_t)8)
#define CAN_LEN_PANIC  ((uint16_t)1)

#define CAN_LEN_BRAKE_LIGHT          ((uint16_t)5)
#define CAN_LEN_THROTTLE             ((uint16_t)5)
#define CAN_LEN_AIR_CONTROL_CRITICAL ((uint16_t)5)
#define CAN_LEN_AIR_CONTROL_SENSE    ((uint16_t)8)
#define CAN_LEN_DASHBOARD            ((uint16_t)4)
#define CAN_LEN_BMS_CORE             ((uint16_t)8)

#define CAN_LEN_MOTORCONTROLLER ((uint16_t)8)
#define CAN_LEN_STEERING_WHEEL  ((uint16_t)1)

#define CAN_LEN_MC_POSITION ((uint16_t)8)
#define CAN_LEN_MC_CURRENT  ((uint16_t)8)
#define CAN_LEN_MC_VOLTAGE  ((uint16_t)8)
#define CAN_LEN_MC_COMMAND  ((uint16_t)8)

#define CAN_LEN_WHEEL_SPEED_FL  ((uint16_t)2)
#define CAN_LEN_WHEEL_SPEED_FR  ((uint16_t)2)
#define CAN_LEN_WHEEL_SPEED_BL  ((uint16_t)2)
#define CAN_LEN_WHEEL_SPEED_BR  ((uint16_t)2)
#define CAN_LEN_SUS_TRAVEL_FL   ((uint16_t)3)
#define CAN_LEN_SUS_TRAVEL_FR   ((uint16_t)3)
#define CAN_LEN_SUS_TRAVEL_BL   ((uint16_t)3)
#define CAN_LEN_SUS_TRAVEL_BR   ((uint16_t)3)
#define CAN_LEN_SUS_STRAIN_FL_1 ((uint16_t)8)
#define CAN_LEN_SUS_STRAIN_FL_2 ((uint16_t)8)
#define CAN_LEN_SUS_STRAIN_FL_3 ((uint16_t)8)
#define CAN_LEN_SUS_STRAIN_FR_1 ((uint16_t)8)
#define CAN_LEN_SUS_STRAIN_FR_2 ((uint16_t)8)
#define CAN_LEN_SUS_STRAIN_FR_3 ((uint16_t)8)
#define CAN_LEN_SUS_STRAIN_BL_1 ((uint16_t)8)
#define CAN_LEN_SUS_STRAIN_BL_2 ((uint16_t)8)
#define CAN_LEN_SUS_STRAIN_BL_3 ((uint16_t)8)
#define CAN_LEN_SUS_STRAIN_BR_1 ((uint16_t)8)
#define CAN_LEN_SUS_STRAIN_BR_2 ((uint16_t)8)
#define CAN_LEN_SUS_STRAIN_BR_3 ((uint16_t)8)
#define CAN_LEN_TIRE_TEMP_FL_1  ((uint16_t)8)
#define CAN_LEN_TIRE_TEMP_FL_2  ((uint16_t)8)
#define CAN_LEN_TIRE_TEMP_FL_3  ((uint16_t)8)
#define CAN_LEN_TIRE_TEMP_FL_4  ((uint16_t)8)
#define CAN_LEN_TIRE_TEMP_FR_1  ((uint16_t)8)
#define CAN_LEN_TIRE_TEMP_FR_2  ((uint16_t)8)
#define CAN_LEN_TIRE_TEMP_FR_3  ((uint16_t)8)
#define CAN_LEN_TIRE_TEMP_FR_4  ((uint16_t)8)
#define CAN_LEN_TIRE_TEMP_BL_1  ((uint16_t)8)
#define CAN_LEN_TIRE_TEMP_BL_2  ((uint16_t)8)
#define CAN_LEN_TIRE_TEMP_BL_3  ((uint16_t)8)
#define CAN_LEN_TIRE_TEMP_BL_4  ((uint16_t)8)
#define CAN_LEN_TIRE_TEMP_BR_1  ((uint16_t)8)
#define CAN_LEN_TIRE_TEMP_BR_2  ((uint16_t)8)
#define CAN_LEN_TIRE_TEMP_BR_3  ((uint16_t)8)
#define CAN_LEN_TIRE_TEMP_BR_4  ((uint16_t)8)

#define CAN_LEN_BMS_VOLT_1_1 ((uint16_t)8)
#define CAN_LEN_BMS_VOLT_1_2 ((uint16_t)8)
#define CAN_LEN_BMS_VOLT_1_3 ((uint16_t)8)
#define CAN_LEN_BMS_VOLT_1_4 ((uint16_t)8)
#define CAN_LEN_BMS_VOLT_2_1 ((uint16_t)8)
#define CAN_LEN_BMS_VOLT_2_2 ((uint16_t)8)
#define CAN_LEN_BMS_VOLT_2_3 ((uint16_t)8)
#define CAN_LEN_BMS_VOLT_2_4 ((uint16_t)8)
#define CAN_LEN_BMS_VOLT_3_1 ((uint16_t)8)
#define CAN_LEN_BMS_VOLT_3_2 ((uint16_t)8)
#define CAN_LEN_BMS_VOLT_3_3 ((uint16_t)8)
#define CAN_LEN_BMS_VOLT_3_4 ((uint16_t)8)
#define CAN_LEN_BMS_VOLT_4_1 ((uint16_t)8)
#define CAN_LEN_BMS_VOLT_4_2 ((uint16_t)8)
#define CAN_LEN_BMS_VOLT_4_3 ((uint16_t)8)
#define CAN_LEN_BMS_VOLT_4_4 ((uint16_t)8)
#define CAN_LEN_BMS_VOLT_5_1 ((uint16_t)8)
#define CAN_LEN_BMS_VOLT_5_2 ((uint16_t)8)
#define CAN_LEN_BMS_VOLT_5_3 ((uint16_t)8)
#define CAN_LEN_BMS_VOLT_5_4 ((uint16_t)8)
#define CAN_LEN_BMS_VOLT_6_1 ((uint16_t)8)
#define CAN_LEN_BMS_VOLT_6_2 ((uint16_t)8)
#define CAN_LEN_BMS_VOLT_6_3 ((uint16_t)8)
#define CAN_LEN_BMS_VOLT_6_4 ((uint16_t)8)
#define CAN_LEN_BMS_TEMP_1   ((uint16_t)8)
#define CAN_LEN_BMS_TEMP_2   ((uint16_t)8)
#define CAN_LEN_BMS_TEMP_3   ((uint16_t)4)
#define CAN_LEN_BMS_TEMP_4   ((uint16_t)8)
#define CAN_LEN_BMS_TEMP_5   ((uint16_t)8)
#define CAN_LEN_BMS_TEMP_6   ((uint16_t)8)
#define CAN_LEN_BMS_TEMP_7   ((uint16_t)8)
#define CAN_LEN_BMS_TEMP_8   ((uint16_t)8)
#define CAN_LEN_BMS_TEMP_9   ((uint16_t)8)
#define CAN_LEN_BMS_TEMP_10  ((uint16_t)8)
#define CAN_LEN_BMS_TEMP_11  ((uint16_t)8)
#define CAN_LEN_BMS_TEMP_12  ((uint16_t)8)

/* Masks */
#define CAN_MSK_GLOBAL ((uint16_t)0x00)
#define CAN_MSK_SINGLE ((uint16_t)0xFF)
#define CAN_MSK_DOUBLE ((uint16_t)0xFE)

/* Modes of Operation */
#define CAN_ENABLED  0x00
#define CAN_DISABLED 0x01
#define CAN_LISTEN   0x02

/* Error Definitions */
#define CAN_ERR_MOB_BUSY   0
#define CAN_ERR_NO_RX_FLAG 1
#define CAN_ERR_DLCW       2
#define CAN_ERR_UNKNOWN    3

/* Function Prototypes */

// Initialize CAN system based on MODE of operation
uint8_t CAN_init(uint8_t mode);

// Transmit a message on the CAN bus
uint8_t CAN_transmit(uint8_t mob, uint16_t ident, uint8_t msg_length,
                     uint8_t msg[]);

// Quick check to see if transmitted message sent correclty
uint8_t CAN_transmit_success(uint8_t mob);

// Wait to receive a specific CAN message
uint8_t CAN_wait_on_receive(uint8_t mob, uint16_t ident, uint8_t msg_length,
                            uint16_t mask);

// Read a message that has been received
uint8_t CAN_read_received(uint8_t mob, uint8_t msg_length, uint8_t* msg);

#endif
