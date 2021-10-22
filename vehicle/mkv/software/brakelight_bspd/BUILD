load("//bazel:defs.bzl", "cc_firmware")

cc_firmware(
    name = "bspd",
    srcs = ["brakelight.c"],
    target_compatible_with = [
        "//bazel/constraints:atmega16m1",
    ],
    visibility = ["//visibility:public"],
    deps = [
        "//libs/can",
    ],
)
