load("@rules_cc//cc:defs.bzl", "cc_library")

cc_library(
    name = "tunables",
    srcs = [
        "tunables.c",
    ],
    hdrs = [
        "tunables.h"
    ],
    target_compatible_with = ["//bazel/constraints:avr"],
    deps = [
        "//libs/can",
    ],
    visibility = ["//visibility:public"],
)