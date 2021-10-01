load("//bazel:defs.bzl", "cc_firmware")

cc_firmware(
    name = "blinky",
    srcs = [
        "main.c",
        "config.h",
    ],
    deps = [
        "//libs/gpio",
    ],
    target_compatible_with = ["//bazel/constraints:avr"],
    deps = [
        "//libs/uart",
    ],
)
