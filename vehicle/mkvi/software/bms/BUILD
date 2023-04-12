load("//bazel:defs.bzl", "cc_firmware")
load("//bazel/tools:defs.bzl", "can_api_files")

cc_library(
    name = "bms_config",
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
        "//vehicle/common/ltc6811:ltc681x",
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
        ":can_api",
        "//libs/adc",
        "//libs/gpio",
        "//libs/spi",
        "//libs/timer",
        "//projects/btldr:btldr_lib",
        "//vehicle/common/ltc6811:ltc681x",
        "//vehicle/mkvi/software/bms/tasks:bms_tasks",
        "//vehicle/mkvi/software/bms/utils:bms_utils",
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
