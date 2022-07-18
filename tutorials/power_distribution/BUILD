load("//bazel:defs.bzl", "cc_firmware")

cc_library(
    name = "power_distribution",
    srcs = [
        "power_distribution.c",
    ],
    hdrs = [
        "api.h",
    ],
    target_compatible_with = select({
        "//bazel/constraints:atmega16m1": [],
        "//bazel/constraints:atmega64m1": [],
        "//conditions:default": ["//bazel/constraints:incompatible_mcu"],
    }),
    visibility = ["//visibility:public"],
    deps = [
        "//libs/gpio",
    ],
)
