load("//bazel/tools:defs.bzl", "dbc_gen")

# Generates DBC
dbc_gen(
    name = "mkvi.dbc",
    srcs = [
        "//vehicle/common/emeter:emeter.dbc",
        "//vehicle/common/motor_controller:motor_controller.dbc",
        "//vehicle/mkvi/software/air_control:air.yml",
        "//vehicle/mkvi/software/bms:bms.yml",
        "//vehicle/mkvi/software/bms/charging:charging.yml",
        "//vehicle/mkvi/software/brakes:bspd.yml",
        "//vehicle/mkvi/software/dashboard:dashboard.yml",
        "//vehicle/mkvi/software/throttle:throttle.yml",
    ],
)
