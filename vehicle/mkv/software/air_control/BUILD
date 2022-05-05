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
        "air_config.c",
        "air_config.h",
        "//projects/btldr:git_sha_header",
    ],
    btldr = "//projects/btldr:air_control_btldr",
    data = [
        "//projects/btldr:air_control_btldr",
    ],
    linkopts = [
        "-flto", "-Wl,--gc-sections",
    ],
    defines = [
        "BTLDR_ID=0x70",
    ],
    target_compatible_with = select({
        "//bazel/constraints:atmega16m1": [],
        "//bazel/constraints:atmega64m1": [],
        "//conditions:default": ["//bazel/constraints:incompatible_mcu"],
    }),
    deps = [
        ":can_api",
        ":utils",
        "//libs/gpio",
        "//libs/timer",
        "//projects/btldr:btldr_lib",
        "//projects/btldr/libs/image",
    ],
)

cc_library(
    name = "utils",
    srcs = [
        "utils/timer.c",
        "utils/utils.c",
    ],
    hdrs = [
        "utils/timer.h",
        "utils/utils.h",
    ],
    target_compatible_with = select({
        "//bazel/constraints:atmega16m1": [],
        "//bazel/constraints:atmega64m1": [],
        "//conditions:default": ["//bazel/constraints:incompatible_mcu"],
    }),
    visibility = ["//visibility:private"],
    deps = [
        ":can_api",
        "//libs/timer",
    ],
)

can_api_files(
    name = "can_api",
    dbc = "//vehicle/mkv:mkv.dbc",
    yaml = ":air.yml",
)
