load("//bazel/tools:defs.bzl", "can_api_files")
load("//bazel:defs.bzl", "cc_firmware")

cc_firmware(
    name = "throttle",
    srcs = [
        "throttle.c",
        "throttle_config.h",
    ],
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
    ],
)

can_api_files(
    name = "can_api",
    dbc = "//vehicle/mkv:mkv.dbc",
    yaml = ":throttle.yml",
)
