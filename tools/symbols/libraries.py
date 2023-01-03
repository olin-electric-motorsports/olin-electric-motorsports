import click

@click.group()
def cli():
    pass


@click.command()
@click.option('-s', '--source', prompt='path to symbol files', help='Symbol files directory', type=click.Path(file_okay=False,dir_okay=True,exists=True))
@click.option('-o', '--out', prompt='path to symbol library', help='Symbol library', type=click.Path(file_okay=True,dir_okay=False,exists=False))
def library(source, out):
    """Converts symbol files into a .kicad_sym library"""
    click.echo("hello")

@click.command()
@click.option('-s', '--source', prompt='path to symbol library', help='Symbol library', type=click.Path(file_okay=True,dir_okay=False,exists=True))
@click.option('-o', '--out', prompt='path to symbol files', help='Symbol files directory', type=click.Path(file_okay=False,dir_okay=True,exists=False))
def symbols(source, out):
    """Converts a .kicad_sym library into seprate symbol files"""
    click.echo("world")

if __name__ == '__main__':
    cli.add_command(library)
    cli.add_command(symbols)
    cli()