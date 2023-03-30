"""The python shell interface that users interact with"""

import cmd
from ast import literal_eval
from datetime import date
import can_layer as CAN_layer
import yaml


class Tunables(cmd.Cmd):
    """A class that generates a terminal shell environment"""

    message = CAN_layer.TunablesCAN()

    print(
        " \n This is the Tunables Parameters program."
        " \n Type in ? to see the list of commands"
    )
    prompt = "(Tunables) "
    file = None

    # Commands

    # Getter Function
    def do_get(self, arg):
        """Getter function which sends a get message through CAN

        Args:
            arg: The user command line input. By default a string"""

        param_id = get_id(parse(arg)[0])

        if param_id == -1:
            print(f"Ecu_id of the {arg[0]} cannot be found")
        else:

            self.message.send(0, param_id, 0x6E1)
            parameter_val = search_yaml(arg, "current_value")
            print(f"Parameter Current value in Yml file is {parameter_val}")

            received_msg = self.message.receive()

            received_data = [byte for byte in received_msg.data]
            print(received_data)
            # real data:
            # Timestamp: 1679611908.605059 ID: 0024 S Rx E  DL:  8  00 00 00 00 00 00 00 00
            # Channel: can0

    # Setter Function
    def do_set(self, arg):
        """A setter function that sends a set message through CAN

        Args:
            arg: The user command line input. By default a string"""

        # database.send(0, arg[0], arg[1])
        write_yaml(parse(arg))
        print(search_yaml(parse(arg)[0]))

    # Lists all messages in the Yaml File only
    def do_list(self):
        """Lists all the parameters in tunables.yml file"""
        list_yaml()


def parse(arg):
    """A quick parse function
    that splits everything into a list

    Args:
        arg: A string

    Return:
        A list of strings which
        was the arg split by whitespaces"""
    return arg.split(" ")


def search_yaml(para_name, para_value):

    """Finds information from tunables.yml of 1 parameter

    Args:
        para_name: A string name of the parameter
        para_value: A string which is the specific
        part of the parameter.

    Return:
        A string which is the parameter's specific value
        that we're interested in or a string which shows an error.
    """

    with open("libs/tunables/tunables.yml", "r") as file:
        try:
            data = yaml.safe_load(file)

            # Literally just loops through the entire
            # tunables.yml file to find the parameter name
            for i in range(len(data)):
                for j in range(len(data[i]["params"])):

                    message = data[i]["params"][j]

                    if message["name"] == para_name:

                        return message[para_value]

        except yaml.YAMLError as exc:
            print(exc)
            return "Yaml Error"


def list_yaml():
    """Lists all parameters in tunables.yml file
    alongside all their current values"""
    with open("libs/tunables/tunables.yml", "r") as file:
        try:
            data = yaml.safe_load(file)

            # Loops through tunables.yml and prints out
            # metadata of the parameter
            for i in range(len(data)):
                for j in range(len(data[i]["params"])):

                    message = data[i]["params"][j]

                    name = message["name"]
                    current_value = message["current_value"]
                    date_modified = message["date_modified"]

                    editable = message["mutable"]
                    print(
                        f"Name: {name}, Current Value: {current_value}, Last Date Edited: {date_modified}, Mutable: {editable}"
                    )

        except yaml.YAMLError as exc:
            print(exc)


def get_id(para_name):
    """Returns the ecu_id of a tunable parameter

    Args:
        para_name: A string parameter name

    Return:
        an int/hex value which is the ecu_id, or -1
        for error instances"""
    with open("libs/tunables/tunables.yml", "r") as file:
        try:
            data = yaml.safe_load(file)

            # Loops through tunables.yml and prints out
            # metadata of the parameter
            for i in range(len(data)):
                for j in range(len(data[i]["params"])):

                    message = data[i]["params"][j]

                    if message["name"] == para_name:
                        ecu_id = message["ecu_id"]
                        return int(ecu_id)

        except yaml.YAMLError as exc:
            print(exc)
            return -1


def write_yaml(arg):
    """update's the tunables.yml file

    Args:
        Arg: A string list where the first index should be the
        parameter name and the second index should be the new value
        we want to overwrite the old value with.
    """
    with open("libs/tunables/tunables.yml", "r") as file:
        try:
            data = yaml.safe_load(file)
            for i in range(len(data)):
                for j in range(len(data[i]["params"])):

                    message = data[i]["params"][j]

                    # Checks if the parameter can be written over
                    if message["name"] == arg[0]:
                        if message["mutable"] == False:
                            print(f" {arg[0]} cannot be edited")
                            break

                        # Else it update's the parameter's value & updates the time
                        data[i]["params"][j]["current_value"] = literal_eval(arg[1])
                        print(date.today())
                        data[i]["params"][j]["date_modified"] = date.today()

                        break
            file.close()

            # Overwrites tunables.yml
            with open("libs/tunables/tunables.yml", "w") as file:
                yaml.dump(data, file, sort_keys=False)
                file.close()

        except yaml.YAMLError as exc:
            print(exc)


if __name__ == "__main__":
    tunables().cmdloop()
