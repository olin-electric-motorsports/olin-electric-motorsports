load("//bazel:defs.bzl", "cc_firmware")

package(
    default_visibility = ["//visibility:public"],
)

cc_library(
    name = "example_library",
    srcs = [
        "library.c",
    ],
    hdrs = [
        "library.h",
    ],
    visibility = ["//visibility:public"],
)

cc_test(
    name = "utest",
    srcs = [
        "test_main.c",
    ],
    deps = [
        ":example_library",
        "@cmocka",
    ],
    visibility = ["//visibility:public"],
)

cc_firmware(
    name = "bazel_test",
    srcs = ["main.c"],
    target_compatible_with = [
        "//bazel/constraints:atmega16m1",
    ],
)
