import pandas as pd
from pprint import pprint
#import yaml
from collections import OrderedDict
import oyaml as yaml
import re


data = pd.read_csv("./address_space.csv")

# print(data.head())
# lets start by just extracting the info thats therews
output = {}
for index, row in data.iterrows():
    if index > 16 or index < 11:
        continue
    row_out = {}
    row_out["can_id"] = row["CAN ID"].strip()
    row_out["dec"] = row["(dec)"]

    row_out['freq'] = row['Frequency (Hz)']
    row_out['len'] = row['Message Length']
    row_out['purpose'] = row['Purpose'].strip()

    signal_names = []
    for i in range(8):
        value = row[f'Byte {i}']
        if isinstance(value, str):
            value.lower().replace(" ", "_")
            # name = re.sub(r'(?<!/^)(?=[A-Z])', '_', value).lower()
            signal_names.append(value)

    row_out['signal_names'] = signal_names

    sending_board = row["Sending Board"].lower().replace(" ", "_").replace("/", "_")

    row_out["sending_board"] = sending_board
    #print(sending_board)

    output[hex(int(row_out["dec"]))] = row_out


    message = {}
    message["id"] = row_out["dec"]
    message['data_bytes'] = row_out["len"]
    message['signals'] = {}

    for name in row_out['signal_names']:
        name = name.replace('\n', '').replace('\r', '').lower().replace(" ", "_")
        signal = {}
        signal["length"] = 8
        signal["scale"] = 1
        signal["offset"] = 0
        signal["min"] = 0
        signal["max"] = 1
        signal["unit"] = "bit"

        message['signals'][name] = signal

    yaml_out = {
        "MessagesTX": {
            row_out["sending_board"]: message


        }
    }
    #print(yaml_out)

    with open(f'./mini_yamls/{row_out["sending_board"]}.yaml', 'w+') as file:
        # yaml.indent(mapping=4)
        yaml.dump(yaml_out, file)

    # yaml.dump(yaml_out)
