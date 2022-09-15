import signal
import time
import click
from formula.projects.btldr.py_client.btldr import BtldrManager
from can.interface import Bus

pass_btldr_manager = click.make_pass_decorator(BtldrManager)


# Sigint (Ctrl-C) handler. This function runs when the user presses Ctrl-C
def sigint(signum, frame):
    print(signum)


@click.group()
@click.option('-d', '--device', required=True, help='CAN network device')
@click.pass_context
def updatr(ctx, device):
    bm = BtldrManager()
    bm.canbus = Bus(interface="socketcan", channel=device)
    ctx.obj = bm

@updatr.command()
@click.argument('target_id')
@pass_btldr_manager
def ping(btldr_manager, target_id):
    while True:
        resp = btldr_manager.ping(int(target_id, 0), 1)

        if resp is not None:
            time.sleep(1 - resp["elapsed_time_ns"] * 1e9)
        else:
            print("Ping")

@updatr.command()
@click.argument('target_id')
@click.argument('image_path')
@pass_btldr_manager
def flash(btldr_manager, target_id, image_path):
    print(btldr_manager)
    print(target_id, image_path)

if __name__ == "__main__":
    signal.signal(signal.SIGINT, sigint)
    updatr()
