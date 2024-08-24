cc_library(
    name = "can_print",
    srcs = [
        "can_print.c",
    ],
    target_compatible_with = select({
        "//bazel/constraints:atmega16m1": [],
        "//conditions:default": ["//bazel/constraints:incompatible_mcu"],
    }),
    hdrs = ["can_print.h"],
    visibility = ["//visibility:public"],
)
