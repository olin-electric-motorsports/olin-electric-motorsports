load("//bazel:defs.bzl", "cc_firmware")

cc_library(
    name = "super_blink",
    srcs = [
        "super_blink.c",
        "blink_config.h",
    ],
    deps = [
        "//libs/gpio",
        "//libs/timer",
        "//libs/can",
    ],
)