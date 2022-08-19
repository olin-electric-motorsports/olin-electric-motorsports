# import cantools
from cantools.database import load_file

from can import Message as CANMessage
from can.interface import Bus as CANBus
from .btldr_database import BtldrDatabase, NUM_MESSAGES

import time
import logging
from enum import Enum


def _btldr_offset(frame_id):
    return (frame_id % NUM_MESSAGES)


class BtldrManager():
    def __init__(self, bustype: str, source: str, bitrate: int = 500000):
        self.canbus = CANBus(interface="socketcan", bustype=bustype, channel=source, bitrate=bitrate)
        logging.info("CAN Network initialized")

        self.db = BtldrDatabase()
        logging.info("CAN DBC Initialized")


    def ping(self, ecu_id, timeout: int):
        self._send_query(ecu_id)
        maybe_response = self._receive_query_response(ecu_id, timeout)

        if maybe_response != None:
            ping_resp = self.db.decode_message(
                _btldr_offset(maybe_response.arbitration_id),
                maybe_response.data
            )

            return True, ping_resp
        else:
            return False, None


    def ping_all(self):
        logging.error("Not implemented")

    def flash(self, ecu_id, file: str):
        pass

    def _read_file(self):
        pass

    def _send_query(self, ecu_id):
        now = time.time()

        query_msg = self.db.get_message_by_name("btldr_query")

        query_data = query_msg.encode({
            "timestamp": now,
        })

        query_frame = CANMessage(
            arbitration_id=ecu_id + query_msg.frame_id,
            data=query_data,
        )

        self.canbus.send(query_frame)


    def _send_reset(self, ecu_id):
        pass

    def _send_request(self, ecu_id):
        pass

    def _send_data(self, ecu_id):
        pass

    def _receive_query_response(self, ecu_id, timeout):
        query_response = self.db.get_message_by_name("btldr_query_response")
        self.canbus.set_filters([{
            "can_id": ecu_id + query_response.frame_id,
            "can_mask": 0x7FF,
        }])

        maybe_response = self.canbus.recv(timeout)

        return maybe_response
