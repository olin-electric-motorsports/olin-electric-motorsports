load("//bazel:defs.bzl", "cc_firmware")

cc_library(
    name = "hdrs",
    hdrs = [
        "api.h",
    ],
    visibility = ["//visibility:private"],
)

cc_library(
    name = "timer",
    srcs = [
        "timer.c",
    ],
    deps = [
        ":hdrs",
    ],
    target_compatible_with = [
        "//bazel/constraints:atmega16m1",
    ],
    visibility = ["//visibility:public"],
)

cc_firmware(
    name = "timer_test",
    srcs = [
        "test/main.c",
        "test/config.h",
    ],
    deps = [
        ":timer",
        "//libs/uart",
    ],
    visibility = ["//visibility:public"],
)
