load("//bazel:defs.bzl", "cc_firmware")
load("//bazel/tools:defs.bzl", "can_api_files")

"""
Runs on service section controller primary micro U1003, ATmega64m1
"""
cc_firmware(
    name = "bms",
    srcs = [
        "bms.c",
        "bms_config.h",

        # TODO: Move these to a diff folder
        "bsp.c",
        "bsp.h",
        "mux.c",
        "mux.h",
    ],
    deps = [
        ":can_api",
        "//libs/gpio",
        "//libs/spi",
        "//libs/timer",
        "//vehicle/mkv/software/bms/ltc6811",
    ],
    # TODO Add ATmega64m1 constraint
    target_compatible_with = ["//bazel/constraints:atmega16m1"],
)

package(
    default_visibility = ["//visibility:public"],
)

exports_files([
    "bms.yml",
])

# Defines the CAN API library
can_api_files(
    name = "can_api",
    dbc = "//vehicle/mkv:mkv.dbc",
    yaml = ":bms.yml",
)
