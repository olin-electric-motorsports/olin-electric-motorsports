import signal
import time
import click
from formula.projects.btldr.py_client.btldr import BtldrManager
from can.interface import Bus

pass_btldr_manager = click.make_pass_decorator(BtldrManager)


# Sigint (Ctrl-C) handler. This function runs when the user presses Ctrl-C
exit_flag = False
ping_stats = {
    "sent": 0,
    "received": 0,
}

def sigint(signum, frame):
    global exit_flag

    if not exit_flag:
        exit_flag = True
        print("\n--- ping statistics ---")

        print("{sent} packets transmitted, {received} received".format(
            sent=ping_stats["sent"],
            received=ping_stats["received"],
        ))

        exit(0)


@click.group()
@click.option('-d', '--device', required=True, help='CAN network device')
@click.pass_context
def updatr(ctx, device):
    bm = BtldrManager()
    bm.canbus = Bus(interface="socketcan", channel=device)
    ctx.obj = bm


def flash_time_string(delta):
    flashed_time = time.localtime(time.time() - delta)
    return time.strftime("%Y/%m/%d %H:%M:%S", flashed_time)

@updatr.command()
@click.argument('target_id')
@pass_btldr_manager
def ping(btldr_manager, target_id):
    while True:
        resp = btldr_manager.ping(int(target_id, 0), 1)
        ping_stats["sent"] += 1

        if resp is not None:
            ping_stats["received"] += 1
            print("64 bytes from {common_name} ({btldr_id}): image={image} chip={chip} flashed={flashed}".format(
                common_name="bms",
                btldr_id=target_id,
                image=resp["current_image"],
                chip=resp["chip_id"],
                flashed=flash_time_string(resp["time_delta"]),
            ))
            time.sleep(1 - resp["elapsed_time_ns"] / 1e9)
        else:
            print("No response")

@updatr.command()
@click.argument('target_id')
@click.argument('image_path')
@pass_btldr_manager
def flash(btldr_manager, target_id, image_path):
    btldr_manager.flash(int(target_id, 0), image_path, 1)

if __name__ == "__main__":
    signal.signal(signal.SIGINT, sigint)
    updatr()
