load("//bazel:defs.bzl", "cc_firmware")

cc_firmware(
    name = "blinky",
    srcs = [
        "config.h",
        "main.c",
    ],
    target_compatible_with = ["//bazel/constraints:avr"],
    deps = [
        "//libs/gpio",
        "//libs/uart",
    ],
)
