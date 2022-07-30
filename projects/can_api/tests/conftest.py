import pytest
import yaml
from cantools.database.can import Database as CANDatabase, Node
from ..yaml_handler import YamlParser

@pytest.fixture
def tx_file():
    return "projects/can_api/tests/tx_only.yml"

@pytest.fixture
def rx_file():
    return "projects/can_api/tests/rx_only.yml"

@pytest.fixture
def rx_fail_file():
    return "projects/can_api/tests/rx_fail.yml"

@pytest.fixture
def rx_mask_file():
    return "projects/can_api/tests/rx_mask.yml"

@pytest.fixture
def tx_parser(tx_file):
    return YamlParser(tx_file)

@pytest.fixture
def rx_parser(rx_file):
    return YamlParser(rx_file)

@pytest.fixture
def tx_yaml(tx_file):
    with open(tx_file) as f:
        data = yaml.load(f, Loader=yaml.FullLoader)
        yield data

@pytest.fixture
def rx_yaml(rx_file):
    with open(rx_file) as f:
        data = yaml.load(f, Loader=yaml.FullLoader)
        yield data

@pytest.fixture
def rx_fail_yaml(rx_fail_file):
    with open(rx_fail_file) as f:
        data = yaml.load(f, Loader=yaml.FullLoader)
        yield data

@pytest.fixture
def rx_mask_yaml(rx_mask_file):
    with open(rx_mask_file) as f:
        data = yaml.load(f, Loader=yaml.FullLoader)
        yield data

@pytest.fixture
def db(tx_parser, rx_parser):
    db = CANDatabase()
    db._messages += tx_parser.messages
    db._messages += rx_parser.messages
    return db
