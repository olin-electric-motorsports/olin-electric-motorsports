#include "libs/adc/api.h"
#include "libs/can/api.h"
#include "libs/gpio/api.h"
#include "libs/timer/api.h"
#include "cooling-board.h"
#include "vehicle/mkvi/software/cooling-board/can_api.h"


// void initializeCoolingBoard() {
//     gpio_set_mode(fan_signal, OUTPUT);
//     gpio_set_mode(water_signal, OUTPUT);
// }

// void controlCoolingSystem(void){
//     if temperature1 >= SOFT_OVERTEMPERATURE_THRESHOLD_LOW || temperature2 >= SOFT_OVERTEMPERATURE_THRESHOLD_LOW || temperature3 >= SOFT_OVERTEMPERATURE_THRESHOLD_LOW{
//         gpio_set_pin(fan_signal);
//         gpio_set_pin(water_signal);
//     }
//     else{
//         gpio_clear_pin(fan_signal);
//         gpio_clear_pin(water_signal, LOW);
//     }
// }

enum State {
    COOLING_IDLE,
    COOLING_ON
};


volatile bool run_1ms = false;
void timer1_isr(void) {
    run_1ms = true;
}

int main(void) {
    sei();

    can_init_cooling();
    adc_init();
    can_receive_M162_Temperature_Set_3();
    timer_init(&timer0_cfg);
    timer_init(&timer1_cfg);
    gpio_set_mode(FAN_SIGNAL, OUTPUT);
    gpio_set_mode(WATER_SIGNAL, OUTPUT);

    while (true) {
        updater_loop();
        if (run_1ms) {
            run_1ms = false;

            if (can_poll_receive_M162_Temperature_Set_3() == 0) {
                can_receive_M162_Temperature_Set_3();
                temp_state.tempHigh = 
            }
        }
    }
}