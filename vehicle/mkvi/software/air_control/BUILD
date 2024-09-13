load("//bazel/tools:defs.bzl", "can_api_files")
load("//bazel:defs.bzl", "cc_firmware")

package(
    default_visibility = ["//visibility:public"],
)

exports_files([
    "air.yml",
])

cc_firmware(
    name = "air_control",
    srcs = [
        "air.c",
        "air_config.h",
        "//projects/btldr:git_sha_header",
    ],
    btldr = "//projects/btldr:air_control_btldr",
    target_compatible_with = select({
        "//bazel/constraints:atmega16m1": [],
        "//conditions:default": ["//bazel/constraints:incompatible_mcu"],
    }),
    deps = [
        ":can_api",
        "//libs/gpio",
        "//libs/timer",
        "//projects/btldr:btldr_lib",
        "//vehicle/mkvi/software/air_control/utils",
    ],
)

can_api_files(
    name = "can_api",
    dbc = "//vehicle/mkvi:mkvi.dbc",
    yaml = ":air.yml",
)
