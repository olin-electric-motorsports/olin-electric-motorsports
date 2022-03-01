load("//bazel:defs.bzl", "cc_firmware")

cc_firmware(
    name = "legacy",
    srcs = [
        "main.c",
    ],
    visibility = ["//visibility:public"],
    deps = [
        "//libs/uart",
    ],
)
