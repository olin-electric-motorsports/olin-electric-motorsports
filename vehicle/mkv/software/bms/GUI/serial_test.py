import serial


with serial.Serial('/dev/ttyUSB0',9600,timeout=2) as ser:
    print(ser.readlines(3))

