# Base imports
from subprocess import run
import sys
import os

# Get paths
home = os.getenv("HOME")
this_file_path = os.path.abspath(__file__)
project_file_path = os.path.abspath(os.path.join(this_file_path, os.pardir, os.pardir))

# Add this project to python path to import utils
sys.path.append(project_file_path)
from hitl.utils import find_arduino

# Create udev rule
def create_udev_rule():
    """Create udev rules to create symbolic links to hardware

    For now, only creates a single rule, for an arduino

    TODO this will need to be updated when we build a HITL interface board
    """
    print("Creating udev rule...")

    idVendor, idProduct = find_arduino()

    if idProduct:
        with open("99-arduino.rules", "r") as f:
            data = f.read()

        data = data.replace("VENDOR", idVendor)
        data = data.replace("PRODUCT", idProduct)
        with open("/etc/udev/rules.d/99-arduino.rules", "w") as f:
            f.write(data)

        print("udev rule created.\n")
    else:
        print("No arduino found; no udev rule created.\n")


# SocketCAN setup
def install_kernel_hitl():
    """Load the necessary kernel hitl.

    This is necessary to interface with CAN hardware.
    See socketcan docs for details.
    """

    print("Installing kernel hitl...")
    os.system("sudo modprobe vcan")  # for testing
    os.system("sudo modprobe peak_usb")
    # run("sudo modprobe peak_pci") not sure if necessary
    # run("sudo modprobe can_raw") not sure if necessary
    print("Kernel hitl installed.\n")


if __name__ == "__main__":
    # Fail if not on linux!
    if "linux" not in sys.platform:
        raise Exception(
            "This script only works on Linux! For help with setup on another os, contact awenstrup@olin.edu"
        )

    create_udev_rule()
    install_kernel_hitl()
