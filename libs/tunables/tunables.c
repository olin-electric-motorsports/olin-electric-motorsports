#include "libs/can/api.h"



static can_frame_t can_msg = { 0 };


//Creating a mixed array
struct {
    enum { is_int, is_float, is_bool } type;
    union {
        int ival; 
        float fval;
        bool cval;
    } val;
} tunables[10]; //Length of the mixed array.

//Example of how to set values of each element
//tunables[0].type = is_int;
//tunables[0].val.ival = 3;




//Initializes Tunables
void tunables_init(uint16_t ecu_id, uint8_t mob) {
    //Here is where we'd set all the values for the elements in tunables[]
    can_msg.mob = mob;

    can_filter_t tunables_filter = {
    .id = ecu_id,
    .mask = 2047

    };

    can_receive(&can_msg, tunables_filter);

}

//Static Methods

 

//Loop
void tunables_loop(void){   
     int rc = can_poll_receive(&can_msg);   
     //no message
     if (rc == -1) {
        return;
    //error
    } else if (rc == 1) {
        return;
    }

    //Where the real interaction starts
    switch (can_msg.id) {
        case ????: {
            tunables_get(can_msg.data, can_msg.dlc);
        } break;

        //Type 1
        case ????: {
            tunables_meas(can_msg.data, can_msg.dlc);
        } break;

        //Type 2
        case ????: {
            tunables_set(can_msg.data, can_msg.dlc);
        } break;

        //Type 3
        case ???? : {
            tunables_mc(can_msg.data, can_msg.dlc);
        }
        default: {
            // Ignore all other messages in application
        } break;
    }











}


//Getter Method

  void tunables_get(can_msg.data, can_msg.dlc){


}

//Type 1

 void tunables_meas(can_msg.data, can_msg.dlc){

}

//Type 2

 void tunables_set(can_msg.data, can_msg.dlc){

 }

 //Type 3

 void tunables_mc(can_msg.data, can_msg.dlc)){

 }