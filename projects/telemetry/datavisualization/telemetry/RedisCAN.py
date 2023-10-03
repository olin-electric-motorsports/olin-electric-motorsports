"""
Provides tooling to help move messages from a serial can (slcan) device into Redis.
"""
import can  # Provides slcan interface
import cantools  # Decodes using slcan messages
import re  # Only used to parse out signal names
from redis import Redis
from redistimeseries.client import Client


def MakeBus(path: str) -> can.Bus:
    """
    Set up slcan interface from a serial radio connected to the computer

    Args:
        path: The USB serial device path of the radio (ex. /dev/ttyUSB0)

    Returns:
        a can.Bus object (from python-can)
    
    Raises:
        A generic Exception if the device cannot be accessed.
    """
    try:
        return can.interface.Bus(
            bustype="slcan", channel=f"{path}@9600", bitrate=500000
        )
    except:
        raise Exception(
            f"""{path} cannot be accessed. Try the following:
        *running this script with 'sudo'
        *rebooting the laptop
        *checking the connection between the radio and the laptop
        *using 'minicom --device={path} --baudrate=9600' to debug the radio communications
        *checking the USB device number
        """
        )


class RedisReader(can.Listener):
    """
    Puts can messages into Redis

    Attributes:
        rts: A Redis Time Series object that functions as a client to Redis.
        dbc: A Cantools database object that functions as 
    """

    def __init__(self, redis_instance: Redis, dbc_file: str) -> None:
        """
        Instantiate a RedisReader

        Args:
            redis_instance: a Redis instance (connection)
            dbc_file: the relative path to a file in the dbc format
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
                ),  # parses signals from toString of cantools
                # because no method exists
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
    USB_TTY = input(
        "Provide the path of the USB device corresponding to the radio:"
    )
    bus = MakeBus(USB_TTY)
    # dbc file for decoding messages
    dbc = "data/dash.dbc"
    redis_instance = Redis(host="127.0.0.1", port="6379")
    listener = RedisReader(redis_instance=redis_instance, dbc_file=dbc)
    can.Notifier(bus, [listener])

if __name__ == "__main__":
    main()