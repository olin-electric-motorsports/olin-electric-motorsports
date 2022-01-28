load("@rules_python//python:defs.bzl", "py_binary", "py_library")

py_library(
    name = "microhitl",
    srcs = [
        "microhitl.py",
    ],
)

py_binary(
    name = "microhitl_script",
    srcs = [
        "test_read_write.py",
    ],
    main = "test_read_write.py",
    deps = [
        ":microhitl",
    ],
)
