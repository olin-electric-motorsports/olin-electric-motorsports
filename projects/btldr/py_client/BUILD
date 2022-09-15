load("//tools/pytest:defs.bzl", "pytest_test")

py_binary(
    name = "updatr",
    srcs = [
        "cli.py",
    ],
    main = "cli.py",
    deps = [
        ":btldr",
    ],
    visibility = ["//visibility:public"],
)

py_library(
    name = "btldr",
    srcs = [
        "btldr.py",
        "btldr_database.py",
        "__init__.py",
    ],
    visibility = ["//visibility:public"],
)
