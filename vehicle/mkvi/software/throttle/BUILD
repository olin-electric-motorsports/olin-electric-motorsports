load("//bazel/tools:defs.bzl", "can_api_files")
load("//bazel:defs.bzl", "cc_firmware")

exports_files([
    "throttle.yml",
])

cc_firmware(
    name = "throttle",
    srcs = [
        "throttle.c",
        "throttle_config.h",
    ],
    btldr = "//projects/btldr:throttle_btldr",
    target_compatible_with = [
        "//bazel/constraints:atmega16m1",
    ],
    visibility = ["//visibility:public"],
    deps = [
        ":can_api",
        "//libs/adc",
        "//libs/can",
        "//libs/gpio",
        "//libs/timer",
        "//projects/btldr:btldr_lib",
    ],
)

can_api_files(
    name = "can_api",
    dbc = "//vehicle/mkvi:mkvi.dbc",
    yaml = ":throttle.yml",
)
