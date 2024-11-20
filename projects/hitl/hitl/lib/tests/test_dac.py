import pytest
from unittest.mock import Mock
from projects.hitl.lib.dac import AD5675


@pytest.fixture
def ad5675():
    i2c = Mock()

    i2c.i2cMaster_Write = Mock(return_value=None)

    dac = AD5675(i2c, 5.0, address=0b0001101)

    return dac


def test_write(ad5675):
    ad5675.write(5, 2.5)

    assert ad5675.i2c.i2cMaster_Write.called_once_with(
        0b0001101, bytes([0b00010101, 0b00000000, 0b11111111])
    )
