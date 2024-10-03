load("//bazel:defs.bzl", "cc_firmware")
load("//bazel/tools:defs.bzl", "can_api_files")

exports_files([
    "imu.yml",
])

cc_binary(
    name = "imu_debug",
    srcs = [
        "imu.c",
        "imu_config.h",
        "//projects/btldr:git_sha_header",
    ],
    copts = [
        "-E",
        "-P",
    ],
    linkopts = [],
    target_compatible_with = select({
        "//bazel/constraints:atmega16m1": [],
        "//conditions:default": ["//bazel/constraints:incompatible_mcu"],
    }),
    deps = [
        ":can_api",
        "//libs/gpio",
        "//libs/spi",
        "//libs/timer",
        "//projects/btldr:btldr_lib",
        # "//projects/can_print",
    ],
)

cc_firmware(
    name = "imu",
    srcs = [
        "imu.c",
        "imu_config.h",
        "//projects/btldr:git_sha_header",
    ],
    # btldr = "//projects/btldr:imu_btldr",
    target_compatible_with = select({
        "//bazel/constraints:atmega16m1": [],
        "//conditions:default": ["//bazel/constraints:incompatible_mcu"],
    }),
    deps = [
        ":can_api",
        "//libs/gpio",
        "//libs/spi",
        "//libs/timer",
        "//projects/btldr:btldr_lib",
        # "//projects/can_print",
        "//vehicle/mkvi/software/imu/icm20948",
    ],
)

can_api_files(
    name = "can_api",
    dbc = "//vehicle/mkvi:mkvi.dbc",
    yaml = ":imu.yml",
)
