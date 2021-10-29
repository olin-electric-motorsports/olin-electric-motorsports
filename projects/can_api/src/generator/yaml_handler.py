"""
Author: Hwei-Shin Harriman
Olin Electric Motorsports

Functionality to process mini-YAML files, autogenerate mini-YAMLS with ID assignments and RX messages definitions, and create DBCs
"""
from pprint import pprint
from pathlib import Path
import yaml
import os
import canmatrix
import math
import string
from defs import PATH_TO

VALID_PRIORITIES = ["LO", "MED", "HI"]
# DEFAULT VALUES FOR DBC MESSAGES AND SIGNALS
ENDIAN = "@0" # big
SCALE_DEFAULT = 1
OFFSET_DEFAULT = 0
UNIT_DEFAULT = "n/a"
MIN_DEFAULT = 0
MAX_DEFAULT = 0
# Acts as a counter that updates by "length" value everytime a signal is parsed
BIT_START = 0
NODE_NAME = "Vector__XXX"


class YAMLCompiler:
    """
    Functionality to assign message IDs and create YAML files with both
    TX and RX messages. Also checks if the input YAML is properly formatted
    """
    def _read_yaml(self, file_path):
        with open(PATH_TO(file_path), 'r') as yaml_file:
            data = yaml.load(yaml_file)
        return data

    def _save_yaml(self, file_dir, file_name, contents):
        Path(PATH_TO(file_dir)).mkdir(parents=True, exist_ok=True)
        save_path = os.path.join(PATH_TO(file_dir), file_name)
        with open(PATH_TO(save_path), 'w') as yaml_file:
            yaml.dump(contents, yaml_file, default_flow_style=False)

    def _add_receivers(self, mini_yaml, mappings):
        """
        Functionality TODO
        """
        #add receivers to the temp mini-yamls
        return mini_yaml

    def _get_priority_mapping(self, yaml_path):
        """
        Create a temporary dict with message s mapped to relative priorities
        """
        mappings = {}
        boards = {}
        #iteratively open each mini-yaml
        for filename in os.listdir(yaml_path):
            path = os.path.join(yaml_path, filename)
            mini = self._read_yaml(path)

            board_prefix = mini["board"]
            #check for board overlap
            if board_prefix in boards.keys():
                raise RuntimeWarning(f"Collision between board prefixes: {boards[board_prefix]} and {path}")
            boards[board_prefix] = path

            # check each msg
            for msg_name,vals in mini["MessagesTX"].items():
                # check if the message name follows the naming scheme
                if not msg_name.startswith(f"{board_prefix}_"):
                    raise RuntimeWarning(f"Improper message name format. Expected {board_prefix}_<MSGNAME> pattern, got: {msg_name}")

                # check if message priority is properly defined
                if not vals["priority"] in set(VALID_PRIORITIES):
                    raise RuntimeWarning(f"Unexpected value in priority. Expected one of {VALID_PRIORITIES.__str__()}, got {vals['priority']}")

                # check for message overlap
                if mappings.get(msg_name, False):
                    raise RuntimeWarning(f"Message Name Collision. {msg_name} is already defined in {mappings[msg_name][path]}.")
                # add mapping for ID assignment later
                mappings[msg_name] = {"priority": vals["priority"], "msg_data": vals}
        return mappings

    def _priorities(self, msg_map):
        # message ID algorithm
        used_ids = set()
        curr_id = 1
        # TODO: open the reserved ID file
        # TODO: apply all reserved message IDs to specific messages, and add each ID to used_ids
        # TODO: only reassign ig there are differences, prioritizing maintaining IDs that were already set
        priorities = {"LO": [], "MED": [], "HI": []}
        # sort all messages by priority
        for msg_name, metadata in msg_map.items():
            if metadata.get("id", False):   # skip any messages that are pre-defined
                continue
            priorities[metadata["priority"]].append(msg_name)
        # loop through and assign message IDs
        def assign(priority_array, msg_map, curr_id):
            for msg in priority_array:
                max_iter = 10
                while curr_id in used_ids and max_iter > 0:
                    curr_id += 1
                    max_iter -= 1   #prevent the slightly possible but very unlikely case of getting stuck in this while loop forever
                if max_iter == 0:
                    raise RuntimeWarning(f"Too many iterations while trying to find an unused ID, assigning message {msg_name} to next largest available ID: {max(used_ids) + 1}")
                    curr_id = max(used_ids) + 1
                used_ids.add(curr_id)
                msg_map[msg]["id"] = curr_id
                curr_id += 1
            return msg_map, curr_id
        # assign IDs for lo, med, hi priority messages
        for p in VALID_PRIORITIES:
            msg_map, curr_id = assign(priorities[p], msg_map, curr_id)

        #return updated msg_map
        return msg_map

    def generate_artifacts(self, yaml_path, save_to):
        # perform checks and create mini temp yamls with IDs in copied yaml file

        # add receivers to each mini yaml
        mappings = self._get_priority_mapping(yaml_path)
        #use message ID algorithm to get message IDs
        mappings = self._priorities(mappings)

        #for miniyamlpath, data in dict:
        #TODO should be able to pick a list of targets or auto-detect changes.
        for filename in os.listdir(yaml_path):
            path = os.path.join(yaml_path, filename)
            mini = self._read_yaml(path)

            #add an id field to each message's yaml section
            for msg_name in mini["MessagesTX"].keys():
                mini["MessagesTX"][msg_name]["id"] = mappings[msg_name]["id"]

            #paste in receiver stuff as well
            #TODO next PR
            mini = self._add_receivers(mini, mappings)

            self._save_yaml(save_to, f"autogen_{filename}", mini)
    

