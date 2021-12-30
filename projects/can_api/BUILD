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

py_binary(
    name = "c_generator",
    main = "c_generator.py",
    srcs = [
        "c_generator.py",
        "yaml_handler.py",
    ],
    data = [
        "//projects/can_api/files/c_templates:c_file.j2",
        "//projects/can_api/files/c_templates:h_file.j2",
    ],
    deps = [
        "@cantools_//:cantools_lib",
    ],
    visibility = ["//visibility:public"],
)
