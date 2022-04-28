load("//bazel:defs.bzl", "cc_firmware")
load("//bazel/tools:defs.bzl", "can_api_files")

cc_firmware(
    name = "lvbms",
    srcs = [
        "lvbms.c",
        "lvbms_config.h",
    ],
    target_compatible_with = [
        "//bazel/constraints:atmega16m1",
    ],
    visibility = ["//visibility:public"],
    deps = [
        ":can_api",
        "//libs/adc",
        "//libs/gpio",
        "//libs/timer",
        "//libs/spi",
        "//vehicle/mkv/software/lvbms/LTC6810"
    ],
)

exports_files([
    "lvbms.yml",
])

# Defines the CAN API library
can_api_files(
    name = "can_api",
    dbc = "//vehicle/mkv:mkv.dbc",
    yaml = ":lvbms.yml",
)