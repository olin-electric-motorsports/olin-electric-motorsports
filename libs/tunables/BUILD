load("//bazel:defs.bzl", "cc_library")

cc_library(
    name = "tunables",
    srcs = [
        "main.c",
    ],
    target_compatible_with = ["//bazel/constraints:avr"],
    deps = [
        "//libs/can",
    ],
)
