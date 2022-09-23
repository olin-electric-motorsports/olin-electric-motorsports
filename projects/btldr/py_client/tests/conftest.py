import pytest

from formula.projects.btldr.py_client.btldr_database import BtldrDatabase


@pytest.fixture()
def dbc():
    return BtldrDatabase()


@pytest.fixture()
def ecu_id():
    return 0x708
