load("@pydeps//:requirements.bzl", "requirement")
load("//tools/pytest:defs.bzl", "pytest_test")

pytest_test(
    name = "test_btldr_client",
    srcs = [
        "conftest.py",
        "test_btldr_client.py",
        "test_btldr_hw.py",
    ],
    data = [
        "//vehicle/mkv/software/air_control:air_control_patched.bin",
    ],
    tags = ["manual"],  # No support for running in CI yet--must be invoked manually
    visibility = ["//visibility:public"],
    deps = [
        "//projects/btldr/py_client:btldr",
        requirement("cantools"),
    ],
)
