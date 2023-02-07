"""
objective - grab data from serial, parse, pass into redis
timeseries database in realtime
"""
import ast
import serial
import time
from redis import Redis
from redistimeseries.client import Client

# Data stream parent class with main pass_data() method call
# 2-3 data stream children - serial stream, logfile stream, custom pass_data() methods


class DataStream(object):
    def __init__(self, data_channels):
        # self.start_stream = True
        self.data_channels = data_channels

    # def close_stream(self):
    #     self.start_stream = False

    def return_data_channels(self):
        return self.data_channels


class ArduinoSerialIn(DataStream):
    """
    Class to represent arduino serial datastream object in for testing purposes
    """

    def __init__(
        self, baudrate=9600, port_name="/dev/ttyUSB0", data_channels=["arduino_data"]
    ):
        # baud rate is the rate at which information is transferred (9600 bits/second)
        # port name is the port the arduino is connected to
        # data channels is the tag attached to the data being sent (used to visualize)
        DataStream.__init__(self, data_channels)
        self.ser = serial.Serial(port_name, baudrate)

    def read_line(self):
        """
        returns data float
        """
        flt = self.parse_line(self.ser.readline())
        print(flt)  # for debug
        return (flt,)

    def parse_line(self, value):

        # try except// catch the error but don't break down please
        # return 19.0 if there is an error.
        try:
            val_strn = value.decode()
        except Exception as error:
            print(error)
            return 19.0

        val_str = val_strn.rstrip()

        try:
            flt = float(val_str)
        except Exception as error:
            print(error)
            return 19.0

        return flt


class LogFile(DataStream):
    """
    Class to represent logfile datastream object where data can be grabbed with a single function
    TODO: Handle logfile formatting
    """

    count = 0
    path = ""

    def __init__(self, path, data_channels=["test_data"]):
        DataStream.__init__(self, data_channels)
        self.path = path

    def read_line(self):
        with open(self.path, "r") as f:
            for position, line in enumerate(f):
                # Iterate over each line and its index
                if position in [self.count]:
                    next_line = line

        next_line = ast.literal_eval(next_line)

        self.count += 1
        time.sleep(1)
        # print(self.count)
        return next_line

    def parse_line(self, data):
        try:
            val_strn = (
                data.decode()
            )  # try except// catch the error but don't break down please
        except Exception as e:
            print(e)
            return 19.0

        val_str = val_strn.rstrip()

        try:
            msg = str(val_str)
        except Exception as e:
            print(e)
            return 19.0

        return msg


class RadioSerialIn(DataStream):
    """
    Class to represent Radio serial datastream object
    TODO: Handle radio serial formatting
    """

    path = ""

    def __init__(self, path, data_channels=["test_data"]):
        DataStream.__init__(self, data_channels)
        self.path = path

    def read_line(self):

        # This needs to read new lines as it's logged to the logfile.
        with open(self.path, "r") as f:
            next_line = f.readline()

        next_line = ast.literal_eval(next_line)

        time.sleep(1)
        # print(self.count)
        return next_line

        # next_line = ast.literal_eval(next_line)
        # time.sleep(1) shouldn't need to sleep because we should be reading data as it's fed in.
        # print(self.count)
        # return next_line

    def parse_line(self, data):
        try:
            val_strn = (
                data.decode()
            )  # try except// catch the error but don't break down please
        except Exception as error:
            print(error)
            return 19.0

        val_str = val_strn.rstrip()

        try:
            msg = str(val_str)
        except Exception as error:
            print(error)
            return 19.0

        return msg


class RedisDataSender(object):
    def __init__(self, data_stream_object, read_frequency_hz=5):
        self.data_stream_object = data_stream_object
        self.read_frequency_hz = read_frequency_hz
        self.data_channels = self.data_stream_object.return_data_channels()

        # initialize redis connection
        try:
            redis_instance = Redis(host="127.0.0.1", port="6379")
        except Exception as error:
            print(error)
            return "redis not connected"

        # initialize redis timeseries client connection
        try:
            self.rts = Client(conn=redis_instance)
        except Exception as error:
            print(error)
            return "redis timeseries client not connected"

        for data_channel in self.data_channels:
            # create a data channel unless it already exists
            try:
                self.rts.create(data_channel)
            except:
                print("channel already exists")

    def grab_serial_data(self):
        while True:
            # grab data tuple from line
            tup = self.data_stream_object.read_line()
            signals = tup["signals"]
            print(signals)
            for (key, value) in signals.items():
                self.send_to_redis_timeseries(value, key)

            # should operate
            time.sleep(1 / self.read_frequency_hz)

    def send_to_redis_timeseries(self, flt, data_channel):
        self.rts.add(data_channel, "*", flt)


# radio = RadioSerialIn("data/nextmessage.txt")
# # print(radio.parse_line)
# print(radio.read_line())
# print(radio.read_line())
# print(radio.read_line())
# print(radio.read_line())
# redis_data = RedisDataSender(radio)
# print(redis_data.grab_serial_data())
