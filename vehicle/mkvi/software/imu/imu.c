#include "imu_config.h"
#include "libs/gpio/api.h"
#include "libs/gpio/pin_defs.h"
#include "libs/timer/api.h"
#include "vehicle/common/icm20948/icm20948.h"
#include "vehicle/mkvi/software/imu/can_api.h"
#include <avr/interrupt.h>
#include <avr/io.h>
#include <util/delay.h>

// #include "projects/btldr/btldr_lib.h"
// #include "projects/btldr/git_sha.h"
// #include "projects/btldr/libs/image/api.h"
// #include "projects/can_print/can_print.h"

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
volatile bool can_send_imu_data = false;
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

    // TODO: Calculate arb id offset once instead of thrice.
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
    imu_euler_msg.id
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

    switch_register_bank(BANK_2);

    // // Set accelerometer full scale range
    // icm_write_register(ACCEL_CONFIG, 0x1 | (accel_fsr << 1));

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
    uint8_t accel_data[6] = { 0 };
    icm_burst_read(ACCEL_XOUT_H, 6, accel_data);
    imu_accel.accel_x = (int16_t)(accel_data[1] | (accel_data[0] << 8));
    imu_accel.accel_y = (int16_t)(accel_data[3] | (accel_data[2] << 8));
    imu_accel.accel_z = (int16_t)(accel_data[5] | (accel_data[4] << 8));
}

/**
 * Read gyro data and place in CAN structs
 */
void read_gyro_data(void) {
    uint8_t gyro_data[6] = { 0 };
    icm_burst_read(GYRO_XOUT_H, 6, gyro_data);
    int16_t raw_x = (int16_t)((gyro_data[0] << 8) | gyro_data[1]);
    int16_t raw_y = (int16_t)((gyro_data[2] << 8) | gyro_data[3]);
    int16_t raw_z = (int16_t)((gyro_data[4] << 8) | gyro_data[5]);
    imu_gyro.gyro_x = (int16_t)(raw_x * GYRO_SCALE * 100);
    imu_gyro.gyro_y = (int16_t)(raw_y * GYRO_SCALE * 100);
    imu_gyro.gyro_z = (int16_t)(raw_z * GYRO_SCALE * 100);
}

// void read_magnetometer_data(void) {
//     uint8_t mag_data[2] = { 0x0, 0x0 };
//     read_mag(MAGNETOMETER_ADDR, HXH, 1, &mag_data[0]);
//     read_mag(MAGNETOMETER_ADDR, HXL, 1, &mag_data[1]);
//     imu_magnet.magnet_x = mag_data[0] | (mag_data[1] << 8);
//     read_mag(MAGNETOMETER_ADDR, HYH, 1, &mag_data[0]);
//     read_mag(MAGNETOMETER_ADDR, HYL, 1, &mag_data[1]);
//     imu_magnet.magnet_y = mag_data[0] | (mag_data[1] << 8);
//     read_mag(MAGNETOMETER_ADDR, HZH, 1, &mag_data[0]);
//     read_mag(MAGNETOMETER_ADDR, HZL, 1, &mag_data[1]);
//     imu_magnet.magnet_z = mag_data[0] | (mag_data[1] << 8);
//     uint8_t st2;
//     read_mag(MAGNETOMETER_ADDR, ST2, 1, &st2);
// }

/**
 * Burst read magnet data and place in CAN structs
 */

 void read_magnetometer_data(void) {
    uint8_t mag_data[6] = { 0 }; 
    read_mag(MAGNETOMETER_ADDR, HXL, 6, mag_data);
    int16_t raw_x = (int16_t)(mag_data[0] << 8 | mag_data[1]);
    int16_t raw_y = (int16_t)(mag_data[2] << 8 | mag_data[3]);
    int16_t raw_z = (int16_t)(mag_data[4] << 8 | mag_data[5]);
    imu_magnet.magnet_x = (int16_t)(raw_x * MAG_SCALE * 100);
    imu_magnet.magnet_y = (int16_t)(raw_y * MAG_SCALE * 100);
    imu_magnet.magnet_z = (int16_t)(raw_z * MAG_SCALE * 100);
    uint8_t st2;
    read_mag(MAGNETOMETER_ADDR, ST2, 1, &st2);
}


