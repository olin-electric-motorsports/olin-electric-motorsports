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
        print(*parse(arg)[1])
        # database.send(0, arg[0])

    def do_set(self, arg):
        # database.send(0, arg[0], arg[1])

        print(type(*parse(arg)[0]))

    def do_list(self, arg):
        print(search_yaml(arg))

    def do_bye(self, arg):
        print("Thank you for using tunables")
        return


def parse(arg):
    return tuple(arg.split())


# Finds all the informa
def search_yaml(arg):
    with open("olin-electric-motorsports/libs/tunables/tester.yml", "r") as file:
        try:
            data = yaml.safe_load(file)

            """
            Format: data["publish"][Index of different names of messages. test_msg1 =0, test_msg2 = 1]["different parts of the message"]

               
            """
            for i in range(len(data["publish"])):
                message = data["publish"][i]

                if message["name"] == arg:
                    return message

        except yaml.YAMLError as exc:
            print(exc)


if __name__ == "__main__":
    tunables().cmdloop()
