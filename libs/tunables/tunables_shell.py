"""The python shell interface that users interact with"""

import cmd
import yaml
from ast import literal_eval
from datetime import date
import CAN_layer


class tunables(cmd.Cmd):

    message = CAN_layer.TunablesCAN()

    print(
        " \n This is the Tunables Parameters program. \n Type in ? to see the list of commands"
    )
    prompt = "(tunables) "
    file = None

    # Commands

    # Getter Function
    def do_get(self, arg):

        param_id = get_id(parse(arg)[0])

        if param_id == -1:
            print(f"Ecu_id of the {arg[0]} cannot be found")
        else:

            self.message.send(0, param_id)
            parameter_val = search_yaml(arg, "current_value")
            print(f"Parameter Current value in Yml file is {parameter_val}")

            received_msg = self.message.receive()

            received_data = [byte for byte in received_msg.data]
            print(received_data)
            # real data: Timestamp: 1679611908.605059        ID: 0024    S Rx E        DL:  8    00 00 00 00 00 00 00 00     Channel: can0

    # Setter Function
    def do_set(self, arg):

        # database.send(0, arg[0], arg[1])
        write_yaml(parse(arg))
        print(search_yaml(parse(arg)[0]))

    # Lists all messages in the Yaml File only
    def do_list(self, arg):
        list_yaml()


def parse(arg):
    return arg.split(" ")


def search_yaml(arg, parameter):

    """Finds information of 1 parameter"""

    with open("libs/tunables/tunables.yml", "r") as file:
        try:
            data = yaml.safe_load(file)

            # Literally just loops through the entire
            # tunables.yml file to find the parameter name
            for i in range(len(data)):
                for j in range(len(data[i]["params"])):

                    message = data[i]["params"][j]

                    if message["name"] == arg:

                        return message[parameter]

        except yaml.YAMLError as exc:
            print(exc)
            return -1


def list_yaml():
    """Lists all parameters & their current value"""
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
            return -1


def get_id(arg):
    """Returns the ecu_id of a tunable parameter"""
    with open("libs/tunables/tunables.yml", "r") as file:
        try:
            data = yaml.safe_load(file)

            # Loops through tunables.yml and prints out
            # metadata of the parameter
            for i in range(len(data)):
                for j in range(len(data[i]["params"])):

                    message = data[i]["params"][j]

                    if message["name"] == arg:
                        ecu_id = message["ecu_id"]
                        return int(ecu_id)

        except yaml.YAMLError as exc:
            print(exc)
            return -1


def write_yaml(arg):
    """update's the tunables.yml file"""
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
            return -1


if __name__ == "__main__":
    tunables().cmdloop()
