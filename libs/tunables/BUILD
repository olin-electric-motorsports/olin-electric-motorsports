load("@rules_cc//cc:defs.bzl", "cc_library")
load("@hitl_deps//:requirements.bzl", "requirement")

exports_files([
    "c_file.j2",
    "h_file.j2",
])

cc_library(
    name = "tunables",
    srcs = [
        "tunables.c",
    ],
    hdrs = ["api.h"],
    target_compatible_with = ["//bazel/constraints:avr"],
    visibility = ["//visibility:public"],
    deps = [
        "//libs/can",
    ],
)

py_binary(
    name = "shell",
    srcs = ["tunables_shell.py"],
    main = "tunables_shell.py",
    deps = [requirement("python-can")],
)

py_binary(
    name = "c_generator",
    srcs = ["c_generator.py"],
    main = "c_generator.py",
    visibility = ["//visibility:public"],
)
