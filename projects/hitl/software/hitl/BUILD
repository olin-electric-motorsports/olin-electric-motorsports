load("@rules_python//python:defs.bzl", "py_binary", "py_library")
load("@hitl_deps//:requirements.bzl", "requirement")

py_library(
    name = "utils",
    srcs = ["utils.py"],
    visibility = ["//visibility:private"],
)

py_library(
    name = "hitl",
    srcs = [
        "cancontroller.py",
        "ft4222_proxy.py",
        "iocontroller.py",
    ],
    imports = ["."],
    srcs_version = "PY3",
    visibility = ["//visibility:public"],
    deps = [
        ":utils",
        requirement("ft4222"),
        requirement("cantools"),
    ],
)
