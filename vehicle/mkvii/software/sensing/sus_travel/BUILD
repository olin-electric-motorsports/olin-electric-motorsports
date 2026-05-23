load("//bazel/tools:defs.bzl", "can_api_files")
load("//bazel:defs.bzl", "cc_firmware")

exports_files([
    "sus_travel.yml",
])

cc_firmware(
    name = "sus_travel",
    srcs = [
        "sus_travel.c",
        "sus_travel.h",
    ],
    # btldr = "//projects/btldr:sus_travel_btldr",
    target_compatible_with = [
        "//bazel/constraints:atmega16m1",
    ],
    visibility = ["//visibility:public"],
    deps = [
        ":can_api",
        "//libs/adc",
        "//libs/can",
        "//libs/spi",
        "//libs/gpio",
        "//libs/timer",
        "//projects/btldr:btldr_lib",
    ],
)

can_api_files(
    name = "can_api",
    dbc = "//vehicle/mkvii:mkvii.dbc",
    yaml = "sus_travel.yml",
)
