load("//bazel:defs.bzl", "cc_firmware")

cc_library(
    name = "hdrs",
    hdrs = [
        "api.h",
    ],
    visibility = ["//visibility:private"],
)

cc_library(
    name = "adc",
    srcs = [
        "adc.c",
    ],
    deps = [
        ":hdrs",
    ],
    visibility = ["//visibility:public"],
)

cc_firmware(
    name = "adc_test",
    srcs = [
        "test/adc_test.c",
    ],
    deps = [
        ":adc",
        "//libs/uart",
    ],
    visibility = ["//visibility:public"],
)
