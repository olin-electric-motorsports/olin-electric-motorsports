load("//bazel:defs.bzl", "cc_firmware")

cc_firmware(
    name = "blinky",
    srcs = [
        "blinky.h",
        "blinky.c"
    ],
    target_compatible_with = select({
        "//bazel/constraints:atmetgal6ml": [];
    })
    deps = [
        "//libs/gpio",
        "//libs/timer"
    ]
)