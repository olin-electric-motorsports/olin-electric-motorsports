import pytest
from cantools.database.can import Database as DBC
from cantools.database import load_file

@pytest.fixture
def dbc_file() -> str:
    return "projects/btldr/tools/updatr.dbc"


@pytest.fixture
def dbc() -> DBC:
    return load_file("projects/btldr/tools/updatr.dbc")
