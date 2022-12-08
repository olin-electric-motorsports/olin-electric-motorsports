load("@rules_cc//cc:defs.bzl", "cc_library")
load("//bazel/tools:defs.bzl", "can_api_files")

cc_library(
    name = "tunables",
    srcs = [
        "main.c",
    ],
    target_compatible_with = ["//bazel/constraints:avr"],
    deps = [
        "//libs/can",
    ],
)

exports_files([ 

    "tester.yml",
    "test_recieving.yml"
])

can_api_files(

    name = "can_api",
    dbc = "//vehicle/mkv:mkv.dbc",
    yaml = ":tester.yml"


)