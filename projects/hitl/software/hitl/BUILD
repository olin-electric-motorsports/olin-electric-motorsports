load("@rules_python//python:defs.bzl", "py_binary", "py_library")
load("@hitl_deps//:requirements.bzl", "requirement")

py_library(
    name = "utils",
    srcs = ["utils.py"],
    data = [
        "//projects/hitl/software/artifacts:config.ini",
        "//projects/hitl/software/artifacts:pin_info.csv",
    ],
    visibility = ["//visibility:private"],
)

py_library(
    name = "rkh",
    srcs = [
        "roadkillharness.py",
    ],
    deps = [
        ":hitl",
        ":utils",
    ],
    visibility = ["//visibility:public"],
)

py_library(
    name = "hitl",
    srcs = [
        "__init__.py",
        "cancontroller.py",
        "ecu.py",
        "iocontroller.py",
    ],
    imports = ["."],
    visibility = ["//visibility:public"],
    deps = [
        ":utils",
        requirement("ft4222"),
        requirement("cantools"),
    ],
    srcs_version = "PY3",
)
