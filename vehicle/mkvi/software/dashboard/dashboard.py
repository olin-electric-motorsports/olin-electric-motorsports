import can
import cantools
import yaml
import time
import RPi.GPIO as GPIO
import threading

# Pin Definitions
AMS_LED_LSD = 27
HV_LED_LSD = 29
IMD_LED_LSD = 26
RTD_BUZZER_LSD = 28

RTD_BUTTON_SENSE = 31
BOTS_SHDN_SENSE = 22
E_STOP_SHDN_SENSE = 24

RTD_BUTTON_LED = 33
PROGRAMMING_LED_1 = 40
PROGRAMMING_LED_2 = 38
PROGRAMMING_LED_3 = 37

db = cantools.database.load_file('mkv.dbc')
db.messages
bms_core = db.get_message_by_name('bms_core')

can_bus = can.interface.Bus('vcan0', bustype='socketcan')
# data = example_message.encode({'Temperature': 250.1, 'AverageRadius': 3.2, 'Enable': 1})
# message = can.Message(arbitration_id=example_message.frame_id, data=data)
# can_bus.send(message)

with open("vehicle/mkvi/software/dashboard/dashboardpython.yml", "r") as config_file:
    (
        STATES_DICTIONARY,
    ) = yaml.safe_load_all(config_file)

def dashboard_listener(can_bus, callback, kill_flag):
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

def get_val(signal, message):
    """
    Retrieves signal from the message data and applies a processing function if
    one is found in the PROCESSING_FUNCTIONS dictionary
    Args:
        signal (str): signal name to retrieve
        message (dict): message data returned by cantools.database.decode_message
    Returns:
        str: value of the signal
    """

    if val := message.get(signal):
        if func := PROCESSING_FUNCTIONS.get(signal):
            val = globals()[func](val)

        return str(val)


def callback(msg, db):
    """
    Callback when a CAN message is received, updates appropriate vehicle dictionaries
    Args:
        msg (can.Message): CAN message that was received
        db (cantools.database): Database generated from our DBC
    """
    try:
        message = db.decode_message(msg.arbitration_id, msg.data)
    except Exception as e:
        return

    for signal_name in message:
        if signal_name in STATES_DICTIONARY:
            STATES_DICTIONARY[signal_name] = get_val(signal_name, message)


def main():
    # Set pin numbering system
    GPIO.setmode(GPIO.BOARD)

    # Channel Setup/Pin Mode Setup
    channel_outputs = [AMS_LED_LSD, HV_LED_LSD, IMD_LED_LSD, RTD_BUZZER_LSD, 
    RTD_BUTTON_LED, PROGRAMMING_LED_1, PROGRAMMING_LED_2, PROGRAMMING_LED_3]
    channel_inputs = [RTD_BUTTON_SENSE, BOTS_SHDN_SENSE, E_STOP_SHDN_SENSE]
    GPIO.setup(channel_outputs, GPIO.OUT)
    GPIO.setup(channel_inputs, GPIO.IN)

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
            target=dashboard_listener,
            name="listener",
            kwargs={"can_bus": can_bus, "callback": rx_callback, "kill_flag": kill_flag},
        )

        listener.start()

    db = cantools.database.load_file(dbc)

    return can_bus, db, kill_flag
    
    while True:
        if 
    #time.sleep(0.01)


# Stores code that should only run when dashboard.py is run as a script and not
# as a module
if __name__ == "__main__":
    main()

