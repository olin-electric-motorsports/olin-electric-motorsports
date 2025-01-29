# Temporary script to test radio communication

import serial
import time
import pickle
ser = serial.Serial('/dev/ttyUSB0', baudrate=9600, timeout=10)
while True:
    msg = ser.read_until(b'END')
    #print(msg)
    msg = msg.replace(b'END', b'')
    try:
        print(pickle.loads(msg))
    except:
        print("failed to deserialize")
    time.sleep(0.01)
    

