""" 
Initialize CAN hardware and create thread that listens for and receives all CAN messages
"""
import cantools
import can
import threading

db = None


def listener_fn(can_bus, callback, kill_flag):
    """Thread that runs all the time to listen to CAN messages

    References:
      - https://python-can.readthedocs.io/en/master/interfaces/socketcan.html
      - https://python-can.readthedocs.io/en/master/
    """
    while not kill_flag.is_set():
        msg = can_bus.recv(1)  # 1 second receive timeout
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
