load("//tools/pytest:defs.bzl", "pytest_test")

pytest_test(
    name = "integration",
    srcs = [
        "conftest.py",
        # "test_shutdown.py",
        "test_rtd.py",
    ],
    data = [
        "//vehicle/mkvi:mkvi.dbc",
        # "//vehicle/mkvi/software/air_control:air_control_patched.bin",
        # "//vehicle/mkvi/software/throttle:throttle_patched.bin",
        # "//vehicle/mkvi/software/bms:bms_patched.bin",
        # "//vehicle/mkvi/software/brakes:brakes_patched.bin",
    ],
    deps = [
        "//projects/btldr/py_client:btldr",  # For flashing
        "//projects/hitl/lib:hitl",  # For HitL
    ],
)
