load("@rules_python//python:defs.bzl", "py_binary", "py_library")
load("//tools/pytest:defs.bzl", "pytest_test")

py_library(
    name = "hitl",
    srcs = [
        "hitl.py",
        "gpio.py",
        "dac.py",
        "adc.py",
        "can.py"
    ],
    deps = [],
    visibility = ["//visibility:public"],
)

pytest_test(
    name = "unit",
    srcs = [
        "tests/test_gpio.py",
    ],
    imports = ["."],
    deps = [
        ":hitl",
    ]
)