void MadgwickQuaternionUpdate(float q[4], float deltat, float beta, float ax, float ay, float az, float gx, float gy, float gz, float mx, float my, float mz)
{
    float q1 = q[0], q2 = q[1], q3 = q[2], q4 = q[3];   // short name local variable for readability
    float norm;
    float hx, hy, _2bx, _2bz;
    float s1, s2, s3, s4;
    float qDot1, qDot2, qDot3, qDot4;

    // Auxiliary variables to avoid repeated arithmetic
    float _2q1mx;
    float _2q1my;
    float _2q1mz;
    float _2q2mx;
    float _4bx;
    float _4bz;
    float _2q1 = 2.0f * q1;
    float _2q2 = 2.0f * q2;
    float _2q3 = 2.0f * q3;
    float _2q4 = 2.0f * q4;
    float _2q1q3 = 2.0f * q1 * q3;
    float _2q3q4 = 2.0f * q3 * q4;
    float q1q1 = q1 * q1;
    float q1q2 = q1 * q2;
    float q1q3 = q1 * q3;
    float q1q4 = q1 * q4;
    float q2q2 = q2 * q2;
    float q2q3 = q2 * q3;
    float q2q4 = q2 * q4;
    float q3q3 = q3 * q3;
    float q3q4 = q3 * q4;
    float q4q4 = q4 * q4;

    // Normalise accelerometer measurement
    norm = sqrt(ax * ax + ay * ay + az * az);
    if (norm == 0.0f) return; // handle NaN
    norm = 1.0f/norm;
    ax *= norm;
    ay *= norm;
    az *= norm;

    // Normalise magnetometer measurement
    norm = sqrt(mx * mx + my * my + mz * mz);
    if (norm == 0.0f) return; // handle NaN
    norm = 1.0f/norm;
    mx *= norm;
    my *= norm;
    mz *= norm;

    // Reference direction of Earth's magnetic field
    _2q1mx = 2.0f * q1 * mx;
    _2q1my = 2.0f * q1 * my;
    _2q1mz = 2.0f * q1 * mz;
    _2q2mx = 2.0f * q2 * mx;
    hx = mx * q1q1 - _2q1my * q4 + _2q1mz * q3 + mx * q2q2 + _2q2 * my * q3 + _2q2 * mz * q4 - mx * q3q3 - mx * q4q4;
    hy = _2q1mx * q4 + my * q1q1 - _2q1mz * q2 + _2q2mx * q3 - my * q2q2 + my * q3q3 + _2q3 * mz * q4 - my * q4q4;
    _2bx = sqrt(hx * hx + hy * hy);
    _2bz = -_2q1mx * q3 + _2q1my * q2 + mz * q1q1 + _2q2mx * q4 - mz * q2q2 + _2q3 * my * q4 - mz * q3q3 + mz * q4q4;
    _4bx = 2.0f * _2bx;
    _4bz = 2.0f * _2bz;

    // Gradient decent algorithm corrective step
    s1 = -_2q3 * (2.0f * q2q4 - _2q1q3 - ax) + _2q2 * (2.0f * q1q2 + _2q3q4 - ay) - _2bz * q3 * (_2bx * (0.5f - q3q3 - q4q4) + _2bz * (q2q4 - q1q3) - mx) + (-_2bx * q4 + _2bz * q2) * (_2bx * (q2q3 - q1q4) + _2bz * (q1q2 + q3q4) - my) + _2bx * q3 * (_2bx * (q1q3 + q2q4) + _2bz * (0.5f - q2q2 - q3q3) - mz);
    s2 = _2q4 * (2.0f * q2q4 - _2q1q3 - ax) + _2q1 * (2.0f * q1q2 + _2q3q4 - ay) - 4.0f * q2 * (1.0f - 2.0f * q2q2 - 2.0f * q3q3 - az) + _2bz * q4 * (_2bx * (0.5f - q3q3 - q4q4) + _2bz * (q2q4 - q1q3) - mx) + (_2bx * q3 + _2bz * q1) * (_2bx * (q2q3 - q1q4) + _2bz * (q1q2 + q3q4) - my) + (_2bx * q4 - _4bz * q2) * (_2bx * (q1q3 + q2q4) + _2bz * (0.5f - q2q2 - q3q3) - mz);
    s3 = -_2q1 * (2.0f * q2q4 - _2q1q3 - ax) + _2q4 * (2.0f * q1q2 + _2q3q4 - ay) - 4.0f * q3 * (1.0f - 2.0f * q2q2 - 2.0f * q3q3 - az) + (-_4bx * q3 - _2bz * q1) * (_2bx * (0.5f - q3q3 - q4q4) + _2bz * (q2q4 - q1q3) - mx) + (_2bx * q2 + _2bz * q4) * (_2bx * (q2q3 - q1q4) + _2bz * (q1q2 + q3q4) - my) + (_2bx * q1 - _4bz * q3) * (_2bx * (q1q3 + q2q4) + _2bz * (0.5f - q2q2 - q3q3) - mz);
    s4 = _2q2 * (2.0f * q2q4 - _2q1q3 - ax) + _2q3 * (2.0f * q1q2 + _2q3q4 - ay) + (-_4bx * q4 + _2bz * q2) * (_2bx * (0.5f - q3q3 - q4q4) + _2bz * (q2q4 - q1q3) - mx) + (-_2bx * q1 + _2bz * q3) * (_2bx * (q2q3 - q1q4) + _2bz * (q1q2 + q3q4) - my) + _2bx * q2 * (_2bx * (q1q3 + q2q4) + _2bz * (0.5f - q2q2 - q3q3) - mz);
    norm = sqrt(s1 * s1 + s2 * s2 + s3 * s3 + s4 * s4);    // normalise step magnitude
    norm = 1.0f/norm;
    s1 *= norm;
    s2 *= norm;
    s3 *= norm;
    s4 *= norm;

    // Compute rate of change of quaternion
    qDot1 = 0.5f * (-q2 * gx - q3 * gy - q4 * gz) - beta * s1;
    qDot2 = 0.5f * (q1 * gx + q3 * gz - q4 * gy) - beta * s2;
    qDot3 = 0.5f * (q1 * gy - q2 * gz + q4 * gx) - beta * s3;
    qDot4 = 0.5f * (q1 * gz + q2 * gy - q3 * gx) - beta * s4;

    // Integrate to yield quaternion
    q1 += qDot1 * deltat;
    q2 += qDot2 * deltat;
    q3 += qDot3 * deltat;
    q4 += qDot4 * deltat;
    norm = sqrt(q1 * q1 + q2 * q2 + q3 * q3 + q4 * q4);    // normalise quaternion
    norm = 1.0f/norm;
    q[0] = q1 * norm;
    q[1] = q2 * norm;
    q[2] = q3 * norm;
    q[3] = q4 * norm;

}

