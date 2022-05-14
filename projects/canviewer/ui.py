from datetime import datetime
from rich.layout import Layout
from rich.panel import Panel
from rich.live import Live
from rich.table import Table


def render_dashboard(data) -> Layout:
    layout = Layout()

    layout.split(
        Layout(name="header", size=3),
        Layout(name="main", ratio=1),
        # Layout(name="footer", size=7),
    )

    grid = Table.grid(expand=True)
    grid.add_column(justify="center", ratio=1)
    grid.add_column(justify="right")
    grid.add_row(
        "[b]Olin Electric Motorsports[/b] CAN Dashbaord",
        datetime.now().ctime().replace(":", "[blink]:[/]"),
    )
    layout["header"].update(Panel(grid))

    layout["main"].split_row(
        Layout(name="left"),
        Layout(name="middle"),
        Layout(name="right"),
    )

    layout["left"].update(shutdown_table(data["SHUTDOWN_NODES"]))
    layout["middle"].update(value_table(data["VEHICLE_VALUES"]))
    layout["right"].update(state_table(data["VEHICLE_STATES"]))

    return layout


def value_table(values) -> Table:
    table = Table(expand=True)
    table.add_column("Name")
    table.add_column("Value")

    for i, (name, value) in enumerate(values.items()):
        table.add_row(name, value)

    return table


def shutdown_table(statuses) -> Table:
    """Make a new table."""
    table = Table(expand=True, border_style="green")
    table.add_column("NODE")
    table.add_column("STATUS")

    for i, (ecu, status) in enumerate(statuses.items()):
        table.add_row(ecu, status)

    return table


def state_table(statuses) -> Table:
    table = Table(expand=True, border_style="blue")

    table.add_column("ECU")
    table.add_column("State")
    table.add_column("Fault")

    for i, (ecu, states) in enumerate(statuses.items()):
        table.add_row(ecu, states[0], states[1])

    return table
