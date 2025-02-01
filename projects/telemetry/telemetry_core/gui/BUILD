load("@rules_python//python:defs.bzl", "py_library")

py_library(
    name = "gui",
    srcs = [
        "gui.py",
        "tables.py",
        "utils.py",
    ],
    data = [
        ":logo.png",
        ":style.qss",
    ],
    visibility = ["//visibility:public"],
)
