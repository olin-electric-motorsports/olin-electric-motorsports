load("//bazel:defs.bzl", "kicad_hardware")

kicad_hardware(
    name = "hitl-primary",
    schematic_files = ["primary_board.sch"] + glob(
        ["*.sch"],
        ["primary_board.sch"],
    ),
)