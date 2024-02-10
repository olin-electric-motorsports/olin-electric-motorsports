import yaml
from cantools.database.can import Database as CANDatabase
import argparse

# from yaml_handler import YamlParser
from utils import get_rx_messages
from jinja2 import Environment, FileSystemLoader, select_autoescape
import os


def main():
    """
    CLI to generate C files from DBC
    """
    parser = argparse.ArgumentParser(
        description="Generate C API from a DBC",
        formatter_class=argparse.ArgumentDefaultsHelpFormatter,
    )

    parser.add_argument(
        "-o", "--output_dir", default=".", help="Output directory (default is `.`)"
    )

    parser.add_argument("-y", "--yaml", required=True, help="YAML file for the node")

    parser.add_argument("-d", "--dbc", required=True, help="Input dbc file")

    parser.add_argument("-c", "--c-file", required=True, help="Input dbc file")

    parser.add_argument("-H", "--h-file", required=True, help="Input dbc file")

    args = parser.parse_args()

    db = CANDatabase()
    db.add_dbc_file(args.dbc)

    with open(args.yaml, "r") as y:
        yaml_data = yaml.load(y, Loader=yaml.FullLoader)

    # Get the Node that we want
    node = db.get_node_by_name(yaml_data["name"])

    # Filter messages to get only the ones our Node sends
    tx_messages = []
    choices = []
    for message in yaml_data["publish"]:
        msg = db.get_message_by_name(message["name"])
        tx_messages.append(msg)

        if "signals" in message.keys():
            for sig in message["signals"]:
                if sig["unit"]["type"] == "enum":
                    choices.append(
                        {
                            "name": sig["name"],
                            "values": sig["unit"]["values"],
                        }
                    )
    rx_messages = None
    mobs = None
    masks = None

    if "subscribe" in yaml_data.keys():
        rx_messages, mobs, masks = get_rx_messages(yaml_data["subscribe"], db.messages)

        for msg in rx_messages:
            for sig in msg.signals:
                if sig.choices:
                    if len(sig.choices) > 2:
                        choices.append(
                            {
                                "name": sig.name,
                                "values": list(sig.choices.values()),
                            }
                        )
    else:
        rx_messages = []
        mobs = {}

    # Create the Jinja2 environment that contains the template info
    env = Environment(
        loader=FileSystemLoader(os.path.dirname(args.c_file)),
        autoescape=select_autoescape(),
    )

    # Retrieve the templates
    c_template = env.get_template("c_file.j2")
    h_template = env.get_template("h_file.j2")

    # Output file names
    c_out = "{}/can_api.c".format(args.output_dir)
    h_out = "{}/can_api.h".format(args.output_dir)

    # Render templates and write the output to the file
    with open(c_out, "w+") as f:
        contents = c_template.render(
            node=node,
            tx_messages=tx_messages,
            rx_messages=rx_messages,
            masks=masks,
            mobs=mobs,
            header_file="can_api.h",
        )

        f.write(contents)

    with open(h_out, "w+") as f:
        contents = h_template.render(
            node=node,
            tx_messages=tx_messages,
            rx_messages=rx_messages,
            choices=choices,
        )

        f.write(contents)


if __name__ == "__main__":
    main()
