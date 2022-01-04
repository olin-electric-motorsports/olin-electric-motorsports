load("//bazel/tools:defs.bzl", "can_api_files")
load("//bazel:defs.bzl", "cc_firmware")

exports_files([
    "bspd.yml",
])

cc_firmware(
    name = "bspd",
    srcs = [
        "bspd.c",
        "bspd_config.h",
    ],
    target_compatible_with = [
        "//bazel/constraints:atmega16m1",
    ],
    deps = [
        ":can_api",
        "//libs/adc",
        "//libs/gpio",
        "//libs/timer",
    ],
    visibility = ["//visibility:public"],
)

can_api_files(
    name = "can_api",
    yaml = ":bspd.yml",
    dbc = "//vehicle/mkv:mkv.dbc",
)
