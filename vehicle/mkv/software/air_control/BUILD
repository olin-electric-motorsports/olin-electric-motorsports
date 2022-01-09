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
    ],
    target_compatible_with = [
        "//bazel/constraints:atmega16m1",
    ],
    deps = [
        ":bsp",
        ":can_api",
        "//libs/gpio",
        "//libs/timer",
    ],
)

cc_library(
    name = "bsp",
    srcs = [
        "bsp/bsp.c",
        "bsp/timer.c",
    ],
    hdrs = [
        "bsp/bsp.h",
        "bsp/timer.h",
    ],
    target_compatible_with = [
        "//bazel/constraints:atmega16m1",
    ],
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
