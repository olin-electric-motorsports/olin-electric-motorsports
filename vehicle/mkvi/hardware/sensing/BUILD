load("//bazel:defs.bzl", "kicad_hardware")

kicad_hardware(
    name = "sensing_controller",
    schematic_files = ["sensing_controller.kicad_sch"] + glob(
        ["*.kicad_sch"],
        ["sensing_controller.kicad_sch"],
    ),
)
