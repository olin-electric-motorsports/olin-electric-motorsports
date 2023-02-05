import cmd
import yaml


# import database


class tunables(cmd.Cmd):
    print(
        " \n This is the Tunables Parameters program. \n Type in ? to see the list of commands"
    )
    prompt = "(tunables) "
    file = None

    # Commands

    def do_get(self, arg):
        # database.send(0, arg[0])
        print(search_yaml(arg))

    def do_set(self, arg):
        print(parse(arg)[0])

        # database.send(0, arg[0], arg[1])
        write_yaml(parse(arg))
        print(search_yaml(parse(arg)[0]))

    def do_list(self, arg):
        list_yaml()


def parse(arg):
    return arg.split(" ")


def search_yaml(arg):

    """Finds information of 1 parameter"""
    with open("tunables.yml", "r") as file:
        try:
            data = yaml.safe_load(file)

            for i in range(len(data)):
                for j in range(len(data[i]["params"])):

                    message = data[i]["params"][j]

                    if message["name"] == arg:
                        return message

        except yaml.YAMLError as exc:
            print(exc)


def list_yaml():
    """Lists all parameters & their current value"""
    with open("tunables.yml", "r") as file:
        try:
            data = yaml.safe_load(file)

            for i in range(len(data)):
                for j in range(len(data[i]["params"])):

                    message = data[i]["params"][j]

                    name = message["name"]
                    current_value = message["current_value"]
                    print(f"Name: {name} Current Value: {current_value} ")

        except yaml.YAMLError as exc:
            print(exc)


def write_yaml(arg):
    """arg format is: name_of_parameter new_value"""
    with open("tunables.yml", "r") as file:
        try:
            data = yaml.safe_load(file)
            for i in range(len(data)):
                for j in range(len(data[i]["params"])):

                    message = data[i]["params"][j]

                    if message["name"] == arg[0]:
                        data[i]["params"][j]["current_value"] = arg[1]
                        break
            file.close()

            with open("tunables.yml", "w") as file:
                yaml.dump(data, file)
                file.close()

        except yaml.YAMLError as exc:
            print(exc)


if __name__ == "__main__":
    tunables().cmdloop()
