"""
  @package
  Output: CSV (comma-separated)
  Grouped By: Value, Footprint
  Sorted By: Ref
  Fields: Ref, Qnty, MPN, Footprint

  Command line:
  python "pathToFile/kicad_bom_custom.py" "%I" "%O.csv"
"""

# Import the KiCad python helper module and the csv formatter
import kicad_netlist_reader
import kicad_utils
import csv
import sys

# A helper function to filter/convert a string read in netlist
# currently: do nothing


def fromNetlistText(aText):
  return aText


# Generate an instance of a generic netlist, and load the netlist tree from
# the command line option. If the file doesn't exist, execution will stop
net = kicad_netlist_reader.netlist(sys.argv[1])

# Open a file to write to, if the file cannot be opened output to stdout
# instead
try:
  f = kicad_utils.open_file_writeUTF8(sys.argv[2], 'w')
except IOError:
  e = "Can't open output file for writing: " + sys.argv[2]
  print(__file__, ":", e, sys.stderr)
  f = sys.stdout

# Create a new csv writer object to use as the output formatter
out = csv.writer(f, delimiter=',', quotechar='\"', quoting=csv.QUOTE_ALL)

# Output a column header
out.writerow(['Ref', 'Qnty', 'MPN', 'Footprint'])


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
  for component in group:
    refs.append(fromNetlistText(component.getRef()))
    c = component
    #if not (c.getPartName() == c.getValue()):
      #print(f"warning: component part name and value do not match {c.getPartName()} - {c.getValue()}")
    if not (c.getField("MPN")):
      print(f"warning: component missing MPN {component.getPartName()}")

  # Fill in the component groups common data

  out.writerow([", ".join(refs), len(group),
                fromNetlistText(c.getPartName("MPN")),
                fromNetlistText(c.getFootprint())])
