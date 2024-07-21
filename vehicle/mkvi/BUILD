load("//bazel/tools:defs.bzl", "dbc_gen")

# Generates DBC
dbc_gen(
    name = "mkvi.dbc",
    srcs = [
        "//vehicle/mkvi/software/charging:charger.yml",
        "//vehicle/common/emeter:emeter.dbc",
        "//vehicle/common/gmeter:gmeter.dbc",
        "//vehicle/common/lpms-cu2:lpms-cu2.dbc",
        "//vehicle/common/motor_controller:motor_controller.dbc",
        "//vehicle/mkvi/software/bms:bms.yml",
        "//vehicle/mkvi/software/brakes:bspd.yml",
        "//vehicle/mkvi/software/air_control:air.yml",
    ],
)
