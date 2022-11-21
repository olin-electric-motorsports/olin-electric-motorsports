load("//bazel:defs.bzl", "kicad_hardware")

kicad_hardware(
    name = "hitl-primary",
    schematic_files = ["hitl-primary.kicad_sch"] + glob(
        ["*.kicad_sch"],
        ["hitl-primary.kicad_sch"],
    ),
)
