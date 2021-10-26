load("//bazel:defs.bzl", "cc_firmware")

cc_firmware(
    name = "bspd",
    srcs = [
        "bspd.c",
        "config.h",
    ],
    target_compatible_with = [
        "//bazel/constraints:atmega16m1",
    ],
    visibility = ["//visibility:public"],
    deps = [
        "//libs/adc",
        "//libs/can",
        "//libs/gpio",
        "//libs/timer",
    ],
)
