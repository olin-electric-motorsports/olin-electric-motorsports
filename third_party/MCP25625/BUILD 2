load("@rules_cc//cc:defs.bzl", "cc_library")
load("//bazel:defs.bzl", "cc_firmware")

cc_library(
    name = "MCP25625",
    srcs = [
        "MCP25625.c",
    ],
    hdrs = [
        "MCP25625.h",
    ],
    target_compatible_with = [
        "//bazel/constraints:atmega16m1",
    ],
    deps = [
        "//libs/gpio",
        "//libs/timer",
        "//libs/spi",
    ],
    visibility = ["//visibility:public"],
)

