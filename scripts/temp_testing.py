import can
import time

def extract_enum_value(data, slice_start, slice_length, enum_values):
    byte_start = slice_start // 8
    byte_end = (slice_start + slice_length)//8

    raw_value = 0
    for i in range(byte_start, byte_end + 1):
        raw_value |= data[i] << (8 * (i - byte_start))

    if raw_value < len(enum_values):
        return enum_values[raw_value]

temperature_task_enum = [
    "TASK_START",
    "SET_MUX",
    "ADC_CONVERSIONS",
    "READ_REGISTERS",
    "COMPUTATION",
    "SET_NEXT_MUX"
]

bus = can.interface.Bus(channel='can0', bustype='socketcan')

message_id = 0x511
slice_start = 48
slice_length = 8

last_time = None
last_enum = None

try:
    print("Starting CAN message listener\n")
    while True:
        msg = bus.recv()

        if msg.arbitration_id == message_id:
            enum_value = extract_enum_value(msg.data, slice_start, slice_length, temperature_task_enum)

            current_time = time.time()

            if last_time is not None and enum_value != last_enum:
                elapsed_time = current_time - last_time
                print(f"Enum changed {last_enum} -> {enum_value}. Time taken: {elapsed_time}")

            last_time = current_time
            last_enum = enum_value

except KeyboardInterrupt:
    print("\nCAN message listener stopped")
