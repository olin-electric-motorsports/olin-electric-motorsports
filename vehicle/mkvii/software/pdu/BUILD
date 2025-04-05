load("//bazel:defs.bzl", "cc_firmware")
load("//bazel/tools:defs.bzl", "can_api_files")

exports_files([
    "pdu.yml",
])

cc_firmware(
    name = "pdu",
    srcs = [
        "pdu.c",
        "pdu.h",
    ],
    target_compatible_with = [
        "//bazel/constraints:atmega16m1",
    ],
    visibility = ["//visibility:public"],
    deps = [
        ":can_api",
        "//libs/gpio",
        "//libs/spi"
    ],
)

can_api_files(
    name = "can_api",
    dbc = "//vehicle/mkvii:mkvii.dbc",
    yaml = ":pdu.yml",
)