load("//bazel:defs.bzl", "kicad_hardware")

kicad_hardware(
    name = "nostril",
    schematic_files = ["nostril.kicad_sch"] + glob(
        ["*.kicad_sch"],
        ["nostril.kicad_sch"],
    ),
)
