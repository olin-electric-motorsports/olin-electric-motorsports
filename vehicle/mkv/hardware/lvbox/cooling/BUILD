load("//bazel:defs.bzl", "kicad_hardware")

kicad_hardware(
    name = "cooling_sense",
    schematic_files = ["cooling_sense.kicad_sch"] + glob(
        ["*.kicad_sch"],
        ["cooling_sense.kicad_sch"],
    ),
)
