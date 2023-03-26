import click
import datetime
import glob
import os
import re


@click.group()
def cli():
    pass


@click.command()
@click.option(
    "-s",
    "--source",
    prompt="path to symbol files",
    help="Symbol files directory",
    type=click.Path(file_okay=False, dir_okay=True, exists=True),
)
@click.option(
    "-o",
    "--out",
    prompt="path to symbol library",
    help="Symbol library",
    type=click.File(mode="w"),
)
def symbols2library(source, out):
    """Converts symbol files into a .kicad_sym library"""
    # library header
    fixed_version = "20211014"
    header = (
        "(kicad_symbol_lib (version " + fixed_version + ") (generator symbol2library)\n"
    )
    out.write(header)

    # get a list of all the complete symbol files
    symbols = glob.glob(source + "/*.symbol")
    # symbol files that extend other symbols need to be at the end
    derived_symbols = glob.glob(source + "/*.derived-symbol")
    for symbol in symbols + derived_symbols:
        # copy contents of file to the library file
        # files should include a ending newline (other converter ensures this)
        with click.open_file(symbol, "r") as f:
            while True:
                line = f.readline()
                if not line:  # stop at end of file
                    break
                out.write("  ")  # indent one level
                out.write(line)
    # final closed paren
    out.write(")")


@click.command()
@click.option(
    "-s",
    "--source",
    prompt="path to symbol library",
    help="Symbol library",
    type=click.File(),
)
@click.option(
    "-o",
    "--out",
    prompt="path to symbol files",
    help="Symbol files directory",
    type=click.Path(file_okay=False, dir_okay=True, exists=False),
)
def library2symbols(source, out):
    """Converts a .kicad_sym library into seprate symbol files"""
    # create output directory if it doesn't exist
    try:
        os.makedirs(out)
    except:
        click.echo(
            "warning: output directory already exists. Deleted symbols may not be reflected."
        )
    # read library file in and split into seprate files
    header = source.readline()  # ignore header
    # read file line by line
    while True:
        line = source.readline()
        if not line:  # stop at end of file
            break
        # assumes files are well-formatted (properly indented)
        if line[0] == ")":  # end of file
            break
        line = line[2:]  # remove first two spaces (un-indent 1 level)
        if line[0] == "(":  # start of symbol
            match = re.search(r'\(symbol "([^"]*)" \((extends)?', line)
            buffer = line
            symbol_name = match.group(1)
            is_derived = True if match.group(2) else False
        elif line[0] == ")":  # end of symbol
            buffer += line
            # save symbol contents to file
            file_name = (
                out
                + "/"
                + symbol_name
                + (".derived-symbol" if is_derived else ".symbol")
            )
            with click.open_file(file_name, "w") as f:
                f.write(buffer)
        else:  # body of symbol
            buffer += line


if __name__ == "__main__":
    cli.add_command(symbols2library)
    cli.add_command(library2symbols)
    cli()
