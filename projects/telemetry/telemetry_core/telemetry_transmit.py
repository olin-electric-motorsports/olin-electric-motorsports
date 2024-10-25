# This code should run on startup on the Rasberry Pi in the dashboard of the car
# Reads CAN data and sends entire CAN stream over serial to radio

import serial
import time
import can

ser = serial.Serial('/dev/ttyUSB0', timeout=10)

can_bus = can.interface.Bus(
        channel="can0",
        bustype="socketcan",
        bitrate=500000,
    )


while True:
    # Write can data to serial (to be transmitted by radio)
    ser.write(can_bus.recv(1))
