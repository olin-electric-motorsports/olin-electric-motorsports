# UART Shell

## Overview
A more robust shell script for the ATmega 16m1 platform that allows for interactive gpio usage. The shell can be used to set gpio pin modes to input and output, as well as set pins high, set pins low, and toggle pins. 

## Commands
The command "ping" will return pong. The gpio commands must be in the form "gpio B 0 set" where the first word is "gpio", the second and third word define the pin, and anything after that is the command.

Possible gpio commands:
    set: Set a pin high
    clear: Set a pin low
    toggle: Toggle a pin
    mode output: Set a pin mode to output
    mode input: Set a pin mode to input