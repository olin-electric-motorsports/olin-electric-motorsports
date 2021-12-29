load("@rules_python//python:defs.bzl", "py_binary", "py_library")

py_binary(
    name = "dbc_generator",
    main = "main.py",
    srcs = [
        "main.py",
        "yaml_handler.py",
    ],
    deps = [
        "@cantools_//:cantools_lib",
    ],
    visibility = ["//visibility:public"],
)
