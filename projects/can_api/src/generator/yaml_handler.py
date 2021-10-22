from pprint import pprint
import yaml
import os
import canmatrix
import math
import string

VALID_PRIORITIES = set(["LO", "MED", "HI"])
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

#TODO add cleanup functions for temp files

class YAMLCompiler:
    def __init__(self):
        pass

    def _read_yaml(self, file_path):
        with open(file_path, 'r') as yaml_file:
            data = yaml.load(yaml_file)
        return data

    def _add_receivers(self):
        #add receivers to the temp mini-yamls
        # TODO do TX messages first
        pass

    def _get_priority_mapping(self, yaml_path):
        """Create a temporary dict with message IDs"""
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
                if not vals["priority"] in VALID_PRIORITIES:
                    raise RuntimeWarning(f"Unexpected value in priority. Expected one of {VALID_PRIORITIES.__str__()}, got {vals['priority']}")

                # check for message overlap
                if mappings.get(msg_name, False):
                    raise RuntimeWarning(f"Message Name Collision. {msg_name} is already defined in {mappings[msg_name][path]}.")
                # add mapping for ID assignment later
                mappings[msg_name] = {"priority": vals["priority"], "msg_data": vals}
        return mappings

    def _priorities(self, mappings):
        # message ID algorithm
        used_ids = set()
        current_id = 1
        # TODO: open the reserved ID file
        # TODO: apply all reserved message IDs to specific messages, and add each ID to used_ids
        priorities = {"LO": [], "MED": [], "HI": []}
        # sort all messages by priority
        for msg_name, metadata in mappings:
            if metadata.get("id", False):   # skip any messages that are pre-defined
                continue
            priorities[metadata["priority"]].append(msg_name)

        # loop through and assign message IDs
        def assign(priority_array):
            for msg in priority_array:
                max_iter = 10
                while current_id in used_ids and max_iter > 0:
                    current_id += 1
                    max_iter -= 1   #prevent the slightly possible but very unlikely case of getting stuck in this while loop forever
                if max_iter == 0:
                    raise RuntimeWarning(f"Too many iterations while trying to find an unused ID, assigning message {msg_name} to next largest available ID: {max(used_ids)}")
                    current_id = max(used_ids)
                used_ids.add(current_id)
                mappings[msg_name]["id"] = current_id
                current_id += 1
        # assign IDs for lo, med, hi priority messages
        assign(priorities["LO"])
        assign(priorities["MED"])
        assign(priorities["HI"])

        #return updated mappings
        return mappings

    def make_temp_yaml(self, yaml_path):
        # perform checks and create mini temp yamls with IDs in copied yaml file

        # add receivers to each mini yaml
        mappings = self._get_priority_mapping(yaml_path)
        #use message ID algorithm to get message IDs
        mappings = self._priorities(mappings)
        print(mappings)

        #for miniyamlpath, data in dict:
            #open miniyaml again
            #copy data into new file, adding ids as we go
            #paste in receiver stuff as well
            #add an id field to each message's yaml section
    

class Y2DHandler:
    def __init__(self):
        self.dbc = canmatrix.CanMatrix()
    
    def save_dbc(self, save_name):
        print("saving DBC...")
        canmatrix.canmatrix.formats.dumpp({"":self.dbc}, "dbcs/{save_name}.dbc")

    def add_ecu(self, data):
        #isolate name of board (transmitter)
        board_name = data["board"]
        #create dictionary of board specific data from yaml data
        board_data = dict((k, data["MessagesTX"][k]) for k in [board_name] if k in data)

        #TODO do this with MessagesRX as well

        #isolate receiver key
        rec_names = list(data.keys())[0]
        #create dictionary of reciever names
        # rec_data = dict((k, data[k]) for k in [rec_names] if k in data)

        #turns list of recievers into a string for dbc
        rec_vals = str(rec_data.values())
        rec_vals = rec_vals.replace('dict_values','')
        rec_vals = rec_vals.strip(string.punctuation)

        # Add frame
        for frame_name, frame_data in board_data.items():
            frame = canmatrix.Frame(
                name = frame_name,
                arbitration_id = int(frame_data["id"]),
                transmitters = [frame_name],
                attributes = {},
                comment = "add comment here",
                )

            # Add signals
            start_bit = 0
            for signal_name, signal_data in frame_data["signals"].items():
                sig = canmatrix.Signal(
                    name = signal_name,
                    start_bit = start_bit,
                    size = signal_data["length"],
                    is_float = False,
                    is_little_endian = False,
                    is_signed = False,
                    factor = signal_data["scale"],
                    offset = signal_data["offset"],
                    min = signal_data["min"],
                    max = signal_data["max"],
                    # receivers = [rec_vals],
                )
                start_bit += signal_data["length"]
                frame.add_signal(sig)
            frame.calc_dlc()

        print(f"Adding frame: {signal_frame_name}")
        self.dbc.add_frame(frame)

        self.dbc.add_ecu(
            canmatrix.Ecu(
                name = board_name,
                comment = "more comments can go here"
                )
        )

    def full_dbc(self, paths):
        """Build one DBC for the vehicle"""
        #open temp_yaml folder
        #add all ecus
        #save dbc
        pass

    def mini_dbc(self, path):
        #add ecus for one yaml
        #TODO check how we can also add RX stuff
        pass

    def dbcMessagesTXGenerator(messagesTX_dict, dbc_file):
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
            CAN_ID = message_dict["ID"]
            BYTE_LEN = message_dict["Data Bytes"]

            # Create dict of signals
            signals_dict = message_dict["Signals"]

            # Generate DBC message
            DBC_message = "BO_ {} {}: {} {}\n".format(CAN_ID, MESSAGE_NAME, BYTE_LEN, NODE_NAME)
            print(DBC_message)
            dbc_file.write(DBC_message)

            # Process signals
            dbcSignalGenerator(signals_dict, dbc_file)

    def dbcSignalGenerator(signals_dict, dbc_file):
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
            DBC_signal = ' SG_ {}: {}|{}{}+ ({},{}) [{}|{}] "{}" {}\n'.format(SIGNAL_NAME, BIT_START, SIG_LEN, ENDIAN, SCALE, OFFSET, MIN, MAX, UNIT, NODE_NAME)

            # Increment "BIT_START" by the length of this message. Do this after we generate the DBC signal.
            BIT_START += int(SIG_LEN)
            print(DBC_signal)

            # Write DBC signal to DBC file
            dbc_file.write(DBC_signal)


def main(yaml_filename, dbc_filename):
    # Create/open new DBC file
    DBC_file = open(dbc_filename, "w")

    yaml_dict = loadYaml(yaml_filename)
    messagesTX_dict = yaml_dict["Messages-TX"]

    # TODO are we doing anything with RX messages?
    messagesRX_dict = yaml_dict["Messages-RX"]

    dbcMessagesTXGenerator(messagesTX_dict, DBC_file)

    # Close DBC file
    DBC_file.close

if __name__ == "__main__":
    # Path('../files/dbcs').mkdir(exist_ok=True)
    compiler = YAMLCompiler()
    compiler.assignIDs('../../files/mini_yamls')
    handler = Y2DHandler()
    main()