load("@rules_python//python:defs.bzl", "py_binary", "py_library")
load("//tools/pytest:defs.bzl", "pytest_test")

pytest_test(
    name = "hitl",
    srcs = [
        "__init__.py",
        "test_main.py",
        "throttle_test.py",
    ],
    imports = ["."],
    deps = [
        ":conftest",
        "//projects/hitl/software/hitl:rkh",
    ],
)

py_library(
    name = "conftest",
    srcs = ["conftest.py"],
    deps = [
        "//projects/hitl/software/hitl:rkh",
    ],
)
