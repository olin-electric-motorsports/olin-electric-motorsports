load("//bazel:defs.bzl", "cc_firmware")

cc_firmware(
    name = "dashboard",
    srcs = [
        "dashboard.c",
        "dashboard_config.h",
    ],
    target_compatible_with = [
        "//bazel/constraints:atmega16m1",
    ],
    visibility = ["//visibility:public"],
    deps = [
        "//libs/can",
        "//libs/gpio",
        "//libs/timer",
        "//libs/adc"
    ],
)
