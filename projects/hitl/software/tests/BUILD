load("@rules_python//python:defs.bzl", "py_library")
load("//tools/pytest:defs.bzl", "pytest_test")

pytest_test(
    name = "hitl_unit_tests",
    srcs = [
        "unit/test_can.py",
        "unit/test_io.py",
        "unit/test_utils.py",
    ],
    data = [
        "//vehicle/mkv:mkv.dbc",
        "pytest.ini",
    ],
    imports = ["."],
    tags = [
        "hardware",
        "manual",
    ],
    deps = [
        ":conftest",
        "//projects/hitl/software/hitl",
    ],
)

py_library(
    name = "conftest",
    srcs = ["conftest.py"],
    deps = [
        "//projects/hitl/software/hitl",
    ],
)
