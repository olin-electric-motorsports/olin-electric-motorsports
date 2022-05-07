import can
import threading
import time

seeedbus = can.interface.Bus(
    bustype="seeedstudio", channel="/dev/ttyUSB0", bitrate=500000
)
virt = can.interface.Bus(
    "vcan0", bustype="virtual", interface="socketcan", preserve_timestamps=True
)


def seeed_to_virt():
    for message in seeedbus:
        virt.send(message)


def virt_to_seeed():
    for message in virt:
        seeedbus.send(message)


if __name__ == "__main__":
    sv = threading.Thread(target=seeed_to_virt, daemon=True)
    vs = threading.Thread(target=virt_to_seeed, daemon=True)

    sv.start()
    vs.start()

    while True:
        time.sleep(1)
