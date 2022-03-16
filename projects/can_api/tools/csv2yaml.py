"""Converter indented for converting old CSV format to the new yaml format."""
# Base Python
from argparse import ArgumentParser
from csv import reader
from dataclasses import dataclass, field
from tracemalloc import start
from dataclasses_json import config, dataclass_json, LetterCase
from enum import Enum
from oyaml import dump
from pathlib import Path
from typing import Dict, List
from schema import Schema


import yaml


class HexInt(int):
    pass


def representer(dumper, data):
    return yaml.ScalarNode("tag:yaml.org,2002:int", hex(data))


class SignalType(Enum):
    UINT16 = "uint16_t"
    BOOL = "bool"
    # Add as needed


@dataclass_json
@dataclass
class CANSignalUnit:
    name: str
    sig_type: SignalType = field(
        metadata=config(field_name="type", encoder=(lambda x: x.value))
    )
    offset: float
    scale: float


@dataclass_json
@dataclass
class CANSignal:
    name: str = field(metadata=config(letter_case=LetterCase.SNAKE))
    sig_slice: str = field(metadata=config(field_name="slice"))
    unit: CANSignalUnit


@dataclass_json
@dataclass
class CANMessage:
    name: str
    message_id: HexInt = field(metadata=config(field_name="id"))
    freq_hz: int
    signals: List[CANSignal]


def standardize_str(string: str) -> str:
    """Standardie string. Remove spaces and other non-alphanumeric chars"""
    return string.strip().replace(" ", "_").lower()


def decode_signals(signal_data: List[str], message_length_bytes: int) -> CANSignal:
    """Convert signal row data from csv to Object."""
    signals = []
    message_count = 1
    for i, name in enumerate(reversed(signal_data[0:message_length_bytes])):
        if name:
            start_bit = (message_length_bytes - i - 1) * 8
            signals.append(
                CANSignal(
                    name=standardize_str(name),
                    sig_slice=f"{start_bit} + {message_count *8}",
                    # Obv this is wrong, but ok for now cause making assupmtions of data all being same type
                    unit=CANSignalUnit(
                        name="temp",
                        sig_type=SignalType.UINT16,
                        scale=1,
                        offset=0,
                    ),
                )
            )
            # Reset for next message
            message_count = 1
        else:
            message_count += 1
    return signals


def convert_csv_to_yaml(csv_path: Path, start_row=0, end_row=-1) -> Dict:
    # schema = Schema()
    messages = []
    with open(csv_path, newline="") as csv_file:
        data = list(reader(csv_file))[start_row:end_row]
        for line in data:
            messages.append(
                CANMessage(
                    message_id=HexInt(line[0], 16),
                    name=standardize_str(line[4]),
                    freq_hz=int(line[2]),
                    signals=decode_signals(line[6:14], int(line[3])),
                ).to_dict()
            )
    return messages


def main():
    """Command line utility for csv2yaml.

    Sample Command: python projects/can_api/tools/csv2yaml.py --csv_path ./projects/can_api/tools/test_csv/mkv_address_space.csv --start_row 75 --end_row 110
    """
    parser = ArgumentParser(description="Parameters for CSV Address space parsing")
    parser.add_argument(
        "--csv_path", type=Path, action="store", help="Path to csv file"
    )
    parser.add_argument(
        "--start_row",
        type=int,
        action="store",
        default=0,
        required=False,
        help="Row to start decoding csv",
    )
    parser.add_argument(
        "--end_row",
        type=int,
        action="store",
        default=None,
        required=False,
        help="Row to stop decoding csv",
    )
    parser.add_argument(
        "--output_dir",
        type=Path,
        action="store",
        default="./",
        required=False,
        help="Directory to output yaml file",
    )

    args = parser.parse_args()
    messages = convert_csv_to_yaml(args.csv_path, args.start_row, args.end_row)
    yaml.add_representer(HexInt, representer)
    output_yaml = args.output_dir / "out.yaml"
    with open(output_yaml, "w+") as file:
        dump(messages, file)


if __name__ == "__main__":
    main()
