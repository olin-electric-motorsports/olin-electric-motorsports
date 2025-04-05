load("//bazel/tools:defs.bzl", "dbc_gen")

# Generates DBC
dbc_gen(
    name = "mkvii.dbc",
    srcs = [
        "//vehicle/common/emeter:emeter.dbc",
        "//vehicle/common/gmeter:gmeter.dbc",
        "//vehicle/common/lpms-cu2:lpms-cu2.dbc",
        "//vehicle/common/motor_controller:motor_controller.dbc",
        "//vehicle/mkvii/software/pdu:pdu.yml",
    ],
)
