load("//bazel/tools:defs.bzl", "dbc_gen")

# Generates DBC
dbc_gen(
    name = "mkv.dbc",
    srcs = [
        "//libs/can/test:test.yml",
        "//vehicle/mkv/software/air_control:air.yml",
        "//vehicle/mkv/software/bms:bms.yml",
        "//vehicle/mkv/software/bms/charging:charging.yml",
        # "//vehicle/mkv/software/bms/tools:bms_sensing.yml",
        "//vehicle/mkv/software/brakelight_bspd:bspd.yml",
        "//vehicle/mkv/software/dashboard:dashboard.yml",
        "//vehicle/common/emeter:emeter.dbc",
        "//vehicle/common/motor_controller:motor_controller.dbc",
        "//vehicle/mkv/software/throttle:throttle.yml",
    ],
)
