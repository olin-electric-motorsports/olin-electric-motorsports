# Temporary script to test radio communication

import serial
import time
ser = serial.Serial('/dev/ttyUSB0', timeout=10)
while True:
    print(ser.read_until(b'END'))
    time.sleep(0.1)

    

