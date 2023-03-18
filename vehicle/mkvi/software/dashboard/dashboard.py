import threading
import time
import yaml
import can
import cantools
import RPi.GPIO as GPIO

# bustype = "slcan"          idk lol
# channel = "/dev/ttyACM1"   which port on the raspi
# bitrate = 500000           number of bits per second

# Loading in everyone's compiled config files
dbc_file = "mkv.dbc"
db = cantools.database.load_file(dbc_file)

# Creating the STATES_DICTIONARY
STATES_DICTIONARY = {}


def init_can(channel, bustype, bitrate, callback, dbc):
    """Initialize CAN hardware and create CAN database from DBC"""
    can_bus = can.interface.Bus(
        channel=channel,
        bustype=bustype,
        bitrate=bitrate,
    )

    kill_flag = threading.Event()
    listener = threading.Thread(
        target=dashboard_listener,
        name="listener",
        kwargs={"can_bus": can_bus, "callback": callback, "kill_flag": kill_flag},
    )

    listener.start()
    return can_bus, db, kill_flag


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


def dashboard_callback(msg, db):
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

    STATES_DICTIONARY = {}
    for signal_name in message:
        STATES_DICTIONARY[signal_name] = message.get(signal_name)


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


def main():
    # Set pin numbering system
    GPIO.setmode(GPIO.BOARD)

    # Channel Setup/Pin Mode Setup
    channel_outputs = [
        AMS_LED_LSD,
        HV_LED_LSD,
        IMD_LED_LSD,
        RTD_BUZZER_LSD,
        RTD_BUTTON_LED,
        PROGRAMMING_LED_1,
        PROGRAMMING_LED_2,
        PROGRAMMING_LED_3,
    ]
    channel_inputs = [RTD_BUTTON_SENSE, BOTS_SHDN_SENSE, E_STOP_SHDN_SENSE]
    GPIO.setup(channel_outputs, GPIO.OUT)
    GPIO.setup(channel_inputs, GPIO.IN)

    # Initialize a thread to constantly update STATES_DICTIONARY from CAN messages
    init_can("/dev/ttyACM1", "slcan", 500000, dashboard_callback, dbc_file)

    # Number of seconds the buzzer sounds
    seconds = 4

    while True:
        # Activates ready to drive
        if (
            STATES_DICTIONARY["air_state"] == "TS_ACTIVE"
            and STATES_DICTIONARY["brake_gate"]
            is False  ## Am I supposed to use bspd_current_sense?
            and STATES_DICTIONARY["start_button_state"] is True
        ):
            STATES_DICTIONARY["ready_to_drive"] = True
            # Sounds the buzzer for exactly seconds number of seconds
            if STATES_DICTIONARY["ready_to_drive"] is True:
                GPIO.output(RTD_BUTTON_LED, 1)  # Turn on RTD LED
                GPIO.output(RTD_BUZZER_LSD, 1)  # Start buzzer
                time.sleep(seconds)
                GPIO.output(RTD_BUZZER_LSD, 0)  # Stop buzzer after some seconds

        # Turns on AMS LED if there are any AMS faults
        if STATES_DICTIONARY["bms_fault"] != "NONE":
            GPIO.output(AMS_LED_LSD, 1)

        # Turns on HV LED if both the air positive and air negative are closed
        if (
            STATES_DICTIONARY["air_p_state"]
            and STATES_DICTIONARY["air_n_state"] is True
        ):
            GPIO.output(HV_LED_LSD, 1)

        # Turns on IMD LED if there is an IMD fault


# Stores code that should only run when dashboard.py is run as a script and not
# as a module
if __name__ == "__main__":
    main()
