load("//bazel:defs.bzl", "cc_firmware")
load("//bazel/tools:defs.bzl", "can_api_files")

"""
Runs on service section controller primary micro U1003, ATmega64m1
"""

cc_firmware(
    name = "bms",
    srcs = [
        "bms.c",
        "bms_config.h",
    ],
    target_compatible_with = ["//bazel/constraints:atmega64m1"],
    deps = [
        ":can_api",
        "//libs/gpio",
        "//libs/spi",
        "//libs/timer",
        "//vehicle/mkv/software/bms/bsp",
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
