import can

bus = can.interface.Bus(bustype="slcan", channel='/dev/ttyACM0', bitrate=500000)

msg = can.Message(arbitration_id=0xfe, data=10, is_extended_id=False)

try:
    bus.send(msg)
    print("Message sent on {}".format(bus.channel_info))
except can.CanError:
    print("Message NOT sent")