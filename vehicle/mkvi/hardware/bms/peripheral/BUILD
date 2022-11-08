load("//bazel:defs.bzl", "kicad_hardware")

kicad_hardware(
    name = "peripheral",
    schematic_files = ["peripheral.kicad_sch"] + glob(
        ["*.kicad_sch"],
        ["peripheral.kicad_sch"],
    ),
)
