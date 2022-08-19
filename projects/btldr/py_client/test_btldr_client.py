import pytest
import pytest_check as check
from unittest.mock import patch

from can import Message as CANMessage
from can.interface import Bus as CANBus

from formula.projects.btldr.py_client.btldr import BtldrManager
from formula.projects.btldr.py_client.btldr_database import BtldrDatabase


@pytest.fixture()
def dbc():
    return BtldrDatabase()


@pytest.fixture()
def ecu_id():
    return 0x700


@pytest.fixture()
def ping_resp(ecu_id, dbc):
    _ping_response = dbc.get_message_by_name("btldr_query_response")

    msg = CANMessage(
        arbitration_id = ecu_id + _ping_response.frame_id,
        data = _ping_response.encode({
            "bootloader_version": 0b00000001,
            "chip_id": 1,
            "current_image": 0,
            "reserved": 0,
            "time_delta": 5000,
        }),
    )

    return msg


def test_ping_failure(ecu_id):
    client = BtldrManager(bustype="virtual", source="vcan0")

    # No ping response
    success, response = client.ping(ecu_id, 1)
    check.is_false(success)


def test_ping_success(ecu_id, ping_resp):
    client = BtldrManager(bustype="virtual", source="vcan0")

    with patch.object(client.canbus, 'recv', return_value=ping_resp) as mock_recv:
        success, response = client.ping(ecu_id, 1)
        check.is_true(success)

    check.is_true(mock_recv.called)
