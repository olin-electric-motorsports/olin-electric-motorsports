load("//bazel:defs.bzl", "cc_firmware")
load("//bazel/tools:defs.bzl", "can_api_files")

cc_firmware(
    name = "fmc",
    srcs = [
        "fmc.c",
        "fmc_config.h",
    ],
    target_compatible_with = [
        "//bazel/constraints:atmega16m1",
    ],
    visibility = ["//visibility:public"],
    deps = [
        ":can_api",
        "//libs/adc",
        "//libs/timer",
    ],
)

exports_files([
    "fmc.yml",
    "motor_command.yml",
])

can_api_files(
    name = "can_api",
    dbc = "//vehicle/mkv:mkv.dbc",
    yaml = ":fmc.yml",
)
