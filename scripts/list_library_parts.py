#
# Example python script to generate a BOM from a KiCad generic netlist
#
# Example: Sorted and Grouped CSV BOM
#

"""
  @package
  Output: symbols and footprints, newline separated
  Fields: Name, Footprint

  Command line:
  python "pathToFile/list_library_parts.py" "%I" "%O-symbols" "%O-footprints"
"""

# Import the KiCad python helper module and the csv formatter
import kicad_netlist_reader
import kicad_utils
import csv
import sys

# Generate an instance of a generic netlist, and load the netlist tree from
# the command line option. If the file doesn't exist, execution will stop
net = kicad_netlist_reader.netlist(sys.argv[1])

# Open a file to write to, if the file cannot be opened output to stdout
# instead
try:
    f_sym = kicad_utils.open_file_writeUTF8(sys.argv[2], "w")
    f_foot = kicad_utils.open_file_writeUTF8(sys.argv[3], "w")
except IOError:
    e = "Can't open output file for writing: " + sys.argv[2]
    print(__file__, ":", e, sys.stderr)
    exit(1)


def componentEqual(self, other):
    if self.getPartName() == other.getPartName():
        if self.getFootprint() == other.getFootprint():
            return True
    return False


# override comparison operator used in grouping
kicad_netlist_reader.comp.__eq__ = componentEqual

# Get all of the components in groups of matching parts + values
# (see ky_generic_netlist_reader.py)

grouped = net.groupComponents()

# Output all of the component information
for group in grouped:
    refs = []

    # Add the reference of every component in the group and keep a reference
    # to the component so that the other data can be filled in once per group
    for c in group:
        if not (c.getPartName() == c.getValue()):
            print(
                f"warning: component part name and value do not match {c.getPartName()} - {c.getValue()}"
            )
        if not (c.getField("MPN")):
            print(f"warning: component missing MPN {c.getPartName()}")

    f_sym.write(f"{c.getLibName()}:{c.getPartName()}\n")
    f_foot.write(c.getFootprint() + "\n")
