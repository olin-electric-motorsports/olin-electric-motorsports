import os
import RPi.GPIO as GPIO
import asyncio
from enum import Enum

sudo_password = 'mypass' # not a good way of doing
runner_on = False # default to false since action runner is off when script is ran for the first time
TOGGLE_PIN = 1
LED_PIN = 2
def set_runner(new_state):
    '''Starts or stops the action runner based on the value of runner_on'''
    global runner_on
    if runner_on is not new_state:
        runner_on = new_state
        action = 'start' if new_state else 'stop'
        command = f'sudo ./svc.sh {action}'
        os.system('echo %s|sudo -S %s' % (sudo_password, command))
        set_indicator_LED(new_state)

def action_runner_button_callback():
    '''
    Toggles the action runner on and off
    '''
    global runner_on
    set_runner(not runner_on)

def set_indicator_LED(LED_on):
    '''Sets the LED to the pattern corresponding to the action runner state'''
    GPIO.output(LED_PIN, LED_on)

async def manual_connection_checker():
    '''Checks if a direct or ssh connection is found'''
    await asyncio.sleep(1000)
    if os.system('w'):
        os.environ["MANUAL"] = True
        set_runner(False)
    else:
        del os.environ["MANUAL"]
        if os.system('ss | grep ssh'):
            set_runner(False)
        else:
            set_runner(True)


GPIO.setup(LED_PIN, GPIO.OUT)
GPIO.add_interrupt_callback(TOGGLE_PIN, action_runner_button_callback, edge='rising', debounce_timeout_ms=100)
loop = asyncio.get_event_loop()
loop.run_forever(manual_connection_checker)