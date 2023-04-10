load("//bazel/tools:defs.bzl", "can_api_files")
load("//bazel:defs.bzl", "cc_firmware")

exports_files([
    "sensing.yml",
])

cc_firmware(
    name = "sensing",
    srcs = [
        "sensing.c",
        "sensing.h",
    ],
    # btldr = "//projects/btldr:brakelight_bspd_btldr",
    target_compatible_with = [
        "//bazel/constraints:atmega16m1",
    ],
    visibility = ["//visibility:public"],
    deps = [
        ":can_api",
        "//libs/gpio",
        "//libs/timer",
        # "//projects/btldr:btldr_lib",
    ],
)

can_api_files(
    name = "can_api",
    dbc = "//vehicle/mkvi:mkvi.dbc",
    yaml = ":sensing.yml",
)
