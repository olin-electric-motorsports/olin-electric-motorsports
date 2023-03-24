"""
Script to test that the charger is working appropriately
"""

import can
import cantools
import time

def init():
    """
    Initialize CAN bus + DBC used to handle CAN messages

    Returns:
        _type_: _description_
    """
    # Creating a bus that we'll use to send/receive our messages
    charging_bus = can.interface.Bus(
        bustype="socketcan",
        channel="can0",
        bitrate=250000
        # can_filters = vehicle_charging_cmd_filter
    )
    dbc = cantools.database.load_file("charger.dbc")
    return charging_bus, dbc


def test_charging():
    """
    Test sending a message to the Charger
    """
    charging_bus, dbc = init()
   
    msg1 = dbc.get_message_by_name("Message1")
    # # msg2 = dbc.get_message_by_name("Message2")
    # print(dbc.messages)
    # print(msg1.signals)

    # Sending Messages
    msg_to_send = msg1.encode({"Voltage": 110, "Current": 0.1, "Control": 0, "Mode": 0})
    message = can.Message(arbitration_id=msg1.frame_id, data=msg_to_send)
    
    
    charging_bus.send(message)

    time.sleep(1)

    # Receive Messages
    # msg_to_receive = charging_bus.recv()
    # dbc.decode_message(msg_to_receive.arbitration_id, message.data)

    # while True:
    #     try:
    #         for message in charging_bus:
    #             print(f"message is: {message}")

    #     except:
    #         print("PANIC")
    #         os._exit(0)
    return


if __name__ == "__main__":
    for i in range(5):
        test_charging()


    # cat log | python3 -m cantools decode ./file.dbc > decoded-log
    
    
    
    # cv = threading.Thread(target=charging_to_vehicle, daemon=True)
    # vc = threading.Thread(target=vehicle_to_charging, daemon=True)
