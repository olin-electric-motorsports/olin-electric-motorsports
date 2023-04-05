import threading
import time
import can
import cantools
import RPi.GPIO as GPIO

BUSTYPE = "slcan"
CHANNEL = "/dev/ttyACM1"
BITRATE = 500000

# Loading in everyone's compiled config files
dbc_file = "vehicle/mkvi/mkvi.dbc"
db = cantools.database.load_file(dbc_file)

# Making variables that store incoming CAN data global
AIR_FAULT = None
AIR_STATE = None
IMD_STATUS = None
BMS_FAULT = None
BRAKE_GATE = None
THROTTLE_PRESSED = None

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

# Number of seconds the buzzer sounds
RTD_BUZZ_TIME = 2000  # in milliseconds


def init_can(channel, bustype, bitrate, callback):
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
    return can_bus, kill_flag


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
    Callback when a CAN message is received, updates appropriate vehicle
    dictionaries
    Args:
        msg (can.Message): CAN message that was received
        db (cantools.database): Database generated from our DBC
    """

    try:
        message = db.decode_message(msg.arbitration_id, msg.data)

    except Exception as _:
        return

    message_name = db.get_message_by_frame_id(msg.arbitration_id).name

    if message_name == "air_control_critical":
        AIR_FAULT = message.get("air_fault")
        AIR_STATE = message.get("air_state")
        IMD_STATUS = message.get("imd_status")
    if message_name == "bms_core":
        BMS_FAULT = message.get("bms_fault")
    if message_name == "brakes":
        BRAKE_GATE = message.get("brake_gate")
    if message_name == "throttle":
        THROTTLE_L = message.get("throttle_l_pos")
        THROTTLE_R = message.get("throttle_r_pos")
        THROTTLE_PRESSED = THROTTLE_L >= 12 or THROTTLE_R >= 12


# Initializing the dictionary that holds outgoing CAN data
dashboard_data = {}

# Enabling the start button interrupt
def button_pressed_callback():
    """
    When called, this sets the value of "start_button_state" in the outgoing
    CAN data dictionary (dashboard_data) to True
    """
    dashboard_data["start_button_state"] = True


def shutdown_callback(channel):
    """
    When called, this updates the values of "ss_bots" and "ss_estop" in the
    outgoing CAN data dictionary (dashboard_data) to False

    Args:
        channel: an integer representing a pin number corresponding to either
        the ss_bots or ss_estop pins
    """
    if channel == BOTS_SHDN_SENSE:
        dashboard_data["ss_bots"] = False
    if channel == E_STOP_SHDN_SENSE:
        dashboard_data["ss_estop"] = False


def main():
    """
    Contains the superloop intended to run every 10 milliseconds;
    Separate thread continually updates relevant variables
    `dashboard_data` is a dictionary containing all outgoing CAN data.
    """
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
    can_bus, kill_flag = init_can(CHANNEL, BUSTYPE, BITRATE, dashboard_callback)

    # Adding start button, bots shutdown, and estop shutdown interrupts
    GPIO.add_event_detect(
        RTD_BUTTON_SENSE, GPIO.BOTH, callback=button_pressed_callback, bouncetime=50
    )
    GPIO.add_event_detect(BOTS_SHDN_SENSE, GPIO.FALLING, callback=shutdown_callback)
    GPIO.add_event_detect(E_STOP_SHDN_SENSE, GPIO.FALLING, callback=shutdown_callback)

    buzzer_counter = 0  # buzzer_counter starts at 0

    dashboard = db.get_message_by_name("dashboard")

    while True:  # MAKE THIS RUN EVERY 10 MILLISECONDS
        t_0 = time.perf_counter()

        # Turns on AMS LED if there are any AMS faults
        GPIO.output(AMS_LED_LSD, BMS_FAULT != "NONE")

        # Turns on HV LED if the tractive system is on
        GPIO.output(HV_LED_LSD, AIR_STATE == "TS_ACTIVE")

        # Turns on IMD LED if there is an IMD fault; imd_status True is good
        GPIO.output(IMD_LED_LSD, not IMD_STATUS)

        # Turns on the button LED if brakes are pressed, tractive system is on,
        # RTD is not on, and the throttle is not being pressed
        if (
            BRAKE_GATE
            and AIR_STATE == "TS_ACTIVE"
            and not dashboard_data["ready_to_drive"]
            and not THROTTLE_PRESSED
        ):
            GPIO.output(RTD_BUTTON_LED, 1)  # Turn on button LED
        else:
            GPIO.output(RTD_BUTTON_LED, 0)

        # Update "ready_to_drive", turn off the button LED and start the buzzer
        # Set the counter to 0 to start off with
        if (
            AIR_STATE == "TS_ACTIVE"
            and BRAKE_GATE
            and dashboard_data["start_button_state"]
            and not THROTTLE_PRESSED
        ):
            dashboard_data["ready_to_drive"] = True
            GPIO.output(RTD_BUTTON_LED, 0)
            GPIO.output(RTD_BUZZER_LSD, 1)

        # Turn off the button LED and RTD false in dicts if tractive system not active
        # Also reset the buzzer
        if AIR_STATE != "TS_ACTIVE":
            GPIO.output(RTD_BUTTON_LED, 0)  # Turn off button LED
            dashboard_data["ready_to_drive"] = False
            buzzer_counter = 0

        # Add 10 milliseconds to the buzzing timer every loop
        if dashboard_data["ready_to_drive"] and buzzer_counter < RTD_BUZZ_TIME:
            buzzer_counter += 10

        if buzzer_counter >= RTD_BUZZ_TIME:
            GPIO.output(RTD_BUZZER_LSD, 0)

        data = dashboard.encode(dashboard_data)
        message = can.Message(arbitration_id=dashboard.frame_id, data=data)
        can_bus.send(message)  # Send out RTD status over CAN

        # Make the loop run every 10 milliseconds
        delta = time.perf_counter() - t_0
        if delta < 0.01:
            time.sleep(0.01 - delta)


# Stores code that should only run when dashboard.py is run as a script and not
# as a module
if __name__ == "__main__":
    main()
