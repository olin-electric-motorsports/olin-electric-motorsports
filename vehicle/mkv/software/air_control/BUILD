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
        "air.c",
        "config.h",
    ],
    deps = [
        "//libs/state_machine",
        "//libs/can",
        "//libs/gpio",
        "//libs/timer",
    ],
)
