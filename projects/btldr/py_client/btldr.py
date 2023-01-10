import math
import os
import time
import logging
import tqdm

from cantools.database import load_file
from can import Message as CANMessage
from can.interface import Bus as CANBus

from .btldr_database import BtldrDatabase, NUM_MESSAGES


def _btldr_offset(frame_id):
    return frame_id % NUM_MESSAGES


class BtldrManager:
    def __init__(self):
        self.db = BtldrDatabase()
        logging.info("CAN DBC Initialized")

        # Must be initialized separately
        self.canbus = None

    def ping(self, ecu_id: int, timeout: int):
        start = time.time_ns()

        self._send_query(ecu_id)
        maybe_response = self._receive_query_response(ecu_id, timeout)

        if maybe_response != None:
            ping_resp = maybe_response

            end = time.time_ns()
            ping_resp["elapsed_time_ns"] = end - start

            return ping_resp
        else:
            return None

    def ping_all(self):
        raise Exception("Not implemented")

    def flash(self, ecu_id: int, file: str, timeout: int):
        start = time.time_ns()

        # Reset device into the bootloader
        self.software_reset(ecu_id, request_update=True)

        time.sleep(1)

        # Query to make sure device is in bootloader
        ping_resp = self.ping(ecu_id, timeout)

        if not ping_resp:
            raise Exception("Failed to ping device")

        if ping_resp["current_image"] != "Updater":
            raise Exception("Failed to place device in updater")

        image_size_bytes = os.path.getsize(file)

        # Image size in 8-byte groups (octets)
        image_size_octets = math.ceil(float(image_size_bytes) / 8.0)

        # Make image size a multiple of 8
        image_size_bytes = 8 * image_size_octets
        self._send_request(ecu_id, "upload", image_size_bytes)

        request_response = self._receive_request_response(ecu_id, timeout)

        if request_response:
            if request_response["error_code"] != "OK":
                raise Exception("Target reported invalid update request type")
        else:
            raise Exception("Failed to receive response to update request")

        # Ok, we received an OK from the target to start sending data

        with open(file, "rb") as bin:
            for chunk_idx in range(image_size_octets):
                data = list(bin.read(8))

                if not data:
                    break

                size_read = len(data)

                if len(data) != 8:
                    data.extend([0xFF] * (8 - size_read))

                # Must always be 8 bytes
                assert len(data) == 8

                self._send_data(ecu_id, data)
                data_response = self._receive_data_response(ecu_id, timeout)

                if not data_response:
                    raise Exception("Failed to receive data response from target")
                else:
                    if data_response["error_code"] != "OK":
                        raise Exception(
                            "Target returned non-OK data response code"
                            + data_response["error_code"]
                        )

                remaining_size = (image_size_octets - chunk_idx - 1) * 8

                if remaining_size != data_response["remaining_size"]:
                    logging.warning(
                        "Mismatch in amount of data remaining, flash may fail: Local is %i, remote is %i"
                        % (remaining_size, data_response["remaining_size"]),
                    )

        self.software_reset(ecu_id, False)

        time.sleep(1)

        ping_resp = self.ping(ecu_id, timeout)

        if not ping_resp:
            raise Exception("Failed to ping device after update")

        if not (ping_resp["current_image"] == "Application"):
            raise Exception("Device not in application after update")

        end = time.time_ns()

        ping_resp["elapsed_time"] = end - start

        return ping_resp

    def software_reset(self, ecu_id: int, request_update: bool = False):
        self._send_reset(ecu_id, request_update)

    ### PRIVATE METHODS

    def _send_query(self, ecu_id):
        now = int(time.time())

        query_msg = self.db.get_message_by_name("btldr_query")

        query_data = query_msg.encode(
            {
                "timestamp": now,
            }
        )

        query_frame = CANMessage(
            arbitration_id=ecu_id + query_msg.frame_id,
            data=query_data,
            is_extended_id=False,
        )

        self.canbus.send(query_frame)

    def _send_reset(self, ecu_id, update_requested):
        reset_msg = self.db.get_message_by_name("btldr_reset")

        reset_data = reset_msg.encode(
            {
                "update_request": int(update_requested),
            }
        )

        reset_frame = CANMessage(
            arbitration_id=ecu_id + reset_msg.frame_id,
            data=reset_data,
            is_extended_id=False,
        )

        self.canbus.send(reset_frame)

    def _send_request(self, ecu_id, type, image_size):
        request_msg = self.db.get_message_by_name("btldr_request")

        if type == "download":
            request_data = request_msg.encode(
                {
                    "type": 0,
                    "image_size": 0,
                }
            )
        elif type == "upload":
            request_data = request_msg.encode(
                {
                    "type": 1,
                    "image_size": image_size,
                }
            )
        else:
            raise Exception("Type must be one of: (download, upload)")

        request_frame = CANMessage(
            arbitration_id=ecu_id + request_msg.frame_id,
            data=request_data,
            is_extended_id=False,
        )

        self.canbus.send(request_frame)

    def _send_data(self, ecu_id: int, data: list):
        data_msg = self.db.get_message_by_name("btldr_data")
        data_frame = CANMessage(
            arbitration_id=ecu_id + data_msg.frame_id,
            data=data,
            is_extended_id=False,
        )

        self.canbus.send(data_frame)

    def _receive_query_response(self, ecu_id, timeout: int):
        query_response = self.db.get_message_by_name("btldr_query_response")
        return self._receive_message(ecu_id, query_response.frame_id, timeout)

    def _receive_reset_response(self, ecu_id: int, timeout: int):
        reset_response = self.db.get_message_by_name("btldr_reset_response")
        return self._receive_message(ecu_id, reset_response.frame_id, timeout)

    def _receive_request_response(self, ecu_id: int, timeout: int):
        request_response = self.db.get_message_by_name("btldr_request_response")
        return self._receive_message(ecu_id, request_response.frame_id, timeout)

    def _receive_data_response(self, ecu_id: int, timeout: int):
        data_response = self.db.get_message_by_name("btldr_data_response")
        return self._receive_message(ecu_id, data_response.frame_id, timeout)

    def _receive_message(self, ecu_id, offset, timeout):
        self.canbus.set_filters(
            [
                {
                    "can_id": ecu_id + offset,
                    "can_mask": 0x7FF,
                }
            ]
        )

        maybe_response = self.canbus.recv(timeout)

        if maybe_response:
            return self.db.decode_message(offset, maybe_response.data)
        else:
            return None
