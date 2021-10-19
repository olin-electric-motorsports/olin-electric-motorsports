load("//bazel:defs.bzl", "cc_firmware")

package(
    default_visibility = ["//visibility:public"],
)

exports_files([
    "air.yml",
])

cc_firmware(
    name = "airs",
    srcs = [
        "air_new.c",
        "config.h",
    ],
    deps = [
        "//libs/can",
        "//libs/state_machine",
    ],
)
