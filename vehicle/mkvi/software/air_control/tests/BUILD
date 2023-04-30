load("//tools/pytest:defs.bzl", "pytest_test")

pytest_test(
    name = "tests",
    srcs = [
        "conftest.py",
        "test_air.py",
        "test_initial_checks.py",
    ],
    data = [
        "//vehicle/mkvi:mkvi.dbc",
        "//vehicle/mkvi/software/air_control:air_control_patched.bin",
    ],
    target_compatible_with = [
        "//bazel/constraints:atmega16m1",
    ],
    deps = [
        "//projects/btldr/py_client:btldr",
        "//projects/hitl/lib:hitl",
    ],
)
