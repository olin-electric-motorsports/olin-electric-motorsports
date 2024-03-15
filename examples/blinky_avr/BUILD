load("//bazel:defs.bzl", "cc_firmware")

cc_firmware(
    name = "blinky_avr",
    srcs = [
        "main.c",
    ],
    target_compatible_with = ["//bazel/constraints:avr"],
    deps = [
        "//libs/gpio",
    ],
)
