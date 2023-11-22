load("//bazel:defs.bzl", "cc_firmware")

cc_firmware(
    name = "super_blink",
    srcs = [
        "blink_config.h"
    ],
    target_compatible_with = select({
        "//bazel/constraints:atmega16m1": [],
        "//bazel/constraints:atmega64m1": [],
        "//conditions:default": ["//bazel/constraints:incompatible_mcu"],
    }),
    deps = [
        ":timer",
        "//libs/can",
        "//libs/timer",
        "//libs/gpio"
    ]
)