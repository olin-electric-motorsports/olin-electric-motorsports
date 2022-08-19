import pytest
import pytest_check as check
from unittest.mock import patch

from can import Message as CANMessage
from can.interface import Bus as CANBus

from formula.projects.btldr.py_client.btldr import BtldrManager


def fake_ping_resp(db):
    _ping_response = db.get_message_by_name("btldr_air_control_query_response")

    msg = CANMessage(
        arbitration_id = _ping_response.frame_id,
        data = _ping_response.encode({
            "bootloader_version": 0b00000001,
            "chip_id": 1,
            "current_image": 0,
            "reserved": 0,
            "time_delta": 5000,
        }),
    )

    return msg


def test_ping_failure(dbc_file):
    client = BtldrManager(bustype="virtual", source="vcan0")

    # No ping response
    success, response = client.ping(0x0700, 1)
    check.is_false(success)


def test_ping_success(dbc_file):
    client = BtldrManager(bustype="virtual", source="vcan0")

    with patch.object(client.canbus, 'recv', return_value=fake_ping_resp(client.db)) as mock_recv:
        success, response = client.ping(0x0700, 1)
        check.is_true(success)

    check.is_true(mock_recv.called)
