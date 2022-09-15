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
    return 0x708


@pytest.fixture()
def canbus():
    canbus = CANBus(interface="socketcan", bitrate=500000, channel="can0")
    yield canbus


def test_ping_hw(canbus, ecu_id):
    client = BtldrManager()
    client.canbus = canbus

    response = client.ping(ecu_id, 1)
    check.is_not_none(response)


def test_flash(canbus, ecu_id):
    client = BtldrManager()
    client.canbus = canbus

    response = client.flash(ecu_id, "projects/btldr/py_client/tests/bms_patched.bin", 1)
    check.is_not_none(response)
