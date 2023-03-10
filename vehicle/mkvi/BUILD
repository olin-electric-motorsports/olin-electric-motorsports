load("//bazel/tools:defs.bzl", "dbc_gen")

# Generates DBC
dbc_gen(
    name = "mkvi.dbc",
    srcs = [
        "//libs/can/test:test.yml",
        "//vehicle/mkvi/software/emeter:emeter.dbc",
        "//vehicle/mkvi/software/motor_controller:motor_controller.dbc",
    ],
)
