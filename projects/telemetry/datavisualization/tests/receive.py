import serial

while True:
    s = serial.Serial("/dev/ttyUSB0", 57600)
    data = str(s.read_until(size=64))
    print(f"this is data {data}")
    print(data[1])
    print(data[2])
    if data[1] == "x":
        next_message = data[2:]
    else:
        next_message = data
    print(f"this is next_message {next_message}")
