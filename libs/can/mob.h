#include <avr/io.h>

typedef enum {
    CAN_MOB0 = 0,
    CAN_MOB1 = 1,
    CAN_MOB2 = 2,
    CAN_MOB3 = 3,
    CAN_MOB4 = 4,
    CAN_MOB5 = 5,

    // Must be last!
    CAN_NUM_MOB,
} can_mob_t;

#define can_reset()  (CANGCON = (1 << SWRES))
#define can_enable() (CANGCON |= (1 << ENASTB))

/*
 * Sets the current MOb in the CANPAGE register
 */
#define select_mob(mob) (CANPAGE = (mob << 4))

#define mob_enable_interrupt(mob) (CANIE2 |= 1 << (uint8_t)mob)

/*
 * Clears MOb status and control register
 */
#define mob_reset()      \
    do {                 \
        CANSTMOB = 0x00; \
        CANCDMOB = 0x00; \
    } while (0);

#define mob_write_data(data) (CANMSG = data)

#define mob_enable_tx() (CANCDMOB |= 0x01 << CONMOB0)
#define mob_enable_rx() (CANCDMOB |= 0x02 << CONMOB0)
