load("@rules_cc//cc:defs.bzl", "cc_library")
load("//bazel:defs.bzl", "cc_firmware")

cc_library(
    name = "spi_legacy",
    srcs = [
        "legacy/spi.c",
    ],
    hdrs = [
        "legacy/spi.h",
    ],
    deprecation = "Please transition to the new library: //libs/spi",
    target_compatible_with = [
        "//bazel/constraints:atmega16m1",
    ],
    visibility = ["//visibility:public"],
)

cc_library(
    name = "hdrs",
    hdrs = [
        "api.h",
    ],
    visibility = ["//visibility:private"],
)

cc_library(
    name = "spi",
    srcs = [
        "spi.c",
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
        "//libs/gpio",
    ],
)

cc_firmware(
    name = "spi_legacy_test",
    srcs = [
        "legacy/main.c",
    ],
    visibility = ["//visibility:public"],
    deps = [
        ":spi_legacy",
    ],
)

cc_firmware(
    name = "spi_test",
    srcs = [
        "test/config.h",
        "test/main.c",
    ],
    target_compatible_with = [
        "//bazel/constraints:atmega16m1",
    ],
    visibility = ["//visibility:public"],
    deps = [
        ":spi",
        "//libs/gpio",
    ],
)

# Commented out until 328p support exists in Bazel
# cc_firmware(
#    name = "spi_test_328",
#     srcs = [
#         "test/main328.c",
#         "test/config328.h",
#     ],
#     target_compatible_with = [
#         "//bazel/constraints:atmega328p",
#     ],
#     visibility = ["//visibility:public"],
#     deps = [
#         ":spi",
#     ],
# )
