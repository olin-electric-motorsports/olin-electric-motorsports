import yaml
from cantools.database.can import (
    Message as CANMessage,
    Signal as MessageSignal,
    Database as CANDatabase
)
import argparse
from yaml_handler import YamlParser
from jinja2 import Environment, FileSystemLoader, select_autoescape
import os

def main():
    """
    CLI to generate C files from DBC
    """
    parser = argparse.ArgumentParser(
        description = "Generate C API from a DBC",
        formatter_class=argparse.ArgumentDefaultsHelpFormatter,
    )

    parser.add_argument(
        '-o', '--output_dir',
        default='.',
        help='Output directory (default is `.`)'
    )

    parser.add_argument(
        '-n', '--node',
        required=True,
        help='Node to generate code for'
    )

    parser.add_argument(
        '-d', '--dbc',
        required=True,
        help='Input dbc file',
    )

    parser.add_argument(
        '-c', '--c-file',
        required=True,
        help='Input dbc file',
    )

    parser.add_argument(
        '-H', '--h-file',
        required=True,
        help='Input dbc file',
    )

    args = parser.parse_args()

    db = CANDatabase()
    db.add_dbc_file(args.dbc)

    # Get the Node that we want
    node = db.get_node_by_name(args.node)

    # Filter messages to get only the ones our Node sends
    tx_messages = list(filter(lambda m: node.name in m.senders,db.messages))

    env = Environment(
        loader=FileSystemLoader(os.path.dirname(args.c_file)),
        autoescape=select_autoescape()
    )

    c_template = env.get_template("c_file.j2")
    h_template = env.get_template("h_file.j2")

    c_out = "{}/{}_can_api.c".format(args.output_dir, args.node)
    h_out = "{}/{}_can_api.h".format(args.output_dir, args.node)

    with open(c_out, 'w+') as f:
        contents = c_template.render(
            node = args.node,
            tx_messages=tx_messages,
            header_file='"' + args.node + '_can_api.h"',
        )

        f.write(contents)

    with open(h_out, 'w+') as f:
        contents = h_template.render(
            node = args.node,
            tx_messages=tx_messages
        )

        f.write(contents)

    # TODO get rx_messages

if __name__ == "__main__":
    main()
