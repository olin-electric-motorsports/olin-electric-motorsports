load("@rules_cc//cc:defs.bzl", "cc_library")

cc_library(
    name = "ltc6811",
    srcs = [
        "ltc6811.c",
    ],
    hdrs = ["ltc6811.h"],
    target_compatible_with = [
        "//bazel/constraints:avr",
    ],
    visibility = ["//visibility:public"],
    deps = [
        ":ltc681x",
    ],
)

cc_library(
    name = "ltc681x",
    srcs = ["ltc681x.c"],
    hdrs = [
        "ltc681x.h",
    ],
    target_compatible_with = [
        "//bazel/constraints:avr",
    ],
    visibility = ["//visibility:public"],
    deps = [
        ":bms_hardware",
    ],
)

cc_library(
    name = "bms_hardware",
    srcs = [
        "bms_hardware.c",
    ],
    hdrs = [
        "bms_hardware.h",
    ],
    visibility = ["//visibility:private"],
    deps = [
        "//libs/gpio",
        "//libs/spi",
    ],
)
