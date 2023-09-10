// Power distribution library testing
#include <util/delay.h>

#include "tutorials/power_distribution/api.h"

#define BLINK_PERIOD_ms (400)

int main(void) {
    init_devices();

    for (;;) {
        power_all();
        _delay_ms(BLINK_PERIOD_ms);
        power_off_all();
        _delay_ms(BLINK_PERIOD_ms);
        power_device(DASHBOARD_POWER);
        _delay_ms(BLINK_PERIOD_ms);
        power_device(SERVICE_SECTION_POWER);
        _delay_ms(BLINK_PERIOD_ms);
        power_device(THROTTLE_POWER);
        _delay_ms(BLINK_PERIOD_ms);
        power_off_all();
        _delay_ms(BLINK_PERIOD_ms);
    }
}
