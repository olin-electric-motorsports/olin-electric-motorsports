load("//bazel:defs.bzl", "cc_firmware")

package(
    default_visibility = ["//visibility:public"],
)

cc_firmware(
    name = "bazel_test",
    srcs = ["main.c"],
    target_compatible_with = [
        "//bazel/constraints:atmega16m1",
    ],
)
