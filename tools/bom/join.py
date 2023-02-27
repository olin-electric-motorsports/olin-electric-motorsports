import click
import csv


@click.command()
@click.option(
    "-m",
    "--map",
    prompt="path to board bom list (.csv)",
    help="CSV of BOM paths and quantities",
    type=click.File(mode="r"),
)
@click.option(
    "-o",
    "--out",
    prompt="path to save bom",
    help="Completed BOM",
    type=click.File(mode="w"),
)
def cli(map, out):
    """Joins a set of BOMs and multiplies quantities"""
    reader = csv.reader(map, delimiter=",", quotechar='"')

    # check the columns that matter exist
    header = [i.lower() for i in next(reader)]
    try:
        name_col = header.index("name")
        count_col = header.index("count")
        bom_col = header.index("bom")
    except ValueError:
        click.echo("Columns 'Name', 'Count', and 'BOM' are required")
        exit(1)

    """
    schema
    {
        [DKPN]: {col: value, col2: value ...}
    }
    """
    unified_bom = {}

    fields = {}

    for row in reader:
        click.echo(f"Processing BOM for {row[name_col]}")
        board_count = int(row[count_col])
        try:
            with open(row[bom_col]) as bomfile:
                bom_reader = csv.DictReader(bomfile)

                for bom_row in bom_reader:
                    # for each row get the count and multiply
                    del bom_row["Ref"]
                    part_count = int(bom_row["Count"]) * board_count
                    # insert into total count
                    dkpn = bom_row["DKPN"]
                    print(f"{dkpn},{part_count}")
                    if not dkpn in unified_bom:
                        # initialize to 0
                        bom_row["Count"] = 0
                        unified_bom[dkpn] = bom_row  # keep all fields
                        for field in bom_row.keys():
                            fields[field] = True
                    unified_bom[dkpn]["Count"] += part_count

        except FileNotFoundError:
            click.echo(
                f"Missing BOM for {row[name_col]}. Could not open file {row[bom_col]}"
            )
            exit(1)

    # save bom
    final_bom = csv.DictWriter(out, fieldnames=fields.keys())
    final_bom.writeheader()
    for part in unified_bom.keys():
        final_bom.writerow(unified_bom[part])


if __name__ == "__main__":
    cli()
