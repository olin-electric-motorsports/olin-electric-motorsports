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
        "//bazel/constraints:atmega64m1",
    ],
    deps = [
        "//libs/adc",
        "//libs/can",
        "//libs/gpio",
        "//libs/spi",
        "//libs/timer",
        "//vehicle/mkv/software/bms/ltc6811",
    ],
    visibility = ["//visibility:public"],
)

cc_firmware(
    name = "bms",
    srcs = [
        "bms.c",
    ],
    target_compatible_with = [
        "//bazel/constraints:atmega64m1",
    ],
    deps = [
        ":bms_config",
        ":can_api",
        "//libs/adc",
        "//libs/gpio",
        "//libs/spi",
        "//libs/timer",
        "//vehicle/mkv/software/bms/utils",
        "//vehicle/mkv/software/bms/tasks:bms_tasks",
        "//vehicle/mkv/software/bms/ltc6811",
    ],
)

package(
    default_visibility = ["//visibility:public"],
)

exports_files([
    "bms.yml",
])

# Defines the CAN API library
can_api_files(
    name = "can_api",
    dbc = "//vehicle/mkv:mkv.dbc",
    yaml = ":bms.yml",
)
