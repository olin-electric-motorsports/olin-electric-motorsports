load("@rules_cc//cc:defs.bzl", "cc_library")
load("@rules_python//python:defs.bzl", "py_binary")
load("//bazel/tools:defs.bzl", "can_api_files")

exports_files([
    "can_print.yml",
    "can_print.py",
])

cc_library(
    name = "can_print",
    srcs = [
        "can_print.c",
    ],
    hdrs = ["can_print.h"],
    target_compatible_with = select({
        "//bazel/constraints:atmega16m1": [],
        "//conditions:default": ["//bazel/constraints:incompatible_mcu"],
    }),
    visibility = ["//visibility:public"],
    deps = [":can_api"],
)

can_api_files(
    name = "can_api",
    dbc = "//vehicle/mkvi:mkvi.dbc",
    yaml = ":can_print.yml",
)

py_binary(
    name = "can_print_decode",
    srcs = ["can_print.py"],
    main = "can_print.py",
    visibility = ["//visibility:public"],
)
