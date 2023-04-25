load("@rules_python//python:defs.bzl", "py_binary", "py_library")
load("//tools/pytest:defs.bzl", "pytest_test")
load("@hitl_deps//:requirements.bzl", "requirement")

py_library(
    name = "hitl",
    srcs = [
        "hitl.py",
        "gpio.py",
        "dac.py",
        "adc.py",
        "can.py"
    ],
    deps = [
        requirement("ft4222"),
    ],
    visibility = ["//visibility:public"],
)

pytest_test(
    name = "unit",
    srcs = [
        "tests/test_hitl.py",
        "tests/test_gpio.py",
        "tests/test_dac.py",
    ],
    imports = ["."],
    deps = [
        ":hitl",
    ]
)

pytest_test(
    name = "hw",
    srcs = [
        "tests/test_hitl.py",
    ],
    tags = ["manual"],
    imports = ["."],
    deps = [
        ":hitl",
    ],
)
