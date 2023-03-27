import os
import can
import threading
import time

seeedbus = can.interface.Bus(
    bustype="seeedstudio", channel="/dev/ttyUSB2", bitrate=250000
)
virt = can.interface.Bus(
    "vcan0", bustype="virtual", interface="socketcan", preserve_timestamps=True
)


def seeed_to_virt():
    try:
        for message in seeedbus:
            virt.send(message)
    except:
        os._exit(1)


def virt_to_seeed():
    try:
        for message in virt:
            seeedbus.send(message)
    except:
        os._exit(1)


if __name__ == "__main__":
    sv = threading.Thread(target=seeed_to_virt, daemon=True)
    vs = threading.Thread(target=virt_to_seeed, daemon=True)

    sv.start()
    vs.start()

    while True:
        time.sleep(1)
