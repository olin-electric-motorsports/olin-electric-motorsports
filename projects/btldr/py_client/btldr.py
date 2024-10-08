import math
import os
import time
import logging
from tqdm import trange

from cantools.database import load_file
from can import Message as CANMessage
from can.interface import Bus as CANBus

from .btldr_database import BtldrDatabase


def flash_time_string(delta: int):
    flashed_time = time.localtime(time.time() - delta)
    return time.strftime("%Y/%m/%d %H:%M:%S", flashed_time)


class BtldrManager:
    """
    The BtldrManager class is an object that handles using the btldr functionality.
    With the `ping` method, you can query a device for its metadata. With the
    `flash` function, you can update the firmware on the device using CAN.

    This class is meant to be used as a single object, so only one needs to be
    created per program.

    Example usage:

    ```python
    btldr = BtldrManager()

    btldr.ping(0x700, 1) # Ping the device with ecu_id 0x700

    # Flash the AIR Control board (that has ecu_id 0x700) with a binary in the given
    # directory
    btldr.flash(0x700, 'bazel-bin/vehicle/mkvi/software/air_control/air_control_patched.bin', 1)
    ```
    """

    def __init__(self):
        self.db = BtldrDatabase()
        log = logging.getLogger("root")
        self.log = log
        log.info("CAN DBC Initialized")

        # Must be initialized separately
        self.canbus = None

    def ping(self, ecu_id: int, timeout: int):
        """
        The ping function sends a query message to the target and returns the response.

        Arguments:
        - ecu_id (int): The ID of the target device to be updated
        - timeout (int): A timeout (in seconds) to wait when receiving CAN
            messages
        """
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

    """
    The flash function is responsible for flashing new firmware onto the target
    microcontroller. It handles all of the communication with the target.

    Arguments:
    - ecu_id (int): The ID of the target device to be updated
    - file (str): A path to the binary that will be uploaded to the target
    - timeout (int): A timeout (in seconds) to wait when receiving CAN
        messages

    Returns: A ping response struct of the device after it has been updated

    Raises: Raises an Exception in the event that any stage of the flashing
        process errored. If this happens, I recommend first retrying, then power
        cycling the device and retrying, and finally manually updating the device.
    """

    def flash(self, ecu_id: int, file: str, timeout: int):
        start = time.time_ns()

        # Reset device into the bootloader
        logging.info("Resetting target device with ID 0x{:02X}".format(ecu_id))
        self.software_reset(ecu_id, request_update=True)

        # This is inefficient. Ideally, we should start pinging
        # immediately over and over again until we get a response, but for the
        # sake of time and completeness, I decided to hardcode a delay.
        # Hopefully someone will improve upon this one day.
        time.sleep(1)  # Wait one second after reset before attempting to ping

        # Query to make sure device is in bootloader
        ping_resp = self.ping(ecu_id, timeout + 0.5)

        if not ping_resp:
            logging.critical("Failed to ping device after reset")
            exit(1)

        if ping_resp["current_image"] != "Updater":
            logging.critical("Failed to place device in updater")
            exit(1)

        image_size_bytes = os.path.getsize(file)

        # Image size in 8-byte groups (octets)
        image_size_octets = math.ceil(float(image_size_bytes) / 8.0)

        # Make image size a multiple of 8
        image_size_bytes = 8 * image_size_octets

        logging.info(
            "Sending update request to target with {} bytes".format(image_size_bytes)
        )
        self._send_request(ecu_id, "upload", image_size_bytes)

        request_response = self._receive_request_response(ecu_id, timeout)

        if request_response:
            if request_response["error_code"] != "OK":
                logging.critical(
                    "Target reported invalid update request type: {}".format(
                        request_response["error_code"]
                    )
                )
                exit(1)
        else:
            logging.critical("Failed to receive response to update request")
            exit(1)

        # Ok, we received an OK from the target to start sending data

        with open(file, "rb") as bin:
            for chunk_idx in trange(image_size_octets):
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

        logging.info("Update complete")
        logging.info("Resetting target device")
        self.software_reset(ecu_id, False)

        time.sleep(2)

        logging.info("Pinging updated target")
        ping_resp = self.ping(ecu_id, timeout)

        if not ping_resp:
            logging.error("Failed to receive ping response from target after update.")
            exit(1)
            raise Exception("Failed to ping device after update")

        if not (ping_resp["current_image"] == "Application"):
            logging.error("Device not in application after update")
            exit(1)
            raise Exception("Device not in application after update")

        end = time.time_ns()

        ping_resp["elapsed_time"] = end - start

        logging.info(
            "Successfully updated ID 0x{:02X} at {} in {}sec.".format(
                ecu_id,
                flash_time_string(ping_resp["time_delta"]),
                (ping_resp["elapsed_time"] / 10**9),
            )
        )
        logging.info("Done")

        return ping_resp

    """
    The software_reset function simply provides an abstraction for sending the
    reset message to the target ECU. This is left here in case the functionality
    changes in the future and there are other things that are needed in order
    for a software reset.
    """

    def software_reset(self, ecu_id: int, request_update: bool = False):
        self._send_reset(ecu_id, request_update)

    ### PRIVATE METHODS

    def _send_query(self, ecu_id: int):
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

    def _send_reset(self, ecu_id: int, update_requested: bool):
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

    def _send_request(self, ecu_id: int, type: str, image_size: int):
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

    def _receive_query_response(self, ecu_id: int, timeout: int):
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

    """
    This function handles applying the offset of the message to the ECU_ID
    """

    def _receive_message(self, ecu_id: int, offset: int, timeout: int):
        self.canbus.set_filters(
            [
                {
                    "can_id": ecu_id + offset,
                    "can_mask": 0xFFF,
                    "extended": False,
                }
            ]
        )

        while True:
            maybe_response = self.canbus.recv(timeout)

            if maybe_response == None:
                break

            if maybe_response.arbitration_id != ecu_id + offset:
                continue
            else:
                break

        if maybe_response:
            r = self.db.decode_message(offset, maybe_response.data)
            return r
        else:
            return None
