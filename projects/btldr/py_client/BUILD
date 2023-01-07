load("//tools/pytest:defs.bzl", "pytest_test")

py_binary(
    name = "updatr",
    srcs = [
        "cli.py",
    ],
    main = "cli.py",
    visibility = ["//visibility:public"],
    deps = [
        ":btldr",
    ],
)

py_library(
    name = "btldr",
    srcs = [
        "__init__.py",
        "btldr.py",
        "btldr_database.py",
    ],
    visibility = ["//visibility:public"],
)
