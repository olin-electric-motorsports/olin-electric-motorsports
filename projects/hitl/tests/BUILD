load("@rules_python//python:defs.bzl", "py_binary", "py_library")

py_test(
    name = "hitl",
    srcs = [
        "__init__.py",
        "test_main.py",
        "throttle_test.py",
    ],
    imports = ["."],
    main = "test_main.py",
    deps = [
        ":conftest",
        "//projects/hitl/software/hitl:rkh",
    ],
)

py_library(
    name = "conftest",
    srcs = ["conftest.py"],
    deps = [
        "//projects/hitl/software/hitl:rkh",
    ],
)
