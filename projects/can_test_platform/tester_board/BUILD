load("//bazel/tools:defs.bzl", "can_api_files")
load("//bazel:defs.bzl", "cc_firmware")

exports_files([
    "tester_board.yml",
])

can_api_files(
    name = "can_api",
    dbc = "//vehicle/mkv:mkv.dbc",
    yaml = ":tester_board.yml",
)

cc_firmware(
    name = "tester_board",
    srcs = [
        "tester_board_config.h",
        "tester_board.c",
    ],
    target_compatible_with = [
        "//bazel/constraints:atmega16m1",
    ],
    visibility = [
        "//visibility:public",
    ],
    deps = [
        ":can_api",
        "//libs/timer",
        "//libs/gpio",
        "//libs/can",
    ]
)