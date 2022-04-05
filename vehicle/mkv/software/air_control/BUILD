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
        ":can_api",
        ":utils",
        "//libs/gpio",
        "//libs/timer",
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
