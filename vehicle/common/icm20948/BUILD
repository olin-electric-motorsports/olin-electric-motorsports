load("@rules_cc//cc:defs.bzl", "cc_library")

cc_library(
    name = "icm20948",
    srcs = [
        "icm20948.c",
    ],
    hdrs = ["icm20948.h"],
    target_compatible_with = [
        "//bazel/constraints:avr",
    ],
    visibility = ["//visibility:public"],
    deps = [
        "//libs/spi",
        # "//projects/can_print",
    ],
)
