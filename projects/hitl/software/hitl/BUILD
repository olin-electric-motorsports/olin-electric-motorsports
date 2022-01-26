load("@rules_python//python:defs.bzl", "py_binary", "py_library")
load("@hitl_deps//:requirements.bzl", "requirement")

py_library(
    name = "utils",
    srcs = ["utils.py"],
    data = [
        "//projects/hitl/software/artifacts:config.ini",
        "//projects/hitl/software/artifacts:pin_info.csv",
    ],
    deps = [
        requirement("pyusb"),
    ],
    visibility = ["//visibility:private"],
)

py_library(
    name = "rkh",
    srcs = [
        "roadkillharness.py",
    ],
    visibility = ["//visibility:public"],
    deps = [
        ":hitl",
        ":utils",
    ],
)

py_library(
    name = "hitl",
    srcs = [
        "__init__.py",
        "cancontroller.py",
        "hitl.py",
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
