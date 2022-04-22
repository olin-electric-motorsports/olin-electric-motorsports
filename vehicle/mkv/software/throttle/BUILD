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
    target_compatible_with = [
        "//bazel/constraints:atmega16m1",
    ],
    visibility = ["//visibility:public"],
    deps = [
        ":can_api",
        ":utils",
        "//libs/adc",
        "//libs/can",
        "//libs/gpio",
        "//libs/timer",
    ],
)

cc_library(
    name = "utils",
    srcs = [
        "utils/timer.c",
    ],
    hdrs = [
        "utils/timer.h",
    ],
    target_compatible_with = [
        "//bazel/constraints:atmega16m1",
    ],
    visibility = ["//visibility:private"],
    deps = [
        "//libs/timer",
    ],
)

can_api_files(
    name = "can_api",
    dbc = "//vehicle/mkv:mkv.dbc",
    yaml = ":throttle.yml",
)
