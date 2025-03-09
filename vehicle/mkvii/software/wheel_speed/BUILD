load("//bazel/tools:defs.bzl", "can_api_files")
load("//bazel:defs.bzl", "cc_firmware")

exports_files([
    "sus_strain.yml",
])

cc_firmware(
    name = "sus_strain",
    srcs = [
        "sus_strain.c",
        "sus_strain.h",
    ],
    # btldr = "//projects/btldr:sus_strain_btldr",
    target_compatible_with = [
        "//bazel/constraints:atmega16m1",
    ],
    visibility = ["//visibility:public"],
    deps = [
        ":can_api",
        "//libs/adc",
        "//libs/can",
        "//libs/spi",
        "//libs/gpio",
        "//libs/timer",
        "//projects/btldr:btldr_lib",
        "//vehicle/common/icm20948:icm20948",
    ],
)

can_api_files(
    name = "can_api",
    dbc = "//vehicle/mkvi:mkvi.dbc",
    yaml = "sus_strain.yml",
)
