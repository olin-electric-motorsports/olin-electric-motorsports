"""
One-time throwaway code to convert our current can_api .h file
"""
# Base Python
from typing import Dict, Union
import json

# Constants


def parse_line(file_line: str, output: Dict[str, Dict[str, Union[str, int]]]):
    file_line_split = file_line.split()
    if file_line_split and file_line_split[0] == "#define":
        # Handle CAN message IDs
        if file_line_split[1].startswith("CAN_ID_"):
            name = file_line_split[1].replace("CAN_ID_", "")
            output[name] = {}
            output[name]["id"] = file_line_split[3].strip("()")
        # Handle CAN message lengths
        if file_line_split[1].startswith("CAN_LEN_"):
            name = file_line_split[1].replace("CAN_LEN_", "")
            output[name]["len"] = int(file_line_split[3].strip("()"))


if __name__ == "__main__":
    output_dictionary = {}
    with open("../../MKV-Code/lib/can_api.h", "r") as file:
        for line in file:
            parse_line(line, output_dictionary)

    with open("output.json", "w+") as file:
        json_out = json.dumps(output_dictionary)
        file.write(json_out)