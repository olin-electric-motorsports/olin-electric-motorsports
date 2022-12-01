load("//bazel:defs.bzl", "kicad_hardware")

kicad_hardware(
    name = "brakes",
    schematic_files = ["brakes.kicad_sch"] + glob(
        ["*.kicad_sch"],
        ["brakes.kicad_sch"],
    ),
)
