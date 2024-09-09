#include "imu_config.h"
#include "libs/gpio/api.h"
#include "libs/gpio/pin_defs.h"
#include "libs/timer/api.h"
#include "vehicle/mkvi/software/imu/can_api.h"
#include "vehicle/mkvi/software/imu/icm20948/icm20948.h"

#include <avr/interrupt.h>
#include <avr/io.h>
#include <stdint.h>
#include <util/delay.h>

// #include "projects/btldr/btldr_lib.h"
// #include "projects/btldr/git_sha.h"
// #include "projects/btldr/libs/image/api.h"
#include "projects/can_print/can_print.h"

// /*
//  * Required for btldr
//  */
// image_hdr_t image_hdr __attribute__((section(".image_hdr"))) = {
//     .image_magic = IMAGE_MAGIC,
//     .git_sha = STABLE_GIT_COMMIT,
// };

/**
 * Timer 0 for sending IMU data over CAN
 */
volatile bool can_send_imu_data = true;
void timer_0_isr(void) {
    can_send_imu_data = true;
}

/**
 * Timer 1 for the LED heartbeat
 */
volatile bool led_heartbeat = true;
void timer_1_isr(void) {
    led_heartbeat = true;
}

uint8_t test = 0;
/**
 * Update the arb id of an IMU based on soldered pull up jumpers.
 *
 * Allows for multiple IMUs running the same firmware on the same CAN bus.
 */
void update_can_arb_id(void) {
    // Pull up inputs
    gpio_set_mode(bin_id_0, INPUT);
    gpio_set_mode(bin_id_1, INPUT);
    gpio_set_mode(bin_id_2, INPUT);

    // Update ids
    imu_accel_msg.id
        += (0x10
            * (!gpio_get_pin(bin_id_0) + (!gpio_get_pin(bin_id_1) << 1)
               + (!gpio_get_pin(bin_id_2) << 2)));
    imu_gyro_msg.id
        += (0x10
            * (!gpio_get_pin(bin_id_0) + (!gpio_get_pin(bin_id_1) << 1)
               + (!gpio_get_pin(bin_id_2) << 2)));
    imu_magnet_msg.id
        += (0x10
            * (!gpio_get_pin(bin_id_0) + (!gpio_get_pin(bin_id_1) << 1)
               + (!gpio_get_pin(bin_id_2) << 2)));
}

/**
 * Initialize 16m1 hardware peripherals
 */
void init_peripherals(void) {
    gpio_set_mode(debug_led, OUTPUT); // Heartbeat LED
    update_can_arb_id(); // Update arb based on IMU id
    can_init_imu(); // CAN
    sei(); // Interrupts
    timer_init(&timer_0_cfg); // Timer 0
    timer_init(&timer_1_cfg); // Timer 1
    spi_init(&imu_spi_cfg); // SPI
}

/**
 * Initialize ICM20948 for full 9-axis readings
 */
void init_imu(void) {
    // Perform soft reset and wait for power up
    icm_write_register(PWR_MGMT_1, 0x81);
    uint8_t pwr_mgmt_1_data = 0;
    while (pwr_mgmt_1_data != 0x41) {
        icm_read_register(PWR_MGMT_1, &pwr_mgmt_1_data);
    }

    // Wake from sleep
    icm_write_register(PWR_MGMT_1, 0x01);

    // //
    // icm_write_register(USER_CTRL, 0x20);

    switch_register_bank(BANK_2);

    // Set accelerometer full scale range
    icm_write_register(ACCEL_CONFIG, 0x1 | (accel_fsr << 1));

    // Set gyroscope full scale range
    icm_write_register(GYRO_CONFIG_1, 0x01 | (gyro_fsr << 1));

    switch_register_bank(BANK_0);

    // Initialize magnetometer
    init_magnetometer();
}

/**
 * Read accel data and place in CAN structs
 */
void read_accel_data(void) {
    uint8_t accel_data[2] = { 0x0, 0x0 };
    icm_read_register(ACCEL_XOUT_L, &accel_data[0]);
    icm_read_register(ACCEL_XOUT_H, &accel_data[1]);
    imu_accel.x = accel_data[0] | (accel_data[1] << 8);
    icm_read_register(ACCEL_YOUT_L, &accel_data[0]);
    icm_read_register(ACCEL_YOUT_H, &accel_data[1]);
    imu_accel.y = accel_data[0] | (accel_data[1] << 8);
    icm_read_register(ACCEL_ZOUT_L, &accel_data[0]);
    icm_read_register(ACCEL_ZOUT_H, &accel_data[1]);
    imu_accel.z = accel_data[0] | (accel_data[1] << 8);
}

/**
 * Read gyro data and place in CAN structs
 */
void read_gyro_data(void) {
    uint8_t gyro_data[2] = { 0x0, 0x0 };
    icm_read_register(GYRO_XOUT_L, &gyro_data[0]);
    icm_read_register(GYRO_XOUT_H, &gyro_data[1]);
    imu_gyro.x = gyro_data[0] | (gyro_data[1] << 8);
    icm_read_register(GYRO_YOUT_L, &gyro_data[0]);
    icm_read_register(GYRO_YOUT_H, &gyro_data[1]);
    imu_gyro.y = gyro_data[0] | (gyro_data[1] << 8);
    icm_read_register(GYRO_ZOUT_L, &gyro_data[0]);
    icm_read_register(GYRO_ZOUT_H, &gyro_data[1]);
    imu_gyro.z = gyro_data[0] | (gyro_data[1] << 8);
}

int main(void) {
    init_peripherals();
    // _can_print(imu_accel_msg.id);
    // _can_print(imu_gyro_msg.id);
    // _can_print(imu_magnet_msg.id);

    init_imu();
    // uint8_t rx_data;
    uint8_t rx_data_2;

    read_magnetometer(WIA2, &rx_data_2);
    // _delay_ms(100);
    // _can_print(rx_data_2);

    for (;;) {
        if (led_heartbeat) {
            gpio_toggle_pin(debug_led);
            led_heartbeat = false;
        };
        if (can_send_imu_data) {
            // _delay_ms(1);
            // switch_register_bank(BANK_3);
            // icm_read_register(I2C_SLV4_REG, &rx_data);
            // _can_print(rx_data);

            // switch_register_bank(BANK_0);
            // read_accel_data();
            // can_send_imu_accel();

            // read_gyro_data();
            // can_send_imu_gyro();
            can_send_imu_data = false;
        }
    }
}