void compute_yaw(void) {
    float qw = q[0];
    float qx = q[1];
    float qy = q[2];
    float qz = q[3];
    float a12 = 2.0f * (qx * qy + qw * qz);
    float a22 = qw * qw + qx * qx - qy * qy - qz * qz;

    float yaw = atan2f(a12, a22) * RAD_TO_DEG;
    // if (yaw >= 180.0f) {
    //     yaw -= 360.0f;
    // } else if (yaw < -180.0f) {
    //     yaw += 360.0f;
    // }

    imu_euler.yaw = (int16_t)(yaw * 100);
}

void compute_pitch_roll(void) {
    float ax = (float)(int16_t)imu_accel.accel_x;
    float ay = (float)(int16_t)imu_accel.accel_y;
    float az = (float)(int16_t)imu_accel.accel_z;
    float mag = sqrt(ax * ax + ay * ay + az * az);
    if (mag == 0.0f) {
        mag = 1.0f;
    }
    float norm_ax = ax / mag;
    float norm_ay = ay / mag;
    float norm_az = az / mag;
    imu_accel.accel_x = (int16_t)(norm_ax * 100);
    imu_accel.accel_y = (int16_t)(norm_ay * 100);
    imu_accel.accel_z = (int16_t)(norm_az * 100);
    float pitch_rad = asinf(norm_ax);
    float roll_rad = atan2f(norm_ay, norm_az);
    float pitch_deg = pitch_rad * RAD_TO_DEG;
    float roll_deg  = roll_rad  * RAD_TO_DEG;
    imu_euler.pitch = (int16_t)(pitch_deg * 100);
    imu_euler.roll  = (int16_t)(roll_deg  * 100);
}


int main(void) {
    init_peripherals();
    init_imu();
    uint8_t status;
    read_mag(MAGNETOMETER_ADDR, WIA2, 1, &status);
    if ((status != 0x09)) {
        return 0;
    }
    uint8_t cntl2_check;
    read_mag(MAGNETOMETER_ADDR, CNTL2, 1, &cntl2_check);
    if (cntl2_check != 0x06) {
        return 1;
    }
    switch_register_bank(BANK_0);
    read_accel_data();
    read_gyro_data();
    // getChipAccelGyroCalibration();

    for (;;) {
        // if (led_heartbeat) {
        //     gpio_toggle_pin(debug_led);
        //     led_heartbeat = false;
        // }
        if (led_heartbeat) {
            read_accel_data();
            read_gyro_data();
            read_magnetometer_data();
            compute_pitch_roll();
            float ax = ((float)(int16_t)imu_accel.accel_x) / 100.0f;
            float ay = ((float)(int16_t)imu_accel.accel_y) / 100.0f;
            float az = ((float)(int16_t)imu_accel.accel_z) / 100.0f;
            float gx = ((float)(int16_t)imu_gyro.gyro_x) / 100.0f;
            float gy = ((float)(int16_t)imu_gyro.gyro_y) / 100.0f;
            float gz = ((float)(int16_t)imu_gyro.gyro_z) / 100.0f;
            float mx = ((float)(int16_t)imu_magnet.magnet_x) / 100.0f;
            float my = ((float)(int16_t)imu_magnet.magnet_y) / 100.0f;
            float mz = ((float)(int16_t)imu_magnet.magnet_z) / 100.0f;
            float deltat = 1.0f / SAMPLE_RATE_HZ;
            MadgwickQuaternionUpdate(q, deltat, BETA, ax, ay, az, gx, gy, gz, mx, my, mz);
            compute_yaw();
            can_send_imu_accel();
            can_send_imu_gyro();
            can_send_imu_magnet();
            can_send_imu_euler();
            
            led_heartbeat = false;
        }
    }
}