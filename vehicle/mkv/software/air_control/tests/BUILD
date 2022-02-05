load("//tools/pytest:defs.bzl", "pytest_test")

pytest_test(
    name = "tests",
    srcs = [
        "test_initial_checks.py",
        "conftest.py",
    ],
    data = [
        "//vehicle/mkv:mkv.dbc",
        "//vehicle/mkv/software/air_control",
    ],
    deps = [
        "//projects/hitl/software/hitl",
        "//projects/microhitl",
    ],
    target_compatible_with = [
        "//bazel/constraints:atmega16m1",
    ],
)
