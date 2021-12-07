import os
import RPi.GPIO as GPIO
from enum import Enum

sudo_password = 'formula' 
runner_on = False # default to false since action runner is off when script is ran for the first time
TOGGLE_PIN = 1 # GPIO pin on the raspberry pi for the toggle button
LED_PIN = 2 # GPIO pin on the raspberry pi for the indicator LED
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
    set_runner(not runner_on) # Switches the state of the action runner

def set_indicator_LED(LED_on):
    '''Sets the LED to the pattern corresponding to the action runner state'''
    GPIO.output(LED_PIN, 1 if LED_on else 0)


GPIO.setup(LED_PIN, GPIO.OUT) # Enable the LED pin
GPIO.add_interrupt_callback(TOGGLE_PIN, action_runner_button_callback, edge='rising', debounce_timeout_ms=100) # Sets the toggle button to call action_runner_button_callback() on press