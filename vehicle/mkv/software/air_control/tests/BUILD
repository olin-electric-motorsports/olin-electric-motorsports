load("//tools/pytest:defs.bzl", "pytest_test")

pytest_test(
    name = "tests",
    srcs = [
        "conftest.py",
        "test_air.py",
        "test_initial_checks.py",
    ],
    data = [
        "//vehicle/mkv:mkv.dbc",
        "//vehicle/mkv/software/air_control",
    ],
    deprecation = "Old HitL library not around anymore; do not use this, will fail.",
    tags = ["manual"],
    target_compatible_with = [
        "//bazel/constraints:atmega16m1",
    ],
    deps = [
        "//projects/microhitl",
    ],
)
