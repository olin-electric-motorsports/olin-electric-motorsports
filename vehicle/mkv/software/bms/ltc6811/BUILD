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
    ],
    deps = [
        ":bms_hardware",
    ],
    target_compatible_with = [
        "//bazel/constraints:avr",
    ],
    visibility = ["//visibility:private"],
)

cc_library(
    name = "bms_hardware",
    srcs = [
        "bms_hardware.cpp",
    ],
    hdrs = [
        "bms_hardware.h",
    ],
    deps = [
        "//libs/gpio",
        "//libs/spi",
    ],
    target_compatible_with = [
        "//bazel/constraints:avr",
    ],
    visibility = ["//visibility:private"],
)
