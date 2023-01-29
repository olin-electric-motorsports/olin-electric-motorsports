#include "libs/tunables/test/can_api.h"

int main(void){
    can_init_test_MCU();

    can_recieve_test_msg1();

    for (;;) {
        if(can_poll_recievie_test_msg1() == 0){

            if(test_msg1.msg_reply ==0){
                
                can_send_test_listen();
                can_recieve_test_msg1();
            }
            else
        }
    }
}