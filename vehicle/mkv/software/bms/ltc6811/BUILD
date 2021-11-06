load("@rules_cc//cc:defs.bzl", "cc_library")

cc_library(
    name = "ltc6811",
    srcs = [
        "ltc6811.cpp",
    ],
    hdrs = ["ltc6811.h"],
    deps = [
        ":ltc681x",
    ],
    target_compatible_with = [
        "//bazel/constraints:avr",
    ],
    visibility = ["//visibility:public"],
)

cc_library(
    name = "ltc681x",
    srcs = ["ltc681x.cpp"],
    hdrs = [
        "ltc681x.h",
        "spi_translator.h"
    ],
    deps = [
        "//libs/spi",
    ],
    target_compatible_with = [
        "//bazel/constraints:avr",
    ],
    visibility = ["//visibility:private"],
)
