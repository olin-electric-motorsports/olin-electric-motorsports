load("//bazel:defs.bzl", "cc_firmware")

cc_firmware(
    name = "super_blink",
    srcs = [
        "blink_config.h",
        "super_blink.c",
    ],
    target_compatible_with = [
        "//bazel/constraints:atmega16m1",
    ],
    visibility = ["//visibility:public"],
    deps = [
        "//libs/can",
        "//libs/gpio",
        "//libs/timer",
    ],
)
