# bazel build --config=16m1 -c opt //tutorials/power_distribution
load("//bazel:defs.bzl", "cc_firmware")

cc_firmware(
    name = "power_distribution",
    srcs = [
        "main.c",
        "power_distribution.c",
        "api.h",
    ],
    target_compatible_with = ["//bazel/constraints:avr"],
    deps = [
        "//libs/gpio",
    ],
)
