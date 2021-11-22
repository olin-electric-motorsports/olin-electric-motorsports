#define BRAKELIGHT_MBOX 0
#define BMS_CORE_MBOX 1
#define AIRCTRL_CRITICAL_MBOX 2
#define AIRCTRL_SENSE_MBOX 3
#define THROTTLE_MBOX 4

can_frame_t BRAKELIGHT_CAN_FRAME = {
    .mob = BRAKELIGHT_MBOX

}

can_filter_t FILTER = {
    .mask = 0x7FF,
    .id = 0xB
}