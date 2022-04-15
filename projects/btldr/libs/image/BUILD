load("@rules_cc//cc:defs.bzl", "cc_library")

cc_library(
    name = "hdrs",
    hdrs = [
        "api.h",
    ],
    visibility = ["//visibility:public"],
)

cc_library(
    name = "image",
    srcs = [
        "image.c",
    ],
    target_compatible_with = [
        "//bazel/constraints:avr",
    ],
    visibility = ["//visibility:public"],
    deps = [
        ":hdrs",
        "//projects/btldr/libs/crc32",
    ],
)
