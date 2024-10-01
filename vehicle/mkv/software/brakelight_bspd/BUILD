load("//bazel/tools:defs.bzl", "can_api_files")
load("//bazel:defs.bzl", "cc_firmware")

exports_files([
    "bspd.yml",
])

cc_firmware(
    name = "brakelight_bspd",
    srcs = [
        "bspd.c",
        "bspd_config.h",
    ],
    btldr = "//projects/btldr:brakelight_bspd_btldr",
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

can_api_files(
    name = "can_api",
    dbc = "//vehicle/mkv:mkv.dbc",
    yaml = ":bspd.yml",
)
