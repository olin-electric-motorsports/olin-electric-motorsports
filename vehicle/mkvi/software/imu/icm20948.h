/**
 * Basic library for the ICM20948
 */

/**
 * ICM20948 register map
 */

// Bank 0
#define WHO_AM_I              0x00
#define USER_CTRL             0x03
#define LP_CONFIG             0x05
#define PWR_MGMT_1            0x06
#define PWR_MGMT_2            0x07
#define INT_PIN_CFG           0x0F
#define INT_ENABLE            0x10
#define INT_ENABLE_1          0x11
#define INT_ENABLE_2          0x12
#define INT_ENABLE_3          0x13
#define I2C_MST_STATUS        0x17
#define INT_STATUS            0x19
#define INT_STATUS_1          0x1A
#define INT_STATUS_2          0x1B
#define INT_STATUS_3          0x1C
#define DELAY_TIMEH           0x28
#define DELAY_TIMEL           0x29
#define ACCEL_XOUT_H          0x2D
#define ACCEL_XOUT_L          0x2E
#define ACCEL_YOUT_H          0x2F
#define ACCEL_YOUT_L          0x30
#define ACCEL_ZOUT_H          0x31
#define ACCEL_ZOUT_H          0x32
#define GYRO_XOUT_H           0x33
#define GYRO_XOUT_L           0x34
#define GYRO_YOUT_H           0x35
#define GYRO_YOUT_L           0x36
#define GYRO_ZOUT_H           0x37
#define GYRO_ZOUT_L           0x38
#define TEMP_OUT_H            0x39
#define TEMP_OUT_L            0x3A
#define EXT_SLV_SENSE_DATA_00 0x3B
#define EXT_SLV_SENSE_DATA_01 0x3C
#define EXT_SLV_SENSE_DATA_02 0x3D
#define EXT_SLV_SENSE_DATA_03 0x3E
#define EXT_SLV_SENSE_DATA_04 0x3F
#define EXT_SLV_SENSE_DATA_05 0x40
#define EXT_SLV_SENSE_DATA_06 0x41
#define EXT_SLV_SENSE_DATA_07 0x42
#define EXT_SLV_SENSE_DATA_08 0x43
#define EXT_SLV_SENSE_DATA_09 0x44
#define EXT_SLV_SENSE_DATA_10 0x45
#define EXT_SLV_SENSE_DATA_11 0x46
#define EXT_SLV_SENSE_DATA_12 0x47
#define EXT_SLV_SENSE_DATA_13 0x48
#define EXT_SLV_SENSE_DATA_14 0x49
#define EXT_SLV_SENSE_DATA_15 0x4A
#define EXT_SLV_SENSE_DATA_16 0x4B
#define EXT_SLV_SENSE_DATA_17 0x4C
#define EXT_SLV_SENSE_DATA_18 0x4D
#define EXT_SLV_SENSE_DATA_19 0x4E
#define EXT_SLV_SENSE_DATA_20 0x4F
#define EXT_SLV_SENSE_DATA_21 0x50
#define EXT_SLV_SENSE_DATA_22 0x51
#define EXT_SLV_SENSE_DATA_23 0x52
#define FIFO_EN_1             0x66
#define FIFO_EN_2             0x67
#define FIFO_RST              0x68
#define FIFO_MODE             0x69
#define FIFO_COUNTH           0x70
#define FIFO_COUNTL           0x71
#define FIFO_R_W              0x72
#define DATA_RDY_STATUS       0x74
#define FIFO_CFG              0x76
#define REG_BANK_SEL          0x7F

// Bank 1
#define SELF_TEST_X_GYRO        0x02
#define SELF_TEST_Y_GYRO        0x03
#define SELF_TEST_Z_GYRO        0x04
#define SELF_TEST_X_ACCEL       0x0E
#define SELF_TEST_Y_ACCEL       0x0F
#define SELF_TEST_Z_ACCEL       0x10
#define XA_OFFS_H               0x14
#define XA_OFFS_L               0x15
#define YA_OFFS_H               0x17
#define YA_OFFS_L               0x18
#define ZA_OFFS_H               0x1A
#define ZA_OFFS_L               0x1B
#define TIMEBASE_CORRECTION_PLL 0x28
// #define REG_BANK_SEL 0x7F

// Bank 2
#define GYRO_SMPLRT_DIV    0x00
#define GYRO_CONFIG_1      0x01
#define GYRO_CONFIG_2      0x02
#define XG_OFFS_USRH       0x03
#define XG_OFFS_USRL       0x04
#define YG_OFFS_USRH       0x05
#define YG_OFFS_USRL       0x06
#define ZG_OFFS_USRH       0x07
#define ZG_OFFS_USRL       0x08
#define ODR_ALIGN_EN       0x09
#define ACCEL_SMPLRT_DIV_1 0x10
#define ACCEL_SMPLRT_DIV_2 0x11
#define ACCEL_INTEL_CRTL   0x12
#define ACCEL_WOM_THR      0x13
#define ACCEL_CONFIG       0x14
#define ACCEL_CONFIG_2     0x15
#define FSYNC_CONFIG       0x52
#define TEMP_CONFIG        0x53
#define MOD_CTRL_USR       0x54
// #define REG_BANK_SEL 0x7F

// Bank 3
#define I2C_MST_ODR_CONFIG 0x00
#define I2C_MST_CTRL       0x01
#define I2C_MST_CTRL       0x02
#define I2C_SLV0_ADDR      0x03
#define I2C_SLV0_REG       0x04
#define I2C_SLV0_CTRL      0x05
#define I2C_SLV0_DO        0x06
#define I2C_SLV1_ADDR      0x07
#define I2C_SLV1_REG       0x08
#define I2C_SLV1_CTRL      0x09
#define I2C_SLV1_DO        0x0A
#define I2C_SLV2_ADDR      0x0B
#define I2C_SLV2_REG       0x0C
#define I2C_SLV2_CTRL      0x0D
#define I2C_SLV2_DO        0x0E
#define I2C_SLV3_ADDR      0x0F
#define I2C_SLV3_REG       0x10
#define I2C_SLV3_CTRL      0x11
#define I2C_SLV3_DO        0x12
#define I2C_SLV4_ADDR      0x13
#define I2C_SLV4_REG       0x14
#define I2C_SLV4_CTRL      0x15
#define I2C_SLV4_DO        0x16
#define I2C_SLV4_DI        0x17
#define REG_BANK_SEL       0x7F

/**
 * Magnetometer register map
 */
// TODO
