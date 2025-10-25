#!/bin/bash

#use this if you're running the script yourself
#dir="$(pwd)/can_logs/"

#cron script run
dir="//home/Olin-Electric-Motorsports/can_logs/"

# Serial Port Config
SERIAL_PORT="/dev/ttyACM0"
BAUD_RATE="9600"

# CAN Bus Config
BUSTYPE="socketcan"
CHANNEL="can0"
BITRATE="500000"

# find the current maximum value
current_max=$( 
    find "$dir" -name mk7_\*.log -print0 \
    | sort -z -V \
    | tail -z -n 1
)
if [[ ! $current_max =~ _([0-9]+)\.log ]]; then
    counter="0"
else 
    # increment it
    counter=$(( 1 + ${BASH_REMATCH[1]} ))
fi

echo ${dir}

# Initialize CAN Bus
sudo ip link set $CHANNEL type can bitrate $BITRATE
sudo ip link set $CHANNEL up

# Create File and Save CAN Data
touch ${dir}mk7_${counter}.log
/usr/bin/python -m can.logger -f ${dir}mk7_${counter}.log -c can0 -b 500000 -i socketcan


# Read CAN messages and send to serial port
candump can0 | while read -r can_message; do 
    if [ -n "$can_message" ]; then
        if  echo -e $can_message >> /dev/ttyACM0 ; then
            echo "Success"
        else
            echo "Fail"
        fi
    fi
done
