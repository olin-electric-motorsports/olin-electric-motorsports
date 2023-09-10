# bazel build --config=16m1 -c opt //tutorials/power_distribution
load("//bazel:defs.bzl", "cc_firmware")

cc_firmware(
    name = "power_distribution",
    srcs = [
        "api.h",
        "main.c",
        "power_distribution.c",
    ],
    target_compatible_with = ["//bazel/constraints:avr"],
    deps = [
        "//libs/gpio",
    ],
)
