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
    target_compatible_with = select({
        "//bazel/constraints:atmega16m1": [],
        "//bazel/constraints:atmega64m1": [],
        "//conditions:default": ["//bazel/constraints:incompatible_mcu"],
    }),
    visibility = ["//visibility:public"],
    deps = [
        ":hdrs",
    ],
)

cc_firmware(
    name = "adc_test",
    srcs = [
        "test/adc_test.c",
    ],
    visibility = ["//visibility:public"],
    deps = [
        ":adc",
        "//libs/uart",
    ],
)
