cc_library(
    name = "can",
    srcs = [
        "can.c",
    ],
    hdrs = [
        "api.h",
        "mob.h",
    ],
    target_compatible_with = [
        "//bazel/constraints:atmega16m1",
    ],
    visibility = ["//visibility:public"],
)

cc_library(
    name = "can_legacy",
    srcs = [
        "legacy/can_api.c",
    ],
    hdrs = [
        "legacy/can_api.h",
    ],
    visibility = ["//visibility:public"],
    deprecation = "Please transition to the new library: //libs/can",
)
