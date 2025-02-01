""" 
Initialize serial connection to telemetry radio and create thread that recieves and deserializes CAN messages
"""
import threading
import serial
import pickle

def listener_fn(ser, callback, kill_flag):
    """Thread that runs all the time to listen to CAN messages over serial. Calls callback function when CAN message is recieved"""
    while not kill_flag.is_set(): # Continous loop until kill_flag is set

        # Read messages over serial until END marker, then remove marker
        msg = ser.read_until(b'END')
        msg = msg.replace(b'END', b'')

        # Try to deserialize the recieved message
        try:
            print(pickle.loads(msg))
        except Exception as e:
            print("Failed to deserialize:", e)

        # If a valid CAN message is recieved, pass to callback function in canviewer
        if msg: 
            callback(msg)

    print("Exited gracefully")


def init_telemetry(usb_path, baudrate, timeout, rx_callback):
    """Initialize seraial object and start listener thread"""

    # Create serial object
    ser = serial.Serial(
        port=usb_path, 
        baudrate=baudrate,
        timeout=timeout
    )

    # Create and start listener thread
    kill_flag = threading.Event()
    listener = threading.Thread(
        target=listener_fn,
        name="listener",
        kwargs={"ser": ser, "callback": rx_callback, "kill_flag": kill_flag},
    )
    listener.start()

    # Return kill_flag so that thread can be shut down
    return kill_flag