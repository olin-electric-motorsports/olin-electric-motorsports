load("//bazel:defs.bzl", "cc_firmware")

cc_firmware(
    name = "display_test",
    srcs = [
        "display_driver.c",
        "display_driver.h"
    ],
    target_compatible_with = ["//bazel/constraints:avr"],
    deps = [
        "//libs/gpio",
        "//libs/spi",
    ],
)
