"""
Provides tooling to help move messages from a serial can (slcan) device into Redis.
"""
from typing import Any  # Fully typed, because why not
import can  # Provides slcan interface
import cantools  # Decodes using slcan messages
import re  # Only used to parse out signal names
from redis import Redis
from redistimeseries.client import Client


def MakeBus(num: int) -> can.Bus:
    """
    Set up slcan interface from a serial radio connected to the computer

    Args:
        num: The USB serial device number of the radio (ex. /dev/ttyUSB0)

    Returns:
        a can.Bus object (from python-can) or a descriptive error
    """
    try:
        return can.interface.Bus(
            bustype="slcan", channel="/dev/ttyUSB%s@9600" % num, bitrate=500000
        )
    except:
        raise Exception(
            """/tty/USB%s cannot be accessed. Try the following:
        *running this script with 'sudo'
        *rebooting the laptop
        *checking the connection between the radio and the laptop
        *using 'minicom --device=/dev/ttyUSB%s --baudrate=9600' to debug the radio communications
        *checking the USB device number
        """
            % num
        )


class RedisReader(can.Listener):
    """
    Puts can messages into Redis
    """

    def __init__(self, redis_instance: Redis, dbc_file: str) -> None:
        """
        Instantiate a RedisReader

        Args:
            redis_instance: a Redis instance (connection)
            dbc_file: the relative path to a file in the [dbc](http://www.socialledge.com/sjsu/index.php?title=DBC_Format) format
        """
        super().__init__()
        # Redis time series -> rts
        self.rts = Client(conn=redis_instance)
        self.dbc = cantools.database.load_file(dbc_file)  # makes cantools decoder
        data_channels = set(
            map(
                lambda s: s[11:-1],
                re.findall(
                    "\\n  signal\('.*?'", str(self.dbc)
                ),  # parses signals from toString of cantools because no method exists
            )
        )
        for data_channel in data_channels:
            # create a data channel (of signals) unless it already exists
            try:
                self.rts.create(data_channel)
            except:
                print("channel already exists")

    def on_message_received(self, msg: can.Message) -> None:
        """
        Parses and inputs a can message into Redis

        Args:
            msg: the message to parse
        """
        message = self.dbc.decode_message(
            msg.arbitration_id, msg.data
        )  # decodes messages with cantools dbc decoder
        for (
            key,
            value,
        ) in message.items():  # adds signal values (data) to the timeseries
            self.rts.add(key, "*", value)

    def stop(self) -> None:
        """
        Unimplemented
        """
        pass


def main():
    USB_NUM = input(
        "Provide *only* the number of the USB device corresponding to the radio:"
    )
    bus = MakeBus(USB_NUM)
    # dbc file for decoding messages
    dbc = "data/dash.dbc"
    redis_instance = Redis(host="127.0.0.1", port="6379")
    listener = RedisReader(redis_instance=redis_instance, dbc_file=dbc)
    can.Notifier(bus, [listener])

if __name__ == "__main__":
    main()