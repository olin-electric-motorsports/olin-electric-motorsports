""" 
Initialize CAN hardware and create thread that listens for and receives all CAN messages
"""
import cantools
import can
import threading

import serial
import pickle

# Initiate serial connection
try:
    ser = serial.Serial('/dev/ttyUSB0', timeout=10)
except Exception as e:
    print(e)

db = None


def listener_fn(can_bus, callback, kill_flag):
    while not kill_flag.is_set():
        if ser:
            try:
                msg_bytes = ser.read_until()
                msg = pickle.load(msg_bytes)
            except Exception as e:
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
