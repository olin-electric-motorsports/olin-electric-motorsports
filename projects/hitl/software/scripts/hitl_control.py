#!/usr/bin/env python
import os
import RPi.GPIO as GPIO
from enum import Enum
import time
import signal
import sys

def set_runner(new_state):
    '''Starts or stops the action runner based on the value of runner_on'''
    global runner_on
    if runner_on is not new_state:
        runner_on = new_state
        action = 'start' if new_state else 'stop'
        command = f'sudo ./svc.sh {action}'
        os.system('cd /home/pi/actions-runner; echo %s|sudo -S %s' % (sudo_password, command))
        set_indicator_LED(new_state)

def action_runner_button_callback(channel):
    '''
    Toggles the action runner on and off
    '''
    global runner_on
    set_runner(not runner_on) # Switches the state of the action runner

def set_indicator_LED(LED_on):
    '''Sets the LED to the pattern corresponding to the action runner state'''
    GPIO.output(LED_PIN, 1 if LED_on else 0)


def signal_handler(sig, frame):
    GPIO.cleanup()
    sys.exit(0)
if __name__ == '__main__':
    sudo_password = 'formula' 
    runner_on = False # default to false since action runner is off when script is ran for the first time
    TOGGLE_PIN = 16 # GPIO pin on the raspberry pi for the toggle button
    LED_PIN = 12 # GPIO pin on the raspberry pi for the indicator LED
    GPIO.setmode(GPIO.BOARD)
    GPIO.setup(TOGGLE_PIN, GPIO.IN, pull_up_down=GPIO.PUD_UP)
    GPIO.setup(LED_PIN, GPIO.OUT) # Enable the LED pin
    GPIO.add_event_detect(TOGGLE_PIN, GPIO.FALLING, callback=action_runner_button_callback, bouncetime=200)
    
    signal.signal(signal.SIGINT, signal_handler)
    signal.pause()