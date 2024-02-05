load("//bazel/tools:defs.bzl", "can_api_files")
load("//bazel:defs.bzl", "cc_firmware")
# load (":build.bzl", "sensing_firmware")

exports_files([
    "sensing.yml",
])

# sensing_firmware("front")
# sensing_firmware("rear")

can_api_files(
    name = "can_api",
    dbc = "//vehicle/mkvi:mkvi.dbc",
    yaml = ":sensing.yml",
)

cc_firmware(
    name="sensing",
    srcs=[
        "sensing.c",
        "sensing_config.h"
    ],
    target_compatible_with=[
        "//bazel/constraints:atmega16m1",
    ],
    visibility=["//visibility:public"],
    deps = [
        "//libs/gpio",
        "//libs/adc",
        "//libs/timer",
        "//libs/can",
        ":can_api"
    ]
)
