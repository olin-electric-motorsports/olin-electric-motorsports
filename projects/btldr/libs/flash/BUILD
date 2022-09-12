load("@rules_cc//cc:defs.bzl", "cc_library")

cc_library(
    name = "flash",
    srcs = [
        "flash.c",
    ],
    hdrs = [
        "api.h",
    ],
    target_compatible_with = [
        "//bazel/constraints:avr",
    ],
    visibility = ["//visibility:public"],
)
