load("@rules_python//python:defs.bzl", "py_binary", "py_library")
load("//tools/pytest:defs.bzl", "pytest_test")
load("@pydeps//:requirements.bzl", "requirement")

py_library(
    name = "hitl",
    srcs = [
        "adc.py",
        "can_controller.py",
        "dac.py",
        "gpio.py",
        "hitl.py",
    ],
    visibility = ["//visibility:public"],
    deps = [
        requirement("ft4222"),
        requirement("python-can"),
        requirement("cantools"),
    ],
)

pytest_test(
    name = "unit",
    srcs = [
        "tests/test_dac.py",
        "tests/test_gpio.py",
        # "tests/test_hitl.py",
    ],
    imports = ["."],
    deps = [
        ":hitl",
    ],
)

pytest_test(
    name = "hw",
    srcs = [
        "tests/test_hitl.py",
    ],
    imports = ["."],
    tags = [
        "hardware",
        "manual",
    ],
    deps = [
        ":hitl",
    ],
)
