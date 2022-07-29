load("//bazel:defs.bzl", "cc_firmware")
load("//bazel/tools:defs.bzl", "can_api_files")

cc_firmware(
    name = "fmc",
    srcs = [
        "fmc.c",
        "fmc.h",
    ],
    visibility = ["//visibility:public"],
    deps = [
        ":can_api",
        "//libs/timer",
        "//libs/adc",
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

    
