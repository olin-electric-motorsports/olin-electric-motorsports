load("@rules_python//python:defs.bzl", "py_binary", "py_library")
load("//tools/pytest:defs.bzl", "pytest_test")

py_binary(
    name = "canviewer",
    srcs = [
        "canviewer.py",
    ],
    data = [
        ":config.yml",
        "//vehicle/mkv:mkv.dbc",
    ],
    main = "canviewer.py",
    visibility = ["//visibility:public"],
    deps = [
        ":canserver",
        "//projects/canviewer/gui",
    ],
)

py_library(
    name = "canserver",
    srcs = [
        "canserver.py",
    ],
    visibility = ["//visibility:public"],
)
