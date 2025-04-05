#include <avr/interrupt.h>

#include "libs/adc/api.h"s
#include "libs/can/api.h"
#include "libs/gpio/api.h"
#include "libs/timer/api.h"

#include "air_control.h"

// question: wtf does the bootloader do?
#include "projects/btldr/btldr_lib.h"
#include "projects/btldr/git_sha.h"
#include "projects/btldr/libs/image/api.h"

/*
5 main updates:
- update gpio pins
- condense prev 2 precharge states into 1
- listen to g meter
- get rid of charger listen to
- change order of initial checks


Tasks
* Hear CAN from G-meter
* Hear CAN from BMS
* Read shutdown node status
* Actuate AIR+
* monitor welding
* monitor IMD status
* Precharge control

INitial Checks -- make sure all nodes are fine
* We can talk to BMS and G-meter
* Pack above minimum voltage -- check bms (basically that there's a battery and
its charged enough, some amount of voltage)
* TSMS SS is low
* G-meter voltage is close to 0
  --> shouldn't be any voltage cuz means theres a short on the airs (no V's
across bus bars)
* AIRS + & - open/not welded shut
* IMD latch check; checks resistance between LV and HV (is low, there's short
AH) -- not the ss node, the actual latch

State Machine
* Idle - nothing
* Precherge start
  * air closed within 200ms
* precharge charge
  * Close precharge realy
  * make sure we hit votlage and time target
* TS active
  * read for shutdown node fault
* Discharge
  * open AIR+ lsd
  * monitor TS voltage
* Error
  * clear all LSDs
  * merge precharge; 200ms, make sure relay is actually closed; after 5 seconds
  * precharge: reaches 90% voltage or times out (then error state)

Keep track these events:
* BMS CAN
* Charger CAN
* G-meter CAN
* precharge start time
* discharge start time

- also: timer
*/

/*
 * Required for btldr
 */
image_hdr_t image_hdr __attribute__((section(".image_hdr"))) = {
    .image_magic = IMAGE_MAGIC,
    .git_sha = STABLE_GIT_COMMIT,
};

volatile bool send_can = false;

void timer0_isr(void) {
    send_can = true;
}

// interrupts for shutdown nodes?
void pcint0_callback(void) {
    air_control_critical.ss_tsms = !gpio_get_pin(SS_TSMS);
    air_control_critical.ss_imd = !gpio_get_pin(SS_IMD_LATCH);
    air_control_critical.ss_mpc = !gpio_get_pin(SS_MPC);
    air_control_critical.ss_hvd_conn = !gpio_get_pin(SS_TSMP);
    air_control_critical.ss_hvd = !gpio_get_pin(SS_HVD);
}

// TODO: snag set_fault functino as well?

// TODO: state machine to run through sequence
// --> thinking can pull from old state_machine_run
// --> architecture of old firmware decent

int main() {
    // TODO: initialize CAN
    can_init_air_control();
    timer_init(&timer0_cfg);
    // updater_init(BTLDR_ID, 5); QUES: necessary?

    // config pins

    sei();

    // run initial checks
    //

    return 0; // dummy req rn, erase later
}
