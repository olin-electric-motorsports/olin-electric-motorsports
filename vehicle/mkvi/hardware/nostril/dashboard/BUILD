load("//bazel:defs.bzl", "kicad_hardware")

kicad_hardware(
    name = "dashboard",
    schematic_files = ["dashboard.kicad_sch"] + glob(
        ["*.kicad_sch"],
        ["dashboard.kicad_sch"],
    ),
)
