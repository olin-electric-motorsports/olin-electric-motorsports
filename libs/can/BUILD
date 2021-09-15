load("//bazel:defs.bzl", "cc_firmware")
load("@rules_cc//cc:defs.bzl", "cc_library")

cc_library(
    name = "hdrs",
    hdrs = [
        "api.h",
    ],
    visibility = ["//visibility:private"],
)

cc_library(
    name = "can",
    srcs = [
        "can.c",
    ],
    hdrs = [
        "mob.h",
    ],
    target_compatible_with = [
        "//bazel/constraints:atmega16m1",
    ],
    visibility = ["//visibility:public"],
    deps = [
        ":hdrs",
    ],
)

cc_test(
    name = "utest",
    srcs = ["test/utest.c"],
    visibility = ["//visibility:public"],
    deps = [
        ":mock",
    ],
)

cc_library(
    name = "mock",
    srcs = [
        "mock/can.c",
    ],
    hdrs = [
        "mock/mock.h",
    ],
    target_compatible_with = [
        "@platforms//os:linux",
    ],
    visibility = ["//visibility:public"],
    deps = [
        ":hdrs",
        "@cmocka",
    ],
)

cc_library(
    name = "can_legacy",
    srcs = [
        "legacy/can_api.c",
    ],
    hdrs = [
        "legacy/can_api.h",
    ],
    deprecation = "Please transition to the new library: //libs/can",
    target_compatible_with = [
        "//bazel/constraints:atmega16m1",
    ],
    visibility = ["//visibility:public"],
)

cc_firmware(
    name = "app_test",
    srcs = ["test/test_app.c"],
    deps = [
        "//libs/can",
    ],
    target_compatible_with = [
        "//bazel/constraints:atmega16m1",
    ],
    visibility = ["//visibility:public"],
)
