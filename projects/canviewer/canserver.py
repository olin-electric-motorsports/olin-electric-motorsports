""" 
Initialize CAN hardware and create thread that listens for and receives all CAN messages
"""
import cantools
import can
import threading

import serial
import pickle
import time

# Initiate serial connection
try:
    ser = serial.Serial('/dev/ttyUSB0', baudrate=9600, timeout=1)
except Exception as e:
    print(e)

db = None


def listener_fn(can_bus, callback, kill_flag):
    msg = None
    while not kill_flag.is_set():
        if ser:
            try:
                msg = ser.read_until(b'END')
                print(msg)
                msg = msg.replace(b'END', b'')
                try:
                    print(pickle.loads(msg))
                except:
                    print("failed to deserialize")
                time.sleep(0.1)
            except Exception as e:
                print("Serial recieve error:")
                print(e)
            

        #msg = can_bus.recv(1)  # 1 second receive timeout
        if msg:
            callback(msg, db)

    can_bus.shutdown()
    print("Exited gracefully")


def init_can(channel, bustype, bitrate, rx_callback, dbc):
    """Initialize CAN hardware and create CAN database from DBC"""
    global db
    can_bus = can.interface.Bus(
        channel=channel,
        bustype=bustype,
        bitrate=bitrate,
    )

    kill_flag = threading.Event()
    listener = threading.Thread(
        target=listener_fn,
        name="listener",
        kwargs={"can_bus": can_bus, "callback": rx_callback, "kill_flag": kill_flag},
    )

    listener.start()

    db = cantools.database.load_file(dbc)

    return can_bus, db, kill_flag
