load("@rules_python//python:defs.bzl", "py_binary", "py_library")
load("//tools/pytest:defs.bzl", "pytest_test")

py_binary(
    name = "telemetry_core",
    srcs = [
        "canviewer_telemetry.py",
        "utils.py",
    ],
    data = [
        ":config.yml",
        "//vehicle/mkv:mkv.dbc",
        "//vehicle/mkvi:mkvi.dbc",
    ],
    main = "canviewer_telemetry.py",
    visibility = ["//visibility:public"],
    deps = [
        ":telemetry_server",
        "//projects/telemetry/telemetry_core/gui",
    ],
)

py_library(
    name = "telemetry_server",
    srcs = [
        "telemetry_server.py",
    ],
    visibility = ["//visibility:public"],
)
