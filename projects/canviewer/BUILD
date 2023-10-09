load("@rules_python//python:defs.bzl", "py_binary", "py_library")
load("//tools/pytest:defs.bzl", "pytest_test")

py_binary(
    name = "canviewer",
    srcs = [
        "canviewer.py",
        "utils.py",
    ],
    data = [
        ":config.yml",
        "//vehicle/mkv:mkv.dbc",
        "//vehicle/mkvi:mkvi.dbc",
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
