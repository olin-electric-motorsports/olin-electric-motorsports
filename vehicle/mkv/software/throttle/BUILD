load("//bazel/tools:defs.bzl", "can_api_files", "tunables_library")
load("//bazel:defs.bzl", "cc_firmware")

exports_files([
    "throttle.yml",
    "tunables.yml",
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
        ":utils",
        "//libs/adc",
        "//libs/can",
        "//libs/gpio",
        "//libs/timer",
        "//projects/btldr:btldr_lib",
    ],
)

tunables_library(
    name = "throttle_tunables",
    tunable_id = 0x6e0,
    yaml = ":tunables.yml",
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
