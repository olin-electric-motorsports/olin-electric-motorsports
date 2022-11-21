load("//bazel:defs.bzl", "cc_firmware")
load("//bazel/tools:defs.bzl", "can_api_files")

"""
Runs on service section controller primary micro U1003, ATmega64m1
"""

cc_library(
    name = "bms_config",
    srcs = [
        "bms_config.c",
    ],
    hdrs = [
        "bms_config.h",
    ],
    target_compatible_with = [
        "//bazel/constraints:atmega16m1",
    ],
    visibility = ["//visibility:public"],
    deps = [
        "//libs/adc",
        "//libs/can",
        "//libs/gpio",
        "//libs/spi",
        "//libs/timer",
        "//vehicle/mkv/software/bms/ltc6811",
    ],
)

cc_firmware(
    name = "bms",
    srcs = [
        "bms.c",
    ],
    btldr = "//projects/btldr:bms_btldr",
    target_compatible_with = [
        "//bazel/constraints:atmega16m1",
    ],
    deps = [
        ":bms_config",
        ":can_api",
        "//libs/adc",
        "//libs/gpio",
        "//libs/spi",
        "//libs/timer",
        "//projects/btldr:btldr_lib",
        "//vehicle/mkv/software/bms/ltc6811",
        "//vehicle/mkv/software/bms/tasks:bms_tasks",
        "//vehicle/mkv/software/bms/utils",
    ],
)

exports_files([
    "bms.yml",
    "bms_config.h",
])

# Defines the CAN API library
can_api_files(
    name = "can_api",
    dbc = "//vehicle/mkv:mkv.dbc",
    yaml = ":bms.yml",
)
