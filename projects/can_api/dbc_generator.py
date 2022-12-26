import argparse
from cantools.database.can import Database as CANDatabase, Node
from cantools.database import dump_file
from yaml_handler import YamlParser

__version__ = "2021.12.28"


def main():
    """
    CLI to generate a DBC file from YAML files
    """
    parser = argparse.ArgumentParser(
        description="Generate DBC from YAML and DBC files",
        formatter_class=argparse.ArgumentDefaultsHelpFormatter,
    )

    parser.add_argument(
        "-o", "--output", default="out.dbc", help="Output filename (default is out.dbc)"
    )

    parser.add_argument(
        "inputs",
        help="Input YAML and DBC files",
        nargs="+",
    )

    args = parser.parse_args()

    db = CANDatabase(
        strict=True,
        version=__version__,
    )

    # Add in extra DBC files
    for dbc in filter(lambda s: s.endswith((".dbc")), args.inputs):
        db.add_dbc_file(dbc)

    for yml in filter(lambda s: s.endswith((".yaml", ".yml")), args.inputs):
        parser = YamlParser(yml)

        db._messages += parser.messages
        db._nodes.append(Node(parser.name))

    dump_file(db, args.output)


if __name__ == "__main__":
    main()
