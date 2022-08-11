load("//tools/pytest:defs.bzl", "pytest_test")

py_library(
    name = "btldr",
    srcs = [
        "btldr.py",
        "__init__.py",
    ],
)

pytest_test(
    name = "test_btldr_client",
    srcs = [
        "test_btldr_client.py",
        "conftest.py",
    ],
    data = ["//projects/btldr/tools:updatr_dbc"],
    deps = [
        ":btldr",
    ],
)
