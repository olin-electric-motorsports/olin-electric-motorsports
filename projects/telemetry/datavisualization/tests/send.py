import serial
from time import sleep

s = serial.Serial("/dev/ttyUSB1", 57600)
while True:
    # next_message = [11,34,139,0,255,255,255,255]
    # next_message_bytes = bytearray(next_message)

    # [11,41,167,0,255,255,255,255]
    s.write(bytearray(b"\x0B\x29\xA7\x00\xFF\xFF\xFF\xFF"))
    sleep(0.5)
    # [11,34,139,0,255,255,255,255]
    s.write(bytearray(b"\x0B\x22\x8B\x00\xFF\xFF\xFF\xFF"))
    sleep(0.5)
