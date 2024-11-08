load("//bazel:defs.bzl", "cc_firmware")

cc_firmware(
    name = "timer_isr",
    srcs = [
        "timer_isr.c",
        "timer_isr.h",
    ],
    target_compatible_with = [
        "//bazel/constraints:atmega16m1",
    ],
    deps = [
        "//libs/gpio",
        "//libs/timer",
    ],
)
