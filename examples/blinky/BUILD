load("//bazel:defs.bzl", "cc_firmware")

cc_firmware(
    name = "blinky",
    srcs = ["main.c"],
    deps = [
        "//libs/uart",
    ],
    target_compatible_with = ["//bazel/constraints:avr"],
)
