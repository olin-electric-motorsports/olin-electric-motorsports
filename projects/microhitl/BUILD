load("@rules_python//python:defs.bzl", "py_binary", "py_library")

py_library(
    name = "microhitl",
    srcs = [
        "__init__.py",
        "microhitl.py",
    ],
    visibility = ["//visibility:public"],
)

py_binary(
    name = "test_script",
    srcs = [
        "test_read_write.py",
    ],
    main = "test_read_write.py",
    deps = [
        ":microhitl",
    ],
)
