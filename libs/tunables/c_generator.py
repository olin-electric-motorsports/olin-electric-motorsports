from jinja2 import Environment, FileSystemLoader
import sys
import yaml
import os

# Currently running this in oem directory
template_path = "libs/tunables/templates"

hfile = "h_file.j2"
cfile = "c_file.j2"


def main():
    """CLI that generates C files from a Yaml file."""

    ecu_list = sys.argv

    # Currently this can generate the c structs for multiple boards at once.
    # The format would be: python c_generator.py ecu1 ecu2 ecu3
    for ecu in ecu_list[1:]:
        ecu_path = "vehicle/mkv/software/{}".format(ecu)
        ymlpath = ecu_path + "/tunables.yml"

        # Check that the path to the yml file is correct
        if os.path.exists(ymlpath):

            # Reads the tunables.yml file & stores all the struct variables
            paramslist = get_params(ymlpath)
            # Generates a C struct with all the parameters in the bms board
            c_content = c_maker(ecu, paramslist)
            h_content = h_maker(ecu, paramslist)

            # What we made via the jinja template.
            c_out = "{}/tunables.c".format(ecu_path)
            h_out = "{}/tunables.h".format(ecu_path)

            # Write the .c and .h files
            with open(c_out, "w+") as file:
                file.write(c_content)
                file.close()

            with open(h_out, "w+") as file:
                file.write(h_content)
                file.close()

            # Check that we wrote everything correctly
            print(f"\n ########## {ecu} tunables.c file ########## \n")
            with open(c_out, "r") as file:
                print(file.read())
                file.close()

            print(f"\n ########## {ecu} tunables.h file ########## \n")
            with open(h_out, "r") as file:
                print(file.read())
                file.close()

        else:
            # Error msg
            raise Exception(f"{OSError}: \n No file/directory at {ymlpath}")


# Helper functions
def get_params(yaml_file):
    """Finds information from tunables.yml parameter
    Args:
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

            message = data["params"]

            for i in range(len(message)):
                param_name = message[i]["name"]
                param_type = message[i]["type"]
                # We make it in C format, (i.e uint32 throtte_min)
                param_list.append(f"{param_type} {param_name}")

            return param_list

        except yaml.YAMLError as exc:
            print(exc)
            return []


def h_maker(name, params):
    """Makes the header file via a jinja template

    name: a string of the ecu name
    """
    environment = Environment()
    environment = Environment(loader=FileSystemLoader(template_path))
    template = environment.get_template(hfile)
    template.render(name="World")
    content = template.render(name=name, t_params=params)
    return content


def c_maker(name, params):
    """Makes the C structs via a jinja template
    Args:
        name: A string of the ecu
        params: a list of string parameter names
    """
    environment = Environment()
    environment = Environment(loader=FileSystemLoader(template_path))
    template = environment.get_template(cfile)
    template.render(name="World")
    content = template.render(name=name, t_params=params)

    return content


# main
if __name__ == "__main__":
    main()
