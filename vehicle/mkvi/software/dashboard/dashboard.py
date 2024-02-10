import threading
import time
import can
import cantools
import RPi.GPIO as GPIO

BUSTYPE = "socketcan"
CHANNEL = "can0"
BITRATE = 500000

# Loading in everyone's compiled config files
dbc_file = "mkvi.dbc"
db = cantools.database.load_file(dbc_file)

# Making variables that store incoming CAN data global
air_state = None
imd_status = None
bms_fault = None
brake_gate = None
throttle_pressed = None

# Pin Definitions
BMS_LED_LSD = 36
HV_LED_LSD = 29
IMD_LED_LSD = 26
RTD_BUZZER_LSD = 32

RTD_BUTTON_SENSE = 31
BOTS_SHDN_SENSE = 18
E_STOP_SHDN_SENSE = 22

RTD_BUTTON_LED = 33
PROGRAMMING_LED_1 = 40
PROGRAMMING_LED_2 = 38
PROGRAMMING_LED_3 = 37

# Number of seconds the buzzer sounds
RTD_BUZZ_TIME = 2000  # in milliseconds

# Initializing the dictionary that holds outgoing CAN data
dashboard_data = {
    "ready_to_drive": False,
    "start_button_state": False,
    "ss_estop": False,
    "ss_bots": False,
}


def init_can(channel, bustype, bitrate, callback):
    """Initialize CAN hardware and create CAN database from DBC
    Args:
        channel: port or network interface on the
                 Raspi the CAN single is connected to
        bustype: Type of CAN interface/dongle
        bitrate: Bus speed in Kbps

    """
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
    global air_state, imd_status, bms_fault, brake_gate, throttle_pressed

    try:
        message = db.decode_message(msg.arbitration_id, msg.data)
    except Exception as _:
        return

    message_name = db.get_message_by_frame_id(msg.arbitration_id).name

    if message_name == "air_control_critical":
        air_state = message.get("air_state")
        imd_status = message.get("imd_status")
    if message_name == "bms_core":
        bms_fault = message.get("bms_fault")
    if message_name == "bspd":
        brake_gate = message.get("brake_gate") == "Brakelight ON"
    if message_name == "throttle":
        throttle_l = message.get("throttle_l_pos")
        throttle_r = message.get("throttle_r_pos")
        throttle_pressed = throttle_l >= 12 or throttle_r >= 12


# Enabling the start button interrupt
def button_pressed_callback(channel):
    """
    When called, this sets the value of "start_button_state" in the outgoing
    CAN data dictionary (dashboard_data) to True
    """
    dashboard_data["start_button_state"] = GPIO.input(RTD_BUTTON_SENSE)


def shutdown_callback(channel):
    """
    When called, this updates the values of "ss_bots" and "ss_estop" in the
    outgoing CAN data dictionary (dashboard_data) to False

    Args:
        channel: an integer representing a pin number corresponding to either
        the ss_bots or ss_estop pins
    """
    if channel == BOTS_SHDN_SENSE:
        dashboard_data["ss_bots"] = GPIO.input(BOTS_SHDN_SENSE)
    if channel == E_STOP_SHDN_SENSE:
        dashboard_data["ss_estop"] = GPIO.input(E_STOP_SHDN_SENSE)


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
        BMS_LED_LSD,
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
    GPIO.add_event_detect(BOTS_SHDN_SENSE, GPIO.RISING, callback=shutdown_callback)
    GPIO.add_event_detect(E_STOP_SHDN_SENSE, GPIO.RISING, callback=shutdown_callback)

    buzzer_counter = 0  # buzzer_counter starts at 0

    dashboard_message = db.get_message_by_name("dashboard")

    button_pressed_callback(RTD_BUTTON_SENSE)
    shutdown_callback(BOTS_SHDN_SENSE)
    shutdown_callback(E_STOP_SHDN_SENSE)

    while True:  # MAKE THIS RUN EVERY 10 MILLISECONDS
        t_0 = time.perf_counter()

        # Turns on BMS LED if there are any BMS faults
        GPIO.output(BMS_LED_LSD, bms_fault != "NONE")

        # Turns on HV LED if the tractive system is on
        GPIO.output(HV_LED_LSD, air_state == "TS_ACTIVE")

        # Turns on IMD LED if there is an IMD fault; imd_status True is good
        GPIO.output(IMD_LED_LSD, imd_status != "IMD OK")

        # Turns on the button LED if brakes are pressed, tractive system is on,
        # RTD is not on, and the throttle is not being pressed
        if (
            brake_gate
            and air_state == "TS_ACTIVE"
            and not dashboard_data["ready_to_drive"]
            and not throttle_pressed
        ):
            GPIO.output(RTD_BUTTON_LED, 1)  # Turn on button LED
        else:
            GPIO.output(RTD_BUTTON_LED, 0)

        # Update "ready_to_drive", turn off the button LED and start the buzzer
        # Set the counter to 0 to start off with
        if (
            air_state == "TS_ACTIVE"
            and brake_gate
            and dashboard_data["start_button_state"]
            and not throttle_pressed
        ):
            dashboard_data["ready_to_drive"] = True
            GPIO.output(RTD_BUTTON_LED, 0)
            GPIO.output(RTD_BUZZER_LSD, 1)

        # Turn off the button LED and RTD false in dicts if tractive system not active
        # Also reset the buzzer
        if air_state != "TS_ACTIVE":
            GPIO.output(RTD_BUTTON_LED, 0)  # Turn off button LED
            dashboard_data["ready_to_drive"] = False
            buzzer_counter = 0

        # Add 10 milliseconds to the buzzing timer every loop
        if dashboard_data["ready_to_drive"] and buzzer_counter < RTD_BUZZ_TIME:
            buzzer_counter += 10

        if buzzer_counter >= RTD_BUZZ_TIME:
            GPIO.output(RTD_BUZZER_LSD, 0)

        data = dashboard_message.encode(dashboard_data)
        message = can.Message(arbitration_id=dashboard_message.frame_id, data=data)
        can_bus.send(message)  # Send out RTD status over CAN

        # Make the loop run every 10 milliseconds
        delta = time.perf_counter() - t_0
        if delta < 0.01:
            time.sleep(0.01 - delta)


# Stores code that should only run when dashboard.py is run as a script and not
# as a module
if __name__ == "__main__":
    main()
