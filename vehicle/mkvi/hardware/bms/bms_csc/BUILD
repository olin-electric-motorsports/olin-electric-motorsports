load("//bazel:defs.bzl", "kicad_hardware")

kicad_hardware(
    name = "bms_csc",
    schematic_files = ["bms_csc.kicad_sch"] + glob(
        ["*.kicad_sch"],
        ["bms_csc.kicad_sch"],
    ),
)
