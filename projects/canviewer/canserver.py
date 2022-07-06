import cantools
import can
import threading

db = None


def listener_fn(can_bus, callback):
    """Thread that runs all the time to listen to CAN messages

    References:
      - https://python-can.readthedocs.io/en/master/interfaces/socketcan.html
      - https://python-can.readthedocs.io/en/master/
    """
    while True:
        msg = can_bus.recv(1)  # 1 second receive timeout
        if msg:
            callback(msg, db)


def init_can(channel, bitrate, rx_callback, dbc):
    global db
    can_bus = can.interface.Bus(
        channel=channel,
        bustype="socketcan",
        bitrate=bitrate,
    )

    listener = threading.Thread(
        target=listener_fn,
        name="listener",
        kwargs={"can_bus": can_bus, "callback": rx_callback},
    )

    listener.daemon = True
    listener.start()

    db = cantools.database.load_file(dbc)

    return can_bus, db
