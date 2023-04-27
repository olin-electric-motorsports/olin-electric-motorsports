load("//tools/pytest:defs.bzl", "pytest_test")

pytest_test(
    name = "integration",
    srcs = [
        "conftest.py",
        "test_shutdown.py",
        "test_rtd.py",
    ],
    deps = [
        "//projects/hitl/lib:hitl"  # For HitL
        "//projects/btldr/py_client:btldr"  # For flashing
    ],
    data = [
        "//vehicle/mkvi:mkvi.dbc",
        "//vehicle/mkvi/software/air_control:air_control_patched.bin",
        "//vehicle/mkvi/software/throttle:throttle_patched.bin",
    ],
)
