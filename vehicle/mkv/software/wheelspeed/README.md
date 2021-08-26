# Wheel Speed Sensing Board

The purose of this board is to read a wheel speed sensor. Each board will read one sensor and report it over CAN for the vehicle to both log the data and use it for real-time controls.

### Test Code

As of right now, the code is written to run on a generic atmega16m1 test board. The goal of these tests are to validate that the sensor that has been selected will be an adequate long-term solution for future vehicles. The current code counts the pulses that occur every 100ms and periodically reports that over UART to verify that the sensor is working properly.

### Next steps

- [x] Send data over CAN
- [ ] Implement software filtering for the wheel speed data (and investigate if this is necessary)
- [x] ~~Implement speed calculations~~ This idea was scrapped because of the ATMEGA not supporting floating point numbers. Instead, we will send the raw speeds and have the true values be calculated on the other side.
