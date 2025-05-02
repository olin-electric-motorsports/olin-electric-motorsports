load("//bazel:defs.bzl", "cc_firmware")
load("//bazel/tools:defs.bzl", "can_api_files")

cc_library(
    name = "bms_config",
    srcs = [
        "bms_config.c",
    ],
    hdrs = [
        "bms_config.h",
    ],
    target_compatible_with = select({
        "//bazel/constraints:atmega16m1": [],
        "//bazel/constraints:atmega64m1": [],
        "//conditions:default": ["//bazel/constraints:incompatible_mcu"],
    }),
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
<<<<<<< HEAD
    # btldr = "//projects/btldr:bms_btldr",
=======
    btldr = "//projects/btldr:bms_btldr",
>>>>>>> rishit/final-bms
    target_compatible_with = select({
        "//bazel/constraints:atmega16m1": [],
        "//bazel/constraints:atmega64m1": [],
        "//conditions:default": ["//bazel/constraints:incompatible_mcu"],
    }),
    deps = [
        ":bms_config",
        ":can_api",
        "//libs/adc",
        "//libs/gpio",
        "//libs/spi",
        "//libs/timer",
<<<<<<< HEAD
        # "//projects/btldr:btldr_lib",
=======
        "//projects/btldr:btldr_lib",
>>>>>>> rishit/final-bms
        "//vehicle/common/ltc6811:ltc681x",
        "//vehicle/mkvii/software/bms/tasks:bms_tasks",
        "//vehicle/mkvii/software/bms/utils:bms_utils",
    ],
)

exports_files([
    "bms.yml",
    "bms_config.h",
])

# Defines the CAN API library
can_api_files(
    name = "can_api",
    dbc = "//vehicle/mkvii:mkvii.dbc",
    yaml = ":bms.yml",
)
