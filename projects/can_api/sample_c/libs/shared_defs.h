#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>

/* Struct holding all information necessary to send a CAN message */
typedef struct can_msg_info {
    // pointer to raw data array
    uint8_t* raw_arr;
    // ticks until message should be sent
    int countdown;
    // number of cycles between messages
    int cycle_time;
    // mailbox ID for the message
    uint8_t mob;
    // message ID
    uint16_t ident;
    // byte length of message
    uint8_t length;
} msg_info;

/* CAN ARRAY FOR ALL MESSAGES, SHARED WITH can_api.c */
msg_info** CAN_msg_array;
int CAN_info_len;