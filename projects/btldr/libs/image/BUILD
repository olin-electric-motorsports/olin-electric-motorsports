load("@rules_cc//cc:defs.bzl", "cc_library")

cc_library(
    name = "image",
    srcs = [
        "image.c",
    ],
    hdrs = [
        "api.h",
    ],
    target_compatible_with = [
        "//bazel/constraints:avr",
    ],
    visibility = ["//visibility:public"],
    deps = [
        "//projects/btldr/libs/crc32",
    ],
)
