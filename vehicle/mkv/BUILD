load("//bazel/tools:defs.bzl", "dbc_gen")

# Generates DBC
dbc_gen(
    name = "mkv.dbc",
    srcs = [
        "//vehicle/mkv/software/air_control:air.yml",
        "//vehicle/mkv/software/brakelight_bspd:bspd.yml",
        "//vehicle/mkv/software/throttle:throttle.yml",
        "//vehicle/mkv/software/motor_controller:motor_controller.dbc",
    ],
)
