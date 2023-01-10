"""
This is the command-line interface (CLI) to the BtldrManager (in btldr.py). This
is what engineers use to flash and ping devices on the CAN bus.

A bit of terminology:
    * HOST: The machine you are running the CLI on
    * TARGET: The microcontroller on the CAN bus that you are pinging or updating
"""
import signal
import time
import click
from formula.projects.btldr.py_client.btldr import BtldrManager
from can.interface import Bus

pass_btldr_manager = click.make_pass_decorator(BtldrManager)


"""
The `ping` function runs ad infinitum, so we need a way of ending it. To stop
pinging, you can just press <Ctrl-C>! The sigint function below will get called
when the user presses <Ctrl-C>. In the function, we just print out the
statistics from the pinging that we got. For now, that's just the number of sent
and number of received frames.
"""
exit_flag = False
ping_stats = {
    "sent": 0,
    "received": 0,
}

# Sigint (Ctrl-C) handler. This function runs when the user presses Ctrl-C
def sigint(signum, frame):
    global exit_flag

    if not exit_flag:
        exit_flag = True
        print("\n--- ping statistics ---")

        print(
            "{sent} packets transmitted, {received} received".format(
                sent=ping_stats["sent"],
                received=ping_stats["received"],
            )
        )

        exit(0)


"""
This is our top-level command! It's what get called when you run this script.

It basically creates a click.group of other commands that will be defined in
other functions. We initialize the BtldrManager (the thing that handles the
actual CAN stuff for us) and also sets up the CAN device.

The @click.pass_context just means that all of the members of the group (the
functions below wherever you see @updatr.command()) will get to access the
context object, which we use to store the bootloader manager.
"""


@click.group()
@click.option("-d", "--device", required=True, help="CAN network device")
@click.pass_context
def updatr(ctx, device):
    bm = BtldrManager()
    bm.canbus = Bus(interface="socketcan", channel=device)
    ctx.obj = bm


"""
This is just a helpful function that takes a time delta (bascailly just a number
of milliseconds (or is it seconds? TODO)), subtracts it from the current time,
and returns a string that contains the resulting timestamp.

We use this in the ping command to display when the target device was flashed.
"""


def flash_time_string(delta):
    flashed_time = time.localtime(time.time() - delta)
    return time.strftime("%Y/%m/%d %H:%M:%S", flashed_time)


@updatr.command()
@click.argument("target_id")
@pass_btldr_manager
def ping(btldr_manager, target_id):
    while True:
        resp = btldr_manager.ping(int(target_id, 0), 1)
        ping_stats["sent"] += 1

        if resp is not None:
            ping_stats["received"] += 1
            print(
                "64 bytes from {common_name} ({btldr_id}): image={image} chip={chip} flashed={flashed}".format(
                    common_name="bms",  # TODO: hardcoded name
                    btldr_id=target_id,
                    image=resp["current_image"],
                    chip=resp["chip_id"],
                    flashed=flash_time_string(resp["time_delta"]),
                )
            )
            time.sleep(1 - resp["elapsed_time_ns"] / 1e9)
        else:
            print("No response")


@updatr.command()
@click.argument("target_id")
@click.argument("image_path")
@pass_btldr_manager
def flash(btldr_manager, target_id, image_path):
    btldr_manager.flash(int(target_id, 0), image_path, 1)


if __name__ == "__main__":
    signal.signal(signal.SIGINT, sigint)
    updatr()
