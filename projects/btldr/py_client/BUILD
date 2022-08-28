load("//tools/pytest:defs.bzl", "pytest_test")

py_library(
    name = "btldr",
    srcs = [
        "btldr.py",
        "btldr_database.py",
        "__init__.py",
    ],
)

pytest_test(
    name = "test_btldr_client",
    srcs = [
        "test_btldr_client.py",
        "conftest.py",
    ],
    deps = [
        ":btldr",
    ],
    visibility = ["//visibility:public"],
)
