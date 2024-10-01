load("//bazel:defs.bzl", "cc_firmware")
load("@rules_cc//cc:defs.bzl", "cc_library")
load("//bazel/tools:defs.bzl", "can_api_files")

exports_files([
    "test.yml",
])

can_api_files(
    name = "test_can_api",
    dbc = "//vehicle/mkv:mkv.dbc",
    yaml = ":test.yml",
)

cc_firmware(
    name = "test_app",
    srcs = ["test_app.c"],
    target_compatible_with = select({
        "//bazel/constraints:atmega16m1": [],
        "//bazel/constraints:atmega64m1": [],
        "//conditions:default": ["//bazel/constraints:incompatible_mcu"],
    }),
    visibility = ["//visibility:public"],
    deps = [
        ":test_can_api",
        "//libs/can",
        "//libs/gpio",
        "//libs/timer",
    ],
)

cc_test(
    name = "utest",
    srcs = ["utest.c"],
    visibility = ["//visibility:public"],
    deps = [
        "//libs/can:mock",
    ],
)
