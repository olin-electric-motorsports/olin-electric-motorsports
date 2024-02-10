load("//bazel/tools:defs.bzl", "can_api_files")

py_binary(
    name = "dashboard",
    srcs = [
        "dashboard.py",
    ],
    main = "dashboard.py",
    visibility = ["//visibility:public"],
)

exports_files([
    "dashboard.yml",
])

# Defines the CAN API library
can_api_files(
    name = "can_api",
    dbc = "//vehicle/mkv:mkv.dbc",
    yaml = ":dashboard.yml",
)
