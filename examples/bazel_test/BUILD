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
    visibility = ["//visibility:public"],
    deps = [
        ":example_library",
        "@cmocka",
    ],
)

cc_firmware(
    name = "bazel_test",
    srcs = ["main.c"],
    target_compatible_with = [
        "//bazel/constraints:atmega16m1",
    ],
    deps = [
        ":example_library",
    ],
)
