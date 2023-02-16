#include "libs/tunables/can_api.h"

int main(void) {
    can_init_test_MCU();

    can_receive_dashboard();

    for (;;) {
        if (can_poll_receive_dashboard() == 0) {
            test_listen.msg_reply = dashboard.ready_to_drive;

            can_send_test_listen();

            can_receive_dashboard();
        }
    }
}