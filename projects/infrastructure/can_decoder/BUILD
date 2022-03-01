load("@rules_python//python:defs.bzl", "py_binary")
load("@hitl_deps//:requirements.bzl", "requirement")

py_binary(
    name = "cli",
    srcs = ["cli.py"],    
    deps = [
       requirement("cantools"),
    ],
)