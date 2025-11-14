import sys
import serial
import pickle

can_message = sys.argv[1]
if len(sys.argv) > 1:
    print("Arguments were provided:")
    for arg in sys.argv[1:]:
        print(f"- {arg}")
else:
    print("i have no idea how to do this")
    
    
ser = None
try:
    ser = serial.Serial('/dev/ttyUSB0', timeout=10)
except Exception as e:
    print("Serial failed to start", e)

def dashboard_listener(can_message):
    if ser:
        try:
            msg_bytes = pickle.dumps(can_message)
            ser.write(msg_bytes)
            ser.write(b'END')
            print("Message sent")
        except Exception as e:
            print("Message failed to send over serial", e)

dashboard_listener(can_message)
