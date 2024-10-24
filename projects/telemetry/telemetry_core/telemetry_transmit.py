# This code should run on startup on the Rasberry Pi in the dashboard of the car
# Reads CAN data and sends entire CAN stream over serial to radio

import serial
import time

ser = serial.Serial('/dev/ttyUSB0', timeout=10)




while True:
    # write can data
    time.sleep(0.1)
