import can

bus = can.interface.Bus(bustype="slcan", channel='/dev/ttyACM1', bitrate=500000)

for msg in bus:
    print(msg)