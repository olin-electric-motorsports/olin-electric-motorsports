package(
    default_visibility = ["//visibility:public"],
)

cc_library(
    name = "utils",
    srcs = [
        "timer.c",
        "utils.c",
    ],
    hdrs = [
        "timer.h",
        "utils.h",
    ],
    target_compatible_with = select({
        "//bazel/constraints:atmega16m1": [],
        "//conditions:default": ["//bazel/constraints:incompatible_mcu"],
    }),
    deps = [
        "//libs/timer",
        "//vehicle/mkvi/software/air_control:can_api",
    ],
)
