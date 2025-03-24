load("//bazel:defs.bzl", "cc_firmware")
load("//bazel/tools:defs.bzl", "can_api_files")

cc_firmware(
    name = "bspd",
    srcs = [
        "bspd.c",
        "bspd.h",
    ],
    btldr = "//projects/btldr:bspd_btldr",
    target_compatible_with = [
        "//bazel/constraints:atmega16m1",
    ],
    visibility = ["//visibility:public"],
    deps = [
        ":can_api",
        "//libs/adc",
        "//libs/gpio",
        "//libs/timer",
        "//projects/btldr:btldr_lib",
    ],
)

exports_files([
    "bspd.yml",
])

can_api_files(
    name = "can_api",
    dbc = "//vehicle/mkvii:mkvii.dbc",
    yaml = ":bspd.yml",
)
