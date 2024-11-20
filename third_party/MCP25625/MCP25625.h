#pragma once

// #include "third_party/MCP25625/MCP25625.c"

#include "libs/gpio/api.h"
#include "libs/gpio/pin_defs.h"
#include "libs/spi/api.h"
#include <util/delay.h>

#define MCP25625_OK             0
#define MCP25625_MODE_FAULT     1
#define MCP25625_HW_ERR         2
#define MCP25625_TX_ERR         3
#define MCP25625_RX_ERR         4

typedef struct {
        uint64_t speed;
        spi_cfg_s* spi_struct;
        gpio_t* rst;
        gpio_t* stby;
} MCP25625;

void MCP25625_init(MCP25625* MCP25625);
void mcp25625_write_reg(uint8_t reg, uint8_t len, uint8_t* data);
void mcp25625_read_reg(uint8_t reg, uint8_t len, uint8_t* data);

void mcp25625_send_message(uint32_t address, uint8_t len, uint8_t* data, bool isEID);


// /******************************************************************************
// * Function Prototypes
// *******************************************************************************/

// #ifdef __cplusplus
// extern "C"{
// #endif

// /**
//  * @brief MCP25625 Initialization
//  *
//  * @par
//  * Initialization of the library and device. This function is used to assign
//  * proper values to the reg field of control and status structs. Also performs
//  * the hardware reset of the device needed for proper functionality.
//  */
// int mcp25625_init
// (
//         can_opmode_t mode
// );

// /**
//  * @brief MCP25625 Operation Mode
//  *
//  * @par
//  * Changes the device operation mode and checks the status register for
//  * confirmation. Function uses can_ctl and can_stat structures.
//  *
//  * @param[in] mode - @link can_opmode_t @endlink
//  */
// int mcp25625_mode
// (
//         can_opmode_t mode
// );

// /**
//  * @brief Check for Errors
//  *
//  * @par
//  * Check the interrupt registers for transmision or receive errors.
//  *
//  * @param[in] clear the flag after reading
//  */
// int mcp25625_com_error
// (
//         bool clear
// );

// /**
//  * @brief Set Bit Timing Logic ( BTL )
//  *
//  * @par
//  * Monitors the bus line input and handles the bus-related bit timing according
//  * to the CAN protocol. The BTL synchronizes on a recessive-to-dominant bus
//  * transition at Start-of-Frame ( hard synchronization ) and on any further
//  * recessive-to-dominant bus line transition if the CAN controller itself does
//  * not transmit a dominant bit ( resynchronization ). The BTL also provides
//  * programmable time segments to compensate for the propagation delay time,
//  * phase shifts and to define the position of the sample point within the bit
//  * time. The programming of the BTL depends on the baud rate and external
//  * physical delay times.
//  *
//  * @note
//  * More information about parameters :
//  * @link mcp25625_cnf1_ctl @endlink
//  * @link mcp25625_cnf2_ctl @endlink
//  * @link mcp25625_cnf3_ctl @endlink
//  *
//  * @note
//  * Additional info can be found on product datasheet.
//  */
// int mcp25625_btl_config
// (
//         uint8_t BRP,
//         uint8_t SJW,
//         uint8_t PRSEG,
//         uint8_t PHSEG1,
//         uint8_t PHSEG2,
//         bool SAM,
//         bool BTLMODE,
//         bool WAKFIL,
//         bool SOFR
// );

// /**
//  * @brief TX Configuration
//  *
//  * @par
//  * Configures one of the 3 TX buffers.
//  *
//  * @note
//  * More info can be found on product datasheet.
//  *
//  * @param[in] - buffer
//  */
// int mcp25625_tx_config
// (
//         TXB_t buffer,
//         uint8_t TXP,
//         bool use_RTS_pin
// );

// /**
//  * @brief RX Configuration
//  *
//  * @par
//  * Configure one of the 2 RX buffers.
//  *
//  * @note
//  * More info can be found on product datasheet.
//  */
// int mcp25625_rx_config
// (
//         RXB_t rx_buff,
//         rx_mode_t mode,
//         bool BUKT,
//         bool RX_PIN
// );

// /**
//  * @brief Filter Setup
//  *
//  * @par
//  * The message acceptance filters are used to determine if a message in the
//  * message assembly buffer should be loaded into either of the receive
//  * buffers.
//  *
//  * @note
//  * More info can be found on product datasheet.
//  */
// int mcp25625_filter_config
// (
//         RXF_t rx_filt,
//         uint16_t filter_SID,
//         uint32_t filter_EID,
//         bool filter_EXIDE
// );

// /**
//  * @brief Mask Setup
//  *
//  * @par
//  * The filter masks are used to determine which bits in the identifier are
//  * examined with the filters. The mask essentially determines which bits to
//  * apply the acceptance filters to. If any mask bit is set to a zero, that bit
//  * will automatically be accepted, regardless of the filter bit.
//  *
//  * @note
//  * More info can be found on product datasheet.
//  */
// int mcp25625_mask_config
// (
//         RXB_t rx_buff,
//         uint16_t mask_SID,
//         uint32_t mask_EID
// );

// /**
//  * @brief Load Message
//  *
//  * @par
//  * Loads the data into the buffer but doesn't requests the message sending.
//  *
//  * @note
//  * More info can be found on product datasheet.
//  *
//  * @param[in] tx_buffer ( TXB0 / TXB1 / TXB2 )
//  * @param[in] msg - data for transmision
//  * @param[in] count - data length
//  * @param[in] ID - message SID / EID
//  * @param[in] EXIDE - extended identifier
//  * @param[in] RTR - remote transfer request
//  */
// int mcp25625_msg_load
// (
//         TXB_t tx_buffer,
//         uint8_t *msg,
//         uint8_t count,
//         uint32_t ID,
//         bool EXIDE,
//         bool RTR
// );

// /**
//  * @brief Send Message
//  *
//  * @par
//  * Send the message from one of the three TX buffers. This functions only
//  * request message transmision, before usage of this one buffer should be loaded
//  * using @link mcp25625_msg_load @endlink.
//  *
//  * @param[in] tx_buffer ( TXB0 / TXB1 / TXB2 )
//  */
// int mcp25625_msg_send
// (
//         TXB_t tx_buffer
// );

// /**
//  * @brief Check Buffers
//  *
//  * @par
//  * Checks does new message exists on buffers.
//  *
//  * @param[in] rx_buffer ( RXB0 / RXB1 )
//  *
//  * @retval ( true - Message received / false - No new message )
//  */
// bool mcp25625_msg_ready
// (
//         RXB_t rx_buffer
// );

// /**
//  * @brief Read Message
//  *
//  * @par
//  * Read received message. This function doesn't check the reception of the
//  * messaage it just read one of the RX buffers. Before usage of this function
//  * user should use @link mcp25625_msg_ready @endlink to check message reception.
//  *
//  * @note
//  * More info can be found on product datasheet.
//  *
//  * @param[in] rx_buffer ( RXB0 / RXB1 )
//  * @param[out] msg - received data
//  * @param[out] count - data length
//  * @param[out] ID - message ID
//  * @param[out] IDE - ( SID / EID )
//  * @param[out] RTR - message is remote transfer request
//  */
// int mcp25625_msg_read
// (
//         RXB_t rx_buffer,
//         uint8_t *msg,
//         uint8_t *count,
//         uint32_t *ID,
//         bool *IDE,
//         bool *RTR
// );

// #ifdef __cplusplus
// } // extern "C"
// #endif

// #endif // MCP25625_H

// /*** End of File **************************************************************/