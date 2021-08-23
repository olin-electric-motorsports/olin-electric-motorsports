#include "can_api.h"

uint8_t CAN_init (uint8_t mode)
{
    // Software reset; necessary for all CAN
    // stuff.
    CANGCON = _BV(SWRES);

    // CAN prescaler timing prescaler set to 0
    CANTCON = 0x00;

    // Set Error passive state
    CANGSTA |= _BV(ERRP);

    // Set BAUD rate
    

    // 500 kbps
    CANBT1 = 0x00;
    CANBT2 = 0x04;
    CANBT3 = 0x12;
    
    /* 
    // 250 kbps
    CANBT1 = 0x00;
    CANBT2 = 0x0C;
    CANBT3 = 0x36;
    */

    // Allow all interrupts & receive interrupts
    CANGIE |= _BV(ENIT) | _BV(ENRX);

    // compatibility with future chips
    CANIE1 = 0;

    // enable interrupts on all MObs
    CANIE2 = ( _BV(IEMOB0) | _BV(IEMOB1) |
               _BV(IEMOB2) | _BV(IEMOB3) |
               _BV(IEMOB4) | _BV(IEMOB5) );


    // All MObs come arbitrarily set up at first,
    // must reset all in order to make them useable
    int8_t mob;
    for( mob=0; mob<6; mob++ ){
        // Selects Message Object 0-5
        // This changes the MOb that is selected
        CANPAGE = ( mob << 4 );

        // Disable mob
        CANCDMOB = 0x00;

        // Clear mob status register;
        CANSTMOB = 0x00;
    }

    // Set up as Enabled mode
    //  instead of standby
    //  Necessary in order to get CAN
    //  communication
    if (mode == CAN_ENABLED)
    {
        CANGCON |= _BV( ENASTB );
    }
    else if( mode == CAN_LISTEN )
    {
        CANGCON |= _BV(LISTEN) | _BV( ENASTB );
    }

    return 0;
}


uint8_t CAN_transmit (uint8_t mob, uint16_t ident, uint8_t msg_length, uint8_t msg[])
{
    // Check that the MOb is free
    if( bit_is_set(CANEN2, mob) ){
        return CAN_ERR_MOB_BUSY;
    }

    // Select CAN mob based on input MOb;
    // also resets the CANPAGE
    CANPAGE = (mob << MOBNB0);

    // Clean CAN status for this MOb
    CANSTMOB = 0x00;

    // Set MOb ID
    CANIDT1 = (uint8_t) (ident >> 3);
    CANIDT2 = (uint8_t) (ident << 5);
    CANIDT3 = 0x00;
    CANIDT4 = 0x00; // Data frame

    // Set mask to 0x00
    // Not used by Tx but good practice
    CANIDM1 = 0x00;
    CANIDM2 = 0x00;
    CANIDM3 = 0x00;
    CANIDM4 = 0x00;

    // Set the message
    uint8_t i;
    for(i=0; i < msg_length; i++){
        CANMSG = msg[i];
    }

    // Send the message
    //CANCDMOB = _BV(CONMOB0) | (msg_length << DLC0);
    CANCDMOB = 0x00;
    CANCDMOB = (0x01 << CONMOB0) | (msg_length << DLC0);

    // TODO: Have interrupt to check status of transmitted message?

    return 0;
}


uint8_t CAN_transmit_success (uint8_t mob)
{
    // Check busy status
    if (bit_is_set(CANEN2, mob))
    {
        return CAN_ERR_MOB_BUSY;
    }

    // Check if OK transmission
    if (bit_is_set(CANSTMOB, TXOK))
    {
        CANSTMOB &= ~_BV(TXOK);
    }

    if (CANSTMOB != 0x00)
    {
        return CAN_ERR_UNKNOWN;
    }

    return 0;
}


uint8_t CAN_wait_on_receive (uint8_t mob, uint16_t ident, uint8_t msg_length, uint16_t mask)
{
    // Check that the MOb is free
    if( bit_is_set(CANEN2, mob) ){
        return CAN_ERR_MOB_BUSY;
    }

    // Select CAN mob based on input MOb
    CANPAGE = (mob << MOBNB0);

    // Clean CAN status for this MOb
    CANSTMOB = 0x00;

    // Set MOb ID
    CANIDT1 = (uint8_t) (ident >> 3); // node ID
    CANIDT2 = (uint8_t) (ident << 5);
    CANIDT3 = 0x00;
    CANIDT4 = 0x00; // Data frame

    // Set up MASK
    CANIDM1 = (uint8_t) (mask >> 3);
    CANIDM2 = (uint8_t) (mask << 5);
    CANIDM3 = 0x00;
    CANIDM4 = (_BV(RTRMSK) | _BV(IDEMSK)); // Use what is set above

    // Begin waiting for Rx
    //CANCDMOB = _BV(CONMOB1) | (msg_length << DLC0);
    CANCDMOB = 0x00;
    CANCDMOB = (0x02 << CONMOB0) | (msg_length << DLC0);

    return 0;
}


uint8_t CAN_read_received (uint8_t mob, uint8_t msg_length, uint8_t *msg)
{
    // Keep track of errors
    uint8_t error_value = 0;

    // Select MOb
    CANPAGE = (mob << MOBNB0);

    // Check to see if RXOK flag is set
    if (bit_is_set(CANSTMOB, RXOK))
    {
        // Reset RXOK if it is set
        CANSTMOB &= ~_BV(RXOK);
    }
    else
    {
        // Update the error value
        error_value = CAN_ERR_NO_RX_FLAG;
    }

    // Check if DLC is as expected
    if (bit_is_set(CANSTMOB, DLCW))
    {
        error_value = CAN_ERR_DLCW;

        // Set message length to the correct DLC
        msg_length = (0xF | CANCDMOB);
    }

    // Grab messages anyway
    for (int i = 0; i < msg_length; i++)
    {
        msg[i] = CANMSG;
    }

    // Reset entire status register
    CANSTMOB = 0x00;

    return error_value;
}
