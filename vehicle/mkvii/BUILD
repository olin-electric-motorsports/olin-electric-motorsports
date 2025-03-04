load("//bazel/tools:defs.bzl", "dbc_gen")

# Generates DBC
dbc_gen(
    name = "mkvii.dbc",
    srcs = [
        "//vehicle/common/emeter:emeter.dbc",
        "//vehicle/common/gmeter:gmeter.dbc",
        "//vehicle/common/lpms-cu2:lpms-cu2.dbc",
        "//vehicle/common/cmdx200dx:cmdx200dx_controller.dbc",
        "//vehicle/mkvi/software/air_control:air.yml",
        "//vehicle/mkvi/software/bms:bms.yml",
        "//vehicle/mkvi/software/brakes:bspd.yml",
        "//vehicle/mkvi/software/charging:charger.yml",
        "//vehicle/mkvi/software/dashboard:dashboard.yml",
        "//vehicle/mkvii/software/throttle:throttle.yml",
    ],
)
