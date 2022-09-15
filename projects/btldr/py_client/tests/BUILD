load("//tools/pytest:defs.bzl", "pytest_test")

pytest_test(
    name = "test_btldr_client",
    srcs = [
        "test_btldr_client.py",
        "test_btldr_hw.py",
        "conftest.py",
    ],
    data = [
        "bms_patched.bin",
    ],
    deps = [
        "//projects/btldr/py_client:btldr",
    ],
    visibility = ["//visibility:public"],
)
