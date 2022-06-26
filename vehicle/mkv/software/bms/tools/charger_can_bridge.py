import can
import threading
import time

charger_fbk_filter = [
    {"can_id": 0x18ff50e5, "can_mask": 0x7FFFFFFF, "extended": True},
]

vehicle_bus = can.interface.Bus(
    bustype="socketcan", channel="can0", bitrate=500000
    # can_filters = charger_fbk_filter
)

virt = can.interface.Bus(
    "vcan0", bustype="virtual", interface="socketcan", preserve_timestamps=True
)

# vehicle_charging_cmd_filter = [
#     {"can_id": 0x80, "can_mask": 0x7FF, "extended": False},
# ]

charging_bus = can.interface.Bus(
    bustype="seeedstudio", channel="/dev/ttyUSB0", bitrate=250000
    # can_filters = vehicle_charging_cmd_filter
)

def charging_to_vehicle():
    try:
        for message in charging_bus:
            # Repackage (change id and extended bool)
            message.arbitration_id = 0x81
            message.is_extended_id = False
            vehicle_bus.send(message)
            virt.send(message)
    except:
        print("PANIC")
        os._exit(0)

def vehicle_to_charging():
    try:
        for message in vehicle_bus:
            # If we receive the charging message, we also forward it to the charger
            virt.send(message)

            if message.arbitration_id == 0x80:

                # Repackage (change id and extended bool)
                message.arbitration_id = 0x1806e5f4
                message.is_extended_id = True
                charging_bus.send(message)
    except:
        os._exit(0)

if __name__ == "__main__":
    cv = threading.Thread(target=charging_to_vehicle, daemon=True)
    vc = threading.Thread(target=vehicle_to_charging, daemon=True)

    cv.start()
    vc.start()

    while True:
        time.sleep(0.1)
