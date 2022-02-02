import sys
import pytest
from cantools.database.can import Message, Signal, Node
from ..yaml_handler import YamlParser
from ..utils import get_rx_messages

def test_get_rx_messages(db, rx_yaml):
    assert("subscribe" in rx_yaml)

    messages, mobs = get_rx_messages(rx_yaml["subscribe"], db.messages)

    assert(messages[0].name == "test_tx")
    assert(mobs[messages[0].name] == 0)

def test_missing_rx_message(db, rx_fail_yaml):
    assert("subscribe" in rx_fail_yaml)

    messages, mobs = get_rx_messages(rx_fail_yaml["subscribe"], db.messages)

    assert(messages == [])
