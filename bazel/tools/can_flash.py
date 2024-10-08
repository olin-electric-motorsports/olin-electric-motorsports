import sys
import os
import logging

from projects.btldr.py_client.cli import updatr

if __name__ == "__main__":
    log = logging.getLogger("root")
    log.setLevel(logging.INFO)

    args = sys.argv[1:]
    can_network = args[-1]
    btldr_id = os.environ.get("BTLDR_ID")
    binary = os.environ.get("TARGET_BINARY")

    updatr(["-d", can_network, "flash", btldr_id, binary])
