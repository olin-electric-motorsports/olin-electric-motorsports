load("//bazel:defs.bzl", "cc_firmware")
load("//bazel/tools:defs.bzl", "can_api_files")

exports_files([
    "sus_travel.yml",
])

cc_firmware(
    name = "sus_travel",
    srcs = [
        "sus_travel.c",
        "sus_travel_config.h",
        "//projects/btldr:git_sha_header",
    ],
    # btldr = "//projects/btldr:sus_travel_btldr",
    target_compatible_with = select({
        "//bazel/constraints:atmega16m1": [],
        "//conditions:default": ["//bazel/constraints:incompatible_mcu"],
    }),
    deps = [
        ":can_api",
        "//libs/gpio",
        "//libs/adc",
        "//libs/spi",
        "//libs/timer",
        "//projects/btldr:btldr_lib",
        # "//projects/can_print",
        "//vehicle/common/icm20948",
    ],
)

can_api_files(
    name = "can_api",
    dbc = "//vehicle/mkvi:mkvi.dbc",
    yaml = ":sus_travel.yml",
)
