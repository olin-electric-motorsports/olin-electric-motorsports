load("//bazel:defs.bzl", "cc_firmware")

cc_firmware(
    name = "super_blink",
    srcs = [
        "blink_config.h",
        "super_blink.c",
    ],
    target_compatible_with = ["//bazel/constraints:avr"],
    deps = [
        "//libs/gpio",
        "//libs/timer",
    ],
)
