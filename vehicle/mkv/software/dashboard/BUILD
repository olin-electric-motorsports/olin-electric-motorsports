load("//bazel:defs.bzl", "cc_firmware")
load("//bazel/tools:defs.bzl", "can_api_files")

cc_firmware(
    name = "dashboard",
    srcs = [
        "dashboard.c",
        "dashboard_config.h",
        "//projects/btldr:git_sha_header",
    ],
    btldr = "//projects/btldr:dashboard_btldr",
    target_compatible_with = [
        "//bazel/constraints:atmega16m1",
    ],
    visibility = ["//visibility:public"],
    deps = [
        ":can_api",
        "//libs/adc",
        "//libs/gpio",
        "//libs/timer",
        "//projects/btldr:btldr_lib",
    ],
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
