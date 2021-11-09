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

#----------- DEFAULTS and CONSTANTS -----------
VALID_PRIORITIES = ["LO", "MED", "HI"]
ENDIAN = "@0" # big
SCALE_DEFAULT = 1
OFFSET_DEFAULT = 0
UNIT_DEFAULT = "n/a"
MIN_DEFAULT = 0
MAX_DEFAULT = 0
NODE_NAME = "Vector__XXX"

# Class and function used for dumping hex values into YAML
# via https://stackoverflow.com/questions/18666816/using-python-to-dump-hexadecimals-into-yaml
class HexInt(int): pass
def representer(dumper, data):
    return yaml.ScalarNode('tag:yaml.org,2002:int', hex(data))

class YAMLCompiler:
    """
    Functionality to assign message IDs and create YAML files with both
    TX and RX messages. Also checks if the input YAML is properly formatted
    """
    def _read_yaml(self, file_path):
        """
        Read yaml into a dictionary

        :param file_path: (str) path from project root to yaml file
        :returns: (dict)
        """
        with open(PATH_TO(file_path), 'r') as yaml_file:
            data = yaml.load(yaml_file, Loader=yaml.FullLoader)
        return data

    def _save_yaml(self, file_dir, file_name, contents):
        """
        Stores dictionary as a yaml

        :param file_dir: (str) path from project root to folder to save yaml in
        :param file_name: (str) name for the yaml file
        :param contents: (dict) dictionary containing contents to store as yaml
        :returns: None
        """
        # create directory if necessary
        Path(PATH_TO(file_dir)).mkdir(parents=True, exist_ok=True)
        save_path = os.path.join(PATH_TO(file_dir), file_name)

        # add ability to dump hex values into yaml
        yaml.add_representer(HexInt, representer)
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
        Create a temporary dict with messages mapped to relative priorities

        :param yaml_path: (str) relative path to folder with source mini_yamls
        :returns: (dict) mappings of message name -> relative priority and message data
        """
        mappings = {}
        boards = {}
        #iteratively open each mini-yaml
        for filename in os.listdir(yaml_path):
            path = os.path.join(yaml_path, filename)
            mini = self._read_yaml(path)

            board_prefix = mini["chip"]
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

    def _priorities(self, msg_map, reserved_path, mode="overwrite"): #TODO mode=overwrite, append
        """
        Assign specific message IDs to each message based on reserved_ids and relative priority mappings

        :param msg_map: (dict) message name -> relative priority mappings
        :param reserved_path: (str) path from project root -> yaml with all reserved IDs
        :param mode: (str) "overwrite" to overwrite old mappings, "append" to append new IDs and preserve IDs that are already set
        :returns: (dict) updated map with specific IDs for each message
        """
        used_ids = set()
        curr_id = 1
        with open(reserved_path, 'r') as f:
            reserved = yaml.load(f, Loader=yaml.FullLoader)
        for msg_name, r_id in reserved.items():
            msg_map[msg_name]["id"] = HexInt(r_id)  #indicate value should be saved in yaml in hex format
            used_ids.add(r_id)

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
                msg_map[msg]["id"] = HexInt(curr_id)
                curr_id += 1
            return msg_map, curr_id
        # assign IDs for lo, med, hi priority messages
        for p in VALID_PRIORITIES:
            msg_map, curr_id = assign(priorities[p], msg_map, curr_id)

        #return updated msg_map
        return msg_map

    def generate_artifacts(self, yaml_path, save_to, reserved_ids, mode):
        """
        Generate new mini_yamls with specific IDs and RX messages added
        **NOTE** RX messages are not added yet

        :param yaml_path: (str) path from project root -> folder with mini yamls
        :param save_to: (str) path from project root -> folder to save generated mini yamls
        :param reserved_ids: (str) path from project root -> yaml with all reserved message IDs
        :param mode: (str) "overwrite" to overwrite old mappings, "append" to append new IDs and preserve IDs that are already set
        :returns: None
        """
        # perform checks and create mini temp yamls with IDs in copied yaml file

        # add receivers to each mini yaml
        mappings = self._get_priority_mapping(yaml_path)
        #use message ID algorithm to get message IDs
        mappings = self._priorities(mappings, reserved_ids, mode)

        #for miniyamlpath, data in dict:
        #TODO should be able to pick a list of targets or auto-detect changes.
        for filename in os.listdir(yaml_path):
            path = os.path.join(yaml_path, filename)
            mini = self._read_yaml(path)

            #add an id field to each message's yaml section
            for msg_name in mini["MessagesTX"].keys():
                mini["MessagesTX"][msg_name]["id"] = mappings[msg_name]["id"]

            #paste in receiver stuff as well
            #TODO not implemented
            mini = self._add_receivers(mini, mappings)

            self._save_yaml(save_to, f"autogen_{filename}", mini)
    

class Y2DHandler:
    """
    Functionality to generate DBC files based on YAML
    """
    def save_dbc(self, file_dir, file_name, dbc_str):
        """
        
        """
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
            #TODO receiver instead of Vector_XXX?

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
                data = yaml.load(f, Loader=yaml.FullLoader)
            dbc_str = self._dbc_msgs_generator(data["MessagesTX"], dbc_str)
            dbc_str += "\n"
        self.save_dbc(out_path, file_name, dbc_str)

    def mini_dbc(self, path, file_dir, file_name):
        """
        Build DBC for one ECU
        """
        with open(path, 'r') as f:
            data = yaml.load(f, Loader=yaml.FullLoader)
        #add ecus for one yaml
        dbc_str = self._dbc_msgs_generator(data["MessagesTX"], "")
        # dbc_str = self._dbc_msgs_generator(data["MessagesRX"], dbc_str)
        self.save_dbc(file_dir, file_name, dbc_str)


if __name__ == "__main__":
    compiler = YAMLCompiler()
    compiler.generate_artifacts('files/mini_yamls', 'out/yaml', 'files/reserved_ids.yaml', "overwrite")
    handler = Y2DHandler()
    handler.mini_dbc('out/yaml/autogen_air_ctrl.yaml', 'out/dbcs/', 'air_ctrl')
    handler.full_dbc('out/yaml', 'out/dbcs', 'mk5')