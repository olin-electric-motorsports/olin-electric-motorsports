import os
import time
import RPi.GPIO as GPIO

def get_action_runner_toggle():
    '''
    Returns the current state of the hardware toggle to switch the action runner on/off.
    '''
    # TODO read toggle from GPIO?
    return False


def set_indicator_LED(LED_on):
    '''Sets the LED to the pattern corresponding to the action runner state'''
    # TODO set LED state
    pass
sudo_password = 'mypass' # not a good way of doing
SLEEP_TIME = 5 # Seconds
runner_on = False
prev_state = False
command = ''
while True:
    action_runner_toggle = get_action_runner_toggle()
    if action_runner_toggle and not runner_on:
        command = 'sudo ./svc.sh start'
        runner_on = True
    elif not action_runner_toggle and runner_on:
        command = 'sudo ./svc.sh stop'
        runner_on = False
    if runner_on != prev_state:
        os.system('echo %s|sudo -S %s' % (sudo_password, command))
        prev_state = runner_on
    set_indicator_LED(runner_on)
    time.sleep(SLEEP_TIME)