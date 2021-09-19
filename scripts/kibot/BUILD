# load("@rules_python//python:pip.bzl", "requirement")

exports_files(glob(["*.kibot.yaml"]))

py_binary(
    name = "kibot",
    srcs = [
        "kibot.py",
    ],
    visibility = ["//visibility:public"],
)
