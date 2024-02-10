import pytest
from unittest.mock import Mock
from projects.hitl.lib.gpio import MAX7300, PinMode


def test_i2c_set_mode():
    i2c = Mock()
    i2c.i2cMaster_Write = Mock(return_value=None)
    i2c.i2cMaster_Read = Mock(return_value=b'\x00\x00')


    gpio = MAX7300(i2c)
    gpio.set_mode(6, PinMode.OUTPUT)
    assert i2c.i2cMaster_Write.called_once_with(
        0b1000000, bytes([0b00001001, 0b00100000])
    )

    with pytest.raises(Exception):
        gpio.set_mode(6, 3)


def test_i2c_set():
    i2c = Mock()
    i2c.i2cMaster_Write = Mock(return_value=None)

    gpio = MAX7300(i2c)
    gpio.set(13, 1)
    assert i2c.i2cMaster_Write.called_once_with(
        0b1000000, bytes([0b00101101, 0b00000001])
    )


def test_i2c_get():
    i2c = Mock()
    i2c.i2cMaster_Write = Mock(return_value=None)
    i2c.i2cMaster_Read = Mock(return_value=b'\x01\x00')


    gpio = MAX7300(i2c)
    assert gpio.get(15) == 1
    assert i2c.i2cMaster_Write.called_once_with(0b1000000, bytes([0b00101111]))
    assert i2c.i2cMaster_Read.called_once_with(0b1000000, 1)
