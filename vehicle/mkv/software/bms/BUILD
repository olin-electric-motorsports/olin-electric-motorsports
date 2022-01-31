load("//bazel/tools:defs.bzl", "can_api_files")
load("//bazel:defs.bzl", "cc_firmware")

exports_files([
    "bms.yml",
])

cc_firmware(
    name = "bms",
    srcs = [
        "bms.c",
        "bms_config.h",
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
    ],
)

can_api_files(
    name = "can_api",
    dbc = "//vehicle/mkv:mkv.dbc",
    yaml = ":bms.yml",
)
