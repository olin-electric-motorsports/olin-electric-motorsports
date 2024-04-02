load("@rules_cc//cc:defs.bzl", "cc_library")
load("//bazel/tools:defs.bzl", "can_api_files")
load("//bazel:defs.bzl", "cc_firmware")

exports_files(
    [
        "charger.yml",
    ],
)

can_api_files(
    name = "can_api",
    dbc = "//vehicle/mkvi:mkvi.dbc",
    yaml = ":charger.yml",
)

cc_firmware(
    name = "charging",
    srcs = [
        "charger.c",
        "charger.h",
    ],
    target_compatible_with = [
        "//bazel/constraints:atmega16m1",
    ],
    visibility = ["//visibility:public"],
    deps = [
        ":can_api",
        "//libs/can",
        "//libs/gpio",
        "//libs/timer",
        "//third_party/Click_MCP25625:MCP25625",
    ],
)
