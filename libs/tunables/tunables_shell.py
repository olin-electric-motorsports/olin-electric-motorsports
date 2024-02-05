"""The python shell interface that users interact with"""

import cmd
from ast import literal_eval
import time

from can_layer import TunablesCAN
import yaml


class Tunables(cmd.Cmd):
    """A class that generates a terminal shell environment"""

    message = TunablesCAN()

    print(
        " \n This is the Tunables Parameters program."
        " \n Type in ? to see the list of commands"
    )

    ecu = input("\nWhat ECU will we be editing: ")

    prompt = "(Tunables) "
    file = None
    # Will be changed to vehicle/mkvi/software later
    ecu_yml = "vehicle/mkv/software/{}".format(ecu) + "/tunables.yml"

    # Commands
    def do_get(self, arg):
        """Getter function which sends a get message through CAN

        Args:
            arg: The user command line input. By default a string"""

        try:
            param_id = search_yaml(parse(arg)[0], "ecu_id", self.ecu_yml)[1]
            self.message.send(0, param_id, 0x6E1)
            parameter_val = search_yaml((parse(arg)[0], "current_value"))
            print(f"Parameter Current value in Yml file is {parameter_val}")
            received_msg = self.message.receive()
            received_data = [byte for byte in received_msg.data]
            print(received_data)
            # real data example I've got:
            # Timestamp: 1679611908.605059 ID: 0024 S Rx E  DL:  8  00 00 00 00 00 00 00 00
            # Channel: can0

        except yaml.YAMLError:
            print(f"Ecu_id of the {arg[0]} cannot be found")

    def do_set(self, arg):
        """A setter function that sends a set message through CAN

        Args:
            arg: The user command line input. By default a string"""

        # WIP Will write once I've tested that getter
        write_yaml(parse(arg), self.ecu_yml)
        print(search_yaml(parse(arg)[0], "current_value", self.ecu_yml))

    def do_list(self, arg):
        """lists all the names of the tunable parameters of the ECU"""
        list(self.ecu_yml)

    def do_switch(self, arg):
        """Allows us to switch what ECU tunables.yml we're looking at

        Args:
            arg: Should be a single string which is the name of the new ECU"""
        self.ecu = parse(arg)[0]
        self.ecu_yml = "vehicle/mkv/software/{}".format(self.ecu) + "/tunables.yml"


# Helper Functions
def parse(arg):
    """A quick parse function
    that splits everything into a list

    Args:
        arg: A string

    Return:
        A list of strings which
        was the arg split by whitespaces"""
    return arg.split(" ")


def search_yaml(name, value, yml):
    """Finds information from tunables.yml of 1 parameter

    Args:
        name: A string name of the parameter
        value: A string which is the specific
        part of the parameter. (i.e last updated or type or value)

    Return:
        A tuple which is the parameter's specific value
        that we're interested in or an error.
    """
    with open(yml, "r") as file:
        try:
            data = yaml.safe_load(file)

            # Literally just loops through the entire
            # tunables.yml file to find the parameter name
            message = data["params"]
            for i in range(len(message)):
                if message[i]["name"] == name:
                    param_name = message[i]["name"]
                    param_type = message[i][value]
                    return (param_name, param_type)

        except yaml.YAMLError as exc:
            print(exc)
            return exc


def list(yml):
    """Lists all tunable parameter names
    Args:

        yml: A path to the tunables.yml
    """
    with open(yml, "r") as file:
        try:
            data = yaml.safe_load(file)

            message = data["params"]
            for i in range(len(message)):
                print(message[i]["name"])

        except yaml.YAMLError as exc:
            print(exc)
            return exc


def write_yaml(arg, yml):
    """update's the tunables.yml file

    Args:
        Arg: A string list where the first index should be the
        parameter name and the second index should be the new value
        we want to overwrite the old value with.
    """
    with open(yml, "r") as file:
        try:
            data = yaml.safe_load(file)

            message = data["params"]

            for i in range(len(message)):
                if message[i]["name"] == arg[0]:
                    if message[i]["mutable"] == False:
                        raise ValueError(f" {arg[0]} cannot be edited")

                    # Else it update's the parameter's value & updates the time
                    message[i]["current_value"] = literal_eval(arg[1])
                    message[i]["last_update"] = time.time()

                    break
            file.close()

            # Overwrites tunables.yml
            with open(yml, "w") as file:
                yaml.dump(data, file, sort_keys=False)
                file.close()

        except yaml.YAMLError as exc:
            print(exc)
            return exc


if __name__ == "__main__":
    Tunables().cmdloop()
