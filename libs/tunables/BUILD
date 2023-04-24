load("@rules_cc//cc:defs.bzl", "cc_library")

cc_library(
    name = "tunables",
    srcs = [
        "tunables.c",
    ],
    target_compatible_with = ["//bazel/constraints:avr"],
    visibility = ["//visibility:public"],
    deps = [
        "//libs/can",
    ],
)
