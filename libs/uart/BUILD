load("@rules_cc//cc:defs.bzl", "cc_library")

cc_library(
    name = "hdrs",
    hdrs = [
        "api.h",
    ],
    visibility = ["//visibility:private"],
)

cc_library(
    name = "uart",
    srcs = [
        "uart.c",
    ],
    target_compatible_with = select({
        "//bazel/constraints:atmega16m1": [],
        "//bazel/constraints:atmega64m1": [],
        "//bazel/constraints:atmega328p": [],
        "//conditions:default": ["//bazel/constraints:incompatible_mcu"],
    }),
    visibility = ["//visibility:public"],
    deps = [
        ":hdrs",
    ],
)
