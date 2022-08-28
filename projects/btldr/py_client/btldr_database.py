from cantools.database.can import Message as CANMessage, Signal as MessageSignal, Database as DBC


# Number of messages used by the bootloader
NUM_MESSAGES = 8


class BtldrDatabase(DBC):
    def __init__(self):
        super().__init__()

        self._messages.append(self._make_query_msg())
        self._messages.append(self._make_query_response_msg())
        self._messages.append(self._make_reset_msg())
        self._messages.append(self._make_reset_response_msg())
        self._messages.append(self._make_request_msg())
        self._messages.append(self._make_request_response_msg())
        self._messages.append(self._make_data_msg())
        self._messages.append(self._make_data_response_msg())

        self.refresh()


    def _make_query_msg(self: int) -> CANMessage:
        timestamp = MessageSignal(
            "timestamp",
            start=0,
            length=64,
            unit="seconds"
        )

        query = CANMessage(
            frame_id = 0,
            name = "btldr_query",
            length = 8,
            signals = [timestamp],
            senders = ["updatr"]
        )

        return query


    def _make_query_response_msg(self: int) -> CANMessage:
        bootloader_version = MessageSignal(
            "bootloader_version",
            start = 0,
            length = 8,
            receivers = ["updatr"],
        )

        chip_id = MessageSignal(
            "chip_id",
            start = 8,
            length = 8,
            receivers = ["updatr"],
            choices = {
                0: "Unknown",
                1: "ATMEGA16M1",
                2: "ATMEGA328P",
                3: "STM32F103C8T6",
            }
        )

        current_image = MessageSignal(
            "current_image",
            start = 16,
            length = 8,
            receivers = ["updatr"],
            choices = {
                0: "Application",
                1: "Updater"
            }
        )

        _reserved = MessageSignal(
            "reserved",
            start = 24,
            length = 8,
            receivers = [],
        )

        time_delta = MessageSignal(
            "time_delta",
            start = 32,
            length = 32,
            unit = "seconds",
            receivers = ["updatr"],
        )

        query_response = CANMessage(
            frame_id = 4,
            name = "btldr_query_response",
            length = 8,
            signals = [bootloader_version, chip_id, current_image, _reserved, time_delta],
            senders = ["updatr"]
        )

        return query_response


    def _make_reset_msg(self: int) -> CANMessage:
        request = MessageSignal(
            "update_request",
            start = 0,
            length = 1,
            choices = {
                0: "Normal operation",
                1: "Update requested"
            },
        )

        reset = CANMessage(
            frame_id = 1,
            name = "btldr_reset",
            length = 1,
            signals = [request],
            senders = ["updatr"],
        )

        return reset


    def _make_reset_response_msg(self: int) -> CANMessage:
        status = MessageSignal(
            name = "status",
            start = 0,
            length = 8,
            receivers = ["updatr"],
            choices = {
                0: "OK",
                1: "ERROR",
            }
        )

        error_code = MessageSignal(
            name = "error_reason",
            start = 8,
            length = 8,
            receivers = ["updatr"],
        )

        reset_response = CANMessage(
            frame_id = 5,
            length = 2,
            name = "btldr_reset_response",
            signals = [status, error_code],
        )

        return reset_response


    def _make_request_msg(self: int) -> CANMessage:
        type = MessageSignal(
            name = "type",
            start = 0,
            length = 8,
            choices = {
                0: "Download",
                1: "Upload",
            }
        )

        image_size = MessageSignal(
            name = "image_size",
            start = 8,
            length = 16,
        )

        request = CANMessage(
            frame_id = 2,
            length = 3,
            name = "btldr_request",
            signals = [type, image_size],
            senders = ["updatr"],
        )

        return request


    def _make_request_response_msg(self: int) -> CANMessage:
        error_code = MessageSignal(
            name = "error_code",
            start = 0,
            length = 8,
            receivers = ["updatr"],
            choices = {
                0: "OK",
                1: "INVALID_REQUEST",
            }
        )

        last_programmed_address = MessageSignal(
            name = "last_programmed_address",
            start = 8,
            length = 16,
            receivers = ["updatr"],
        )

        remaining_size = MessageSignal(
            name = "remaining_size",
            start = 24,
            length = 16,
            receivers = ["updatr"],
        )

        request_response = CANMessage(
            frame_id = 6,
            length = 5,
            name = "btldr_request_response",
            signals = [error_code, last_programmed_address, remaining_size],
        )

        return request_response


    def _make_data_msg(self: int) -> CANMessage:
        data = MessageSignal(
            name = "data",
            start = 0,
            length = 64,
        )

        data_msg = CANMessage(
            frame_id = 3,
            name = "btldr_data",
            length = 8,
            signals = [data],
        )

        return data_msg


    def _make_data_response_msg(self: int) -> CANMessage:
        error_code = MessageSignal(
            name = "error_code",
            start = 0,
            length = 8,
            receivers = ["updatr"],
            choices = {
                0: "OK",
            }
        )

        last_programmed_address = MessageSignal(
            name = "last_programmed_address",
            start = 8,
            length = 16,
            receivers = ["updatr"],
        )

        remaining_size = MessageSignal(
            name = "remaining_size",
            start = 24,
            length = 16,
            receivers = ["updatr"],
        )

        data_response = CANMessage(
            frame_id = 7,
            length = 5,
            name = "btldr_data_response",
            signals = [error_code, last_programmed_address, remaining_size],
        )

        return data_response
