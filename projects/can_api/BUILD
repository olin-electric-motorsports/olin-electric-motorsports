load("@rules_python//python:defs.bzl", "py_binary", "py_library")
load("//tools/pytest:defs.bzl", "pytest_test")

py_library(
    name = "yaml_handler",
    srcs = [
        "yaml_handler.py",
    ],
    visibility = ["//visibility:public"],
    deps = [
        "@cantools_//:cantools_lib",
    ],
)

py_binary(
    name = "dbc_generator",
    srcs = [
        "dbc_generator.py",
    ],
    main = "dbc_generator.py",
    deps = [
        ":yaml_handler",
    ],
    visibility = ["//visibility:public"],
)

py_binary(
    name = "c_generator",
    srcs = [
        "c_generator.py",
        "yaml_handler.py",
        "utils.py",
    ],
    data = [
        "//projects/can_api/files/c_templates:c_file.j2",
        "//projects/can_api/files/c_templates:h_file.j2",
    ],
    main = "c_generator.py",
    visibility = ["//visibility:public"],
    deps = [
        ":yaml_handler",
    ],
)