class Y2DHandler:
    """
    Functionality to generate DBC files based on YAML
    """
    def save_dbc(self, file_dir, file_name, dbc_str):
        Path(PATH_TO(file_dir)).mkdir(parents=True, exist_ok=True)
        save_path = os.path.join(PATH_TO(file_dir), f"{file_name}.dbc")
        with open(PATH_TO(save_path), 'w') as f:
            f.write(dbc_str)

    def _dbc_msgs_generator(self, messagesTX_dict, dbc_str):
        ''' 
        Input: 
            Dictionary with all TX messages
            DBC file to write to   
        Output: Writes DBC message and signal to DBC file 
        '''
        for message in messagesTX_dict:
            message_dict = messagesTX_dict[message]

            # parse dictionary and set variables
            MESSAGE_NAME = message
            CAN_ID = message_dict["id"]
            BYTE_LEN = message_dict["data_bytes"]

            # Create dict of signals
            signals_dict = message_dict["signals"]

            # Generate DBC message
            dbc_str += "BO_ {} {}: {} {}\n".format(CAN_ID, MESSAGE_NAME, BYTE_LEN, NODE_NAME)

            # Process signals
            dbc_str = self._dbc_sig_generator(signals_dict, dbc_str)
        return dbc_str

    def _dbc_sig_generator(self, signals_dict, dbc_str):
        '''
        Input: DBC
        '''
        BIT_START = 0
        for signal in signals_dict:
            signal_param_dict = signals_dict[signal]

            # Parse signal dict and set variables to be used to generate DBC
            SIGNAL_NAME = signal
            SIG_LEN = signal_param_dict["length"]
            SCALE = signal_param_dict.get("scale", SCALE_DEFAULT)
            OFFSET = signal_param_dict.get("offset", OFFSET_DEFAULT)
            MIN = signal_param_dict.get("min", MIN_DEFAULT)
            MAX = signal_param_dict.get("max", MAX_DEFAULT)
            UNIT = signal_param_dict.get("unit", UNIT_DEFAULT)

            # Generate DBC signal
            dbc_str += ' SG_ {}: {}|{}{}+ ({},{}) [{}|{}] "{}" {}\n'.format(SIGNAL_NAME, BIT_START, SIG_LEN, ENDIAN, SCALE, OFFSET, MIN, MAX, UNIT, NODE_NAME)

            # Increment "BIT_START" by the length of this message. Do this after we generate the DBC signal.
            BIT_START += int(SIG_LEN)
        return dbc_str

    def full_dbc(self, dir_path, out_path, file_name):
        """
        Build one DBC for the vehicle
        """
        dbc_str = ""
        for yaml_name in os.listdir(dir_path):
            print(yaml_name, dbc_str)
            with open(os.path.join(dir_path, yaml_name), 'r') as f:
                data = yaml.load(f)
            dbc_str = self._dbc_msgs_generator(data["MessagesTX"], dbc_str)
            dbc_str += "\n"
        self.save_dbc(out_path, file_name, dbc_str)

    def mini_dbc(self, path, file_dir, file_name):
        """
        Build DBC for one ECU
        """
        with open(path, 'r') as f:
            data = yaml.load(f)
        #add ecus for one yaml
        dbc_str = self._dbc_msgs_generator(data["MessagesTX"], "")
        # dbc_str = self._dbc_msgs_generator(data["MessagesRX"], dbc_str)
        self.save_dbc(file_dir, file_name, dbc_str)


if __name__ == "__main__":
    compiler = YAMLCompiler()
    compiler.generate_artifacts('files/mini_yamls', 'out/yaml')
    handler = Y2DHandler()
    handler.mini_dbc('out/yaml/autogen_air_ctrl.yaml', 'out/dbcs/', 'air_ctrl')
    handler.full_dbc('out/yaml', 'out/dbcs', 'mk5')