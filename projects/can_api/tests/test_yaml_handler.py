import sys
import pytest
from cantools.database.can import Message, Signal, Node


def test_messages(tx_parser):
    messages = tx_parser.messages

    assert messages[0].name == "test_tx"
    test_tx = messages[0]

    assert test_tx.frame_id == 0xAB
    assert test_tx.cycle_time == 10  # 10 milliseconds

    signals = messages[0].signals

    assert signals[0].name == "signal_a"
    signal_a = signals[0]

    assert signal_a.start == 0
    assert signal_a.length == 8
    assert signal_a.byte_order == "little_endian"
    assert signal_a.unit == "bool"
    assert signal_a.choices == {0: "OK", 1: "FAULT"}

    assert signals[1].name == "example_16_bit"
    example_16_bit = signals[1]

    assert example_16_bit.length == 16
    assert example_16_bit.unit == "V"
    assert example_16_bit.offset == 0
    assert example_16_bit.scale - (5 / 4096) < 0.00001  # Gotta love floats


def test_no_signals(tx_parser):
    assert tx_parser.messages[1].name == "test_no_signals"

    no_signals = tx_parser.messages[1]

    assert no_signals.signals == []
    assert no_signals.length == 0
