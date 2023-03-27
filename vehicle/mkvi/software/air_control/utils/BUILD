package(
    default_visibility = ["//visibility:public"],
)

cc_library(
    name = "utils",
    srcs = [
        "utils.c",
        "timer.c",
    ],
    hdrs = [
        "utils.h",
        "timer.h",
    ],
    deps = [
        "//libs/timer",
        "//vehicle/mkvi/software/air_control:can_api",
    ],
    target_compatible_with = select({
        "//bazel/constraints:atmega16m1": [],
        "//conditions:default": ["//bazel/constraints:incompatible_mcu"],
    }),
)
