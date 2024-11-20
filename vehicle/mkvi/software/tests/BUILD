load("//tools/pytest:defs.bzl", "pytest_test")

pytest_test(
    name = "integration",
    srcs = [
        "conftest.py",
        "test_rtd.py",
    ],
    data = [
        "//vehicle/mkvi:mkvi.dbc",
        "//vehicle/mkvi/software/air_control:air_control_patched.bin",
    ],
    tags = [
        "hardware",
        "manual",
    ],
    deps = [
        "//projects/btldr/py_client:btldr",  # For flashing
        "//projects/hitl/lib:hitl",  # For HitL
    ],
)
