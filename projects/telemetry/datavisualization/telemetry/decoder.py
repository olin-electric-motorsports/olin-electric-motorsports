"""
Entrypoint app file

Objective: use cantools to decrypt bits coming in from the USB. 

Args:
    takes in dbc file and CAN bytes
    

Returns:
    Python objects // data in a way that python can use (dictionaries, classes, etc. feedable into redis)
    In other words, the data that we want to display. 
"""


import csv
import cantools
import json
import serial
from redis import Redis
from redistimeseries.client import Client
import yaml

# run decode_live if collecting data while the car is running. 
def decode_live(dbc):

    # We're going to repeatedly look for messages forever, cancel with keycommand.
    while True:
        serial_instance = serial.Serial('/dev/ttyUSB0', 57600)
        data = serial_instance.read_until(size=8)
        next_message = data

        next_can_msg = []

        # split up the string of binary into a can msg
        for index in range(0, 8, 1):
            bin_msg = next_message[index: index + 1]

            # endians :P
            dec_msg = int.from_bytes(bin_msg, "big")
            next_can_msg.append(dec_msg)

        # gets db file used to decode messages
        db = cantools.database.load_file(dbc)

        print(next_can_msg)

        if len(next_can_msg) == 0:
            print("No message")
            raise ValueError

        # removes id and assigns it to can_id
        can_id = next_can_msg.pop(0)
        
        # decodes the message using the dbc
        decoded_signals = db.decode_message(can_id, next_can_msg)
        # gets all the information about the signal like name, length ect
        x = db.get_message_by_frame_id(can_id)
        
        decoded_dict = {
            'id': can_id,
            'name': x.name,
            'length': x.length,
            'signals': decoded_signals}
        
        # overwrites one file with the next message
        with open("data/nextmessage.txt", "w") as msgf:
            msgf.write(f"{decoded_dict}\n")

        # logs all messages to another file.
        with open("data/logfile.txt", "a") as logf:
            logf.write(f"{decoded_dict}\n")

        print(decoded_dict)

def decode_csv(dbc, can_csv):
    # gets db file used to decode messages
    db = cantools.database.load_file(dbc)
    final_list = []  # initializes list that will contain the data in the right format
    decoded_file = open("data/decoded_can.txt", "w")
    i = 0

    with open(r'{}'.format(can_csv), newline='') as can:  # opens csv file that needs to be decoded
        csv_file = csv.reader(can, delimiter=' ')  # reads csv file
        for row in csv_file:  # for each row in the csv file
            for string in row:  # for each value in the row divide it up based on commas to separate the values that we need
                temp_list = string.split(',')
                # filters out empty values
                temp_list = list(filter(None, temp_list))
                int_list = []  # list with each value as an int
                for value in temp_list:  # converts each value from str to int
                    x = int(value)
                    int_list.append(x)
                final_list.append(int_list)

    for data in final_list:  # takes each list inside this list
        i += 1
        # removes id and assigns it to can_id
        can_id = data.pop(0)

        # decodes the message using the dbc
        decoded = db.decode_message(can_id, data)

        # gets all the information about the signal like name, length etc
        x = db.get_message_by_frame_id(can_id)

        decoded_dict = {
            "id": can_id,
            "name": x.name,
            "length": x.length,
            "signals": decoded}

        # Use double quotes instead of python dictionary single quotes
        dict = json.dumps(decoded_dict)
        decoded_file.write(str(dict) + '\n')


if __name__ == "__main__":
    decode_csv("data/dash.dbc", "data/can5.csv")
    # decode_live("data/dash.dbc")
