#include "imu_config.h"
#include <util/delay.h>

#include "libs/gpio/api.h"
#include "libs/gpio/pin_defs.h"
#include "vehicle/mkvi/software/imu/can_api.h"

#include "projects/btldr/btldr_lib.h"
#include "projects/btldr/git_sha.h"
#include "projects/btldr/libs/image/api.h"
// #include "projects/can_print/can_print.h"

gpio_t LED = PD6;

// /*
//  * Required for btldr
//  */
// image_hdr_t image_hdr __attribute__((section(".image_hdr"))) = {
//     .image_magic = IMAGE_MAGIC,
//     .git_sha = STABLE_GIT_COMMIT,
// };

int main(void) {
    gpio_set_mode(LED, OUTPUT);
    // gpio_set_pin(LED);
    for (;;) {
        gpio_toggle_pin(LED);
        _delay_ms(500);
    }
    // can_init_imu();
}
