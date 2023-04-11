from jinja2 import Environment, FileSystemLoader
import argparse
import yaml


def main():
    """CLI that generates C files from a Yaml file."""

    parser = argparse.ArgumentParser(
        description="Generates tunable structs from Yaml file",
        formatter_class=argparse.ArgumentDefaultsHelpFormatter,
    )

    parser.add_argument(
        "-y", "--yaml", required=True, help="YAML file to generate structs"
    )

    args = parser.parse_args()


def get_params(board, yaml_file="/libs/tunables/tunables.yml"):

    """Finds information from tunables.yml parameter

    Args:
        board: a string which is the specific board
        yaml_file: string path to the yaml file.
    Return:
        A list with all the different parameters
    """
    param_list = []
    with open(yaml_file, "r") as file:
        try:
            data = yaml.safe_load(file)

            # Literally just loops through the entire
            # tunables.yml file to find the parameter name

            for board_name in range(len(data)):
                if data[board_name]["board"] == board:
                    message = data[board_name]["params"]

                    for i in range(len(message)):
                        param_name = message[i]["name"]
                        param_type = message[i]["type"]
                        # We make it in C format, (i.e uint32 throtte_min)
                        param_list.append(f"{param_type} {param_name}")

                    return param_list

        except yaml.YAMLError as exc:
            print(exc)
            return []


def struct_maker(params):
    """Makes the C structs via a jinja template

    params: a list of string parameter names
    """
    environment = Environment()
    environment = Environment(loader=FileSystemLoader("templates/"))

    template = environment.get_template("h_file.j2")

    template.render(name="World")

    content = template.render(num_tunables=len(params), t_params=params)

    return content


####MAIN Placeholder proof of concept until argparse can be implemented##########


# I'm currently running h_generator in the tunables folder.
# #If you're in a different folder, don't forget to input the entire path
paramslist = get_params("bms", "tunables.yml")

# Generates a C struct with all the parameters in the bms board
content = struct_maker(paramslist)

# Shows what we made via the jinja template.
print(content)
