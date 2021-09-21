load("//bazel:defs.bzl", "cc_firmware")

cc_firmware(
    name = "shell",
    srcs = [
        "main.c",
    ],
    deps = [
        "//libs/uart",
    ],
    visibility = ["//visibility:public"],
)
