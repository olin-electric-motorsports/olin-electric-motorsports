load("@rules_python//python:defs.bzl", "py_binary", "py_library")

py_binary(
    name = "dbc_generator",
    srcs = [
        "main.py",
        "yaml_handler.py",
    ],
    main = "main.py",
    visibility = ["//visibility:public"],
    deps = [
        "@cantools_//:cantools_lib",
    ],
)

py_binary(
    name = "c_generator",
    srcs = [
        "c_generator.py",
        "yaml_handler.py",
    ],
    data = [
        "//projects/can_api/files/c_templates:c_file.j2",
        "//projects/can_api/files/c_templates:h_file.j2",
    ],
    main = "c_generator.py",
    visibility = ["//visibility:public"],
    deps = [
        "@cantools_//:cantools_lib",
    ],
)
