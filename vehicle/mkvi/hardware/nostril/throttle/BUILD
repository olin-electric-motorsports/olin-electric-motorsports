load("//bazel:defs.bzl", "kicad_hardware")

kicad_hardware(
    name = "throttle",
    schematic_files = ["throttle.kicad_sch"] + glob(
        ["*.kicad_sch"],
        ["throttle.kicad_sch"],
    ),
)
