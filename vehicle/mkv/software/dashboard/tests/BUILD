load("//tools/pytest:defs.bzl", "pytest_test")

pytest_test(
    name = "tests",
    srcs = [
        "conftest.py",
        "test_dashboard.py",
        "test_initial_checks.py",
    ],
    data = [
        "//vehicle/mkv:mkv.dbc",
        "//vehicle/mkv/software/dashboard",
    ],
    target_compatible_with = [
        "//bazel/constraints:atmega16m1",
    ],
    deps = [
        "//projects/hitl/software/hitl",
    ],
)
