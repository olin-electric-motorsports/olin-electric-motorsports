// look up MCP25625 datasheet to see how to deal with SPI and message transmission
// writing functions like the can_api.c stuff but for spi (so similar functions but not same, must be for spi)

// write function
/*
      pub fn write_reg(&mut self, addr: u8, byte: u8) {
        self.cs.set_low().ok();
        let _ = self.spi.write(&[Self::WRITE_CMD, addr, byte]);
        delay(self.one_cp);
        self.cs.set_high().ok();
        delay(self.one_cp * 3);
    }
*/

#include "/libs/spi/api.h"

// data type TBD, just put everything as an int for now
int RESET_COMMAND = 11000000
int READ_INSTRUCTION = 00000011
// int READ_RX_BUFFER_COMMAND = 10010nm0
// int LOAD_TX_BUFFER_COMMAND= 01000abc
// int RTS_COMMAND = 10000nnn
int RX_STATUS_COMMAND = 10110000
int BIT_MODIFY_COMMAND = 00000101
int READ_STATUS_COMMAND = 10100000
int WRITE_INSTRUCTION = 00000010

int TXB0D0 = 00110110 // register address (higher order first, then lower)
int TXB1D0 = 01000110
int TXB2D0 = 01010110

int RXB0D0 = 01100110
int RXB1D0 = 

int 0x61 = 10010000
int 0x66 = 10010010
int 0x71 = 10010100
int 0x76 = 10010110

int memory_queue = 0;
memory_list_TX = [TXB0D0, TXB1D0, TXB2D0];
memory_list_RX = [RXB0D0, RXB1D0];
read_rx_buffer_instruction = [0x61, 0x66, 0x71, 0x76];

void reset() {
    spi_cs_low()
    spi_transceive(RESET_COMMAND, ~, ~);
    spi_cs_high()
}

void read_status() {
    spi_cs_low()
    spi_transceive(READ_STATUS_COMMAND, MCPstatus, 1);
    spi_cs_high()
}

void write(len, data) { // len is byte length of message
    spi_cs_low()
    spi_transceive(WRITE_INSTRUCTION + memory_list_TX[memory_queue] + data, null, len);
    memory_queue ++ % 3 // changing the register 
    spi_cs_high()
}

void read(len, register_address) { // general reading from any register so input is any register address
    spi_cs_low()
    spi_transceive(READ_INSTRUCTION + register_address, data, len); // data should be shifted out on the SO pin.
    spi_cs_high()
}

void read_rx_buffer(len, register_n, n) { // when message is received, it's stored in one of the receive buffers
    spi_transceive(read_rx_buffer_instruction[n] + memory_list_RX[register_n] + data, null, len);
}

// defining variables??
/*
    pub fn read_reg(&mut self, addr: u8) -> u8 {
        self.cs.set_low().ok();
        let _ = self.spi.write(&[Self::READ_CMD, addr]);
        let mut buf = [0u8; 1];
        let r = self.spi.transfer(&mut buf);
        delay(self.one_cp);
        self.cs.set_high().ok();
        delay(self.one_cp * 3);
        r.unwrap_or(&[0u8])[0]
    }


pub struct Mcp25625Ral<SPI, CS> {
    spi: SPI,
    cs: CS,
    one_cp: u32 // number of cpu cycles per one sck period
}
*/
/*
pub trait ResetValue {
    /// Register underlying type
    type Type;
    fn reset_value() -> Self::Type;
}

/// Shows that register has `read` method.
pub trait Readable {}

/// Shows that register has `write` method.
/// Registers marked with `Readable` has also `modify` method.
pub trait Writable {}

/// Reset value of the register used in `write` and `reset` methods.
pub trait ResetValue {
    /// Register underlying type
    type Type;
    fn reset_value() -> Self::Type;
}

// Constants and Macro Definitions
//-------------MCP25625 SPI commands------------------------
#define CAN_RESET       0xC0  //Reset
#define CAN_READ        0x03  //Read
#define CAN_WRITE       0x02  //Write
#define CAN_RTS         0x80  //Request to Send
#define CAN_RTS_TXB0    0x81  //RTS TX buffer 0
#define CAN_RTS_TXB1    0x82  //RTS TX buffer 1
#define CAN_RTS_TXB2    0x84  //RTS TX buffer 2
#define CAN_RD_STATUS   0xA0  //Read Status
#define CAN_BIT_MODIFY  0x05  //Bit modify
#define CAN_RX_STATUS   0xB0  //Receive status

#define MSG_ID_0X1XX    0x100
#define MSG_ID_0X200    0x200

void SPI1_Initialize (void)
{
    // AUDEN disabled; FRMEN disabled; AUDMOD I2S; FRMSYPW One clock wide; AUDMONO stereo; FRMCNT 0; MSSEN disabled; FRMPOL disabled; IGNROV disabled; SPISGNEXT not sign-extended; FRMSYNC disabled; URDTEN disabled; IGNTUR disabled; 
    SPI1CON1H = 0x00;
    // WLENGTH 0; 
    SPI1CON2L = 0x00;
    // SPIROV disabled; FRMERR disabled; 
    SPI1STATL = 0x00;
    // SPI1BRGL 9; 
    SPI1BRGL = 0x09;
    // SPITBFEN disabled; SPITUREN disabled; FRMERREN disabled; SRMTEN disabled; SPIRBEN disabled; BUSYEN disabled; SPITBEN disabled; SPIROVEN disabled; SPIRBFEN disabled; 
    SPI1IMSKL = 0x00;
    // RXMSK 0; TXWIEN disabled; TXMSK 0; RXWIEN disabled; 
    SPI1IMSKH = 0x00;
    // SPI1URDTL 0; 
    SPI1URDTL = 0x00;
    // SPI1URDTH 0; 
    SPI1URDTH = 0x00;
    // SPIEN enabled; DISSDO disabled; MCLKEN FOSC/2; CKP Idle:Low, Active:High; SSEN disabled; MSTEN Master; MODE16 disabled; SMP Middle; DISSCK disabled; SPIFE Frame Sync pulse precedes; CKE Active to Idle; MODE32 disabled; SPISIDL disabled; ENHBUF enabled; DISSDI disabled; 
    SPI1CON1L = 0x8121;

}

void SYSTEM_Initialize(void)
{
    PIN_MANAGER_Initialize();
    CLOCK_Initialize();
    INTERRUPT_Initialize();
    SPI1_Initialize();
    INTERRUPT_GlobalEnable();
    SYSTEM_CORCONModeOperatingSet(CORCON_MODE_PORVALUES);
}

    const RESET_CMD:       u8 = 0b1100_0000;
    const READ_CMD:        u8 = 0b0000_0011;
    const READ_RX_BUF_CMD: u8 = 0b1001_0000; // 1001_0nm0
    const WRITE_CMD:       u8 = 0b0000_0010;
    //const LOAD_TX_CMD:     u8 = 0b0100_0000; // 0100_0abc
    const RTS_CMD:         u8 = 0b1000_0000; // 1000_0nnn
    //const READ_STATUS_CMD: u8 = 0b1010_0000;
    //const RX_STATUS:       u8 = 0b1011_0000;
    const BIT_MODIFY_CMD:  u8 = 0b0000_0101;

*/