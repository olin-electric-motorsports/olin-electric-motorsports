# import cantools
from cantools.database import load_file

from can import Message as CANMessage
from can.interface import Bus as CANBus
from .btldr_database import BtldrDatabase

import time
import logging
from enum import Enum


MSG_OFFSET_QUERY = 0
MSG_OFFSET_QUERY_RESPONSE = 4


class BtldrManager():
    def __init__(self, bustype: str, source: str, bitrate: int = 500000):
        self.canbus = CANBus(interface="socketcan", bustype=bustype, channel=source, bitrate=bitrate)
        logging.info("CAN Network initialized")

        self.db = BtldrDatabase()
        logging.info("CAN DBC Initialized")


    def ping(self, base, timeout: int):
        self._send_query(base)
        maybe_response = self._receive_query_response(base, timeout)

        if maybe_response != None:
            ping_resp = self.db.decode_message(
                maybe_response.arbitration_id,
                maybe_response.data
            )

            return True, ping_resp
        else:
            return False, None


    def ping_all(self):
        pass

    def flash(self, base, file: str):
        pass

    def _read_file(self):
        pass

    def _send_query(self, base):
        now = time.time()

        query_msg = self.db.get_message_by_frame_id(base + MSG_OFFSET_QUERY)

        query_data = query_msg.encode({
            "timestamp": now,
        })

        query_frame = CANMessage(
            arbitration_id=base + MSG_OFFSET_QUERY,
            data=query_data,
        )

        self.canbus.send(query_frame)


    def _send_reset(self, base):
        pass

    def _send_request(self, base):
        pass

    def _send_data(self, base):
        pass

    def _receive_query_response(self, base, timeout):
        self.canbus.set_filters([{
            "can_id": base + MSG_OFFSET_QUERY_RESPONSE,
            "can_mask": 0x7FF,
        }])

        maybe_response = self.canbus.recv(timeout)

        return maybe_response
