load("//tools/pytest:defs.bzl", "pytest_test")

pytest_test(
    name = "integration",
    srcs = [
        "conftest.py",
        "test_rtd.py",
    ],
    data = [
        "//vehicle/mkvi:mkvi.dbc",
    ],
    deps = [
        "//projects/btldr/py_client:btldr",  # For flashing
        "//projects/hitl/lib:hitl",  # For HitL
    ],
    tags = [
        "manual",
        "hardware",
    ],
)
