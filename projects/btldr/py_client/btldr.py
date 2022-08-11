# import cantools
from cantools.database import load_file

from can import Message as CANMessage
from can.interface import Bus as CANBus

import time
import logging


class BtldrClient():
    def __init__(self, bustype: str, source: str, dbc: str, bitrate: int = 500000):
        self.canbus = CANBus(interface="socketcan", bustype=bustype, channel=source, bitrate=bitrate)
        logging.info("CAN Network initialized")
        self.db = load_file(dbc)
        logging.info("CAN DBC Initialized")

    def ping(self, id: int, timeout: int):
        now = int(time.time())  # Current timestamp
        ping_cmd = CANMessage(
            arbitration_id=id,
            data=now.to_bytes(8, "little"),
            is_extended_id=False,
        )

        logging.info("PING 0x%X" % id)
        self.canbus.send(ping_cmd)

        self.canbus.set_filters([{
            "can_id": id + 1,
            "can_mask": 0x7FF,
            "extended": False,
        }])

        maybe_response = self.canbus.recv(timeout)

        if maybe_response != None:
            ping_resp = self.db.decode_message(
                maybe_response.arbitration_id,
                maybe_response.data
            )

            logging.info("Found device")
            return True, ping_resp
        else:
            logging.error("Ping failed")
            return False, None


    def ping_all(self):
        pass

    def flash(self, id: int, file: str):
        pass

    def _read_file(self):
        pass
