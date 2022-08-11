import sys
from cantools.database.can import Message as CANMessage, Signal as MessageSignal, Database as DBC
from cantools.database import dump_file

import json
from yaml import dump, load

def make_query_msg(ecu_name: str, base: int) -> CANMessage:
    timestamp = MessageSignal(
        "timestamp",
        start=0,
        length=64,
        receivers=[ecu_name],
        unit="seconds"
    )

    query = CANMessage(
        frame_id = base + 0,
        name = f"btldr_{ecu_name}_query",
        length = 8,
        signals = [timestamp],
        senders = ["updatr"]
    )

    return query


def make_query_response_msg(ecu_name: str, base: int) -> CANMessage:
    bootloader_version = MessageSignal(
        "bootloader_version",
        start = 0,
        length = 8,
        receivers = ["updatr"],
    )

    chip_id = MessageSignal(
        "chip_id",
        start = 8,
        length = 8,
        receivers = ["updatr"],
        choices = {
            0: "Unknown",
            1: "ATMEGA16M1",
            2: "ATMEGA328P",
            3: "STM32F103C8T6",
        }
    )

    current_image = MessageSignal(
        "current_image",
        start = 16,
        length = 8,
        receivers = ["updatr"],
        choices = {
            0: "Application",
            1: "Updater"
        }
    )

    _reserved = MessageSignal(
        "reserved",
        start = 24,
        length = 8,
        receivers = [],
    )

    time_delta = MessageSignal(
        "time_delta",
        start = 32,
        length = 32,
        unit = "seconds",
        receivers = ["updatr"],
    )

    query_response = CANMessage(
        frame_id = base + 4,
        name = f"btldr_{ecu_name}_query_response",
        length = 8,
        signals = [bootloader_version, chip_id, current_image, _reserved, time_delta],
        senders = ["updatr"]
    )

    return query_response


def make_reset_msg(ecu_name: str, base: int) -> CANMessage:
    request = MessageSignal(
        "update_request",
        start = 0,
        length = 1,
        receivers = [ecu_name],
        choices = {
            0: "Normal operation",
            1: "Update requested"
        },
    )

    reset = CANMessage(
        frame_id = base + 1,
        name = f"btldr_{ecu_name}_reset",
        length = 1,
        signals = [request],
        senders = ["updatr"],
    )

    return reset


def make_reset_response_msg(ecu_name: str, base: int) -> CANMessage:
    status = MessageSignal(
        name = "status",
        start = 0,
        length = 8,
        receivers = ["updatr"],
        choices = {
            0: "OK",
            1: "ERROR",
        }
    )

    error_code = MessageSignal(
        name = "error_reason",
        start = 8,
        length = 8,
        receivers = ["updatr"],
    )

    reset_response = CANMessage(
        frame_id = base + 5,
        length = 2,
        name = f"btldr_{ecu_name}_reset_response",
        signals = [status, error_code],
        senders = [ecu_name],
    )

    return reset_response


def make_request_msg(ecu_name: str, base: int) -> CANMessage:
    type = MessageSignal(
        name = "type",
        start = 0,
        length = 8,
        receivers = [ecu_name],
        choices = {
            0: "Download",
            1: "Upload",
        }
    )

    image_size = MessageSignal(
        name = "image_size",
        start = 8,
        length = 16,
        receivers = [ecu_name],
    )

    request = CANMessage(
        frame_id = base + 2,
        length = 3,
        name = f"btldr_{ecu_name}_request",
        signals = [type, image_size],
        senders = ["updatr"],
    )

    return request


def make_request_response_msg(ecu_name: str, base: int) -> CANMessage:
    error_code = MessageSignal(
        name = "error_code",
        start = 0,
        length = 8,
        receivers = ["updatr"],
        choices = {
            0: "OK",
            1: "INVALID_REQUEST",
        }
    )

    last_programmed_address = MessageSignal(
        name = "last_programmed_address",
        start = 8,
        length = 16,
        receivers = ["updatr"],
    )

    remaining_size = MessageSignal(
        name = "remaining_size",
        start = 24,
        length = 16,
        receivers = ["updatr"],
    )

    request_response = CANMessage(
        frame_id = base + 6,
        length = 5,
        name = f"btldr_{ecu_name}_request_response",
        signals = [error_code, last_programmed_address, remaining_size],
        senders = [ecu_name],
    )

    return request_response


def make_data_msg(ecu_name: str, base: int) -> CANMessage:
    data = MessageSignal(
        name = "data",
        start = 0,
        length = 64,
        receivers = [ecu_name, "updatr"],
    )

    data_msg = CANMessage(
        frame_id = base + 3,
        name = f"btldr_{ecu_name}_data",
        length = 8,
        signals = [data],
        senders = ["updatr", ecu_name]
    )

    return data_msg


def make_data_response_msg(ecu_name: str, base: int) -> CANMessage:
    error_code = MessageSignal(
        name = "error_code",
        start = 0,
        length = 8,
        receivers = ["updatr"],
        choices = {
            0: "OK",
        }
    )

    last_programmed_address = MessageSignal(
        name = "last_programmed_address",
        start = 8,
        length = 16,
        receivers = ["updatr"],
    )

    remaining_size = MessageSignal(
        name = "remaining_size",
        start = 24,
        length = 16,
        receivers = ["updatr"],
    )

    data_response = CANMessage(
        frame_id = base + 7,
        length = 5,
        name = f"btldr_{ecu_name}_data_response",
        signals = [error_code, last_programmed_address, remaining_size],
        senders = [ecu_name],
    )

    return data_response


if __name__ == "__main__":
    db = DBC()

    ecus = json.loads(sys.argv[1])
    for ecu, info in ecus.items():
        base = int(info["btldr_id"], 16)

        db._messages.append(make_query_msg(ecu, base))
        db._messages.append(make_query_response_msg(ecu, base))
        db._messages.append(make_reset_msg(ecu, base))
        db._messages.append(make_reset_response_msg(ecu, base))
        db._messages.append(make_request_msg(ecu, base))
        db._messages.append(make_request_response_msg(ecu, base))
        db._messages.append(make_data_msg(ecu, base))
        db._messages.append(make_data_response_msg(ecu, base))

    dump_file(db, sys.argv[2])
